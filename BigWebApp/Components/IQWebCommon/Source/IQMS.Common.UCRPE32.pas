{ UCRPE32 belongs to Crystal VCL and became obsolete as of Aug-2011 when we switched entirely to .NET printing.
  This is just a stub / replacement for Crystal 9 VCL to avoid compiler errors}
unit IQMS.Common.UCRPE32;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TCrExportFileName = string;
  TCrOutput = (toWindow, toPrinter, toExport);
  TCrExportType = (Records, TabSeparated, Ascii, Dif, Csv, CharacterSeparated, TabSeparatedText, CrystalReportRPT, LotusWK1, LotusWK3, LotusWKS, RichTextFormat, WordForWindows, ExcelXLS, HTML30, HTML32ext, HTML32std, HTML4, ODBCTable, PaginatedText, ReportDefinition, AdobeAcrobatPDF, XML1);
  TCrExportDestination = (toFile, toEmailViaMapi, toEmailViaVIM, toEmailViaSMI, toMSExchange, toLotusNotes, toApplication);
  TCrExportExcelType = (Excel2, Excel3, Excel4, Excel5, Excel5Extended, Excel7, Excel7Tab, Excel8, Excel8Tab);


  TCrpe = class
  end;

implementation

end.
