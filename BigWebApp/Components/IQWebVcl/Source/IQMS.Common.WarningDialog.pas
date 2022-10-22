unit IQMS.Common.WarningDialog;

interface

uses
  IQMS.Common.ErrorDialog,uniGUIApplication,
  Vcl.Imaging.pngimage, uniGUIClasses, uniMemo, uniImage, uniButton, uniBitBtn,
  uniSpeedButton, System.Classes, Vcl.Controls, Vcl.Forms, uniGUIBaseClasses,
  uniPanel;

type
  TFrmStringWarning = class(TFrmStringError)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowIQWarningMessageA(AHeader, AError, ADetail: string);
  
implementation

{$R *.dfm}

procedure ShowIQWarningMessageA(AHeader, AError, ADetail: string);
var
  FrmStringError: TFrmStringError;
begin
  // Just show the warning.  The calling application handles program execution (abort, etc.).
  FrmStringError:= TFrmStringError.Create(uniGUIApplication.UniApplication);
    with FrmStringError do
     begin
       xCreate(AHeader, AError, ADetail);
       Show;
     end;
end;


end.
