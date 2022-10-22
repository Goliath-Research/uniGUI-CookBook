unit IQMS.Common.Ftp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  IdFTP,
  IdFTPCommon,
  IdFTPList,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys;

type
  TIQFtp = class (TComponent)
  private
    IdFTP: TIdFTP;
    function LoadFiles( AList: TStringList; APath: string; AMask: string = '*.edi' ): Boolean;
  public
    TransferrignData: Boolean;

    constructor Create( AOwner: TComponent; AHost, AUserName, APassword: string; APort: Integer = 21 );
    destructor Destroy; override;
    procedure Connect;
    procedure Disconnect;
    procedure DownloadDirectoryTo( ALocalDirName: string; AFileMask: string = '*.edi' );
    procedure UploadFromDirectory( ALocalDirName: string; AFileMask: string = '*.edi' );

    class function CheckFTPConnection( AHost, AUserName, APassword: string; APort: Integer = 21 ): string;
  end;

implementation

uses
  IQMS.Common.FileUtils;

class function TIQFtp.CheckFTPConnection( AHost, AUserName, APassword: string; APort: Integer = 21 ): string;
begin
  with TIQFtp.Create( NIL, AHost, AUserName, APassword, APort ) do
  try
    try
      Connect;
      Result:= '';
    except on E: Exception do
      Result:= E.Message;
    end;
    Disconnect;
  finally
    Free;
  end;
end;


{ TIQFtp }

constructor TIQFtp.Create( AOwner: TComponent; AHost, AUserName, APassword: string; APort: Integer = 21);
begin
  inherited Create( AOwner );

  IdFTP:= TIdFTP.Create( self );
  with IdFTP do
  begin
    Host    := AHost;
    Username:= AUserName;
    Password:= APassword;
    Port    := APort;
  end;
end;

destructor TIQFtp.Destroy;
begin
  Disconnect;
  inherited;
end;

procedure TIQFtp.Connect;
begin
  if IdFTP.Connected then
     self.Disconnect;
  IdFTP.Connect;
end;

procedure TIQFtp.Disconnect;
begin
  if TransferrignData then
     IdFTP.Abort;
  IdFTP.Quit;
end;

procedure TIQFtp.DownloadDirectoryTo( ALocalDirName: string; AFileMask: string = '*.edi' );
var
  AList: TStringList;
  I    : Integer;
begin
  {Validate}
  if TransferrignData then
     EXIT;

  if Trim(ALocalDirName) = '' then
     EXIT;

  ALocalDirName:= GetDirectoryName( ALocalDirName ); {IQMS.Common.FileUtils.pas}

  {Connect}
  if not IdFTP.Connected then
     Connect;

  {Download}
  try
    AList:= TStringList.Create;
    try
      TransferrignData:= TRUE;
      IdFTP.List( AList, AFileMask, TRUE );

      IdFTP.TransferType:= ftBinary;

      for I:= 0 to IdFTP.DirectoryListing.Count - 1 do with IdFTP.DirectoryListing.Items[ I ] do
      begin
        if ItemType = ditFile then
           IdFTP.Get( FileName, ALocalDirName + FileName, TRUE );
      end;

    finally
      AList.Free;
      TransferrignData:= FALSE;
    end;
  finally
    Disconnect;
  end;
end;

procedure TIQFtp.UploadFromDirectory( ALocalDirName: string; AFileMask: string = '*.edi' );
var
  AList: TStringList;
  I    : Integer;
begin
  {Validate}
  if TransferrignData then
     EXIT;

  if Trim(ALocalDirName) = '' then
     EXIT;

  ALocalDirName:= GetDirectoryName( ALocalDirName ); {IQMS.Common.FileUtils.pas}

  {Connect}
  if not IdFTP.Connected then
     Connect;

  {Upload}
  try
    AList:= TStringList.Create;
    try
      TransferrignData:= TRUE;
      if not LoadFiles( AList, ALocalDirName, AFileMask ) then
         EXIT;

      IdFTP.TransferType:= ftBinary;

      for I:= 0 to AList.Count - 1 do
        IdFTP.Put( AList[ I ], ExtractFileName( AList[ I ]));

    finally
      AList.Free;
      TransferrignData:= FALSE;
    end;
  finally
    Disconnect;
  end;
end;


function TIQFtp.LoadFiles( AList: TStringList; APath: string; AMask: string = '*.edi' ): Boolean;
var
  ASearchRec: TSearchRec;
  FindResult: Integer;
begin
  APath:= GetDirectoryName( APath ); {IQMS.Common.FileUtils.pas}

  FindResult:= FindFirst( APath + AMask, faAnyFile, ASearchRec );
  try
    while FindResult = 0 do
    begin
      if ASearchRec.Attr and faDirectory = 0 then
         AList.Add( APath + ASearchRec.Name );
      FindResult:= FindNext( ASearchRec );
    end;
  finally
    FindClose(ASearchRec);
  end;
  Result:= ( AList.Count > 0 );
end;

end.

