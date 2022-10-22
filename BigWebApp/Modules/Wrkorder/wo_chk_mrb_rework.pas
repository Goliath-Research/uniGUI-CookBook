unit wo_chk_mrb_rework;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.DataSet,
  uniGUIApplication,
  MainModule;

type
  TFrmMRBReworkException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckMRBRework(AReworkWorkorder_ID: Real);

var
  FrmMRBReworkException: TFrmMRBReworkException;

implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib;

procedure CheckMRBRework(AReworkWorkorder_ID: Real);
begin
  if SelectValueFmtAsInteger(
    'select 1 from wf_deviation_item where mrb_rework_workorder_id = %f',
    [AReworkWorkorder_ID]) = 1 then
    begin
   FrmMRBReworkException := TFrmMRBReworkException.Create(UniGUIApplication.UniApplication);
    with  FrmMRBReworkException do
      try
        if not (ShowModal = mrOK) then
          //raise Exception.Create('Status exception has not been authorized - unable to proceed');
          raise TIQNotAuthorizedException.Create;
      finally
        Release;
      end;
    end;
end;

end.
