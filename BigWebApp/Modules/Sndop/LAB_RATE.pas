unit Lab_Rate;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
//db_dm,                    Not Found
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
  TLabRates = class(TUniForm)
    DBGrid1: TUniDBGrid;
    NavMain: TUniDBNavigator;
    Panel1: TUniPanel;
    DataSource1: TDataSource;
    Panel2: TUniPanel;
    Bevel1: TUniPanel;
  private
    { private declarations }
  public
    { public declarations }
  end;

function LabRates: TLabRates;

implementation

{$R *.DFM}

uses MainModule;

function LabRates: TLabRates;
begin
  Result := TLabRates(UniMainModule.GetFormInstance(TLabRates));
end;

end.
