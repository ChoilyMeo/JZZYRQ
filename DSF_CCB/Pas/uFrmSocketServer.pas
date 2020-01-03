unit uFrmSocketServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ComCtrls, ExtCtrls, StrUtils, Menus,
  CoolTrayIcon;

type
  TfrmSocketServer = class(TForm)
    SSocket: TServerSocket;
    Timer1: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    CoolTrayIcon1: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Timer2: TTimer;
    N4: TMenuItem;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    procedure SSocketClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure SSocketGetThread(Sender: TObject;
      ClientSocket: TServerClientWinSocket;
      var SocketThread: TServerClientThread);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure CoolTrayIcon1DblClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    count:integer;
    procedure ADDRZ(rq,bh,nr,lb:string;zsl:integer;zje:Real);
    procedure JFDZ(rq,slogfile:string);//����
  public
    { Public declarations }
    DZFileName:string;
  end;

var
  frmSocketServer: TfrmSocketServer;

implementation
uses uNewServerThread, Udata, U_xtsz, comm;
{$R *.dfm}

procedure TfrmSocketServer.ADDRZ(rq,bh,nr,lb:string;zsl:integer;zje:Real);
begin
  try
    DM.ADOQuery3.Close;
    DM.ADOQuery3.SQL.Clear;
    DM.ADOQuery3.SQL.Text:='insert into TEMP_DZRZ(jfrq,lsh,bzxx,jflb,sl,je,dzfl) values(:a1,:a2,:a3,:a4,:a5,:a6,:a7)';
    DM.ADOQuery3.Parameters[0].Value:=rq;
    DM.ADOQuery3.Parameters[1].Value:=bh;
    DM.ADOQuery3.Parameters[2].Value:=nr;
    DM.ADOQuery3.Parameters[3].Value:=lb;
    DM.ADOQuery3.Parameters[4].Value:=zsl;
    DM.ADOQuery3.Parameters[5].Value:=zje;
    DM.ADOQuery3.Parameters[6].Value:=DSKHDM;
    DM.ADOQuery3.ExecSQL;
  except
  end;
end;

procedure TfrmSocketServer.JFDZ(rq,slogfile:string);//����
var
  jflsh,uyhh,jfje,rtncode,lsbh:string;
