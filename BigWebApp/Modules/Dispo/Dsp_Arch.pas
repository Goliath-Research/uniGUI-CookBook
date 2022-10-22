unit Dsp_Arch;

interface

uses
  Winapi.Windows,
  System.Classes,
  Dsp_Prod,
  Data.DB,
  Mask,
  IQMS.WebVcl.DropDownButton,
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
  Vcl.Menus,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Trans,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  Vcl.Buttons,
  Vcl.DBGrids,
  Vcl.Forms,
  Vcl.Controls, uniMainMenu, uniSpeedButton, uniBitBtn, uniMenuButton,
  uniBasicGrid, uniDBGrid, uniDBNavigator, uniPageControl, uniCheckBox,
  uniDBCheckBox, uniGUIClasses, uniEdit, uniDBEdit, uniScrollBox, uniSplitter,
  uniButton, uniLabel, uniGUIBaseClasses, uniPanel,
  uniGUIApplication;

type
  TFrmDispoArchived = class(TFrmDispoProduction)
  private
    { Private declarations }
  public
    { Public declarations }
  end;



procedure DoViewArchivedDispo( ADataSource: TDataSource );

implementation

{$R *.DFM}

procedure DoViewArchivedDispo( ADataSource: TDataSource );
var
  FrmDispoArchived: TFrmDispoArchived;
begin
  FrmDispoArchived := TFrmDispoArchived.Create( uniGUIApplication.UniApplication );
  FrmDispoArchived.DataSource := ADataSource;
  FrmDispoArchived.Show;
end;

end.
