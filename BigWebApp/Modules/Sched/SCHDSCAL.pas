unit Schdscal;

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
  Spin,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSpinEdit,
  uniLabel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniBitBtn;

type
  TFrm_Scale = class(TUniForm)
    Label2: TUniLabel;
    spnFactor: TUniSpinEdit;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    spnLineHeight: TUniSpinEdit;
    btnDefault: TUniBitBtn;
    procedure spnFactorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
    procedure spnLineHeightChange(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeLineHeight(AValue:Integer);
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

uses
 MainModule;
//  Sched_mn,
//  SchdGVS;TFrm_Scale(UniMainModule.GetFormInstance(TFrm_Scale));


procedure TFrm_Scale.FormCreate(Sender: TObject);
begin
//  with TSchedGVS( TFrm_MainSched(Owner).Child ).SchedOCX1 do
//  begin
//    spnLineHeight.Value:= ResLineHeight[ 0 ];
//    spnFactor.Value    := TSMinorCount[ 0 ];
//  end;
end;

procedure TFrm_Scale.spnFactorChange(Sender: TObject);
begin
//  TSchedGVS( TFrm_MainSched(Owner).Child ).SchedOCX1.TSMinorCount[0] := spnFactor.Value;
end;

procedure TFrm_Scale.btnDefaultClick(Sender: TObject);
begin
  ChangeLineHeight( 20 );
  spnLineHeight.Value := 20;
end;

procedure TFrm_Scale.spnLineHeightChange(Sender: TObject);
begin
  ChangeLineHeight( spnLineHeight.Value );
end;

procedure TFrm_Scale.ChangeLineHeight(AValue:Integer);
var
  i: integer;
begin
//  with TSchedGVS( TFrm_MainSched(Owner).Child ).SchedOCX1 do
//  for i := 0 to ResMax - 1 do
//    ResLineHeight[i] := AValue;
end;

end.
