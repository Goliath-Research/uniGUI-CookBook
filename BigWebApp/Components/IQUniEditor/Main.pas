unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniMultiItem,
  uniComboBox, IQEditor, Data.DB, Datasnap.DBClient, uniPanel, uniBasicGrid,
  uniDBGrid, IQEditorDlg, IQEditorDlgSample, IQEditorDlgGridSample,
  uniDBComboBox, uniDBNavigator, uniButton, uniGUIFrame, IQGridControl;

type
  TMainForm = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    UniHiddenPanel1: TUniHiddenPanel;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    IQUniEditor1: TIQUniEditor;
    IQUniEditorDlgA1: TIQUniEditorDlgA;
    IQUniEditorDlgGrid1: TIQUniEditorDlgGrid;
    UniDBNavigator1: TUniDBNavigator;
    procedure IQUniEditorDlgA1DialogResult(Sender: TObject;
      Intf: IIQEditorDialog);
    procedure IQUniEditor1TriggerEvent(Sender: TUniCustomComboBox;
      AButtonId: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.IQUniEditor1TriggerEvent(Sender: TUniCustomComboBox;
  AButtonId: Integer);
begin
  if AButtonId = 1 then
    ShowMessage('Nothing to search!');
end;

procedure TMainForm.IQUniEditorDlgA1DialogResult(Sender: TObject;
  Intf: IIQEditorDialog);
begin
  if Intf.DialogResult = mrOK then
    (Sender as TIQUniEditorDlgA).Text := Intf.DialogValue;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
