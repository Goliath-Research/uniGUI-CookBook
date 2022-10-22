unit View_Mfg;
// OBSOLETE UNIT
interface

uses
  Winapi.Windows,
  Vcl.Forms,
  Vcl.DBCtrls,
  Data.DB,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
 // db_dm,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid,
  uniDBNavigator,
  System.Classes,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniPanel,
  uniGUIForm ,
  uniGUIApplication;

type
  TViewMfgType = class(TUniForm)
    DBGrid1: TUniDBGrid;
    DBNavigator: TUniDBNavigator;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    DataSource1: TDataSource;
    Bevel1: TUniPanel;
  private
    { private declarations }
  public
    { public declarations }
  end;

//var
//  ViewMfgType: TViewMfgType;

implementation

{$R *.DFM}

end.
