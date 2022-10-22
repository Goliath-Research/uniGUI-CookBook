unit Archiver_base;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  System.Classes,
  uniMainMenu,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmArciver_base = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmArciver_base.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.
