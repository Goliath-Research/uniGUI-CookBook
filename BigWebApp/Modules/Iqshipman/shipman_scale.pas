unit shipman_scale;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  Mask,
  OoMisc,
  AdPort,
  IQMS.WebVcl.SecurityRegister,
  shipman_rscstr,
{ TODO -oGPatil -cWebConvert : Dependency on Files
  shipman_comport, }
  IQMS.Common.HidControl,
  IQMS.Common.HID,
  IQMS.Common.HIDUsage,
  Spin,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSpinEdit,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel,
  uniPageControl, Vcl.Controls;

type
  TScaleType = (stCom, stHID);

  TScaleSettings = packed record
   Enabled    : Boolean;
   ScaleType  : TScaleType;
   DisplayName  : String;
   ComNumber  : Integer;
   Baud       : Integer;
   DataBits   : Integer;
   StopBits   : Integer;
   Parity     : TParity;
   StartChar  : String;
   StopChar   : String;
   VendorID   : Integer;
   ProductID  : Integer;
  end;
  TFrmShipManScale = class(TUniForm)
    PnlMain: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Options1: TUniMenuItem;
    Help1: TUniMenuItem;
    Content1: TUniMenuItem;
    About1: TUniMenuItem;
    pcScale: TUniPageControl;
    TabCom: TUniTabSheet;
    TabHid: TUniTabSheet;
    IQAbout1: TIQWebAbout;
    Panel2: TUniPanel;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    lblDeviceConfigPort: TUniLabel;
    lblDeviceConfigDataBits: TUniLabel;
    lblDeviceConfigBaud: TUniLabel;
    lblDeviceConfigStopBits: TUniLabel;
    lblDeviceConfigParity: TUniLabel;
    lblDeviceConfigStartChar: TUniLabel;
    lblDeviceConfigStopChar: TUniLabel;
    PnlClient02: TUniPanel;
    LoadDefaultScaleSettings1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    sbtnTestSettings: TUniSpeedButton;
    apdCOMPort: TApdComPort;
    PMain: TUniPopupMenu;
    LoadDefaultScaleSettings2: TUniMenuItem;
    cmbScaleType: TUniComboBox;
    Label16: TUniLabel;
    edtName: TUniEdit;
    edtPort: TUniSpinEdit;
    cmbDataBits: TUniComboBox;
    cmbBaudRate: TUniComboBox;
    cmbStopBits: TUniComboBox;
    cmbParity: TUniComboBox;
    edtStartChar: TUniEdit;
    edtStopChar: TUniEdit;
    Panel1: TUniPanel;
    Splitter2: TUniSplitter;
    Panel3: TUniPanel;
    Label2: TUniLabel;
    Panel4: TUniPanel;
    cmbScales: TUniComboBox;
    edtNameHID: TUniEdit;
    Label3: TUniLabel;
    chkEnabledHID: TUniCheckBox;
    Label5: TUniLabel;
    chkEnabled: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure LoadDefaultScaleSettings1Click(Sender: TObject);
    procedure DoTest(Sender: TObject);
    function HidDevControlEnumerate(HidDev: THidDevice;
      const Idx: Integer): Boolean;
    procedure HidDevControlDeviceChange(Sender: TObject);
    procedure cmbScaleTypeChange(Sender: TObject);
    procedure cmbScalesChange(Sender: TObject);
    procedure Content1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FHidDevControl: TWebIQHidDeviceController;
    FCarrierID: Real;
    procedure SetButtons;
    procedure AddFromDefaultScales(AOption: Integer = -1);
    procedure LoadFromRegistry;
    procedure SetComboBoxValue(AComboBox: TUniComboBox; AValue: String);
    procedure SaveToRegistry;
    procedure SelectCurrentHidScale(AVendorID, AProductID: Integer);
    procedure SetCarrierID(const Value: Real);
  public
    { Public declarations }
    property CarrierID : Real write SetCarrierID;
  end;

  procedure DoFreightScale(ACarrierID: Real);

  function ReadWeightFromHIDScale(AVendorID, AProductID: Integer; var AWeight: Real; var AUnits, AStatus: Integer): Boolean; overload;
  function ReadWeightFromHIDScale(ADev: THidDevice; var AWeight: Real; var AUnits, AStatus: Integer): Boolean; overload;
  procedure ClearScaleSettings(ACarrierID: Real);
  function GetScaleSettings(ACarrierID: Real): TScaleSettings;

