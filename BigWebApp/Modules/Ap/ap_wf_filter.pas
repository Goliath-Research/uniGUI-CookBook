unit ap_wf_filter;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  po_wf_filter,
  Data.DB,
//  vcl.wwdblook,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf,
  MainModule,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniDBLookupComboBox,
  uniGUIClasses,
  uniRadioButton,
  uniGroupBox,
  uniGUIBaseClasses,
  uniButton,
  wf_const,
  uniGUIApplication;

type
  TFrmWorkflowFilterAP = class(TFrmWorkflowFilterPO)
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoModify( var AFilter: TWorkflowFilter ): Boolean;
  end;

implementation

{$R *.dfm}

class function TFrmWorkflowFilterAP.DoModify( var AFilter: TWorkflowFilter ): Boolean;
var
  aFrmWorkflowFilterAP : TFrmWorkflowFilterAP;
begin
  aFrmWorkflowFilterAP := TFrmWorkflowFilterAP.Create(UniGUIApplication.UniApplication);
  aFrmWorkflowFilterAP.Filter:= AFilter;
  Result:= aFrmWorkflowFilterAP.ShowModal = mrOK;
end;

end.
