unit dServices;

interface

uses
  Classes,
  Services;

type

  TdServices = class(TInterfacedObject, IServices)

    procedure EditUsers;
    procedure EditOrders;
    procedure ReportSales(const aPDFUrl : string);
  end;

implementation

uses
  Vcl.Controls,
  uniGUIForm,
  _dUsersForm,
  _dOrdersForm,
  _dSalesReportForm;

{ TdServices }

procedure TdServices.EditUsers;
begin
  dUsersForm.ShowModal();
end;

procedure TdServices.EditOrders;
begin
  dOrdersForm.ShowModal();
end;

procedure TdServices.ReportSales(const aPDFUrl : string);
var
  frm : TdSalesReportForm;
begin
  frm := dSalesReportForm;
  frm.PDFUrl := aPDFUrl;
  frm.ShowModal();
end;

end.
