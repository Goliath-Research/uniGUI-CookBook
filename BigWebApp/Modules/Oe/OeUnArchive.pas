unit OeUnArchive;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  System.Generics.Collections,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniMainMenu, IQUniGrid, uniGUIFrame, uniDateTimePicker,
  uniDBDateTimePicker;

type
  TFrmOeUnArchive = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    UnArchive1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    DbFrom: TUniDBDateTimePicker;
    DbTo: TUniDBDateTimePicker;
    btnApply: TUniButton;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnUnArchive: TUniButton;
    BtnCancel: TUniButton;
    IQSearch1: TIQUniGridControl;
    SR: TIQWebSecurityRegister;
    Src: TDataSource;
    Qry: TFDQuery;
    QryID: TBCDField;
    QryORDERNO: TStringField;
    QryPONO: TStringField;
    QryARCUSTO_ID: TBCDField;
    QryORD_DATE: TDateTimeField;
    QryUSERID: TStringField;
    QryARCUSTO_CUSTNO: TStringField;
    QryARCUSTO_COMPANY: TStringField;
    QryARCUSTO_ADDR1: TStringField;
    QryARCUSTO_ADDR2: TStringField;
    QryARCUSTO_ADDR3: TStringField;
    QryARCUSTO_CITY: TStringField;
    QryARCUSTO_STATE: TStringField;
    QryARCUSTO_COUNTRY: TStringField;
    QryARCUSTO_ZIP: TStringField;
    QryARCUSTO_PRIME_CONTACT: TStringField;
    QryTERMS_DESCRIP: TStringField;
    QrySHIP_TO_ATTN: TStringField;
    QryBILL_TO_ATTN: TStringField;
    QryFREIGHT_DESCRIP: TStringField;
    QryEPLANT_ID: TBCDField;
    QryARCHIVED_BY: TStringField;
    QryFOB: TStringField;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApplyClick(Sender: TObject);
    procedure btnUnArchiveClick(Sender: TObject);
    procedure QryBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CheckListItemsSelected;
    procedure PopulateSalesOrdersList(var ASalesOrdersList: TList<Int64>);
    procedure UnarchiveSalesOrders(ASalesOrdersList: TList<Int64>);
  public
    { Public declarations }
    class function DoShow: Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  oe_rscstr,
  IQMS.Common.Dialogs,
  IQMS.Common.PanelMsg,
  po_rscstr;

class function TFrmOeUnArchive.DoShow: Boolean;
var
  LFrmOeUnArchive : TFrmOeUnArchive;
begin
  LFrmOeUnArchive := TFrmOeUnArchive.Create(UniGUIApplication.UniApplication);
  LFrmOeUnArchive.Show;
end;

procedure TFrmOeUnArchive.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TFrmOeUnArchive.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmOeUnArchive.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmOeUnArchive.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmOeUnArchive.QryBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'start_date', DbFrom.Datetime);
  AssignQueryParamValue(DataSet, 'end_date', DbTo.Datetime);
end;

procedure TFrmOeUnArchive.btnApplyClick(Sender: TObject);
begin
  ReOpen(Qry);
{ TODO -oGPatil -cWebConvert : Tunidbgrid does not contain unselectall
  IQSearch1.DBGrid.UnselectAll;   }
  btnUnArchive.Enabled := SR.Enabled['btnUnArchive'];
end;

procedure TFrmOeUnArchive.CheckListItemsSelected;
begin
  // Note:  Do not check SelectedList.Count because it requires the user to
  // click the grid.  Visually, a record may appear to be selected.  So, the user will
  // wonder why an exception is occurring.  As long as an ID exists, we can
  // work with it.
  if QryID.AsLargeInt = 0 then
    // oe_rscstr.cTXT0000183 = 'Please select one or more Sales Orders.';
    raise Exception.Create(oe_rscstr.cTXT0000183);
end;

procedure TFrmOeUnArchive.PopulateSalesOrdersList(var ASalesOrdersList: TList<Int64>);
var
  AMsg: TPanelMesg;
  i: Integer;
begin
{ TODO -oGPatil -cWebConvert : TIQUniGridcontrol does not contain selectedlist
  // For multi-select
  if IQSearch1.wwDBGrid.SelectedList.Count > 1 then
  begin
    AMsg := hPleaseWait(po_rscstr.cTXT0000053);
    try
      with IQSearch1.wwDBGrid, IQSearch1.DBGrid.datasource.DataSet do
      begin
        DisableControls;
        for i := 0 to SelectedList.Count - 1 do
        begin
          GotoBookmark(Selected.items[i]);
          ASalesOrdersList.Add(QryID.AsLargeInt);
        end;
        EnableControls;
      end;
    finally
      AMsg.Free;
    end;
  end
  // For just one item selected
  else if QryID.AsLargeInt > 0 then
    ASalesOrdersList.Add(QryID.AsLargeInt); }
end;

procedure TFrmOeUnArchive.UnarchiveSalesOrders(ASalesOrdersList: TList<Int64>);
var
  AMsg: TPanelMesg;
  i: Integer;
begin
  AMsg := hPleaseWait(po_rscstr.cTXT0000053);
  try
    for i := 0 to ASalesOrdersList.Count - 1 do
      ExecuteCommandFmt(
        'BEGIN oe_unarchive.unarchiveoe(%d); END;',
        [ASalesOrdersList[i]]);
  finally
    AMsg.Free;
  end;
end;

procedure TFrmOeUnArchive.UniFormCreate(Sender: TObject);
begin
  DbFrom.Datetime := Date;
  DbTo.Datetime := Date;
  btnUnArchive.Enabled := false;
  Qry.Close;
end;

procedure TFrmOeUnArchive.btnUnArchiveClick(Sender: TObject);
var
  ASalesOrdersList: TList<Int64>;
begin
  CheckListItemsSelected;

  // oe_rscstr.cTXT0000132 =
  // 'Unarchive the selected Sales Orders?';
  if not IQConfirmYN(oe_rscstr.cTXT0000132) then
    System.SysUtils.Abort;

  ASalesOrdersList := TList<Int64>.Create;
  try
    PopulateSalesOrdersList(ASalesOrdersList);
    UnarchiveSalesOrders(ASalesOrdersList);
  finally
    FreeAndNil(ASalesOrdersList);
  end;

  btnApplyClick(nil);

  // po_rscstr.cTXT0000054 = 'Process Complete.';
  IQInformation(po_rscstr.cTXT0000054);
end;

end.