const
  SCALES_REGISTRY_KEY = '\Software\IQMS\IQWin32\IQShipMan.exe\Scales';

implementation

{$R *.dfm}

uses
  IQMS.Common.Boolean,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.ListForum,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.Registry,
  IQMS.Common.StringUtils,
  IQMS.Common.UserFields;


procedure DoFreightScale(ACarrierID: Real);
var
  LFrmShipManScale : TFrmShipManScale;
begin
  LFrmShipManScale := TFrmShipManScale.Create(UniGUIApplication.UniApplication);
  LFrmShipManScale.CarrierID := ACarrierID;
  LFrmShipManScale.ShowModal;
end;

procedure ClearScaleSettings(ACarrierID: Real);
var
  AKey: String;
begin
  AKey := SCALES_REGISTRY_KEY + Format('\%.0f',[ACarrierID]);
  with TIQWebRegistry.Create do
  try
    RootKey:= HKEY_CURRENT_USER;
    if KeyExists(AKey) then DeleteKey(AKey );
  finally
    Free;
  end;
end;
function GetScaleSettings(ACarrierID: Real): TScaleSettings;
var
  AScaleSettings: TScaleSettings;
  AKey: String;
begin
  AKey := SCALES_REGISTRY_KEY + Format('\%.0f',[ACarrierID]);
  with AScaleSettings do
  begin
   Enabled := IQMS.Common.Boolean.YNToBool(IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'Enabled'));
   ScaleType := TScaleType(StrToIntDef( IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'Type'), 0));
   DisplayName := IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'Name');
   ComNumber := StrToIntDef(IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'Port'), 1);
   DataBits :=  StrToIntDef(IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'DataBits'), 8);
   Baud := StrToIntDef(IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'BaudRate'), 2400);
   StopBits := StrToIntDef(IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'StopBits'), 1);
   Parity := TParity(StrToIntDef( IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'Parity'), 0));
   StartChar := IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'StartChar');
   StopChar := IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'StopChar');
   VendorID := StrToIntDef(IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'VendorID'), 0);
   ProductID :=  StrToIntDef( IQMS.Common.Registry.LoadStrFromCurrentUserRegistry(AKey, 'ProductID'), 0);
  end;
  Result := AScaleSettings;
end;

function ReadWeightFromHIDScale(AVendorID, AProductID: Integer; var AWeight: Real; var AUnits, AStatus: Integer): Boolean; overload;
var
  AHidDeviceController: TWebIQHidDeviceController;
  ADev: THidDevice;
begin
  try
    AHidDeviceController := TWebIQHidDeviceController.Create(nil);
    try
      AHidDeviceController.DeviceChange;
      AHidDeviceController.CheckOutByID(ADev, AVendorID, AProductID);
      Result := ReadWeightFromHIDScale(ADev, AWeight, AUnits, AStatus);
      AHidDeviceController.CheckIn(ADev);
    finally
      AHidDeviceController.Free;
    end;
  except
    Result := False;
  end;
end;

function ReadWeightFromHIDScale(ADev: THidDevice; var AWeight: Real; var AUnits, AStatus: Integer): Boolean; overload;
var
  ABuffer: array of Byte;
  toRead, bytesRead: Cardinal;
  ALength: Integer;
begin
  AWeight := 0;
    try
      if (ADev <> nil) then
        begin
          try
            toRead := ADev.Caps.InputReportByteLength;
            SetLength(ABuffer, toRead);
            ADev.ReadFile(ABuffer[0], toRead, bytesRead);
            ALength := length(ABuffer) - 1;
            //3 = KGs 12 = LBs
            AUnits := ABuffer[ALength - 3];
            //3 = Scale Motion, 4 = Weight Stable, 6 = Over Limit
            AStatus := ABuffer[ALength - 4];
            AWeight := ABuffer[ALength] * 256 + ABuffer[ALength - 1];

            if (AWeight > 32767) then //Negative numbers
              AWeight := 0;//AWeight - 65536;
            AWeight := AWeight / 100;

          finally
            ADev.CloseFile;
          end;
        end;
  except
    Result := False;
  end;
  Result := True;
end;
{ TFrmShipManScale }

procedure TFrmShipManScale.Content1Click(Sender: TObject);
begin
  IQHelp.HelpContext( Self.HelpContext );
end;

