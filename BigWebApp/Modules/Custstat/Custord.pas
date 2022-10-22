unit CustOrd;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.Jump,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGroupBox,
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniPageControl;

type
  TFrmCustOrders = class(TUniForm)
    Panel1: TUniPanel;
    spSearchOrders: TUniSpeedButton;
    sbtnToggleView: TUniSpeedButton;
    dbNavigator1: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel2: TUniPanel;
    PC: TUniPageControl;
    TabGrid: TUniTabSheet;
    gridHeader: TUniDBGrid;
    TabForm: TUniTabSheet;
    gbOrders: TUniGroupBox;
    Splitter1: TUniSplitter;
    pnlReleases: TUniPanel;
    PnlDelDates: TUniPanel;
    Panel10: TUniPanel;
    DBNavigator3: TUniDBNavigator;
    gridReleases: TUniDBGrid;
    Splitter2: TUniSplitter;
    PnlOrders: TUniPanel;
    Panel3: TUniPanel;
    DbNavigator2: TUniDBNavigator;
    gridDetails: TUniDBGrid;
    SrcOrd: TDataSource;
    QryOrders: TFDQuery;
    SrcOrdDet: TDataSource;
    QryDet: TFDQuery;
    QryDetTotalPrice: TFloatField;
    QryDetDescription: TStringField;
    QryRel: TFDQuery;
    SrcOrdRel: TDataSource;
    QryDetID: TBCDField;
    QryDetORDERS_ID: TBCDField;
    QryDetARINVT_ID: TBCDField;
    QryDetORD_DET_SEQNO: TBCDField;
    QryDetTOTAL_QTY_ORD: TBCDField;
    QryDetCUMM_SHIPPED: TBCDField;
    QryDetONHOLD: TStringField;
    QryDetTAX_CODE_ID: TBCDField;
    QryDetMISC_ITEM: TStringField;
    QryDetUNIT_PRICE: TFMTBCDField;
    QryDetSALESPEOPLE_ID: TBCDField;
    QryDetCOMM_PCT: TBCDField;
    QryDetPRICE_PER_1000: TFMTBCDField;
    QryOrdersID: TBCDField;
    QryOrdersPONO: TStringField;
    QryOrdersARCUSTO_ID: TBCDField;
    QryOrdersORD_DATE: TDateTimeField;
    QryOrdersORD_BY: TStringField;
    QryOrdersDATE_TAKEN: TDateTimeField;
    QryOrdersBILL_TO_ID: TBCDField;
    QryOrdersSHIP_TO_ID: TBCDField;
    QryOrdersCUSER1: TStringField;
    QryOrdersCUSER2: TStringField;
    QryOrdersCUSER3: TStringField;
    QryOrdersCUSER5: TStringField;
    QryOrdersCUSER6: TStringField;
    QryOrdersTIMESTAMP: TDateTimeField;
    QryOrdersFOB: TStringField;
    QryOrdersCHANGEUSER_ID: TStringField;
    QryOrdersTERMS_ID: TBCDField;
    QryOrdersFREIGHT_ID: TBCDField;
    QryOrdersFREE_FORM: TStringField;
    QryRelORD_DETAIL_ID: TBCDField;
    QryRelREQUEST_DATE: TDateTimeField;
    QryRelSEQ: TBCDField;
    QryRelPROMISE_DATE: TDateTimeField;
    QryRelQUAN: TBCDField;
    QryRelFORECAST: TStringField;
    QryRelSHIP_DATE: TDateTimeField;
    QryRelCUSER1: TStringField;
    QryRelUNIT_PRICE: TFMTBCDField;
    PkOrder: TIQWebHPick;
    PkOrderID: TBCDField;
    PkOrderPONO: TStringField;
    PkOrderORD_DATE: TDateTimeField;
    PkOrderORD_BY: TStringField;
    PkOrderFOB: TStringField;
    IQJumpOrd: TIQWebJump;
    PopupMenu1: TUniPopupMenu;
    JumpToSalesOrder1: TUniMenuItem;
    Options1: TUniMenuItem;
    StayonTop1: TUniMenuItem;
    QryOrdersUSERID: TStringField;
    PkOrderUSERID: TStringField;
    QryDetCOMMENT1: TStringField;
    ShowNote1: TUniMenuItem;
    pnlComment: TUniPanel;
    Label3: TUniLabel;
    DBMemo1: TUniDBMemo;
    splitComment: TUniSplitter;
    Contents1: TUniMenuItem;
    QryOrdersORDERNO: TStringField;
    PkOrderORDERNO: TStringField;
    QryDetITEMNO: TStringField;
    QryDetDESCRIP: TStringField;
    QryDetSALESPERSON: TStringField;
    QryOrdersCUSER4: TStringField;
    QryOrdersTERMS: TStringField;
    QryOrdersCUSTOMER: TStringField;
    QryOrdersCUSTNO: TStringField;
    QryOrdersBILLTO: TStringField;
    QryOrdersSHIPTO: TStringField;
    QryOrdersFREIGHT: TStringField;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Panel7: TUniPanel;
    Splitter3: TUniSplitter;
    Label2: TUniLabel;
    Label18: TUniLabel;
    Label26: TUniLabel;
    Panel16: TUniPanel;
    dbeOrderNo: TUniDBEdit;
    dbeOrdBy: TUniDBEdit;
    editDate_Taken: TUniDBEdit;
    Splitter4: TUniSplitter;
    Panel8: TUniPanel;
    Splitter5: TUniSplitter;
    Panel9: TUniPanel;
    Splitter6: TUniSplitter;
    Panel11: TUniPanel;
    Label19: TUniLabel;
    Label1: TUniLabel;
    Label4: TUniLabel;
    Panel15: TUniPanel;
    dbePO: TUniDBEdit;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    Panel12: TUniPanel;
    Splitter7: TUniSplitter;
    Panel13: TUniPanel;
    Label17: TUniLabel;
    Label9: TUniLabel;
    Label6: TUniLabel;
    Panel14: TUniPanel;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbtnToggleViewClick(Sender: TObject);
    procedure PkOrderBeforeOpen(DataSet: TDataSet);
    procedure spSearchOrdersClick(Sender: TObject);
    procedure QryDetCalcFields(DataSet: TDataSet);
    procedure SrcOrdDataChange(Sender: TObject; Field: TField);
    procedure JumpToSalesOrder1Click(Sender: TObject);
    procedure StayonTop1Click(Sender: TObject);
    procedure ShowNote1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FDataSource:TDataSource;
    procedure ChangeCursor;
    procedure SetCommentVisible;
    procedure SetDataSource(const Value: TDataSource);

  public
    property DataSource : TDataSource write SetDataSource;
  end;

