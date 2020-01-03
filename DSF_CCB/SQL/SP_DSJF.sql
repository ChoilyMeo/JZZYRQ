USE [ZY_YYGL_DB]
GO

DROP PROCEDURE [dbo].[SP_DSJF]
GO

USE [ZY_YYGL_DB]
GO

CREATE PROCEDURE [dbo].[SP_DSJF] 
@yhh	varchar(10),
@jfsj	varchar(14),
@jfje	numeric(10,2),
@sfrbh	varchar(10),
@bz     varchar(100),
@jffs   varchar(2),
@result varchar(4) output,			--存储过程的返回值，判断存储过程的执行情况，返回值为1表示成功执行
@lsbh   varchar(14) output
WITH ENCRYPTION
AS
declare @czsj datetime
declare @rtn int
declare @yjje numeric(18,2)
declare @cbzt varchar(2)
set @result = '9999'
set @lsbh=''

if not exists(select * from Q_YQXX where YHH=@yhh and YF=LEFT(@jfsj,6))
begin
  set @result = '6003'
  return
end
select @yjje=JFJE,@cbzt=CBZT from Q_YQXX where YHH=@yhh and YF=LEFT(@jfsj,6)
--建设银行不支持单纯预存，如果不欠费，则返回已缴费
if @yjje=0
begin
  set @result = '6004'
  return
end
--未抄表，不允许收费
if @cbzt <> '02'
begin
  set @result = '6003'
  return
end
if @jfje < @yjje
begin
  set @result = '6005'
  return
end

set @czsj=convert(datetime,substring(@jfsj,1,4)+'-'+substring(@jfsj,5,2)+'-'+substring(@jfsj,7,2)+' '+substring(@jfsj,9,2)+':'+substring(@jfsj,11,2)+':'+substring(@jfsj,13,2))
exec dbo.SP_YHJFALL @yhh,@czsj,@jfje,@sfrbh,@bz,'',@jffs,@rtn output,@lsbh output

if @rtn=1 and @lsbh<>''
begin
  set @result='0000'
  set @lsbh='F'+@lsbh
end
else
begin
  set @result = convert(varchar(4),@rtn)
end


GO


