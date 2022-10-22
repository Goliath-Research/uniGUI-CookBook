unit TrNewLoc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Psnewloc,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Trans_Share,
  vcl.Wwdbdatetimepicker,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  IQMS.WebVcl.SecurityRegister, uniDateTimePicker, uniDBDateTimePicker,
  uniComboBox, uniDBComboBox, uniEdit, uniLabel, uniPanel, Vcl.Forms,
  uniStatusBar;

type
  { TNewLocationParamsIn }
  TNewLocationParamsIn = packed record
    ArinvtID: Real;
    DivisionID: Real;
    WorkorderID: Real;
    LocationID: Real;
    LocationDescription: string;
    LotNumber: string;
    RECEIVING_UD_LOT_NUM: string; // = 'N'
    VendorPrefix: string;
    POReceiptsID: Real;
    VendorID: Real;
    MakeToOrderDetailID: Real;
    procedure Clear;
  end;

  { TNewLocationParamsOut }
  TNewLocationParamsOut = packed record
    FGMultiID: Real;
    LotNumber: string;
    Country: string;
    ExpiryDate: TDateTime;
    procedure Clear;
  end;

  { TFrmTranNewLocation }
  TFrmTranNewLocation = class(TFrmNewLocation)
    SrcStandard: TDataSource;
    QryStandard: TFDQuery;
    QryStandardID: TBCDField;
    QryStandardMFGNO: TStringField;
    PkMfg: TIQWebHPick;
    PkMfgMFGNO: TStringField;
    PkMfgITEMNO: TStringField;
    PkMfgREV: TStringField;
    PkMfgDESCRIP: TStringField;
    PkMfgCOMPANY: TStringField;
    PkMfgID: TBCDField;
    PkMfgMFG_TYPE: TStringField;
    PkMfgDESCRIP2: TStringField;
    wwQryLocationsNON_CONFORM: TStringField;
    wwQryLocationsSHIP_DEFAULT: TStringField;
    GroupBox1: TUniGroupBox;
    sbtnPickMFG: TUniSpeedButton;
    chkMfg: TUniCheckBox;
    chkDefault: TUniCheckBox;
    lookupMfg: TUniDBLookupComboBox;
    procedure BtnOkClick(Sender: TObject);
    procedure sbtnPickMFGClick(Sender: TObject);
    procedure chkMfgClick(Sender: TObject);
    procedure SrcStandardDataChange(Sender: TObject; Field: TField);
    procedure sbtnFgLotNoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FWorkorder_ID: Real;
    FParamsIn: TNewLocationParamsIn;
    function GetLocationDescription: string;
    procedure SetLocationDescription(const Value: string);
    function GetLotNumber: string;
    procedure SetLotNumber(const Value: string);
    procedure SetParamsIn(const Value: TNewLocationParamsIn);
  protected
    FFGMulti_ID : Real;
    FStandard_ID: Real;
    FFGMulti_CUser1: string;
    FMakeToOrderDetailID: Real;
    function GetArinvtID: Real; override;
    function GetContainerNumber:String; virtual;
    procedure Validate;
    procedure Append_To_FGMulti;
    procedure Assign_Dispo_Designators;
  public
    { Public declarations }
    property Workorder_ID: Real read FWorkorder_ID write FWorkorder_ID;  // declared in ancestor TFrmNewLocation
    property ParamsIn : TNewLocationParamsIn write SetParamsIn;
    class function DoShowModal(AParamsIn: TNewLocationParamsIn;
      var AParamsOut: TNewLocationParamsOut): Boolean;

    property LocationDescription: string read GetLocationDescription write SetLocationDescription;
    property LotNumber: string read GetLotNumber write SetLotNumber;
    property FGMultiID: Real read FFGMulti_ID;
    property StandardID: Real read FStandard_ID;
    property MakeToOrderDetailID: Real read FMakeToOrderDetailID;
  end;

function CreateTranNewLocation( nArInvtId: Real; var AFGMulti_ID: Real; ADivision_ID: Real = 0; ALoc_Desc: string = ''; ALotNo: string = '' ):Boolean;
function CreateTranNewLocationEX( nArInvtId: Real; var AFGMulti_ID: Real; ADivision_ID: Real = 0; ALoc_Desc: string = ''; ALotNo: string = '' ):TModalResult;

implementation

{$R *.DFM}

uses
  UniGUIApplication,
  ConfAloc,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.SysShare,
  trans_master_loc_non_conf_dispo_designated_chk;


function CreateTranNewLocation( nArInvtId: Real; var AFGMulti_ID: Real;
  ADivision_ID: Real = 0; ALoc_Desc: string = ''; ALotNo: string = '' ):Boolean;
var
  LFrmTranNewLocation : TFrmTranNewLocation;
  AParamsIn: TNewLocationParamsIn;
