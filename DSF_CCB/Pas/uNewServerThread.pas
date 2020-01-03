unit uNewServerThread;

interface


uses SysUtils, Windows, Messages, Classes, ScktComp, ADODB, DB, IniFiles, Forms,ComCtrls, Variants;

type
  TNewServerThread = Class(TServerClientThread)
  private
    Fsjstr,typestr,uyhh,jfsj,jfje,jfbh,posid:string;
  protected
    procedure ClientExecute; override;
  public
    constructor Create(CreateSuspended: Boolean;ASocket: TServerClientWinSocket);//; ADOHMIS:TADOConnection);
    procedure ProcessData;
    function B_Blank(datastr:string;blanklen:integer):string;
  end;
implementation
uses Udata, comm, uFrmSocketServer;

constructor TNewServerThread.Create(CreateSuspended: Boolean;
  ASocket: TServerClientWinSocket);//; ADOHMIS:TADOConnection);
begin
  //FADOHPDA:=ADOHPDA;
  //FADOHMIS:=ADOHMIS;
  inherited Create(CreateSuspended, ASocket);
  FreeOnTerminate:=True;
end;

function TNewServerThread.B_Blank(datastr:string;blanklen:integer):string;
var
  i:integer;
  str:string;
begin
  str:=datastr;
  while length(str)<blanklen do
    str:=str+' ';
  if length(str)>blanklen then
    str:=copy(str,1,blanklen);
  result:=str;
end;

procedure TNewServerThread.ProcessData;
var
  totalnum,ipos:integer;
  preyf,rtncode,yhxm,yhdz,fdata,lsbh:string;
  nf,yf,rf:Word;
  str1,str2,str3,str4,str5,str6,str7:string;
  je:real;
  logfilepath,connlogfile:string;
