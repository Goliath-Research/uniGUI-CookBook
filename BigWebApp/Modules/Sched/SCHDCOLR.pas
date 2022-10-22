unit Schdcolr;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Winapi.Messages,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniBitBtn, Vcl.ExtCtrls, uniColorButton;

type
  TFrm_Colors = class(TUniForm)
    GroupBox1: TUniGroupBox;
    btnDefault: TUniBitBtn;
    PnlButton: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniBitBtn;
    btncancel: TUniBitBtn;
    Shape1: TUniPanel;
    Shape2: TUniPanel;
    btnBackGround: TUniColorButton;
    btnLines: TUniColorButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure btnBackGroundSelect(Sender: TObject; Color: TColor);
    procedure btnLinesSelect(Sender: TObject; Color: TColor);
  private
    { Private declarations }
    SaveSchedColor:  TColor;
    SaveGridColor :   TColor;
    SchedColor    :  TColor;
    GridColor     :   TColor;
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

uses
 MainModule;
//  Sched_mn,
//  SchdGVS;

procedure TFrm_Colors.FormCreate(Sender: TObject);
begin
//  with TSchedGVS( TFrm_MainSched(Owner).Child ).SchedOCX1 do
//  begin
//    Shape1.Brush.Color:= SchedBackColor;
//    Shape2.Brush.Color:= SchedGridColor;
//    SaveSchedColor:= SchedBackColor;
//    SaveGridColor := SchedGridColor;
//    SchedColor:= SaveSchedColor;
//    GridColor := SaveGridColor;
//  end;
end;

procedure TFrm_Colors.btnLinesSelect(Sender: TObject; Color: TColor);
begin
    Shape2.Color := Color;
    GridColor := Color;
end;

procedure TFrm_Colors.btnOKClick(Sender: TObject);
begin
//  with TSchedGVS( TFrm_MainSched(Owner).Child ).SchedOCX1 do
//  begin
//    SchedBackColor := SchedColor;
//    SchedGridColor := Gridcolor;
//  end;
end;

procedure TFrm_Colors.btnDefaultClick(Sender: TObject);
begin
  Shape1.Color := clWhite;
  Shape2.Color := clTeal;
  SchedColor := clWhite;
  GridColor := clTeal;
end;

procedure TFrm_Colors.btnBackGroundSelect(Sender: TObject; Color: TColor);
begin
   Shape1.Color := Color;
   SchedColor := Color;
end;

procedure TFrm_Colors.btncancelClick(Sender: TObject);
begin
  SchedColor:= SaveSchedColor;
  GridColor := SaveGridColor;
  Shape1.Color := SaveSchedColor;
  Shape2.Color := SaveGridColor;
  btnOKClick(Sender);
  Close;
end;

end.
