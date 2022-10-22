unit qc_doc_CompFiles;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Buttons,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmCompareFiles = class(TUniForm)
    OpenDialog1: TOpenDialog;
    SR: TIQWebSecurityRegister;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnSetup: TUniButton;
    btnCompare: TUniButton;
    btnCancel: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Panel2: TUniPanel;
    PnlClient03: TUniPanel;
    edFile1: TUniEdit;
    edFile2: TUniEdit;
    sbtnSelectFileName1: TUniSpeedButton;
    sbtnSelectFileName2: TUniSpeedButton;
    procedure btnSetupClick(Sender: TObject);
    procedure sbtnSelectFileName1Click(Sender: TObject);
    procedure sbtnSelectFileName2Click(Sender: TObject);
    procedure btnCompareClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure DoFileComparison(AFileName1, AFileName2:String);

implementation

{$R *.dfm}
uses
  qc_doc_CompFilesSetup,
  IQMS.Common.Controls;

procedure DoFileComparison(AFileName1, AFileName2:String);
var
  LFrmCompareFiles : TFrmCompareFiles;
begin
  LFrmCompareFiles := TFrmCompareFiles.Create(UniGUIApplication.UniApplication);
  with LFrmCompareFiles do
  begin
    edFile1.Text:= AFileName1;
    edFile2.Text:= AFileName2;
    Show;
  end;
end;

{ TFrmCompareFiles }

procedure TFrmCompareFiles.FormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient03);
end;

procedure TFrmCompareFiles.btnSetupClick(Sender: TObject);
begin
  FrmFileCmprSetupShowModal;
end;

procedure TFrmCompareFiles.sbtnSelectFileName1Click(Sender: TObject);
begin
  with OpenDialog1 do
    if Execute then
      edFile1.Text:= FileName;
end;

procedure TFrmCompareFiles.sbtnSelectFileName2Click(Sender: TObject);
begin
  with OpenDialog1 do
    if Execute then
      edFile2.Text:= FileName;
end;

procedure TFrmCompareFiles.btnCompareClick(Sender: TObject);
begin
  with TFrmFileCmprSetup.Create(Owner) do
  try
    CompareFiles(self.edFile1.Text, self.edFile2.Text);
  finally
    Free;
  end;
end;

procedure TFrmCompareFiles.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
