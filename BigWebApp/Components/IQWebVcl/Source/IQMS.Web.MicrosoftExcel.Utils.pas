unit IQMS.Web.MicrosoftExcel.Utils;

interface

uses
  System.SysUtils, System.Classes;

function IsMicrosoftExcelInstalled: Boolean;

function PrintExcelSpreadSheet(const AFileName: string): Boolean;

implementation

uses
  IQMS.Web.MicrosoftExcel,
  IQMS.Web.MicrosoftExcel.Interop,
  System.Variants;
var
  // Stored internally to keep track of version
  FMicrosoftExcelInstalled: ShortInt;

function IsMicrosoftExcelInstalled: Boolean;
var
  MicrosoftExcel: IMicrosoftExcel;
begin
  // If the version has not been checked yet, then check it
  if FMicrosoftExcelInstalled = -1 then
    begin
      MicrosoftExcel := TMicrosoftExcelInterop.Create;
      // Assign internal variable with result
      FMicrosoftExcelInstalled := Integer(MicrosoftExcel.IsInstalled);
    end;
  // Return true if Microsoft Excel is installed
  Result := FMicrosoftExcelInstalled = 1;
end;

function PrintExcelSpreadSheet(const AFileName: string): Boolean;
const
  DO_NOT_SAVE_CHANGES: Boolean = False;
var
  MicrosoftExcel: IMicrosoftExcel;
begin
  Result := False;
  MicrosoftExcel := TMicrosoftExcelInterop.Create;
  if MicrosoftExcel.Connect then
    try
      MicrosoftExcel.Application.Workbooks.Open(AFileName);
      MicrosoftExcel.Application.ActiveWindow.SelectedSheets.PrintOut;
      MicrosoftExcel.Application.ActiveWorkbook.Close(DO_NOT_SAVE_CHANGES);
      Result := True;
    finally
      MicrosoftExcel.Disconnect;
    end;
end;

initialization
  FMicrosoftExcelInstalled := -1;

end.
