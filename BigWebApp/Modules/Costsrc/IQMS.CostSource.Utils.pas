unit IQMS.CostSource.Utils;

interface

uses
   System.Classes, System.SysUtils,
   Data.DB, IQMS.CostSource.Types;

procedure SafeAssignCostSourceFields(
  ADataSource: TDataSource;
  ACostSourceMenuType: TCostSourceMenuType;
  ACostSourceID: Int64;
  APostChanges: Boolean = False);

implementation

uses
  IQMS.Common.DataLib;

procedure SafeAssignCostSourceFields(
  ADataSource: TDataSource;
  ACostSourceMenuType: TCostSourceMenuType;
  ACostSourceID: Int64;
  APostChanges: Boolean);
begin
  if Assigned(ADataSource) and
    Assigned(ADataSource.DataSet) and
    ADataSource.DataSet.Active and
    (ADataSource.DataSet.FindField(CostSourceIDFieldName) <> nil) and
    (ADataSource.DataSet.FindField(CostSourceFieldName) <> nil) then
  begin
    if not (ADataSource.DataSet.State in [dsEdit, dsInsert]) then
      ADataSource.DataSet.Edit;
    ADataSource.DataSet.FieldByName(CostSourceFieldName).AsString :=
      CostSourceString[ACostSourceMenuType];
    ADataSource.DataSet.FieldByName(CostSourceIDFieldName).AsLargeInt :=
      ACostSourceID;
    if APostChanges then
    begin
      ADataSource.DataSet.Post;
      // Allows the cost source display field to refresh,
      // since it is contained within the SQL.
      RefreshDataSetByID(ADataSource.DataSet);
    end;
  end;
end;

end.
