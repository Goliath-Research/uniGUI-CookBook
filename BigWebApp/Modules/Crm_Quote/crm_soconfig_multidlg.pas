unit crm_soconfig_multidlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
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
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniComboBox,
  uniDBComboBox;

type
  TFrmSOConfigMultiDlg = class(TUniForm)
    PnlClient01: TUniPanel;
    PnlBottom: TUniPanel;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    Label2: TUniLabel;
    QrySalesOption: TFDQuery;
    QrySalesOptionID: TBCDField;
    QrySalesOptionDESCRIP: TStringField;
    QrySalesOptionChoice: TFDQuery;
    QrySalesOptionChoiceDESCRIP: TStringField;
    QrySalesOptionChoicePRICE: TFMTBCDField;
    QrySalesOptionChoiceID: TBCDField;
    QrySalesOptionChoiceSALES_CONFIG_OPTION_ID: TBCDField;
    cmbGridSalesOption: TUniDBLookupComboBox;
    cmbGridSalesChoice: TUniDBLookupComboBox;
    Label3: TUniLabel;
    cmbGridOperator: TUniDBComboBox;
    Panel1: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    SrcSalesOption: TDataSource;
    SrcSalesOptionChoice: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QrySalesOptionChoiceBeforeOpen(DataSet: TDataSet);
    procedure QrySalesOptionBeforeOpen(DataSet: TDataSet);
    procedure cmbGridSalesOptionDropDown(Sender: TObject);
    procedure cmbGridSalesChoiceDropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSalesConfigID: Real;
    procedure SetSalesConfigID(const Value: Real);
  public
    { Public declarations }
    property SalesConfigID: Real write SetSalesConfigID;
  end;

  function DoSoConfigMultiDlg(ASalesConfigID: Real;
   var AOptionID, AChoiceID: Real; var AOperator: String): Boolean;



implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib;

function DoSoConfigMultiDlg(ASalesConfigID: Real;
   var AOptionID, AChoiceID: Real; var AOperator: String): Boolean;
var
  FrmSOConfigMultiDlg: TFrmSOConfigMultiDlg;
begin
  if ASalesConfigID = 0 then Exit;
  FrmSOConfigMultiDlg := TFrmSOConfigMultiDlg.Create(uniGUIApplication.UniApplication);
  with FrmSOConfigMultiDlg do
  begin
    try
       FSalesConfigID := ASalesConfigID;
       Result := ShowModal = mrOk;
       if Result then
          begin
            AOptionID := QrySalesOptionID.AsFloat;
            AChoiceID := QrySalesOptionChoiceID.AsFloat;
            { TODO -oSanketG -cWebConvert : Need to find alternative for Value in TUniDBComboBox}
            //AOperator := cmbGridOperator.Value;
          end;
    finally
      //Free;
    end;
  end;
end;

procedure TFrmSOConfigMultiDlg.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, PnlLeft01]);
  ReOpen(QrySalesOption);
  ReOpen(QrySalesOptionChoice);
end;

procedure TFrmSOConfigMultiDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, PnlLeft01]);
end;

procedure TFrmSOConfigMultiDlg.QrySalesOptionBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FSalesConfigID);
end;

procedure TFrmSOConfigMultiDlg.QrySalesOptionChoiceBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'SALES_OPTION_ID', QrySalesOptionID.AsLargeInt);
end;

procedure TFrmSOConfigMultiDlg.SetSalesConfigID(const Value: Real);
begin
  FSalesConfigID := Value;
end;

procedure TFrmSOConfigMultiDlg.cmbGridSalesOptionDropDown(Sender: TObject);
begin
  ReOpen(QrySalesOption);
end;

procedure TFrmSOConfigMultiDlg.cmbGridSalesChoiceDropDown(Sender: TObject);
begin
  ReOpen(QrySalesOptionChoice);
end;

end.
