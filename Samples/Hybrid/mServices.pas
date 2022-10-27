unit mServices;

interface

uses
  Classes,
  Services;

type

  TmServices = class(TInterfacedObject, IServices)

    procedure EditUsers;
    procedure EditOrders;
    procedure ReportSales(const aPDFUrl : string);
  end;

implementation

uses
  Vcl.Controls,
  uniGUImForm,
  _mUsersForm,
  _mOrdersForm,
  _mSalesReportForm;

{ TdServices }

procedure TmServices.EditUsers;
begin
  mUsersForm.ShowModal();
end;

procedure TmServices.EditOrders;
begin
  mOrdersForm.ShowModal();
end;

procedure TmServices.ReportSales(const aPDFUrl : string);
var
  frm : TmSalesReportForm;
begin
  frm := mSalesReportForm;
  frm.PDFUrl := aPDFUrl;
  frm.ShowModal();
end;

end.
