unit crm_soconfig_options;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  crmlist,
  Data.DB,
  FireDAC.Comp.DataSet,
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
  IQMS.WebVcl.Search,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, IQUniGrid, Vcl.Forms, uniGUIFrame, uniDBNavigator, uniPanel,
  uniGUIApplication;

type
  { TFrmSalesConfigOptions }
  TFrmSalesConfigOptions = class(TFrmCRMList)
    SrcSalesOption: TDataSource;
    QrySalesOption: TFDQuery;
    QrySalesOptionDESCRIP: TStringField;
    QrySalesOptionID: TBCDField;
    QrySalesOptionAttributes: TIntegerField;
    wwDBComboDlgAttributes: TUniEdit;
    QrySalesOptionKIND: TStringField;
    cmbGridKind: TUniDBComboBox;
    FDUpdateSQL1: TFDUpdateSQL;
    procedure QrySalesOptionNewRecord(DataSet: TDataSet);
    procedure QrySalesOptionCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgAttributesCustomDlg(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
  end;

procedure DoSalesConfigOptions();



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  crm_soconfig_option_attributes;

procedure DoSalesConfigOptions();
var
  FrmSalesConfigOptions: TFrmSalesConfigOptions;
begin
  FrmSalesConfigOptions := TFrmSalesConfigOptions.Create(uniGUIApplication.UniApplication);
  FrmSalesConfigOptions.Show;
end;

procedure TFrmSalesConfigOptions.FormCreate(Sender: TObject);
begin
  inherited;
  { TODO -oSanketG -cWebConvert : Need to find alternative for ControlType in TIQUniGridControl}
  {Grid.ControlType.Clear;
  Grid.ControlType.Add('Attributes;CustomEdit;wwDBComboDlgAttributes;F');
  Grid.ControlType.Add('KIND;CustomEdit;cmbGridKind;F');}
  wwDBComboDlgAttributes.Visible := False;
  cmbGridKind.Visible := False;
end;

procedure TFrmSalesConfigOptions.QrySalesOptionCalcFields(DataSet: TDataSet);
var
  ACount: Integer;
begin
  inherited;

  ACount:= Trunc(SelectValueFmtAsFloat('select count(*) from sales_option_attribute where sales_option_id = %d', [ QrySalesOptionID.asInteger ]));
  if ACount <> 0 then
     QrySalesOptionAttributes.asInteger:= ACount;
end;

procedure TFrmSalesConfigOptions.QrySalesOptionNewRecord(DataSet: TDataSet);
begin
  AssignID(QrySalesOption, 'sales_option');
end;

procedure TFrmSalesConfigOptions.wwDBComboDlgAttributesCustomDlg(
  Sender: TObject);
begin
  inherited;
  if (QrySalesOption.State in [dsInsert]) then
    QrySalesOption.Post;
  if not (QrySalesOption.State in [dsEdit]) then
    QrySalesOption.Edit;
  TFrmSalesConfigOptionAttributes.DoShowModal(QrySalesOptionID.asInteger );   // crm_soconfig_option_attributes.pas
  QrySalesOption.Refresh;
end;

end.
