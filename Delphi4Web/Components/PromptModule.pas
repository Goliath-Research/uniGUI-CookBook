unit PromptModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniFieldSet, uniButton,
  uniMultiItem, uniComboBox, uniEdit;

type
  TPromptModuleForm = class(TUniForm)
    UniFieldSet1: TUniFieldSet;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniEdit1: TUniEdit;
    UniComboBox1: TUniComboBox;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function PromptModuleForm: TPromptModuleForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function PromptModuleForm: TPromptModuleForm;
begin
  Result := TPromptModuleForm(UniMainModule.GetFormInstance(TPromptModuleForm));
end;

procedure TPromptModuleForm.UniFormBeforeShow(Sender: TObject);
begin
  UniEdit1.Text := '';
end;

procedure TPromptModuleForm.UniFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOK then
    if UniComboBox1.IsBlank  or UniEdit1.IsBlank then
    begin
      Action := caNone;
      ShowMessage('Please enter value for all fields.');
    end;
end;

end.
