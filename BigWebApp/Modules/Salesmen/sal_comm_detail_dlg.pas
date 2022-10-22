unit sal_comm_detail_dlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  IQMS.WebVcl.CaptionPanel,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmSalesCommDetailDlg = class(TUniForm)
    cpMain: TIQWebCaptionPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    Panel1: TUniPanel;
    Grid: TIQUniGridControl;
    SrcCommissionsDetail: TDataSource;
    QryCommissionsDetail: TFDQuery;
    QryCommissionsDetailID: TBCDField;
    QryCommissionsDetailCOMMISSIONS_ID: TBCDField;
    QryCommissionsDetailSALESPEOPLE_ID: TBCDField;
    QryCommissionsDetailCOMMISSION_PERCENT: TFMTBCDField;
    QryCommissionsDetailSALES_CODE: TStringField;
    QryCommissionsDetailFIRST_NAME: TStringField;
    QryCommissionsDetailLAST_NAME: TStringField;
    QryCommissionsDetailRATIO: TBCDField;
    FDUpdateSQL1: TFDUpdateSQL;
    procedure QryCommissionsDetailBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure QryCommissionsDetailAfterOpen(DataSet: TDataSet);
    { TODO : TGridDrawState not converted yet }
    {procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);}
    procedure QryCommissionsDetailNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FCommissionsID: Int64;
    procedure SetCommissionsID(const Value: Int64);
  public
    { Public declarations }
    class procedure DoShowModal(ACommissionsID: Int64);
    property CommissionsID: Int64 write SetCommissionsID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

class procedure TFrmSalesCommDetailDlg.DoShowModal(ACommissionsID: Int64);
var
  LFrmSalesCommDetailDlg : TFrmSalesCommDetailDlg;
begin
  LFrmSalesCommDetailDlg := TFrmSalesCommDetailDlg.Create(UniGUIApplication.UniApplication);
  with LFrmSalesCommDetailDlg do
  begin
    CommissionsID := ACommissionsID;
    ShowModal;
  end;
end;

procedure TFrmSalesCommDetailDlg.FormShow(Sender: TObject);
begin
  ReOpen(QryCommissionsDetail);
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, Grid]);
end;

procedure TFrmSalesCommDetailDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, Grid]);
end;

procedure TFrmSalesCommDetailDlg.QryCommissionsDetailAfterOpen(
  DataSet: TDataSet);
begin
  QryCommissionsDetailFIRST_NAME.ReadOnly := True;
  QryCommissionsDetailLAST_NAME.ReadOnly := True;
  QryCommissionsDetailRATIO.ReadOnly := True;
  QryCommissionsDetailSALES_CODE.ReadOnly := True;
end;

procedure TFrmSalesCommDetailDlg.QryCommissionsDetailBeforeOpen(
  DataSet: TDataSet);
begin
  QryCommissionsDetail.ParamByName('ID').Value := FCommissionsID;
end;

procedure TFrmSalesCommDetailDlg.QryCommissionsDetailNewRecord(
  DataSet: TDataSet);
begin
  System.SysUtils.Abort;
end;

procedure TFrmSalesCommDetailDlg.SetCommissionsID(const Value: Int64);
begin
  FCommissionsID := Value;
end;

{ TODO : TGridDrawState not converted yet }
{procedure TFrmSalesCommDetailDlg.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not Highlight and
    Field.ReadOnly then
    ABrush.Color := clBtnFace;
end;              }

end.
