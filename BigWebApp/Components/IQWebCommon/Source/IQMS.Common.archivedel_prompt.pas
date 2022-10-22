unit IQMS.Common.archivedel_prompt;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,UniRadioGroup;

type
  {TArchiveDeleteResult}
  TArchiveDeleteResult = (qarResponseCancel, qarResponseDelete, qarResponseArchive);

  {TFrmArchiveDeletePrompt}
  TFrmArchiveDeletePrompt = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel1: TUniPanel;
    grpOptions: TUniRadioGroup;
  private
    { Private declarations }
    function GetSelectedOption: TArchiveDeleteResult;
  public
    { Public declarations }
  end;

function PromptArchiveOrDelete: TArchiveDeleteResult;


implementation

{$R *.DFM}

function PromptArchiveOrDelete: TArchiveDeleteResult;
var
  FrmArchiveDeletePrompt: TFrmArchiveDeletePrompt;
begin
  FrmArchiveDeletePrompt:= TFrmArchiveDeletePrompt.Create(uniGUIApplication.UniApplication);
  with FrmArchiveDeletePrompt do
  begin
    if (ShowModal = mrOk)
      then Result := GetSelectedOption() {get the user's choice}
      else Result := qarResponseCancel;
  end;
end;

function TFrmArchiveDeletePrompt.GetSelectedOption: TArchiveDeleteResult;
begin
  case grpOptions.ItemIndex of
   0: Result := qarResponseDelete;
   1: Result := qarResponseArchive;
  else
     Result := qarResponseCancel;
  end;
end;

end.
