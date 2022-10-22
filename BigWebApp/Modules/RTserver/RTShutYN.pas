unit RTShutYN;

interface

uses
  System.SysUtils,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniTimer,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniCheckBox,
  uniButton, System.Classes, Vcl.Controls;

type
  TRTShutDownConfirm = class(TUniForm)
    Timer1: TUniTimer;
    Label1: TUniLabel;
    lblTimeLeft: TUniLabel;
    btnShutDown: TUniButton;
    btnCancel: TUniButton;
    Label2: TUniLabel;
    Label3: TUniLabel;
    chkKeepMonitor: TUniCheckBox;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}
uses
 MainModule,
  IQMS.Common.RegFrm;

procedure TRTShutDownConfirm.Timer1Timer(Sender: TObject);
var
  n:Integer;
begin
  n:= StrToInt( lblTimeLeft.Caption ) - 1;
  lblTimeLeft.Caption:= IntToStr( n );
  if n = 0 then
     Close;
end;

procedure TRTShutDownConfirm.UniFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegBooleanScalarWrite( self, 'KeepMonitor', chkKeepMonitor.Checked );
end;

procedure TRTShutDownConfirm.FormCreate(Sender: TObject);
var
  AFlag: Boolean;
begin
  AFlag:= FALSE;
  IQRegBooleanScalarRead( self, 'KeepMonitor', AFlag );
  chkKeepMonitor.Checked:= AFlag;
end;

end.

