unit SerTrack;

{ NOTE:  Unit, SerTrack_TouchScreen.pas, descends from this unit.
  If modifying the UI, please verify changes are correct for the
  touch-screen version. }

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.About,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.Common.DataLib,
  Vcl.Buttons,
  Vcl.Wwdbigrd,
  Vcl.Wwdbgrid,
//  IQMS.common.RepDef,   //  IQRepDef,
  IQMS.Common.JumpConstants,
  Mask,
  Vcl.wwdbedit,
  Vcl.Wwdotdot,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  IQMS.WebVcl.UserDefinedLabel,
//  db_dm,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.DBGrids,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniEdit,
  uniDBEdit,
  uniLabel,
  uniPageControl,
  uniPanel,
  uniScrollBox,
  uniBasicGrid,
  uniStringGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniDBNavigator,
  uniButton,
  uniBitBtn,
  uniDBGrid,
  uniSpeedButton, IQMS.WebVcl.RepDef, Vcl.Grids, IQUniGrid,
  uniGUIFrame;

type
  { TFrmTrackSer }
  TFrmTrackSer = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryMasterLbl: TFDQuery;
    QryMasterLblID: TBCDField;
    QryMasterLblEQNO: TStringField;
    QryMasterLblCLASS: TStringField;
    QryMasterLblITEMNO: TStringField;
    QryMasterLblREV: TStringField;
    QryMasterLblDESCRIP: TStringField;
    QryMasterLblDESCRIP2: TStringField;
    QryMasterLblMFGNO: TStringField;
    QryMasterLblPONO: TStringField;
    QryMasterLblARCUSTO_ID: TBCDField;
    QryMasterLblFG_LOTNO: TStringField;
    QryMasterLblBOXNO: TBCDField;
    QryMasterLblPRINT_DATE: TDateTimeField;
    QryMasterLblSCANNED: TStringField;
    QryMasterLblSERIAL: TStringField;
    QryMasterLblQTY: TFMTBCDField;
    QryMasterLblPARENT_ID: TBCDField;
    QryMasterLblDISPO_SCAN: TStringField;
    QryMasterLblVOLUME: TFMTBCDField;
    QryMasterLblWEIGHT: TFMTBCDField;
    QryMasterLblIS_SKID: TStringField;
    QryMasterLblLOC_DESC: TStringField;
    QryMasterLblBOX_ID: TBCDField;
    QryMasterLblARINVT_ID: TBCDField;
    QryMasterLblSYS_DATE: TDateTimeField;
    QryMasterLblUSER_NAME: TStringField;
    PopupMenu1: TUniPopupMenu;
    SearchSerial1: TUniMenuItem;
    SrcMasterLbl: TDataSource;
    DrillDownbyLot1: TUniMenuItem;
    SrcMasterLblDtl: TDataSource;
    QryMasterLblDtl: TFDQuery;
    QryMasterLblDtlID: TBCDField;
    QryMasterLblDtlCLASS: TStringField;
    QryMasterLblDtlITEMNO: TStringField;
    QryMasterLblDtlDESCRIP: TStringField;
    QryMasterLblDtlDESCRIP2: TStringField;
    QryMasterLblDtlMFGNO: TStringField;
    QryMasterLblDtlPONO: TStringField;
    QryMasterLblDtlFG_LOTNO: TStringField;
    QryMasterLblDtlSERIAL: TStringField;
    QryMasterLblDtlQTY: TFMTBCDField;
    QryMasterLblDtlLOC_DESC: TStringField;
    QryMasterLblDtlUSER_NAME: TStringField;
    QryMasterLblPARENT_ID_DISP: TStringField;
    QryMasterLblORDERNO: TStringField;
    QryMasterLblDtlORDERNO: TStringField;
    SrcForeign2: TDataSource;
    QryForeign2: TFDQuery;
    QryForeign2SERIAL: TStringField;
    QryForeign2SCAN_DATE: TDateTimeField;
    SrcForeign1: TDataSource;
    QryForeign1: TFDQuery;
    QryForeign1SERIAL: TStringField;
    QryForeign1SCAN_DATE: TDateTimeField;
    N1: TUniMenuItem;
    ReprintLabel1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    QryMasterLblDISPO_DATE: TDateTimeField;
    Contents1: TUniMenuItem;
    QryMasterLblSHIPPED: TStringField;
    QryTransLog: TFDQuery;
    QryTransLogTRANS_DATE: TDateTimeField;
    QryTransLogTRANS_IN_OUT: TStringField;
    QryTransLogTRANS_QUAN: TFMTBCDField;
    QryTransLogRG_QUAN: TFMTBCDField;
    QryTransLogTRANS_TYPE: TStringField;
    QryTransLogLOC_DESC: TStringField;
    QryTransLogLOTNO: TStringField;
    QryTransLogACT_COST: TFMTBCDField;
    QryTransLogTRANS_REASON: TStringField;
    QryTransLogSTD_COST: TFMTBCDField;
    QryTransLogFG_LOTNO: TStringField;
    QryTransLogBATCH: TBCDField;
    QryTransLogPARENT_ARINVT_ID: TBCDField;
    QryTransLogARINVT_ID: TBCDField;
    QryTransLogUSERID: TStringField;
    QryTransLogFGMULTI_CUSER1: TStringField;
    QryTransLogFGMULTI_CUSER2: TStringField;
    QryTransLogFGMULTI_CUSER3: TStringField;
    QryTransLogRECEIPTNO: TStringField;
    QryTransLogDIVISION_NAME: TStringField;
    QryTransLogTRANS_CODE: TStringField;
    QryTransLogTRANS_DESCRIP: TStringField;
    QryTransLogLOCATION_DESCRIP: TStringField;
    QryTransLogID: TBCDField;
    QryTransLogEXCLUDE_RPT: TStringField;
    QryTransLogWORKORDER_ID: TBCDField;
    QryTransLogParent_ItemNo: TStringField;
    QryTransLogSOURCE: TStringField;
    QryTransLogSOURCE_ID: TBCDField;
    QryTransLogEPLANT_ID: TBCDField;
    QryTransLogPOSTED: TStringField;
    QryTransLogSYSTEM_DATE: TDateTimeField;
    SrcTransLog: TDataSource;
    JumptoInventory1: TUniMenuItem;
    QryMasterLblDtlORIG_SYSDATE: TDateTimeField;
    QryMasterLblDtlORIG_USER_NAME: TStringField;
    QryMasterLblORIG_SYSDATE: TDateTimeField;
    QryMasterLblORIG_USER_NAME: TStringField;
    QryMasterLblREPACKED_MASTER_LABEL_ID: TBCDField;
    QryMasterLblVIN_NO: TStringField;
    SrcRepackedTo: TDataSource;
    QryRepackedTo: TFDQuery;
    QryRepackedToID: TBCDField;
    QryRepackedToCLASS: TStringField;
    QryRepackedToITEMNO: TStringField;
    QryRepackedToDESCRIP: TStringField;
    QryRepackedToDESCRIP2: TStringField;
    QryRepackedToMFGNO: TStringField;
    QryRepackedToORDERNO: TStringField;
    QryRepackedToPONO: TStringField;
    QryRepackedToFG_LOTNO: TStringField;
    QryRepackedToSERIAL: TStringField;
    QryRepackedToQTY: TFMTBCDField;
    QryRepackedToLOC_DESC: TStringField;
    QryRepackedToUSER_NAME: TStringField;
    QryRepackedToORIG_SYSDATE: TDateTimeField;
    QryRepackedToORIG_USER_NAME: TStringField;
    PopupMenu2: TUniPopupMenu;
    JumptoSN1: TUniMenuItem;
    QryVin: TFDQuery;
    SrcVin: TDataSource;
    QryVinID: TBCDField;
    QryVinVIN_NO: TStringField;
    QryVinSMART_CODE: TStringField;
    QryVinCONFIG_WEIGHT: TFMTBCDField;
    QryVinGAWR: TFMTBCDField;
    QryVinGVWR: TFMTBCDField;
    QryVinTIRE_SIZE: TStringField;
    QryVinRIM: TStringField;
    QryVinPSI: TStringField;
    QryVinSINGLE_DUAL: TStringField;
    QryVinVEHICLE_ATTRIB: TStringField;
    QryVinSPARE_TIRE: TStringField;
    QryVinNUM_AXLES: TBCDField;
    QryVinMODEL_YR: TBCDField;
    QryVinARCUSTO_COMPANY: TStringField;
    QryVinUNIT_PRICE: TFMTBCDField;
    QryVinLIST_UNIT_PRICE: TFMTBCDField;
    QryVinARINVT_ID: TBCDField;
    QryVinSTANDARD_ID: TBCDField;
    QryVinWORKORDER_ID: TBCDField;
    QryVinORD_DETAIL_ID: TBCDField;
    QryVinCRM_QUOTE_DETAIL_ID: TBCDField;
    QryVinSHIPMENTS_ID: TBCDField;
    QryVinARINVOICE_ID: TBCDField;
    QryVinWORKORDER_NUMBER: TFMTBCDField;
    QryVinPACKSLIPNO: TStringField;
    QryVinINVOICE_NO: TStringField;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetUp1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog2: TPrinterSetupDialog;
    PopupMenu3: TUniPopupMenu;
    JumptoInventory2: TUniMenuItem;
    JumptoBOM1: TUniMenuItem;
    JumptoWO1: TUniMenuItem;
    JumptoCRMQuote1: TUniMenuItem;
    JumptoPackingSlip1: TUniMenuItem;
    JumptoPostedARInvoice1: TUniMenuItem;
    UpdateSQL1: TFDUpdateSQL;
    QryVinCONFIG_CHOICES: TStringField;
    QryMasterLblSTANDARD_ID: TBCDField;
    JumptoBOM2: TUniMenuItem;
    PanelMain: TUniPanel;
    PageControl1: TUniPageControl;
    tabPallets: TUniTabSheet;
    Splitter2: TUniSplitter;
    Panel2: TUniPanel;
    IQSearch1: TIQUniGridControl;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    IQSearchForeign2: TIQUniGridControl;
    tabForeign: TUniTabSheet;
    IQSearchForeign1: TIQUniGridControl;
    TabSRepackTo: TUniTabSheet;
    IQSearch2: TIQUniGridControl;
    Splitter1: TUniSplitter;
    Panel8: TUniPanel;
    Panel1: TUniPanel;
    sbtnSearch: TUniSpeedButton;
    sbtnReprint: TUniSpeedButton;
    Panel4: TUniPanel;
    Splitter3: TUniSplitter;
    Panel5: TUniPanel;
    StringGrid1: TUniStringGrid;
    Panel6: TUniPanel;
    PCTrack: TUniPageControl;
    TabSer: TUniTabSheet;
    Panel7: TUniPanel;
    NavTransLog: TUniDBNavigator;
    DBGridTransLog: TUniDBGrid;
    TabVin: TUniTabSheet;
    Panel9: TUniPanel;
    NavVin: TUniDBNavigator;
    IQSearch3: TIQUniGridControl;
    wwDBComboDlgConfigChoices: TUniEdit;
    JumptoWorkOrder1: TUniMenuItem;
    JumptoPackingSlip2: TUniMenuItem;
    QryMasterLblWORKORDER_ID: TBCDField;
    QryMasterLblSHIPMENT_DTL_ID: TBCDField;
    QryMasterLblPS_TICKET_DTL_ID: TBCDField;
    N2: TUniMenuItem;
    CopyCelltoClipboard1: TUniMenuItem;
    sbtnTransPlan: TUniSpeedButton;
    SR: TIQWebSecurityRegister;
    TabDim: TUniTabSheet;
    TabUD: TUniTabSheet;
    SrcDimInv: TDataSource;
    QryDimInv: TFDQuery;
    FDUpdateSQL1: TFDUpdateSQL;
    QryDimInvID: TBCDField;
    QryDimInvMASTER_LABEL_ID: TBCDField;
    QryDimInvNAME: TStringField;
    QryDimInvUOM: TStringField;
    QryDimInvNVALUE: TFMTBCDField;
    IQSearch4: TIQUniGridControl;
    Panel10: TUniPanel;
    NavDim: TUniDBNavigator;
    sbUserDefined: TUniScrollBox;
    PnlUserDefined: TUniPanel;
    Splitter4: TUniSplitter;
    PnlClient01: TUniPanel;
    Splitter5: TUniSplitter;
    PnlUDLeft01: TUniPanel;
    IQUserDefLabel1: TIQWebUserDefLabel;
    IQUserDefLabel2: TIQWebUserDefLabel;
    IQUserDefLabel3: TIQWebUserDefLabel;
    IQUserDefLabel7: TIQWebUserDefLabel;
    IQUserDefLabel8: TIQWebUserDefLabel;
    IQUserDefLabel9: TIQWebUserDefLabel;
    IQUserDefLabel13: TIQWebUserDefLabel;
    IQUserDefLabel14: TIQWebUserDefLabel;
    IQUserDefLabel15: TIQWebUserDefLabel;
    IQUserDefLabel19: TIQWebUserDefLabel;
    PnlClient02: TUniPanel;
    PnlUDRight01: TUniPanel;
    Splitter6: TUniSplitter;
    PnlUDLeft02: TUniPanel;
    IQUserDefLabel4: TIQWebUserDefLabel;
    IQUserDefLabel5: TIQWebUserDefLabel;
    IQUserDefLabel6: TIQWebUserDefLabel;
    IQUserDefLabel10: TIQWebUserDefLabel;
    IQUserDefLabel11: TIQWebUserDefLabel;
    IQUserDefLabel12: TIQWebUserDefLabel;
    IQUserDefLabel16: TIQWebUserDefLabel;
    IQUserDefLabel17: TIQWebUserDefLabel;
    IQUserDefLabel18: TIQWebUserDefLabel;
    IQUserDefLabel20: TIQWebUserDefLabel;
    PnlClient03: TUniPanel;
    SrcMasterLbl2: TDataSource;
    QryMasterLbl2: TFDQuery;
    FDUpdateSQL2: TFDUpdateSQL;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    DBEdit6: TUniDBEdit;
    DBEdit7: TUniDBEdit;
    DBEdit8: TUniDBEdit;
    DBEdit9: TUniDBEdit;
    DBEdit10: TUniDBEdit;
    DBEdit11: TUniDBEdit;
    DBEdit12: TUniDBEdit;
    DBEdit13: TUniDBEdit;
    DBEdit14: TUniDBEdit;
    DBEdit15: TUniDBEdit;
    DBEdit16: TUniDBEdit;
    DBEdit17: TUniDBEdit;
    DBEdit18: TUniDBEdit;
    DBEdit19: TUniDBEdit;
    DBEdit20: TUniDBEdit;
    QryMasterLbl2ID: TBCDField;
    QryMasterLbl2INV_CUSER1: TStringField;
    QryMasterLbl2INV_CUSER2: TStringField;
    QryMasterLbl2INV_CUSER3: TStringField;
    QryMasterLbl2INV_CUSER4: TStringField;
    QryMasterLbl2INV_CUSER5: TStringField;
    QryMasterLbl2INV_CUSER6: TStringField;
    QryMasterLbl2INV_CUSER7: TStringField;
    QryMasterLbl2INV_CUSER8: TStringField;
    QryMasterLbl2INV_CUSER9: TStringField;
    QryMasterLbl2INV_NUSER1: TFMTBCDField;
    QryMasterLbl2INV_NUSER2: TFMTBCDField;
    QryMasterLbl2INV_NUSER3: TFMTBCDField;
    QryMasterLbl2INV_NUSER4: TFMTBCDField;
    QryMasterLbl2INV_NUSER5: TFMTBCDField;
    QryMasterLbl2INV_NUSER6: TFMTBCDField;
    QryMasterLbl2INV_NUSER7: TFMTBCDField;
    QryMasterLbl2INV_NUSER8: TFMTBCDField;
    QryMasterLbl2INV_NUSER9: TFMTBCDField;
    QryMasterLbl2INVCUSER10: TStringField;
    QryMasterLbl2INVNUSER10: TFMTBCDField;
    QryTransLogLABEL_QTY: TFMTBCDField;
    QryTransLogFGMULTI_ID: TBCDField;
    popmTranslog: TUniPopupMenu;
    ShowSerialNumbers1: TUniMenuItem;
    QryTransLogBEGIN_QUAN: TFMTBCDField;
    QryTransLogBEGIN_RG_QUAN: TFMTBCDField;
    QryTransLogBEGIN_QUAN_TOTAL: TFMTBCDField;
    QryTransLogBEGIN_RG_QUAN_TOTAL: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure SearchSerial1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DrillDownbyLot1Click(Sender: TObject);
    procedure sbtnReprintClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure JumptoSN1Click(Sender: TObject);
    procedure PrinterSetUp1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure JumptoInventory2Click(Sender: TObject);
    procedure JumptoBOM1Click(Sender: TObject);
    procedure JumptoWO1Click(Sender: TObject);
    procedure JumptoCRMQuote1Click(Sender: TObject);
    procedure JumptoPackingSlip1Click(Sender: TObject);
    procedure JumptoPostedARInvoice1Click(Sender: TObject);
    procedure QryVinBeforeInsert(DataSet: TDataSet);
    procedure wwDBComboDlgConfigChoicesCustomDlg(Sender: TObject);
    procedure JumptoBOM2Click(Sender: TObject);
    procedure JumptoWorkOrder1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure JumptoPackingSlip2Click(Sender: TObject);
    procedure CopyCelltoClipboard1Click(Sender: TObject);
    procedure sbtnTransPlanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryMasterLblAfterScroll(DataSet: TDataSet);
    procedure NavDimBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure QryDimInvBeforeDelete(DataSet: TDataSet);
    procedure QryDimInvBeforeInsert(DataSet: TDataSet);
    procedure NavUDBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure ShowSerialNumbers1Click(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
    procedure QryDimInvBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
    procedure PopulateStringGrid;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; AId:Real);
    procedure RefreshData( AId: Real );

    class procedure ReprintLabel( AMaster_Label_ID: Real; AConfirmYN: Boolean = TRUE );
