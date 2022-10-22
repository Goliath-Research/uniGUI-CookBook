unit IQLMSdProd;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  IQLMProd,
  Mask,
  Vcl.Buttons,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Hpick,
  Data.DB,
  FireDAC.Comp.DataSet,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UserDefinedLabel,
  Vcl.Forms,
  Vcl.Controls,
  IQMS.WebVcl.UDComboBox,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel, uniMainMenu, uniSplitter, uniScrollBox, IQUniGrid, uniGUIFrame,
  uniDBNavigator, uniComboBox, uniDBComboBox, uniDateTimePicker,
  uniDBDateTimePicker, uniMultiItem, uniDBLookupComboBox, uniPageControl,
  uniLabel;

type
  TFrmSDLM_Prod = class(TFrmLM_Prod)
    sbtnEditBoxQty: TUniSpeedButton;
    sbtnLabelsQty: TUniSpeedButton;
    sbtnEditWeight: TUniSpeedButton;
    sbtnEditLot: TUniSpeedButton;
    pnlUDTextButtons: TUniPanel;
    pnlUDTextSpeedBtn1: TUniSpeedButton;
    pnlUDTextSpeedBtn2: TUniSpeedButton;
    pnlUDTextSpeedBtn3: TUniSpeedButton;
    pnlUDTextSpeedBtn4: TUniSpeedButton;
    pnlUDTextSpeedBtn5: TUniSpeedButton;
    pnlUDTextSpeedBtn6: TUniSpeedButton;
    pnlUDTextSpeedBtn7: TUniSpeedButton;
    pnlUDTextSpeedBtn8: TUniSpeedButton;
    pnlUDTextSpeedBtn9: TUniSpeedButton;
    pnlUDTextSpeedBtn10: TUniSpeedButton;
    pnlUDNumButtons: TUniPanel;
    pnlUDNumSpeedBtn1: TUniSpeedButton;
    pnlUDNumSpeedBtn2: TUniSpeedButton;
    pnlUDNumSpeedBtn3: TUniSpeedButton;
    pnlUDNumSpeedBtn4: TUniSpeedButton;
    pnlUDNumSpeedBtn5: TUniSpeedButton;
    pnlUDNumSpeedBtn6: TUniSpeedButton;
    pnlUDNumSpeedBtn7: TUniSpeedButton;
    pnlUDNumSpeedBtn8: TUniSpeedButton;
    pnlUDNumSpeedBtn9: TUniSpeedButton;
    pnlUDNumSpeedBtn10: TUniSpeedButton;
    procedure sbtnEditBoxQtyClick(Sender: TObject);
    procedure sbtnLabelsQtyClick(Sender: TObject);
    procedure sbEditBoxNumClick(Sender: TObject);
    procedure sbtnEditWeightClick(Sender: TObject);
    procedure sbtnEditLotClick(Sender: TObject);
    procedure pnlUDTextSpeedBtn1Click(Sender: TObject);
    procedure pnlUDNumSpeedBtn1Click(Sender: TObject);
    procedure PnlUserDefinedResize(Sender: TObject);
  private
    function SpeedButtonToEdit( Sender: TObject; var AEdit: TUniEdit ): Boolean;
    { Private declarations }
  public
    { Public declarations }
    constructor Create( AOwner:TComponent; AArinvt_ID: Real ); override;
  end;

var
  FrmSDLM_Prod: TFrmSDLM_Prod;

implementation

{$R *.dfm}

uses
 // touchscrn,
  IQMS.Common.Numbers,
  IQMS.Common.Controls;

constructor TFrmSDLM_Prod.Create( AOwner:TComponent; AArinvt_ID: Real );
begin
  inherited;

  sbEditBoxNum.ShowHint:= FALSE;
end;

procedure TFrmSDLM_Prod.sbEditBoxNumClick(Sender: TObject);
var
   AResult : Real;
begin
  try
     inherited;

     if not IQMS.Common.Numbers.IsStringValidFloat(EditBoxNum.Text, AResult) then
        AResult := 0;

     AResult:= fMax(1, AResult);

 //    if touchscrn.TouchScreen_KeyPad( self, AResult ) then
   //     EditBoxNum.Text := FloatToStr( fMax(1, AResult ));

  except on E:Exception do
    begin
  //    touchscrn.TouchScreen_Msg_Error(E.Message);
      System.SysUtils.Abort;
    end;
  end;
end;

procedure TFrmSDLM_Prod.sbtnEditBoxQtyClick(Sender: TObject);
begin
 // touchscrn.TouchScreen_EditFloat(EditBox);
end;

