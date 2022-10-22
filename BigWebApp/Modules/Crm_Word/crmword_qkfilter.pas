unit crmword_qkfilter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  dm_crmword,
  Mask,
  MaskUtils,
  Vcl.Wwdatsrc,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniRadioButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmCRMWordQuickFilter = class(TUniForm)
    PnlCarrier: TUniPanel;
    Panel1: TUniPanel;
    PnlGrid: TUniPanel;
    PnlOption: TUniPanel;
    rbCurrentRecord: TUniRadioButton;
    rbSelectionCriteria: TUniRadioButton;
    PnlCurrentRecordDisplay: TUniPanel;
    PnlPrompt: TUniPanel;
    lblPrompt: TUniLabel;
    lblPrinciple: TUniLabel;
    lblPrincipleContact: TUniLabel;
    bvGridSpacer2: TUniPanel;
    bvGridSpacer1: TUniPanel;
    PnlGridInner: TUniPanel;
    PnlToolbar: TUniPanel;
    sbtnClear: TUniSpeedButton;
    sbtnPreview: TUniSpeedButton;
    Bevel1: TUniPanel;
    PnlSelectionCriteriaGrid: TUniPanel;
    GridSelectionCriteria: TIQUniGridControl;
    cmbUniaryOperator: TUniDBComboBox;
    cmbBinaryOperator: TUniDBComboBox;
    lblCurrentContext1: TUniLabel;
    lblCurrentContext2: TUniLabel;
    Panel2: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] crmword_qkfilter.pas(70): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure GridSelectionCriteriaCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);}
    procedure GridSelectionCriteriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnClearClick(Sender: TObject);
    procedure sbtnPreviewClick(Sender: TObject);
    procedure RadioButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FCRMWordDocID: Real;
    FCurrentRecord: Boolean; // Do we show the current record?
    FCurRecSource: String;
    FCurRecSourceID: Real;
    FCurRecContactID: Real;
    procedure SetCRMWordDocID(const Value: Real);
    procedure SetCurRecContactID(const Value: Real);
    procedure SetCurRecSource(const Value: String);
    procedure SetCurRecSourceID(const Value: Real);
    procedure SetCurrentRecord(const Value: Boolean);
  public
    { Public declarations }
    DM: TCRMWORD_DM;
    property CRMWordDocID: Real write SetCRMWordDocID;
    property CurrentRecord: Boolean write SetCurrentRecord; // Do we show the current record?
    property CurRecSource: String write SetCurRecSource;
    property CurRecSourceID: Real write SetCurRecSourceID;
    property CurRecContactID: Real write SetCurRecContactID;
  end;

  // Result of DoQuickFilter:  User has clicked "OK"
  // ACRMWordID, IN: What is the CRM_WORD_DOC.ID that will be displayed?
  // ACurRec variables, IN:  What are the values for "Current Record" if any
  // ACurrentRecord, OUT:  TRUE = User has selected "Current Record"
  // FALSE = Use existing selection criteria
function DoQuickFilter( ACRMWordID: Real;
  ACurRecSource: String; ACurRecSourceID: Real; ACurRecContactID: Real;
  var ACurrentRecord: Boolean): Boolean;

implementation

{$R *.DFM}

uses
  crm_rscstr,
  { TODO -oSanketG -cWC : Need to revisit }
  //crmword_query,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.PrincipalSource;

function DoQuickFilter(ACRMWordID: Real;
  ACurRecSource: String; ACurRecSourceID: Real; ACurRecContactID: Real;
  var ACurrentRecord: Boolean): Boolean;
var
  FrmCRMWordQuickFilter: TFrmCRMWordQuickFilter;
begin
  FrmCRMWordQuickFilter := TFrmCRMWordQuickFilter.Create
    (uniGUIApplication.UniApplication);
  with FrmCRMWordQuickFilter do
  begin
    try
      FCRMWordDocID := ACRMWordID;
      FCurrentRecord := ACurrentRecord;
      FCurRecSource := ACurRecSource;
      FCurRecSourceID := ACurRecSourceID;
      FCurRecContactID := ACurRecContactID;
      FCurrentRecord := ACurrentRecord;
      if (ShowModal = mrOk) then
      begin
        ACurrentRecord := FCurrentRecord;
        Result := TRUE
      end
      else
        Result := FALSE;
    finally
      //Free;
    end;
  end;
end;

{ TFrmCRMWordQuickFilter }

