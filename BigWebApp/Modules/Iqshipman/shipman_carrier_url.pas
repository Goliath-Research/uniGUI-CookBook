unit shipman_carrier_url;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  Data.DB,
  shipman_common,
  Vcl.Buttons,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid,
  uniGUIFrame, Vcl.Controls;

type
  TFrmShipManCarrierURL = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    SrcCarrier: TDataSource;
    QryCarrier: TFDQuery;
    QryCarrierID: TBCDField;
    SrcCarrierURL: TDataSource;
    TblCarrierURL: TFDTable;
    TblCarrierURLTYPE: TBCDField;
    TblCarrierURLURL: TStringField;
    TblCarrierURLID: TBCDField;
    TblCarrierURLCARRIER_ID: TBCDField;
    PnlMain: TUniPanel;
    Panel8: TUniPanel;
    GridURL: TIQUniGridControl;
    cmbURLType: TUniDBComboBox;
    Bevel3: TUniPanel;
    Panel6: TUniPanel;
    sbtnClearAll: TUniSpeedButton;
    PURL: TUniPopupMenu;
    PopulateDefaultURLs2: TUniMenuItem;
    PopulateDefaultURLs1: TUniMenuItem;
    N1: TUniMenuItem;
    procedure Close1Click(Sender: TObject);
    procedure QryCarrierBeforeOpen(DataSet: TDataSet);
    procedure PopulateDefaultURLs1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnClearAllClick(Sender: TObject);
    procedure TblCarrierURLBeforePost(DataSet: TDataSet);
    procedure TblCarrierURLNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure SrcCarrierURLDataChange(Sender: TObject; Field: TField);
    procedure TblCarrierURLAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FCarrierID: Real;
    FCarrierType: TCarrierType;
    procedure SetControls;
    procedure SetCarrierID(const Value: Real);
  public
    { Public declarations }
    procedure PopulateDefaultURL;
  published
    { Published declarations }
    property CarrierType: TCarrierType read FCarrierType;
    property CarrierID : Real write SetCarrierID;
  end;

  procedure DoCarrierURL(const ACarrierID: Real);
  procedure PopulateDefaultURL(const ACarrierID: Real);

implementation

{$R *.dfm}

uses
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls;

procedure DoCarrierURL(const ACarrierID: Real);
var
  LFrmShipManCarrierURL : TFrmShipManCarrierURL;
begin
  if ACarrierID > 0 then
    LFrmShipManCarrierURL :=  TFrmShipManCarrierURL.Create(UniGUIApplication.UniApplication);
    LFrmShipManCarrierURL.CarrierID := ACarrierID;
    LFrmShipManCarrierURL.Show;
end;

procedure PopulateDefaultURL(const ACarrierID: Real);
var
  LFrmShipManCarrierURL : TFrmShipManCarrierURL;
begin
  if ACarrierID > 0 then
    LFrmShipManCarrierURL :=  TFrmShipManCarrierURL.Create(UniGUIApplication.UniApplication);
    LFrmShipManCarrierURL.CarrierID := ACarrierID;
     if not (LFrmShipManCarrierURL.CarrierType in [ctUnknown]) then
        LFrmShipManCarrierURL.PopulateDefaultURL;
end;

procedure TFrmShipManCarrierURL.FormCreate(Sender: TObject);
  var
   i: Integer;
   o: TCarrierType;
begin
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TForm' and 'TFrmShipManCarrierURL'
  IQMS.Common.Controls.CenterForm(Self);  }
  cmbURLType.Visible := FALSE;
  // Initialize
  FCarrierType := ctUnknown;
  // Get carrier type
  i := Trunc(SelectValueFmtAsFloat('select type from freight_carrier where id = %.0f',[FCarrierID]));
  FCarrierType := TCarrierType(0);
  if (i in [Ord(Low(o))..Ord(High(o))]) then
     FCarrierType := TCarrierType(i);

  // Open datasets
  ReOpen(QryCarrier);
  ReOpen(TblCarrierURL);
  IQRegFormRead(Self,[Self,GridURL]);

  // Warn if type not specified
  if (FCarrierType = ctUnknown) then
     IQWarning('Cannot populate default URLs.  Carrier Type is unspecified.');
end;

