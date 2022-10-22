unit ud_query_editor_sales_analysis;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Data.DB,
  ud_query_editor_base,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  DBXOracle,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.SqlExpr,
  Vcl.Controls,
  Vcl.Buttons, uniGUIClasses, uniMemo, uniBitBtn, uniSpeedButton, uniButton,
  Vcl.Forms, uniGUIBaseClasses, uniPanel;

type
  TFrmUD_QueryEditorSalesAnalysis = class(TFrmUD_QueryEditorBase)
  private
    { Private declarations }
  protected
    procedure BeforeValidateOpenQuerySyntax; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


{ TFrmUD_QueryEditorSalesAnalysis }

procedure TFrmUD_QueryEditorSalesAnalysis.BeforeValidateOpenQuerySyntax;
begin
  inherited;  // n

  // date params
  if QryTemp.Params.FindParam('date1') <> nil then
     QryTemp.ParamByName('date1').DataType:= ftDateTime;

  if QryTemp.Params.FindParam('date2') <> nil then
     QryTemp.ParamByName('date2').DataType:= ftDateTime;
end;

end.
