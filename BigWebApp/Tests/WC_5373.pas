unit WC_5373;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RunsBest;

procedure TestDoRunsTheBest;
begin
  DoRunsTheBest( nil );
end;

procedure TestDoRunsTheBestEx;
begin
  DoRunsTheBestEx( 44703 );
end;

procedure TestDoRunsTheBestExA;
begin
  DoRunsTheBestExA( 465 );
end;

initialization

  TTestRepo.RegisterTest('WC_5373', 'Bom', 'RunsBest', 'DoRunsTheBest', TestDoRunsTheBest, 1);
  TTestRepo.RegisterTest('WC_5373', 'Bom', 'RunsBest', 'DoRunsTheBest', TestDoRunsTheBestEx, 2);
  TTestRepo.RegisterTest('WC_5373', 'Bom', 'RunsBest', 'DoRunsTheBest', TestDoRunsTheBestExA, 3);

end.
