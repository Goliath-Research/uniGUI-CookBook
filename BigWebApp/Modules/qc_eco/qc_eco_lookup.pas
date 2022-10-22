unit qc_eco_lookup;

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
  MainModule;

type
  TQCEcoLookupManager = class
  private
    FEoc_ID     : Real;
    function GetDispValue( ATableName, AFieldName: string; AID: Real ): string;

    function HasLookupForStandard( AFieldName, AOldValue, ANewValue: string; var AOld_Lookup_Value, ANew_Lookup_Value: string; AOld_ID, ANew_ID: Real ): Boolean;
    function HasLookupForPartno  ( AFieldName, AOldValue, ANewValue: string; var AOld_Lookup_Value, ANew_Lookup_Value: string; AOld_ID, ANew_ID: Real ): Boolean;
    function HasLookupForOpMat   ( AFieldName, AOldValue, ANewValue: string; var AOld_Lookup_Value, ANew_Lookup_Value: string; AOld_ID, ANew_ID: Real ): Boolean;
    function HasLookupForPtoper  ( AFieldName, AOldValue, ANewValue: string; var AOld_Lookup_Value, ANew_Lookup_Value: string; AOld_ID, ANew_ID: Real ): Boolean;
  public
    constructor Create( AEoc_ID: Real );
    function HasLookup( ATableName, AFieldName, AOldValue, ANewValue: string; var AOld_Lookup_Value, ANew_Lookup_Value: string; AOld_ID, ANew_ID: Real ): Boolean;
  end;


implementation

uses
  IQMS.Common.StringUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers;

constructor TQCEcoLookupManager.Create( AEoc_ID: Real );
begin
  inherited Create;
  FEoc_ID := AEoc_ID;
end;

function TQCEcoLookupManager.HasLookup( ATableName, AFieldName, AOldValue, ANewValue: string;
         var AOld_Lookup_Value, ANew_Lookup_Value: string; AOld_ID, ANew_ID: Real ): Boolean;
begin
  if      ATableName = 'STANDARD' then  Result:= HasLookupForStandard( AFieldName, AOldValue, ANewValue, AOld_Lookup_Value, ANew_Lookup_Value, AOld_ID, ANew_ID )
  else if ATableName = 'PARTNO'   then  Result:= HasLookupForPartno  ( AFieldName, AOldValue, ANewValue, AOld_Lookup_Value, ANew_Lookup_Value, AOld_ID, ANew_ID )
  else if ATableName = 'OPMAT'    then  Result:= HasLookupForOpMat   ( AFieldName, AOldValue, ANewValue, AOld_Lookup_Value, ANew_Lookup_Value, AOld_ID, ANew_ID )
  else if ATableName = 'PTOPER'   then  Result:= HasLookupForPtoper  ( AFieldName, AOldValue, ANewValue, AOld_Lookup_Value, ANew_Lookup_Value, AOld_ID, ANew_ID )
  else
       Result:= FALSE;
end;

function TQCEcoLookupManager.GetDispValue( ATableName, AFieldName: string; AID: Real ): string;
begin
  Result:= SelectValueFmtAsString('select %s from %s where id = %f', [ AFieldName, ATableName, AID ]);
end;

function TQCEcoLookupManager.HasLookupForStandard( AFieldName, AOldValue, ANewValue: string;
         var AOld_Lookup_Value, ANew_Lookup_Value: string; AOld_ID, ANew_ID: Real ): Boolean;
var
  A: Variant;