begin
  AParamsIn.Clear;
  AParamsIn.ArinvtID := nArInvtId;
  AParamsIn.DivisionID := ADivision_ID;
  AParamsIn.LocationDescription := ALoc_Desc;
  AParamsIn.LotNumber := ALotNo;
  LFrmTranNewLocation :=  TFrmTranNewLocation.Create( UniGUIApplication.UniApplication );
  with LFrmTranNewLocation do
  begin
    ParamsIn := AParamsIn;
    if ALotNo > '' then
       EditLotNo.Text:= ALotNo;

  { TODO : TUniDBLookupComboBox has no member LookupValue and PerformSearch }
   { if ALoc_Desc > '' then
    begin
       CmbLocations.LookupValue:= ALoc_Desc;
       CmbLocations.PerformSearch;
    end;   }

    Result:= ShowModal = mrOK;

    if Result then
       AFGMulti_ID:= FFGMulti_ID;
  end;
end;

function CreateTranNewLocationEx( nArInvtId: Real;
  var AFGMulti_ID: Real; ADivision_ID: Real = 0; ALoc_Desc: string = '';
  ALotNo: string = '' ): TModalResult;
var
  AParamsIn: TNewLocationParamsIn;
  AParamsOut: TNewLocationParamsOut;
begin
  AParamsIn.Clear;
  AParamsIn.ArinvtID := nArInvtId;
  AParamsIn.DivisionID := ADivision_ID;
  AParamsIn.LocationDescription := ALoc_Desc;
  AParamsIn.LotNumber := ALotNo;
  AParamsOut.Clear;
  if TFrmTranNewLocation.DoShowModal( AParamsIn, {var} AParamsOut) then
  begin
    Result := mrOk;
    AFGMulti_ID := AParamsOut.FGMultiID;
  end;
end;

{$REGION 'Params records'}

{ TNewLocationParamsIn }

procedure TNewLocationParamsIn.Clear;
begin
  inherited;
  ArinvtID := 0;
  DivisionID := 0;
  WorkorderID := 0;
  LocationID := 0;
  LocationDescription := '';
  LotNumber := '';
  RECEIVING_UD_LOT_NUM := 'N';
  VendorPrefix := '';
  POReceiptsID := 0;
  VendorID := 0;
  MakeToOrderDetailID:= 0;
end;

{ TNewLocationParamsOut }

procedure TNewLocationParamsOut.Clear;
begin
  FGMultiID := 0;
  LotNumber := '';
  Country := '';
  ExpiryDate := 0;
end;

{$ENDREGION 'Params records'}

class function TFrmTranNewLocation.DoShowModal(AParamsIn: TNewLocationParamsIn; var AParamsOut: TNewLocationParamsOut): Boolean;
var
  LFrmTranNewLocation : TFrmTranNewLocation;
begin
  LFrmTranNewLocation := TFrmTranNewLocation.Create( UniGUIApplication.UniApplication );
  with LFrmTranNewLocation do
  begin
    ParamsIn := AParamsIn;
    if AParamsIn.LotNumber > '' then
      LotNumber := AParamsIn.LotNumber;
    if AParamsIn.LocationDescription > '' then
      LocationDescription := AParamsIn.LocationDescription;
    Workorder_ID:= AParamsIn.WorkorderID;

    Result := ShowModal = mrOk;

    if Result then
      begin
       AParamsOut.FGMultiID := FGMultiID;
       AParamsOut.LotNumber := LotNumber;
       AParamsOut.ExpiryDate := wwDBDateTimePickerLotExpiry.DateTime;
      end;
  end;
end;

procedure TFrmTranNewLocation.FormShow(Sender: TObject);
begin
  inherited;
  FStandard_ID   := 0;
  FFGMulti_CUser1:= '';
  FMakeToOrderDetailID:= FParamsIn.MakeToOrderDetailID;
  IQMS.Common.Controls.ResizeCheckBoxes(Self,GroupBox1);
  { TODO : TUniDBLookupComboBox has no member Selected }
 // with cmbLocations do CheckReplaceDivisionOfWWSelected( Selected );  {sys_share}

  chkMfgClick( NIL );
end;

procedure TFrmTranNewLocation.sbtnPickMFGClick(Sender: TObject);
begin
  inherited; {nothing}
  with PkMfg do
    if Execute then
    begin
      // lookupMfg.KeyValue:= GetValue('ID');
      { TODO : TUniDBLookupComboBox has no member LookupValue and PerformSearch }
     { lookupMfg.LookupValue:= GetValue('ID');
      lookupMfg.PerformSearch;  }
      FStandard_ID:= GetValue('ID');
    end;
end;

procedure TFrmTranNewLocation.chkMfgClick(Sender: TObject);
begin
  inherited; {nothing}
  IQEnableControl( lookupMfg, chkMfg.Checked );
  IQEnableControl( sbtnPickMFG, chkMfg.Checked );
end;

procedure TFrmTranNewLocation.BtnOkClick(Sender: TObject);
begin
  // inherited - { overwrite default behaviour }
  BtnOk.SetFocus;  {get focus away from drop down box or will get cannot focus invisible window}
  Validate;
  Append_To_FGMulti;
  Assign_Dispo_Designators;
  ModalResult:= mrOK;
