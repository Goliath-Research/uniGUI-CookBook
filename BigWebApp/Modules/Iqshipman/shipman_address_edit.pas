unit shipman_address_edit;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Mask,
  IQMS.Common.JumpConstants,
  FireDAC.Stan.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniDBComboBox;

type
  TRequiredFields = (rfNone, rfPhone, rfPhoneContact, rfBothIfIntl);

  TFrmShipManAddrError = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlPrompt: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    lblPrompt: TUniLabel;
    sbAddress: TUniScrollBox;
    PnlDBEditControls: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLabels: TUniPanel;
    lblPackslipno: TUniLabel;
    lblCompany: TUniLabel;
    lblAddr1: TUniLabel;
    lblAddr2: TUniLabel;
    lblAddr3: TUniLabel;
    lblCity: TUniLabel;
    lblState: TUniLabel;
    lblZip: TUniLabel;
    lblCountry: TUniLabel;
    lblTelephone: TUniLabel;
    PnlEditBoxes: TUniPanel;
    sbtnLookupZipCode: TUniSpeedButton;
    dbePackslipno: TUniDBEdit;
    dbeCompany: TUniDBEdit;
    dbeAddr1: TUniDBEdit;
    dbeAddr2: TUniDBEdit;
    dbeAddr3: TUniDBEdit;
    dbeCity: TUniDBEdit;
    dbeZip: TUniDBEdit;
    cmbCountry: TUniDBComboBox;
    cmbState: TUniDBComboBox;
    dbeTelephone: TUniDBEdit;
    lblContact: TUniLabel;
    dbeContact: TUniDBEdit;
    pnlFields: TUniPanel;
    qryShipment: TFDQuery;
    srcShipments: TDataSource;
    qryShipmentSOURCE_ID: TFMTBCDField;
    qryShipmentSOURCE: TStringField;
    qryShipmentPACKSLIPNO: TStringField;
    qryShipmentSHIP_TO_ATTN: TStringField;
    qryShipmentSHIP_TO_ADDR1: TStringField;
    qryShipmentSHIP_TO_ADDR2: TStringField;
    qryShipmentSHIP_TO_ADDR3: TStringField;
    qryShipmentSHIP_TO_CITY: TStringField;
    qryShipmentSHIP_TO_STATE: TStringField;
    qryShipmentSHIP_TO_COUNTRY: TStringField;
    qryShipmentSHIP_TO_COUNTRY_CODE: TStringField;
    qryShipmentSHIP_TO_ZIP: TStringField;
    qryShipmentSHIP_TO_PHONE_NUMBER: TStringField;
    qryShipmentSHIP_TO_PRIME_CONTACT: TStringField;
    qryShipmentSHIP_RESIDENTIAL: TStringField;
    qryShipmentSHIP_TO_CONTACT_EMAIL: TStringField;
    lblEmail: TUniLabel;
    dbeEmail: TUniDBEdit;
    qryShipmentDIST_CENTER_ID: TFMTBCDField;
    qryShipmentIGNORE_DIST_CENTER: TStringField;
    qryAddressValidation: TFDQuery;
    UpdateSQLAddressValidation: TFDUpdateSQL;
    srcAddressValidation: TDataSource;
    qryAddressValidationID: TBCDField;
    qryAddressValidationSOURCE: TStringField;
    qryAddressValidationSOURCE_ID: TBCDField;
    qryAddressValidationCLEANSE_HASH: TStringField;
    qryAddressValidationOVERRIDE_HASH: TStringField;
    pnlSuggestedChanges: TUniPanel;
    Splitter2: TUniSplitter;
    lblSuggestedChanges: TUniLabel;
    pnlSugChangeFields: TUniPanel;
    pnlSugChangesButtons: TUniPanel;
    sbtnLeft: TUniSpeedButton;
    cmbSugAddr1: TUniComboBox;
    cmbSugAddr2: TUniComboBox;
    cmbSugCompany: TUniComboBox;
    cmbSugAddr3: TUniComboBox;
    cmbSugCity: TUniComboBox;
    cmbSugState: TUniComboBox;
    cmbSugZip: TUniComboBox;
    cmbSugContact: TUniComboBox;
    procUpdateAddress: TFDStoredProc;
    qryAddressValidationVALIDATED: TStringField;
    procedure TblShipmentsBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnLookupZipCodeClick(Sender: TObject);
    procedure cmbStateDropDown(Sender: TObject);
    procedure TblShipmentsBeforePost(DataSet: TDataSet);
    procedure btnOkClick(Sender: TObject);
    procedure SrcShipmentsDataChange(Sender: TObject; Field: TField);
    procedure qryShipmentBeforeOpen(DataSet: TDataSet);
    procedure qryShipmentAfterPost(DataSet: TDataSet);
    procedure qryShipmentUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure qryAddressValidationNewRecord(DataSet: TDataSet);
    procedure qryAddressValidationBeforePost(DataSet: TDataSet);
    procedure sbtnLeftClick(Sender: TObject);
    procedure DoAddressChange(Sender: TObject);
    //procedure cmbCountryCloseUp(Sender: TUniDBComboBox; Select: Boolean);
    procedure cmbSuggestionChange(Sender: TObject);
    procedure qryAddressValidationAfterPost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure cmbCountryCloseUp(Sender: TObject);
  private
    { Private declarations }
    FSourceID: Real;
    FSource: String;
    FAddressSourceID: Real;
    FAddressSource: String;
    FLoading: Boolean;
    FEditing: Boolean;
    FInvalidZip: Boolean;
    FDistCenter: Boolean;
    FRequiredFields: TRequiredFields;
    FShowPSNum: Boolean;
    FWebValidate: Boolean;
    FAddressNotFound: Boolean;
    FCityStateZipOk: Boolean;
    FCandidateAddresses: Boolean;
    FCleanseHash: String;
    FOverrideHash: String;
    FAddressValidated: String;
    FSuggestionCleansHash: String;
    procedure LoadStateCodes;
    procedure SuggestCountry;
    function ValidateAddress(AShowErrors: Boolean): Boolean;
    procedure SetLabelFonts;
    procedure SetControls;
    procedure IQAfterShowMessage(var Msg: TMessage); message iq_AfterShowMessage;
    function DoWebValidation: Boolean;
    procedure SetSuggestionPanelVisible(AVisible: Boolean);
    procedure InitAddressBox(AAddress: String; AComboBox: TUniComboBox);
    procedure SetSourceID(const Value: Real);
    procedure SetSource(const Value: String);
  public
    { Public declarations }
    property Editing: Boolean read FEditing write FEditing;
    property RequiredFields: TRequiredFields read FRequiredFields write FRequiredFields;
    property ShowPSNum: Boolean read FShowPSNum write FShowPSNum;
    property WebValidate: Boolean read FWebValidate write FWebValidate;
    property SourceID : Real write SetSourceID;
    property Source : String write SetSource;
  end;

  function CheckPackingSlipAddress(ASourceID: Real; ASource: String; ARequiredFields: TRequiredFields = rfNone; AWebValidate: Boolean = false; AShowPSNum: Boolean = true): Boolean;
  function EditPackingSlipAddress(ASourceID: Real; ASource: String; ARequiredFields: TRequiredFields = rfNone; AWebValidate: Boolean = false): Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.FormFocus,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  IQMS.Common.Regional,
  shipman_rscstr,
  shipman_region,
  shipman_common,
  zipcode,
  IQMS.Common.DotNetCOMInterOp;