//    class procedure Sel_Item_Label_Step2( AArinvtID                  : Real;
//                                          APalletKind                : string;
//                                          AIsPallet                  : Boolean;
//                                          ACartons_Pallet            : Real;
//                                          APieces_Carton             : Real;
//                                          AQty                       : Real;
//                                          ALotNo                     : string;
//                                          AConfirmYN                 : Boolean;
//                                          APrintExist_Master_Label_ID: Real = 0;
//                                          APrintLM_MatObject         : TObject = NIL;        {TPrintLMRawMat or TPrintLMBomMat - special wrapper object for calling IQLMRaw. Used in Receiving w/o PO}
//                                          APS_Ticket_ID              : Real = 0;
//                                          AOptionalCargo             : TOptionalPrintLabelCargo = nil );  {Labels_Share.pas}
  end;

procedure DoSerialTracking(AOwner:TComponent);
procedure JumptoSerialTracking(AOwner:TComponent; AId:Real);

var
  FrmTrackSer: TFrmTrackSer;

implementation

{$R *.DFM}

uses
  bom_shel,
  crm_quote,
  GetSer,
  Inv_DM,
  inv_trans_plan_base,
  inv_trans_share,
  InvtShel,
  IQMS.common.Applications,//  IqApps,
  IQMS.common.Controls,//  IqCtrl,
  IQMS.common.Cursor,//  IqCursor,
  IQMS.Common.HelpHook,
  IqLMBase,
  IQLMShare,
  IQMS.common.Miscellaneous,  //  IQMisc,
  IQMS.Labels.PrintMatLabel,
  IQMS.Common.RegFrm,  // IqRegFrm,
  IQMS.Common.SecMan,  //IQSecMan,
  IQMS.Common.StringUtils,    //iqstring,
  IView,
  LotTrack,
  psmaint,
  IQMS.Common.RFShare,
  translog_master_label,
  wo_main;

