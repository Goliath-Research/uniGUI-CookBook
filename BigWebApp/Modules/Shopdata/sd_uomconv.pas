unit sd_uomconv;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  IQMS.CommonUomConv,
  Vcl.Buttons,
  Mask,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton, uniMultiItem, uniComboBox, uniDBComboBox, uniEdit, uniLabel,
  Vcl.Forms, uniPanel;

type
  TFrmSDConvertUOM = class(TFrmConvertUOM)
    sbtnEditBoxQty: TUniSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure sbtnEditBoxQtyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function IQGetConvertedUOM_SD(ASource, ATarget: String; var AValue: Real;
  AType: String; AArinvt_ID: Real): Boolean;

implementation

{$R *.DFM}


uses
  IQMS.Common.Numbers;
  { TODO : touchscrn not yet converted }
 // touchscrn;

function IQGetConvertedUOM_SD(ASource, ATarget: String; var AValue: Real;
  AType: String; AArinvt_ID: Real): Boolean;
begin
  with TFrmSDConvertUOM.Create(ASource, ATarget, AValue, AType, AArinvt_ID) do
    try
      if ShowModal <> mrOk then
        Result := False
      else
        begin
          AValue := FValue;
          Result := True;
        end;
    finally
      Free;
    end;
end;

procedure TFrmSDConvertUOM.FormShow(Sender: TObject);
begin
  // 07/17/2012 Ensure touch-screen font applied.

  { TODO : touchscrn has not been converted yet }
  //touchscrn.ApplyTouchscreenFont(Self);
  inherited;
  { TODO : TUniDBComboBox has no member ButtonWidth }
  //cbTarget.ButtonWidth := 48;
end;

procedure TFrmSDConvertUOM.sbtnEditBoxQtyClick(Sender: TObject);
var
  AResult: Real;
begin
  if not IQMS.Common.Numbers.IsStringValidFloat(edFrom.Text, AResult) then
    AResult := 0;

    { TODO : touchscrn has not been converted yet }
  {if touchscrn.TouchScreen_KeyPad(Self, AResult) then
    edFrom.Text := FloatToStr(AResult);  }
end;

end.
