unit crm_support_resolution_type;

interface

uses
  Winapi.Windows,
  System.Classes,
  crmlist,
  Data.DB,
  uniGUIApplication,
  FireDAC.Comp.Client,
  FireDAC.UI.Intf,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  IQMS.WebVcl.Search,
  Vcl.Controls, IQUniGrid, Vcl.Forms, uniGUIFrame, uniDBNavigator,
  uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  { TFrmCRMSupportResolutionType }
  TFrmCRMSupportResolutionType = class(TFrmCRMList)
    SrcData: TDataSource;
    QryData: TFDQuery;
    FDUpdateSQL1: TFDUpdateSQL;
    QryDataID: TBCDField;
    QryDataNAME: TStringField;
    QryDataDESCRIPTION: TStringField;
    procedure QryDataNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs;

class procedure TFrmCRMSupportResolutionType.DoShow;
begin
  TFrmCRMSupportResolutionType.Create(uniGUIApplication.UniApplication).Show;
end;

procedure TFrmCRMSupportResolutionType.QryDataNewRecord(DataSet: TDataSet);
begin
  QryDataID.AsLargeInt := GetNextID('CRM_ACTIVITY_RESOLUTION');
end;

end.
