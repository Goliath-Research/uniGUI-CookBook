unit BG_Prompt_Kind;

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
  ExtCtrls,
  StdCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniButton;

type
  TFrmBFPromptKind = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Label1: TUniLabel;
    wwDBComboBox1: TUniDBComboBox;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
  private
    { Private declarations }
  public
    { Public declarations }
    function DoShowModal(var AKind: string ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  MainModule;

{ TFrmBFPromptKind }

function TFrmBFPromptKind.DoShowModal(var AKind: string): Boolean;
var
  FrmBFPromptKind : TFrmBFPromptKind;
begin
  FrmBFPromptKind := TFrmBFPromptKind.Create(UniApplication);
  with FrmBFPromptKind do
  begin
    Result:= ShowModal = mrOK;
    if Result then
       AKind:= wwDBComboBox1.Text;
  end;
end;

end.
