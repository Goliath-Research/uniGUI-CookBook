unit crm_popup_main;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmCRMPopupMain = class(TUniForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.ApplicationSet;

procedure TFrmCRMPopupMain.FormCreate(Sender: TObject);
begin
  // Hide from task bar
  // if we are run this standalone, then skip these lines;
  // otherwise, we need to hide this form from the task bar.
  // if (ComServer.StartMode <> smStandalone) then  // ComServ.pas
  if IQMS.Common.ApplicationSet.IsDCOM then
     begin
       // This hides the application from the taskbar
       SetWindowLong(Application.Handle, GWL_EXSTYLE,
         GetWindowLong(Application.Handle, GWL_EXSTYLE)
            or WS_EX_TOOLWINDOW);
     end;
end;

end.
