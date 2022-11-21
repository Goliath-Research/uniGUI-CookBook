unit D4WDlgPickDataSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniCheckBox, uniEdit,
  uniButton, uniBitBtn, uniSpeedButton, uniStatusBar, uniLabel, uniBasicGrid,
  uniDBGrid, DB, uniImageList, uniGUIDialogs,
  D4W.DataServices,
  Generics.Collections,
  D4WEditorDlg,
  D4WEditor, Vcl.Forms;

type

  TD4WDlgPickDataSetForm = class(TUniForm, ID4WEditorDialog)
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
    UniNativeImageList1: TUniNativeImageList;
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
    FDataServiceID  : string;
    FActiveColumn   : TUniDBGridColumn;
    FD4WDataServices : ID4WDataServices;

    procedure FormatGrid;
    procedure SetActiveColumn(Column: TUniDBGridColumn);

    procedure SetSrcDataSet   (const Value : TDataSet);
    procedure SetSrcKeyField  (const Value : string);
    procedure SetSrcListField (const Value : string);
    procedure SetDataServiceID(const Value: string);

    property ActiveColumn : TUniDBGridColumn read FActiveColumn write SetActiveColumn;
  protected

    procedure SetDialogValue(const Value: Variant);
    function GetDialogValue: Variant;
    function GetDialogResult: Integer;

    procedure SetEditorInstance(Editor: TD4WCustomEditor);
  public
    { Public declarations }

    property DataServiceID : string    read FDataServiceID write SetDataServiceID;
    property SrcDataset    : TDataSet  read FSrcDataSet    write SetSrcDataSet;
    property SrcKeyField   : string    read FSrcKeyField   write SetSrcKeyField;
    property SrcListField  : string    read FSrcListField  write SetSrcListField;
  end;

implementation

uses
  StrUtils,
  Spring.Services;

{$R *.dfm}

{ TPickDataSetForm }

procedure TD4WDlgPickDataSetForm.UniFormCreate(Sender: TObject);
begin
  // Locate the corresponding DataServices
  // Just for now, it is hard-coded to FireDAC and Oracle
  FD4WDataServices := ServiceLocator.GetService<ID4WDataServices>(FDataServiceID);
end;

procedure TD4WDlgPickDataSetForm.UniFormDestroy(Sender: TObject);
begin
  FClonedDataSet.Free;
end;

// Calls from TD4WEditorDlgPickDataSet.DoBeforeShowDialog

procedure TD4WDlgPickDataSetForm.SetSrcDataSet(const Value: TDataSet);
begin
  FSrcDataSet := Value;

  FClonedDataSet := FD4WDataServices.CloneDataSet(Value);
  ds.DataSet := FClonedDataSet;

  FormatGrid;
  UniDBGrid1.Options := UniDBGrid1.Options - [dgMultiSelect];
end;

procedure TD4WDlgPickDataSetForm.SetSrcKeyField(const Value: string);
begin
  FSrcKeyField := Value;
end;

procedure TD4WDlgPickDataSetForm.SetSrcListField(const Value: string);
begin
  FSrcListField := Value;
end;

procedure TD4WDlgPickDataSetForm.SetDataServiceID(const Value: string);
begin
  if Value <> '' then
    FDataServiceID := Value
  else
    FDataServiceID := 'FireDAC-Oracle'
end;

procedure TD4WDlgPickDataSetForm.ubbSelectClick(Sender: TObject);
begin
  //
end;

// Call from TD4WCustomEditorDlg.DoHandleTriggerClick after requesting
// the value from the Field

procedure TD4WDlgPickDataSetForm.SetDialogValue(const Value: Variant);
begin
  if not VarIsNull(Value) and not VarIsEmpty(Value) then
    FClonedDataSet.Locate(FSrcKeyField, Value, []);
end;

procedure TD4WDlgPickDataSetForm.SetEditorInstance(Editor: TD4WCustomEditor);
begin
  //
end;

procedure TD4WDlgPickDataSetForm.SetActiveColumn(Column: TUniDBGridColumn);
begin
  if Assigned(FActiveColumn) then
    FActiveColumn.Title.Font.Style := FActiveColumn.Title.Font.Style - [fsBold];

  FActiveColumn := Column;
  FActiveColumn.Title.Font.Style := FActiveColumn.Title.Font.Style + [fsBold];
end;

procedure TD4WDlgPickDataSetForm.UniDBGrid1ColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  FD4WDataServices.SortDataSet
  (
    FClonedDataSet,
    Column.FieldName,
    Direction,
    uchkCaseInsensitive.Checked
  );
end;

procedure TD4WDlgPickDataSetForm.UniDBGrid1TitleClick(Column: TUniDBGridColumn);
begin
  ActiveColumn := Column;
end;

procedure TD4WDlgPickDataSetForm.usbtnFilterClick(Sender: TObject);
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

procedure TD4WDlgPickDataSetForm.usbtnRemoveFilterClick(Sender: TObject);
begin
  FClonedDataSet.Filtered := false;
  usbtnRemoveFilter.Enabled := false;
end;

procedure TD4WDlgPickDataSetForm.usbtnSearchClick(Sender: TObject);
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

procedure TD4WDlgPickDataSetForm.FormatGrid;
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

// Called from TD4WCustomEditorDlg.DoHandleTriggerClick after ShowModal

function TD4WDlgPickDataSetForm.GetDialogResult: Integer;
begin
  Result := ModalResult;
end;

// Called from TD4WCustomEditorDlg.ProcessDialogResult after returning from
// ShowModal

function TD4WDlgPickDataSetForm.GetDialogValue: Variant;
begin
  Result := FClonedDataSet.FieldByName(FSrcKeyField).Value;
end;

initialization
  RegisterClass(TD4WDlgPickDataSetForm);

end.
