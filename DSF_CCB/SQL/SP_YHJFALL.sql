CREATE PROCEDURE [dbo].[SP_YHJFALL]
@yhh	varchar(10),
@jfsj	datetime,
@jfje	numeric(10,2),
@sfrbh	varchar(10),
@bz     varchar(100),
@fphm   varchar(100),
@jffs   varchar(2),
@result 		int = 0 output,			--存储过程的返回值，判断存储过程的执行情况，返回值为1表示成功执行
@lsbh   varchar(13) output
WITH ENCRYPTION
AS

declare @curdate varchar(8)
declare @jf_sj   varchar(10)
declare @jfyf varchar(6)
declare @c_yjje	numeric(10,2)
declare @c_jjje	numeric(10,2)
declare @c_qfje	numeric(10,2)
declare @c_ljqf	numeric(10,2)
declare @c_ljznj numeric(10,2)
declare @c_znj	numeric(10,2)
declare @c_byyb	numeric(10,2)
declare @c_ljyb	numeric(10,2)
declare @sfrxm	varchar(20)

set @result = 6000
set @lsbh=''
set @curdate=convert(varchar(8),Year(@jfsj)*10000+Month(@jfsj)*100+Day(@jfsj))
set @jf_sj=convert(varchar(10),@jfsj)
set @jfyf=convert(varchar(6),GETDATE(),112)

  if not exists(select * from DM_SFFS where DM = @jffs)
  begin
    set @result=6001
    return
  end
--如果在用气信息表中不存在对应的用户号的记录，则返回错误
  if not exists(select * from Q_YQXX where YHH=@yhh and YF=@jfyf)
  begin
    set @result = 6005
    return
  end
  select @c_yjje=JFJE,@c_jjje=YJJE,@c_qfje=BQQF,@c_ljqf=LJQF,@c_ljznj=LJZNJ,@c_znj=BQZNJ,@c_byyb=BYYB,@c_ljyb=LJYB from Q_YQXX where YHH = @yhh and YF=@jfyf
  if not exists(select * from X_YGXX where BH = @sfrbh)
  begin
    set @result=6004
    return
  end
  select @sfrxm=XM from X_YGXX where BH = @sfrbh
  exec dbo.GetJFBH @curdate,@lsbh out
  if @lsbh=''
  begin
    set @result=6003
    return
  end
  begin tran
  update Q_YQXX set SCJY=SCJY+@jfje,BCJY=BCJY+@jfje,JFZJ=JFZJ+@jfje,JFFS=@jffs where YHH=@yhh and YF=@jfyf
  exec SP_JSFY @yhh,@jffs,@jfyf,@jf_sj
  if @@error<>0 
  begin
    rollback tran
    set @result=6006
    return
  end
  insert into Q_JFXX(BH,JFYF,YHH,JFJE,JFRQ,JFFS,SFRBH,SFRXM,YJJE,JJJE,QFJE,LJQF,LJZNJ,BCZNJ,BYYB,LJYB,CJR,BZ,FPHM)
  values(@lsbh,@jfyf,@yhh,@jfje,@jfsj,@jffs,@sfrbh,@sfrxm,@c_yjje,@c_jjje,@c_qfje,@c_ljqf,@c_ljznj,@c_znj,@c_byyb,@c_ljyb,@sfrbh,@bz,@fphm)
  if @@error<>0 
  begin
    rollback tran
    set @result=6007
    return
  end
  commit tran
  set @result=1
GO