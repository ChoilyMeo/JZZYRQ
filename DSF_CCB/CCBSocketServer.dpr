program CCBSocketServer;

uses
  Forms,
  windows,
  SysUtils,
  uFrmSocketServer in 'Pas\uFrmSocketServer.pas' {frmSocketServer},
  uNewServerThread in 'Pas\uNewServerThread.pas',
  Udata in 'Pas\Udata.pas' {DM: TDataModule},
  U_xtsz in 'Pas\U_xtsz.pas' {FrmXtsz},
  comm in 'Pas\comm.pas';

{$R *.res}
var
  hMutex:hwnd;
  ret:integer;
  
begin
  hMutex:=CreateMutex(nil,false,'Global\焦作中裕建设银行代收费服务系统');
  ret:=GetLastError;
  if ret=ERROR_ALREADY_EXISTS then
  begin
    ReleaseMutex(hMutex);
    MessageBox(Application.Handle,'抱歉，本程序已经在运行!','提示信息',MB_OK+MB_DEFBUTTON1+MB_ICONEXCLAMATION);
    //Exit;
    Halt;
  end;
  currpath:=ExtractFilePath(Application.ExeName);
  //Application.ShowMainForm:=False;
  Application.Initialize;
  Application.Title := '焦作中裕建设银行代收费服务系统';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmSocketServer, frmSocketServer);
  Application.Run;
end.
