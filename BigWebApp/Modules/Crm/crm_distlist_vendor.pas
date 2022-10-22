unit crm_distlist_vendor;

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
  TFrmCRMDistListVendor = class(TFrmCRMDistList)
    QryMasterID: TBCDField;
    QryMasterVENDORNO: TStringField;
    QryMasterCOMPANY: TStringField;
    QryMasterDISTLIST: TStringField;
    QryDistListID: TBCDField;
    QryDistListVENDOR_ID: TBCDField;
    QryDistListNAME: TStringField;
    QryDistListEMAIL: TStringField;
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

{ TFrmCRMDistListVendor }

procedure TFrmCRMDistListVendor.InitValues;
begin
  MasterSource := 'VENDOR';
  TableName := 'VENDOR_DIST';
  ParentFieldName := 'VENDOR_ID';

  if not QryMaster.Active then
    ReOpen(QryMaster);
  SourceDisplay := Format('%s - %s',
    [Trim(QryMaster.FieldByName('VENDORNO').AsString),
    Trim(QryMaster.FieldByName('COMPANY').AsString)]);
end;

end.
