unit disposvr_launch;

interface

uses
  Vcl.Forms,
  Vcl.Buttons,
  System.Classes,
  Vcl.Controls,
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
  TFrmDispoSvrLauncher = class(TUniForm)
    sbtnDispositionServer: TUniSpeedButton;
    procedure sbtnDispositionServerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  ComServ,
  MainModule,
  IQMS.Common.Miscellaneous;
//  disposvr_main,
//  db_dm;

procedure TFrmDispoSvrLauncher.sbtnDispositionServerClick(Sender: TObject);
begin
//  DB_DM.CheckDBModuleCreated;
//  DoDispoServer(Self, IQGetLocalHomePath + 'SERIAL_BAY\');
end;

end.
