unit Cust_Shr;

interface

uses
  Winapi.Windows,
  System.Classes,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

//procedure CheckAssignMask( ADataSource:TDataSource; AField:TField; APhoneFieldName, AFaxFieldName: string );

procedure Assignthirdpartyaddress(AFOB:String; APk:TIQWebHPick; ADataSet:TDataset);
procedure CheckFOB_THIRD_PARTY_ID(AFOB:String; ADataSet:TDataset);

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils;

procedure Assignthirdpartyaddress(AFOB:String; APk:TIQWebHPick; ADataSet:TDataset);
var
  AId:Real;
begin
  if SelectValueFmtAsString( 'select NVL(third_party_billing, ''N'') from fob where descrip = ''%s''',
    [IQMS.Common.StringUtils.FixStr(AFOB)]) = 'Y' then
  begin
    with APk do
    if execute then
    begin
      AId := GetValue('ID');
       if not (ADataSet.State in [dsInsert, dsEdit]) then ADataSet.Edit;
       ADataSet.FieldByName('FOB_THIRD_PARTY_ID').asFloat := GetValue('ID');
    end;
  end
  else
    CheckFOB_THIRD_PARTY_ID(AFOB, ADataSet);

end;

procedure CheckFOB_THIRD_PARTY_ID(AFOB:String; ADataSet:TDataset);
begin
  if SelectValueFmtAsString( 'select NVL(third_party_billing, ''N'') from fob where descrip = ''%s''',
    [IQMS.Common.StringUtils.FixStr(AFOB)]) = 'N' then
  begin
    if not (ADataSet.State in [dsInsert, dsEdit]) then ADataSet.Edit;
    ADataSet.FieldByName('FOB_THIRD_PARTY_ID').Clear;
  end;
end;

{procedure CheckAssignMask( ADataSource:TDataSource; AField:TField; APhoneFieldName, AFaxFieldName: string );
begin
  if Assigned(ADataSource) and (ADataSource.DataSet.State = dsBrowse) or Assigned(AField) and (AField.FieldName = 'USE_USA_MASK') then
     ApplyUSAMask(ADataSource, [APhoneFieldName, AFaxFieldName]);
end;}

end.
