unit PSNewLoc;

//NOTE: This form in Inherited by NewLocat.pas form

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Mask,
  Data.DB,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Wwdbdatetimepicker,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniStatusBar,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniDateTimePicker, uniDBDateTimePicker, uniComboBox, uniDBComboBox;

type
  TFrmNewLocation = class(TUniForm)
    CmbLocations: TUniDBLookupComboBox;
    EditLotNo: TUniEdit;
    Label1: TUniLabel;
    Label2: TUniLabel;
    sbtnLocationList: TUniSpeedButton;
    SR: TIQWebSecurityRegister;
    wwQryLocations: TFDQuery;
    wwQryLocationsLOC_DESC: TStringField;
    wwQryLocationsDIVISION_NAME: TStringField;
    wwQryLocationsDESCRIP: TStringField;
    wwQryLocationsDIVISION_ID: TBCDField;
    wwQryLocationsEPLANT_ID: TBCDField;
    StatusBar1: TUniStatusBar;
    sbtnFgLotNo: TUniSpeedButton;
    wwQryLocationsVMI: TStringField;
    wwQryLocationsTRANSIT: TStringField;
    wwQryLocationsID: TBCDField;
    Label3: TUniLabel;
    edLocation_ID: TUniEdit;
    sbtnPkListLocation: TUniSpeedButton;
    PkLoc: TIQWebHPick;
    PkLocID: TBCDField;
    PkLocLOCATION: TStringField;
    PkLocDESCRIPTION: TStringField;
    PkLocPATH: TBCDField;
    PkLocEPLANT_NAME: TStringField;
    PkLocDIVISION: TStringField;
    Panel1: TUniPanel;
    btnEdit: TUniButton;
    btnOk: TUniButton;
    BtnCancel: TUniButton;
    PkLocPK_HIDE: TStringField;
    PkLocBUILDING: TStringField;
    wwQryLocationsBUILDING: TStringField;
    Label44: TUniLabel;
    EdDiv: TUniEdit;
    PkLocDIVISION_ID: TBCDField;
    pnlData1: TUniPanel;
    pnlData3: TUniPanel;
    pnlData2: TUniPanel;
    lblExpLotDate: TUniLabel;
    wwDBDateTimePickerLotExpiry: TUniDBDateTimePicker;
    sbtnLotExpiryDate: TUniSpeedButton;
    dsLocations: TDataSource;
    dsLoc: TDataSource;
    procedure BtnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnLocationListClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure wwQryLocationsBeforeOpen(DataSet: TDataSet);
    procedure sbtnFgLotNoClick(Sender: TObject);
    procedure CmbLocationsCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnPkListLocationClick(Sender: TObject);
    procedure PkLocBeforeOpen(DataSet: TDataSet);
    procedure sbtnLotExpiryDateClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  strict private
    { Private declarations }
    FOrderDetailID: Real;
    procedure SetLocation_ID(ALocation_ID: Real);
    procedure SetArinvtID(const Value: Real);
  private
    procedure SetDivision_ID(const Value: Real);
  protected
    FArinvtID: Real;
    FWorkorder_ID: Real;
    FIsLotExpiryDateMandatory: Boolean;
    FDivision_ID: Real;
    FLocation_ID: Real;
    FNew_FGMulti_ID: Real;
    FArinvtEPlantID: Real;
    function GetArinvtID: Real; virtual;
    procedure InsertFGMulti(AArinvtID, ALocID: Real;
      const ALotNo: string); virtual;
    procedure LoadLocations; virtual;
    procedure UpdateLocationInfo;
    procedure CheckLotDateExpiryAssigned;
    procedure CheckUpdateLotExpiryDate(AArinvt_ID: Real; ALotNo: string);
  public
    { Public declarations }
    property ArinvtID: Real read GetArinvtID write SetArinvtID;
    property OrderDetailID: Real read FOrderDetailID write FOrderDetailID;
    property DivisionID: Real read FDivision_ID write SetDivision_ID;
  end;

function CreateNewLocation(AOrderDetailID: Real;AArinvtID: Real = 0; ADivisionID: Real = 0): Real;


implementation

{$R *.DFM}

uses
  IQMS.Common.Invmisc,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  //IQSecIns,
  IQMS.Common.StringUtils,
  Location,
  packslip_rscstr;

function CreateNewLocation(AOrderDetailID,
  AArinvtID, ADivisionID: Real): Real;
begin
  Result := 0;
  with TFrmNewLocation.Create(uniGUIApplication.UniApplication) do
    begin
      OrderDetailID := AOrderDetailID;
      ArinvtID := AArinvtID;
      DivisionID := ADivisionID;

      if ShowModal = mrOK then
        Result := FNew_FGMulti_ID;
    end;
end;

