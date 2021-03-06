USE [ZY_YYGL_DB]
GO

drop procedure [dbo].[SP_YHDSCX]
GO

CREATE PROCEDURE [dbo].[SP_YHDSCX] 
@yhh	varchar(10),
@result varchar(4) output,		--存储过程的返回值，判断存储过程的执行情况，返回值为0表示成功执行
@uyhh   varchar(10) output,		--流水号
@uyhm   varchar(80) output,		--流水号
@uyhdz   varchar(100) output,	--流水号
@ujfsj   varchar(300) output	--流水号
WITH ENCRYPTION
AS
print 'v1.0.0.160818'
declare @nf int
declare @yf int
declare @rf int
declare @curyf varchar(6)
declare @curdate varchar(8)
declare @yhlb varchar(2)
declare @jfzt varchar(2)
declare @cbb varchar(10)
declare @cbbmc   varchar(100)
declare @sqzs  numeric(18,0)
declare @bqzs  numeric(18,0)
declare @bcxs  numeric(18,2)
declare @bqql  numeric(18,0)
declare @dj  numeric(18,2)
declare @bqqf  numeric(18,2)
declare @bqsc  numeric(18,0)
declare @bqbc  numeric(18,0)
declare @scjy  numeric(18,2)
declare @bcjy  numeric(18,2)
declare @yjqf  numeric(18,2)
declare @bqznj  numeric(18,2)
declare @ljqf  numeric(18,2)
declare @ljznj  numeric(18,2)
declare @yjje  numeric(18,2)
declare @jtcc numeric(2,0)
declare @qj1 numeric(18,2)
declare @ql1 numeric(18,0)
declare @qf1 numeric(18,2)
declare @qj2 numeric(18,2)
declare @ql2 numeric(18,0)
declare @qf2 numeric(18,2)
declare @qj3 numeric(18,2)
declare @ql3 numeric(18,0)
declare @qf3 numeric(18,2)
declare @cbzt varchar(2)

set @result = ''
set @uyhh=@yhh
set @uyhm=''
set @uyhdz=''
set @cbbmc=''
set @ujfsj=''
set @cbzt='01'
set @ljqf=0

set @nf=year(GETDATE())
set @yf=month(GETDATE())
set @rf=day(GETDATE())

set @curyf=convert(varchar(6),@nf*100+@yf)
set @curdate=convert(varchar(8),@nf*10000+@yf*100+@rf)

--如果在用气信息表中不存在对应的用户号的记录，则返回错误
  if not exists(select * from U_YHXX where YHZT='01' and (YHLB='01') and YHH=@yhh)
  begin
    set @result = '6001'
    return
  end
  if not exists(select * from Q_YQXX where YHH=@yhh and YF=@curyf)
  begin
    set @result = '6003'
    return
  end
  select @uyhm=ISNULL(YHM,''),@uyhdz=ISNULL(XXDZ,''),@yhlb=ISNULL(YHLB,''),@cbb=ISNULL(CBBBH,'') from U_YHXX where YHH=@yhh

  select @jfzt=JFZT,@cbzt=CBZT,@ljqf=LJQF,@sqzs=SQZS,@bqzs=BQZS,@bcxs=ZNJFL,@bqql=BQQL,@dj=DJ,@bqqf=BQQF,@bqsc=QLSCJY,@bqbc=QLBCJY,@scjy=SCJY,@bcjy=BCJY,@yjqf=YJJE,@bqznj=BQZNJ,@ljznj=LJZNJ,@yjje=JFJE,@jtcc=JTCC,@qj1=QJ1,@ql1=QL1,@qf1=QF1,@qj2=QJ2,@ql2=QL2,@qf2=QF2,@qj3=QJ3,@ql3=QL3,@qf3=QF3 from Q_YQXX where YHH=@yhh and YF=@curyf
  if (@jfzt='01' or @ljqf>0) and @cbzt='02'
  begin
    set @ujfsj=@ujfsj+@curyf
    set @ujfsj=@ujfsj+convert(char(10),@sqzs)
    set @ujfsj=@ujfsj+convert(char(10),@bqzs)
    set @ujfsj=@ujfsj+convert(char(10),@bcxs)
    set @ujfsj=@ujfsj+convert(char(10),@bqql)
    set @ujfsj=@ujfsj+convert(char(10),@dj)
    set @ujfsj=@ujfsj+convert(char(10),@bqqf)
    set @ujfsj=@ujfsj+convert(char(10),@bqsc)
    set @ujfsj=@ujfsj+convert(char(10),@bqbc)
    set @ujfsj=@ujfsj+convert(char(10),@scjy)
    set @ujfsj=@ujfsj+convert(char(10),@yjqf)
    set @ujfsj=@ujfsj+convert(char(10),@bqznj)
    set @ujfsj=@ujfsj+convert(char(10),@ljqf)
    set @ujfsj=@ujfsj+convert(char(10),@ljznj)
    set @ujfsj=@ujfsj+convert(char(10),@yjje)
    set @ujfsj=@ujfsj+convert(char(2),ISNULL(@jtcc,0))
    set @ujfsj=@ujfsj+convert(char(10),ISNULL(@qj1,0))
    set @ujfsj=@ujfsj+convert(char(10),ISNULL(@ql1,0))
    set @ujfsj=@ujfsj+convert(char(10),ISNULL(@qf1,0))
    set @ujfsj=@ujfsj+convert(char(10),ISNULL(@qj2,0))
    set @ujfsj=@ujfsj+convert(char(10),ISNULL(@ql2,0))
    set @ujfsj=@ujfsj+convert(char(10),ISNULL(@qf2,0))
    set @ujfsj=@ujfsj+convert(char(10),ISNULL(@qj3,0))
    set @ujfsj=@ujfsj+convert(char(10),ISNULL(@ql3,0))
    set @ujfsj=@ujfsj+convert(char(10),ISNULL(@qf3,0))
  end
  else
  begin
    select @scjy=SCJY,@bcjy=BCJY from Q_YQXX where YHH=@yhh and YF=@curyf
    set @ujfsj=@ujfsj+@curyf
    set @ujfsj=@ujfsj+convert(char(10),@sqzs)
    set @ujfsj=@ujfsj+convert(char(10),@bqzs)
    set @ujfsj=@ujfsj+convert(char(10),@bcxs)
    set @ujfsj=@ujfsj+convert(char(10),@bqql)
    set @ujfsj=@ujfsj+convert(char(10),@dj)
    set @ujfsj=@ujfsj+convert(char(10),@bqqf)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),@scjy)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(2),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
    set @ujfsj=@ujfsj+convert(char(10),0)
  end
  set @result='0000'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

