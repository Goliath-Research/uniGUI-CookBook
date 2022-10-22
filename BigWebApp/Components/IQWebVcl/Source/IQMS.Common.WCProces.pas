unit IQMS.Common.WCProces;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl, uniPanel, Vcl.Controls, uniFileUpload;

type
  TFrmProcess = class(TUniForm)
    bbtnOK: TUniBitBtn;
    bbtnCancel: TUniBitBtn;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    Label1: TUniLabel;
    Label2: TUniLabel;
    btnBrowse: TUniButton;
    edCommandLine: TUniEdit;
    edStatusFileName: TUniEdit;
    BtnBrowseFile: TUniButton;
    Label3: TUniLabel;
    edGraphicName: TUniEdit;
    SecurityRegister1: TIQWebSecurityRegister;
    ProcessBrowseDialog: TUniFileUpload;
    procedure bbtnOKClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnBrowseFileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ProcessBrowseDialogCompleted(Sender: TObject;
      AStream: TFileStream);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoGetDartParameters;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
//  IQSecIns;

const
  constDNETWNT            = 'DNETWNT';
  constDNETGraphicName    = 'DNETGraphicName';

procedure DoGetDartParameters;
var
  FrmProcess: TFrmProcess;
begin
  FrmProcess:= TFrmProcess.Create(uniGUIApplication.UniApplication);
  FrmProcess.ShowModal;
end;

procedure TFrmProcess.FormCreate(Sender: TObject);
var
  S:string;
begin
  {C:\DartNet\Viewer\Dnetw32.exe NETVIEW:IQ}
  if IQRegStringScalarRead( Application, constDNETWNT, S ) then
     edCommandLine.Text:= S;

  {C:\DartNet\STATUS\Status.STA}
  edStatusFileName.Text:= SelectValueAsString('select dart_status_filename from params');

  if IQRegStringScalarRead( Application, constDNETGraphicName, S ) then
     edGraphicName.Text:= S;
end;

procedure TFrmProcess.bbtnOKClick(Sender: TObject);
begin
  IQRegStringScalarWrite( Application, constDNETWNT,             edCommandLine.Text);
  ExecuteCommandFmt('update params set dart_status_filename = ''%s'' ', [ edStatusFileName.Text ]);
  IQRegStringScalarWrite( Application, constDNETGRAPHICNAME,     edGraphicName.Text);
  Close;
end;

procedure TFrmProcess.btnBrowseClick(Sender: TObject);
begin
    ProcessBrowseDialog.Tag:=1;
    ProcessBrowseDialog.Execute

end;

procedure TFrmProcess.BtnBrowseFileClick(Sender: TObject);
begin
    ProcessBrowseDialog.Tag:=2;
    ProcessBrowseDialog.Execute
end;

procedure TFrmProcess.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmProcess.ProcessBrowseDialogCompleted(Sender: TObject;
  AStream: TFileStream);
begin
  if ProcessBrowseDialog.Tag=1 then
    begin
      edCommandLine.Text := ProcessBrowseDialog.Filename;
    end
  else if ProcessBrowseDialog.Tag=2 then
    edStatusFileName.Text := ProcessBrowseDialog.Filename;

end;

end.