procedure DoCustOrd(ADataSource:TDataSource);

implementation

{$R *.DFM}

uses
  { TODO -oathite -cWebConvert : Depends on CStat
  CStat, }
  custstat_rscstr,
  IQMS.Common.Cursor,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.HelpHook;


procedure DoCustOrd(ADataSource:TDataSource);
var
  frm : TFrmCustOrders;
begin
  frm :=  TFrmCustOrders.Create(UniApplication);
  frm.DataSource := ADataSource;
  frm.Show;
end;

procedure TFrmCustOrders.ChangeCursor;
var
  i:Integer;
begin
  with gbOrders do
    for i := 0 to ControlCount - 1 do
      if Controls[i] is TUniDBEdit
        then Controls[i].Cursor := crJump;
  gridHeader.Cursor := crJump;
end;


procedure TFrmCustOrders.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 6260 )
end;

procedure TFrmCustOrders.Exit1Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmCustOrders.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmCustOrders.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmAR{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCustOrders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  { TODO -oathite -cWebConvert : Depends on CStat
  TFrmCustStat(Owner).FCustOrd := nil; }
  IQRegFormWrite( self, [ self, gridHeader, Panel2, gridDetails, gridReleases, pnlReleases, Panel7, Panel11, Panel13, Panel5, Panel9]);
  Action := caFree;
end;

procedure TFrmCustOrders.FormCreate(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on CStat
  TFrmCustStat(AOwner).FCustOrd := self; }
  ChangeCursor;
  PC.ActivePage := TabGrid;
  IQSetTablesActive( TRUE, self );
  SetCommentVisible;

  IQRegFormRead( self, [ self, gridHeader, Panel2, gridDetails, gridReleases, pnlReleases, Panel7, Panel11, Panel13, Panel5, Panel9]);
end;

procedure TFrmCustOrders.sbtnToggleViewClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    gridHeader.DataSource:= NIL;
    PC.ActivePage := TabForm;
  end
  else
  begin
    gridHeader.DataSource  := SrcOrd;
    PC.ActivePage := TabGrid;
  end;
end;

procedure TFrmCustOrders.PkOrderBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'nId', QryOrders.FieldByName('ARCUSTO_ID').asFloat);
//  TFDQuery(DataSet).ParamByName('nId').Value := QryOrders.FieldByName('ARCUSTO_ID').asFloat;
end;

