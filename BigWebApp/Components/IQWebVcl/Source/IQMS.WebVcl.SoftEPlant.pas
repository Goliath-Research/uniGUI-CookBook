unit IQMS.WebVcl.SoftEPlant
;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB;

type
  TIQWebSoftEPlant = class(TComponent)
  private
    { Private declarations }
    FEPlant_ID           : string;
    FEPlant_Include_Nulls: Boolean;
    procedure SetEPlant_ID( const AValue: string );
  protected
    { Protected declarations }            
  public
    { Public declarations }
    constructor Create( AOwner: TComponent ); override;
    procedure AssignEPlantFilter( DataSet: TDataSet );
    function ChangeEPlantView: Boolean;
  published
    { Published declarations }
    property EPlant_ID: string read FEPlant_ID write SetEPlant_ID;
    property EPlant_Include_Nulls: Boolean read FEPlant_Include_Nulls write FEPlant_Include_Nulls;
  end;

implementation

uses
  IQMS.WebVcl.SecurityManager,
  IQMS.WebVcl.PlantBase,
  IQMS.Common.DataLib;

constructor TIQWebSoftEPlant.Create( AOwner: TComponent );
begin
  inherited;
  if (SecurityManager <> nil) then
  begin
    EPlant_ID := SecurityManager.EPlant_ID;
    EPlant_Include_Nulls:= SecurityManager.EPlant_Include_Nulls;
  end;
end;

procedure TIQWebSoftEPlant.SetEPlant_ID( const AValue: string );
var
  ALValue: Int64;
begin
  if TryStrToInt64(AValue, ALValue) and (ALValue > 0) then
    FEPlant_ID := AValue
  else
    FEPlant_ID:= 'NULL';

  FEPlant_ID:= AValue;
  try
    if StrToInt( FEPlant_ID ) <= 0 then
       FEPlant_ID:= 'NULL';
  except
    FEPlant_ID:= 'NULL';
  end;
end;

procedure TIQWebSoftEPlant.AssignEPlantFilter( DataSet: TDataSet );
begin
  IQAssignEPlantFilterParam( DataSet, EPlant_ID, EPlant_Include_Nulls );
end;
     
function TIQWebSoftEPlant.ChangeEPlantView: Boolean;
begin
  Result:= TFrmChangeEPlantBase.DoChangeEPlantView( FEPlant_ID );  {Plnt_Bas.pas}
end;

     
end.
 