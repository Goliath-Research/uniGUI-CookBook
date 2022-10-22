unit pc_promptWeight;

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
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  pc_FloorScaleConfig,
  Vcl.ComCtrls;

type
  TFrmPromptWeight = class(TUniForm)
    pnlInstructions: TUniPanel;
    edWeight: TUniEdit;
    bbtnOK: TUniBitBtn;
    bbtnCancel: TUniBitBtn;
    btnReadWeight: TUniSpeedButton;
    StatusBar1: TUniStatusBar;
    procedure bbtnOKClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReadWeightClick(Sender: TObject);
    procedure edWeightKeyPress(Sender: TObject; var Key: Char);
    procedure edWeightChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FWeightTolerancePercent: Real;
    FStdWeight: Real;
    procedure ReceivingData(Sender: TObject);
    procedure SetStatus(const Value: String);
    function GetStatus: String;
  private
    { Private declarations }
    FFloorScale:TFrmFloorScaleConfig;
    FStatusBarCount:Integer;
    procedure WeightRead(Sender: TObject; AWeight: Real);
    property Status:String read GetStatus write SetStatus;
  public
    { Public declarations }
    property WeightTolerancePercent:Real read FWeightTolerancePercent write FWeightTolerancePercent;
    property StdWeight:Real read FStdWeight write FStdWeight;
  end;

  function PromptWeight(AOwner:TComponent; var AWeight:Real; AStdWeight, AWeightTolerancePercent:Real ):Boolean;

var
  FrmPromptWeight: TFrmPromptWeight;

implementation

{$R *.dfm}

uses
  IQMisc,
  IQMS.Common.Numbers,
  Iqstring,
  pc_rscstr,
  touchscrn;


function PromptWeight(AOwner:TComponent; var AWeight:Real; AStdWeight, AWeightTolerancePercent:Real):Boolean;
begin
  with TFrmPromptWeight.Create(AOwner)do
  try
    WeightTolerancePercent:= AWeightTolerancePercent;
    StdWeight:= AStdWeight;

    Result:= (ShowModal = mrOk);
    if Result then
      AWeight:= StrToFloat( edWeight.Text );
  finally
    Free;
  end;
end;


procedure TFrmPromptWeight.FormCreate(Sender: TObject);
begin
  FStdWeight:= 0;
  FWeightTolerancePercent:= 0;
end;


procedure TFrmPromptWeight.FormShow(Sender: TObject);
begin
  FStatusBarCount:= 0;

  FFloorScale:= TFrmFloorScaleConfig.Create( self );
  with FFloorScale do
  begin
    OnWeightRead   := WeightRead;
    OnReceivingData:= ReceivingData;

    btnReadWeightClick(nil);
  end;
end;


procedure TFrmPromptWeight.WeightRead(Sender: TObject; AWeight:Real);
begin
  Status:= pc_rscstr.cTXT0000006; // 'Finished Reading Scale.'
  edWeight.Text:= FloatToStr( AWeight );
end;


procedure TFrmPromptWeight.ReceivingData(Sender: TObject);
var
  ADots:String;
  I:Integer;
begin
  inc(FStatusBarCount);
  ADots:= '';

  if FStatusBarCount > 2 then
    FStatusBarCount:= 0;

  for I:= 0 to FStatusBarCount do
    ADots:= ADots + '.';

  StatusBar1.Panels[0].Text:= pc_rscstr.cTXT0000005 + ADots; // 'Receiving Data'
end;


procedure TFrmPromptWeight.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FFloorScale) then
  begin
    FFloorScale.OnReceivingData:= nil;
    FFloorScale.OnWeightRead   := nil;
    FFloorScale.Close;
    FFloorScale.Free;
  end;
end;

procedure TFrmPromptWeight.bbtnOKClick(Sender: TObject);
var
  ADummy:Real;
begin
  if not IQMS.Common.Numbers.IsStringValidFloat(edWeight.Text, ADummy) then
  begin
    TouchScreen_Msg_Error( pc_rscstr.cTXT0000004 ); // 'Invalid Weight Entered!'
    Exit;
  end;

  if not ( ADummy > 0 ) then
  begin
    TouchScreen_Msg_Error( pc_rscstr.cTXT0000003 ); // 'Please Enter A Weight!'
    Abort;
  end;

  self.ModalResult:= mrOK;
end;

procedure TFrmPromptWeight.bbtnCancelClick(Sender: TObject);
begin
  self.ModalResult:= mrCancel;
end;

procedure TFrmPromptWeight.btnReadWeightClick(Sender: TObject);
begin
  Status:= '';
  if not Assigned(FFloorScale) then
    EXIT;

  Status:= pc_rscstr.cTXT0000002; // 'Reading Scale...'
  try
    FFloorScale.SendGetWeightCommand;
  except on E:Exception do
    begin
      self.Status:= pc_rscstr.cTXT0000001; // 'Error Reading Scale.'

      TouchScreen_Msg_Error( Format( pc_rscstr.cTXT0000001 + #13#10 + // 'Error Reading Scale.'
                                     '[ %s ]', [ E.Message ] ) );
    end;
  end;

end;

procedure TFrmPromptWeight.SetStatus(const Value: String);
begin
  StatusBar1.Panels[0].Text := Value;
end;

function TFrmPromptWeight.GetStatus: String;
begin
  Result:= StatusBar1.Panels[0].Text;
end;

procedure TFrmPromptWeight.edWeightKeyPress(Sender: TObject;var Key: Char);
const
  cValidChar = [ '0'..'9', '.', '-', #8 ];
begin
  // limit to a single period
  if not ( Key in cValidChar ) or ( (Key = '.') and (Occurances('.',edWeight.Text) > 0) ) then
    Key := #0;
end;


procedure TFrmPromptWeight.edWeightChange(Sender: TObject);
var
 AWeight:Real;
 AColor:TColor;
begin
  AWeight:= 0;
  if not (FWeightTolerancePercent > 0) or not (StdWeight > 0) then
    Exit;

  AColor:= clWindow;

  if trim(edWeight.Text) <> '' then
  begin
    if not IsStringValidFloat( edWeight.Text, AWeight ) then
      begin
        AColor:= clRed;
      end
    else
      begin
        if ( AWeight > StdWeight * (1 + (FWeightTolerancePercent / 100)) )
             or
           ( AWeight < StdWeight - (StdWeight * (FWeightTolerancePercent / 100)) ) then
          AColor:= clRed;
      end;
  end;

  edWeight.Color:= AColor;
  edWeight.Invalidate;
end;



end.
