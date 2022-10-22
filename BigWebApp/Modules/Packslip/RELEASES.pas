unit Releases;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  Vcl.DBGrids,
  MainModule,
  Data.DB,
  System.Classes,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmReleases = class(TUniForm)
    GridReleases: TUniDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReleases: TFrmReleases;

implementation

{$R *.DFM}

//uses
 // NewPS;

procedure TFrmReleases.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
 // TFrmPackSlip(Owner).Releases1.Checked := False;
end;

end.
