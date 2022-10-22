unit std_labor_pm;

interface

uses
  Winapi.Windows,
  StdLabor,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.HPick, Vcl.Menus, uniMainMenu,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniDBNavigator, uniButton, uniBitBtn, uniSpeedButton,
  System.Classes, Vcl.Controls, Vcl.Forms, uniGUIBaseClasses, uniPanel;

type
  TFrmStdLaborHrsPM = class(TFrmStdLaborHrs)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStdLaborHrsPM: TFrmStdLaborHrsPM;

implementation

{$R *.dfm}

end.
