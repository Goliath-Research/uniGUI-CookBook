unit IQMS.Common.XmlLogFile;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes;
  // db_dm;

{ Test Example:

procedure TForm1.Button1Click(Sender: TObject);
var
  sl: TStringList;
begin
  with TIQXmlLogFile.Create('C:\DDUpdLog.xml') DO
  try
     sl := TStringList.Create;
     try
       sl.Add('<header>');
       sl.Add('<executed>Jun 29,2015 12:59:33</executed>');
       sl.Add('<version>2014.2</version>');
       sl.Add('<oracleVersion>Oracle Database 12c Release 12.1.0.1.0 - 64bit Production</oracleVersion>');
       sl.Add('<plSQLVersion>PL/SQL Release 12.1.0.1.0 - Production</plSQLVersion>');
       sl.Add('<coreVersion>CORE	12.1.0.1.0	Production</coreVersion>');
       sl.Add('<tns>TNS for 64-bit Windows: Version 12.1.0.1.0 - Production</tns>');
       sl.Add('<nlsrtl>NLSRTL Version 12.1.0.1.0 - Production</nlsrtl>');
       sl.Add('<timeStamp>06-14-2015 12:59:33</timeStamp>');
       sl.Add('</header>');
       WriteBlock(Trim(sl.Text));
     finally
       sl.Free;
     end;

     sl := TStringList.Create;
     try
       sl.Add('<command>');
       sl.Add('<result>ERROR</result>');
       sl.Add('<errorDescription>General SQL error</errorDescription>');
       sl.Add('<errorMessage>ORA-01430: column being added already exists in table</errorMessage>');
       sl.Add('<errorCode>ORA-01430</errorCode>');
       sl.Add('<commandText>');
       sl.Add('alter table IQSYS2');
       sl.Add('    add     RUNNING_DD_UPDATE               VARCHAR2(1)            null');
       sl.Add('        constraint CKC_RUNNING_DD_UPDATE_IQSYS2 check (');
       sl.Add('            RUNNING_DD_UPDATE is null or (RUNNING_DD_UPDATE in (''Y'',''N'')))');
       sl.Add('</commandText>');
       sl.Add('<timeStamp>06-14-2015 12:59:34</timeStamp>');
       sl.Add('<timeElapsed>0.0210</timeElapsed>');
       sl.Add('</command>');
       WriteBlock(Trim(sl.Text));
     finally
       sl.Free;
     end;

     sl := TStringList.Create;
     try
       sl.Add('<command>');
       sl.Add('<result>SUCCESS</result>');
       sl.Add('<errorDescription></errorDescription>');
       sl.Add('<errorMessage></errorMessage>');
       sl.Add('<errorCode></errorCode>');
       sl.Add('<commandText>');
       sl.Add('update iqsys2 set RUNNING_DD_UPDATE = ''Y''');
       sl.Add('</commandText>');
       sl.Add('<timeStamp>06-14-2015 12:59:35</timeStamp>');
       sl.Add('<timeElapsed>0.0200</timeElapsed>');
       sl.Add('</command>');
       WriteBlock(Trim(sl.Text));
     finally
       sl.Free;
     end;

     sl := TStringList.Create;
     try
       sl.Add('<command>');
       sl.Add('<result>SUCCESS</result>');
       sl.Add('<errorDescription></errorDescription>');
       sl.Add('<errorMessage></errorMessage>');
       sl.Add('<errorCode></errorCode>');
       sl.Add('<commandText>');
       sl.Add('begin');
       sl.Add('  WRITE_CLASS_EVENTLOG( ''DD Update'',');
       sl.Add('                        ''Started DD update from 2015 to 2015.1'');');
       sl.Add('end;');
       sl.Add('</commandText>');
       sl.Add('<timeStamp>06-14-2015 12:59:36</timeStamp>');
       sl.Add('<timeElapsed>0.0200</timeElapsed>');
       sl.Add('</command>');
       WriteBlock(Trim(sl.Text));
     finally
       sl.Free;
     end;

  finally
    Free;
  end;
end;


}


