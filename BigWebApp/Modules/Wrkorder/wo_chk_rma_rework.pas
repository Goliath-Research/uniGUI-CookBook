unit wo_chk_rma_rework;

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
  TFrmRMAReworkException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckRMARework(AReworkWorkorder_ID: Real);

var
  FrmRMAReworkException: TFrmRMAReworkException;

implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib;

procedure CheckRMARework(AReworkWorkorder_ID: Real);
begin
  if SelectValueFmtAsInteger(
    'select 1 from rma_detail where rework_workorder_id = %f',
    [AReworkWorkorder_ID]) = 1 then
    begin
    FrmRMAReworkException := TFrmRMAReworkException.Create(UniGUIApplication.UniApplication)  ;
    with FrmRMAReworkException do
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
