unit M_Launcher;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Buttons,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmM_Launcher = class(TUniForm)
    SpeedButton1: TUniSpeedButton;
    SpeedButton2: TUniSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.ApplicationSet,
  M_Const,
  M_Main,
  Variants;

procedure TFrmM_Launcher.SpeedButton1Click(Sender: TObject);
begin
{ TODO -omugdha -cWEBIQ :  Undeclared identifier: 'CheckDBModuleCreated'
  CheckDBModuleCreated;}                     {DB_DM}
  DoMain( M_RT_EFFICIENCY, 0, []);          {M_Main.pas}
end;

procedure TFrmM_Launcher.FormCreate(Sender: TObject);
begin
  AssignApplicationSettings(Application);   {IQMS.Common.ApplicationSet.pas}
end;

procedure TFrmM_Launcher.SpeedButton2Click(Sender: TObject);
var
  A: Variant;
begin
  A:= VarArrayOf([ 1 ]);
{ TODO -omugdha -cWEBIQ : Undeclared identifier: 'CheckDBModuleCreated'
  CheckDBModuleCreated;  }                   {DB_DM}
  DoMain( M_RT_EFFICIENCY_VIEW, 0, A );  {M_Main.pas} { 1 = turn demo on to suppres in rtserer is down mesg in RT when drilled in}
end;

end.