procedure DoSerialTracking(AOwner:TComponent);
begin
  GetSerialTrackingNumber(AOwner);  {in GetSer.pas}
end;


procedure JumptoSerialTracking(AOwner:TComponent; AId:Real);
begin
  with TFrmTrackSer.Create(AOwner, AId) do show;
end;

constructor TFrmTrackSer.Create(AOwner:TComponent; AId:Real);
begin
  inherited Create(AOwner);
  PCTrack.ActivePage := TabSer;
  DBGridTransLog.font := StringGrid1.font;
//  TabVin.Visible :=  SecurityManager.SetVisibleIfLicensed( NIL{speedbtn}, NIL{MenuOption}, NIL{Separator}, IQAppsNames[ apVINGen ], NIL);
  TabVin.TabVisible :=  SecurityManager.SetVisibleIfLicensed( NIL{speedbtn}, NIL{MenuOption}, NIL{Separator}, IQAppsNames[ apVINGen ], NIL);


  StringGrid1.Cursor := crDrill;
  PageControl1.ActivePageIndex:= 0;
  sbtnTransPlan.Visible:= inv_trans_share.IsWMS2Licensed;
  IQSearch4.wwDBGrid.ReadOnly := true;
  RefreshData( AId );
end;

procedure TFrmTrackSer.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [self, Panel2, Panel4, Panel5, DBGridTransLog, Panel8]);
  IQSearch3.wwDBGrid.SetControlType('CONFIG_CHOICES', fctCustom, 'wwDBComboDlgConfigChoices');
  IQSearch1.ReadGrid;
  IQSearchForeign2.ReadGrid;
