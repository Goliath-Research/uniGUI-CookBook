unit WC_8795;

interface

implementation

uses
  TestReg,
  TrDtTrTp,
  System.SysUtils;

procedure Test1;
var
  From, FTo: TDateTime;
  TransType:string;
  HideOrphan, ReviewPosted: Boolean;
begin
  From := Now;
  FTo := Now-1;
  TransType := 'DISPOSITION';
  HideOrphan:= true;
  ReviewPosted := true;
  GetTransDatesAndType(From, FTo, TransType, HideOrphan, ReviewPosted);
end;

procedure Test2;
var
  From, FTo: TDateTime;
  TransType:string;
  HideOrphan, ReviewPosted: Boolean;
begin
  From := Now;
  FTo := Now-1;
  TransType := 'DISPOSITION';
  HideOrphan:= true;
  ReviewPosted := true;
  GetTransDatesAndTypeEx(From, FTo, TransType, HideOrphan, ReviewPosted);
end;

initialization

  TTestRepo.RegisterTest('WC-8795', 'Trans', 'TrDtTrTp', 'GetTransDatesAndType', Test1, 1);
  TTestRepo.RegisterTest('WC-8795', 'Trans', 'TrDtTrTp', 'GetTransDatesAndTypeEx', Test1, 2);
end.
