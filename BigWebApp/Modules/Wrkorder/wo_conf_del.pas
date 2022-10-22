unit wo_conf_del;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Forms,
  EdiConfDel,
  FireDAC.Comp.DataSet,
  MainModule, IQMS.WebVcl.SecurityRegister, uniButton, uniGUIClasses,
  uniRadioButton, uniGroupBox, System.Classes, Vcl.Controls, uniGUIBaseClasses,
  uniPanel;

type
  TFrmWOConfDel = class(TFrmEdiConfDel)
  private
    { Private declarations }
  public
    { Public declarations }
   class function DoShowModal( AWorkOrder_ID: Real ):TConfrimDeleteArchive;
  end;

implementation

{$R *.dfm}

uses
  wo_rscstr,
  uniGUIApplication;

class function TFrmWOConfDel.DoShowModal( AWorkOrder_ID: Real ):TConfrimDeleteArchive;
begin
  with self.Create(uniGUIApplication.UniApplication) do
  begin
    // wo_rscstr.cTXT0000059 = 'Delete Work Order # %d';
    Caption := Format(wo_rscstr.cTXT0000059, [Trunc(AWorkOrder_ID)]);
    ShowModal;
    Result:= nConfirmDelete;
  end;
end;


end.
