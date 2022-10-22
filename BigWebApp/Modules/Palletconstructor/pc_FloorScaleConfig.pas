//
{
Notes:

It is necessary to set the parameters of the “Baud rate ( f4 )”,
”Output mode ( f5 )”, “ Format ( f15 )” in the function table in advance.

Baud rate:9600 bps
Data: 7 bits
Parity: 1 bit, Even
Start bit 1 bit
Stop bit 1 bit
Code ASCII
Terminator CR LF

Allow at least 500 milliseconds between commands.
}

unit pc_FloorScaleConfig;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  OoMisc,
  AdPort,
  AdWnPort,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.wwDataInspector,
  Vcl.ExtCtrls,
  uniGUIClasses,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, MainModule, uniStatusBar, uniMemo, uniButton, uniEdit,
  uniBitBtn, uniSpeedButton, uniPageControl, uniGroupBox, uniCheckBox, uniLabel,
  uniPanel, uniGUIBaseClasses;

type
  TOnWeightRead = procedure( ASender: TObject; Weight:Real ) of object;
  TOnReceivingData = procedure( ASender: TObject ) of object;

  TFrmFloorScaleConfig = class(TUniForm)
    pnlCOMSettings: TUniPanel;
    pnlCOMSettingsHdr: TUniPanel;
    lblSettingsHdr: TUniLabel;
    Panel18: TUniPanel;
    diCOMDevice: TwwDataInspector;
    pnlToolbar: TUniPanel;
    cbxOpenPort: TUniCheckBox;
    gbxTest: TUniGroupBox;
    pnlpgctrTestHolder: TUniPanel;
    pctrlTest: TUniPageControl;
    tabScanner: TUniTabSheet;
    sbtnClearScanner: TUniSpeedButton;
    edOutput: TUniEdit;
    btnSend: TUniButton;
    Status: TUniStatusBar;
    commFloorScale: TApdWinsockPort;
    Memo1: TUniMemo;
    Label1: TUniLabel;
    procedure sbtnClearScannerClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSendClick(Sender: TObject);
    procedure commFloorScaleTriggerAvail(CP: TObject; Count: Word);
    procedure diCOMDeviceItemChanged(Sender: TwwDataInspector;
      Item: TwwInspectorItem; NewValue: String);
    procedure FormShow(Sender: TObject);
    procedure cbxOpenPortClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FSerialData:String;
    FWeight: Real;
    FIsWeightFound:Boolean;
    FOnWeightRead:TOnWeightRead;
    FOnReceivingData:TOnReceivingData;

    procedure PortOpenCloseChanged(Sender: TObject);
    procedure SendCommand(ACommand: String);
    procedure Delay(dwMilliseconds: Integer);
    function ParseFormat1Weight(C:Char; var AWeight:Real):Boolean;
    procedure SetWeight(const Value: Real);
    function StrToParity(AParityStr: String): TParity;
    procedure SaveCOMSettings;
    function ParityToStr(AParity: TParity): String;
    procedure UpdateUI;
    procedure InitializeCommDevice;
    function ComPort(AOpen: Boolean): Boolean;

  public
    { Public declarations }
    procedure SendGetWeightCommand;

    property IsWeightFound:Boolean read FIsWeightFound write FIsWeightFound;
    property Weight:Real read FWeight write SetWeight;
    property OnReceivingData:TOnReceivingData read FOnReceivingData write FOnReceivingData;
    property OnWeightRead:TOnWeightRead read FOnWeightRead write FOnWeightRead;
  end;


procedure ConfigureFloorScale(AOwner:TComponent);


var
  FrmFloorScaleConfig: TFrmFloorScaleConfig;


implementation

{$R *.dfm}

uses
  AdSelCom,
  disposvr_svr,
  iqlib,
  IQmesg,
  iqmisc,
  IQMS.Common.Numbers,
  iqregfrm,
  iqstring,
  pc_rscstr,
  pc_share;

const
  // diCOMDevice.Items property/row indexes
  C_PORT     = 0;
  C_BAUD     = 1;
  C_PARITY   = 2;
  C_DATABITS = 3;
  C_DTR      = 4;
  C_RTS      = 5;
  C_GET_WEIGHT_COMMAND = 'Q';


procedure ConfigureFloorScale(AOwner:TComponent);
begin
  with TFrmFloorScaleConfig.Create(AOwner)do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TFrmFloorScaleConfig.FormCreate(Sender: TObject);
var
  I:Integer;
  ACmd:string;
begin
  FSerialData   := '';
  FIsWeightFound:= FALSE;
  FWeight       := 0;

  // add available com ports to list.
  with diCOMDevice do
    for I:= 1 to 20 do
      if IsPortAvailable( I ) then
        Items[ C_PORT ].PickList.Items.Add( IntToStr( I ) );

  with commFloorScale do
  begin
    OnPortOpen := PortOpenCloseChanged;
    OnPortClose:= PortOpenCloseChanged;
  end;

  InitializeCommDevice;

  if IQRegStringScalarRead( self, 'ScaleCommandGetWeight', ACmd ) then
    edOutput.Text:= ACmd
