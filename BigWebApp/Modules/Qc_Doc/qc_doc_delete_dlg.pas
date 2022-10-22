unit qc_doc_delete_dlg;

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
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniImage;

type
  TFrmDeleteDocumentDialog = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    Bevel1: TUniPanel;
    chkKeepFile: TUniCheckBox;
    Label1: TUniLabel;
    Image1: TUniImage;
    chkDeleteRelated: TUniCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal(AOwner: TComponent; var AKeepFile, ADeleteRelated: Boolean ): Boolean;
  end;

var
  FrmDeleteDocumentDialog: TFrmDeleteDocumentDialog;

implementation

{$R *.dfm}

{ TFrmDeleteDocumentDialog }

class function TFrmDeleteDocumentDialog.DoShowModal(AOwner: TComponent; var AKeepFile, ADeleteRelated: Boolean ): Boolean;
begin
FrmDeleteDocumentDialog:= TFrmDeleteDocumentDialog.Create(UniGUIApplication.UniApplication);
FrmDeleteDocumentDialog.ShowModal;

  with FrmDeleteDocumentDialog do
  try
    Result:= ShowModal = mrOK;
    if Result then
    begin
       AKeepFile:= chkKeepFile.Checked;
       ADeleteRelated:= chkDeleteRelated.Checked;
    end;
  finally
    Free;
  end;
end;

end.
