unit WC_9319;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  System.Classes, // TStringList
  oc_check_pktkt_exists;

procedure Test1;
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.Add('25276');
    TFrmOutsource_CheckPickTicketExists.DoShowModal(SL);
  finally
    SL.Free;
  end;
end;

initialization

TTestRepo.RegisterTest('WC-9319', 'outsource_central', 'oc_check_pktkt_exists', 'DoShowModal', Test1, 1);

end.
