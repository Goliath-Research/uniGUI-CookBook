unit RMAVArch;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Mask,
  IQMS.WebVcl.DropDownButton,
  Vcl.Buttons,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmViewArchivedRMA = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Search1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Panel1: TUniPanel;
    SBToggleRma: TUniSpeedButton;
    SBSearch: TIQWebDropDownButton;
    Panel6: TUniPanel;
    PCRma: TUniPageControl;
    TabGrid: TUniTabSheet;
    GridRma: TIQUniGridControl;
    TabForm: TUniTabSheet;
    Splitter2: TUniSplitter;
    Panel2: TUniPanel;
    Panel4: TUniPanel;
    SBToggleDtl: TUniSpeedButton;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Panel5: TUniPanel;
    SBToggleRec: TUniSpeedButton;
    Srcheader: TDataSource;
    QryHeader: TFDQuery;
    QryHeaderID: TBCDField;
    QryHeaderARCUSTO_ID: TBCDField;
    QryHeaderRMA_DATE: TDateTimeField;
    QryHeaderUSERID: TStringField;
    QryHeaderNOTES: TStringField;
    QryHeaderEPLANT_ID: TBCDField;
    QryHeaderRMA_SUFFIX: TStringField;
    QryHeaderAPPROVED_BY: TStringField;
    QryHeaderRMA_ID: TBCDField;
    QryHeaderARCHIVED_BY: TStringField;
    QryHeaderARCUSTO_COMPANY: TStringField;
    QryHeaderARCUSTO_ADDR1: TStringField;
    QryHeaderARCUSTO_ADDR2: TStringField;
    QryHeaderARCUSTO_ADDR3: TStringField;
    QryHeaderARCUSTO_CITY: TStringField;
    QryHeaderARCUSTO_STATE: TStringField;
    QryHeaderARCUSTO_COUNTRY: TStringField;
    QryHeaderARCUSTO_ZIP: TStringField;
    QryHeaderTO_INVOICE: TStringField;
    QryHeaderARCUSTO_CUSTNO: TStringField;
    Srcdtl: TDataSource;
    QryDtl: TFDQuery;
    QryDtlID: TBCDField;
    QryDtlRMA_HIST_ID: TBCDField;
    QryDtlRMA_DETAIL_ID: TBCDField;
    QryDtlARINVT_ID: TBCDField;
    QryDtlARINVT_CLASS: TStringField;
    QryDtlARINVT_ITEMNO: TStringField;
    QryDtlARINVT_REV: TStringField;
    QryDtlARINVT_DESCRIP: TStringField;
    QryDtlARINVT_DESCRIP2: TStringField;
    QryDtlSHIPMENT_DTL_ID: TBCDField;
    QryDtlQTYRETURNED: TFMTBCDField;
    QryDtlRETURN_CODE_ID: TBCDField;
    QryDtlRETURN_CODE_CODE: TStringField;
    QryDtlRETURN_CODE_DESCRIPTION: TStringField;
    QryDtlRETURN_CODE_CODE_TYPE: TStringField;
    QryDtlMISC_ITEM: TStringField;
    QryDtlUNIT: TStringField;
    QryDtlDESCRIPTION: TStringField;
    QryDtlQTY_RECEIVED: TFMTBCDField;
    SrcRec: TDataSource;
    QryRec: TFDQuery;
    QryRecID: TBCDField;
    QryRecRMA_DETAIL_HIST_ID: TBCDField;
    QryRecRMA_RECEIPTS_ID: TBCDField;
    QryRecQTY_RECEIVED: TFMTBCDField;
    QryRecDATE_RECEIVED: TDateTimeField;
    QryRecUSERID: TStringField;
    QryRecSHIPMENT_DTL_ID: TBCDField;
    QryRecREJECT_CODE: TStringField;
    QryRecDISPOSITION_TYPE: TStringField;
    IQAbout1: TIQWebAbout;
    PopupMenu1: TUniPopupMenu;
    StandardSearch1: TUniMenuItem;
    ExpandedSearch1: TUniMenuItem;
    PKSearchEx: TIQWebHPick;
    PKSearchExID: TBCDField;
    PKSearchExRMA_DATE: TDateTimeField;
    PKSearchExCOMPANY: TStringField;
    PKSearchExCUSTNO: TStringField;
    PKSearchExEPLANT_ID: TBCDField;
    PKSearchExARINVT_ID: TBCDField;
    PKSearchExSHIPMENT_DTL_ID: TBCDField;
    PKSearchExITEMNO: TStringField;
    PKSearchExRMA_DETAIL_ID: TBCDField;
    PKSearch: TIQWebHPick;
    PKSearchID: TBCDField;
    PKSearchRMA_DATE: TDateTimeField;
    PKSearchCOMPANY: TStringField;
    PKSearchCUSTNO: TStringField;
    PKSearchEPLANT_ID: TBCDField;
    Contents1: TUniMenuItem;
    QryHeaderRMANO: TStringField;
    PKSearchRMANO: TStringField;
    PKSearchExRMANO: TStringField;
    QryDtlCUSER1: TStringField;
    QryDtlCUSER2: TStringField;
    QryDtlCUSER3: TStringField;
    QryDtlMISC_REASON: TStringField;
    PopupMenu2: TUniPopupMenu;
    OrderInformation1: TUniMenuItem;
    QryDtlSO_UPDATED: TStringField;
    PnlHeader: TUniPanel;
    PnlHeaderLeft03: TUniPanel;
    Splitter4: TUniSplitter;
    PnlHeaderLeft01: TUniPanel;
    PnlHeaderClient01: TUniPanel;
    Splitter5: TUniSplitter;
    PnlHeaderClient03: TUniPanel;
    Splitter6: TUniSplitter;
    PnlHeaderLeft02: TUniPanel;
    PnlHeaderClient02: TUniPanel;
    Label1: TUniLabel;
    Label3: TUniLabel;
    Label16: TUniLabel;
    DBRma: TUniDBEdit;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    Label2: TUniLabel;
    Label5: TUniLabel;
    Label17: TUniLabel;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    PnlDetailPcCarrier: TUniPanel;
    PnlCheckPCCarrier: TUniPanel;
    PCDtl: TUniPageControl;
    TabDtlForm: TUniTabSheet;
    pcDetail: TUniPageControl;
    TabGeneral: TUniTabSheet;
    Splitter3: TUniSplitter;
    Panel7: TUniPanel;
    Splitter8: TUniSplitter;
    PnlDetailGeneralClient02: TUniPanel;
    DBEdit7: TUniDBEdit;
    DBEdit8: TUniDBEdit;
    edUom: TUniDBEdit;
    EditReturned: TUniDBEdit;
    PnlDetailGeneralLeft02: TUniPanel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label13: TUniLabel;
    PnlDetailGeneralLeft03: TUniPanel;
    Splitter7: TUniSplitter;
    PnlDetailGeneralLeft01: TUniPanel;
    Label4: TUniLabel;
    Label6: TUniLabel;
    Label15: TUniLabel;
    PnlDetailGeneralClient01: TUniPanel;
    DBItemNo: TUniDBEdit;
    DBDescrip: TUniDBEdit;
    dbRev: TUniDBEdit;
    TabReason: TUniTabSheet;
    DBMemo1: TUniDBMemo;
    TabUser: TUniTabSheet;
    PnlUD: TUniPanel;
    Splitter9: TUniSplitter;
    PnlUDLeft: TUniPanel;
    Label14: TUniLabel;
    Label18: TUniLabel;
    Label19: TUniLabel;
    PnlUDClient: TUniPanel;
    DBEdit12: TUniDBEdit;
    DBEdit13: TUniDBEdit;
    DBEdit14: TUniDBEdit;
    TabDtlGrid: TUniTabSheet;
    GridDtl: TIQUniGridControl;
    PCRec: TUniPageControl;
    TabRecForm: TUniTabSheet;
    PnlCheck: TUniPanel;
    Splitter11: TUniSplitter;
    PnlCheckLeft03: TUniPanel;
    Splitter10: TUniSplitter;
    PnlCheckLeft01: TUniPanel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    PnlCheckClient01: TUniPanel;
    DBEdit10: TUniDBEdit;
    DBEdit11: TUniDBEdit;
    PnlCheckClient03: TUniPanel;
    Splitter12: TUniSplitter;
    PnlCheckLeft02: TUniPanel;
    Label12: TUniLabel;
    lblRejCode: TUniLabel;
    PnlCheckClient02: TUniPanel;
    EditDispType: TUniDBEdit;
    DBEdit9: TUniDBEdit;
    TabRecGrid: TUniTabSheet;
    GridRec: TIQUniGridControl;
    DBEdit6: TUniDBEdit;
    Label9: TUniLabel;
    Label20: TUniLabel;
    QryRecCOMMENT1: TStringField;
    DBEdit15: TUniDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure QryHeaderBeforeOpen(DataSet: TDataSet);
    procedure SBSearchClick(Sender: TObject);
    procedure PKSearchBeforeOpen(DataSet: TDataSet);
    procedure ExpandedSearch1Click(Sender: TObject);
    procedure SBToggleRmaClick(Sender: TObject);
    procedure SBToggleDtlClick(Sender: TObject);
    procedure SBToggleRecClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure OrderInformation1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    FID: Real;
    procedure SetID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property Id: Real write SetID;
  end;

