unit SL_endprompt;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniBitBtn, uniRadioGroup;

type
  TFrmSLEndPrompt = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    rgOptions: TUniRadioGroup;
    Panel3: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
  private
    { Private declarations }

    function GetOption: integer;
  public
    { Public declarations }

    property Option : integer read GetOption;
  end;

function DoSLEndPrompt( var AOption: Integer ): Boolean;

implementation

{$R *.DFM}

function DoSLEndPrompt( var AOption: Integer ): Boolean;
var
  frm : TFrmSLEndPrompt;
begin
  frm := TFrmSLEndPrompt.Create(uniGUIApplication.UniApplication);
  Result  := frm.ShowModal = mrOk;
  if Result then
    AOption := frm.Option;
end;

{ TFrmEndPrompt }

function TFrmSLEndPrompt.GetOption: integer;
begin
  Result := rgOptions.ItemIndex;
end;

end.