end;


procedure TFrmFloorScaleConfig.FormDestroy(Sender: TObject);
begin
  with commFloorScale do
  begin
    OnPortOpen := nil;
    OnPortClose:= nil;
  end;
end;


procedure TFrmFloorScaleConfig.PortOpenCloseChanged(Sender: TObject);
begin
  with (Sender as TApdWinsockPort) do
    if Open then
    begin
      Status.Panels[ 0 ].Text:= pc_rscstr.cTXT0000015; // 'COMM Port Open.'
      btnSend.Enabled:= TRUE;
    end
    else
    begin
      Status.Panels[ 0 ].Text:= pc_rscstr.cTXT0000016; // 'COMM Port Closed.';
      btnSend.Enabled:= FALSE;
    end;

end;


procedure TFrmFloorScaleConfig.sbtnClearScannerClick(Sender: TObject);
begin
  Memo1.Clear;
  edOutput.Clear;
end;


procedure TFrmFloorScaleConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  commFloorScale.Open:= FALSE;

  SaveCOMSettings;

  // write UI properties
  IQRegFormWrite( self, [ self ] );
  IQRegStringScalarWrite( self, 'ScaleCommandGetWeight', edOutput.Text );
end;

procedure TFrmFloorScaleConfig.Delay(dwMilliseconds: Longint);
var
  iStart, iStop: DWORD;
begin
  iStart := GetTickCount;
  repeat
    iStop := GetTickCount;
    Application.ProcessMessages;
    Sleep(1);
  until (iStop - iStart) >= dwMilliseconds;
end;

procedure TFrmFloorScaleConfig.SendGetWeightCommand;
begin
   SendCommand( edOutput.Text );  // C_GET_WEIGHT_COMMAND
end;

procedure TFrmFloorScaleConfig.SendCommand(ACommand:String);
begin
  FIsWeightFound:= FALSE;
  FWeight       := 0;

  if not commFloorScale.Open then
  begin
    cbxOpenPort.Checked:= True;
    cbxOpenPortClick( NIL );
  end;

  commFloorScale.Output:= ACommand + #13#10;
  Delay( 500 ); // delay 500 milliseconds before next command can be sent
end;

procedure TFrmFloorScaleConfig.btnSendClick(Sender: TObject);
begin
  SendCommand( edOutput.Text );
end;

function TFrmFloorScaleConfig.ParseFormat1Weight(C:Char; var AWeight:Real):Boolean;
var
  ATemp, ATempNumericStr:String;
  AIsNegative:Boolean;
  I:Integer;
begin
  Result     := FALSE;
  AWeight    := 0;
  AIsNegative:= FALSE;
  ATempNumericStr:= '';

  // append character
  FSerialData:= FSerialData + C;

  // ends with CR LF
  if RightStr(FSerialData,2) = #13#10 then
  begin
    // remove CR LF
    ATemp:= LeftStr( FSerialData, Length(FSerialData) - 2 );

    // reset
    FSerialData:= '';
  end;

  // ensure data
  if Length(ATemp) = 0 then
    EXIT;

  // only get Stable weighing data
  if LeftStr(ATemp, 3) <> 'ST,' then
    EXIT;

  for I:= 1 to Length(ATemp) do
    if ATemp[ I ] in ['+','-', '.','0','1','2','3','4','5','6','7','8','9'] then
      ATempNumericStr:= ATempNumericStr + ATemp[ i ];

  if LeftStr(ATempNumericStr, 1) = '-' then
    AIsNegative:= TRUE;

  // Remove +/- from beginning
  ATempNumericStr:= RightStr( ATempNumericStr, Length(ATempNumericStr) - 1 );

  // can we get a number. if yes, then AWeight is populated
  Result:= IsStringValidFloat( ATempNumericStr, AWeight );
  if not Result then
    IQWarning(Format( pc_rscstr.cTXT0000017, // 'Unable to extract weight value from Scale data sent. Data = "%s"'
                      [ ATempNumericStr ] ) );

  if AIsNegative then
    AWeight:= AWeight * ( -1 );
end;


procedure TFrmFloorScaleConfig.commFloorScaleTriggerAvail(CP: TObject; Count: Word);
var
  I : Integer;
  C: Char;
  S:String;
begin
  // Get the data coming through the port
  for I:= 0 to Count - 1 do
  begin
    if Assigned(FOnReceivingData) then
      FOnReceivingData( self );

    C:= commFloorScale.GetChar;
    FIsWeightFound:= ParseFormat1Weight( C, FWeight ); // Get the next character
    if FIsWeightFound and Assigned(FOnWeightRead) then
      FOnWeightRead( self, Weight );

    S:= S + C;
  end;

  Memo1.Text:= Memo1.Text + S;
