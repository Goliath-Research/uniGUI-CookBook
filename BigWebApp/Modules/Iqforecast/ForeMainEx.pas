unit ForeMainEx;

interface

{ Parameters passing in AOptional are for future use }
procedure DoForeMain( AKind: Integer; AID: Real; AOptional: array of Variant);

implementation

uses
  ForeConst,
  ForeMain;

procedure DoForeMain( AKind: Integer; AID: Real; AOptional: array of Variant);
begin
  case AKind of
    FORE_SHOW_MAIN: DoForecast;             {ForeMain.pas}
    FORE_JUMP     : DoJumpForecast( AID,    {ForeMain.pas}  {arinvt_id}
                                    AOptional[ 0 ][ 0 ]);   {mmm-yyyy}
  end;                         
end;

end.
