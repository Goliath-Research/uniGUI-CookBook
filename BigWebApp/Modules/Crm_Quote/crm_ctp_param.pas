unit crm_ctp_param;

interface

uses
  Winapi.Windows,
  CTP_Param,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniEdit, uniDBEdit, uniButton, uniLabel, System.Classes,
  Vcl.Controls, Vcl.Forms, uniPanel;

type
  TFrmCRM_CTP_Params = class(TFrmCTP_Params)
    dbchkIncludeShipTime: TUniDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  FrmCRM_CTP_Params: TFrmCRM_CTP_Params;}

implementation

{$R *.dfm}

end.
