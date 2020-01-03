unit Udata;

interface

uses
  SysUtils, Classes, DB, ADODB, IniFiles, StrUtils, Windows;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOSPyhcx: TADOStoredProc;
    ADOSPyhjf: TADOStoredProc;
    ADOSPyhtk: TADOStoredProc;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  MAXLENGTH = 1024;
  
  procedure LogMsg1(posid,msg:string);
  
var
  DM: TDM;
  currpath,ftpdir,bakdir,sip,suser,spass,sdb,stime,dbsql,sport,ExtName,DSKHDM,auto_repair,dsf_jffs:string;
  dateFormatSettings:TFormatSettings;

implementation

{$R *.dfm}

procedure LogMsg1(posid,msg:string);
var
  logfilepath,logfile:string;   
  F:TextFile;
begin     
  logfilepath:=currpath+'RcvLogFile\'+FormatDateTime('yyyymmdd',date);
  if not DirectoryExists(logfilepath) then
    CreateDir(logfilepath);  
  logfile:=logfilepath+'\Log'+posid+'.txt';
  try
    AssignFile(F,logfile);
    if not FileExists(logfile) then
      Rewrite(F)
    else
      Append(F);
    Writeln(F,formatdatetime('yyyy-mm-dd hh:nn:ss ',Now())+msg);
    CloseFile(F);
  except
    CloseFile(F);
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  inif:TIniFile;
begin
  inif:=TIniFile.Create(currpath+'config.ini');
  try
    sip:=trim(inif.ReadString('DB','IP','(local)'));
    suser:=trim(inif.ReadString('DB','User','sa'));
    spass:=trim(inif.ReadString('DB','Pass',''));
    sdb:=trim(inif.ReadString('DB','DBname','LHZY_DB'));
    ExtName:=trim(inif.ReadString('SYS','EXTNAME','ICBC'));
    DSKHDM:=trim(inif.ReadString('SYS','DSKHDM','9991'));
    ftpdir:=trim(inif.ReadString('SYS','FTP',''));
    bakdir:=trim(inif.ReadString('SYS','BAK',''));
    stime:=trim(inif.ReadString('SYS','Time','10'));
    sport:=trim(inif.ReadString('SYS','PORT','9001'));
    auto_repair:=trim(inif.ReadString('SYS','AutoRepair','1'));
    dsf_jffs:=trim(inif.ReadString('SYS','JFFS','18'));
  finally
    inif.Free;
    inif:=nil;
  end;
  if RightStr(ftpdir,1)<>'\' then
    ftpdir:=ftpdir+'\';
  if RightStr(bakdir,1)<>'\' then
    bakdir:=bakdir+'\';
  try
    ADOConnection1.Close;
    ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password='+spass+';Persist Security Info=True;User ID='+suser+';Initial Catalog='+sdb+';Data Source='+sip;
    ADOConnection1.Open;
  except
  end;
  dbsql:='Provider=SQLOLEDB.1;Password='+spass+';Persist Security Info=True;User ID='+suser+';Initial Catalog='+sdb+';Data Source='+sip;
  GetLocaleFormatSettings(GetUserDefaultLCID, dateFormatSettings);
  dateFormatSettings.DateSeparator := '-';
  dateFormatSettings.TimeSeparator := ':';
  dateFormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  dateFormatSettings.ShortTimeFormat := 'hh:nn:ss';
end;

end.
