unit crm_distlist_customer;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  crm_distlist,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
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
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet,
  IQMS.WebVcl.CaptionPanel,
  IQMS.WebVcl.Search,
  Vcl.Controls,
  System.Classes, uniMainMenu, uniEdit, IQUniGrid, Vcl.Forms, uniGUIFrame,
  uniGUIClasses, uniCheckBox, uniDBNavigator, uniGUIBaseClasses, uniPanel;

type
  TFrmCRMDistListCustomer = class(TFrmCRMDistList)
    QryMasterCUSTNO: TStringField;
    QryMasterCOMPANY: TStringField;
    QryMasterDISTLIST: TStringField;
    QryDistListID: TBCDField;
    QryDistListARCUSTO_ID: TBCDField;
    QryDistListNAME: TStringField;
    QryDistListEMAIL: TStringField;
    QryMasterID: TBCDField;
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure InitValues; override;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

{ TFrmCRMDistListCustomer }

procedure TFrmCRMDistListCustomer.InitValues;
begin
  MasterSource := 'ARCUSTO';
  TableName := 'ARCUSTO_DIST';
  ParentFieldName := 'ARCUSTO_ID';

  if not QryMaster.Active then ReOpen(QryMaster);
  SourceDisplay := Format('%s - %s',
   [Trim(QryMaster.FieldByName('CUSTNO').AsString),
    Trim(QryMaster.FieldByName('COMPANY').AsString)]);

end;

end.
