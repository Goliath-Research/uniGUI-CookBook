unit WC_9196;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  IQMS.Common.MiscItem;

procedure TestGetMistItem;
var
  MiscItemInfo : TMiscItemInfo;
begin
  GetMiscItem(MiscItemInfo);
end;

procedure TestGetMiscItemEx;
var
  MiscItemInfo : TMiscItemInfo;
  AControlOptions: TMiscControlOptions;
begin
  AControlOptions:=[mcoEnableItemNumber];
  GetMiscItemEx(AControlOptions,MiscItemInfo);
end;


initialization

  TTestRepo.RegisterTest('WC-9196', 'IQWebCommon', 'MiscItem', 'GetMiscItem'  , TestGetMistItem);
  TTestRepo.RegisterTest('WC-9196', 'IQWebCommon', 'MiscItem', 'GetMiscItemEx', TestGetMiscItemEx);

end.
