unit WC_5260;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RTTypes,
  AssyTrack_Add;

procedure Test1;
var
  AViewFilter: TCellMfgType;
begin
  AViewFilter.CellOrMfgType := cmCell;
  AViewFilter.Mfgcell_ID := 27;
  AViewFilter.MfgType := 'ASSY1';
  TFrmAssyTrackAdd.DoShow(AViewFilter);
end;

initialization

  TTestRepo.RegisterTest('WC-5260', 'AssyTrack', 'AssyTrack_Add', 'DoShow', Test1, 1);

end.
