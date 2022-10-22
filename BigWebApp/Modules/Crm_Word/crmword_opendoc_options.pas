unit crmword_opendoc_options;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniCheckBox,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniComboBox, uniDBComboBox, uniRadioGroup;

type
  TFilterOption = (uoFilter, uoUpdate);
  TFilterOptions = set of TFilterOption;

  TFrmCrmWordOpenDocOptions = class(TUniForm)
    PnlOptions: TUniPanel;
    PnlButtons: TUniPanel;
    Panel1: TUniPanel;
    PnlCheckboxes: TUniPanel;
    rgUpdateOptions: TUniRadioGroup;
    Bevel1: TUniPanel;
    SrcCampaign: TDataSource;
    QryCampaign: TFDQuery;
    QryCampaignCAMPAIGN_NO: TStringField;
    QryCampaignCODE: TStringField;
    QryCampaignDESCRIPTION: TStringField;
    QryCampaignID: TFMTBCDField;
    chkAssocCampaign: TUniCheckBox;
    Label19: TUniLabel;
    Label11: TUniLabel;
    cmbCampaign: TUniDBLookupComboBox;
    dbeCampaignCode: TUniDBEdit;
    dbeCampaignDescription: TUniDBEdit;
    Label32: TUniLabel;
    Panel2: TUniPanel;
    btnCancel: TUniBitBtn;
    btnOk: TUniBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbCampaignCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FCRMWordDocID: Real;
    FHasSelectionCriteria: Boolean;
    procedure SetOptionsText;
    function GetOptions: TFilterOptions;
    procedure GetCampaignID;
    procedure SetCampaignID;
    procedure SetCRMWordDocID(const Value: Real);
  public
    { Public declarations }
    property CRMWordDocID: Real write SetCRMWordDocID;
  end;

function DoMailMergeOpenWordDocOptions(
  ACRMWordDocID: Real;
  var AOptions: TFilterOptions;
  var ACampaignID: Int64): Boolean;

//var
//FrmCrmWordOpenDocOptions: TFrmCrmWordOpenDocOptions;

implementation

{$R *.DFM}


uses
  crm_rscstr,
  crmword_share,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

function DoMailMergeOpenWordDocOptions(
  ACRMWordDocID: Real;
  var AOptions: TFilterOptions;
  var ACampaignID: Int64): Boolean;
var
  FrmCrmWordOpenDocOptions: TFrmCrmWordOpenDocOptions;
begin
  ACampaignID := 0;
  FrmCrmWordOpenDocOptions := TFrmCrmWordOpenDocOptions.Create(uniGUIApplication.UniApplication);
  with FrmCrmWordOpenDocOptions do
  begin
    try
      CRMWordDocID := ACRMWordDocID;
      FHasSelectionCriteria := HasSelectionCriteria(ACRMWordDocID); //crmword_share.pas
      Result := ShowModal = mrOk;
      if Result then
      begin
        AOptions := GetOptions;
        if chkAssocCampaign.Checked then
          ACampaignID := QryCampaignID.AsLargeInt;
        Result := True;
      end;
    finally
      //Release;
    end;
  end;
end;


procedure TFrmCrmWordOpenDocOptions.UniFormShow(Sender: TObject);
begin
  SetOptionsText;
  ReOpen(QryCampaign);
  GetCampaignID;
end;

procedure TFrmCrmWordOpenDocOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SetCampaignID;
  if FHasSelectionCriteria then
    IQRegIntegerScalarWrite(Self, 'rgUpdateOptions1', rgUpdateOptions.ItemIndex)
  else
    IQRegIntegerScalarWrite(Self, 'rgUpdateOptions2', rgUpdateOptions.ItemIndex);
end;

function TFrmCrmWordOpenDocOptions.GetOptions: TFilterOptions;
begin
  Result := [];

  if FHasSelectionCriteria then
    case rgUpdateOptions.ItemIndex of
      0:
        Result := Result + [uoFilter];
      1:
        Result := Result + [uoUpdate];
      2:
        Result := [];
    end
  else
    case rgUpdateOptions.ItemIndex of
      0:
        Result := Result + [uoUpdate];
      1:
        Result := [];
    end;

end;

procedure TFrmCrmWordOpenDocOptions.SetOptionsText;
var
  i: Integer;
begin
  if FHasSelectionCriteria then
  begin
    rgUpdateOptions.Items.Clear;
    //crm_rscstr.cTXT0000789 = 'Modify filter and update the merge data';
    rgUpdateOptions.Items.Add(crm_rscstr.cTXT0000789);
    //crm_rscstr.cTXT0000790 = 'Update the merge data using previous filter';
    rgUpdateOptions.Items.Add(crm_rscstr.cTXT0000790);
    //crm_rscstr.cTXT0000792 = 'Update the merge data';
    rgUpdateOptions.Items.Add(crm_rscstr.cTXT0000792);
    i := 0;
    IQRegIntegerScalarRead(Self, 'rgUpdateOptions1', i);
    rgUpdateOptions.ItemIndex := i;
  end
  else
  begin
    rgUpdateOptions.Items.Clear;
    //crm_rscstr.cTXT0000791 = 'Update the merge data';
    rgUpdateOptions.Items.Add(crm_rscstr.cTXT0000791);
    //crm_rscstr.cTXT0000792 = 'Do not update data';
    rgUpdateOptions.Items.Add(crm_rscstr.cTXT0000792);
    i := 0;
    IQRegIntegerScalarRead(Self, 'rgUpdateOptions2', i);
    rgUpdateOptions.ItemIndex := i;
  end;
end;

procedure TFrmCrmWordOpenDocOptions.cmbCampaignCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  Application.ProcessMessages;
  chkAssocCampaign.Checked := QryCampaignID.AsLargeInt > 0;
end;

procedure TFrmCrmWordOpenDocOptions.GetCampaignID;
var
  AID: Int64;
begin
  AID := SelectValueFmtAsInt64(
    'SELECT campaign_id FROM crm_word_doc WHERE id = %.0f',
    [FCRMWordDocID]);
  if AID > 0 then
  begin
    QryCampaign.Locate('ID', AID, []);
    { TODO -oSanketG -cWC : Need to find alternative for LookupValue, PerformSearch in TUniDBLookupComboBox}
    {cmbCampaign.LookupValue := QryCampaignCAMPAIGN_NO.AsString;
    cmbCampaign.PerformSearch;}
    chkAssocCampaign.Checked := QryCampaignID.AsLargeInt > 0;
  end;
end;

procedure TFrmCrmWordOpenDocOptions.SetCampaignID;
begin
  if chkAssocCampaign.Checked and
    (QryCampaignID.AsLargeInt > 0) then
    ExecuteCommandFmt(
      'UPDATE crm_word_doc SET campaign_id = %d WHERE id = %.0f',
      [QryCampaignID.AsLargeInt, FCRMWordDocID])
  else
    ExecuteCommandFmt(
      'UPDATE crm_word_doc SET campaign_id = NULL WHERE id = %d',
      [QryCampaignID.AsLargeInt]);
end;

procedure TFrmCrmWordOpenDocOptions.SetCRMWordDocID(const Value: Real);
begin
  FCRMWordDocID := Value;
end;

end.