procedure TFrmSDLM_Prod.sbtnEditLotClick(Sender: TObject);
var
  AText: string;
begin
  AText:= edLotNo.Text;
//  if touchscrn.TouchScreen_KeyboardSimple( self, AText, 25, 'Enter Lot #' ) then
  //   edLotNo.Text:= AText
end;

procedure TFrmSDLM_Prod.sbtnEditWeightClick(Sender: TObject);
begin
 // touchscrn.TouchScreen_EditFloat(EditWeight);
end;

procedure TFrmSDLM_Prod.sbtnLabelsQtyClick(Sender: TObject);
begin
 // touchscrn.TouchScreen_EditFloat(EditLblQty);
end;

function TFrmSDLM_Prod.SpeedButtonToEdit( Sender: TObject; var AEdit: TUniEdit ): Boolean;
begin
  Result:= FALSE;
  if not (Sender is TUniSpeedButton) then
     EXIT;

  if Sender = pnlUDTextSpeedBtn1       then AEdit:= dbeCUSER1
  else if Sender = pnlUDTextSpeedBtn2  then AEdit:= dbeCUSER2
  else if Sender = pnlUDTextSpeedBtn3  then AEdit:= dbeCUSER3
  else if Sender = pnlUDTextSpeedBtn4  then AEdit:= dbeCUSER4
  else if Sender = pnlUDTextSpeedBtn5  then AEdit:= dbeCUSER5
  else if Sender = pnlUDTextSpeedBtn6  then AEdit:= dbeCUSER6
  else if Sender = pnlUDTextSpeedBtn7  then AEdit:= dbeCUSER7
  else if Sender = pnlUDTextSpeedBtn8  then AEdit:= dbeCUSER8
  else if Sender = pnlUDTextSpeedBtn9  then AEdit:= dbeCUSER9
  else if Sender = pnlUDTextSpeedBtn10 then AEdit:= dbeCUSER10

  else if Sender = pnlUDNumSpeedBtn1   then AEdit:= dbeNUSER1
  else if Sender = pnlUDNumSpeedBtn2   then AEdit:= dbeNUSER2
  else if Sender = pnlUDNumSpeedBtn3   then AEdit:= dbeNUSER3
  else if Sender = pnlUDNumSpeedBtn4   then AEdit:= dbeNUSER4
  else if Sender = pnlUDNumSpeedBtn5   then AEdit:= dbeNUSER5
  else if Sender = pnlUDNumSpeedBtn6   then AEdit:= dbeNUSER6
  else if Sender = pnlUDNumSpeedBtn7   then AEdit:= dbeNUSER7
  else if Sender = pnlUDNumSpeedBtn8   then AEdit:= dbeNUSER8
  else if Sender = pnlUDNumSpeedBtn9   then AEdit:= dbeNUSER9
  else if Sender = pnlUDNumSpeedBtn10  then AEdit:= dbeNUSER10
  else
       EXIT;

  Result:= TRUE;
end;

procedure TFrmSDLM_Prod.pnlUDTextSpeedBtn1Click(Sender: TObject);
var
  AText: string;
  AEdit: TUniEdit;
begin
  if SpeedButtonToEdit( Sender, AEdit ) then
  begin
    AText:= AEdit.Text;
//    if touchscrn.TouchScreen_KeyboardSimple( self, AText, 60, 'Enter Text' ) then
  //     AEdit.Text:= AText
  end;
end;

procedure TFrmSDLM_Prod.pnlUDNumSpeedBtn1Click(Sender: TObject);
var
  AEdit: TUniEdit;
begin
//  if SpeedButtonToEdit( Sender, AEdit ) then
  //   touchscrn.TouchScreen_EditFloat(AEdit);
end;

procedure TFrmSDLM_Prod.PnlUserDefinedResize(Sender: TObject);
begin
  inherited;  // n
  IQMS.Common.Controls.RefreshComponents([ dbeCUSER1,
                             dbeCUSER2,
                             dbeCUSER3,
                             dbeCUSER4,
                             dbeCUSER5,
                             dbeCUSER6,
                             dbeCUSER7,
                             dbeCUSER8,
                             dbeCUSER9,
                             dbeCUSER10 ],
                             pnlUDTextButtons.Width + 2,
                             nil );

  IQMS.Common.Controls.RefreshComponents([ dbeNUSER1,
                             dbeNUSER2,
                             dbeNUSER3,
                             dbeNUSER4,
                             dbeNUSER5,
                             dbeNUSER6,
                             dbeNUSER7,
                             dbeNUSER8,
                             dbeNUSER9,
                             dbeNUSER10 ],
                             pnlUDNumButtons.Width + 2,
                             nil );
end;

end.