function CheckPackingSlipAddress(ASourceID: Real; ASource: String; ARequiredFields: TRequiredFields = rfNone; AWebValidate: Boolean = false; AShowPSNum: Boolean = true): Boolean;
var
  LFrmShipManAddrError : TFrmShipManAddrError;
begin
 if ((ASourceID = 0) and not (ASource = 'IQSYS')) then
  if (ASource = 'SHIP_TO') then
    raise Exception.Create('Application Error: Ship To ID not provided.')
  else
    raise Exception.Create('Application Error: Packing Slip ID not provided.');

  LFrmShipManAddrError := TFrmShipManAddrError.Create(UniGuiApplication.UniApplication);
  LFrmShipManAddrError.SourceID := ASourceID;
  LFrmShipManAddrError.Source := ASource;
  LFrmShipManAddrError.RequiredFields := ARequiredFields;
  LFrmShipManAddrError.WebValidate := AWebValidate;
  LFrmShipManAddrError.ShowPSNum := AShowPSNum;
  PostMessage( LFrmShipManAddrError.Handle, iq_AfterShowMessage, 0, 0 );
  if not LFrmShipManAddrError.ValidateAddress(FALSE) then
     begin
      Result := LFrmShipManAddrError.ShowModal = mrOk;
      if (LFrmShipManAddrError.qryShipment.State in [dsEdit, dsInsert]) then
         begin
           if Result then LFrmShipManAddrError.qryShipment.Post
           else LFrmShipManAddrError.qryShipment.Cancel;
         end;
     end
  else Result := TRUE;
end;

function EditPackingSlipAddress(ASourceID: Real; ASource: String; ARequiredFields: TRequiredFields = rfNone; AWebValidate: Boolean = false): Boolean;
var
  LFrmShipManAddrError : TFrmShipManAddrError;
begin
 if ((ASourceID = 0) and not (ASource = 'IQSYS')) then
    raise Exception.Create('Application Error: Packing Slip ID not provided.');

  LFrmShipManAddrError := TFrmShipManAddrError.Create(UniGuiApplication.UniApplication);
  LFrmShipManAddrError.SourceID := ASourceID;
  LFrmShipManAddrError.Source := ASource;
  LFrmShipManAddrError.Editing := True;
  LFrmShipManAddrError.WebValidate := AWebValidate;
  LFrmShipManAddrError.ShowPSNum := True;
  LFrmShipManAddrError.RequiredFields := ARequiredFields;
  Result := LFrmShipManAddrError.ShowModal = mrOk;
  if (LFrmShipManAddrError.qryShipment.State in [dsEdit, dsInsert]) then
     begin
       if Result then
          LFrmShipManAddrError.qryShipment.Post
       else
          LFrmShipManAddrError.qryShipment.Cancel;
     end;