end;


procedure TFrmFloorScaleConfig.SetWeight(const Value: Real);
begin
  FWeight := Value;
end;


function TFrmFloorScaleConfig.StrToParity(AParityStr: String):TParity;
begin
  if      AParityStr = 'None'  then Result:= pNone
  else if AParityStr = 'Odd'   then Result:= pOdd
  else if AParityStr = 'Even'  then Result:= pEven
  else if AParityStr = 'Mark'  then Result:= pMark
  else if AParityStr = 'Space' then Result:= pSpace
  else Result:= pNone;
end;


function TFrmFloorScaleConfig.ParityToStr(AParity: TParity):String;
begin
  Result:= '';
  case AParity of
    pNone : Result:= 'None';
    pOdd  : Result:= 'Odd';
    pEven : Result:= 'Even';
    pMark : Result:= 'Mark';
    pSpace: Result:= 'Space';
  end;
end;

procedure TFrmFloorScaleConfig.diCOMDeviceItemChanged(Sender: TwwDataInspector;
  Item: TwwInspectorItem; NewValue: String);
begin
  with commFloorScale do
  case Item.Index of
    C_PORT     : ComNumber:= StrToInt( NewValue );
    C_BAUD     : Baud     := StrToInt( NewValue );
    C_DTR      : DTR      := (NewValue = 'True');
    C_RTS      : RTS      := (NewValue = 'True');
    C_PARITY   : Parity   := StrToParity( NewValue );
    C_DATABITS : DataBits := StrToInt( NewValue );
  end;
end;

procedure TFrmFloorScaleConfig.SaveCOMSettings;
begin
  with commFloorScale do
  begin
    Settings.FloorScale.Port    := ComNumber;
    Settings.FloorScale.Baud    := Baud;
    Settings.FloorScale.DTR     := DTR;
    Settings.FloorScale.RTS     := RTS;
    Settings.FloorScale.Parity  := ParityToStr(Parity);
    Settings.FloorScale.DataBits:= DataBits;
  end;
end;

procedure TFrmFloorScaleConfig.FormShow(Sender: TObject);
begin
  UpdateUI;
end;

procedure TFrmFloorScaleConfig.InitializeCommDevice;
begin
  with commFloorScale, Settings do
  begin
    ComNumber:= FloorScale.Port;
    Baud     := FloorScale.Baud;
    Parity   := StrToParity(FloorScale.Parity);
    DataBits := FloorScale.DataBits;
    DTR      := FloorScale.DTR;
    RTS      := FloorScale.RTS;
  end;
end;

procedure TFrmFloorScaleConfig.UpdateUI;
begin
  with diCOMDevice, commFloorScale do
  begin
    Items[ C_PORT     ].EditText:= Format( '%d', [ ComNumber ] );
    Items[ C_BAUD     ].EditText:= Format( '%d', [ Baud      ] );
    Items[ C_PARITY   ].EditText:= Format( '%s', [ ParityToStr( Parity ) ] );
    Items[ C_DATABITS ].EditText:= Format( '%d', [ DataBits ] );
    Items[ C_DTR      ].EditText:= Format( '%s', [ siif(DTR,'True','False') ] );
    Items[ C_RTS      ].EditText:= Format( '%s', [ siif(RTS,'True','False') ] );

    diCOMDevice.Invalidate; // repaint diCOMDevice
  end;
end;

procedure TFrmFloorScaleConfig.cbxOpenPortClick(Sender: TObject);
begin
  cbxOpenPort.Checked:= ComPort( cbxOpenPort.Checked {Open the port} );
  diCOMDevice.Enabled:= not cbxOpenPort.Checked;
end;

function TFrmFloorScaleConfig.ComPort( AOpen:Boolean ):Boolean;
begin
  Result:= False;
  with commFloorScale do
  try
    Open:= AOpen;

    Result:= Open;
  except on E:Exception do
    // 'Unable to Open COMM Port for %s.'
    IQWarning( Format( pc_rscstr.cTXT0000018+#13#10+'[ %s ]', [ Name, E.Message ] ) );
  end;
end;


procedure TFrmFloorScaleConfig.Button1Click(Sender: TObject);
var
  i:integer;
  s:String;
 N:Real;
begin
  s:= 'ST,+00000.13 lb'#13#10;
  for i:= 1 to Length(s) do
  begin
    ParseFormat1Weight( s[i], N );
  end;
  ShowMessageFmt( '%f', [ N ] );

  s:= 'ST,+00000.53 lb'#13#10;
  for i:= 1 to Length(s) do
  begin
    ParseFormat1Weight( s[i], N );
  end;
  ShowMessageFmt( '%f', [ N ] );
end;

end.