procedure TFrmCustOrders.spSearchOrdersClick(Sender: TObject);
begin
  with  PkOrder do
    if Execute then
    begin
      QryOrders.Locate('ID', GetValue('ID'), []);
    end;
end;

procedure TFrmCustOrders.QryDetCalcFields(DataSet: TDataSet);
begin
  with QryDet do
  begin
    FieldByName('TotalPrice').asFloat :=  FieldByName('TOTAL_QTY_ORD').asFloat * FieldByName('UNIT_PRICE').asFloat;
    if FieldByName('DESCRIP').asString = '' then
      FieldByName('DESCRIPTION').asString :=  FieldByName('MISC_ITEM').asString
    else  FieldByName('DESCRIPTION').asString := FieldByName('DESCRIP').asString;
  end;
end;

procedure TFrmCustOrders.SrcOrdDataChange(Sender: TObject; Field: TField);
begin
  Caption := Format(custstat_rscstr.cTXT0000004, // 'Orders for %s'
   [QryOrders.FieldByName('customer').asString]);
  if Nz( QryOrdersID.AsFloat, 0 ) > 0 then
     // The resource string is trimmed below, so we pad it when we display it.
     gbOrders.Caption := Format( ' ' + custstat_rscstr.cTXT0000005 {Order # %s} + ' ',
      [QryOrdersORDERNO.AsString])
  else
     gbOrders.Caption := ' ' + custstat_rscstr.cTXT0000006 {Orders} + ' ';
end;

procedure TFrmCustOrders.JumpToSalesOrder1Click(Sender: TObject);
begin
  StayOnTop1.Checked := False;
  FormStyle := fsNormal;
  IQJumpOrd.Execute;
end;

procedure TFrmCustOrders.StayonTop1Click(Sender: TObject);
begin
  StayOnTop1.Checked := not StayOnTop1.Checked;
  if StayOnTop1.Checked
  then FormStyle := fsStayOnTop
  else FormStyle := fsNormal;
end;

procedure TFrmCustOrders.ShowNote1Click(Sender: TObject);
begin
  ShowNote1.Checked:= not ShowNote1.Checked;
  SetCommentVisible;
end;

procedure TFrmCustOrders.SetCommentVisible;
begin
  pnlComment.Visible  := ShowNote1.Checked;
  splitComment.Visible:= pnlComment.Visible;
  if pnlComment.Visible then
  begin
    splitComment.Top:= pnlComment.Top - 5;  {make sure splitter above the panel}
    splitComment.Top:= pnlReleases.Top+pnlReleases.Height+5;
  end;
end;

procedure TFrmCustOrders.SetDataSource(const Value: TDataSource);
begin
  QryOrders.DataSource := Value;
  FDataSource := Value;
end;

end.