end;


{ TFrmShipManAddrError }

procedure TFrmShipManAddrError.UniFormCreate(Sender: TObject);
begin
  FAddressSourceID := FSourceID;
  FAddressSource := FSource;

  if ((FSourceID = 0) and not (FSource = 'IQSYS')) then
     IQMS.Common.Dialogs.IQWarning('Packing Slip ID not provided.  You cannot make edits to this form.');

  FLoading := true;
  ReOpen(qryShipment);
  ReOpen(qryAddressValidation);
  FDistCenter := false;
  if ((qryShipmentDIST_CENTER_ID.AsFloat > 0) and (qryShipmentIGNORE_DIST_CENTER.AsString <> 'Y')) then
    begin
      FDistCenter := true;
      FAddressSourceID := qryShipmentDIST_CENTER_ID.AsFloat;
      FAddressSource := 'DIST_CENTER';
    end;

  // form
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TForm' and 'TFrmShipManAddrError
  CenterForm(Self);  }
  IQRegFormRead(Self,[Self,PnlLabels]);

  // load list of country codes first
    LoadCountryCodes(cmbCountry); // shipman_region
  // and then try to select a code, if none is already selected
  SuggestCountry;
  // finally, load state codes after country codes
  LoadStateCodes;

  // control fix-up
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlEditBoxes, 8);

  IQMS.Common.Controls.IQShowControl([lblEmail, dbeEmail], ((FSource = 'SHIPMENTS') and not FDistCenter));

  FEditing := False;
  FLoading := False;
end;

procedure TFrmShipManAddrError.DoAddressChange(Sender: TObject);
begin
  if FLoading then EXIT;

  FCleanseHash := '';
  FOverrideHash := '';
  FAddressValidated := '';
end;

procedure TFrmShipManAddrError.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Commenting this line due to Access Violation Error
  sbAddress.VertScrollBar.Position := 0; }
  SetLabelFonts;
  SetControls;
end;

procedure TFrmShipManAddrError.IQAfterShowMessage(var Msg: TMessage);
begin
{ TODO -oGPatil -cWebConvert : ForceFormFocus does not take TUniForm argument
  IQMS.Common.FormFocus.ForceFormFocus(Self);  }
  Self.BringToFront;
end;

procedure TFrmShipManAddrError.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  SetSuggestionPanelVisible(False);
  IQRegFormWrite(Self,[Self,PnlLabels]);
{ TODO -oGPatil -cWebConvert : ClearComboBoxOfObjects does not take TUniDBCustomCombo argument
  ClearComboBoxOfObjects(cmbState);    }
{ TODO -oGPatil -cWebConvert : Method commented in IQMS.Common.Controls
  ClearWwComboBoxOfObjects(cmbCountry); }
{ TODO -oGPatil -cWebConvert : ClearComboBoxOfObjects does not take TUniDBCustomCombo argument
  ClearComboBoxOfObjects(cmbSugState);  }
end;

procedure TFrmShipManAddrError.TblShipmentsBeforeOpen(DataSet: TDataSet);
begin
  with TFDTable(DataSet) do
   begin
     Filter := Format('ID=%.0f',[FSourceID]);
     Filtered := TRUE;
   end;
end;

procedure TFrmShipManAddrError.sbtnLeftClick(Sender: TObject);
begin
  if not (qryShipment.State in [dsEdit, dsInsert]) then
     qryShipment.Edit;
  qryShipmentSHIP_TO_ATTN.AsString := LeftStr(Trim(cmbSugCompany.Text), 60);
  qryShipmentSHIP_TO_PRIME_CONTACT.AsString := LeftStr(Trim(cmbSugContact.Text), 60);
  qryShipmentSHIP_TO_ADDR1.AsString := LeftStr(Trim(cmbSugAddr1.Text), 60);
  qryShipmentSHIP_TO_ADDR2.AsString := LeftStr(Trim(cmbSugAddr2.Text), 60);
  qryShipmentSHIP_TO_ADDR3.AsString := LeftStr(Trim(cmbSugAddr3.Text), 60);
  qryShipmentSHIP_TO_CITY.AsString := LeftStr(Trim(cmbSugCity.Text), 30);
  qryShipmentSHIP_TO_State.AsString := LeftStr(Trim(cmbSugState.Text), 20);
  qryShipmentSHIP_TO_ZIP.AsString := LeftStr(Trim(cmbSugZip.Text), 10);
