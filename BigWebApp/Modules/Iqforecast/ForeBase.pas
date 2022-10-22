unit ForeBase;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DB,
  IQMS.WebVcl.SoftEPlant,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmForecast = class(TUniForm)
    SoftEPlant1: TIQWebSoftEPlant;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssignEPlantFilter(DataSet: TDataSet);
  private
    function GetIsViewingEPlantSameAsLoggedIn: Boolean;

    { Private declarations }
  protected
    FFromDate   : TDateTime;
    FToDate     : TDateTime;
    FArcusto_ID : Real;
    FGroup_ID   : Real;
    FShip_To_ID : Real;

    procedure AssignCriteria( AFromDate, AToDate: TDateTime; AArcusto_ID, AGroup_ID, AShip_To_Id: Real ); virtual;
    procedure InitializeVars; virtual;
    procedure CheckEPlantIsMatching;
    function GetForecastType: string; virtual;

    function GetArcusto_ID: Real;  virtual;
    function GetFromDate: TDateTime; virtual;
    function GetGroup_ID: Real; virtual;
    function GetShip_To_ID: Real; virtual;
    function GetToDate: TDateTime; virtual;
    function GetFore_Head_ID: Real; virtual;
    function GetFullItemInfo: Boolean; virtual;
    function GetExcludeNonSalable: Boolean; virtual;

    procedure SetArcusto_ID(const Value: Real);
    procedure SetFromDate(const Value: TDateTime);
    procedure SetGroup_ID(const Value: Real);
    procedure SetShip_To_ID(const Value: Real);
    procedure SetToDate(const Value: TDateTime);
    procedure SetFore_Head_ID(const Value: Real);

  public
    { Public declarations }
    Qty_Amt:Integer;     { 0 - Qty, 1 - Dollar Amt}

    property FromDate   : TDateTime  read GetFromDate    write SetFromDate  ;
    property ToDate     : TDateTime  read GetToDate      write SetToDate    ;
    property Arcusto_ID : Real       read GetArcusto_ID  write SetArcusto_ID;
    property Group_ID   : Real       read GetGroup_ID    write SetGroup_ID  ;
    property Ship_To_ID : Real       read GetShip_To_ID  write SetShip_To_ID;
    property Fore_Head_ID: Real      read GetFore_Head_ID write SetFore_Head_ID;
    property FullItemInfo: Boolean   read GetFullItemInfo;
    property ExcludeNonSalable: Boolean read GetExcludeNonSalable;


    property ForecastType: string read GetForecastType;
    procedure AssignParamsQuery(DataSet: TDataSet); virtual;
    property IsViewingEPlantSameAsLoggedIn: Boolean read GetIsViewingEPlantSameAsLoggedIn;
  end;

{var
  FrmForecast: TFrmForecast;}

implementation

{$R *.DFM}

uses
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Miscellaneous;

procedure TFrmForecast.FormCreate(Sender: TObject);
begin
  Qty_Amt:= 0;
  InitializeVars;
end;

procedure TFrmForecast.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFloatScalarWrite( self, 'Arcusto_ID', Arcusto_ID );
  IQRegFloatScalarWrite( self, 'Group_ID', Group_ID );
  IQRegFloatScalarWrite( self, 'Ship_To_ID', Ship_To_ID );
  IQRegDateTimeScalarWrite( self, 'FromDate', FromDate );
  IQRegDateTimeScalarWrite( self, 'ToDate', ToDate );
end;

procedure TFrmForecast.InitializeVars;
var
  AFromDate, AToDate: TDateTime;
  AArcusto_ID       : Real;
  AGroup_ID         : Real;
  AShip_To_ID       : Real;
begin
  AArcusto_ID  := 0;
  AGroup_ID    := 0;
  AShip_To_ID  := 0;
  AFromDate    := IncMonth( Date, -12 );
  AToDate      := IncMonth( Date,  12 );

  Arcusto_ID   := 0;
  Group_ID     := 0;
  Ship_To_ID  := 0;
  FromDate     := IncMonth( Date, -12 );
  ToDate       := IncMonth( Date,  12 );

  if not IQRegFloatScalarRead( self, 'Arcusto_ID', AArcusto_ID ) then
     AArcusto_ID:= 0;
  if not IQRegFloatScalarRead( self, 'Group_ID', AGroup_ID ) then
     AGroup_ID:= 0;
  if not IQRegFloatScalarRead( self, 'Ship_To_ID', AShip_To_ID ) then
     AShip_To_ID:= 0;
  if not IQRegDateTimeScalarRead( self, 'FromDate', AFromDate ) then
     AFromDate:= IncMonth( Date, -12 );
  if not IQRegDateTimeScalarRead( self, 'ToDate', AToDate ) then
     AToDate:= IncMonth( Date,  12 );
  AssignCriteria( AFromDate, AToDate, AArcusto_ID, AGroup_ID, AShip_To_Id );
