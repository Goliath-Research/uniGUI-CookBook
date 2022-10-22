unit WC_8447;

interface

implementation

uses
  MainModule,
  TestReg,
  ud_query_editor_sales_analysis,
  Classes;

procedure Test1;
var
  FrmUD_QueryEditorSalesAnalysis : TFrmUD_QueryEditorSalesAnalysis;
  tmp:TstringList;
begin
  try
    tmp:= TStringList.Create;
    tmp.Add('');
    FrmUD_QueryEditorSalesAnalysis:=TFrmUD_QueryEditorSalesAnalysis.Create(15,tmp);
  finally
    tmp.Free;
  end;
end;

initialization

  TTestRepo.RegisterTest('WC-8447', 'Sanalys', 'ud_query_editor_sales_analysis', 'ShowModal', Test1);

end.