begin                
  logfilepath:=currpath+'RcvLogFile\'+FormatDateTime('yyyymmdd',date);
  connlogfile:=logfilepath+'\LogConnInfo.txt';
  rtncode:='6099';
  if typestr = '6010' then
  begin
    try
      DM.ADOSPyhcx.Close;
      DM.ADOSPyhcx.Parameters[1].Value:=uyhh;
      DM.ADOSPyhcx.ExecProc;
      rtncode:=DM.ADOSPyhcx.Parameters[2].Value;
      yhxm:=DM.ADOSPyhcx.Parameters[4].Value;
      yhdz:=DM.ADOSPyhcx.Parameters[5].Value;
      fdata:=DM.ADOSPyhcx.Parameters[6].Value;
    except
      on e : Exception do
      begin
        LogMsg(connlogfile,'执行查询存储过程发生异常'+e.Message);
        rtncode:='6099';
      end;
    end;
    if rtncode='0000' then
    begin
      Fsjstr:=B_Blank('448',12);
      Fsjstr:=Fsjstr+'6010';
      Fsjstr:=Fsjstr+rtncode;
      Fsjstr:=Fsjstr+B_Blank(uyhh,10);
      Fsjstr:=Fsjstr+B_Blank(yhxm,80);
      Fsjstr:=Fsjstr+B_Blank(yhdz,100);
      Fsjstr:=Fsjstr+fdata;
    end
    else
    begin
      Fsjstr:=B_Blank('448',12);
      Fsjstr:=Fsjstr+'6010';
      Fsjstr:=Fsjstr+rtncode;
      Fsjstr:=Fsjstr+B_Blank(uyhh,10);
      Fsjstr:=Fsjstr+B_Blank(' ',80);
      Fsjstr:=Fsjstr+B_Blank(' ',100);
      Fsjstr:=Fsjstr+B_Blank(' ',6);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',2);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
      Fsjstr:=Fsjstr+B_Blank('0',10);
    end;
  end
  else if typestr='6020' then
  begin
    try
      DM.ADOSPyhjf.Close;
      DM.ADOSPyhjf.Parameters[1].Value:=uyhh;
      DM.ADOSPyhjf.Parameters[2].Value:=jfsj;
      DM.ADOSPyhjf.Parameters[3].Value:=jfje;
      DM.ADOSPyhjf.Parameters[4].Value:=DSKHDM;
      DM.ADOSPyhjf.Parameters[5].Value:=posid;   
      DM.ADOSPyhjf.Parameters[6].Value:=dsf_jffs;//收费方式，建行代收
      DM.ADOSPyhjf.ExecProc;
      rtncode:=DM.ADOSPyhjf.Parameters[7].Value;
      lsbh:=DM.ADOSPyhjf.Parameters[8].Value;
    except           
      on e : Exception do
      begin
        LogMsg(connlogfile,'执行缴费存储过程发生异常'+e.Message);
        rtncode:='6099';
      end;
    end;
    if rtncode='0000' then
    begin
      Fsjstr:=B_Blank('34',12);
      Fsjstr:=Fsjstr+'6020';
      Fsjstr:=Fsjstr+rtncode;
      Fsjstr:=Fsjstr+B_Blank(lsbh,14);
    end
    else
    begin
      Fsjstr:=B_Blank('34',12);
      Fsjstr:=Fsjstr+'6020';
      Fsjstr:=Fsjstr+rtncode;
      Fsjstr:=Fsjstr+B_Blank(' ',14);
    end;
  end
  else if typestr='6030' then
  begin
    {
    try
      DM.ADOSPyhtk.Close;
      DM.ADOSPyhtk.Parameters[1].Value:=uyhh;
      DM.ADOSPyhtk.Parameters[2].Value:=jfbh;
      DM.ADOSPyhtk.Parameters[3].Value:=jfje;
      DM.ADOSPyhtk.Parameters[4].Value:=jfsj;
      DM.ADOSPyhtk.Parameters[5].Value:=posid;
      DM.ADOSPyhtk.Parameters[6].Value:=DSKHDM;
      DM.ADOSPyhtk.ExecProc;
      rtncode:=DM.ADOSPyhtk.Parameters[7].Value;
      lsbh:=DM.ADOSPyhtk.Parameters[8].Value;
    except
      on e : Exception do
      begin
        LogMsg(connlogfile,'执行退款存储过程发生异常'+e.Message);
        rtncode:='6099';
      end;
    end;       }
    //建设银行不支持退款，直接返回交易码6013
    rtncode:='6013';
    if rtncode='0000' then
    begin
      Fsjstr:=B_Blank('34',12);
      Fsjstr:=Fsjstr+'6030';
      Fsjstr:=Fsjstr+rtncode;
      Fsjstr:=Fsjstr+B_Blank(lsbh,14);
    end
    else
    begin
      Fsjstr:=B_Blank('34',12);
      Fsjstr:=Fsjstr+'6030';
      Fsjstr:=Fsjstr+rtncode;
      Fsjstr:=Fsjstr+B_Blank(' ',14);
    end;
  end
  else if typestr='6060' then
  begin  
    if FileExists(ftpdir+trim(jfbh)) then
    begin
      frmSocketServer.DZFileName:=trim(jfbh);
      Fsjstr:=B_Blank('20',12);
      Fsjstr:=Fsjstr+'6060';
      Fsjstr:=Fsjstr+'0000';
      frmSocketServer.Timer1.Enabled := True;
    end
    else
    begin                   
      Fsjstr:=B_Blank('20',12);
      Fsjstr:=Fsjstr+'6060';
      Fsjstr:=Fsjstr+'6001';
    end;
  end;
end;

procedure TNewServerThread.ClientExecute;
var                                 
  //Fsjstr,typestr,uyhh,jfsj,jfje,jfbh,posid:string;
  RequestStream: TWinSocketStream;
  macstr,bzstr,datastr,str:string;
  j,i,jyh:integer;
  Request_buf: array[0..MAXLENGTH] of char;
  Request_buf_bytes: integer;
  RecieveStr: string;
  BufStr,data_str,datastr1,logfilepath,logfile,connlogfile:string;
  connip:string;
  iStart,iEnd,iLen,i_Len,iHigh,iWol,posi:integer;
  yy,mm,dd:word;