end;

procedure TFrmTrackSer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Panel2, Panel4, Panel5, DBGridTransLog, Panel8]);
  IQSearch1.WriteGrid;
  IQSearchForeign2.WriteGrid;
  Action := caFree;
end;

procedure TFrmTrackSer.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTrackSer.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmTrackSer.PopulateStringGrid;
var
  I: Integer;
  ARepackedFromSN, ARepackedToSN, AVinNo:String;
  AId:Real;
  APickTicket: Real;
  APackSLipNo: string;
begin
  with StringGrid1 do
  begin
    RowCount := 2;
    Cells[ 0, 0 ]:= '#';
    Cells[ 1, 0 ]:= 'Field Name';
    Cells[ 2, 0 ]:= 'Value';
  end;

  with QryMasterLbl do
    for I:= 0 to FieldCount - 1 do with StringGrid1 do
      if (Fields[ I ].Tag = 0) then
      begin
        if (I >= RowCount - 1) then
          RowCount:= RowCount + 1;
        Cells[ 0, RowCount - 1 ]:= IntToStr( RowCount - 1 );
        Cells[ 1, RowCount - 1 ]:= Fields[ I ].DisplayLabel;
        Cells[ 2, RowCount - 1 ]:= Fields[ I ].asString;
      end;

   ARepackedToSN := SelectValueFmtAsString('select serial from master_label where REPACKED_MASTER_LABEL_ID = %f', [QryMasterLblID.asFloat]);
   ARepackedFromSN := SelectValueFmtAsString('select serial from master_label where id = %f', [QryMasterLblREPACKED_MASTER_LABEL_ID.asFloat]);
   with StringGrid1 do
   begin
     RowCount:= RowCount + 1;
     Cells[ 0, RowCount - 1 ]:= IntToStr( RowCount - 1 );
     Cells[ 1, RowCount - 1 ]:= 'Repacked To SN#';
     Cells[ 2, RowCount - 1 ]:= ARepackedToSN;


     RowCount:= StringGrid1.RowCount + 1;
     Cells[ 0, RowCount - 1 ]:= IntToStr( RowCount - 1 );
     Cells[ 1, RowCount - 1 ]:= 'Repacked From SN#';
     Cells[ 2, RowCount - 1 ]:= ARepackedFromSN;

   end;

   if SecurityManager.IsModuleLicensed( IQapps.IQAppsNames[ apVINGen  ]) then
   with StringGrid1 do
   begin
     RowCount:= RowCount + 1;
     Cells[ 0, RowCount - 1 ]:= IntToStr( RowCount - 1 );
     Cells[ 1, RowCount - 1 ]:= 'Vin #';
     Cells[ 2, RowCount - 1 ]:= QryMasterLblVIN_NO.asString;
   end;

   // if QryMasterLblWORKORDER_ID.asFloat <> 0 then
   with StringGrid1 do
   begin
     RowCount:= RowCount + 1;
     Cells[ 0, RowCount - 1 ]:= IntToStr( RowCount - 1 );
     Cells[ 1, RowCount - 1 ]:= 'Work Order #';
     Cells[ 2, RowCount - 1 ]:= QryMasterLblWORKORDER_ID.asString;
   end;

   APickTicket:= 0;
   APackSlipNo:= '';
   if QryMasterLblPS_TICKET_DTL_ID.asFloat <> 0 then
      APickTicket:= SelectValueFmtAsFloat('select ps_ticket_id from PS_TICKET_DTL where id = %f', [QryMasterLblPS_TICKET_DTL_ID.asFloat]);
   if QryMasterLblSHIPMENT_DTL_ID.asFloat <> 0 then
      APackSlipNo:= SelectValueFmtAsString('select packslipno from shipments where id = (select shipments_id from shipment_dtl where id = %f)', [QryMasterLblSHIPMENT_DTL_ID.asFloat]);

   with StringGrid1 do
   begin
     RowCount:= RowCount + 1;
     Cells[ 0, RowCount - 1 ]:= IntToStr( RowCount - 1 );
     Cells[ 1, RowCount - 1 ]:= 'Pick Ticket #';
     Cells[ 2, RowCount - 1 ]:= FloatToStr0asNull( APickTicket );

     RowCount:= RowCount + 1;
     Cells[ 0, RowCount - 1 ]:= IntToStr( RowCount - 1 );
     Cells[ 1, RowCount - 1 ]:= 'Packing Slip #';
     Cells[ 2, RowCount - 1 ]:= APackSlipNo;
   end;
