unit IQMS.Common.BaseAutoModeDevice;

interface

uses
  Types,    UniTimer,
  System.Classes;

type
  TBaseAutoModeDevice_DIEnergized = procedure(Sender: TObject) of object; //TBaseAutoModeDevice_DIEnergized
  TBaseAutoModeDevice_Error = procedure(Sender: TObject; AError:String) of object; //TBaseAutoModeDevice_DeviceError


  TIQWebBaseAutoModeDevice = class(TComponent)
  private
    FIODeviceIndex: LONGWORD;

    {Internal tracking of energized state so events only fire on change to energized = true}
    FDI0Energized,
    FDI1Energized,
    FDI2Energized,
    FDI3Energized : Boolean;

    {Events}

    FRelayOnTime_msec: Integer;
    FEnabled: Boolean;
    FOnDeviceError: TBaseAutoModeDevice_Error;

    function Get_RelayOnTime_msec: Integer; virtual;
    procedure Set_Enabled(const Value: Boolean); virtual;

  protected
    TimerDIO   : TUniTimer;
    procedure TimerDIOTimer(Sender: TObject); virtual; abstract;

  public
    FOnDI0Energized : TBaseAutoModeDevice_DIEnergized;
    FOnDI1Energized : TBaseAutoModeDevice_DIEnergized;
    FOnDI2Energized : TBaseAutoModeDevice_DIEnergized;
    FOnDI3Energized : TBaseAutoModeDevice_DIEnergized;
    constructor Create(AOwner:TComponent); virtual;
    function IsInitialized : Boolean; virtual; abstract;
    destructor Destroy; override;

    {Events}
    property OnDI0Energized : TBaseAutoModeDevice_DIEnergized read FOnDI0Energized write FOnDI0Energized;
    property OnDI1Energized : TBaseAutoModeDevice_DIEnergized read FOnDI1Energized write FOnDI1Energized;
    property OnDI2Energized : TBaseAutoModeDevice_DIEnergized read FOnDI2Energized write FOnDI2Energized;
    property OnDI3Energized : TBaseAutoModeDevice_DIEnergized read FOnDI3Energized write FOnDI3Energized;
    property OnDeviceError  : TBaseAutoModeDevice_Error read FOnDeviceError  write FOnDeviceError;
    property RelayOnTime_msec : Integer read Get_RelayOnTime_msec write FRelayOnTime_msec;
    property Enabled:Boolean read FEnabled write Set_Enabled;

    // Note: 0 <= ANumber <= 3
    procedure ToggleOutputRelay( ANumber: Integer); virtual; abstract;
  end;

implementation

uses
  System.SysUtils,
  Vcl.Dialogs;

{ TBaseAutoModeDevice }

constructor TIQWebBaseAutoModeDevice.Create(AOwner: TComponent);
begin
  inherited Create( AOwner );
end;

destructor TIQWebBaseAutoModeDevice.Destroy;
begin
  inherited Destroy;
end;

function TIQWebBaseAutoModeDevice.Get_RelayOnTime_msec: Integer;
begin
  Result := FRelayOnTime_msec;
end;

procedure TIQWebBaseAutoModeDevice.Set_Enabled(const Value: Boolean);
begin
  TimerDIO.Enabled:= Value;
  FEnabled := Value;
end;

end.
