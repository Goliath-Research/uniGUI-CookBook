unit WC_8846;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TrNewLoc;

procedure TestDoShowModal;
var
  a : TNewLocationParamsIn;
  b : TNewLocationParamsOut;
begin
  TFrmTranNewLocation.DoShowModal(a,b);
end;

procedure Test1;
var
  a : Real;
begin
  a := 52448;
  CreateTranNewLocation(156117,a,298,'test1','test2');
end;

procedure Test2;
var
  a : Real;
begin
  a := 52448;
  CreateTranNewLocationEx(156117,a,298,'test1','test2');
end;

initialization
  TTestRepo.RegisterTest('WC-8846', 'Trans', 'TrNewLoc', 'DoShowModal', TestDoShowModal, 1);
  TTestRepo.RegisterTest('WC-8846', 'Trans', 'TrNewLoc', 'CreateTranNewLocation', Test1, 2);
  TTestRepo.RegisterTest('WC-8846', 'Trans', 'TrNewLoc', 'CreateTranNewLocationEx', Test2, 3);
end.
