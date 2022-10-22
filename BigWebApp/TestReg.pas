unit TestReg;

interface

uses
  Spring.Collections;

type

  TTestProc = procedure;

  TTestReg = record
  private
    FIssue    : string;
    FModule   : string;
    FForm     : string;
    FDescrip  : string;
    FTestProc : TTestProc;
    FTest     : integer;
  public
    procedure Execute;

    property Issue    : string    read FIssue   write FIssue;
    property Module   : string    read FModule  write FModule;
    property Form     : string    read FForm    write FForm;
    property Descrip  : string    read FDescrip write FDescrip;
    property TestProc : TTestProc               write FTestProc;
    property Test     : integer   read FTest    write FTest;
  end;

  TTestRepo = class
  protected
    class var FTests : IDictionary<string, TTestReg>;
  public
    class procedure RegisterTest(aIssue, aModule, aForm, aDescrip : string; aTestProc : TTestProc; aTest : integer = 1);

    class procedure ExecTest(aTest : string);

    class function GetTests : IDictionary<string, TTestReg>;
  end;

implementation

uses
  SysUtils;

{ TTestRepo }

class function TTestRepo.GetTests: IDictionary<string, TTestReg>;
begin
  Result := FTests;
end;

class procedure TTestRepo.RegisterTest(aIssue, aModule, aForm, aDescrip : string; aTestProc : TTestProc; aTest : integer = 1);
var
  tst : TTestReg;
begin
  if not Assigned(FTests) then
    FTests := TCollections.CreateDictionary<string, TTestReg>(TStringComparer.OrdinalIgnoreCase());

  tst.Issue    := aIssue;
  tst.Module   := aModule;
  tst.Form     := aForm;
  tst.Descrip  := aDescrip;
  tst.TestProc := aTestProc;
  tst.Test     := aTest;

  FTests.Add(aIssue + '-' + IntToStr(aTest), tst);
end;

class procedure TTestRepo.ExecTest(aTest : string);
var
  tst : TTestReg;
begin
  if FTests.TryGetValue(aTest, tst) then
    tst.Execute;
end;

{ TTestReg }

procedure TTestReg.Execute;
begin
  FTestProc();
end;

end.
