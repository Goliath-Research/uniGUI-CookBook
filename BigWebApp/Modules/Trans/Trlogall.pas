unit Trlogall;

interface

uses
  Winapi.Windows,
  TransLog,
  Data.DB,
  Mask,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.HPick, IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister, Vcl.Menus, uniMainMenu, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniStatusBar, uniGUIClasses, uniEdit, uniDBNavigator,
  uniButton, uniBitBtn, uniSpeedButton, uniLabel, IQMS.WebVcl.UserDefinedLabel,
  IQUniGrid, Vcl.Forms, uniGUIFrame, System.Classes, Vcl.Controls,
  uniGUIBaseClasses, uniPanel;

type
  TFrmTransLogItems = class(TFrmTransLog)
    procedure QryTransLogBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

procedure TFrmTransLogItems.QryTransLogBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  //
end;

end.

