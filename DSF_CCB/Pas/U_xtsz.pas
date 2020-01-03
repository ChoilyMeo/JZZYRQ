unit U_xtsz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzLabel, Mask, RzEdit, RzCmboBx,
  RzButton, Inifiles;

type
  TFrmXtsz = class(TForm)           
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    serverip: TRzEdit;
    db_name: TRzEdit;
    db_user: TRzEdit;
    db_pass: TRzEdit;
    rb_qd: TRzBitBtn;
    rb_qx: TRzBitBtn;
    RzGroupBox3: TRzGroupBox;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    dir_ftp: TRzEdit;
    dir_bak: TRzEdit;
    RzLabel5: TRzLabel;
    sys_time: TRzNumericEdit;
    RzLabel6: TRzLabel;
    sys_port: TRzNumericEdit;
    procedure FormCreate(Sender: TObject);
    procedure rb_qdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmXtsz: TFrmXtsz;

implementation

uses UData;

{$R *.dfm}

procedure TFrmXtsz.FormCreate(Sender: TObject);
begin
  serverip.Text:=sip;
  db_name.Text:=sdb;
  db_user.Text:=suser;
  db_pass.Text:=spass;
  dir_ftp.Text:=ftpdir;
  dir_bak.Text:=bakdir;
  sys_time.Text:=stime;
  sys_port.Text:=sport;
end;

procedure TFrmXtsz.rb_qdClick(Sender: TObject);
var
  inif:TIniFile;
begin
  if trim(serverip.Text)='' then
    sip:='(local)'
  else
    sip:=trim(serverip.Text);
  if trim(db_name.Text)='' then
    sdb:='LYZY_DB'
  else
    sdb:=trim(db_name.Text);
  if trim(db_user.Text)='' then
    suser:='sa'
  else
    suser:=trim(db_user.Text);
  if trim(db_pass.Text)='' then
    spass:=''
  else
    spass:=trim(db_pass.Text);
  if trim(dir_ftp.Text)='' then
    ftpdir:=''
  else
    ftpdir:=trim(dir_ftp.Text);
  if trim(dir_bak.Text)='' then
    bakdir:=''
  else
    bakdir:=trim(dir_bak.Text);
  if trim(sys_time.Text)='' then
    stime:='1'
  else
    stime:=trim(sys_time.Text);
  if trim(sys_port.Text)='' then
    sport:='1'
  else
    sport:=trim(sys_port.Text);

  inif:=TIniFile.Create(GetCurrentDir()+'\config.ini');
  try
    inif.WriteString('DB','IP',sip);
    inif.WriteString('DB','DBName',sdb);
    inif.WriteString('DB','User',suser);
    inif.WriteString('DB','Pass',spass);
    inif.WriteString('SYS','FTP',ftpdir);
    inif.WriteString('SYS','BAK',bakdir);
    inif.WriteInteger('SYS','Time',StrToInt(stime));
    inif.WriteInteger('SYS','PORT',StrToInt(sport));
    Application.MessageBox('系统配置信息修改成功，请关闭系统重新运行.','提示信息',MB_OK+MB_ICONASTERISK);
  finally
    inif.Free;
  end;
  Close;
end;

end.
