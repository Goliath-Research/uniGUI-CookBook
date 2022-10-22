unit spc_expression_builder;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniBitBtn;

type
  TFrmSPCExprBuilder = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
  private
    function GetFormula: String;
    procedure SetFormula(const Value: String);
    { Private declarations }
  public
    { Public declarations }

    property Formula: String read GetFormula write SetFormula;
    class function SPCBuildFormulaExpression(var AFormula: String): Boolean;
  end;


implementation

{$R *.dfm}

class function SPCBuildFormulaExpression(var AFormula: String): Boolean;

var
  frm : TFrmSPCExprBuilder;

begin

  frm := TFrmSPCExprBuilder.Create(uniGUIApplication.UniApplication);
  frm.Formula := AFormula;

  Result := frm.ShowModal = mrOk;

  if Result then
     AFormula := frm.Formula;
end;

function TFrmSPCExprBuilder.GetFormula: String;
begin

end;

procedure TFrmSPCExprBuilder.SetFormula(const Value: String);
begin

end;

end.
