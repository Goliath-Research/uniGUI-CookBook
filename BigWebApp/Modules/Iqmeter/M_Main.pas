unit M_Main;

interface

{ Parameters passing in AOptional:
  when M_RT_EFFICIENCY:
  0 - 
  1 - 
  2 - 
  3 - 
}

procedure DoMain( AKind: Integer; AID: Real; AOptional: array of Variant);

implementation

uses
  M_Const,
  M_RTEff;
  { TODO -omugdha -cWEBIQ : dependency on M_Viewer
  M_Viewer;}

procedure DoMain( AKind: Integer; AID: Real; AOptional: array of Variant);
begin
  case AKind of
    M_RT_EFFICIENCY     : TFrmM_RTEff.DoShow( AID );   {M_RTEff.pas}
    { TODO -omugdha -cWEBIQ : dependency on M_Viewer
    M_RT_EFFICIENCY_VIEW: TFrmM_Viewer.DoShow( AOptional[0][0]);  }       {M_Viewer.pas}
  end;                         
end;

end.
