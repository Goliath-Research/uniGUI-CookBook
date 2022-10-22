unit wo_project_linked_chk;

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
  TFrmWOLinkedToProjectException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmWOLinkedToProjectException: TFrmWOLinkedToProjectException;

procedure CheckWorkorderIsLinkedToToolingProject(AWorkorder_ID: Real);

implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib;

procedure CheckWorkorderIsLinkedToToolingProject(AWorkorder_ID: Real);
begin
  if SelectValueFmtAsFloat(
    'select tool_task_information_id from workorder w where w.id = %f',
    [AWorkorder_ID]) = 0 then
    EXIT;
   FrmWOLinkedToProjectException := TFrmWOLinkedToProjectException.Create(UniGUIApplication.UniApplication) ;
  with FrmWOLinkedToProjectException do
    try
      if not (ShowModal = mrOK) then
        //raise Exception.Create('Status exception has not been authorized - unable to proceed');
        raise TIQNotAuthorizedException.Create;
    finally
      Release;
    end;
end;

end.
