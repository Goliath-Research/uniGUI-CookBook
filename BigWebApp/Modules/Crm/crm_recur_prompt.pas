unit crm_recur_prompt;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniRadioButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniBitBtn,UniRadioGroup,Uniimage;

type
  TFrmCRMRecurPrompt1 = class(TUniForm)
    Panel2: TUniPanel;
    PnlButtons: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlGlyph: TUniPanel;
    PnlMain: TUniPanel;
    PnlPrompt: TUniPanel;
    Bevel3: TUniPanel;
    Panel3: TUniPanel;
    lblPrompt: TUniLabel;
    Bevel4: TUniPanel;
    lblPrompt2: TUniLabel;
    PnlOptions: TUniPanel;
    rgOptions: TUniRadioGroup;
    RadioButton1: TUniRadioButton;
    RadioButton2: TUniRadioButton;
    Image1: TUniImage;
  private
    { Private declarations }

    function GetSelectedIndex : integer;
  public
    { Public declarations }
    property SelectedIndex: Integer read GetSelectedIndex;
  end;

function DoPromptRecSaveOption(var ASelectedIndex: Integer): Boolean;


implementation

{$R *.dfm}


function DoPromptRecSaveOption(var ASelectedIndex: Integer): Boolean;
var
  FrmCRMRecurPrompt1 : TFrmCRMRecurPrompt1;
begin
  FrmCRMRecurPrompt1 := TFrmCRMRecurPrompt1.Create(uniGUIApplication.UniApplication);
   with FrmCRMRecurPrompt1 do
    begin
      Result := ShowModal = mrOk;
      if Result then
        ASelectedIndex := SelectedIndex
      else
        ASelectedIndex := - 1;
    end;
end;

{ TFrmCRMRecurPrompt1 }

function TFrmCRMRecurPrompt1.GetSelectedIndex: Integer;
begin
  if RadioButton1.Checked then
    Result := 0
  else
    Result := 1;
end;

end.