procedure TFrmShipManCarrierURL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self,[Self,GridURL]);
end;

procedure TFrmShipManCarrierURL.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmShipManCarrierURL.QryCarrierBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FCarrierID);
end;

procedure TFrmShipManCarrierURL.PopulateDefaultURLs1Click(Sender: TObject);
begin
  PopulateDefaultURL; // see below
end;

procedure TFrmShipManCarrierURL.PopulateDefaultURL;

  // ---------------------------------------------------------------------------
  procedure _AddURL(AType: TURLType; AURL: String);
  begin
    if SelectValueParam('select id from freight_carrier_url '#13 +
                         'where carrier_id = :CARRIER_ID '#13 +
                         '  and type = :TYPE and url = :URL',
                         ['CARRIER_ID;F', 'TYPE;I', 'URL'],
                         [FCarrierID, Ord(AType), AURL]) = 0 then
       ExecuteCommandParam('insert into freight_carrier_url'#13 +
                         '(id, carrier_id, type, url)'#13 +
                         'values (s_freight_carrier_url.nextval, '#13 +
                         ' :CARRIER_ID, :TYPE, :URL)',
                         ['CARRIER_ID;F', 'TYPE;I', 'URL'],
                         [FCarrierID, Ord(AType), AURL]);
  end;
  // ---------------------------------------------------------------------------

begin

  if FCarrierID = 0 then Exit;


  // Only populate values if the table is empty
  if not (TblCarrierURL.BOF and TblCarrierURL.EOF) then Exit;

  case FCarrierType of
   ctUPS: // UPS
    begin
      if FindCmdLineSwitch('TEST', ['/','-'], TRUE) then
        begin
          _AddURL(utRates,URL_UPS_RATE_TEST);
          _AddURL(utShipment,URL_UPS_SHIP_TEST);
          _AddURL(utAddressValidation,URL_UPS_ADDRESS_TEST);
        end
      else
        begin
          _AddURL(utRates,URL_UPS_RATE);
          _AddURL(utShipment,URL_UPS_SHIP);
          _AddURL(utAddressValidation,URL_UPS_ADDRESS);
        end;
    end;
   ctFedExGround, ctFedExExpress, ctFedExSmartPost: // FedEx
    begin
      if FindCmdLineSwitch('TEST', ['/','-'], TRUE) then
        _AddURL(utAll,URL_FEDEXTEST)
      else
        _AddURL(utAll,URL_FEDEX)
    end;
   ctUSPS: // USPS
    begin
      if FindCmdLineSwitch('TEST', ['/','-'], TRUE) then
        _AddURL(utAll,URL_STAMPS_TEST)
      else
        _AddURL(utAll,URL_STAMPS)
    end;
   else Exit;
  end; // end case

  TblCarrierURL.Refresh;
  TblCarrierURL.First;


end;

procedure TFrmShipManCarrierURL.sbtnClearAllClick(Sender: TObject);
begin
  if IQConfirmYN('Clear all records?') then
     try
        TblCarrierURL.DisableControls;
        ExecuteCommandFmt('delete from FREIGHT_CARRIER_URL where carrier_id = %.0f', [FCarrierID]);
        TblCarrierURL.Refresh;
     finally
        TblCarrierURL.EnableControls;
     end;
end;

procedure TFrmShipManCarrierURL.TblCarrierURLBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  if TblCarrierURLTYPE.IsNull then
     raise Exception.Create('Please select a URL type.');
end;

procedure TFrmShipManCarrierURL.TblCarrierURLNewRecord(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  TblCarrierURLTYPE.AsInteger := 1; // TEST
end;

procedure TFrmShipManCarrierURL.SetCarrierID(const Value: Real);
begin
  FCarrierID := Value;
end;

procedure TFrmShipManCarrierURL.SetControls;
begin
  IQMS.Common.Controls.IQEnableControl([PopulateDefaultURLs1, PopulateDefaultURLs2],
   (TblCarrierURL.Bof and TblCarrierURL.Eof));
end;

procedure TFrmShipManCarrierURL.SrcCarrierURLDataChange(Sender: TObject;
  Field: TField);
begin
  SetControls;
end;

procedure TFrmShipManCarrierURL.TblCarrierURLAfterOpen(DataSet: TDataSet);
begin
  SetControls;
end;

end.