procedure TFrmCRMWordQuickFilter.UniFormCreate(Sender: TObject);
begin
  if Nz(FCRMWordDocID, 0) = 0 then
    raise Exception.Create
      (crm_rscstr.cTXT0000788 { 'Please select a document.' } );

  DM := TCRMWORD_DM.Create(Self);
  DM.Name := '';



  rbCurrentRecord.Checked := FCurrentRecord;
  rbSelectionCriteria.Checked := not FCurrentRecord;
  PnlOption.Visible := FCurrentRecord = TRUE;
  bvGridSpacer1.Visible := PnlOption.Visible;
  bvGridSpacer2.Visible := PnlOption.Visible;

  lblCurrentContext1.Caption :=
    StrTran(IQMS.Common.PrincipalSource.GetShortDisplay(FCurRecSource,
    FCurRecSourceID, 0), '&', '&&');
  lblCurrentContext2.Caption :=
    StrTran(IQMS.Common.PrincipalSource.GetShortDisplay(FCurRecSource,
    FCurRecSourceID, FCurRecContactID), '&', '&&');

  DM.TblCRMWordDoc.Open;
  DM.TblCRMWordCriteria_QK.Open;
  DM.TblCRMWordDoc.Locate('ID', FCRMWordDocID, []);
  { TODO -oSanketG -cWC : Need to revisit ,
  [dcc32 Error] crmword_qkfilter.pas(189): E2010 Incompatible types: 'TForm' and 'TFrmCRMWordQuickFilter'}
  //CenterForm(Self); // iqctrl; must be called before IQRegFormRead()
end;

procedure TFrmCRMWordQuickFilter.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, GridSelectionCriteria]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmCRMWordQuickFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, GridSelectionCriteria]); // IQMS.Common.RegFrm.pas
end;

{ TODO -oSanketG -cWC : Need to revisit ,
[dcc32 Error] crmword_qkfilter.pas(203): E2003 Undeclared identifier: 'GridSelectionCriteriaCalcCellColors'}
(*procedure TFrmCRMWordQuickFilter.GridSelectionCriteriaCalcCellColors
  (Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean;
  AFont: TFont; ABrush: TBrush);
begin
  { Color these fields clWindow }
  if (UpperCase(Field.FieldName) = 'RANGE_START') or
    (UpperCase(Field.FieldName) = 'RANGE_END') then
    if (not Highlight) then
      ABrush.Color := clWindow;

end;*)

procedure TFrmCRMWordQuickFilter.GridSelectionCriteriaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not(GridSelectionCriteria.DataSource.DataSet.State in [dsEdit]) then
    GridSelectionCriteria.DataSource.DataSet.Edit;
end;

procedure TFrmCRMWordQuickFilter.btnOkClick(Sender: TObject);
begin
  if (DM.TblCRMWordCriteria_QK.State in [dsEdit, dsInsert]) then
    DM.TblCRMWordCriteria_QK.Post;
  FCurrentRecord := rbCurrentRecord.Checked;
end;

procedure TFrmCRMWordQuickFilter.sbtnClearClick(Sender: TObject);
begin
  if IQConfirmYNChk
    (crm_rscstr.cTXT0000761 { 'Clear the "To" and "From" values?' } ,
    'CRM Mail Merge Clear Filter') = TRUE then
  begin
    ExecuteCommandFmt('update crm_word_criteria set range_start = null, ' +
      ' range_end = null where crm_word_doc_id = %.0f', [FCRMWordDocID]);
    DM.TblCRMWordCriteria_QK.Refresh;
  end;

end;

procedure TFrmCRMWordQuickFilter.sbtnPreviewClick(Sender: TObject);
begin
  if (DM.TblCRMWordCriteria_QK.State in [dsEdit, dsInsert]) then
    DM.TblCRMWordCriteria_QK.Post;
  { TODO -oSanketG -cWC : Need to revisit , dependent on crmword_query}
  //PreviewSQL(Self, FCRMWordDocID);
end;

procedure TFrmCRMWordQuickFilter.SetCRMWordDocID(const Value: Real);
begin
  FCRMWordDocID := Value;
end;

procedure TFrmCRMWordQuickFilter.SetCurRecContactID(const Value: Real);
begin
  FCurRecContactID := Value;
end;

procedure TFrmCRMWordQuickFilter.SetCurRecSource(const Value: String);
begin
  FCurRecSource := Value;
end;

procedure TFrmCRMWordQuickFilter.SetCurRecSourceID(const Value: Real);
begin
  FCurRecSourceID := Value;
end;

procedure TFrmCRMWordQuickFilter.SetCurrentRecord(const Value: Boolean);
begin
  FCurrentRecord := Value;
end;

procedure TFrmCRMWordQuickFilter.RadioButtonClick(Sender: TObject);
begin
  rbSelectionCriteria.Checked := not rbCurrentRecord.Checked;
  rbCurrentRecord.Checked := not rbSelectionCriteria.Checked;
end;

end.
