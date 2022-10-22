unit _mSalesReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniURLFrame, unimURLFrame;

type
  TmSalesReportForm = class(TUnimForm)
    UnimPDFFrame1: TUnimPDFFrame;
  private
    procedure SetPDFUrl(const Value : string);
  public

    property PDFUrl : string write SetPDFUrl;
  end;

function mSalesReportForm: TmSalesReportForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function mSalesReportForm: TmSalesReportForm;
begin
  Result := TmSalesReportForm(UniMainModule.GetFormInstance(TmSalesReportForm));
end;

{ TmSalesReportForm }

procedure TmSalesReportForm.SetPDFUrl(const Value : string);
begin
   UnimPDFFrame1.PDFUrl := Value;
end;

end.
