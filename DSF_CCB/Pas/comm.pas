unit comm;

interface
uses
  Windows, Messages, SysUtils, Classes, Registry;


type
  TRapiInit = record
      cbSize:DWORD;
      heRapiInit:THandle;
      hrRapiInit:HResult;
  end;

  function ReadRegistry(KeyCaption: string; KeyName: string): string;
  function WritRegistry(KeyCaption: string; KeyName: string; KeyValue: string): string;
  function MyRound(ASour: double): integer;
  procedure LogMSG(logfile,logmsg:string);

  const cstrRegKeyCaption : string = 'software\河南嘉琪电子技术有限公司\漯河中裕燃气有限公司';
  const cstrRegKeyName_DBUserName : string = 'DBUserName';
  const cstrRegKeyName_DBPassword : string = 'DBPassword';
  const cstrRegKeyName_DBDefault : string = 'LHZY_DB';

var
  IfBreakThread: Boolean;
  PortName: integer;
  DBFilePath : string;
  DBUserName : string;
  DBPassword : string;
  UserPath: string;
  port:Byte;
  baudrate:Integer;
implementation

procedure LogMSG(logfile,logmsg:string);
var
  logfilepath:string;
  F:TextFile;
begin
  logfilepath:=ExtractFileDir(logfile);
  if not DirectoryExists(logfilepath) then
  CreateDir(logfilepath);
  try
    AssignFile(F,logfile);
    if not FileExists(logfile) then
      Rewrite(F)
    else
      Append(F);
    Writeln(F,formatdatetime('yyyy-mm-dd hh:nn:ss',Now())+'：'+logmsg);
    CloseFile(F);
  except
    CloseFile(F);
  end;
end;

function MyRound(ASour: Double): integer;
begin
  if (ASour - Trunc(ASour) >= 0.5) then
    Result := Trunc(ASour) + 1
  else
    Result := Trunc(ASour);
end;

function ReadRegistry(KeyCaption: string; KeyName: string): string;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.KeyExists(KeyCaption) = true then
    begin
      if Reg.OpenKey(KeyCaption, false) then
        Result := Reg.ReadString(KeyName);
      Reg.CloseKey;
    end
    else
      Result := '';
  finally
    Reg.Free;
  end;
end;


function WritRegistry(KeyCaption: string; KeyName: string; KeyValue: string): string;
var
  Reg: TRegistry;
begin
  Result := '';

  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.KeyExists(KeyCaption) then
    begin
//      Reg.DeleteKey(KeyCaption);
    end;
    if Reg.OpenKey(KeyCaption, true) then
    begin
      Reg.WriteString(KeyName, KeyValue);
    end;
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

initialization
  port:=0;
  baudrate:=9600;
  //try
    //PortName := strtoint(ReadRegistry(cstrRegKeyCaption,cstrRegKeyName_Port));
  //except
    //PortName := 1;
  //end;
  //DBFilePath := ReadRegistry(cstrRegKeyCaption,cstrRegKeyName_DBPath);
  //DBUserName := ReadRegistry(cstrRegKeyCaption,cstrRegKeyName_DBUserName);
  //DBPassword := ReadRegistry(cstrRegKeyCaption,cstrRegKeyName_DBPassword);

end.






