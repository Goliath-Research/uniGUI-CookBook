unit _dSalesReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniURLFrame;

type
  TdSalesReportForm = class(TUniForm)
    UniPDFFrame1: TUniPDFFrame;
  private
    procedure SetPDFUrl(const Value : string);
  public

    property PDFUrl : string write SetPDFUrl;
  end;

function dSalesReportForm: TdSalesReportForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function dSalesReportForm: TdSalesReportForm;
begin
  Result := TdSalesReportForm(UniMainModule.GetFormInstance(TdSalesReportForm));
end;

{ TdSalesReportForm }

procedure TdSalesReportForm.SetPDFUrl(const Value : string);
begin
  UniPDFFrame1.PdfURL := Value;
end;

end.
