unit IQUniDlgPickDataSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniCheckBox, uniEdit,
  uniButton, uniBitBtn, uniSpeedButton, uniStatusBar, uniLabel, uniBasicGrid,
  uniDBGrid, DB, uniImageList, uniGUIDialogs,
  IQWeb.Server.DataServices,
  Generics.Collections,
  IQUniEditorDlg,
  IQUniEditor;

type

  TIQUniDlgPickDataSetForm = class(TUniForm, IIQEditorDialog)
    upnlTop: TUniPanel;
    uedtSearch: TUniEdit;
    uchkCaseInsensitive: TUniCheckBox;
    uchkExactMatch: TUniCheckBox;
    usbtnToggleHide: TUniSpeedButton;
    usbtnSearch: TUniSpeedButton;
    usbtnSortCriteria: TUniSpeedButton;
    usbtnSortCriteriaDropDown: TUniSpeedButton;
    usbtnFilter: TUniSpeedButton;
    usbtnFilterDropDown: TUniSpeedButton;
    usbtnRemoveFilter: TUniSpeedButton;
    upnlSpeedButtons: TUniPanel;
    upnlToggleHide: TUniPanel;
    upnlSearch: TUniPanel;
    UniStatusBar1: TUniStatusBar;
    uplnBottom: TUniPanel;
    upnlButtons: TUniPanel;
    upnlPropagate: TUniPanel;
    ubbSelect: TUniBitBtn;
    ubbCancel: TUniBitBtn;
    ubbNew: TUniBitBtn;
    UniDBGrid1: TUniDBGrid;
    UniImageList1: TUniImageList;
    ds: TDataSource;
    procedure UniDBGrid1TitleClick(Column: TUniDBGridColumn);
    procedure usbtnSearchClick(Sender: TObject);
    procedure usbtnFilterClick(Sender: TObject);
    procedure usbtnRemoveFilterClick(Sender: TObject);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure ubbSelectClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
    FClonedDataSet  : TDataSet;
    FSrcDataSet     : TDataSet;
    FSrcKeyField    : string;
    FSrcListField   : string;
    FActiveColumn   : TUniDBGridColumn;
    FIQDataServices : IIQDataServices;

    procedure FormatGrid;
    procedure SetActiveColumn(Column: TUniDBGridColumn);

    procedure SetSrcDataSet   (const Value : TDataSet);
    procedure SetSrcKeyField  (const Value : string);
    procedure SetSrcListField (const Value : string);

    property ActiveColumn : TUniDBGridColumn read FActiveColumn write SetActiveColumn;
  protected

    procedure SetDialogValue(const Value: Variant);
    function GetDialogValue: Variant;
    function GetDialogResult: Integer;

    procedure SetEditorInstance(Editor: TIQUniCustomEditor);
  public
    { Public declarations }

    property SrcDataset   : TDataSet  read FSrcDataSet    write SetSrcDataSet;
    property SrcKeyField  : string    read FSrcKeyField   write SetSrcKeyField;
    property SrcListField : string    read FSrcListField  write SetSrcListField;
  end;

implementation

uses
  StrUtils,
  Spring.Services;

{$R *.dfm}

{ TPickDataSetForm }

procedure TIQUniDlgPickDataSetForm.UniFormCreate(Sender: TObject);
begin
  // Locate the corresponding DataServices
  // Just for now, it is hard-coded to FireDAC and Oracle
  FIQDataServices := ServiceLocator.GetService<IIQDataServices>('FireDAC-Oracle');
end;

procedure TIQUniDlgPickDataSetForm.UniFormDestroy(Sender: TObject);
begin
  FClonedDataSet.Free;
end;

// Calls from TIQUniEditorDlgPickDataSet.DoBeforeShowDialog

procedure TIQUniDlgPickDataSetForm.SetSrcDataSet(const Value: TDataSet);
begin
  FSrcDataSet := Value;

  FClonedDataSet := FIQDataServices.CloneDataSet(Value);
  ds.DataSet := FClonedDataSet;

  FormatGrid;
  UniDBGrid1.Options := UniDBGrid1.Options - [dgMultiSelect];
end;

procedure TIQUniDlgPickDataSetForm.SetSrcKeyField(const Value: string);
begin
  FSrcKeyField := Value;
end;

procedure TIQUniDlgPickDataSetForm.SetSrcListField(const Value: string);
begin
  FSrcListField := Value;
end;

procedure TIQUniDlgPickDataSetForm.ubbSelectClick(Sender: TObject);
begin