procedure ViewArcivedRMAs(AId:Real = 0);

implementation

uses
  IQMS.Common.Boolean,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.infobox,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  rma_rscstr;


{$R *.DFM}

procedure ViewArcivedRMAs(AId:Real = 0);
var
  LFrm: TFrmViewArchivedRMA;
begin
  LFrm:= TFrmViewArchivedRMA.Create(UniGUIApplication.UniApplication);
  LFrm.Id:= AId;
  LFrm.Show;
end;

procedure TFrmViewArchivedRMA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Panel2, Panel3, GridDtl, GridRec, GridRma,
   PnlHeaderLeft01,PnlHeaderLeft02,PnlHeaderLeft03,
   PnlDetailGeneralLeft01, PnlDetailGeneralLeft02, PnlDetailGeneralLeft03,
   PnlCheckLeft01, PnlCheckLeft02, PnlCheckLeft03,
   PnlUDLeft ]);
  Action := caFree;
end;

procedure TFrmViewArchivedRMA.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmViewArchivedRMA.QryHeaderBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmViewArchivedRMA.SBSearchClick(Sender: TObject);
begin
  with PkSearch do
    if Execute then QryHeader.Locate('ID', GetValue('ID'), [])
    else System.SysUtils.Abort;
end;

procedure TFrmViewArchivedRMA.PKSearchBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmViewArchivedRMA.ExpandedSearch1Click(Sender: TObject);
begin
  with PkSearchEx do
    if Execute then
    begin
      Qryheader.Locate('ID', GetValue('ID'), []);
      QryDtl.Locate('ID', GetValue('RMA_DETAIL_ID'), []);
    end;
