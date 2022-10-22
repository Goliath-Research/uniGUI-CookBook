unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniMultiItem,
  uniComboBox, D4WEditor, Data.DB, Datasnap.DBClient, uniPanel, uniBasicGrid,
  uniDBGrid, D4WEditorDlg, D4WEditorRegDlg, D4WEditorDlgSample,
  uniDBComboBox, uniDBNavigator, uniButton, uniGUIFrame,
  uniImageList, uniEdit, uniDBLookupComboBox, D4WEditorDlgMemo;

type
  TMainForm = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    UniHiddenPanel1: TUniHiddenPanel;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    D4WEditor1: TD4WEditor;
    D4WEditorDlgA1: TD4WEditorDlgA;
    UniDBNavigator1: TUniDBNavigator;
    UniNativeImageList1: TUniNativeImageList;
    D4WEditorDlgMemo1: TD4WEditorDlgMemo;
    procedure D4WEditor1TriggerEvent(Sender: TUniCustomComboBox;
      AButtonId: Integer);
    procedure D4WEditorDlgA1DialogResult(Sender: TObject;
      Intf: ID4WEditorDialog; var Handled: Boolean);
    procedure D4WEditorDlgMemo1DialogResult(Sender: TObject;
      Intf: ID4WEditorDialog; var Handled: Boolean);
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

procedure TMainForm.D4WEditor1TriggerEvent(Sender: TUniCustomComboBox;
  AButtonId: Integer);
begin
  if AButtonId = 1 then
    ShowMessage('Nothing to search!');
end;


procedure TMainForm.D4WEditorDlgA1DialogResult(Sender: TObject;
  Intf: ID4WEditorDialog; var Handled: Boolean);
begin
  if Intf.DialogResult = mrOK then
    (Sender as TD4WEditorDlgA).Text := Intf.DialogValue;
end;

procedure TMainForm.D4WEditorDlgMemo1DialogResult(Sender: TObject;
  Intf: ID4WEditorDialog; var Handled: Boolean);
begin
//
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