end;

procedure TFrmTrackSer.SearchSerial1Click(Sender: TObject);
begin
  GetSerialTrackingNumber(self);  {in GetSer.pas}
  Reopen( QryMasterLbl );
end;

procedure TFrmTrackSer.FormResize(Sender: TObject);
begin
  with StringGrid1 do
    ColWidths[ 2 ]:= ClientWidth - ColWidths[ 0 ] - ColWidths[ 1 ] - 3;
end;

procedure TFrmTrackSer.DrillDownbyLot1Click(Sender: TObject);
begin
  if QryMasterLblFG_LOTNO.asString = '' then
    raise Exception.Create('Lot# is blank');
  DoLotTrackingDirect(self, QryMasterLblFG_LOTNO.asString, QryMasterLblARINVT_ID.asFloat);  {in LotTrack.pas}
end;

procedure TFrmTrackSer.RefreshData( AId: Real );
begin
  with QryMasterLbl do
  begin
    Close;
    ParamByName('AId').Value := AId;
    Open;
  end;
  QryTransLog.Close;
  QryTransLog.Open;
  QryVin.Close;
  QryVin.Open;
  PopulateStringGrid;

  QryMasterLblDtl.Open;
  QryRepackedTo.Open;
  QryForeign1.Open;
  QryForeign2.Open;

  PageControl1.Visible:= not (QryMasterLblDtl.Eof and QryMasterLblDtl.Bof)
                         or
                         not (QryForeign1.Eof and QryForeign1.Bof)
                         or
                         not (QryRepackedTo.Eof and QryRepackedTo.Bof);
  application.processmessages;
  Splitter1.Align := alBottom;
  Splitter1.Visible := PageControl1.Visible;

  if not PageControl1.Visible then
    Panel8.Align := alClient
//    StringGrid1.Align := alClient
  else
    begin
      Panel8.Align := alTop;
      Panel8.Height:= self.ClientHeight div 3;
//      StringGrid1.Align := alTop;
//      StringGrid1.Height:= self.ClientHeight div 3;

      tabPallets.TabVisible:= not (QryMasterLblDtl.Eof and QryMasterLblDtl.Bof);
      tabForeign.TabVisible:= not (QryForeign1.Eof and QryForeign1.Bof);
      TabSRepackTo.TabVisible:= not (QryRepackedTo.Eof and QryRepackedTo.Bof);
    end;
  application.processmessages;
  Splitter1.Align := alTop;
end;

procedure TFrmTrackSer.sbtnReprintClick(Sender: TObject);
begin
   ReprintLabel( QryMasterLblID.asFloat );
end;

class procedure TFrmTrackSer.ReprintLabel( AMaster_Label_ID: Real; AConfirmYN: Boolean = TRUE );
var
  AIsPallet   : Boolean;
  APalletKind : string;
  AArinvtID   : Int64;
  AIsMixedPallet: Boolean;
begin
  try
    TFrmLM_Base.Assign_FDoNotCheck_use_original_label_on_reprint( true );
    AIsPallet   := SelectValueFmtAsFloat('select id from master_label where parent_id = %f and rownum < 2', [ AMaster_Label_ID ]) > 0;
    APalletKind := '';
    AArinvtID   := SelectValueByID( 'arinvt_id', 'master_label',  AMaster_Label_ID );

    AIsMixedPallet:= FALSE;
    if AIsPallet then
    begin
      AIsMixedPallet:= (AArinvtID = 0);  // mixed pallet 05-12-2014
      if AIsMixedPallet then
         APalletKind:= 'MIXED'
      else
         APalletKind:= GetPalletType( AArinvtID );   {RF_Share.pas      }
    end;

    // Declared in IQMS.Labels.PrintMatLabel, based on IQRF method in
    // Labels.pas, Sel_Item_Label_Step2().
    PrintMaterialLabel(AArinvtID,                                                    // ArinvtID
                       IQLMShare.ForcedLM_Lables_ID,
                       APalletKind,                                                  // PalletKind
                       AIsPallet,                                                    // IsPallet
                       0,                                                            // Cartons_Pallet N/A
                       0,                                                            // Pieces_Carton  N/A
                       SelectValueByID('qty', 'master_label', AMaster_Label_ID ),         // Qty
                       SelectValueByID('fg_lotno', 'master_label', AMaster_Label_ID),     // LotNo
                       AConfirmYN,                                                   // Confrmation Print Y/N
                       Trunc(AMaster_Label_ID),                                           // PrintExist_Master_Label_ID
                       0,  // APS_Ticket_ID
                       nil,
                       nil,
                       nil);

  finally
    TFrmLM_Base.Assign_FDoNotCheck_use_original_label_on_reprint( false );
  end;