end;

procedure TFrmViewArchivedRMA.SBToggleRmaClick(Sender: TObject);
begin
  if (PCRma.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    GridRma.DataSource:= NIL;
    PCRma.ActivePage := TabForm;
  end
  else
  begin
    GridRma.DataSource:= SrcHeader;
    PCRma.ActivePage := TabGrid;
  end;
end;

procedure TFrmViewArchivedRMA.SetID(const Value: Real);
begin
  FID:= Value;
end;

procedure TFrmViewArchivedRMA.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  { TODO -oBantuK -cWEB_CONVERT : Incompatible types: 'TForm' and 'TFrmViewArchivedRMA'
  IQMS.Common.Controls.CenterForm(Self);}
  IQRegFormRead( self, [self, Panel2, Panel3, GridDtl, GridRec, GridRma,
   PnlHeaderLeft01,PnlHeaderLeft02,PnlHeaderLeft03,
   PnlDetailGeneralLeft01, PnlDetailGeneralLeft02, PnlDetailGeneralLeft03,
   PnlCheckLeft01, PnlCheckLeft02, PnlCheckLeft03,
   PnlUDLeft ]);

  // controls
  GridRma.DataSource:= NIL;
  GridDtl.DataSource:= NIL;
  GridRec.DataSource:= NIL;
  IQMS.Common.Controls.AdjustPageControlToParent(PCRma);
  IQMS.Common.Controls.AdjustPageControlToParent(PCDtl);
  IQMS.Common.Controls.AdjustPageControlToParent(PCRec);
  pcDetail.ActivePageIndex := 0;
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlHeaderClient01);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlHeaderClient02);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlDetailGeneralClient01);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlUDClient);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCheckClient01);

  { TODO -oBantuK -cWEB_CONVERT : Separate DB Navigator is no longer required as UniGrid has it own.
  IQMS.Common.Controls.ResizeNavBar(NavRma);
  IQMS.Common.Controls.ResizeNavBar(NavDetail);
  IQMS.Common.Controls.ResizeNavBar(NavRec);}

  if FId = 0 then
  begin
    try
      SBSearchClick(NIL) ;      // activate search speed button
    except on E:EAbort do
      begin
        PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
      end;
    end
  end
  else
  begin
    if not QryHeader.Locate('ID', FId, []) then
    try
      SBSearchClick(NIL) ;      // activate search speed button
    except on E:EAbort do
      begin
        PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
      end;
    end;
  end;
