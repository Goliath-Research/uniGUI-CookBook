unit IQMS.WebVcl.SearchPickList;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Vcl.Controls,
  Forms,
  Dialogs,
  DB,
//  Wwdatsrc,
  IQMS.WebVcl.Search,
  StdCtrls,
  ExtCtrls,
  FireDAC.Stan.Param,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmIQSearchPickList = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    IQSearch1: TIQUniGridControl;
    SrcPickList: TDataSource;
    QryData: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure IQSearch1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryDataAfterOpen(DataSet: TDataSet);
    procedure QryDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FIQHpick: TComponent;
    FSubqueryModuleName: string;
    FSubqueryFieldName: string;
    procedure PrepareQuery;
    function GetPickListQuery: TDataSet;
    procedure SetPickListQuery(const Value: TDataSet);
    procedure CopyQueryValuesFromHPick;
    procedure SetSubqueryModuleName(const Value: string);
    procedure SetSubqueryFieldName(const Value: string);
    property PickListQuery: TDataSet read GetPickListQuery write SetPickListQuery;
    function FirstVisibleFieldName: string;
  public
    { Public declarations }
    constructor Create(  AIQHpick: TComponent );
    procedure SaveToList(AResultList: TStringList; AFieldName: string);
    property SubqueryModuleName: string read FSubqueryModuleName write SetSubqueryModuleName;
    property SubqueryFieldName: string read FSubqueryFieldName write SetSubqueryFieldName;
    property IQHpick: TComponent read FIQHpick write FIQHpick;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls;

{ TFrmIQSearchPickList }

constructor TFrmIQSearchPickList.Create( AIQHpick: TComponent);
begin
  FIQHpick := AIQHpick;
  inherited Create(uniGUIApplication.UniApplication);
//  IQSearch1.RegistryPathExtension := AIQHpick.Name;
end;

procedure TFrmIQSearchPickList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( FIQHpick, [ self ]);
end;

procedure TFrmIQSearchPickList.FormShow(Sender: TObject);
begin
  IQRegFormRead( FIQHpick, [ self ]);
  PrepareQuery;
  PickListQuery := QryData;
//  IqSearch1.ReadGrid2;
//  IQSearch1.wwIncSearch.SetFocus;
//  if IQSearch1.SearchField = '' then
//    IQSearch1.SearchField := FirstVisibleFieldName;
end;

function TFrmIQSearchPickList.GetPickListQuery: TDataSet;
begin
  Result:= SrcPickList.DataSet;
end;

procedure TFrmIQSearchPickList.IQSearch1DblClick(Sender: TObject);
begin
  if not (PickListQuery.Eof and PickListQuery.Bof) then
     btnOK.Click;
end;

procedure TFrmIQSearchPickList.PrepareQuery;
var
  i: Integer;
  ADataSet: TFDQuery;
  AParam: TFDParam;
  AParamList: TStringList;

  procedure _AddField(AFieldName: string; AFieldType: TFieldType);
  var
    x: Integer;
    AField: TField;
  begin
    // Ensure that the field has not already been created
    if QryData.FindField(AFieldName) <> nil then
      Exit;
    // Add the field from the field definition
    x := QryData.FieldDefs.IndexOf(AFieldName);
    if x > - 1 then
      begin
        AField := QryData.FieldDefs.Items[x].CreateField(QryData);
        AField.FieldName := ADataSet.FieldByName(AFieldName).FieldName;
        AField.DisplayLabel := ADataSet.FieldByName(AFieldName).DisplayLabel;
        AField.DisplayWidth  := ADataSet.FieldByName(AFieldName).DisplayWidth;
        AField.Origin := ADataSet.FieldByName(AFieldName).Origin;
        AField.Tag := ADataSet.FieldByName(AFieldName).Tag;
        AField.Visible := ADataSet.FieldByName(AFieldName).Visible;
      end;
  end;

begin
  // Get the pick list query (TFDQuery)
  ADataSet := TFDQuery(FIQHpick);

  // Initialize parameter values
  if Assigned(ADataSet.BeforeOpen) then
    ADataSet.BeforeOpen(ADataSet);

  // Assign the SQL
  QryData.SQL.Text := ADataSet.SQL.Text;

  AParamList := TStringList.Create;
  try
    // Update the parameter list
    for i := 0 to ADataSet.ParamCount - 1 do
      begin
        if AParamList.IndexOf(ADataSet.Params[i].Name) = -1 then
          begin
            AParamList.Add(ADataSet.Params[i].Name);
            AParam := QryData.FindParam(ADataSet.Params[i].Name);
            if AParam = nil then
              AParam := QryData.Params.Add;
            with AParam do
              begin
                Name := ADataSet.Params[i].Name;
                DataType := ADataSet.Params[i].DataType;
                ParamType := ADataSet.Params[i].ParamType;
                Value := ADataSet.Params[i].Value;
              end;
          end;
      end;
  finally
    FreeAndNil(AParamList);
  end;

  // Update the field definition
  QryData.Fields.Clear;
  QryData.FieldDefs.Update;
  for I := 0 to ADataSet.Fields.Count - 1 do
    _AddField(ADataSet.Fields[I].FieldName, ADataSet.Fields[I].DataType);