//  qryShipment.Post;
  FCleanseHash := FSuggestionCleansHash;
  FOverrideHash := '';
//  qryAddressValidationVALIDATED.AsString := 'Y';
//  FAddressNotFound := false;
//  FCityStateZipOk := true;
  SetLabelFonts;
//  qryAddressValidation.Post;
end;

procedure TFrmShipManAddrError.sbtnLookupZipCodeClick(Sender: TObject);
begin
  if (qryShipment.State in [dsEdit, dsInsert]) then
     qryShipment.Post;

  if (qryShipmentSHIP_TO_ZIP.AsString = '') and
     SelectZipCodeDB(qryShipmentSHIP_TO_CITY, qryShipmentSHIP_TO_STATE, qryShipmentSHIP_TO_ZIP,
       qryShipmentSHIP_TO_COUNTRY, TRUE)  then
     SuggestCountry
  else if GetZipCodeDBLookup(qryShipmentSHIP_TO_CITY, qryShipmentSHIP_TO_STATE, qryShipmentSHIP_TO_ZIP,
       qryShipmentSHIP_TO_COUNTRY, TRUE, FALSE ) then // zipcode.pas
     SuggestCountry;
  ReOpen(qryAddressValidation);
end;

//procedure TFrmShipManAddrError.cmbCountryCloseUp(Sender: TUniDBComboBox;
//  Select: Boolean);
//begin
//  if Select then
//    DoAddressChange(Sender);
//end;

procedure TFrmShipManAddrError.cmbCountryCloseUp(Sender: TObject);
begin
//  if Select then
//    DoAddressChange(Sender);
end;

procedure TFrmShipManAddrError.cmbStateDropDown(Sender: TObject);
begin
  LoadStateCodes;
end;

procedure TFrmShipManAddrError.cmbSuggestionChange(Sender: TObject);
begin
  sbtnLeft.Enabled := true;
  FSuggestionCleansHash := '';
end;

procedure TFrmShipManAddrError.LoadStateCodes;
begin
{ TODO -oGPatil -cWebConvert : LoadStateCodes does not take TUniDBCustomCombo argument
    IQMS.Common.Regional.LoadStateCodes(TUniComboBox(cmbState),
     qryShipmentSHIP_TO_COUNTRY_CODE.AsString,
     qryShipmentSHIP_TO_STATE.AsString);  }
end;

