unit tl_clone;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  MainModule, uniCheckBox,  uniEdit, uniLabel, uniSplitter,
  uniButton,  uniPanel;

type
  TFrmTLClonePrompt = class(TUniForm)
    PnlButtonCarrier: TUniPanel;
    Bevel1: TUniPanel;
    PnlButtons: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label5: TUniLabel;
    PnlClient01: TUniPanel;
    edtProjectNumber: TUniEdit;
    chkIncludeUDForm: TUniCheckBox;
    chkIncludeInternalDocs: TUniCheckBox;
    chkIncludeExternalDocs: TUniCheckBox;
    Label1: TUniLabel;
    edtProjectName: TUniEdit;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DoCloneProjectPrompt( var AProjectNumber: String;
                                 var AProjectName: String;
                                 var AUDForm, AIntDoc, AExtDoc: Boolean): Boolean;


implementation

{$R *.dfm}

uses
  iqtool_rscstr;

function DoCloneProjectPrompt( var AProjectNumber: String;
                               var AProjectName: String;
                               var AUDForm, AIntDoc, AExtDoc: Boolean): Boolean;
var
  FrmTLClonePrompt : TFrmTLClonePrompt;
begin
  FrmTLClonePrompt := TFrmTLClonePrompt.Create(UniApplication);
  with FrmTLClonePrompt do
  begin
    edtProjectNumber.Text := AProjectNumber;
    edtProjectName.Text := AProjectName;
     Result := ShowModal = mrOk;
     if Result then
        begin
          AProjectNumber := edtProjectNumber.Text;
          AProjectName := edtProjectName.Text;
          AUDForm  := chkIncludeUDForm.Checked;
          AIntDoc  := chkIncludeInternalDocs.Checked;
          AExtDoc  := chkIncludeExternalDocs.Checked;
        end;
  end;
end;

{ TFrmClonePrompt }

procedure TFrmTLClonePrompt.btnOKClick(Sender: TObject);
begin
  if Trim(edtProjectNumber.Text) = '' then
     // 'Please enter a Project number.'
     raise Exception.Create(iqtool_rscstr.cTXT0000130);
  ModalResult := mrOk;
end;

end.
