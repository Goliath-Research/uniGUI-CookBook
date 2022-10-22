unit shipman_usps_weight;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, Vcl.ComCtrls;

type
  TFrmShipManUSPSWeight = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    lblOunces: TUniLabel;
    edtPounds: TUniEdit;
    edtOunces: TUniEdit;
    PnlFlatRate: TUniPanel;
    chkFlatRate: TUniCheckBox;
    edtOuncesHidden: TUniEdit;
    udPounds: TUpDown;
    udOunces: TUpDown;
    procedure chkFlatRateClick(Sender: TObject);
    procedure edtOuncesHiddenChange(Sender: TObject);
{ TODO -oGPatil -cWebConvert : TUDBtnType and TUpDown not present in UniGui
    procedure udOuncesClick(Sender: TObject; Button: TUDBtnType);  }
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FSpinning, FTyping: Boolean;
    procedure SetWeight(const Value: Real);
    function GetWeight: Real;
    procedure SetButtons;
  public
    { Public declarations }

  published
    { Published declarations }
    property Weight: Real read GetWeight write SetWeight;
  end;

  function GetUSPSWeight(const AShowFlatRate: Boolean;
   var AActualWeight: Real; var AFlatRate: Boolean): Boolean; overload;

  function GetUSPSWeight(var AActualWeight: Real): Boolean; overload;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.StringUtils,
  shipman_usps;

function GetUSPSWeight(const AShowFlatRate: Boolean;var AActualWeight: Real; var AFlatRate: Boolean): Boolean;
var
  LFrmShipManUSPSWeight : TFrmShipManUSPSWeight;
begin
  LFrmShipManUSPSWeight := TFrmShipManUSPSWeight.Create(UniGUIApplication.UniApplication);
  LFrmShipManUSPSWeight.FSpinning := false;
  LFrmShipManUSPSWeight.FTyping := false;
  LFrmShipManUSPSWeight.Weight := AActualWeight;
  LFrmShipManUSPSWeight.chkFlatRate.Checked := AFlatRate;
   Result := LFrmShipManUSPSWeight.ShowModal = mrOk;
   if Result then
      begin
        AFlatRate := LFrmShipManUSPSWeight.chkFlatRate.Checked;
        AActualWeight := LFrmShipManUSPSWeight.Weight;
      end;
end;

function GetUSPSWeight( var AActualWeight: Real): Boolean;
var
   AFlatRate: Boolean; // not used
   LFrmShipManUSPSWeight : TFrmShipManUSPSWeight;
begin
  LFrmShipManUSPSWeight := TFrmShipManUSPSWeight.Create(UniGUIApplication.UniApplication);
  LFrmShipManUSPSWeight.FSpinning := false;
  LFrmShipManUSPSWeight.FTyping := false;
  LFrmShipManUSPSWeight.Weight := AActualWeight;
   Result := LFrmShipManUSPSWeight.ShowModal = mrOk;
   if Result then
      AActualWeight := LFrmShipManUSPSWeight.Weight;
end;

procedure TFrmShipManUSPSWeight.edtOuncesHiddenChange(Sender: TObject);
begin
end;

{ NOTE:  There are 16 ounces in 1 pound }

function TFrmShipManUSPSWeight.GetWeight: Real;
var
   APounds: Integer;
   AOunces: Real;
   S: String;
begin
{ TODO -oGPatil -cWebConvert : TUpDown not present in UniGui
  APounds := udPounds.Position;
  AOunces := IQMS.Common.StringUtils.StrToFloatSafe(edtOunces.Text) / 16;

  if PnlFlatRate.Visible and chkFlatRate.Checked then
     Result := APounds
  else
     Result := APounds + AOunces;
  }
end;

procedure TFrmShipManUSPSWeight.SetWeight(const Value: Real);
var
   APounds: Integer;
   AOunces: Real;
begin
  USPS_ParseWeight(Value, APounds, AOunces); // shipman_usps.pas
{ TODO -oGPatil -cWebConvert : TUpDown not present in UniGui
  udPounds.Position := APounds;
  FSpinning := true;
  edtOunces.Text := FloatToStr(AOunces);
  udOunces.Position := Trunc(AOunces * 10);  }
  FSpinning := false;
end;

procedure TFrmShipManUSPSWeight.UniFormCreate(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : TUniPanel does not contain a member named Visible
  PnlFlatRate.Visible := AShowFlatRate;  }
  SetButtons;
end;

{ TODO -oGPatil -cWebConvert : TUDBtnType and TUpDown not present in UniGui
procedure TFrmShipManUSPSWeight.udOuncesClick(Sender: TObject;
  Button: TUDBtnType);
var
  Pos: Integer;
begin
  try
    Pos := Round(StrToFloat(edtOunces.Text) * 10);
  except
    Pos := (Sender as TUpDown).Min;
  end;
  case Button of
    btNext:
      if Pos < (Sender as TUpDown).Max then
        Inc(Pos, (Sender as TUpDown).Increment);
    btPrev:
      if Pos > (Sender as TUpDown).Min then
        Dec(Pos, (Sender as TUpDown).Increment);
  end;
  edtOunces.Text := FloatToStr(Pos * 0.1);
end;  }

procedure TFrmShipManUSPSWeight.chkFlatRateClick(Sender: TObject);
begin
  Application.ProcessMessages;
  SetButtons;
end;

procedure TFrmShipManUSPSWeight.SetButtons;
begin
{ TODO -oGPatil -cWebConvert : TUniPanel does not contain Visible
  if PnlFlatRate.Visible then
     IQMS.Common.Controls.IQEnableControl([lblOunces,edtOunces,udOunces], not chkFlatRate.Checked);   }
end;

end.