procedure TFrmShipManScale.LoadFromRegistry;
begin
   with GetScaleSettings(FCarrierID) do
   begin
     chkEnabled.Checked := Enabled;
     chkEnabledHID.Checked := Enabled;
     cmbScaleType.ItemIndex := Ord(ScaleType);
     if ((cmbScaleType.ItemIndex >= 0) and (cmbScaleType.ItemIndex < pcScale.PageCount)) then
       pcScale.ActivePageIndex := cmbScaleType.ItemIndex;
     edtName.Text := DisplayName;
     edtPort.Text := IntToStr(ComNumber);
     SetComboBoxValue(cmbDataBits, IntToStr(DataBits));
     SetComboBoxValue(cmbBaudRate, IntToStr(Baud));
     SetComboBoxValue(cmbStopBits, IntToStr(StopBits));
     cmbParity.ItemIndex := Ord(Parity);
     edtStartChar.Text := StartChar;
     edtStopChar.Text := StopChar;
     SelectCurrentHidScale(VendorID, ProductID);
     edtNameHID.Text := DisplayName;
   end;
end;

procedure TFrmShipManScale.SaveToRegistry;
var
  AKey: String;
  Dev: THidDevice;
begin
   AKey :=SCALES_REGISTRY_KEY + Format('\%.0f',[FCarrierID]);
   IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'Type', IntToStr(cmbScaleType.ItemIndex));
   if (cmbScaleType.ItemIndex = 1) then
    begin
      IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'Enabled', IQMS.Common.Boolean.BoolToYN(chkEnabled.Checked));
      IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'Name', edtName.Text);
    end
   else
    begin
      IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'Enabled', IQMS.Common.Boolean.BoolToYN(chkEnabled.Checked));
      IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'Name', edtName.Text);
    end;
  IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'Port', edtPort.Text);
  IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'DataBits', cmbDataBits.Items[cmbDataBits.ItemIndex]);
  IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'BaudRate', cmbBaudRate.Items[cmbBaudRate.ItemIndex]);
  IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'StopBits', cmbStopBits.Items[cmbStopBits.ItemIndex]);
  IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'Parity', IntToStr(cmbParity.ItemIndex));
  IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'StartChar', edtStartChar.Text);
  IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'StopChar', edtStopChar.Text);
  if (cmbScales.ItemIndex >= 0) then
  begin
    Dev := THidDevice(cmbScales.Items.Objects[cmbScales.ItemIndex]);
    IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'VendorID', IntToStr(Dev.Attributes.VendorID));
    IQMS.Common.Registry.SaveStrToCurrentUserRegistry(AKey, 'ProductID', IntToStr(Dev.Attributes.ProductID));
  end;

end;

procedure TFrmShipManScale.SelectCurrentHidScale(AVendorID, AProductID: Integer);
var
  Dev: THidDevice;
  i: Integer;
begin
  for i := 0 to cmbScales.Items.Count-1 do
  begin
    Dev := THidDevice(cmbScales.Items.Objects[i]);
    if ((Dev.Attributes.VendorID = AVendorID) and (Dev.Attributes.ProductID = AProductID)) then
    begin
      cmbScales.ItemIndex := i;
      break;
    end;

  end;
end;