{
constructor TFrmNewLocation.Create(AOwner: TComponent; AArinvtID,
  ADivisionID: Real);
begin
  FWorkorder_ID := 0;
  inherited Create(AOwner);
  ArinvtID := AArinvtID;
  DivisionID := ADivisionID;

  LoadLocations;
  IQSetTablesActive(TRUE, self);
end;
}
procedure TFrmNewLocation.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
  LoadLocations;
  IQSetTablesActive(TRUE, self);
  //EnsureSecurityInspectorOnTopOf(self);
end;

procedure TFrmNewLocation.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG{CHM}, iqhtmINVENTORY{HTM} ); {IQMS.Common.HelpHook.pas}
end;

procedure TFrmNewLocation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  IQRegFormWrite(self, [self]);
end;

procedure TFrmNewLocation.LoadLocations;
begin
  ReOpen(wwQryLocations);
end;

procedure TFrmNewLocation.BtnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmNewLocation.btnOkClick(Sender: TObject);
var
  ALocID, AArinvtID: Real;
begin
  CheckLotDateExpiryAssigned;

  if Trim(CmbLocations.Text) = '' then
    raise Exception.Create('Location is empty.');

  ALocID := FLocation_ID;
  if ALocID = 0 then {s/n happen}
    ALocID := SelectValueAsFloat
      (Format('select id from v_locations where loc_desc = ''%s''',
      [UpperCase(CmbLocations.Text)]));

  if ALocID = 0 then
  begin
    ALocID := GetNextID('LOCATIONS');
    ExecuteCommandFmt('insert into locations(id, loc_desc) values (%f, ''%s'')',
      [ALocID, UpperCase(CmbLocations.Text)])
  end;

  AArinvtID := ArinvtID;

  try
    InsertFGMulti(AArinvtID, ALocID, UpperCase(EditLotNo.Text));
    ModalResult := mrOK;
  except
    on E: Exception do
      IQWarning(E.Message + #13 + #13 + 'Record already exists.');
  end;
end;

procedure TFrmNewLocation.InsertFGMulti(AArinvtID, ALocID: Real;
  const ALotNo: string);
begin
  FNew_FGMulti_ID := GetNextID('fgmulti');
  ExecuteCommandFmt(
    'insert into fgmulti(id, arinvt_id, loc_id, lotno) values(%f, %f, %f, ''%s'')',
    [FNew_FGMulti_ID, AArinvtID, ALocID, ALotNo]);
  CheckUpdateLotExpiryDate(AArinvtID, ALotNo);
end;

function TFrmNewLocation.GetArinvtID: Real;
begin
  Result := 0;
  if FArinvtID > 0 then
    Result := FArinvtID;
  if Result = 0 then
    Result := SelectValueFmtAsInt64(
      'select arinvt_id from ord_detail where id = %.0f',
      [OrderDetailID]);
  if Result = 0 then
    Result := SelectValueFmtAsInt64(
      'select arinvt_id from hist_ord_detail where id = %.0f',
      [OrderDetailID]);
end;

procedure TFrmNewLocation.SetArinvtID(const Value: Real);
begin
  FArinvtID := Value;
  FArinvtEPlantID := SelectValueFmtAsInt64(
    'SELECT eplant_id FROM arinvt WHERE id = %.0f',
    [FArinvtID]);

  sbtnFgLotNo.Enabled := SelectValueByID('standard_id', 'arinvt',
    FArinvtID) > 0;

  FIsLotExpiryDateMandatory := (FArinvtID > 0) and
    IQMS.Common.Invmisc.GetIsLotExpiryDateMandatory(FArinvtID);

  pnlData2.Visible := FIsLotExpiryDateMandatory;

end;

procedure TFrmNewLocation.SetDivision_ID(const Value: Real);
begin
  FDivision_ID := Value;
  ReOpen(wwQryLocations);
end;

procedure TFrmNewLocation.sbtnLocationListClick(Sender: TObject);
begin
  DoLocations; {Locaiton.pas}
  LoadLocations;
  if not wwQryLocations.Active then
    wwQryLocations.Open;
end;

procedure TFrmNewLocation.wwQryLocationsBeforeOpen(DataSet: TDataSet);
begin
  // AssignQueryParamValue(DataSet, 'eplant_id', FArinvtEPlantID);

  with DataSet do
  begin
    if Filter > '' then
    begin
      if FDivision_ID > 0 then
        Filter := IQFormat(
          '(%s) and DIVISION_ID <> NULL and DIVISION_ID = %.0f',
          [Filter, FDivision_ID])
      else if FDivision_ID = - 1 then
        Filter := IQFormat('(%s) and DIVISION_ID = NULL', [Filter]);
      Filtered := TRUE;
    end
    else
    begin
      if FDivision_ID > 0 then
      begin
        Filter := IQFormat('DIVISION_ID <> NULL and DIVISION_ID = %.0f',
          [FDivision_ID]);
        Filtered := TRUE;
      end
      else if FDivision_ID = - 1 then
      begin
        Filter := 'DIVISION_ID = NULL';
        Filtered := TRUE;
      end
      else
        Filtered := FALSE;
    end;
    if Filter <> '' then
      StatusBar1.Panels[0].Text := Format('filter: %s', [Filter]);

  end;
end;

procedure TFrmNewLocation.sbtnFgLotNoClick(Sender: TObject);
var
  AID: Real;
begin
  AID := SelectValueByID('standard_id', 'arinvt', ArinvtID);
  EditLotNo.Text := SelectValueFmtAsString
    ('select fg_lotno from standard where id = %f', [AID]);
end;

procedure TFrmNewLocation.CmbLocationsCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  UpdateLocationInfo;
end;

procedure TFrmNewLocation.UniFormCreate(Sender: TObject);
begin
   FWorkorder_ID := 0;
  LoadLocations;
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmNewLocation.UpdateLocationInfo;
begin
  SetLocation_ID(wwQryLocationsID.AsLargeInt);
  if wwQryLocationsDIVISION_ID.AsLargeInt <> 0 then
    EdDiv.Text := SelectValueFmtAsString
      ('select name from division where id = %d',
      [wwQryLocationsDIVISION_ID.AsLargeInt])
  else
    EdDiv.Text := '';
end;

procedure TFrmNewLocation.SetLocation_ID(ALocation_ID: Real);
begin
  FLocation_ID := ALocation_ID;
  edLocation_ID.Text := FloatToStr(FLocation_ID);
end;

procedure TFrmNewLocation.sbtnPkListLocationClick(Sender: TObject);
var
  ADivisionId: Real;
begin
  with PkLoc do
    if Execute then
    begin

      (* TODO -ombaral -cWebIQ : Resolve depemdency
      CmbLocations.LookupValue := GetValue('LOCATION');
      CmbLocations.PerformSearch;
      *)


      ADivisionId := GetValue('DIVISION_ID');
      if ADivisionId <> 0 then
        EdDiv.Text := SelectValueFmtAsString(
        'select name from division where id = %.0f',
        [ADivisionId])
      else
        EdDiv.Text := '';
      SetLocation_ID(GetValue('ID'));
    end;
end;

procedure TFrmNewLocation.PkLocBeforeOpen(DataSet: TDataSet);
begin
  // AssignQueryParamValue(DataSet, 'eplant_id', FArinvtEPlantID);
  AssignQueryParamValue(DataSet, 'division_id', FDivision_ID);
end;

procedure TFrmNewLocation.CheckLotDateExpiryAssigned;
begin
  //02/12/2016 (Byron, EIQ-10769)
  if FIsLotExpiryDateMandatory and (Trim(EditLotNo.Text) > '') and
    (Trunc(wwDBDateTimePickerLotExpiry.DateTime) < 1) then
    //packslip_rscstr.cTXT0000068 = 'Please enter a lot expiration date.';
    raise Exception.Create(packslip_rscstr.cTXT0000068);

  //11-03-2014 future use
  //if not FIsLotExpiryDateMandatory then
  //EXIT;
  //
  // //  'Lot Expiration Date is Mandatory, Missing Lot# - operation aborted';
  //IQAssert( Trim(EditLotNo.Text) > '', packslip_rscstr.cTXT0000059 );
  //
  // // 'Lot Expiration Date is Mandatory - operation aborted';
  //IQAssert( wwDBDateTimePickerLotExpiry.DateTime > 0, packslip_rscstr.cTXT0000058 );
end;

procedure TFrmNewLocation.CheckUpdateLotExpiryDate(AArinvt_ID: Real;
  ALotNo: string);
var
  AArinvt_Lot_Docs_ID: Real;
begin
  if FIsLotExpiryDateMandatory and (ALotNo > '') and
    (Trunc(wwDBDateTimePickerLotExpiry.DateTime) > 0) then
  begin
    AArinvt_Lot_Docs_ID := SelectValueFmtAsInt64(
      'select id from arinvt_lot_docs where arinvt_id = %f and lotno = ''%s''',
      [AArinvt_ID, ALotNo]);
    if AArinvt_Lot_Docs_ID = 0 then //s/n happen
      EXIT;

    ExecuteCommandFmt(
      'update arinvt_lot_docs                                          '#13 +
      '   set expiry_date = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'') '#13 +
      ' where arinvt_id = %f and lotno = ''%s''                        ',
      [FormatDateTime('mm/dd/yyyy hh:nn:ss',
      wwDBDateTimePickerLotExpiry.DateTime),
      AArinvt_ID,
      ALotNo]);
  end;
end;

procedure TFrmNewLocation.sbtnLotExpiryDateClick(Sender: TObject);
var
  ADateTime: TDateTime;
  ALotNo: string;
begin
  ALotNo := FixStr(UpperCase(EditLotNo.Text));
  if (ALotNo = '') then
    EXIT;

  ADateTime := SelectValueFmtAsDateTime(
    'select expiry_date from arinvt_lot_docs ' +
    'where arinvt_id = %f and lotno = ''%s''',
    [ArinvtID,
    ALotNo]);

  wwDBDateTimePickerLotExpiry.DateTime := ADateTime;
end;

end.
