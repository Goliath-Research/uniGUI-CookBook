unit WC_8296;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RMAArch;

procedure Test1;
begin
  if DoArchiveClosedRMA then
    Showmessage('TRUE') else
    Showmessage('FALSE');
end;

initialization

  TTestRepo.RegisterTest('WC-8296', 'Rma', 'RMAArch', 'DoArchiveClosedRMA', Test1, 1);

end.
