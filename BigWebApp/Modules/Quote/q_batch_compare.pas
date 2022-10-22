unit q_batch_compare;

interface

uses
  Winapi.Windows,
  q_batch_print,
//  Vcl.Wwdatsrc,
  MainModule,
  uniGUIApplication,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About, Vcl.Menus, uniMainMenu, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, uniButton, uniDBNavigator, uniBitBtn, uniSpeedButton,
  uniGUIClasses, uniMemo, uniDBMemo, uniLabel, IQUniGrid, Vcl.Forms,
  uniGUIFrame, uniPanel, System.Classes, Vcl.Controls, uniGUIBaseClasses,
  uniSplitter;

type
  TFrmQ_Batch_Compare = class(TFrmQ_Batch_Print)
  private
    { Private declarations }
  protected
    procedure AssignReportFieldName; override;
  public
    class procedure DoShowModal; override;
  end;

implementation

{$R *.dfm}


procedure TFrmQ_Batch_Compare.AssignReportFieldName;
begin
  // inherited;
  FReportFieldName:= 'RFQ_COMPARE_REPORT';
end;


class procedure TFrmQ_Batch_Compare.DoShowModal;
var
  frm: TFrmQ_Batch_Compare;
begin
//  inherited;
  frm := TFrmQ_Batch_Compare.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

end.
