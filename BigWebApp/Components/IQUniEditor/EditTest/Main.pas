unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniMultiItem,
  uniComboBox, IQUniEditor, Data.DB, Datasnap.DBClient, uniPanel, uniBasicGrid,
  uniDBGrid, IQUniEditorDlg, IQUniEditorRegDlg, IQUniEditorDlgSample,
  uniDBComboBox, uniDBNavigator, uniButton, uniGUIFrame,
  uniImageList, uniEdit, uniDBLookupComboBox, IQUniEditorDlgMemo;

type
  TMainForm = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    UniHiddenPanel1: TUniHiddenPanel;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    IQUniEditor1: TIQUniEditor;
    IQUniEditorDlgA1: TIQUniEditorDlgA;
    UniDBNavigator1: TUniDBNavigator;
    UniNativeImageList1: TUniNativeImageList;
    IQUniEditorDlgMemo1: TIQUniEditorDlgMemo;
    procedure IQUniEditor1TriggerEvent(Sender: TUniCustomComboBox;
      AButtonId: Integer);
    procedure IQUniEditorDlgA1DialogResult(Sender: TObject;
      Intf: IIQEditorDialog; var Handled: Boolean);
    procedure IQUniEditorDlgMemo1DialogResult(Sender: TObject;
      Intf: IIQEditorDialog; var Handled: Boolean);
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
  Intf: IIQEditorDialog; var Handled: Boolean);
begin
  if Intf.DialogResult = mrOK then
    (Sender as TIQUniEditorDlgA).Text := Intf.DialogValue;
end;

procedure TMainForm.IQUniEditorDlgMemo1DialogResult(Sender: TObject;
  Intf: IIQEditorDialog; var Handled: Boolean);
begin
//
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
