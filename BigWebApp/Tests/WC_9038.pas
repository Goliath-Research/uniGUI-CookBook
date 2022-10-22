unit WC_9038;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  IQMS.Common.BulletinBoardEdit;

procedure Test1;
begin
  TBulletinBoardEdit.AddOrEdit;
end;


initialization

  TTestRepo.RegisterTest('WC-9466', 'IQWebCommon', 'TBulletinBoardEdit', 'AddOrEdit'  , Test1);

end.