procedure TFrmShipManAddrError.qryAddressValidationAfterPost(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmShipManAddrError.qryAddressValidationBeforePost(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'ADDRESS_VALIDATION' );
  qryAddressValidationCLEANSE_HASH.AsString := FCleanseHash;
  qryAddressValidationOVERRIDE_HASH.AsString := FOverrideHash;
  qryAddressValidationVALIDATED.AsString := FAddressValidated;
end;

procedure TFrmShipManAddrError.qryAddressValidationNewRecord(DataSet: TDataSet);
begin
  qryAddressValidationSOURCE.AsString := FSource;
  qryAddressValidationSOURCE_ID.AsFloat := FSourceID;
end;

procedure TFrmShipManAddrError.qryShipmentAfterPost(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
  ReOpen(qryAddressValidation);
  qryAddressValidation.Edit;
  qryAddressValidation.Post;
end;

procedure TFrmShipManAddrError.qryShipmentBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'SOURCE_ID', FAddressSourceID);
  AssignQueryParamValue(DataSet, 'SOURCE', FAddressSource);
end;

procedure TFrmShipManAddrError.qryShipmentUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  case ARequest of
    arUpdate:
       begin
        with procUpdateAddress do
        begin
          ParamByName('v_source').AsString        := FAddressSource;
          ParamByName('v_source_id').asFmtBCD     := FAddressSourceID;
          ParamByName('v_contact').AsString       := qryShipmentSHIP_TO_PRIME_CONTACT.AsString;
          ParamByName('v_attn').AsString          := qryShipmentSHIP_TO_ATTN.AsString;
          ParamByName('v_addr1').AsString         := qryShipmentSHIP_TO_ADDR1.AsString;
          ParamByName('v_addr2').AsString         := qryShipmentSHIP_TO_ADDR2.AsString;
          ParamByName('v_addr3').AsString         := qryShipmentSHIP_TO_ADDR3.AsString;
          ParamByName('v_city').AsString          := qryShipmentSHIP_TO_CITY.AsString;
          ParamByName('v_state').AsString         := qryShipmentSHIP_TO_STATE.AsString;
          ParamByName('v_zip').AsString           := qryShipmentSHIP_TO_ZIP.AsString;
          ParamByName('v_country_code').AsString  := qryShipmentSHIP_TO_COUNTRY_CODE.AsString;
          ParamByName('v_phone').AsString         := qryShipmentSHIP_TO_PHONE_NUMBER.AsString;
          ParamByName('v_email').AsString         := qryShipmentSHIP_TO_CONTACT_EMAIL.AsString;

          ExecProc;
        end;
       end;
  end;
  AAction := eaApplied;
end;

function TFrmShipManAddrError.ValidateAddress(AShowErrors: Boolean): Boolean;
var
   ACode,
   AFirstName, ALastName: String;
   APhoneReqd, AContactReqd: Boolean;
   ACount: Integer;
begin

    ACode := qryShipmentSHIP_TO_COUNTRY_CODE.AsString;
    if ACode = '' then
       ACode := shipman_region.CountryCodeFor(qryShipmentSHIP_TO_COUNTRY.AsString);

  // Country Code is always required
  Result := ((ACode > '') and (ACode <> '000') and (ACode <> '00'));
  if not Result and AShowErrors then
     raise Exception.Create('Invalid country. Please select a country from the list.');
  if not Result then Exit;

  // If US or Canada, then zip code is required
  Result := not (((ACode = 'US') or (ACode = 'CA')) and (Trim(qryShipmentSHIP_TO_ZIP.AsString)=''));

  if not Result and AShowErrors then
     IQError('Postal code is required.');
  if not Result then Exit;

  FInvalidZip := false;
  if (ACode = 'US') and not FWebValidate then
  begin
    ACount:= SelectValueAsInteger('select count(*) from zipcode');
    if (ACount > 0) then
      begin
        ACount := SelectValueFmtAsInteger('select count(*) from zipcode where ''%s'' = zip', [LeftStr(qryShipmentSHIP_TO_ZIP.AsString, 5)]);
        Result := (ACount > 0);
      end;
    FInvalidZip := not Result;
    if not Result and AShowErrors then
       IQError('Postal code is invalid.');
    if not Result then Exit;
  end;

  case FRequiredFields of
    rfNone:
      begin
        APhoneReqd := false;
        AContactReqd := false;
      end;
    rfPhone:
      begin
        APhoneReqd := true;
        AContactReqd := false;
      end;
    rfPhoneContact:
      begin
        APhoneReqd := true;
        AContactReqd := true;
      end;
    rfBothIfIntl:
      if (ACode <> 'US') and (ACode <> '') and (ACode <> '00') then
        begin
          APhoneReqd := true;
          AContactReqd := true;
        end
        else
        begin
          APhoneReqd := false;
          AContactReqd := false;
        end;
  end;


  if (APhoneReqd) then // Telephone number is required
    begin
      Result := (Trim(qryShipmentSHIP_TO_PHONE_NUMBER.AsString) > '');
      if not Result and AShowErrors then
         IQError('Telephone number is required.');
      if not Result then Exit;
    end;

  // State code may be required
  if IQMS.Common.StringUtils.StrInList(ACode, ['US','CA','MX']) then
     begin
       Result := (Trim(qryShipmentSHIP_TO_STATE.AsString) > '');
       if not Result and AShowErrors then
          IQError('State code is required.');
       if not Result then Exit;

         Result := shipman_common.IsStateCodeValid(ACode, qryShipmentSHIP_TO_STATE.AsString);
       if not Result then
          IQError('State code could not be determined from the abbreviation.');

     end;


  // Postal code may be required for other countries
  if (Trim(qryShipmentSHIP_TO_ZIP.AsString)='') and AShowErrors then
     Result := IQMS.Common.Dialogs.IQWarningYN('Postal code may be required.  Do you want to enter a postal code?');

  if (APhoneReqd) then
    begin
        Result := IsTelephoneValid(ACode, qryShipmentSHIP_TO_PHONE_NUMBER.AsString);
      if not Result then
         {'Please check the telephone number.  Telephone ' +
           'numbers should contain 10 numbers for United States and Canadian locations, ' +
           'and 16 numbers for all other countries.'}
         IQError(shipman_rscstr.cTXT000013);
    end;

  // Contact name is required for USPS
  if AContactReqd then
     begin
       lblContact.Font.Style := [fsBold];
        ParseFullName(qryShipmentSHIP_TO_PRIME_CONTACT.AsString, AFirstName, ALastName); // shipman_region.pas
       Result := not (Trim(AFirstName + ALastName)='');
       if not Result then
          IQError('Contact name is required.');
     end;

  if ((Trim(qryShipmentSHIP_TO_ADDR1.AsString) = '') and
      (Trim(qryShipmentSHIP_TO_ADDR2.AsString) = '') and
      (Trim(qryShipmentSHIP_TO_ADDR3.AsString) = '')) then
      begin
        Result := false;
        IQError('At least one address field is required.');
      end;

  if ((IQMS.Common.StringUtils.Occurances('*', Trim(qryShipmentSHIP_TO_ADDR1.AsString)) > 0) or
      (IQMS.Common.StringUtils.Occurances('*', Trim(qryShipmentSHIP_TO_ADDR2.AsString)) > 0) or
      (IQMS.Common.StringUtils.Occurances('*', Trim(qryShipmentSHIP_TO_ADDR3.AsString)) > 0)) then
      begin
        Result := false;
        IQError('Address field cannot contain an asterisk (*).');
      end;
  if (Trim(qryShipmentSHIP_TO_CITY.AsString) = '') then
      begin
        Result := false;
        IQError('City is required.');
      end;

  if (IQMS.Common.StringUtils.Occurances('*', Trim(qryShipmentSHIP_TO_CITY.AsString)) > 0) then
      begin
        Result := false;
        IQError('City field cannot contain an asterisk (*).');
      end;
  if FWebValidate then
    Result := DoWebValidation;
end;

function TFrmShipManAddrError.DoWebValidation: Boolean;
const
  DOTNETDLL = 'IQMS.IQShipman';
  DOTNETCOMTYPE = 'IQMS.IQShipman.AddressValidation';
var
  ADotNetObject: Variant;
  CW: Word;
  h:TPanelMesg;
  AMessage: String;
  ASuggestedChanges: Boolean;
begin

  Result := (qryAddressValidationVALIDATED.AsString = 'Y') or (FAddressValidated = 'Y');
  if Result then EXIT;

  FAddressNotFound := false;
  FCityStateZipOk := true;
  ASuggestedChanges := false;

  DisableFPUExceptions( CW );
  try
    h:= hPleaseWait( 'Validating address. Please Wait...' );
    try
      CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );
      try
        if (IQMS.Common.StringUtils.StrInList(FSource, ['IQSYS', 'EPLANT', 'COMPANY'])) then
          ADotNetObject.Contact := 'CONTACT'
        else
          ADotNetObject.Contact := qryShipmentSHIP_TO_PRIME_CONTACT.AsString;
        ADotNetObject.Attn := qryShipmentSHIP_TO_ATTN.AsString;
        ADotNetObject.Address1 := qryShipmentSHIP_TO_ADDR1.AsString;
        ADotNetObject.Address2 := qryShipmentSHIP_TO_ADDR2.AsString;
        ADotNetObject.Address3 := qryShipmentSHIP_TO_ADDR3.AsString;
        ADotNetObject.City := qryShipmentSHIP_TO_CITY.AsString;
        ADotNetObject.State := qryShipmentSHIP_TO_STATE.AsString;
        ADotNetObject.Zip := qryShipmentSHIP_TO_ZIP.AsString;
        ADotNetObject.CountryCode := qryShipmentSHIP_TO_COUNTRY_CODE.AsString;
        Result := ADotNetObject.Validate(SecurityManager.UserName,
                                  SecurityManager.Password,
                                  IQGetServerName( 'IQ' ));
      finally
        if Assigned( h ) then h.Free;
      end;

      if not Result then
        begin
          IQMS.Common.Dialogs.IQError(ADotNetObject.ErrorMessage);
          EXIT;
        end;
      ASuggestedChanges :=
         (not IQMS.Common.StringUtils.StrInList(FSource, ['IQSYS', 'EPLANT', 'COMPANY']) and
         (Trim(qryShipmentSHIP_TO_PRIME_CONTACT.AsString) <> Trim(ADotNetObject.Contact))) or
         (Trim(qryShipmentSHIP_TO_ATTN.AsString) <> Trim(ADotNetObject.Attn)) or
         (Trim(qryShipmentSHIP_TO_ADDR1.AsString) <> Trim(ADotNetObject.Address1)) or
         (Trim(qryShipmentSHIP_TO_ADDR2.AsString) <> Trim(ADotNetObject.Address2)) or
         (Trim(qryShipmentSHIP_TO_ADDR3.AsString) <> Trim(ADotNetObject.Address3)) or
         (Trim(qryShipmentSHIP_TO_CITY.AsString) <> Trim(ADotNetObject.City)) or
         (Trim(qryShipmentSHIP_TO_STATE.AsString) <> Trim(ADotNetObject.State)) or
         (Trim(qryShipmentSHIP_TO_ZIP.AsString) <> Trim(ADotNetObject.Zip));
      if ASuggestedChanges then
        begin
          SetSuggestionPanelVisible(True);
          InitAddressBox(ADotNetObject.Attn, cmbSugCompany);
          InitAddressBox(ADotNetObject.Contact, cmbSugContact);
          InitAddressBox(ADotNetObject.Address1, cmbSugAddr1);
          InitAddressBox(ADotNetObject.Address2, cmbSugAddr2);
          InitAddressBox(ADotNetObject.Address3, cmbSugAddr3);
          InitAddressBox(ADotNetObject.City, cmbSugCity);
          InitAddressBox(ADotNetObject.State, cmbSugState);
          InitAddressBox(ADotNetObject.Zip, cmbSugZip);
          FCandidateAddresses := ADotNetObject.CandidateAddresses;
          sbtnLeft.Enabled := not FCandidateAddresses;
        end;
      if (ADotNetObject.CityStateZipOk = True) then
      begin
        FCityStateZipOk := true;
        if ADotNetObject.AddressMatch = True then
          begin
            FSuggestionCleansHash := ADotNetObject.CleanseHash;
            if ASuggestedChanges then
              begin
                FOverrideHash := ADotNetObject.OverrideHash;
                FAddressValidated := 'Y';
                Self.Caption := shipman_rscstr.cTXT000096; {'Edit Address'}
                lblPrompt.Caption := shipman_rscstr.cTXT000098; {'The address has been validated with some suggested changes. Hit the left arrow to accept the changes.'}
                Result := false;
              end
            else
              begin
                  FCleanseHash := ADotNetObject.CleanseHash;
                  FAddressValidated := 'Y';
                  if not (qryShipment.State in [dsEdit, dsInsert]) then
                    begin
                      qryAddressValidation.Edit;
                      qryAddressValidation.Post;
                    end;
                  Result := true;
              end;
          end
        else
          begin
            FOverrideHash := ADotNetObject.OverrideHash;
            FAddressValidated := 'Y';
            FAddressNotFound := true;
            IQMS.Common.Dialogs.IQError('City, State, and Postal code matched, but address not found.');
            Result := false;
          end;
