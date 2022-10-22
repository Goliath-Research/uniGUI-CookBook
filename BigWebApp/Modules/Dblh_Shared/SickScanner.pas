unit SickScanner;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  OoMisc,
  AdPort,
  AdWnPort,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniTimer,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TSickTimedOutEvent = procedure(ASender: TObject) of object;
  TOnBarcodeReadEvent = procedure( ASender: TObject; ABarcode:string ) of object;
  TSickStateChangeEvent = procedure(ASender: TObject; AIsActive:Boolean) of object;

  TFrmSickScanner = class(TUniForm)
    commSickScanner: TApdWinsockPort;
    Timer1: TUniTimer;
    procedure commSickScannerTriggerAvail(CP: TObject; Count: Word);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FOnBarcodeReadEvent: TOnBarcodeReadEvent;
    FLastActiveTime:TDateTime;  // set when isactive toggles from true to false
    FBaud: Integer;
    FIsActive: Boolean;
    FOnTimedOut:TSickTimedOutEvent;
    FOnStateChange:TSickStateChangeEvent;
    FStartFound:Boolean;
    FScannerBarcode:String;
    FTimeOut: Integer;

     procedure CheckOpen;
    function GetComNumber: Integer;
    procedure SetBaud(const Value: Integer);
    procedure SetComNumber(const Value: Integer);
    function GetBaud: Integer;
    function GetDTR: Boolean;
    function GetRTS: Boolean;
    procedure SetDTR(const Value: Boolean);
    procedure SetRTS(const Value: Boolean);
    procedure SetIsActive(const Value:Boolean);
    procedure SetTimeOut(const Value: Integer);
  public
    { Public declarations }

    {Commands}
    procedure StartScanning;
    procedure StopScanning;
    procedure OpenPort;
    procedure ClosePort;
    procedure ForceStartScanning;

    {Events}
    property OnBarcodeRead:TOnBarcodeReadEvent read FOnBarcodeReadEvent write FOnBarcodeReadEvent;
    property OnTimedOut:TSickTimedOutEvent read FOnTimedOut write FOnTimedOut;
    property OnStateChange:TSickStateChangeEvent read FOnStateChange write FOnStateChange;

    {Settings}
    property ComNumber:Integer read GetComNumber write SetComNumber;
    property Baud:Integer read GetBaud write SetBaud;
    property DTR:Boolean read GetDTR write SetDTR;
    property RTS:Boolean read GetRTS write SetRTS;
    property TimeOut:Integer read FTimeOut write SetTimeOut;

    {Status}
    property IsActive:Boolean read FIsActive;
  end;


implementation

uses
  Math,
  MainModule;


const
  STX    = #2;     // Start of message charactor
  ETX    = #3;     // End of message charactor
  SECS_UNTIL_ACTIVE_IS_ALLOWED = 5;
  DEFAULT_TIME_OUT_SECS = 60;

{$R *.dfm}


procedure TFrmSickScanner.StartScanning;
var
  ATest : Real;
begin
  ATest:= (Now - FLastActiveTime) * 86400;
  if ATest < SECS_UNTIL_ACTIVE_IS_ALLOWED then
    EXIT;

  ForceStartScanning;
end;

procedure TFrmSickScanner.ForceStartScanning;
begin
  CheckOpen;

  FStartFound:= FALSE;

  commSickScanner.Output:= STX + '21' + ETX;

  SetIsActive( TRUE );

  Timer1.Enabled:= TRUE;
end;

procedure TFrmSickScanner.CheckOpen;
begin
  with commSickScanner do
    if not Open then
      Open:= TRUE;
end;

procedure TFrmSickScanner.ClosePort;
begin
  StopScanning;
  
  commSickScanner.Open:= FALSE;
end;

procedure TFrmSickScanner.commSickScannerTriggerAvail(CP: TObject; Count: Word);
const
  // COM port characters that signify the start or end of a barcode(aka serial #)
  C_LF  = #10;   // START BARCODE
  C_CR  = #13;   // END BARCODE
var
  I : Integer;
  C : AnsiChar;
  ABarcodeFound:Boolean;
begin
  // barcode format will be the following
  //
  // STX + LF + barcode + CR + LF + ETX
  //
  // if you stop scanner(i.e. turn off laser, not close the com port) before you read a barcode you'll get
  //
  // STX + LF + 'NOREAD' + CR + LF + ETX
  //
  ABarcodeFound  := FALSE;
  for I:= 1 to Count do
  begin
    C:= commSickScanner.GetChar;

    if ABarcodeFound then
      CONTINUE; // DO NOT EXIT THIS LOOP EARLY!!! YOU MUST PURGE ALL CHARS FROM COMM BUFFER VIA GetChar!!!

    if C = C_LF then
    begin
      FScannerBarcode:= '';
      FStartFound    := TRUE;
    end;

    if FStartFound then
    begin                                         // 7 is min IQMS barcode length
      if (C = C_CR) and (Length(Trim(FScannerBarcode)) >= 7) then
        begin
          Timer1.Enabled := FALSE;
          FStartFound    := FALSE;
          SetIsActive( FALSE );
          ABarcodeFound  := TRUE;
        end

      // found end but barcode is too short still
      else if C = C_CR then
        FStartFound:= FALSE

      else
        FScannerBarcode:= FScannerBarcode + C;
    end;
  end;

  if ABarcodeFound and Assigned( FOnBarcodeReadEvent ) then
    FOnBarcodeReadEvent( self, Trim( FScannerBarcode ) );
end;

procedure TFrmSickScanner.StopScanning;
begin
  CheckOpen;

  commSickScanner.Output:= STX + '22' + ETX;

  SetIsActive( FALSE );
  Timer1.Enabled:= FALSE;
end;

procedure TFrmSickScanner.OpenPort;
begin
  CheckOpen;
  
  StopScanning;
end;

function TFrmSickScanner.GetComNumber: Integer;
begin
  Result:= commSickScanner.ComNumber;
end;

procedure TFrmSickScanner.SetBaud(const Value: Integer);
begin
  commSickScanner.Baud:= Value;
end;

procedure TFrmSickScanner.SetComNumber(const Value: Integer);
begin
  commSickScanner.ComNumber:= Value;
end;

function TFrmSickScanner.GetBaud: Integer;
begin
  Result:= commSickScanner.Baud;
end;

function TFrmSickScanner.GetDTR: Boolean;
begin
  Result:= commSickScanner.DTR;
end;

function TFrmSickScanner.GetRTS: Boolean;
begin
  Result:= commSickScanner.RTS;
end;

procedure TFrmSickScanner.SetDTR(const Value: Boolean);
begin
  commSickScanner.DTR:= Value;
end;

procedure TFrmSickScanner.SetRTS(const Value: Boolean);
begin
  commSickScanner.RTS:= Value;
end;

procedure TFrmSickScanner.FormCreate(Sender: TObject);
begin
  SetIsActive( FALSE );

  SetTimeOut( DEFAULT_TIME_OUT_SECS );
end;

procedure TFrmSickScanner.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= FALSE;
  StopScanning;

  if Assigned(FOnTimedOut) then
    FOnTimedOut( self );
end;

procedure TFrmSickScanner.SetIsActive(const Value: Boolean);
begin
  if not FIsActive and Value then
    FLastActiveTime:= Now;

  FIsActive:= Value;

  if Assigned( FOnStateChange ) then
    FOnStateChange( self, Value );
end;

procedure TFrmSickScanner.SetTimeOut(const Value: Integer);
begin
  FTimeOut:= Value * 1000;
  
  Timer1.Interval:= FTimeOut;
end;


end.