end;

procedure TFrmViewArchivedRMA.SBToggleDtlClick(Sender: TObject);
begin
  if (PCDtl.ActivePage = TabDtlGrid) or (Sender = NIL) then
  begin
    IQRegFormWrite( self, [GridDtl]);
    GridDtl.DataSource:= NIL;
    PCDtl.ActivePage := TabDtlForm;
  end
  else
  begin
    GridDtl.DataSource:= SrcDtl;
    PCDtl.ActivePage := TabDtlGrid;
    IQRegFormRead( self, [GridDtl]);
  end;
end;

procedure TFrmViewArchivedRMA.SBToggleRecClick(Sender: TObject);
begin
  if (PCRec.ActivePage = TabRecGrid) or (Sender = NIL) then
  begin
    GridRec.DataSource:= NIL;
    PCRec.ActivePage := TabRecForm;
  end
  else
  begin
    GridRec.DataSource:= SrcRec;
    PCRec.ActivePage := TabRecGrid;
  end;
end;

procedure TFrmViewArchivedRMA.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmViewArchivedRMA.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1044901 );
end;

procedure TFrmViewArchivedRMA.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSHIP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmViewArchivedRMA.PopupMenu2Popup(Sender: TObject);
begin
  OrderInformation1.Enabled := QryDtlSHIPMENT_DTL_ID.asFloat <> 0;
end;

procedure TFrmViewArchivedRMA.OrderInformation1Click(Sender: TObject);
var
  AList: TStringList;
  AOrderNo, APono, ASo_Update, APackSlip: String;

  // ---------------------------------------------------------------------------
  procedure _AddLine(ACaption, AValue: String);
  begin
    if Assigned(AList) and (ACaption > '') and (AValue > '') then
       AList.Add(Format('%s=%s',[ACaption, AValue]));
  end;
  // ---------------------------------------------------------------------------

begin
  AList := TStringList.Create;
  try

    with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add(IqFormat('select o.pono, o.orderno from orders o, ord_detail d, shipment_dtl s where s.id = %f ' +
                       ' and s.order_dtl_id = d.id and d.orders_id = o.id', [QryDtlSHIPMENT_DTL_ID.asFloat]));
      open;
      if eof and bof then
      begin
        Sql.Clear;
        Sql.Add(IqFormat('select o.pono, o.orderno from hist_orders o, hist_ord_detail d, shipment_dtl s where s.id = %f ' +
                         ' and s.order_dtl_id = d.id and d.orders_id = o.id', [QryDtlSHIPMENT_DTL_ID.asFloat]));
        open;
      end;
      if not (eof and bof) then
      begin
        _AddLine(rma_rscstr.cTXT0000040 {'Order #'}, FieldByName('orderno').asString);
        _AddLine(rma_rscstr.cTXT0000041 {'PO #'}, FieldByName('pono').asString);
      end;
    finally
      free;
    end;

    APackSlip := SelectValueFmtAsString('select h.packslipno from shipments h, shipment_dtl s where s.id = %f ' +
                                  ' and s.shipments_id = h.id', [QryDtlSHIPMENT_DTL_ID.asFloat]);

    _AddLine(rma_rscstr.cTXT0000042 {'Packing Slip #'}, APackSlip);

    if (QryDtlSO_UPDATED.asString = '') or (QryDtlSO_UPDATED.asString = 'N') then
      _AddLine(rma_rscstr.cTXT0000043 {'Sales Order Update'}, IQMS.Common.Boolean.BoolToYesNo(False))
    else
      _AddLine(rma_rscstr.cTXT0000043 {'Sales Order Update'}, IQMS.Common.Boolean.BoolToYesNo(True));

    DoShowInfoBox_Ex(AList,
                     rma_rscstr.cTXT0000045,  // 'Order Information'
                     rma_rscstr.cTXT0000046,  // 'Property'
                     rma_rscstr.cTXT0000047); // 'Value'


  finally
    AList.Free;
  end;
end;

procedure TFrmViewArchivedRMA.FormCreate(Sender: TObject);
begin
  CheckVistaAdjustSize( [DBEdit3, DBEdit4]);
end;

end.
