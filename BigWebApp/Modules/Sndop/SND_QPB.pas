unit Snd_QPB;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
//db_dm,             ***Not Found
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, System.Classes, Vcl.Controls;

type
  TSndQPB = class(TUniForm)
    DBGrid1: TUniDBGrid;
    NavMain: TUniDBNavigator;
    PnlToolbar: TUniPanel;
    DataSource1: TDataSource;
    Panel2: TUniPanel;
    Bevel1: TUniPanel;
  private
    { private declarations }
  public
    { public declarations }
  end;

function SndQPB: TSndQPB;

//var
//  SndQPB: TSndQPB;    ** delete

implementation

{$R *.DFM}

uses MainModule;

//Snd_DM;     **not found

function SndQPB: TSndQPB;
begin
  Result := TSndQPB(UniMainModule.GetFormInstance(TSndQPB));
end;

end.