end;

(*
class procedure TFrmTrackSer.Sel_Item_Label_Step2( AArinvtID                  : Real;
                                                   APalletKind                : string;
                                                   AIsPallet                  : Boolean;
                                                   ACartons_Pallet            : Real;
                                                   APieces_Carton             : Real;
                                                   AQty                       : Real;
                                                   ALotNo                     : string;
                                                   AConfirmYN                 : Boolean;
                                                   APrintExist_Master_Label_ID: Real = 0;
                                                   APrintLM_MatObject         : TObject = NIL;        {TPrintLMRawMat or TPrintLMBomMat - special wrapper object for calling IQLMRaw. Used in Receiving w/o PO}
                                                   APS_Ticket_ID              : Real = 0;             {When printing mixed labels we pass ps_ticket_id to establish arcusto when calling GetLabelID }
                                                   AOptionalCargo             : TOptionalPrintLabelCargo = nil );
var
  AStandard_ID : Real;
  ALabels      : Integer;
  ALMLabelsID  : Real;
  AArcusto_ID  : Real;
  AIsReprint   : Boolean;
  ALabelType   : string;
  AOrderNo     : string;
  APono        : string;
  AIsPrintRAW  : Boolean;
  S            : string;
  AIs_Serialized: Boolean;
  AForeignSerial: string;

  {AOptional Params}
  AReprintReason : string;
  AForceLabelType: string;
  ASkipMfgExistsValidation: Real;
  AForceLabelQty: Integer;
  APrintedCount: Integer;
  AMustPrint: Boolean;
  AIgnorePrintedCount: Boolean;
  AOnBeforeRePrintLabel: TOnBeforeRePrintLabel;

  // ---------------------------------------------------------------------------
  procedure AssignVariables;
  var
    AMfgNo: string;
  begin
    if AIsReprint then
      begin
        AArcusto_ID := SelectValueByID( 'arcusto_id',  'master_label', APrintExist_Master_Label_ID );
        AMfgNo      := SelectValueByID( 'RTrim(mfgno)','master_label', APrintExist_Master_Label_ID );
        AOrderNo    := SelectValueByID( 'orderno',     'master_label', APrintExist_Master_Label_ID );
        APono       := SelectValueByID( 'pono',        'master_label', APrintExist_Master_Label_ID );
        AStandard_ID:= SelectValueByID( 'standard_id', 'master_label', APrintExist_Master_Label_ID );
        if AStandard_ID = 0 then
           AStandard_ID:= SelectValueFmtAsFloat ( 'select id from standard where mfgno = ''%s''', [ AMfgNo ]);
      end
    else
      begin
        AArcusto_ID := SelectValueByID( 'arcusto_id',  'arinvt', AArinvtID );
        AStandard_ID:= SelectValueByID( 'standard_id', 'arinvt', AArinvtID );
        AOrderNo    := '';
        APono       := '';
      end;

    {Init optional params}
    AReprintReason          := '';
    AForceLabelType         := '';
    ASkipMfgExistsValidation:= 0; {0 - default, 1 - yes, 2 - no};
    AForceLabelQty          := 0;
    AMustPrint              := FALSE;
    AIgnorePrintedCount     := FALSE;
    AForeignSerial          := '';
    AOnBeforeRePrintLabel   := nil;
    if Assigned(AOptionalCargo) then
    begin
       AReprintReason          := AOptionalCargo.ReprintReason;
       AForceLabelType         := AOptionalCargo.ForceLabelType;          {'PURCHASED', 'MANUFACTURED'}
       ASkipMfgExistsValidation:= AOptionalCargo.SkipMfgExistsValidation; {0 - default, 1 - yes, 2 - no};
       AForceLabelQty          := AOptionalCargo.ForceLabelQty;
       APrintedCount           := AOptionalCargo.PrintedCount;
       AMustPrint              := AOptionalCargo.MustPrint;
       AIgnorePrintedCount     := AOptionalCargo.IgnorePrintedCount;
       AForeignSerial          := AOptionalCargo.ForeignSerial;
       AOnBeforeRePrintLabel   := AOptionalCargo.OnBeforeRePrintLabel;
    end;

  end;

begin
  AIsReprint:= APrintExist_Master_Label_ID > 0;
  AIs_Serialized:= SelectValueByID('is_linked_to_serial', 'arinvt', AArinvtID ) = 'Y';

  {Assign Standard_ID and Arcusto_ID}
  AssignVariables;

  {Assign ALabelType - used for reprint portion}
  if AForceLabelType > '' then
     ALabelType:= AForceLabelType
  else if APalletKind = 'MIXED' then   {see PkTck_Serial.pas procedure PrintMixedPallet}
     ALabelType:= 'MIXED'
  else
     ALabelType:= IIf( AStandard_ID = 0, 'PURCHASED', 'MANUFACTURED' );

  {Assign # of labels to print and what Label ID}
  if AIsReprint then
     begin
       ALabels:= 1;
       if IQLMShare.ForcedLM_Lables_ID > 0 then
          ALMLabelsID:= IQLMShare.ForcedLM_Lables_ID

       else if AReprintReason = 'SALES ORDER MISMATCH' then
          ALMLabelsID:= GetLabelIDExA( AArinvtID, APS_Ticket_ID )                                                           {rf_share.pas}

       else if AReprintReason = 'SALES ORDER BASED REPRINT' then
          ALMLabelsID:= GetLabelIDExB( AARinvtID, SelectValueFmtAsFloat('select id from orders where orderno = ''%s''', [ AOrderNo ])) {rf_share.pas}

       else
          begin
            if not IQLMShare.reassign_label_to_original_on_reprint( ALMLabelsID,  APrintExist_Master_Label_ID ) then
               ALMLabelsID:= GetLabelIDEx ( ALabelType, IIf(AIsPallet, 'PALLET', 'RF'), AArinvtID, APS_Ticket_ID );
          end
     end
  else
     begin
       if AIs_Serialized then
          ALabels:= iMax(1, AForceLabelQty)

       else if AForceLabelQty > 0 then
          ALabels:= AForceLabelQty

       else
          begin
            if not InputQuery('How many labels', 'Enter labels count', S ) or ( StrToInt( S ) <= 0 ) then
               EXIT;
            ALabels:= StrToInt( S );
          end;
       ALMLabelsID:= GetLabelID( APalletKind, AArinvtID, APS_Ticket_ID );
     end;

  IQAssert( ALMLabelsID > 0, 'Unable to determine RF Default Label');

  {Print RAW material label?}
  AIsPrintRAW:=  (AIsPallet     and     (APalletKind = 'RAW'))
                 or
                 (not AIsPallet and not AIsReprint and (ALabelType = 'PURCHASED')) { Mar-04-06 added ALabelType = 'PURCHASED' instead of "when printing new label - no pallet means purchased material"}
                 or
                 (AIsReprint    and     (ALabelType = 'PURCHASED')); {when reprinting - go off of arinvt_id -> standard_id}

  if IsCRWLabel(ALMLabelsID) then                                  {RF_Share.pas}
     begin
     //   May-24-05 - caused 2 print setup dialog box to come up
     //   if not PrinterSetupDialog1.Execute then
     //      ABORT;
     end
  else if AConfirmYN then
     begin
       if not IQConfirmYN('About to print a label. Please confirm to continue.') then
          ABORT;
     end;

  case AIsPrintRAW of
       {Print RAW}
       TRUE:   if APrintLM_MatObject = nil then
                  DoPrintLMRawMaterial( AArinvtID,        // IQLMRaw.pas
                                        ALMLabelsID,
                                        AQty,
                                        ALabels,
                                        ALotNo,
                                        AIsPallet,
                                        ACartons_Pallet,
                                        APieces_Carton,
                                        APrintExist_Master_Label_ID,
                                        nil,                            // AAfterMasterLabelInsert: TOnAfterMasterLabelInsert = NIL;
                                        '',                             // APoNoRec     : string = '';
                                        AForeignSerial,
                                        0,                              // ADivision_ID : Real = 0;
                                        '',                             // AReceiptNo   : string = '' );
                                        AOnBeforeRePrintLabel )

               else with TPrintLMRawMat(APrintLM_MatObject) do          // PrintLMRawMat.pas: APrintLMRawMatObject is preassigned by caller
                  PrintLMRawMat( AArinvtID,               // with Loc_ID, PoNoRec, TrackNo.
                                 ALMLabelsID,             // Also the object has call back function that updates loc_desc in master_label
                                 AQty,
                                 ALabels,
                                 ALotNo,
                                 AIsPallet,
                                 ACartons_Pallet,
                                 APieces_Carton,
                                 APrintExist_Master_Label_ID );
                 {Print BOM}
       FALSE:
          begin
            if APrintLM_MatObject = nil then
               DoPrintLMBomMaterial( AArinvtId,
                                     ALMLabelsID,
                                     AStandard_ID,
                                     AQty,
                                     ALabels,
                                     ALotNo,
                                     AOrderNo,
                                     APono,
                                     AArcusto_ID,
                                     AIsPallet,
                                     ACartons_Pallet,
                                     APieces_Carton,
                                     APrintExist_Master_Label_ID,
                                     nil,                          // AOnGetTotalLabelsCount  : TOnGetTotalLabelsCount = NIL;
                                     ASkipMfgExistsValidation,     // ASkipMfgExistsValidation: Real = 0 {0 - default, 1 - yes, 2 - no};
                                     AForeignSerial,               // AForeignSerial          : string = '';
                                     0,                            // ADivision_ID            : Real = 0
                                     nil,                          // AAfterMasterLabelInsert    : TOnAfterMasterLabelInsert = NIL;
                                     '',                           // AReceiptNo                 : string = '';
                                     AOnBeforeRePrintLabel )

            else with TPrintLMBomMat(APrintLM_MatObject) do        // PrintLMBomMat.pas: APrintLM_MatObject is preassigned by caller
               DoPrintLMBom( AArinvtId,
                             ALMLabelsID,
                             AStandard_ID,
                             AQty,
                             ALabels,
                             ALotNo,
                             AOrderNo,
                             APono,
                             AArcusto_ID,
                             AIsPallet,
                             ACartons_Pallet,
                             APieces_Carton,
                             APrintExist_Master_Label_ID,
                             nil,                          // AOnGetTotalLabelsCount  : TOnGetTotalLabelsCount = NIL;
                             ASkipMfgExistsValidation,     // ASkipMfgExistsValidation: Real = 0 {0 - default, 1 - yes, 2 - no};
                             AForeignSerial,               // AForeignSerial          : string = '';
                             0 );                          // ADivision_ID            : Real = 0
          end;
  end; // Do case
end;
*)

procedure TFrmTrackSer.wwDBComboDlgConfigChoicesCustomDlg(Sender: TObject);
begin
  TInvDM.AssignArinvtConfigChoices( QryVinARINVT_ID.asFloat );  // Inv_DM.pas
  RefreshDataSetByID( QryVin );
end;

procedure TFrmTrackSer.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQHelpHk.pas}
end;

