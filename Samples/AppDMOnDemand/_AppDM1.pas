unit _AppDM1;

interface

uses
  SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin;

type
  TAppDM1 = class(TDataModule)
    tblList: TFDMemTable;
    tblListID: TAutoIncField;
    tblListText: TStringField;
    dsList: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AppDM1: TAppDM1;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function AppDM1: TAppDM1;
begin
  Result := TAppDM1(UniMainModule.GetModuleInstance(TAppDM1));
end;

initialization
  RegisterModuleClass(TAppDM1);

end.
