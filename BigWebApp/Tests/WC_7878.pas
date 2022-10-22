unit WC_7878;

interface

implementation

uses
  TestReg,
  System.SysUtils,
  DateUtils,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  Prn_Doc;

procedure TestDoShow;
begin
  TFrmPrintDocsCustom.DoShow(DateTimeToStr(now), DateTimeToStr(now-1));
end;

procedure TestGetExternalDocsList;
var
  LStrLst: TStringList;
begin
  LStrLst:= TStringList.Create;
  try
    TFrmPrintDocsCustom.GetExternalDocsList(DateTimeToStr(now), DateTimeToStr(now-1), LStrLst);
  finally
    LStrLst.Free;
  end;
end;

initialization

  TTestRepo.RegisterTest('WC-7878', 'Print_Dialogs', 'TFrmPrintDocsCustom', 'DoShow', TestDoShow, 1);
  TTestRepo.RegisterTest('WC-7878', 'Print_Dialogs', 'TFrmPrintDocsCustom', 'GetExternalDocsList', TestGetExternalDocsList, 2);

end.
