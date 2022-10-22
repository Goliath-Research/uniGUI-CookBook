unit IQMS.Common.UoM;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.Registry,
  IQMS.Common.DataLib,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys;

function IsMetricSys( AEPlant_ID: Real = 0 ):Boolean;
function IsMetricSysArinvt( AArinvt_ID: Real ):Boolean;
function IsMetricSysBOM( AStandard_ID: Real ):Boolean;
function NativeWeightUOM( AEPlant_ID: Real = 0): string;
function NativeLengthUOM( AEPlant_ID: Real = 0 ): string;
function IQConvertUom( AQty: Real; AFromUOM, AToUOM: string; AArinvt_ID: Real; AIgnoreError: Boolean = TRUE ): Real;
function IQToNativeUomFactor( AFromUOM: string; AArinvt_ID: Real; AIgnoreError: Boolean = TRUE ): Real;

implementation

function IsMetricSysArinvt( AArinvt_ID: Real ):Boolean;
begin
  Result:= IsMetricSys( SelectValueFmtAsFloat('select eplant_id from arinvt where id = %f', [ AArinvt_ID ]));
end;

function IsMetricSysBOM( AStandard_ID: Real ):Boolean;
begin
  Result:= IsMetricSys( SelectValueFmtAsFloat('select eplant_id from standard where id = %f', [ AStandard_ID ]));
end;


function IsMetricSys( AEPlant_ID: Real = 0 ):Boolean;
begin
  // Result:= SelectValueAsString('select metric_uom from params') = 'Y';
  with TFDStoredProc.Create(nil) do
  try
    ConnectionName:= 'IQFD';
    PackageName:= 'UOM';
    StoredProcName:= 'IS_METRIC_SYS_NUM';
    Prepare;
    ParamByName('v_eplant_id').Value:= AEPlant_ID;
    ExecProc;
    Result:= (ParamByName('result').asFloat = 1);
  finally
    Free;
  end;
end;

function NativeWeightUOM( AEPlant_ID: Real = 0 ): string;
begin
  if IsMetricSys( AEPlant_ID ) then
     Result:= 'KG'
  else
     Result:= 'LBS';
end;

function NativeLengthUOM( AEPlant_ID: Real = 0 ): string;
begin
  if IsMetricSys(AEPlant_ID) then
     Result:= 'M'
  else
     Result:= 'FT';
end;


function IQConvertUom( AQty: Real; AFromUOM, AToUOM: string; AArinvt_ID: Real; AIgnoreError: Boolean = TRUE ): Real;
begin
  Result  := AQty;
  AFromUOM:= Trim( AFromUOM );
  AToUOM  := Trim( AToUOM );
  if CompareText( AFromUOM, AToUOM ) <> 0 then
  try
    with TFDStoredProc.Create(Application) do
    try
      ConnectionName:= 'IQFD';
      PackageName:= 'UOM';
      StoredProcName:= 'IQCONVERT';
      Prepare;
      ParamByName('v_uom1').Value:= AFromUOM;
      ParamByName('v_uom2').Value:= AToUOM;
      ParamByName('v_data').Value:= AQty;
      ParamByName('v_arinvt_id').Value:= AArinvt_ID;
      {if aarinvt_id is <= 0 then a simple conversion is applied ie arinvt_uom_conv is not involved }
      ExecProc;
      Result:= ParamByName('result').asFloat;
    finally
      Free;
    end;
  except
    if not AIgnoreError then
       raise
    {invalid conversion such as FT to LBS - walk away silently}
  end;
end;

function IQToNativeUomFactor( AFromUOM: string; AArinvt_ID: Real; AIgnoreError: Boolean = TRUE ): Real;
var
  AToUOM: string;
begin
  Result  := 1;
  AFromUOM:= Trim( AFromUOM );
  AToUOM  := Trim(SelectValueByID('unit', 'arinvt', AArinvt_ID));
  if CompareText( AFromUOM, AToUOM ) <> 0 then
  try
    with TFDStoredProc.Create(Application) do
    try
      ConnectionName:= 'IQFD';
      PackageName:= 'UOM';
      StoredProcName:= 'IQCONVERT';
      Prepare;
      ParamByName('v_uom1').Value:= AFromUOM;
      ParamByName('v_uom2').Value:= AToUOM;
      ParamByName('v_data').Value:= 1;
      ParamByName('v_arinvt_id').Value:= AArinvt_ID;
      {if aarinvt_id is <= 0 then a simple conversion is applied ie arinvt_uom_conv is not involved }
      ExecProc;
      Result:= ParamByName('result').asFloat;
    finally
      Free;
    end;
  except
    if not AIgnoreError then
       raise
    {invalid conversion such as FT to LBS - walk away silently}
  end;
end;

end.




