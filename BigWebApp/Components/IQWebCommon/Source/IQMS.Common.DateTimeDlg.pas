unit IQMS.Common.DateTimeDlg;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  System.Math,
  IQMS.WebVcl.DateControls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniDateTimePicker,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmDateTimeDlg = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    Panel1: TUniPanel;
    lblDateTime: TUniLabel;
    cmbDate: TUniDateTimePicker;
    cmbTime: TUniDateTimePicker;
    btnOk: TUniButton;
    btnCancel: TUniButton;
  private
    { Private declarations }
    procedure PositionControls;
    function GetDateTime: TDateTime;
    procedure SetDateTime(const Value: TDateTime);
  public
    { Public declarations }
    constructor Create(ADateTime: TDateTime);
    property DateTime: TDateTime read GetDateTime write SetDateTime;
  end;

  function DoDateTimeDialog( var ADateTime: TDateTime;
   AFormCaption: String = ''): Boolean;


var
  FrmDateTimeDlg: TFrmDateTimeDlg;

implementation

{$R *.dfm}

uses
  IQMS.Common.Dates,
  IQMS.Common.Miscellaneous;

function DoDateTimeDialog( var ADateTime: TDateTime;
 AFormCaption: String): Boolean;
begin
  with TFrmDateTimeDlg.Create( ADateTime ) do
  begin
     if AFormCaption > '' then
        Caption := AFormCaption;
     Result := ShowModal = mrOk;
     if Result then
        ADateTime := DateTime;
  end;
end;

{ TFrmDateTimeDlg }

constructor TFrmDateTimeDlg.Create(ADateTime: TDateTime);
begin
  inherited Create(uniGUIApplication.UniApplication);

  PositionControls;

  if IQMS.Common.Miscellaneous.EnsureConnectionExists() then
     DateTime := IQMS.Common.Dates.IQOracleAdjustedDateTime
  else
     DateTime := Now();

  if Trunc(ADateTime) > 0 then
     DateTime := ADateTime;
end;

procedure TFrmDateTimeDlg.PositionControls;
var
   w: Integer;
begin
  // Position date controls
  cmbDate.Left := lblDateTime.Left + lblDateTime.Width + 16;
  cmbTime.Left := cmbDate.Left + cmbDate.Width + 4;
  w := cmbTime.Left + cmbTime.Width + 16;
  Self.Width := Max(Self.Width, w);
end;

function TFrmDateTimeDlg.GetDateTime: TDateTime;
begin
  Result := Trunc(cmbDate.DateTime) + Frac(cmbTime.DateTime);
end;

procedure TFrmDateTimeDlg.SetDateTime(const Value: TDateTime);
begin
  cmbDate.DateTime := Trunc(Value);
  cmbTime.DateTime := Frac(Value);
end;

end.
