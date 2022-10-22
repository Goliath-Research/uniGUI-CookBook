unit qc_eco_misc;

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
  IQMS.Common.DataLib;

procedure AppendToEcoBom( AEco_ID, AStandard_ID: Real; var ANewEco_Bom_ID: Real );
procedure CreateECOFromBOM( AECO_ID, ANewEco_Bom_ID, AOldStandard_ID: Real; var ANewStandard_ID: Real; var ANewMfgNo: string );

implementation

uses
  IQMS.Common.StringUtils;

procedure AppendToEcoBom( AEco_ID, AStandard_ID: Real; var ANewEco_Bom_ID: Real );
var
  AECO_Standard_ID: Real;
  AECO_MfgNo      : string;
  AMfgno          : string;
begin
  AMfgno:= SelectValueByID('mfgno', 'standard', AStandard_ID);

  ANewEco_Bom_ID:= GetNextID('ECO_BOM');
  ExecuteCommandFmt('insert into eco_bom( id, eco_id ) values( %f, %f )', [ ANewEco_Bom_ID, AEco_ID ]);

  CreateECOFromBOM( AEco_ID, ANewEco_Bom_ID, AStandard_ID, AECO_Standard_ID, AECO_MfgNo );

  ExecuteCommandFmt('update eco_bom set standard_id = %f, mfgno = ''%s'', eco_standard_id = %f, eco_mfgno = ''%s'' where id = %f',
            [ AStandard_ID,
              FixStr(AMfgno),
              AECO_Standard_ID,
              AECO_MfgNo,
              ANewEco_Bom_ID ]);
end;

procedure CreateECOFromBOM( AECO_ID, ANewEco_Bom_ID, AOldStandard_ID: Real; var ANewStandard_ID: Real; var ANewMfgNo: string );
begin
  ANewStandard_ID:= GetNextID('standard');
  ANewMfgNo:= Format('ECO-%.0f', [ ANewStandard_ID ]);

  ExecuteCommandFmt('begin qc_eco_bom.copy_to_eco( %f, %f, %f, ''%s'', %f ); end;', [ AECO_ID, AOldStandard_ID, ANewStandard_ID, ANewMfgNo, ANewEco_Bom_ID ]);
end;

end.
