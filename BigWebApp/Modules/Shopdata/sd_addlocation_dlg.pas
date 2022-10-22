unit sd_addlocation_dlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB;

type
  TFrmSDAddLocation = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    Panel1: TUniPanel;
    lblLocation: TUniLabel;
    Panel2: TUniPanel;
    edtLocation: TUniEdit;
    sbtnSearch: TUniSpeedButton;
    lblQuantity: TUniLabel;
    lblRGQuantity: TUniLabel;
    edtQuantity: TUniEdit;
    edtRGQuantity: TUniEdit;
    sbtnQuantity: TUniSpeedButton;
    sbtnRGQuantity: TUniSpeedButton;
    IQHpick1: TIQWebHPick;
    procedure sbtnSearchClick(Sender: TObject);
    procedure sbtnQuantityClick(Sender: TObject);
    procedure sbtnRGQuantityClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FPickList: TIQWebHPick;
    FFGMultiID, FQuantity, FRGQuantity: Real;
    FShowRegrind: Boolean;
    procedure SetFGMultiID(const Value: Real);
    procedure SetQuantity(const Value: Real);
    procedure SetRGQuantity(const Value: Real);
    procedure SetShowRegrind(const Value: Boolean);
    procedure SetPickList(const Value: TIQWebHPick);
  public
    { Public declarations }
    property PickList: TIQWebHPick write SetPickList;
    property FGMultiID: Real read FFGMultiID write SetFGMultiID;
    property Quantity: Real read FQuantity write SetQuantity;
    property RGQuantity: Real read FRGQuantity write SetRGQuantity;
    property ShowRegrind: Boolean read FShowRegrind write SetShowRegrind;
  end;

  function GetValuesForLocationIn( const APickList: TIQWebHPick;
   const AShowRegrind: Boolean; var AFGMultiID, AQuantity, ARGQuantity: Real): Boolean;
  function GetValuesForLocationOut(const APickList: TIQWebHPick;
   var AFGMultiID, AQuantity: Real): Boolean;



implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib
  { TODO -oSanketG -cWC : Need to revisit }
  //touchscrn
  ;

function GetValuesForLocationIn(const APickList: TIQWebHPick;
 const AShowRegrind: Boolean; var AFGMultiID, AQuantity, ARGQuantity: Real): Boolean;
var
  FrmSDAddLocation: TFrmSDAddLocation;
begin
  if not Assigned(APickList) then
     Exit;

  FrmSDAddLocation := TFrmSDAddLocation.Create(UniGUIApplication.UniApplication);
  with FrmSDAddLocation  do
  begin
    try
       PickList := APickList;
       FGMultiID := AFGMultiID;
       Quantity := AQuantity;
       RGQuantity := ARGQuantity;
       ShowRegrind := AShowRegrind;
       Result := ShowModal = mrOk;
       if Result then
          begin
            AFGMultiID := FFGMultiID;
            AQuantity := FQuantity;
            ARGQuantity := FRGQuantity;
          end;
    finally
       //Free;
    end;
  end;
end;

function GetValuesForLocationOut(const APickList: TIQWebHPick;
 var AFGMultiID, AQuantity: Real): Boolean;
var
  FrmSDAddLocation: TFrmSDAddLocation;
begin
  if not Assigned(APickList) then
     Exit;

  FrmSDAddLocation := TFrmSDAddLocation.Create(UniGUIApplication.UniApplication);
  with FrmSDAddLocation do
  begin
    try
       PickList := APickList;
       FGMultiID := AFGMultiID;
       Quantity := AQuantity;
       RGQuantity := 0;
       ShowRegrind := False;
       Result := ShowModal = mrOk;
       if Result then
          begin
            AFGMultiID := FFGMultiID;
            AQuantity := FQuantity;
          end;
    finally
       //Free;
    end;
  end;
end;

{ TFrmSDAddLocation }

procedure TFrmSDAddLocation.UniFormCreate(Sender: TObject);
begin

  FShowRegrind := True;
  // 07/17/2012 Ensure touch-screen font applied.
  { TODO -oSanketG -cWC : Need to revisit , dependent on touchscrn}
  //touchscrn.ApplyTouchscreenFont(Self);
  { TODO -oSanketG -cWC : Need to revisit ,
  [dcc32 Error] sd_addlocation_dlg.pas(161): E2010 Incompatible types: 'TForm' and 'TFrmSDAddLocation'}
  //IQMS.Common.Controls.CenterForm(Self, True);
end;

procedure TFrmSDAddLocation.sbtnSearchClick(Sender: TObject);
begin
  if Assigned(FPickList) then
     with FPickList do
      if Execute then
         begin
           edtLocation.Text := GetValue('LOC_DESC');
           FFGMultiID := GetValue('FGMULTI_ID');
         end;
end;

procedure TFrmSDAddLocation.sbtnQuantityClick(Sender: TObject);
var
   AResult: Real;
begin
  AResult := FQuantity;
  { TODO -oSanketG -cWC : Need to revisit,dependent on touchscrn}
  {if touchscrn.TouchScreen_KeyPad(Self, AResult) then
     Quantity := AResult;}
end;

procedure TFrmSDAddLocation.sbtnRGQuantityClick(Sender: TObject);
var
   AResult: Real;
begin
  AResult := FRGQuantity;
  { TODO -oSanketG -cWC : Need to revisit,dependent on touchscrn}
  {if touchscrn.TouchScreen_KeyPad(Self, AResult) then
     RGQuantity := AResult;}
end;

procedure TFrmSDAddLocation.SetFGMultiID(const Value: Real);
var
   AData: Variant;
begin
  FFGMultiID := Value;
  AData := SelectValueArrayFmt('SELECT a.loc_id, b.loc_desc, a.onhand, a.rg_onhand, a.lotno'#13 +
                                'FROM fgmulti a, locations b'#13 +
                                'WHERE a.id = %.0f AND'#13 +
                                '      b.id = a.loc_id',
                                [Value]);
  if System.Variants.VarArrayDimCount(AData) > 0 then
     begin
       edtLocation.Text := AData[1];
     end;
end;

procedure TFrmSDAddLocation.SetPickList(const Value: TIQWebHPick);
begin
  FPickList := Value;
end;

procedure TFrmSDAddLocation.SetQuantity(const Value: Real);
begin
  FQuantity := Value;
  if FQuantity = 0 then
     edtQuantity.Clear
  else
     edtQuantity.Text := FloatToStr(Value);
end;

procedure TFrmSDAddLocation.SetRGQuantity(const Value: Real);
begin
  FRGQuantity := Value;
  if FRGQuantity = 0 then
     edtRGQuantity.Clear
  else
     edtRGQuantity.Text := FloatToStr(Value);
end;

procedure TFrmSDAddLocation.SetShowRegrind(const Value: Boolean);
begin
  FShowRegrind := Value;
  IQMS.Common.Controls.IQShowControl([lblRGQuantity, edtRGQuantity, sbtnRGQuantity],
   Value);
end;


end.
