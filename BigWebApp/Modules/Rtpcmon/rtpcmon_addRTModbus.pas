unit rtpcmon_addRTModbus;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.CaptionPanel,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniPanel;

type
  TFrmAddRTModbusDevice = class(TUniForm)
    CaptionPanel1: TIQWebCaptionPanel;
    edIPAddress: TUniEdit;
    Label1: TUniLabel;
    Label2: TUniLabel;
    edPort: TUniEdit;
    btnAdd: TUniButton;
    btnCancel: TUniButton;
    edDeviceDescription: TUniEdit;
    edDeviceName: TUniEdit;
    Label3: TUniLabel;
    Label4: TUniLabel;
    edPositionPartCount: TUniEdit;
    Label5: TUniLabel;
    edPositionTimer: TUniEdit;
    Label6: TUniLabel;
    dbCmbCapabType: TUniEdit;
    Label7: TUniLabel;
    lblPartCountEndPosition: TUniLabel;
    lblDelayTimerEndPosition: TUniLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure NumericOnlyKeyPress(Sender: TObject; var Key: Char);
    procedure dbCmbCapabTypeCustomDlg(Sender: TObject);
    procedure edPositionPartCountChange(Sender: TObject);
    procedure edPositionTimerChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FCapabTypeId:Real;
  public
    { Public declarations }
    property CapabTypeId :Real read FCapabTypeId;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Miscellaneous,
  rtpcmon_DM;

procedure TFrmAddRTModbusDevice.FormCreate(Sender: TObject);
begin
  self.CaptionPanel1.Text:=
    'In order to communicate with the RealTime system, there must be two devices configured, '+
    'a  Modbus Master and a Modbus Slave.  '#13#10#13#10+
    'Please enter the IP address of the PLC that will be transmitting RealTime information. '#13#10+
    'The Start Position Part Count is the PLC''s register that stores the part count, scrap count, Cycle Time Min, Cycle Time Sec, Cycle Time msec, Flush. '#13#10+
    'The Start Position Timer is the PLC''s register that stores the delay timer in seconds, flush and work center state. '#13#10+
    'Please see help files for additional information.';
end;

procedure TFrmAddRTModbusDevice.btnAddClick(Sender: TObject);
begin
  IQAssert( CapabTypeId <> 0, 'Please select a Capability Type.' );
  IQAssert( Trim(edDeviceName.Text) <> '', 'Please enter a Device Name.' );
  IQAssert( Trim(edDeviceDescription.Text) <> '', 'Please enter a Device Description.' );
  IQAssert( Trim(edIPAddress.Text) <> '', 'Please enter the IP Address of the Device.' );
  IQAssert( Trim(edPort.Text) <> '', 'Please enter a Port.' );
  IQAssert( Trim(edPositionPartCount.Text) <> '', 'Please enter the start register for the Part Count.' );
  IQAssert( Trim(edPositionTimer.Text) <> '', 'Please enter the start position for the Timer.' );

  self.ModalResult:= mrOk;
end;

procedure TFrmAddRTModbusDevice.btnCancelClick(Sender: TObject);
begin
  self.Close;
end;

procedure TFrmAddRTModbusDevice.NumericOnlyKeyPress(Sender: TObject; var Key: Char);
const
  cValidChar = ['0'..'9', #8];
begin
  if not ( Key in cValidChar ) then
    Key := #0;
end;

procedure TFrmAddRTModbusDevice.dbCmbCapabTypeCustomDlg(Sender: TObject);
begin
  with TDM_RTPCMon.Create(self) do
    try
      pkPCMonCapabType.Connection := UniMainModule.FDConnection1;
      pkPCMonCapabType.Open;

      if pkPCMonCapabType.Execute then
      begin
        FCapabTypeId       := pkPCMonCapabType.GetValue( 'ID' );
        dbCmbCapabType.Text:= pkPCMonCapabType.GetValue( 'NAME' );
      end;
    finally
      FREE;
    end;
end;

procedure TFrmAddRTModbusDevice.edPositionPartCountChange(Sender: TObject);
var
  AStart:Integer;
begin
  if System.SysUtils.TryStrToInt( edPositionPartCount.Text, AStart ) then
    lblPartCountEndPosition.Caption:= Format( ' to %d', [ AStart + 5 ] );
end;

procedure TFrmAddRTModbusDevice.edPositionTimerChange(Sender: TObject);
var
  AStart:Integer;
begin
  if System.SysUtils.TryStrToInt( edPositionTimer.Text, AStart ) then
    lblDelayTimerEndPosition.Caption:= Format( ' to %d', [ AStart + 2 ] );
end;

procedure TFrmAddRTModbusDevice.FormShow(Sender: TObject);
begin
  edPositionPartCountChange(nil);
  edPositionTimerChange(nil);
end;

end.
