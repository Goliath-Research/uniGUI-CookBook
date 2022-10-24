unit Services;

interface

type

  TServices = class

    class procedure EditUsers;
    class procedure EditOrders;
    class procedure ReportSales(const aPDFUrl : string);
  end;

implementation

uses
  MainModule,
  Interfaces,
  Spring.Container;

{ TServices }

class procedure TServices.EditOrders;
var
  frm : IOrdersEditorForm;
begin
  frm := UniMainModule.Container.Resolve<IOrdersEditorForm>;
  frm.ShowAsModal;
end;

class procedure TServices.EditUsers;
var
  frm : IUsersEditorForm;
begin
  frm := UniMainModule.Container.Resolve<IUsersEditorForm>;
  frm.ShowAsModal;
  UniMainModule.Container.Release(frm);
end;

class procedure TServices.ReportSales(const aPDFUrl: string);
var
  frm : ISalesReportForm;
begin
  frm := UniMainModule.Container.Resolve<ISalesReportForm>;
  frm.PDFUrl := aPDFUrl;
  frm.ShowAsModal;
end;

end.