end;

// Call from TIQUniCustomEditorDlg.DoHandleTriggerClick after requesting
// the value from the Field

procedure TIQUniDlgPickDataSetForm.SetDialogValue(const Value: Variant);
begin
  if not VarIsNull(Value) and not VarIsEmpty(Value) then
    FClonedDataSet.Locate(FSrcKeyField, Value, []);
end;

procedure TIQUniDlgPickDataSetForm.SetEditorInstance(Editor: TIQUniCustomEditor);
begin
  //
end;

procedure TIQUniDlgPickDataSetForm.SetActiveColumn(Column: TUniDBGridColumn);
begin
  if Assigned(FActiveColumn) then
    FActiveColumn.Title.Font.Style := FActiveColumn.Title.Font.Style - [fsBold];

  FActiveColumn := Column;
  FActiveColumn.Title.Font.Style := FActiveColumn.Title.Font.Style + [fsBold];
end;

procedure TIQUniDlgPickDataSetForm.UniDBGrid1ColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  FIQDataServices.SortDataSet
  (
    FClonedDataSet,
    Column.FieldName,
    Direction,
    uchkCaseInsensitive.Checked
  );
end;

procedure TIQUniDlgPickDataSetForm.UniDBGrid1TitleClick(Column: TUniDBGridColumn);
begin
  ActiveColumn := Column;
end;

procedure TIQUniDlgPickDataSetForm.usbtnFilterClick(Sender: TObject);
var
  strFieldValue: string;
  strFilter: string;
begin
  // First, just for the selected column

  strFilter := uedtSearch.Text;
  if not uchkExactMatch.Checked then
     strFilter := '%' + strFilter + '%';

  strFieldValue := FActiveColumn.FieldName;

  if uchkCaseInsensitive.Checked then
    begin
      strFieldValue := Format('UPPER(%s)', [strFieldValue]);
      strFilter     := UpperCase(strFilter);
    end;

  FClonedDataSet.Filtered := false;
  FClonedDataSet.Filter   := Format('%s LIKE ''%s''', [strFieldValue, strFilter]);
  FClonedDataSet.Filtered := true;

  usbtnRemoveFilter.Enabled := true;
end;

procedure TIQUniDlgPickDataSetForm.usbtnRemoveFilterClick(Sender: TObject);
begin
  FClonedDataSet.Filtered := false;
  usbtnRemoveFilter.Enabled := false;
end;

procedure TIQUniDlgPickDataSetForm.usbtnSearchClick(Sender: TObject);
var
  loOptions: TLocateOptions;
begin
  // First, just for the selected column
  loOptions := [];

  if uchkCaseInsensitive.Checked then
    loOptions := loOptions + [loCaseInsensitive];

  if not uchkExactMatch.Checked then
     loOptions := loOptions + [loPartialKey];

  if FActiveColumn = nil then
    FActiveColumn := TUniDBGridColumn(uniDBGrid1.Columns[0]);


  FClonedDataSet.Locate(FActiveColumn.FieldName, uedtSearch.Text, loOptions);
end;

procedure TIQUniDlgPickDataSetForm.FormatGrid;
var
  aField  : TField;
  c       : integer;
  aColumn : TUniDBGridColumn;
begin
  for c := 0 to UniDBGrid1.Columns.Count - 1 do
    begin
      aColumn := TUniDBGridColumn(UniDBGrid1.Columns[c]);

      aField    := FSrcDataset.FindField(aColumn.FieldName);

      aColumn.Title.Caption := aField.DisplayLabel;
      aColumn.Width         := aField.DisplayWidth * 6;
      aColumn.Visible       := aField.Visible;
      aColumn.Sortable      := true;
      aColumn.Font.Assign(UniDBGrid1.TitleFont);

      if aColumn.Visible and not Assigned(FActiveColumn) then
        ActiveColumn := aColumn;
    end;
end;

// Called from TIQUniCustomEditorDlg.DoHandleTriggerClick after ShowModal

function TIQUniDlgPickDataSetForm.GetDialogResult: Integer;
begin
  Result := ModalResult;
end;

// Called from TIQUniCustomEditorDlg.ProcessDialogResult after returning from
// ShowModal

function TIQUniDlgPickDataSetForm.GetDialogValue: Variant;
begin
  Result := FClonedDataSet.FieldByName(FSrcKeyField).Value;
end;

initialization
  RegisterClass(TIQUniDlgPickDataSetForm);

end.
