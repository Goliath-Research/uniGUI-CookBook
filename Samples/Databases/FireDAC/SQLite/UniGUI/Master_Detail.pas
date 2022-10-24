unit Master_Detail;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.ToolWin,
  Vcl.DBGrids,
  FireDAC.Stan.StorageBin,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUIRegClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniDBNavigator,
  Master_DetailDM;

type
  TMaster_DetailForm = class(TUniForm)
    dbgOrders: TUniDBGrid;
    dbnOrders: TUniDBNavigator;
    pnlOrders: TUniPanel;
    Splitter1: TUniSplitter;
    pnlMasterGrid: TUniPanel;
    dbnItems: TUniDBNavigator;
    pnlItems: TUniPanel;
    pnlDetailGrid: TUniPanel;
    dbgItems: TUniDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Master_DetailForm: TMaster_DetailForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function Master_DetailForm: TMaster_DetailForm;
begin
  Result := TMaster_DetailForm(UniMainModule.GetFormInstance(TMaster_DetailForm));
end;

initialization
  RegisterAppFormClass(TMaster_DetailForm);

end.
