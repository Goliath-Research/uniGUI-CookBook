unit rsm_viewconst;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMemo,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit;

type
  TFrmRsmViewConst = class(TUniForm)
    Label1: TUniLabel;
    edtConstant: TUniEdit;
    memText: TUniMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure DoViewConst(const AConstantName, ANativeText: String);


implementation

{$R *.dfm}

Uses
MainModule;

procedure DoViewConst(const AConstantName, ANativeText: String);
var
  FrmRsmViewConst : TFrmRsmViewConst;
begin
  FrmRsmViewConst := TFrmRsmViewConst.Create(UniApplication);
   with FrmRsmViewConst do
    begin
      edtConstant.Text := AConstantName;
      memText.Text := ANativeText;
      ShowModal;
    end;
end;

end.
