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
  hMutex:=CreateMutex(nil,false,'Global\������ԣ�������д��շѷ���ϵͳ');
  ret:=GetLastError;
  if ret=ERROR_ALREADY_EXISTS then
  begin
    ReleaseMutex(hMutex);
    MessageBox(Application.Handle,'��Ǹ���������Ѿ�������!','��ʾ��Ϣ',MB_OK+MB_DEFBUTTON1+MB_ICONEXCLAMATION);
    //Exit;
    Halt;
  end;
  currpath:=ExtractFilePath(Application.ExeName);
  //Application.ShowMainForm:=False;
  Application.Initialize;
  Application.Title := '������ԣ�������д��շѷ���ϵͳ';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmSocketServer, frmSocketServer);
  Application.Run;
end.
