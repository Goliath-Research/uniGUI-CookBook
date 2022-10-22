unit FR_Ship;

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
  FR_OnOrd,
  Menus,
  Db,
  DBCtrls,
  ExtCtrls,
  Grids,
  DBGrids,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.Jump,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniMainMenu, uniDBNavigator, uniGUIClasses, uniPanel,
  uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniGUIApplication;

type
  TFrmFrShowShipped = class(TFrmFrShowOnOrder)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoForecastShowShipped( Args: Variant );



implementation

{$R *.DFM}

procedure DoForecastShowShipped( Args: Variant );
var
  FrmFrShowShipped: TFrmFrShowShipped;
begin
  FrmFrShowShipped := TFrmFrShowShipped.Create( uniGUIApplication.uniApplication );
  FrmFrShowShipped.rgs := Args;
  FrmFrShowShipped.ShowModal;
end;

end.
