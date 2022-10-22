unit IQLMReject;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.PrintLabels.LMBase,
  Vcl.Wwdbdatetimepicker,
  Vcl.wwdblook,
  Data.DB,
  Vcl.wwdatsrc,
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
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UserDefinedLabel,
  Vcl.Controls,
  IQMS.WebVcl.UDComboBox,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniLabel, uniMainMenu, uniSplitter, uniScrollBox, IQUniGrid, uniGUIFrame,
  uniDBNavigator, uniComboBox, uniDBComboBox, uniDateTimePicker,
  uniDBDateTimePicker, uniBitBtn, uniSpeedButton, uniPageControl, uniButton;

type
  TFrmLM_Reject = class(TFrmLM_Base)
    edtArinvtItemno: TUniEdit;
    lblArinvtItemno: TUniLabel;
    edtArinvtDescrip: TUniEdit;
    lblArinvtDescrip: TUniLabel;
    Label9: TUniLabel;
    wwMfgNo: TUniDBLookupComboBox;
    Shape9: TUniPanel;
    lblRejectCode: TUniLabel;
    cmbRejectCode: TUniDBLookupComboBox;
    SrcRejects: TDataSource;
    QryRejectCode: TFDQuery;
    QryRejectCodeREJECT_CODE: TStringField;
    QryRejectCodeATTRIBUTE: TStringField;
    QryRejectCodeEPLANT_ID: TBCDField;
    QryRejectCodeSEQ: TFMTBCDField;
    QryRejectCodeSOURCE: TStringField;
    QryRejectCodeMFGCELL_ID: TBCDField;
    QryRejectCodeID: TBCDField;
    Label2: TUniLabel;
    edtRejectComment: TUniEdit;
    DataSource1: TDataSource;
    procedure QryRejectCodeBeforeOpen(DataSet: TDataSet);
    procedure cmbRejectCodeBeforeDropDown(Sender: TObject);
    procedure wwLabelsBeforeDropDown(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
    function GetRejectCodeID: Real;
    procedure SetRejectCodeID(const Value: Real);
  protected
    { Protected declarations }
    FBom_Mfgcell_ID: Real;
    procedure AssignDefaults; override;
    procedure PopulateArinvtItemInfo;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Id: Real); override;
    property RejectCodeID: Real read GetRejectCodeID write SetRejectCodeID;
  end;

  /// <summary> Wrapper method to print a Reject Label.</summary>
procedure DoPrintRejectLabel(AOwner: TComponent;
  AStandardID, AArinvtID, AWorkCenterID, ARejectCodeID, ARejectQuantity: Real;
  ARejectComment, ALotNumber: string);

var
  FrmLM_Reject: TFrmLM_Reject;

implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.PrintLabels.LabelMatrix,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.ResourceStrings;

procedure DoPrintRejectLabel(AOwner: TComponent;
  AStandardID, AArinvtID, AWorkCenterID, ARejectCodeID, ARejectQuantity: Real;
  ARejectComment, ALotNumber: string);
begin
  // 01/19/2015  IQLMReject.pas
  // EIQ-5664 ShopData -> Menu -> Rejects -> add ability to print a Reject (Non-Serial) label
  with TIQWebLMReject.Create(AOwner) do
    begin
      Standard_ID := AStandardID;
      Arinvt_ID := AArinvtID;
      WorkCenterID := AWorkCenterID;
      RejectCodeID := ARejectCodeID;
      RejectComment := ARejectComment;
      Quantity := ARejectQuantity;
      LotNumber := ALotNumber;
      DisplayModal := True;
      Execute;
    end;
end;

{ TFrmLM_Reject }

constructor TFrmLM_Reject.Create(AOwner: TComponent; Id: Real);
begin
  inherited Create(AOwner, Id);
  Shape9.Top := wwMfgNo.Top + 6;
  Shape9.left := SBNewLabel.left;

  // Hide these controls for this form
  IQMS.Common.Controls.IQShowControl([LblAkaItemno, EdAkaItemno, lblCountryOfOrigin,
    IQUDComboBoxCountryOfOrigin, lblLabelDispositionSetting,
    cmbLabelDispositionSetting], False);
end;

procedure TFrmLM_Reject.AssignDefaults;
var
  nId: Real;
  AStandardID: Real;
begin
  inherited;

  EditLblQty.Text := '1';
  if Owner is TIQWebLMReject then
    begin
      FBom_Mfgcell_ID := SelectValueFmtAsFloat(
        'SELECT mfgcell_id FROM standard WHERE id = %.0f',
        [TIQWebLMReject(self.Owner).Standard_ID]);
      ReOpen(QryRejectCode);
      WorkCenterID := TIQWebLMReject(self.Owner).WorkCenterID;
      RejectCodeID := TIQWebLMReject(self.Owner).RejectCodeID;
      edtRejectComment.Text := TIQWebLMReject(self.Owner).RejectComment;
      self.AssignFGLotNo(TIQWebLMReject(self.Owner).LotNumber);
      EditQty.Text := FloatToStr(TIQWebLMReject(Owner).Quantity)
    end;

  wwMfgNo.ListField := 'MFGNO';
  wwMfgNo.Text := DM.QryMfgNo.FieldByName('MFGNO').asString;

  ReOpen(DM.QryNonSerialLabels);
  DataSource1.DataSet:= DM.QryNonSerialLabels;
  wwLabels.ListSource := DataSource1;
  wwLabels.Text := DM.QryNonSerialLabelsLABEL_MENU_NAME.asString;

  PopulateArinvtItemInfo;
  PopulateAkaItemno;
end;

procedure TFrmLM_Reject.PopulateArinvtItemInfo;
begin
  edtArinvtItemno.Text := TIQWebLMBase(self.Owner).FPart_No;
  edtArinvtDescrip.Text := TIQWebLMBase(self.Owner).FPart_desc;
end;

procedure TFrmLM_Reject.cmbRejectCodeBeforeDropDown(Sender: TObject);
begin
  ReOpen(QryRejectCode);
end;

function TFrmLM_Reject.GetRejectCodeID: Real;
begin
  Result := QryRejectCodeID.AsInteger;
end;

procedure TFrmLM_Reject.SetRejectCodeID(const Value: Real);
begin
  if not QryRejectCode.Active then
    QryRejectCode.Open;
  QryRejectCode.Locate('ID', Value, []);
  cmbRejectCode.DataSource.DataSet.FieldByName(cmbRejectCode.DataField).AsString := QryRejectCodeID.asString;
end;

procedure TFrmLM_Reject.wwLabelsBeforeDropDown(Sender: TObject);
begin
  // inherited;
  if Assigned(wwLabels.ListSource.DataSet) then
    ReOpen(wwLabels.ListSource.DataSet);
end;

procedure TFrmLM_Reject.QryRejectCodeBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'BOM_MFGCELL_ID', FBom_Mfgcell_ID);
  AssignQueryParamValue(DataSet, 'WORK_CENTER_ID', TIQWebLMBase(self.Owner).WorkCenterID);
  AssignQueryParamValue(DataSet, 'STANDARD_ID', TIQWebLMBase(self.Owner).Standard_ID);
end;

procedure TFrmLM_Reject.BtnOkClick(Sender: TObject);
begin
  inherited;

  if Sender <> nil then
    begin
      if FReprintLabel then
        begin
          // IQMS.WebVcl.ResourceStrings.cTXT0000136 =
          // 'Would you like to print another label?'
          if IQConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000136) then
            AssignDefaults
          else
            Close;
        end
      else
        Close;
    end;
end;

end.