begin
  Result:= TRUE;
  if StrInList( AFieldName, ['sets', 'cycletm', 'sprue' ]) then
     begin
       AOld_Lookup_Value:= GetDispValue( 'standard', AFieldName + '_DISP',  AOld_ID );
       ANew_Lookup_Value:= GetDispValue( 'standard', AFieldName + '_DISP',  ANew_ID );
     end

  else if CompareText( AFieldName, 'arinvt_id_mat' ) = 0 then
     begin
       AOld_Lookup_Value:= SelectValueByID('itemno', 'arinvt', StoF( AOldValue ));
       ANew_Lookup_Value:= SelectValueByID('itemno', 'arinvt', StoF( ANewValue ));
     end

  else if CompareText( AFieldName, 'arcusto_id' ) = 0 then
     begin
       AOld_Lookup_Value:= SelectValueByID('company', 'arcusto', StoF( AOldValue ));
       ANew_Lookup_Value:= SelectValueByID('company', 'arcusto', StoF( ANewValue ));
     end

  else if CompareText( AFieldName, 'mfgcell_id' ) = 0 then
     begin
       AOld_Lookup_Value:= SelectValueByID('mfgcell', 'mfgcell', StoF( AOldValue ));
       ANew_Lookup_Value:= SelectValueByID('mfgcell', 'mfgcell', StoF( ANewValue ));
     end

  else if CompareText( AFieldName, 'pmeqmt_id' ) = 0 then
     begin
       AOld_Lookup_Value:= SelectValueByID('eqno', 'pmeqmt', StoF( AOldValue ));
       ANew_Lookup_Value:= SelectValueByID('eqno', 'pmeqmt', StoF( ANewValue ));
     end

  else
     Result:= FALSE;
end;

function TQCEcoLookupManager.HasLookupForPartno( AFieldName, AOldValue, ANewValue: string;
         var AOld_Lookup_Value, ANew_Lookup_Value: string; AOld_ID, ANew_ID: Real ): Boolean;
begin
  Result:= TRUE;
  if StrInList( AFieldName, [ 'ptwt' ]) then
     begin
       AOld_Lookup_Value:= GetDispValue( 'partno', AFieldName + '_DISP',  AOld_ID );
       ANew_Lookup_Value:= GetDispValue( 'partno', AFieldName + '_DISP',  ANew_ID );
     end

  else if CompareText( AFieldName, 'arinvt_id' ) = 0 then
     begin
       AOld_Lookup_Value:= SelectValueByID('descrip', 'arinvt', StoF( AOldValue ));
       ANew_Lookup_Value:= SelectValueByID('descrip', 'arinvt', StoF( ANewValue ));
     end

  else
     Result:= FALSE;
end;

function TQCEcoLookupManager.HasLookupForOpMat( AFieldName, AOldValue, ANewValue: string;
         var AOld_Lookup_Value, ANew_Lookup_Value: string; AOld_ID, ANew_ID: Real ): Boolean;
begin
  Result:= TRUE;
  if CompareText( AFieldName, 'arinvt_id' ) = 0 then
     begin
       AOld_Lookup_Value:= SelectValueByID('itemno', 'arinvt', StoF( AOldValue ));
       ANew_Lookup_Value:= SelectValueByID('itemno', 'arinvt', StoF( ANewValue ));
     end

  else if CompareText( AFieldName, 'id' ) = 0 then
     begin
       AOld_Lookup_Value:= SelectValueFmtAsString('select a.descrip from arinvt a, opmat o where o.id = %f and o.arinvt_id = a.id', [ StoF( AOldValue ) ]);
       ANew_Lookup_Value:= SelectValueFmtAsString('select a.descrip from arinvt a, opmat o where o.id = %f and o.arinvt_id = a.id', [ StoF( ANewValue ) ]);
     end

  else
     Result:= FALSE;
end;


function TQCEcoLookupManager.HasLookupForPtoper( AFieldName, AOldValue, ANewValue: string;
         var AOld_Lookup_Value, ANew_Lookup_Value: string; AOld_ID, ANew_ID: Real ): Boolean;
begin
  Result:= TRUE;
  if CompareText( AFieldName, 'id' ) = 0 then
     begin
       AOld_Lookup_Value:= SelectValueByID('sndop_id', 'ptoper', StoF( AOldValue ));
       ANew_Lookup_Value:= SelectValueByID('sndop_id', 'ptoper', StoF( ANewValue ));
     end
  else
     Result:= FALSE;
end;


end.
