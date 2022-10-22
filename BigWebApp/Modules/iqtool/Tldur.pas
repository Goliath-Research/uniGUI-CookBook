unit Tldur;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  IQMS.WebVcl.FloatSpinner,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniSpinEdit;

type
  TFrmToolingDuration = class(TUniForm)
    PnlCarrier: TUniPanel;
    lblDuration: TUniLabel;
    lblUnit: TUniLabel;
    cmbUnit: TUniComboBox;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetDisplayValues(ARawDuration: Real; ARawUnit: Integer);
  public
    { Public declarations }
  end;

function DoGetDurationValues(var ADuration: Real;
  var ADurationDisplayUnit: Integer): Boolean;

// var
// FrmToolingDuration: TFrmToolingDuration;

implementation

{$R *.DFM}

uses
  duration,
  // tlshr,
  IQMS.Common.Controls,
  IQMS.Common.RegFrm;

function DoGetDurationValues(var ADuration: Real;
  var ADurationDisplayUnit: Integer): Boolean;
var
  LFrmToolingDuration: TFrmToolingDuration;
begin

  LFrmToolingDuration := TFrmToolingDuration.Create
    (uniGUIApplication.UniApplication);
  with LFrmToolingDuration do
  begin
    SetDisplayValues(ADuration, ADurationDisplayUnit);
    Result := ShowModal = mrOk;
    if Result then
    begin
      ADurationDisplayUnit := SetDurationDisplayUnit(cmbUnit.Text);
      ADuration := SetDuration(cmbDuration.Position,
        SetDurationDisplayUnit(cmbUnit.Text)); // duration.pas
    end;
  end;
end;

procedure TFrmToolingDuration.FormShow(Sender: TObject);
begin
  //IQMS.Common.Controls.CenterForm(Tldur True);
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
end;

procedure TFrmToolingDuration.SetDisplayValues(ARawDuration: Real;
  ARawUnit: Integer);
begin
  if (Trunc(ARawDuration) <> 0) and (ARawUnit <> 0) then
  begin
    cmbDuration.Position := GetDuration(ARawDuration, ARawUnit);
    cmbUnit.Text := GetDurationDisplayUnit(ARawUnit);
  end;
end;

end.