begin
  try
    //�жϽɷѽ���Ƿ�һ��
    //�ɷ�
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Clear;
    DM.ADOQuery1.SQL.Text:='select a.BH,b.yhh as JFHH,b.je as SSJE from Q_JFXX a inner join TEMP_JFT b on a.BH=right(b.LSH,13) and left(b.LSH,1)=''F'' and a.JFRQ = '''+rq+''' and a.JFJE <> b.JE and a.SFRBH=b.FL and b.FL='''+DSKHDM+'''';
    DM.ADOQuery1.Open;
    while not DM.ADOQuery1.Eof do
    begin
      jflsh:=DM.ADOQuery1.FieldByName('BH').AsString;
      ADDRZ(rq,jflsh,'�ñʽ��׼�¼�������շ�ϵͳ�в�һ�¡�����:'+DM.ADOQuery1.FieldByName('JFHH').AsString+'���:'+DM.ADOQuery1.FieldByName('SSJE').AsString,'�ɷѽ���',0,0.00);
      DM.ADOQuery1.Next;
    end;
    //�ж�ϵͳ���У��ɷ��ն�û��
    //�ɷ�
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Clear;
    DM.ADOQuery1.SQL.Text:='select a.BH,a.YHH,a.JFJE,a.CJRQ,a.SFRXM from Q_JFXX a where a.ZTBZ=1 and a.SFRBH='''+DSKHDM+''' and a.JFRQ = '''+rq+''' and a.BH not in (select right(LSH,13) from TEMP_JFT where left(LSH,1)=''F'' and FL='''+DSKHDM+''')';
    DM.ADOQuery1.Open;
    while not DM.ADOQuery1.Eof do
    begin
      jflsh:=DM.ADOQuery1.FieldByName('BH').AsString;
      if auto_repair='1' then
      begin
        jfje:=DM.ADOQuery1.FieldByName('JFJE').AsString;
        uyhh:=DM.ADOQuery1.FieldByName('YHH').AsString;
        try
          DM.ADOSPyhtk.Close;
          DM.ADOSPyhtk.Parameters[1].Value:=uyhh;
          DM.ADOSPyhtk.Parameters[2].Value:=formatdatetime('yyyy-mm-dd',DM.ADOQuery1.FieldByName('CJRQ').AsDateTime);
          DM.ADOSPyhtk.Parameters[3].Value:=jfje;
          DM.ADOSPyhtk.Parameters[4].Value:='04';
          DM.ADOSPyhtk.Parameters[5].Value:=dskhdm;
          DM.ADOSPyhtk.Parameters[6].Value:=DM.ADOQuery1.FieldByName('SFRXM').AsString;
          DM.ADOSPyhtk.Parameters[7].Value:='�ɷ���ˮ��'+DM.ADOQuery1.FieldByName('BH').AsString+'�����Զ�����';
          DM.ADOSPyhtk.ExecProc;
          rtncode:=DM.ADOSPyhtk.Parameters[8].Value;
        except
          rtncode:='6099';
        end;
        if rtncode='1' then
        begin
          ADDRZ(rq,jflsh,'Ӫҵϵͳ���ڸñʽ��ף�����ϵͳ�����ڸñʽ��ף��Զ������ɹ�('+lsbh+')','�ɷѽ���',0,0.00);
        end
        else
        begin
          ADDRZ(rq,jflsh,'Ӫҵϵͳ���ڸñʽ��ף�����ϵͳ�����ڸñʽ��ף��Զ��������ɹ�('+rtncode+')','�ɷѽ���',0,0.00);
        end;
      end
      else
      begin
        ADDRZ(rq,jflsh,'Ӫҵϵͳ���ڸñʽ��ף�����ϵͳ�����ڸñʽ���','�ɷѽ���',0,0.00);
      end;
      //ADDRZ(rq,jflsh,'Ӫҵϵͳ���ڸñʽ��ף����շ�ϵͳ�����ڸñʽ���','�ɷѽ���',0,0.00);
      DM.ADOQuery1.Next;
    end;
    //�жϽɷ��ն��У�ϵͳû��
    //�ɷ�
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Clear;
    DM.ADOQuery1.SQL.Text:='select right(LSH,13) as BH,yhh as JFHH,je as SSJE from TEMP_JFT where left(LSH,1)=''F'' and FL='''+DSKHDM+''' and right(LSH,13) not in (select BH from Q_JFXX where JFRQ = '''+rq+''' and SFRBH='''+DSKHDM+''')';
    DM.ADOQuery1.Open;
    while not DM.ADOQuery1.Eof do
    begin
      jflsh:=DM.ADOQuery1.FieldByName('BH').AsString;
      ADDRZ(rq,jflsh,'���շ�ϵͳ���ڸñʽ��ף�Ӫҵϵͳ�����ڸñʽ���.����:'+DM.ADOQuery1.FieldByName('JFHH').AsString+'���:'+DM.ADOQuery1.FieldByName('SSJE').AsString,'�ɷѽ���',0,0.00);
      DM.ADOQuery1.Next;
    end;
    DM.ADOQuery1.Close;
  except
    ADDRZ(rq,jflsh,'���ݿ�����¶����쳣��ֹ!','',0,0.00);
  end;
end;

procedure TfrmSocketServer.SSocketClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  Socket.Close;
  ErrorCode := 0;
end;

procedure TfrmSocketServer.SSocketGetThread(Sender: TObject;
  ClientSocket: TServerClientWinSocket;
  var SocketThread: TServerClientThread);
var
  Item:TListItem;
begin
  try
    SocketThread := TNewServerThread.Create(False, ClientSocket);
  except
  end;
end;

procedure TfrmSocketServer.Timer1Timer(Sender: TObject);
var
  sr:TSearchRec;
  FileAttrs,ipos,i,zsl1,zsl:Integer;
  sfilename,sstr,jfrq,dzrz,slogfile,fileextname,connlogfile,logfilepath:string;
  jfsj:TDateTime;
  sdata:array [1..5] of string[20];
  je,zje1,zje:real;
  sfdz:Boolean;
  F,FF:TextFile;
begin
  logfilepath:=currpath+'RcvLogFile\'+FormatDateTime('yyyymmdd',date);
  connlogfile:=logfilepath+'\LogConnInfo.txt';
  Timer1.Enabled := False;
  if not DM.ADOConnection1.Connected then
  begin
    try
      DM.ADOConnection1.Close;
      DM.ADOConnection1.Open;
    except
    end;
  end;
  try
    if FileExists(ftpdir+DZFileName) then
    //if DZFileName <> '' then
    //if FindFirst(ftpdir+'*.'+ExtName,faAnyFile,sr)=0 then
    begin
    //repeat
      sfilename:=DZFileName;
      //sfilename:=sr.Name;
      fileextname:=ExtractFileExt(sfilename);
      if UpperCase(fileextname) = UpperCase('.'+ExtName) then
      begin
        slogfile:=bakdir+copy(sfilename,1,Length(sfilename)-4)+'_result_'+ExtName+'.txt';
        zsl1:=0;
        zje1:=0;
        try
          AssignFile(F,ftpdir+sfilename);
          Reset(F);
          Readln(F,sstr);
          if RightStr(sstr,1)<>'|' then
            sstr:=sstr+'|';
          ipos:=pos('|',sstr);
          if ipos>0 then
          begin
            jfrq:=trim(copy(sstr,1,ipos-1));
            sstr:=trim(copy(sstr,ipos+1,Length(sstr)-ipos));
          end;
          ipos:=pos('|',sstr);
          if ipos>0 then
          begin
            try
              zsl1:=strtoint(trim(copy(sstr,1,ipos-1)));
            except
              zsl1:=0;
              LogMSG(slogfile,'������ת����ֵ�쳣');
            end;
            sstr:=trim(copy(sstr,ipos+1,Length(sstr)-ipos));
          end;
          ipos:=pos('|',sstr);
          if ipos>0 then
          begin
            try
              zje1:=strtofloat(trim(copy(sstr,1,ipos-1)));
            except
              zje1:=0;
              LogMSG(slogfile,'�ܽ��ת����ֵ�쳣');
            end;
            sstr:=trim(copy(sstr,ipos+1,Length(sstr)-ipos));
          end;
          zsl:=0;
          zje:=0;
          try
            DM.ADOQuery1.Close;
            DM.ADOQuery1.SQL.Clear;
            DM.ADOQuery1.SQL.Text:='delete from temp_jft where FL = '''+DSKHDM+'''';
            DM.ADOQuery1.ExecSQL;
          except
            LogMSG(slogfile,'ɾ��temp_jft��¼�쳣');
            //Break;
          end;
          while not Eof(F) do
          begin
            sstr:='';
            Readln(F,sstr);
            if RightStr(sstr,1)<>'|' then
              sstr:=sstr+'|';
            ipos:=pos('|',sstr);
            i:=1;
            while ipos>0 do
            begin
              sdata[i]:=trim(copy(sstr,1,ipos-1));
              sstr:=trim(copy(sstr,ipos+1,Length(sstr)-ipos));
              ipos:=pos('|',sstr);
              i:=i+1;
            end;
            jfsj:=strtodatetime(trim(copy(sdata[4],1,4))+'-'+trim(copy(sdata[4],5,2))+'-'+trim(copy(sdata[4],7,2))+' '+trim(copy(sdata[4],9,2))+':'+trim(copy(sdata[4],11,2))+':'+trim(copy(sdata[4],13,2)),dateFormatSettings);
            je:=0;
            if sdata[5]<>'' then
            begin
              try
                je:=strtofloat(sdata[5]);
              except
                je:=0;
                LogMSG(slogfile,'���ת����ֵ�쳣');
              end;
            end;
            if (sdata[1]<>'') and (sdata[2]<>'') then
            begin
              try
                DM.ADOQuery1.Close;
                DM.ADOQuery1.SQL.Clear;
                DM.ADOQuery1.SQL.Text:='insert into temp_jft(lsh,yhh,yf,jfsj,je,FL) values(:a1,:a2,:a3,:a4,:a5,:a6)';
                DM.ADOQuery1.Parameters[0].Value:=sdata[1];
                DM.ADOQuery1.Parameters[1].Value:=sdata[2];
                DM.ADOQuery1.Parameters[2].Value:=sdata[3];
                DM.ADOQuery1.Parameters[3].Value:=jfsj;
                DM.ADOQuery1.Parameters[4].Value:=je;
                DM.ADOQuery1.Parameters[5].Value:=DSKHDM;
                DM.ADOQuery1.ExecSQL;
              except
                LogMSG(slogfile,'����temp_jft��¼�쳣');
              end;
            end;
            zsl:=zsl+1;
            if (copy(sdata[1],1,1)='F') or (copy(sdata[1],1,1)='C') then
              zje:=zje+je
            else if copy(sdata[1],1,1)='T' then
              zje:=zje-je;
          end;
          CloseFile(F);
          sfdz:=true;
          try
            strtodate(jfrq,dateFormatSettings);
          except
            //�ļ���ʽ���ԣ������ж��˲���
            sfdz:=false;
            dzrz:='�����ļ������ڸ�ʽ�����޷����ˡ�';
          end;
          if fileExists(slogfile) then
            deletefile(slogfile);
          if fileExists(bakdir+sfilename) then
            deletefile(bakdir+sfilename);
          LogMSG(slogfile,jfrq+'  ��ʼ����');
          if sfdz then
          begin
            try
              DM.ADOQuery1.Close;
              DM.ADOQuery1.SQL.Clear;
              DM.ADOQuery1.SQL.Text:='delete from TEMP_DZRZ where jfrq='''+jfrq+''' and DZFL='''+DSKHDM+'''';
              DM.ADOQuery1.ExecSQL;
            except
              LogMSG(slogfile,'ɾ��TEMP_DZRZ��¼�쳣');
            end;
            ADDRZ(jfrq,'','��ʼ����','',0,0);
            try
              JFDZ(jfrq,slogfile);//���˲���
              copyfile(Pchar(ftpdir+sfilename),pchar(bakdir+sfilename),false);
              if fileExists(ftpdir+sfilename) then
                deletefile(ftpdir+sfilename);
            except
              ADDRZ(jfrq,'','���˹��̳������½��ж��˲�����','',0,0);
              LogMSG(slogfile,jfrq+'  ���˹��̳������½��ж��˲�����');
            end;
            ADDRZ(jfrq,'','������ϡ����շ�ϵͳ�ɹ����� '+inttostr(zsl1)+' �ʣ��ɹ����׽�� '+FormatFloat('0.00',zje1)+'Ԫ��','',zsl1,zje1);
          end
          else
          begin
            LogMSG(slogfile,jfrq+'  '+dzrz);
            copyfile(Pchar(ftpdir+sfilename),pchar(bakdir+sfilename),false);
            if fileExists(ftpdir+sfilename) then
              deletefile(ftpdir+sfilename);
          end;
          LogMSG(slogfile,jfrq+'  ������ϡ����гɹ����� '+inttostr(zsl1)+' �ʣ��ɹ����׽�� '+FormatFloat('0.00',zje1)+'Ԫ��');
          DZFileName:='';
        except
          CloseFile(F);
        end;
      end
      else
      begin    
        LogMsg(connlogfile,'��������ļ�'+DZFileName+'��չ�������õ�'+ExtName+'��һ��');
      end;
    //until FindNext(sr) <> 0;
    //FindClose(sr);
    end
    else
    begin
      LogMsg(connlogfile,'��������ļ�'+DZFileName+'������');
    end;
  except
    on ex:Exception do
    begin
      LogMsg(connlogfile,'��������ļ�'+DZFileName+'�쳣'+ex.Message);
    end;
  end;
end;

procedure TfrmSocketServer.FormCreate(Sender: TObject);
var
  sj:integer;
begin
  try
    sj:=strtoint(stime);
  except
    sj:=10;
  end;
  DZFileName:='';
  sj:=sj*60*1000;
  Timer1.Enabled:=False;
  Timer1.Interval:=sj;
  //Timer1.Enabled:=True;
  sj:=8900;
  try
    sj:=strtoint(sport);
  except
  end; 
  if DM.ADOConnection1.Connected then
  begin
    Label1.Font.Color:=clGreen;
    Label1.Caption:='���ӷ�������'+sip;   
    StatusBar1.Panels[0].Text:='������:'+sip;
  end
  else
  begin
    Label1.Font.Color:=clRed;
    Label1.Caption:='���ӷ�������δ���ӣ�';  
    StatusBar1.Panels[0].Text:='������:δ����';
  end;
  Label3.Caption:='�����˿ںţ�';
  //Label1.Caption:='���շѷ���ϵͳ�˿ںţ�'+sport;
  try
    SSocket.Active :=False;
    SSocket.Port :=sj;
    SSocket.Active :=true;
    Label2.Caption:='���շѷ������������У���ֹ�ر�ϵͳ������';   
    Label3.Font.Color:=clGreen;
    Label3.Caption:='�����˿ںţ�'+inttostr(SSocket.Port);
    StatusBar1.Panels[1].Text:='�����˿�:'+inttostr(SSocket.Port);
  except
    on Err:Exception do
    begin
      Label2.Caption:='���շѷ���������ʧ�ܣ�����������ϵͳ��';
      Label3.Font.Color:=clRed;
      Label3.Caption:='�����˿ںţ�Socket����ʧ��-'+Err.Message;
      StatusBar1.Panels[1].Text:='�����˿�:δ����';
    end;
  end;
end;

procedure TfrmSocketServer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SSocket.Active :=false;
end;

procedure TfrmSocketServer.N3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSocketServer.N1Click(Sender: TObject);
begin
  CoolTrayIcon1.ShowMainForm;
end;

procedure TfrmSocketServer.CoolTrayIcon1DblClick(Sender: TObject);
begin
  CoolTrayIcon1.ShowMainForm;
end;

procedure TfrmSocketServer.Timer2Timer(Sender: TObject);
var
  sj:integer;
begin
  if not SSocket.Active then
  begin
    sj:=9700;
    try
      sj:=strtoint(sport);
    except
    end;
    try
      SSocket.Active :=False;
      SSocket.Port :=sj;
      SSocket.Active :=true;
      Label2.Caption:='���շѷ������������У���ֹ�ر�ϵͳ������';
      Label3.Font.Color:=clGreen;
      Label3.Caption:='�����˿ںţ�'+inttostr(SSocket.Port);
      StatusBar1.Panels[1].Text:='�����˿�:'+inttostr(SSocket.Port);
    except
      on Err:Exception do
      begin
        Label2.Caption:='���շ���������ʧ�ܣ�����������ϵͳ��';
        Label3.Font.Color:=clRed;
        Label3.Caption:='�����˿ںţ�Socket����ʧ��-'+Err.Message;
        StatusBar1.Panels[1].Text:='�����˿�:δ����';
      end;
    end;
    if DM.ADOConnection1.Connected then
    begin
      Label1.Font.Color:=clGreen;
      Label1.Caption:='���ӷ�������'+sip;
      StatusBar1.Panels[0].Text:='������:'+sip;
    end
    else
    begin
      Label1.Font.Color:=clRed;
      Label1.Caption:='���ӷ�������δ���ӣ�';
      StatusBar1.Panels[0].Text:='������:δ����';
    end;
  end;
end;

procedure TfrmSocketServer.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //if Application.MessageBox('�ر�ϵͳ�������޷����մ��սɷ����ݣ�ȷʵҪ�ر���','��ʾ��Ϣ',MB_YESNO+MB_ICONEXCLAMATION)=IDYES then
  //  CanClose:=True
  //else
  CanClose:=False;
  CoolTrayIcon1.HideMainForm;
end;

procedure TfrmSocketServer.N4Click(Sender: TObject);
begin
  Frmxtsz:=TFrmxtsz.Create(self);
  try
    Frmxtsz.ShowModal;
  finally
    Frmxtsz.free;
    Frmxtsz:=nil;
  end;
end;

end.