end;

procedure TFrmForecast.SetArcusto_ID(const Value: Real);
begin
  FArcusto_ID:= Value;
end;

procedure TFrmForecast.SetFore_Head_ID(const Value: Real);
begin
  // not used
end;

procedure TFrmForecast.SetFromDate(const Value: TDateTime);
begin
  FFromDate:= Value;
end;

procedure TFrmForecast.SetGroup_ID(const Value: Real);
begin
  FGroup_ID:= Value;
end;

procedure TFrmForecast.SetShip_To_ID(const Value: Real);
begin
  FShip_To_ID:= Value
end;

procedure TFrmForecast.SetToDate(const Value: TDateTime);
begin
  FToDate:= Value
end;

procedure TFrmForecast.AssignCriteria( AFromDate, AToDate: TDateTime; AArcusto_ID, AGroup_ID, AShip_To_Id: Real );
begin
  FromDate  := AFromDate;
  ToDate    := AToDate;
  Arcusto_ID:= AArcusto_ID;
  Group_ID  := AGroup_ID;
  Ship_To_Id := AShip_To_Id;
end;


procedure TFrmForecast.AssignParamsQuery(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'aarcusto_id'  , Arcusto_ID, ftFloat);
  AssignQueryParamValue(DataSet, 'all_customers', ord( Arcusto_ID = 0 ), ftFloat);
  AssignQueryParamValue(DataSet, 'group_id'     , Group_ID, ftFloat);
  AssignQueryParamValue(DataSet, 'any_group'    , ord( Group_ID = 0 )  , ftFloat);
  AssignQueryParamValue(DataSet, 'aship_to_id'  , Ship_To_ID, ftFloat);
  AssignQueryParamValue(DataSet, 'any_ship_to'  , ord( Ship_To_ID = 0 ), ftFloat);
  AssignQueryParamValue(DataSet, 'fore_head_id' , Fore_Head_ID, ftFloat);
end;

procedure TFrmForecast.AssignEPlantFilter(DataSet: TDataSet);
begin
  if not (DataSet is TFDQuery) or ((DataSet as TFDQuery).Params.FindParam('eplant_id') = nil) then
    IQAssignEPlantFilter(DataSet)
  else
    AssignQueryParamValue(DataSet, 'eplant_id', IIf( SoftEPlant1.EPlant_ID = 'NULL', '', SoftEPlant1.EPlant_ID ), ftString);

  with DataSet do
    Filtered:= (Filter > '') or Assigned(OnFilterRecord);
end;
(*
procedure TFrmForecast.AssignEPlantFilter(DataSet: TDataSet);
label assign_filtered;
begin
  if DataSet is TFDQuery then with DataSet as TFDQuery do
     if Params.FindParam('eplant_id') <> nil then
     begin
       ParamByName('eplant_id').asString:= IIf( SoftEPlant1.EPlant_ID = 'NULL', '', SoftEPlant1.EPlant_ID );
       goto assign_filtered;
     end;

  IQAssignEPlantFilter(DataSet);

  assign_filtered:
  with DataSet do
    Filtered:= (Filter > '') or Assigned(OnFilterRecord);
end;
*)
function TFrmForecast.GetArcusto_ID: Real;
begin

end;

function TFrmForecast.GetExcludeNonSalable: Boolean;
begin

end;

function TFrmForecast.GetForecastType: string;
begin
  Result:= 'P';  {overriden in ForeMain to reflect user's selection}
end;

function TFrmForecast.GetFore_Head_ID: Real;
begin
  Result:= 0; // overriden in ForeMain.pas
end;

function TFrmForecast.GetFromDate: TDateTime;
begin
  Result:= FFromDate;
end;

function TFrmForecast.GetFullItemInfo: Boolean;
begin
  Result:= TRUE; // overriden in ForeMain
end;

function TFrmForecast.GetGroup_ID: Real;
begin
  Result:= FGroup_ID;
end;

function TFrmForecast.GetIsViewingEPlantSameAsLoggedIn: Boolean;
begin
   Result:= CompareText( SecurityManager.EPlant_ID, SoftEPlant1.EPlant_ID ) = 0
end;


function TFrmForecast.GetShip_To_ID: Real;
begin
  Result:= FShip_To_ID;
end;

function TFrmForecast.GetToDate: TDateTime;
begin
  Result:= FTODate
end;

procedure TFrmForecast.CheckEPlantIsMatching;
begin
  IQAssert( GetIsViewingEPlantSameAsLoggedIn, 'Currently selected Forecast EPlant must match logged in EPlant - operation aborted.');
end;

end.
