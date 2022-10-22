unit jcselect;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TfrmJCSelect = class(TUniForm)
    GroupBox1: TUniGroupBox;
    BitBtn1: TUniBitBtn;
    Cancel: TUniButton;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    GroupBox2: TUniGroupBox;
    From: TUniLabel;
    Label4: TUniLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoJCSelectCriteria;
  
var
  frmJCSelect: TfrmJCSelect;

implementation

{$R *.DFM}

procedure DoJCSelectCriteria;
begin
  with TfrmJCSelect.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmJCSelect.BitBtn1Click(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

end.