begin
  connip:=ClientSocket.RemoteAddress;      
  logfilepath:=currpath+'RcvLogFile\'+FormatDateTime('yyyymmdd',date);
  connlogfile:=logfilepath+'\LogConnInfo.txt';
  LogMSG(connlogfile,connip+'连接。');
  BufStr:='';
  RequestStream := TWinSocketStream.Create(ClientSocket, 60000);
  try
    while (not Terminated) and (ClientSocket.Connected) do
    begin
      try
        FillChar(Request_buf, SizeOf(Request_buf), 0);
        if RequestStream.WaitForData(60000) then
        begin
          try
            Request_buf_bytes := RequestStream.Read(Request_buf,MAXLENGTH);
          except
            On E: Exception do
            begin
              LogMsg(connlogfile,'Socket接收Read发生异常'+e.Message);
              Request_buf_bytes :=0;
              ClientSocket.Close;
              Terminate;
            end;
          end;
          if Request_buf_bytes = 0 then
          begin
            ClientSocket.Close;
            Terminate;
          end
          else
          begin
            try
              SetLength(RecieveStr,Request_buf_bytes);
              move(Request_buf,RecieveStr[1],Request_buf_bytes);
              iLen:=0;
              bzstr:=trim(copy(RecieveStr,1,12));
              typestr:=trim(copy(RecieveStr,13,4));
              posid:=trim(copy(RecieveStr,17,10));
              uyhh:=trim(copy(RecieveStr,27,10));       
              logfile:=logfilepath+'\Log'+posid+'.txt';
              LogMsg(logfile,'接收代收费系统数据：'+RecieveStr);
              try
                iLen:=strtoint(bzstr);
              except
                LogMsg(logfile,'接收的包长度值'+bzstr+'转换为数值异常');
              end;
              jfsj:='';
              jfje:='';
              jfbh:='';
              if typestr='6020' then
              begin
                jfsj:=trim(copy(RecieveStr,37,14));
                jfje:=trim(copy(RecieveStr,51,12));
              end;
              if typestr='6030' then
              begin
                jfbh:=trim(copy(RecieveStr,37,20));
                jfje:=trim(copy(RecieveStr,57,12));
                jfsj:=trim(copy(RecieveStr,69,14));
              end;
              if typestr='6060' then
              begin
                jfbh:=trim(copy(RecieveStr,37,30)); 
                logmsg(logfile,' 处理对账文件：'+jfbh);
              end;
              data_str:='';
              decodeDate(Now,yy,mm,dd);
              if (uyhh<>'') and (iLen=length(RecieveStr)) and (yy*100+mm <= 202006) then
              begin
                Synchronize(ProcessData);
                //ProcessData(typestr,uyhh,jfsj,jfje,jfbh,posid,fsjstr);
                data_str:=Fsjstr;
              end
              else
              begin
                LogMsg(logfile,'接收的包用户号'+uyhh+'为空或者接收的包长度内容'+inttostr(iLen)+'不等于接收字节长度'+inttostr(length(RecieveStr)));
                if typestr='6010' then
                begin
                  data_str:=data_str+B_Blank('448',12);
                  data_str:=data_str+'6010';
                  data_str:=data_str+'6009';
                  data_str:=data_str+B_Blank(uyhh,10);
                  data_str:=data_str+B_Blank(' ',80);
                  data_str:=data_str+B_Blank(' ',100);
                  data_str:=data_str+B_Blank(' ',6);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',2);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                  data_str:=data_str+B_Blank('0',10);
                end;
                if typestr='6020' then
                begin
                  data_str:=data_str+B_Blank('34',12);
                  data_str:=data_str+'6020';
                  data_str:=data_str+'6009';
                  data_str:=data_str+B_Blank(' ',14);
                end;
                if typestr='6030' then
                begin
                  data_str:=data_str+B_Blank('34',12);
                  data_str:=data_str+'6030';
                  data_str:=data_str+'6009';
                  data_str:=data_str+B_Blank(' ',14);
                end;   
                if typestr='6060' then
                begin
                  data_str:=data_str+B_Blank('20',12);
                  data_str:=data_str+'6060';
                  data_str:=data_str+'6009';
                end;
              end;
              ClientSocket.SendText(data_str);
              logmsg(logfile,' 向代收费系统终端发送数据：'+data_str);
            except
              on Err:Exception do
              begin
                LogMsg(connlogfile,'处理接收的数据发生异常'+Err.Message);
              end;
            end;
          end;
        end
        else
        begin
          //ClientSocket.Close;
          //RequestStream.Free;
          //Terminate;
        end;
      except
        on Err : Exception do
        begin
          LogMsg(connlogfile,'数据处理发生异常'+Err.Message);
          HandleException;
          ClientSocket.Close;
          Terminate;
        end;
      end;
    end;
  finally
    RequestStream.Free;
  end;
  ClientSocket.Close;
end;

end.
