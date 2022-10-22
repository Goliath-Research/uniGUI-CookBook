unit crmword_prop;

interface

uses
  Data.DB,
  MainModule,
  dm_crmword,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  Mask,
  MaskUtils,
  System.Classes,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Forms,
  Vcl.Menus,
  Vcl.wwDataInspector,
  Winapi.Windows,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, Vcl.Grids;

type
  TFrmCRMWordDocProperties = class(TUniForm)
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    PnlSpacer: TUniPanel;
    PMain: TUniPopupMenu;
    EditMergeDocument1: TUniMenuItem;
    Panel1: TUniPanel;
    OpenDialog: TOpenDialog;
    diProp: TwwDataInspector;
    cmbDataset: TUniDBComboBox;
    cmbFileName: TUniEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeDescripKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure wwDataInspector1Items3EditButtonClick(Sender: TwwDataInspector;
      Item: TwwInspectorItem);
    procedure EditMergeDocument1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FCRMWordDocID: Real;
    procedure SetCRMWordDocID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    DM: TCRMWORD_DM;
    property CRMWordDocID: Real write SetCRMWordDocID;
  end;

procedure DoDocProperties(ACRMWordDocID: Real);

implementation

{$R *.DFM}
{ TForm1 }

uses
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager;

procedure DoDocProperties( ACRMWordDocID: Real);
var
  FrmCRMWordDocProperties: TFrmCRMWordDocProperties;
begin
  FrmCRMWordDocProperties := TFrmCRMWordDocProperties.Create(uniGUIApplication.UniApplication);
  FrmCRMWordDocProperties.ShowModal;
end;

procedure TFrmCRMWordDocProperties.FormCreate(Sender: TObject);
begin
  if FCRMWordDocID = 0 then
    ABORT;
  DM := TCRMWORD_DM.Create(Self);
  DM.Name := '';
  DM.TblCRMWordDoc.Open;

  if not DM.TblCRMWordDoc.Locate('ID', FCRMWordDocID, []) then
    raise Exception.Create
      (crm_rscstr.cTXT0000786 { 'Could not find document properties' } );

  // Custom controls
  cmbDataset.SendToBack;
  cmbDataset.Visible := FALSE;
  cmbFileName.SendToBack;
  cmbFileName.Visible := FALSE;
  { TODO -oSanketG -cWC : Need to revisit,
  [dcc32 Error] crmword_prop.pas(109): E2010 Incompatible types: 'TForm' and 'TFrmCRMWordDocProperties' }
  //CenterForm(Self); // iqctrl; must be called before IQRegFormRead()
end;

procedure TFrmCRMWordDocProperties.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmCRMWordDocProperties.SetCRMWordDocID(const Value: Real);
begin
  FCRMWordDocID := Value;
end;

procedure TFrmCRMWordDocProperties.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
    DM.TblCRMWordDoc.Post;

  IQRegFormWrite(Self, [Self]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmCRMWordDocProperties.dbeNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not(DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
    DM.TblCRMWordDoc.Edit;
end;

procedure TFrmCRMWordDocProperties.dbeDescripKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not(DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
    DM.TblCRMWordDoc.Edit;
end;

procedure TFrmCRMWordDocProperties.wwDataInspector1Items3EditButtonClick
  (Sender: TwwDataInspector; Item: TwwInspectorItem);
var
  AFileName: String;
begin
  // Opens doc in MS Word
  AFileName := DM.TblCRMWordDocFILENAME.AsString;
  if FileExists(AFileName) then
    ExecuteProgram(AFileName, SW_SHOWDEFAULT, '')
  else
    raise Exception.Create(crm_rscstr.cTXT0000122 { 'Cannot find file.' } );
end;

procedure TFrmCRMWordDocProperties.EditMergeDocument1Click(Sender: TObject);
var
  AFileName: String;
begin
  // Opens doc in MS Word
  AFileName := DM.TblCRMWordDocFILENAME.AsString;
  if FileExists(AFileName) then
    ExecuteProgram(AFileName, SW_SHOWDEFAULT, '')
  else if IQConfirmYN
    (crm_rscstr.
    cTXT0000787 { 'Could not find the file.  Do you want to find the file yourself?' } )
    = TRUE then
    with OpenDialog do
      if Execute then
      begin
        ExecuteCommandFmt
          ('update crm_word_doc set filename = ''%s'' where id = %.0f',
          [FileName, DM.TblCRMWordDocID.AsFloat]);
        DM.TblCRMWordDoc.Refresh;
        ExecuteProgram(AFileName, SW_SHOWDEFAULT, '');
      end;
end;

end.
