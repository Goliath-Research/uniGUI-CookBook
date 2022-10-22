unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIFrame, IQUniGrid,
  DB, Datasnap.DBClient, uniGUIBaseClasses, uniImageList, uniPanel,
  uniPageControl, uniEdit, uniDBGrid, uniMultiItem, uniComboBox, uniDBComboBox,
  IQUniEditor, uniCheckBox, uniDBCheckBox, uniMemo, uniSpinEdit,
  IQUniEditorRegDlg, uniDateTimePicker, IQModuleFormDesigner, IQUniModuleFrame;

type
  TMainForm = class(TUniForm)
    IQUniModuleFormDesigner1: TIQUniModuleFormDesigner;
    procedure IQUniModuleFormDesigner1SaveModuleForm(Sender: TObject; const Stream: TMemoryStream);
    procedure IQUniModuleFormDesigner1LoadModuleForm(Sender: TObject; const Stream: TMemoryStream);
    procedure IQUniModuleFormDesigner1NewModuleForm(Sender: TObject);
    procedure IQUniModuleFormDesigner1LoadDialog(Sender: TObject);
    procedure IQUniModuleFormDesigner1SaveDialog(Sender: TObject);
    procedure IQUniModuleFormDesigner1NewDialog(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  published
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uniModuleA;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.IQUniModuleFormDesigner1LoadDialog(Sender: TObject);
begin
  (Sender as TIQUniModuleFormDesigner).LoadModule;
end;

procedure TMainForm.IQUniModuleFormDesigner1LoadModuleForm(Sender: TObject; const Stream: TMemoryStream);
begin
  Stream.LoadFromFile('C:\TEMP\DFM\1.dfm');
end;

procedure TMainForm.IQUniModuleFormDesigner1NewDialog(Sender: TObject);
begin
  (Sender as TIQUniModuleFormDesigner).CreateNewModule;
end;

procedure TMainForm.IQUniModuleFormDesigner1NewModuleForm(Sender: TObject);
begin
  with (Sender as TIQUniModuleFormDesigner) do
  begin
    CurrentFrame.Name := 'ModulaFormA';
    CurrentFrame.ModuleCategory := 'ModulaCat';
    CurrentFrame.ModuleName := 'Modula Form A';
  end;
end;

procedure TMainForm.IQUniModuleFormDesigner1SaveDialog(Sender: TObject);
begin
  (Sender as TIQUniModuleFormDesigner).SaveModule;
end;

procedure TMainForm.IQUniModuleFormDesigner1SaveModuleForm(Sender: TObject; const Stream: TMemoryStream);
begin
  Stream.SaveToFile('C:\TEMP\DFM\1.dfm');
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
