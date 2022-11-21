unit D4WEditorFieldsDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniMultiItem, uniListBox,
  uniToolBar, DB, uniImageList;

type

  TD4WFieldSelect = class(TUniForm)
    FieldsListBox: TUniListBox;
    UniToolBar1: TUniToolBar;
    utbSelectAll: TUniToolButton;
    UniToolButton2: TUniToolButton;
    UniToolButton3: TUniToolButton;
    UniToolButton4: TUniToolButton;
    utbOk: TUniToolButton;
    utbCancel: TUniToolButton;
    UniNativeImageList1: TUniNativeImageList;
    procedure utbCancelClick(Sender: TObject);
    procedure utbOkClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure utbSelectAllClick(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
    FDataSource: TDataSource;
    FSelectedFields: TList;
    procedure SetDataSource(const Value: TDataSource);

    procedure PopulateList;
    procedure SetSelectedFields(const Value: TList);
  public
    { Public declarations }
    property DataSource: TDataSource read FDataSource write SetDataSource;
    property SelectedFields: TList read FSelectedFields write SetSelectedFields;
  end;

implementation

uses
  uniGUIApplication;

{$R *.dfm}

{ TD4WFieldSelect }

procedure TD4WFieldSelect.PopulateList;
var
  ds : TDataSet;
  I: Integer;
begin
  if Assigned(FDataSource) then
    ds := FDataSource.DataSet
  else
    ds := nil;

  if Assigned(ds) then
  begin
    FieldsListBox.Clear;

    for I := 0 to ds.Fields.Count - 1 do
      FieldsListBox.Items.AddObject(ds.Fields[I].FieldName, ds.Fields[I]);
  end;
end;

procedure TD4WFieldSelect.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

procedure TD4WFieldSelect.SetSelectedFields(const Value: TList);
begin
  FSelectedFields := Value;
end;

procedure TD4WFieldSelect.UniFormBeforeShow(Sender: TObject);
begin
  PopulateList;
end;

procedure TD4WFieldSelect.UniFormClose(Sender: TObject;
  var Action: TCloseAction);
var
  I: Integer;
begin
  if ModalResult = mrOK then
  begin
    FSelectedFields.Clear;
    if FieldsListBox.SelCount > 0 then
      for I := 0 to FieldsListBox.Count - 1 do
        if FieldsListBox.Selected[I] then
          FSelectedFields.Add(FieldsListBox.Items.Objects[I]);
  end;
end;

procedure TD4WFieldSelect.UniFormCreate(Sender: TObject);
begin
  FSelectedFields := TList.Create;
end;

procedure TD4WFieldSelect.UniFormDestroy(Sender: TObject);
begin
  FSelectedFields.Free;
end;

procedure TD4WFieldSelect.utbSelectAllClick(Sender: TObject);
begin
  FieldsListBox.SelectAll;
end;

procedure TD4WFieldSelect.utbOkClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TD4WFieldSelect.utbCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