type
  { TIQXmlLogFile }
  TIQXmlLogFile = class
  strict private
    { Private declarations }
    FRoot: string;
    FFile: TextFile;
    FFileName: TFileName;
    FModified: Boolean;
    FFileFinalized: Boolean;
    procedure InitializeFile;
    procedure FinalizeFile;
    procedure FreeMemory;
    procedure WriteToFile(AText: String);
    procedure SetFileName(const Value: TFileName);
  public
    { Public declarations }
    constructor Create(AFileName: TFileName);
    destructor Destroy; override;
    /// <summary> Write XML block to the log file. </summary>
    procedure WriteBlock(AXML: String);
    /// <summary>Clear lines stored in memory and delete the physical log
    /// file on the disk.</summary>
    procedure Clear;
    /// <summary> Display the log file. </summary>
    procedure Show;
  published
    /// <summary> XML root name. </summary>
    property Root: string read FRoot write FRoot;
    /// <summary> Complete path and file name of the log to create. </summary>
    property FileName: TFileName read FFileName write SetFileName;
    /// <summary> Determine if the log file was modified. </summary>
    property Modified: Boolean read FModified;
  end;

implementation

uses
  IQMS.Common.Miscellaneous;

{$REGION 'TIQXmlLogFile'}


constructor TIQXmlLogFile.Create(AFileName: TFileName);
begin
  inherited Create;

  FRoot := 'log';

  FFileFinalized := False;

  // Set the file name here when we create the object.  Once we set this, it
  // cannot be changed for this instance of TIQXmlLogFile
  FileName := AFileName;
end;

destructor TIQXmlLogFile.Destroy;
begin
  // Free the connection to the file
  FinalizeFile;
  FreeMemory;
  inherited Destroy;
end;

procedure TIQXmlLogFile.FreeMemory;
begin
  if (FFileName = '') then
    Exit;
{$I-}
  Flush(FFile); // empty buffer of the file opened for output
  CloseFile(FFile);
  // terminate association between file variable and an external disk file
{$I+}
end;

procedure TIQXmlLogFile.InitializeFile;
begin
  if not FFileFinalized then
    begin
      Clear;
      WriteToFile('<?xml version="1.0" encoding="UTF-8"?>');
      WriteToFile(Format('<%s>',[FRoot]));
      FFileFinalized := True;
    end;
end;

procedure TIQXmlLogFile.FinalizeFile;
begin
  WriteToFile(Format('</%s>',[FRoot]));
end;

procedure TIQXmlLogFile.WriteBlock(AXML: String);
begin
  InitializeFile;
  WriteToFile(AXML);
end;

procedure TIQXmlLogFile.Clear;
begin
  DeleteFile(FFileName);
  Write('');
  FModified := FALSE;
end;

procedure TIQXmlLogFile.Show;
begin
  if FileExists(FFileName) then
    ExecuteProgram(FFileName, SW_SHOWDEFAULT, '');
end;

procedure TIQXmlLogFile.WriteToFile(AText: String);
begin
{$I-}
  if (FFileName = '') then
    Exit;

  // Ensure the directory path exists
  if not DirectoryExists(ExtractFilePath(FFileName)) then
    ForceDirectories(ExtractFilePath(FFileName));

  // If the file does not exist, then created it
  if (not FileExists(FFileName)) then
    Rewrite(FFile);

  if ioresult = 0 then // return status of the last I/O operation performed
    begin
      Append(FFile);
      Writeln(FFile, AText); // write an end-of-line marker to the file
      FModified := TRUE;
    end;
end;

procedure TIQXmlLogFile.SetFileName(const Value: TFileName);
begin
  FFileName := Value;
  // Assign the TextFile to the TextFile object
  if (FFileName > '') then
    AssignFile(FFile, FFileName);
end;

{$ENDREGION 'TIQXmlLogFile'}

end.