procedure TFrmShipManScale.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmShipman{CHM}, iqhtmShipman{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmShipManScale.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Dev: THidDevice;
  i: Integer;
begin
  IQRegFormWrite(Self,[Self,PnlLeft01]); // IQMS.Common.RegFrm.pas
  SaveToRegistry;
  {
  for i := 0 to cmbScales.Items.Count-1 do
  begin
    Dev := THidDevice(cmbScales.Items.Objects[I]);
    FHidDevControl.CheckIn(Dev);
    cmbScales.Items.Objects[I] := nil;
  end;
  }
end;

procedure TFrmShipManScale.HidDevControlDeviceChange(Sender: TObject);
var
  Dev: THidDevice;
  I: Integer;
begin
  // hand back all the devices assigned to the list entries
  for I := 0 to cmbScales.Items.Count-1 do
  begin
    Dev := THidDevice(cmbScales.Items.Objects[I]);
    FHidDevControl.CheckIn(Dev);
    cmbScales.Items.Objects[I] := nil;
  end;
  cmbScales.Items.Clear;
  FHidDevControl.Enumerate;
end;

function TFrmShipManScale.HidDevControlEnumerate(HidDev: THidDevice;
  const Idx: Integer): Boolean;
var
  Dev: THidDevice;
  Ret, I, J: Integer;
  N: Word;
  BtnCaps: array [0..255] of THIDPButtonCaps;
  AIsWeighingDevice: Boolean;
  AKey: String;
begin
  N := Length(BtnCaps);
  HidDev.ReportTypeParam := HidP_Input;
  Ret := HidDev.GetButtonCaps(@BtnCaps[0], N);
  AIsWeighingDevice := false;
  if Ret = HIDP_STATUS_SUCCESS then
  begin
    for I := 0 to N-1 do
      if (BtnCaps[I].UsagePage = HID_USAGE_PAGE_WEIGHING_DEVICE) then
        AIsWeighingDevice := true;
  end;

  if (AIsWeighingDevice) then
  begin
    if HidDev.ProductName <> '' then
      J := cmbScales.Items.Add(HidDev.ProductName)
    else
      J := cmbScales.Items.Add(Format('Device VID=%x PID=%x',
        [HidDev.Attributes.VendorID, HidDev.Attributes.ProductID]));
    // check out the device and assign it to the list entry
    FHidDevControl.CheckOutByIndex(Dev, Idx);
    cmbScales.Items.Objects[J] := Dev;
  end;
  with GetScaleSettings(FCarrierID) do
    SelectCurrentHidScale(VendorID, ProductID);
  Result := True;
end;

procedure TFrmShipManScale.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmShipManScale.cmbScalesChange(Sender: TObject);
begin
  if (cmbScales.ItemIndex >= 0) then
    edtName.Text := cmbScales.Items[cmbScales.ItemIndex];
end;

procedure TFrmShipManScale.cmbScaleTypeChange(Sender: TObject);
begin
  if ((cmbScaleType.ItemIndex >= 0) and (cmbScaleType.ItemIndex < pcScale.PageCount)) then
    pcScale.ActivePageIndex := cmbScaleType.ItemIndex;
end;


procedure TFrmShipManScale.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmShipManScale.LoadDefaultScaleSettings1Click(Sender: TObject);
begin
  AddFromDefaultScales(-1);
end;

procedure TFrmShipManScale.AddFromDefaultScales(AOption: Integer);
var
   AName: String;
   AList: TStringList;
   AIndex,
   ADataBits,
   ABaud,
   AStopBits,
   AParity: Integer;
   AID: Real;
begin

  try
     AList := TStringList.Create;
     AList.Add('Detecto AS-400D'                 ); //  0
     AList.Add('Detecto AS-420D'                 ); //  1
     AList.Add('Fairbanks'                       ); //  2
     AList.Add('Mettler-Toledo PS60/PS6L Series' ); //  3
     AList.Add('Mettler-Toledo 8123'             ); //  4

     AList.Add('Micro General 1270'              ); //  5
     AList.Add('Micro General 740'               ); //  6
     AList.Add('MOS 105405'                      ); //  7
     AList.Add('Pennsylvania 6300'               ); //  8
     AList.Add('Pennsylvania 7X00'               ); //  9

     AList.Add('Transcell SP Series'             ); //  10
     AList.Add('Weightronix'                     ); //  11

     // TParity = (pNone, pOdd, pEven, pMark, pSpace);

     if DoListSelect(shipman_rscstr.cTXT000056, // 'Default Scales'
        shipman_rscstr.cTXT000057, // 'Select a default scale configuration:'
        AList, AIndex) then // IQListFrm.pas
        begin
          case AIndex of
           0,  //  Detecto AS-400D
           1:  //  Detecto AS-420D
            begin
              ADataBits  := 8;
              ABaud      := 1200;
              AStopBits  := 1;
              AParity    := Ord(pNone);
            end;
           2:  //  Fairbanks
            begin
              ADataBits  := 7;
              ABaud      := 9600;
              AStopBits  := 2;
              AParity    := Ord(pOdd);
            end;
           3,  //  Mettler-Toledo PS60
           4,  //  Mettler-Toledo 8123,
           5:  //  Micro General 1270
            begin
              ADataBits  := 7;
              ABaud      := 9600;
              AStopBits  := 1;
              AParity    := Ord(pEven);  // NOTE: with flow control it's pNone
            end;
           6:  //  Micro General 740
            begin
              ADataBits  := 8;
              ABaud      := 9600;
              AStopBits  := 1;
              AParity    := Ord(pNone);
            end;
           7:  //  MOS 105405
            begin
              ADataBits  := 8;
              ABaud      := 2400;
              AStopBits  := 1;
              AParity    := Ord(pNone);
            end;
           8,  //  Pennsylvania 6300
           9:  //  Pennsylvania 7X00
            begin
              ADataBits  := 7;
              ABaud      := 300;
              AStopBits  := 1;
              AParity    := Ord(pOdd);
            end;
           10: //  Transcell SP Series
            begin
              ADataBits  := 8;
              ABaud      := 2400;
              AStopBits  := 1;
              AParity    := Ord(pNone);
            end;
           11: //  Weightronix
            begin
              ADataBits  := 8;
              ABaud      := 1200;
              AStopBits  := 1;
              AParity    := Ord(pOdd);
            end;
          else Exit;
          end; // end case

          // Store scale name
          AName := AList.Strings[AIndex];

          // Overwrite the current settings with the selected configuration?
          AIndex := AOption; // initial

          edtName.Text := AName;
          SetComboBoxValue(cmbDataBits, IntToStr(ADataBits));
          SetComboBoxValue(cmbBaudRate, IntToStr(ABaud));
          SetComboBoxValue(cmbStopBits, IntToStr(AStopBits));
          cmbParity.ItemIndex := AParity;

        end;
  finally
    if Assigned(AList) then AList.Free;
  end;

end;

procedure TFrmShipManScale.SetCarrierID(const Value: Real);
begin
  FCarrierID := Value;
end;

procedure TFrmShipManScale.SetComboBoxValue(AComboBox: TUniComboBox;
  AValue: String);
var
   i: Integer;
begin
   if (AComboBox = NIL) then Exit;
   for i := 0 to AComboBox.Items.Count - 1 do
    if (AComboBox.Items[i] = AValue) then
       begin
         AComboBox.ItemIndex := i;
         BREAK;
       end;

end;

procedure TFrmShipManScale.UniFormCreate(Sender: TObject);
begin
  // Controls
//  IQMS.Common.Controls.AdjustPageControlToParent(pcScale);

//  CenterForm(Self); // IQMS.Common.Controls.pas
  IQRegFormRead(Self,[Self,PnlLeft01]); // IQMS.Common.RegFrm.pas

  // adjust control widths
  edtName.Width := PnlClient02.ClientWidth - 4;

  FHidDevControl := TWebIQHidDeviceController.Create(self);
  FHidDevControl.OnEnumerate := HidDevControlEnumerate;
  FHidDevControl.OnDeviceChange := HidDevControlDeviceChange;
  FHidDevControl.DeviceChange;

  LoadFromRegistry;
end;

procedure TFrmShipManScale.DoTest(Sender: TObject);
var
  Dev: THidDevice;
  AWeight: Real;
  AStatus, AUnits: Integer;
  AStatusStr, AUnitsStr: String;
begin
  // Test the scale
  if (FCarrierID = 0) then Exit;

  SaveToRegistry;

  if (cmbScaleType.ItemIndex = 0) then
  begin
{ TODO -oGPatil -cWebConvert : Dependency on shipman_comport.pas File
    CheckShipManCOMPortCreated;
    if Assigned(ShipManCOMPort) then
       with ShipManCOMPort do
        begin
          CarrierID := FCarrierID;
          OnGetSignal := NIL; // nothing to do
          Show;
          OpenPort;
        end;  }
  end;
  if (cmbScaleType.ItemIndex = 1) then
  begin
    if (cmbScales.ItemIndex >= 0) then
    begin
      Dev := THidDevice(cmbScales.Items.Objects[cmbScales.ItemIndex]);
      if ReadWeightFromHIDScale(Dev, AWeight, AUnits, AStatus) then
        begin
          case AUnits of
            3: AUnitsStr := 'KGs';
            12: AUnitsStr := 'LBs';
            else AUnitsStr := 'Unknown';
          end;
          case AStatus of
            3: AStatusStr := 'Scale Motion';
            4: AStatusStr := 'Weight Stable';
            6: AStatusStr := 'Over Limit';
            else AStatusStr := 'Unknown';
          end;
          IQMS.Common.Dialogs.IQInformation(Format('Weight: %f'#13'Units: %s'#13'Status: %s', [AWeight, AUnitsStr, AStatusStr]));
        end
      else
        IQMS.Common.Dialogs.IQWarning('Could not read from ' + edtName.Text);
    end;
  end;
end;

procedure TFrmShipManScale.SetButtons;
begin
{ TODO -oGPatil -cWebConvert : TUniSpeedButton does not contain Enabled
  sbtnTestSettings.Enabled := true;  }
end;


end.