//        qryAddressValidation.Post;
      end
        else
          begin
            FAddressNotFound := true;
            FCityStateZipOk := false;
            Result := false;
            IQError('City, State, or Postal code is invalid.');
          end;

    finally
      FreeDNetObject( ADotNetObject );
    end;

  finally
    RestoreFPU( CW );
  end;
end;

procedure TFrmShipManAddrError.InitAddressBox(AAddress: String; AComboBox: TUniComboBox);
var
  AList, AList2: TStringList;
  i: Integer;
begin
  AList := TStringList.Create;
  AList2 := TStringList.Create;
  IQMS.Common.StringUtils.Tokenize(AAddress, ['|'], AList);
  for i := 0 to AList.Count - 1 do
    if not IQMS.Common.StringUtils.StrInList(AList[i], AList2) then
      AList2.Add(AList[i]);

  AComboBox.Items.BeginUpdate;
  AComboBox.Items.Clear;
  AComboBox.Items.AddStrings(AList2);
  AComboBox.Items.EndUpdate;
  if AComboBox.Items.Count > 0 then
    AComboBox.ItemIndex := 0;
end;

procedure TFrmShipManAddrError.TblShipmentsBeforePost(DataSet: TDataSet);
begin
  qryShipmentSHIP_TO_STATE.AsString := Trim(qryShipmentSHIP_TO_STATE.AsString);
  qryShipmentSHIP_TO_ZIP.AsString := Trim(qryShipmentSHIP_TO_ZIP.AsString);
  qryShipmentSHIP_TO_COUNTRY.AsString := Trim(qryShipmentSHIP_TO_COUNTRY.AsString);
