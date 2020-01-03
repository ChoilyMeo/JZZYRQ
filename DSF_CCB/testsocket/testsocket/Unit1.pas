unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, Mask, ExtCtrls, RzLstBox;

type
  TForm1 = class(TForm)
    ClientSocket1: TClientSocket;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    MaskEdit1: TMaskEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button3: TButton;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    Button4: TButton;
    Label8: TLabel;
    Edit7: TEdit;
    Label9: TLabel;
    Edit8: TEdit;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Button2Click(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ClientSocket1.Address:=Edit2.Text;
  ClientSocket1.Port:=StrToInt(Edit1.Text);
  ClientSocket1.Open;
end;

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
//  Edit1.Text:='服务器连接成功';
  memo1.lines.Add('服务器连接成功!');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ClientSocket1.Socket.SendText('36          6010posid55555'+maskedit1.Text);
//  ClientSocket1.Socket.SendText('62          6020posid55555100433    2011082515090416.38       ');
end;

procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
//  Edit2.Text:=Socket.ReceiveText;
//  Memo1.Text:=Memo1.Text+#10#13+socket.ReceiveText;
  memo1.lines.Add(Socket.ReceiveText);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientSocket1.Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  str,str2,str3:string;
begin
  str:=Edit4.Text+copy('            ',1+length(Trim(Edit4.Text)),12-length(Trim(Edit4.Text)));
  str2:=Edit3.Text+copy('          ',1+length(Trim(Edit3.Text)),10-length(Trim(Edit3.Text)));
  str3:=FormatDateTime('YYYYMMDD',Date)+FormatDateTime('HHMMSS',Time);
  ClientSocket1.Socket.SendText('62          6020posid55555'+str2+str3+str);
end;

procedure TForm1.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  memo1.lines.Add('连接出错，错误代码：'+inttostr(ErrorCode));
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  strje,stryhh,strlsh,strjysj:string;
begin
  strje:=trim(Edit6.Text)+copy('            ',1+length(Trim(Edit6.Text)),12-length(Trim(Edit6.Text)));
  stryhh:=trim(Edit5.Text)+copy('          ',1+length(Trim(Edit5.Text)),10-length(Trim(Edit5.Text)));
  strjysj:=FormatDateTime('YYYYMMDD',Date)+FormatDateTime('HHMMSS',Time);
  strlsh:=trim(Edit7.Text)+copy('                    ',1+length(Trim(Edit7.Text)),20-length(Trim(Edit7.Text)));
  ClientSocket1.Socket.SendText('82          6030posid55555'+stryhh+strlsh+strje+strjysj);
//  ClientSocket1.Socket.SendText('82          6030posid55555100010    F2011101900001      12.50       20111119142700');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ClientSocket1.Socket.SendText(edit8.Text);
end;

end.