end;

procedure TFrmIQSearchPickList.SetPickListQuery(const Value: TDataSet);
begin
  // make sure the query is inactive
  if Assigned(Value) then
     Value.Close;
  
  // Assign datasource on the form the dataset
  SrcPickList.DataSet:= Value;

  // when IQSearch1 DataSource is assigned it will trigger replacement of OnBefore and OnAfterOpen of the query
  IQSearch1.DataSource:= SrcPickList;

  if Assigned(SrcPickList.DataSet) then
     SrcPickList.DataSet.Open;
end;

procedure TFrmIQSearchPickList.btnOKClick(Sender: TObject);
begin
  IQAssert( not (PickListQuery.Eof and PickListQuery.Bof), 'Nothing is selected - operation aborted.' );
  ModalResult:= mrOK;
end;

procedure TFrmIQSearchPickList.SaveToList( AResultList: TStringList; AFieldName:string );
var  
  I: Integer;
  AField: TField;
begin
  IQMS.Common.Controls.ClearStringListOfObjects( AResultList );

  with IQSearch1 do
  try
     Datasource.DataSet.DisableControls;

     AField:= PickListQuery.FieldByName( AFieldName );
     if DBGrid.SelectedRows.Count > 0 then
        for I:= 0 to DBGrid.SelectedRows.Count - 1 do
        begin
          Datasource.DataSet.GotoBookmark( DBGrid.SelectedRows.Items[ I ]);
          AResultList.Add( AField.AsString );
        end
     else
        AResultList.Add( AField.AsString );
  finally
     Datasource.DataSet.EnableControls;
  end;
end;

procedure TFrmIQSearchPickList.CopyQueryValuesFromHPick;
var
  ADataSet: TFDQuery;
  i: Integer;
  AParam: TFDParam;
  AParamList: TStringList;
begin
  // Get the pick list query (TFDQuery)
  ADataSet := TFDQuery(FIQHpick);

  // Update parameters
  AParamList := TStringList.Create;
  try
    // Update the parameter list
    for i := 0 to ADataSet.ParamCount - 1 do
      begin
        if AParamList.IndexOf(ADataSet.Params[i].Name) = -1 then
          begin
            AParamList.Add(ADataSet.Params[i].Name);
            AParam := QryData.FindParam(ADataSet.Params[i].Name);
            if AParam <> nil then
              AParam.Value := ADataSet.Params[i].Value;
          end;
      end;
  finally
    FreeAndNil(AParamList);
  end;

  // Update display labels
  for i := 0 to ADataSet.FieldCount - 1 do
    begin
      QryData.FieldByName(ADataSet.Fields[i].FieldName).DisplayLabel :=
        ADataSet.Fields[i].DisplayLabel;
    end;
  // Apply filter, if changed
  if (CompareText(QryData.Filter, ADataSet.Filter) <> 0) and
    (QryData.Filtered <> ADataSet.Filtered) then
    begin
      QryData.Filter := ADataSet.Filter;
      QryData.Filtered := ADataSet.Filtered;
    end;
end;

procedure TFrmIQSearchPickList.QryDataAfterOpen(DataSet: TDataSet);
begin
  if Assigned(TFDQuery(FIQHpick).AfterOpen) then
    begin
      // errors in units.
      TFDQuery(FIQHpick).AfterOpen(TFDQuery(FIQHpick));
      // Apply the param values
      CopyQueryValuesFromHPick;
    end;
end;

procedure TFrmIQSearchPickList.QryDataBeforeOpen(DataSet: TDataSet);
begin
  if Assigned(TFDQuery(FIQHpick).BeforeOpen) then
    begin
      // Cast original TIQHPick to prevent errors in units.
      TFDQuery(FIQHpick).BeforeOpen(TFDQuery(FIQHpick));
      // Apply the param values from the IQHPick query to the TFDQuery
      CopyQueryValuesFromHPick;
    end;
end;

function TFrmIQSearchPickList.FirstVisibleFieldName: string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to QryData.FieldCount - 1 do
    if QryData.Fields[i].Visible then
      begin
        Result := QryData.Fields[i].FieldName;
        Break;
      end;
end;

procedure TFrmIQSearchPickList.SetSubqueryFieldName(const Value: string);
begin
  FSubqueryFieldName := UpperCase(Value);
//  IQSearch1.SubqueryFieldName := FSubqueryFieldName;
end;

procedure TFrmIQSearchPickList.SetSubqueryModuleName(const Value: string);
begin
  FSubqueryModuleName := UpperCase(Value);
//  IQSearch1.SubqueryModuleName := FSubqueryModuleName;
end;

end.