procedure TFrmTrackSer.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmTrackSer.JumptoInventory1Click(Sender: TObject);
begin
  DoIQJumpToInv( self, QryMasterLblARINVT_ID.asFloat ); {InvtShel.pas}
end;

procedure TFrmTrackSer.JumptoSN1Click(Sender: TObject);
var
  AId:Real;
begin
  AId := QryRepackedToID.asFloat;
  RefreshData( AId );
end;

procedure TFrmTrackSer.PrinterSetUp1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;


procedure TFrmTrackSer.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmTrackSer.JumptoInventory2Click(Sender: TObject);
begin
  DoIQJumpToInv( self, QryVinARINVT_ID.asFloat);
end;

procedure TFrmTrackSer.JumptoBOM1Click(Sender: TObject);
begin
  DoIQJumpToBom( self,  QryVinSTANDARD_ID.asFloat);
end;

procedure TFrmTrackSer.JumptoWO1Click(Sender: TObject);
begin
  DoIQJumpToWorkOrder( self,  QryVinWORKORDER_ID.asFloat);
end;

procedure TFrmTrackSer.JumptoCRMQuote1Click(Sender: TObject);
var
  AId:Real;
begin
  AId := SelectValueFmtAsFloat('select crm_quote_id from crm_quote_detail where id = %f', [QryVinCRM_QUOTE_DETAIL_ID.asFloat]);
  if AId <> 0 then
  // 09/13/2011 Remmed call to, DoCRMQuote().  Internal CRM units should not
  // be called by IQWin32.  (Byron)
  try
     PostMessage(Application.MainForm.Handle, // Main Window Handle
                 iq_JumpToCRMQuote, // Message ID, declared in iqusrmsg.pas
                 Trunc(AId), 0 ); // ID
  except on E:Exception do // in case Cancel was clicked
     if not iqmisc.IgnoreCOMRaisedEAbort(E) then raise;
  end;
