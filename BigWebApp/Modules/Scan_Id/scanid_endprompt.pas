unit scanid_endprompt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
//db_dm,            Not found
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
  TFrmEndPrompt = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    rgOptions: TUniRadioGroup;
    Panel3: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
  private
    function GetOption: integer;
    { Private declarations }
  public
    { Public declarations }

    property Option : integer read GetOption;
  end;

  function DoEndPrompt(var AOption: Integer): Boolean;

implementation

{$R *.DFM}

function DoEndPrompt(var AOption: Integer): Boolean;
var
  frm : TFrmEndPrompt;
begin
  frm := TFrmEndPrompt.Create(uniGUIApplication.UniApplication);
  Result  := frm.ShowModal = mrOk;
  if Result then
    AOption := frm.Option;
end;

{ TFrmEndPrompt }

function TFrmEndPrompt.GetOption: integer;
begin
  Result := rgOptions.ItemIndex;
end;

end.
