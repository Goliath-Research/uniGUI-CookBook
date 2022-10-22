unit Lnk_ConnDlg;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Buttons,
  StdCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniFileUpload;

type
  TFrmConnDlg = class(TUniForm)
    IP: TUniLabel;
    Port: TUniLabel;
    edIP: TUniEdit;
    edPort: TUniEdit;
    Label1: TUniLabel;
    edFileName: TUniEdit;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    sbtnBrowse: TUniSpeedButton;
    UniFileUpload1: TUniFileUpload;
    procedure btnOKClick(Sender: TObject);
    procedure sbtnBrowseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
    procedure FAPort(Value:integer);
  public
    { Public declarations }
    AFileName, AIPAddr: string;
    vAPort: Integer;
    DestName, DestFolder: string;
   // constructor Create( AOwner: TComponent; APort: Integer );
    property  APort:Integer write  FAPort;
  end;

  function FrmConnDlg: TFrmConnDlg;

implementation

{$R *.DFM}

uses
  //Lnk_Main,
  IQMS.Common.RegFrm, MainModule, ServerModule;

  function FrmConnDlg: TFrmConnDlg;
begin
  Result := TFrmConnDlg(UniMainModule.GetFormInstance(TFrmConnDlg));
end;
//function GetConnDlg( var AFileName, AIPAddr: string; var APort: Integer ): Boolean;
//begin
//  with TFrmConnDlg.Create( Application, APort ) do
//  try
//    Result:= ShowModal = mrOK;
//    if Result then
//    begin
//      AFileName:= edFileName.Text;
//      AIPAddr  := edIP.Text;
//      APort    := StrToInt( edPort.Text);
//    end;
//  finally
//    Free;
//  end;
//end;

//constructor TFrmConnDlg.Create( AOwner: TComponent; APort: Integer );
//var
//  S: string;
//begin
//  inherited Create( AOwner );
//
//  IQRegStringScalarRead( self, 'LastHost', S );
//  edIP.Text:= S;
//
//  edPort.Text:= IntToStr( APort );
//end;
  
procedure TFrmConnDlg.btnOKClick(Sender: TObject);
begin
  if not FileExists( DestFolder+edFileName.Text ) then
     raise Exception.CreateFmt('File %s does not exist', [ edFileName.Text ]);
                                           
  if Trim(edIP.Text) = '' then
     raise Exception.Create('IP address must be entered');

  StrToInt( edPort.Text );
  // Elimina el archivo que ha sido cargado en el servidor.
  // Delete the file that has been uploaded to the server.
  DeleteFile(DestFolder+edFileName.Text);
  ModalResult:= mrOK;
end;

procedure TFrmConnDlg.sbtnBrowseClick(Sender: TObject);
begin
 with UniFileUpload1 do
  begin
    //if InitialDir = '' then
    if TargetFolder='' then
   { // InitialDir:= Lnk_Main.DirOUT; Presenta error al convertir la forma Lnk_Main }
    if Execute then
       edFileName.Text:= FileName;

  end
end;

procedure TFrmConnDlg.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);

begin
  DestFolder := UniServerModule.FilesFolderPath + 'UploadTmpFolder\';
  DestName := DestFolder + ExtractFileName(UniFileUpload1.FileName);
      // -----copying file server.
     // -----Path where the file is deposited
    //  -----C:\BIN\WebIQ\files\UploadTmpFolder
  CopyFile(PChar(AStream.FileName), PChar(DestName), False);

end;

procedure TFrmConnDlg.UniFormCreate(Sender: TObject);
begin
      // Inicializando el EdPoart.txt
      edPort.Text:='0';
      AFileName:= edFileName.Text;
      AIPAddr  := edIP.Text;
      APort    := StrToInt(edPort.Text);

end;

procedure TFrmConnDlg.FAPort(Value: integer);
var
  S: string;
begin
  IQRegStringScalarRead( self, 'LastHost', S );
  edIP.Text:= S;
  edPort.Text:= IntToStr( Value );
end;

procedure TFrmConnDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegStringScalarWrite( self, 'LastHost', edIP.Text );
end;

end.