end;

procedure TFrmTrackSer.JumptoPackingSlip1Click(Sender: TObject);
begin
  DoJumptoPackingSlipShipment(QryVinSHIPMENTS_ID.asFloat);
end;

procedure TFrmTrackSer.JumptoPostedARInvoice1Click(Sender: TObject);
begin
  DoJumpToInvoice(self, QryVinARINVOICE_ID.asFloat);
end;

procedure TFrmTrackSer.QryVinBeforeInsert(DataSet: TDataSet);
begin
  System.SysUtils.Abort;
end;

procedure TFrmTrackSer.JumptoBOM2Click(Sender: TObject);
begin
  DoIQJumpToBom( self, QryMasterLblSTANDARD_ID.asFloat ); {Bom_Shel.pas}
end;

procedure TFrmTrackSer.PopupMenu1Popup(Sender: TObject);
begin
  JumptoWorkOrder1.Enabled := QryMasterLblWORKORDER_ID.asFloat <> 0;
  JumptoPackingSlip2.Enabled := QryMasterLblSHIPMENT_DTL_ID.asFloat <> 0;
end;

procedure TFrmTrackSer.JumptoWorkOrder1Click(Sender: TObject);
begin
  DoIQJumpToWorkOrder( self, QryMasterLblWORKORDER_ID.asFloat);
end;

procedure TFrmTrackSer.JumptoPackingSlip2Click(Sender: TObject);
begin
  DoJumptoPackingSlipMaintenance(QryMasterLblSHIPMENT_DTL_ID.asFloat);
end;

procedure TFrmTrackSer.CopyCelltoClipboard1Click(Sender: TObject);
begin
  iqstring.CopyStrToClipbrd( StringGrid1.Cells[ StringGrid1.Col, StringGrid1.Row ]);
end;

procedure TFrmTrackSer.sbtnTransPlanClick(Sender: TObject);
var
  ACargo: TInvTransPlanCargo;  // inv_trans_share.pas
  AInvTransPlan_ID: Real;
begin
  // generate on-fly plan
  ACargo:= TInvTransPlanCargo.Create( 0 );
  ACargo.SourceModule:= inv_trans_share.LocatingSrcModuleList[ inv_trans_share.lsmMove ].Value;  // RECV
  ACargo.Kind        := inv_trans_share.cnstLocatingKind;   // LOCATE
  ACargo.Source      := 'master_label';
  ACargo.Source_ID   := QryMasterLblID.asFloat;
  ACargo.IsTemporaryPlan:= TRUE;                           // flag to delete the plan upon exiting the form

  TFrmInvTransPlanBase.DoShow( self, ACargo );             // inv_trans_plan_base.pas
end;

procedure TFrmTrackSer.QryMasterLblAfterScroll(DataSet: TDataSet);
begin
  QryDimInv.Close;
  QryDimInv.ParamByName('aId').Value := QryMasterLblID.asFloat;
  QryDimInv.Open;

  QryMasterLbl2.Close;
  QryMasterLbl2.ParamByName('aId').Value := QryMasterLblID.asFloat;
  QryMasterLbl2.Open;
end;

procedure TFrmTrackSer.NavDimBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  aId:Real;
begin
  if Button = nbInsert then
  begin
    aId := QryDimInvID.asFloat;
    QryDimInv.Close;
    QryDimInv.Locate('ID', aId, []);
    QryDimInv.Close;
    Abort;
  end;
end;

procedure TFrmTrackSer.NavUDBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  aId:Real;
begin
  if Button = nbInsert then
  begin
    aId := QryDimInvID.asFloat;
    QryMasterLbl2.Close;
    QryMasterLbl2.Locate('ID', aId, []);
    QryMasterLbl2.Close;
    Abort;
  end;
end;

procedure TFrmTrackSer.QryDimInvBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;



procedure TFrmTrackSer.QryDimInvBeforeEdit(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrmTrackSer.QryDimInvBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;


procedure TFrmTrackSer.ShowSerialNumbers1Click(Sender: TObject);
begin
  TFrmTranslogMasterLabel.DoShow( self, SrcTransLog ); // translog_master_label.pas
end;

procedure TFrmTrackSer.SRAfterApply(Sender: TObject);
begin
  iqctrl.AutoSizeNavBar(NavTransLog);
  iqctrl.AutoSizeNavBar(NavDim);
//  iqctrl.AutoSizeNavBar(NavUD);
  iqctrl.AutoSizeNavBar(NavVin);
  wwDBComboDlgConfigChoices.Visible := False;
end;

end.
