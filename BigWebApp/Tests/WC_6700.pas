unit WC_6700;

interface

implementation

uses
  TestReg,
  System.Classes,
  FR_Grph;

procedure Test1;
var
  LStringList: TStringList;
begin
  LStringList := TStringList.create();
  LStringList.add('January');
  LStringList.add('February');
  LStringList.add('March');
  DoShowList(LStringList);
end;

initialization

  TTestRepo.RegisterTest('WC_6700', 'Iqforecast', 'FR_Grph', 'DoShowList', Test1);

end.