end;

procedure TFrmShipManAddrError.SuggestCountry;
var
   ACode, ACountry: String;
   i: Integer;
begin

    // the current country code
    ACode := qryShipmentSHIP_TO_COUNTRY_CODE.AsString;

    // get the country code, if it has not yet been assigned
    if ACode = '' then
       ACode := shipman_region.CountryCodeFor(qryShipmentSHIP_TO_COUNTRY.AsString);

    // if we have a country code, then get the "official" country name for it.
    if ACode > '' then
       ACountry := CountryNameFor(ACode);

    // If a country is found, but it doesn't match what is noted for the country
    // replace it. We only volunteer to replace the country text on this form;
    // we don't change it anywhere else, because the only thing that truly matters
    // to us is the country code.
    if (ACountry > '') and (qryShipmentSHIP_TO_COUNTRY.AsString <> ACountry) then
       begin
         if not (qryShipment.State in [dsEdit, dsInsert]) then
            qryShipment.Edit;
         qryShipmentSHIP_TO_COUNTRY.AsString := ACountry;
         qryShipmentSHIP_TO_COUNTRY_CODE.AsString := ACode;
         qryShipment.Post;
         i := cmbCountry.Items.IndexOf(Format('%s'#9'%s',[ACountry,ACode]));
         cmbCountry.ItemIndex := i;
       end;
    // 12/14/2007 Ensure the text display is not blank
    if (ACountry > '') then
       cmbCountry.Text := ACountry;

end;

procedure TFrmShipManAddrError.btnOkClick(Sender: TObject);
begin
  SetSuggestionPanelVisible(False);
  if ValidateAddress(TRUE) then
     ModalResult := mrOk
  else
    begin
     ModalResult := mrNone;
     SetLabelFonts;
    end;
end;

procedure TFrmShipManAddrError.SetLabelFonts;
  // ---------------------------------------------------------------------------
  procedure _SetFont(ARequired, AHot: Boolean; ALabel: TUniLabel);
  begin
    if not Assigned(ALabel) then Exit;

    // is the value empty, and needing a data?
    ALabel.Font.Color := TColor(IQMS.Common.Numbers.iIIf(ARequired and AHot, clRed, clBlack));

    // is the value required?
    if ARequired then
       ALabel.Font.Style := [fsBold]
    else
       ALabel.Font.Style := [];

  end;
  // ---------------------------------------------------------------------------
var
   ACode: String;
   APhoneReqd, AContactReqd: Boolean;
begin
  if not Self.Showing then Exit;

    // ACode := shipman_region.CountryCodeFor(TblShipmentsSHIP_TO_COUNTRY.AsString);
    ACode := qryShipmentSHIP_TO_COUNTRY_CODE.AsString;
    case FRequiredFields of
      rfNone:
        begin
          APhoneReqd := false;
          AContactReqd := false;
        end;
      rfPhone:
        begin
          APhoneReqd := true;
          AContactReqd := false;
        end;
      rfPhoneContact:
        begin
          APhoneReqd := true;
          AContactReqd := true;
        end;
      rfBothIfIntl:
      if (ACode <> 'US') and (ACode <> '') and (ACode <> '00') then
          begin
            APhoneReqd := true;
            AContactReqd := true;
          end
          else
          begin
            APhoneReqd := false;
            AContactReqd := false;
          end;
    end;

    _SetFont(TRUE, AContactReqd and ((qryShipmentSHIP_TO_PRIME_CONTACT.AsString)=''), lblContact);
    _SetFont(TRUE, (Trim(qryShipmentSHIP_TO_ADDR1.AsString)='') or (FAddressNotFound and FCityStateZipOk), lblAddr1);
    _SetFont(TRUE, (Trim(qryShipmentSHIP_TO_CITY.AsString)='') or (FAddressNotFound and not FCityStateZipOk), lblCity);
    _SetFont(CountryHasState(ACode), (Trim(qryShipmentSHIP_TO_STATE.AsString)='') or (FAddressNotFound and not FCityStateZipOk), lblState);
    _SetFont(TRUE, (Trim(qryShipmentSHIP_TO_ZIP.AsString)='') or FInvalidZip or (FAddressNotFound and not FCityStateZipOk), lblZip);
    _SetFont(TRUE, Trim(qryShipmentSHIP_TO_COUNTRY.AsString)='', lblCountry);
    _SetFont(TRUE, APhoneReqd and ((qryShipmentSHIP_TO_PHONE_NUMBER.AsString)=''), lblTelephone);
end;

procedure TFrmShipManAddrError.SrcShipmentsDataChange(Sender: TObject;
  Field: TField);
begin
  SetLabelFonts;
  SetControls;
end;

procedure TFrmShipManAddrError.SetSource(const Value: String);
begin
  FSource := Value;
end;

procedure TFrmShipManAddrError.SetControls;
var
   ACode: String;
begin
  if not Self.Showing then Exit;

  if (FEditing) then
    begin
      Self.Caption := shipman_rscstr.cTXT000096; {'Edit Address'}
      lblPrompt.Visible := False;
    end
  else
    begin
      Self.Caption := shipman_rscstr.cTXT000097; {'Incomplete Address'}
      lblPrompt.Visible := True;
    end;


  IQMS.Common.Controls.IQShowControl([lblContact,dbeContact, cmbSugContact],
    not IQMS.Common.StringUtils.StrInList(FSource, ['IQSYS', 'EPLANT', 'COMPANY']));

  // ACode := shipman_region.CountryCodeFor(TblShipmentsSHIP_TO_COUNTRY.AsString);

  if ShowPSNum then
    begin
      lblPackslipno.Visible := true;
      dbePackslipno.Visible := true;
    end
  else
    begin
      lblPackslipno.Visible := false;
      dbePackslipno.Visible := false;
    end;

  ACode := qryShipmentSHIP_TO_COUNTRY_CODE.AsString;
  IQMS.Common.Controls.IQEnableControl([lblState,cmbState],IQMS.Common.Regional.CountryHasState(ACode));
//  SuggestCountry;
end;

procedure TFrmShipManAddrError.SetSourceID(const Value: Real);
begin
  FSourceID := Value;
end;

procedure TFrmShipManAddrError.SetSuggestionPanelVisible(AVisible: Boolean);
begin
  if (AVisible and not pnlSuggestedChanges.Visible) then
    begin
      pnlSuggestedChanges.Width := PnlEditBoxes.Width + 33;;
      self.Width := self.Width + PnlEditBoxes.Width + 33;;
    end
  else
    begin
      if (not AVisible and pnlSuggestedChanges.Visible) then
        begin
          self.Width := self.Width - pnlSuggestedChanges.Width;
          pnlSuggestedChanges.Width := 0;
        end;
    end;
  pnlSuggestedChanges.Visible := AVisible;
//  IQMS.Common.Controls.AdjustControlWidthToParentA(PnlEditBoxes, 0);
//  IQMS.Common.Controls.AdjustControlWidthToParentA(pnlSugChangeFields, 0);
end;

end.
