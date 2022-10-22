unit WC_9224;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  Data.DB,
  WC_9224_DM,
  IQMS.Common.SetPlant;

procedure Test1;
var
  dm : TDataModuleWC_9224;
begin
  dm := TDataModuleWC_9224.Create(UniGUIApplication.UniApplication);
  try
    with dm do
    begin
      mt1.Append;
        mt1ID.Value         := 1;
        mt1Name.Value       := 'Name';
      mt1.Post;

      if DoChangePlantID(mt1, mt1EPLANT_NAME) then
        ShowMessage(mt1EPLANT_ID.AsString + ' - ' + mt1EPLANT_NAME.Value);
    end;
  finally
    dm.Free;
  end;
end;

procedure Test2;
var
  dm : TDataModuleWC_9224;
begin
  dm := TDataModuleWC_9224.Create(UniGUIApplication.UniApplication);
  try
    with dm do
    begin
      mt1.Append;
        mt1ID.Value         := 1;
        mt1Name.Value       := 'Name';
        mt1EPLANT_ID.Value  := 4;
      mt1.Post;

      if DoChangePlantID(mt1, mt1EPLANT_NAME) then
        ShowMessage(mt1EPLANT_ID.AsString + ' - ' + mt1EPLANT_NAME.Value);
    end;
  finally
    dm.Free;
  end;
end;

initialization

  TTestRepo.RegisterTest('WC-9224', 'iqshare', 'SetPlant', 'DoChangePlantID - Unassigned', Test1, 1);
  TTestRepo.RegisterTest('WC-9224', 'iqshare', 'SetPlant', 'DoChangePlantID - One Plant' , Test2, 2);

end.