end;

procedure TFrmTranNewLocation.Assign_Dispo_Designators;
begin
  if chkMfg.Checked then
  begin
    ExecuteCommandFmt('update fgmulti set auto_dispo_standard_id = %f where id = %f', [ FStandard_ID, FFGMulti_ID ]);
    ExecuteCommandFmt('insert into fgmulti_dispo_bom( standard_id, fgmulti_id) values(%f, %f)', [ FStandard_ID, FFGMulti_ID ]);
  end;

  if chkDefault.Checked then
    ExecuteCommandFmt('update fgmulti set auto_dispo_default_loc = ''Y'' where id = %f', [ FFGMulti_ID ]);
end;

procedure TFrmTranNewLocation.Append_To_FGMulti;
var
  ALocID        : Real;
//  AReason_ID    : Real;
//  AReason_ID_Str: string;
  AMake_To_Order_Detail_ID: Real;
begin
  ALocID := FLocation_ID;
  if ALocID = 0 then    {s/n happen}
     ALocID := SelectValueFmtAsFloat('select id from v_locations where loc_desc = ''%s''', [UpperCase(CmbLocations.Text)]);

  if ALocID = 0 then
  begin
    ALocID := GetNextID('LOCATIONS');
    ExecuteCommandFmt('insert into locations(id, loc_desc) values (%f, ''%s'')', [ALocID, UpperCase(CmbLocations.Text)]);
  end;

  if (chkMfg.Checked or chkDefault.Checked) then
     CheckMasterLocationNonConformDispoDesignated( ALocID ); // trans_master_loc_non_conf_dispo_designated_chk.pas

     (*This is now done after the transaction is posted so that
       new Non-Conform locations will prompt for MRB.
       Per EIQ-11508 Inventory Locations and Transactions – Master Non Conform
                     location not prompting for MRB to be created*)
//  if SelectValueFmtAsString('select non_conform from locations where id = %f', [ ALocID ]) = 'Y' then
//     if not DoGetReasonID( self, AReason_ID, CONFORM ) then
//        ABORT;
//
//  AReason_ID_Str:= IIf( AReason_ID = 0, 'NULL', FloatToStr( AReason_ID ));

  FFGMulti_ID:= GetNextID( 'FGMULTI' );
  ExecuteCommandFmt(
    'insert into fgmulti(id, arinvt_id, loc_id, lotno, cuser1, containerno, make_to_order_detail_id ) '+
    'values(%f, %f, %f, ''%s'', ''%s'', ''%s'', %s)',
    [FGMultiID,
     ArinvtID,
     ALocID,
     FixStr(Uppercase(EditLotNo.Text)),
     IQMS.Common.StringUtils.FixStr(FFGMulti_CUser1),
     StrTran(GetContainerNumber, '''', ''''''),
     IQMS.Common.StringUtils.FloatToStr0asNull(FMakeToOrderDetailID, 'null')]);

  self.CheckUpdateLotExpiryDate( FArinvtID {arinvt_id}, FixStr(Uppercase(EditLotNo.Text)));

  trans_share.CheckPropagateMTO( FWorkorder_ID, FFGMulti_ID );
end;

procedure TFrmTranNewLocation.SrcStandardDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;  {nothing}
  FStandard_ID:= QryStandard.FieldByName('ID').asFloat;
end;

procedure TFrmTranNewLocation.Validate;
begin
  if Trim(CmbLocations.Text) = '' then
     raise Exception.Create('Location is empty');

  if chkMfg.Checked and (FStandard_ID = 0) then
     raise Exception.Create('No Mfg# is selected');

  self.CheckLotDateExpiryAssigned;
end;

function TFrmTranNewLocation.GetArinvtID: Real;
begin
  Result:= FArinvtID;
end;


procedure TFrmTranNewLocation.sbtnFgLotNoClick(Sender: TObject);
begin
  inherited;
  // Force inheritance
end;

function TFrmTranNewLocation.GetContainerNumber:String;
begin
  Result := '';
end;



function TFrmTranNewLocation.GetLocationDescription: string;
begin
{ TODO : TUniDBLookupComboBox has no member LookupValue }
 // Result := CmbLocations.LookupValue;
end;

procedure TFrmTranNewLocation.SetLocationDescription(const Value: string);
begin
  if Value > '' then
    begin
    { TODO : TUniDBLookupComboBox has no member LookupValue and PerformSearch }
     { CmbLocations.LookupValue:= Value;
      CmbLocations.PerformSearch;  }
    end
  else CmbLocations.Clear;
end;

function TFrmTranNewLocation.GetLotNumber: string;
begin
  Result := Trim(EditLotNo.Text);
end;

procedure TFrmTranNewLocation.SetLotNumber(const Value: string);
begin
  if Value > '' then
    EditLotNo.Text:= Trim(Value)
  else
    EditLotNo.Clear;
end;

procedure TFrmTranNewLocation.SetParamsIn(const Value: TNewLocationParamsIn);
begin
  FParamsIn := Value;
end;

end.
