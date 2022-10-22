unit IQMS.PrintLabels.LMEditTouchScreen;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  IQMS.PrintLabels.LMEdit,
//  Vcl.Wwdatsrc,
  Mask,
  uniGUIApplication,
  Vcl.Buttons,
  System.Variants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  Vcl.Dialogs,
  Vcl.Menus,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniStatusBar,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniMainMenu, IQUniGrid, Vcl.Forms, uniGUIFrame, uniEdit,
  uniDBEdit, uniDBLookupComboBox, uniLabel, uniPageControl, uniDBNavigator,
  uniSplitter, uniFileUpload;

type
  { TFrmLabelsTouchScreen }
  TFrmLabelsTouchScreen = class(TFrmLabels)
    sbtnExit: TUniButton;
    cmbLabelType: TUniDBComboBox;
    cmbLabelKind: TUniDBComboBox;
    StatusBar1: TUniStatusBar;
    Bevel1: TUniPanel;
    sbtnServerDropDown: TUniSpeedButton;
    SpeedButton3: TUniSpeedButton;
    SpeedButton1: TUniSpeedButton;
    SpeedButton5: TUniSpeedButton;
    procedure sbtnEditWidthClick(Sender: TObject);
    procedure sbtnArcustoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbtnServerDropDownClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

var
  FrmLabelsTouchScreen: TFrmLabelsTouchScreen;

implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
//  touchscrn,
  IQMS.WebVcl.ResourceStrings;

{ TFrmLabelsTouchScreen }

class procedure TFrmLabelsTouchScreen.DoShowModal;
begin
  with TFrmLabelsTouchScreen.Create(uniGUIApplication.UniApplication) do
    begin
      ShowModal;
    end;
end;

procedure TFrmLabelsTouchScreen.FormCreate(Sender: TObject);
begin
  inherited;

//  touchscrn.ApplyTouchscreenFont(Self);
end;

procedure TFrmLabelsTouchScreen.FormShow(Sender: TObject);
begin
  inherited;
//  IQMS.Common.Controls.CenterForm(Self, True);
//  touchscrn.EnsureTouchScreenToolboxOnTopOf(Self);
end;

procedure TFrmLabelsTouchScreen.sbtnEditWidthClick(Sender: TObject);
var
  ANewWidth: Real;
begin
  if not (TblLabels.Bof and TblLabels.Eof) then
    try
      ANewWidth := TblLabelsDtlACT_WIDTH.AsFloat;
//      if touchscrn.TouchScreen_KeyPad(Self, { var } ANewWidth) then
//        begin
//          TblLabelsDtl.Edit;
//          TblLabelsDtlACT_WIDTH.AsFloat := ANewWidth;
//        end;
    except
      on E: Exception do
        begin
//          touchscrn.TouchScreen_Msg_Error(E.Message);
          System.SysUtils.Abort;
        end;
    end;
end;

procedure TFrmLabelsTouchScreen.sbtnArcustoClick(Sender: TObject);
begin
//  try
//    with PkArcusto do
//      if Execute then
//        begin
//          TblLabels.Edit;
//          TblLabelsARCUSTO_ID.AsFloat := System.Variants.VarAsType(GetValue('ID'),
//            varInteger);
//        end;
//  except
//    on E: Exception do
//      begin
//        touchscrn.TouchScreen_Msg_Error(E.Message);
//        System.SysUtils.Abort;
//      end;
//  end;
end;

procedure TFrmLabelsTouchScreen.SpeedButton3Click(Sender: TObject);
begin
  inherited;
//  cmbLabelType.DropDown;
end;

procedure TFrmLabelsTouchScreen.SpeedButton1Click(Sender: TObject);
begin
  inherited;
//  cmbLabelKind.DropDown;
end;

procedure TFrmLabelsTouchScreen.sbtnServerDropDownClick(Sender: TObject);
begin
//  wwDBComboBox1.DropDown;
end;

procedure TFrmLabelsTouchScreen.SpeedButton5Click(Sender: TObject);
begin
//  wwDBComboBox2.DropDown;
end;

end.
