unit PSTkBatchLabels;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Mask,
  Data.DB,
  Vcl.Wwdatsrc,
  wwcheckbox,
  Vcl.wwDataInspector,
  IQMS.Common.JumpConstants,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.PrintLabels.LabelMatrix,
  IQMS.WebVcl.SecurityRegister,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, uniMainMenu, Vcl.StdCtrls, Vcl.Grids, IQUniGrid, uniGUIFrame,
  uniDateTimePicker, uniDBDateTimePicker, uniComboBox, uniDBComboBox;

type
  TFrmPsTkBatchLabels = class(TUniForm)
    Panel1: TUniPanel;
    pnlHdrTop: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    MainNav: TUniDBNavigator;
    Panel3: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Panel5: TUniPanel;
    NavDetails: TUniDBNavigator;
    pnlHdrLeft1: TUniPanel;
    Splitter2: TUniSplitter;
    pnlHdrClient1: TUniPanel;
    pnlHdrLeft3: TUniPanel;
    Label6: TUniLabel;
    Label11: TUniLabel;
    Label1: TUniLabel;
    pnlHdrClient2: TUniPanel;
    Splitter3: TUniSplitter;
    wwComboBillTo: TUniDBLookupComboBox;
    dbePickTicket: TUniDBEdit;
    pnlHdrLeft4: TUniPanel;
    Label3: TUniLabel;
    Label5: TUniLabel;
    Label13: TUniLabel;
    Panel6: TUniPanel;
    wwDBDateTimePickDate: TUniDBDateTimePicker;
    sbtnLabelsMaintenance: TUniSpeedButton;
    wwLabels: TUniDBLookupComboBox;
    sbnEditBoxNum: TUniSpeedButton;
    Splitter4: TUniSplitter;
    SrcPsTicket: TDataSource;
    QryPsTicket: TFDQuery;
    dbeCustomer: TUniDBEdit;
    QryBillTo: TFDQuery;
    QryBillToATTN: TStringField;
    QryBillToADDR1: TStringField;
    QryBillToADDR2: TStringField;
    QryBillToCITY: TStringField;
    QryBillToSTATE: TStringField;
    QryBillToZIP: TStringField;
    QryBillToID: TBCDField;
    QryPsTicketID: TBCDField;
    QryPsTicketCOMPANY: TStringField;
    QryPsTicketBILL_TO_ATTN: TStringField;
    QryPsTicketBATCH_LABEL_FIRST_BOX: TBCDField;
    QryPsTicketBATCH_LABEL_LM_LABELS_ID: TBCDField;
    QryPsTicketARCUSTO_ID: TBCDField;
    UpdateSQLPS_Ticket: TFDUpdateSQL;
    QryLabelCust: TFDQuery;
    QryLabelCustID: TBCDField;
    QryLabelCustARCUSTO_ID: TBCDField;
    QryLabelCustLABEL_FILE: TStringField;
    QryLabelCustLABEL_MENU_NAME: TStringField;
    QryLabelCustLABEL_TYPE: TStringField;
    QryLabelCustREMOTE_SERVER: TStringField;
    QryLabelCustEPLANT_ID: TBCDField;
    QryLabelCustCOMM_PORT: TStringField;
    QryLabelCustREPORT_NAME: TStringField;
    QryLabelCustLABEL_KIND: TStringField;
    dbeFirstBox: TUniDBEdit;
    QryPsTicketBATCH_LABEL_BILL_TO_ID: TBCDField;
    QryPsTicketBILL_TO_ID: TBCDField;
    SrcPSTicketDtl: TDataSource;
    QryPSTicketDtl: TFDQuery;
    QryPSTicketDtlID: TBCDField;
    QryPSTicketDtlSEQ: TBCDField;
    QryPSTicketDtlITEMNO: TStringField;
    QryPSTicketDtlDESCRIP: TStringField;
    QryPSTicketDtlREV: TStringField;
    QryPSTicketDtlCLASS: TStringField;
    QryPSTicketDtlORDERNO: TStringField;
    QryPSTicketDtlPONO: TStringField;
    QryPSTicketDtlSHIP_QUAN: TFMTBCDField;
    QryPSTicketDtlBATCH_LABEL_STANDARD_ID: TBCDField;
    QryPSTicketDtlBATCH_LABEL_LOTNO: TStringField;
    QryPSTicketDtlBATCH_LABEL_QTY: TBCDField;
    QryPSTicketDtlBATCH_LABEL_WEIGHT: TFMTBCDField;
    QryPSTicketDtlORD_DETAIL_ID: TBCDField;
    QryPSTicketDtlORDERS_ID: TBCDField;
    wwDataInspectorItemInfo: TwwDataInspector;
    wwExpandButtonItemNo: TwwExpandButton;
    UpdateSQLPSTicketDtl: TFDUpdateSQL;
    QryMfgNo: TFDQuery;
    QryPSTicketDtlARINVT_ID: TBCDField;
    QryMfgNoMFGNO: TStringField;
    QryMfgNoID: TBCDField;
    wwDBLookupComboMfg: TUniDBLookupComboBox;
    wwDBLookupComboPkg: TUniDBLookupComboBox;
    QryPackaging: TFDQuery;
    QryPackagingDESCRIP: TStringField;
    QryPackagingITEMNO: TStringField;
    QryPackagingWEIGHT: TFMTBCDField;
    QryPackagingARINVT_ID: TBCDField;
    QryPackagingPTSPER: TFMTBCDField;
    QryPackagingSEQ: TBCDField;
    QryPackagingBOXNO: TBCDField;
    QryPackagingID: TBCDField;
    QryPSTicketDtlBATCH_LABEL_PK_OPMAT_ID: TBCDField;
    QryPSTicketDtlOpmatPtsPer: TFloatField;
    QryPSTicketDtlOpmatWeight: TFloatField;
    QryPSTicketDtlOpmatItemno: TStringField;
    QryPSTicketDtlMfgNo: TStringField;
    QryPSTicketDtlOpmatVolume: TFloatField;
    wwDBComboDlgLabelQty: TUniEdit;
    QryPSTicketDtlBATCH_LABEL_BOX_QTY: TBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    pnlUserFields: TUniPanel;
    splitUserFields: TUniSplitter;
    wwDataInspectorUserFields: TwwDataInspector;
    Panel2: TUniPanel;
    QryPSTicketDtlCUSER1: TStringField;
    QryPSTicketDtlCUSER2: TStringField;
    QryPSTicketDtlCUSER3: TStringField;
    QryPSTicketDtlCUSER4: TStringField;
    QryPSTicketDtlCUSER5: TStringField;
    QryPSTicketDtlCUSER6: TStringField;
    QryPSTicketDtlCUSER7: TStringField;
    QryPSTicketDtlCUSER8: TStringField;
    QryPSTicketDtlCUSER9: TStringField;
    QryPSTicketDtlCUSER10: TStringField;
    QryPSTicketDtlNUSER1: TFMTBCDField;
    QryPSTicketDtlNUSER2: TFMTBCDField;
    QryPSTicketDtlNUSER3: TFMTBCDField;
    QryPSTicketDtlNUSER4: TFMTBCDField;
    QryPSTicketDtlNUSER5: TFMTBCDField;
    QryPSTicketDtlNUSER6: TFMTBCDField;
    QryPSTicketDtlNUSER7: TFMTBCDField;
    QryPSTicketDtlNUSER8: TFMTBCDField;
    QryPSTicketDtlNUSER9: TFMTBCDField;
    QryPSTicketDtlNUSER10: TFMTBCDField;
    sbtnUserFields: TUniSpeedButton;
    QryPSTicketDtlOpmatArinvt_ID: TFloatField;
    StatusBar1: TUniStatusBar;
    SecurityRegister1: TIQWebSecurityRegister;
    QryPSTicketDtlBATCH_LABEL_SELECTED: TStringField;
    sbtnSelectAll: TUniSpeedButton;
    sbtnUnSelectAll: TUniSpeedButton;
    QryPSTicketDtlCUSTNO: TStringField;
    QryPSTicketDtlCOMPANY: TStringField;
    QryPSTicketDtlSHIP_TO_ATTN: TStringField;
    sbtnCalcLabelsQty: TUniSpeedButton;
    Panel7: TUniPanel;
    btnCancel: TUniButton;
    btnPrintAll: TUniButton;
    btnPrintSel: TUniButton;
    Contents1: TUniMenuItem;
    SrcBillTo: TDataSource;
    SrcLableCust: TDataSource;
    SrcMfg: TDataSource;
    SrcPackeging: TDataSource;
    procedure QryPsTicketBeforeOpen(DataSet: TDataSet);
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TNavigateBtn'
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);       }
    procedure sbtnLabelsMaintenanceClick(Sender: TObject);
    procedure sbnEditBoxNumClick(Sender: TObject);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure QryPSTicketDtlCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBComboDlgLabelQtyCustomDlg(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnUserFieldsClick(Sender: TObject);
    procedure SrcPSTicketDtlDataChange(Sender: TObject; Field: TField);
    procedure btnOK1Click(Sender: TObject);
    procedure QryPSTicketDtlBeforePost(DataSet: TDataSet);
    procedure PrintSelected1Click(Sender: TObject);
    procedure sbtnSelectAllClick(Sender: TObject);
    procedure sbtnUnSelectAllClick(Sender: TObject);
    procedure sbtnCalcLabelsQtyClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QryBillToBeforeOpen(DataSet: TDataSet);
    procedure QryLabelCustBeforeOpen(DataSet: TDataSet);
    procedure QryMfgNoBeforeOpen(DataSet: TDataSet);
    procedure QryPackagingBeforeOpen(DataSet: TDataSet);
    procedure pnlHdrTopResize(Sender: TUniControl; OldWidth,
      OldHeight: Integer);
    procedure pnlHdrLeft1Resize(Sender: TUniControl; OldWidth,
      OldHeight: Integer);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FPS_Ticket_ID: Real;
    FLeftPanelWidthRatio: Real;
    FFormIsLoaded: Boolean;
    AFPrintMode: string;
    FBoxesGrandTotalCount: Integer;
    procedure InitForm;
    procedure IQNotify(var Msg: TMessage); message iq_Notify;
    procedure SyncUserDefinedFieldsTo(AArinvt_ID: Real);
    procedure SetUserFieldsVisibleTo(Value: Boolean);
    procedure AssignDataInspectorCaptions(AArinvt_ID: Real);
    procedure ProcessPkTicketItems;
    procedure LoadParams(var AParam: Variant; ARecordsCount, ABatch, ABoxNo: Real;
      ADbfFileName: string);
    procedure RecreateLMPack(var ALMPack: TIQWebLMPackSlip);
    procedure CheckFreeLMPack(var ALMPack: TIQWebLMPackSlip);
    procedure UpdateBatchPickTicketDetails(ASyncUserDefinedFields: string = 'Y');
    procedure GetTotalPrintedLabelsCount(var ACount: Integer);
    procedure CheckResetMasterLabelPSTicketDtl_ID(APS_Ticket_Dtl_ID: Real);
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TNavigateBtn'
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn); }
    procedure SetPs_Ticket_ID(const Value: Real);
  public
    { Public declarations }
    property Ps_Ticket_ID:Real read FPs_Ticket_ID write SetPs_Ticket_ID;
    class procedure DoShowModal(APs_Ticket_ID: Real);
  end;

  //var
  //FrmPsTkBatchLabels: TFrmPsTkBatchLabels;

implementation

{$R *.dfm}


uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  { TODO -oathite -cWebConvert : Dependent on IQLMEdit
  IQLMEdit,}
  { TODO -oathite -cWebConvert : Dependent on IQLMPack_Multi
  IQLMPack_Multi, }
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  IQSecIns, }
  packslip_rscstr,
  IQMS.Common.PanelMsg,
  { TODO -oathite -cWebConvert : Dependent on PSTkPara
  PSTkPara, }
  IQMS.WebVcl.ResourceStrings;

{ TFrmPsTkBatchLabels }

class procedure TFrmPsTkBatchLabels.DoShowModal(APs_Ticket_ID: Real);
var
  LFrmPsTkBatchLabels : TFrmPsTkBatchLabels;
begin
  LFrmPsTkBatchLabels := TFrmPsTkBatchLabels.Create(uniGUIApplication.UniApplication);
  with LFrmPsTkBatchLabels do
    Begin
      Ps_Ticket_ID := APs_Ticket_ID;
      ShowModal;
    end;
end;

procedure TFrmPsTkBatchLabels.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, wwDBGrid1, pnlHdrLeft1]);

  { TODO -oathite -cWebConvert : defination changed so need change the parameter
  pnlHdrLeft1Resize(nil);}

  CheckVistaAdjustSize([wwLabels, wwDBDateTimePickDate]);
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  EnsureSecurityInspectorOnTopOf(self);                }
end;

procedure TFrmPsTkBatchLabels.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG{CHM}, iqhtmSHIP{HTM} ); {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPsTkBatchLabels.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, wwDBGrid1, pnlHdrLeft1]);
end;

procedure TFrmPsTkBatchLabels.IQNotify(var Msg: TMessage);
begin
  InitForm;
end;

procedure TFrmPsTkBatchLabels.QryBillToBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID',
    QryPsTicketARCUSTO_ID.AsLargeInt);
end;

procedure TFrmPsTkBatchLabels.QryLabelCustBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID',
    QryPsTicketID.AsLargeInt);
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID',
    QryPsTicketARCUSTO_ID.AsLargeInt);
end;

procedure TFrmPsTkBatchLabels.QryMfgNoBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARINVT_ID',
    QryPSTicketDtlARINVT_ID.AsLargeInt);
end;

procedure TFrmPsTkBatchLabels.QryPackagingBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARINVT_ID',
    QryPSTicketDtlARINVT_ID.AsLargeInt);
end;

procedure TFrmPsTkBatchLabels.QryPsTicketBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'PS_TICKET_ID',
    Trunc(FPS_Ticket_ID));
end;

procedure TFrmPsTkBatchLabels.InitForm;
var
  hMsg: TPanelMesg;
begin
  hMsg := hPleaseWait('');
  try
    {default date}
    wwDBDateTimePickDate.DateTime := Date;

    {edit first box button}
    sbnEditBoxNumClick(nil);

    {bill_to}
    if (QryPsTicketBATCH_LABEL_BILL_TO_ID.AsLargeInt = 0) and
    (QryPsTicketBILL_TO_ID.AsLargeInt > 0) then
    begin
      QryPsTicket.Edit;
      QryPsTicketBATCH_LABEL_BILL_TO_ID.AsLargeInt := QryPsTicketBILL_TO_ID.AsLargeInt;
    end;

    {lm_labels}
    if (QryPsTicketBATCH_LABEL_LM_LABELS_ID.AsLargeInt = 0) and
      (QryLabelCustID.AsLargeInt > 0) then
    begin
      QryPsTicket.Edit;
      QryPsTicketBATCH_LABEL_LM_LABELS_ID.AsLargeInt := QryLabelCustID.AsLargeInt;
    end;

    {first box}
    if (QryPsTicketBATCH_LABEL_FIRST_BOX.AsFloat = 0) then
    begin
      QryPsTicket.Edit;
      QryPsTicketBATCH_LABEL_FIRST_BOX.AsFloat := 1;
    end;
    QryPsTicket.CheckBrowseMode;

    hMsg.Mesg := packslip_rscstr.cTXT0000035; //'Processing pick ticket details...';
    UpdateBatchPickTicketDetails;

  finally
    hMsg.Free;
  end;

  FFormIsLoaded := True;
end;

procedure TFrmPsTkBatchLabels.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActiveEx(True, self, packslip_rscstr.cTXT0000034 );

  SetUserFieldsVisibleTo(False);

  PostMessage(Handle, iq_Notify, 0, 0); {IQMS.Common.JumpConstants.pas}
end;

procedure TFrmPsTkBatchLabels.UpdateBatchPickTicketDetails(ASyncUserDefinedFields: string = 'Y');
begin
  // TODO: Create an Oracle package procedure to handle this.
  // There is no reason for this to be handled by the front end.
  ExecuteCommandFmt(
    'declare                                                          ' +
    '  v_ps_ticket_id  number::= %f;                                  ' +
    '  v_weight        number;                                        ' +
    '  v_pts_per       number;                                        ' +
    '  v_qty           number;                                        ' +
    '  v_sync_ud       varchar2(1)::= ''%s'';                         ' +

    //---------------------------------------------------------------
    '  function get_pk_opmat_id                                       ' +
    '    ( v_standard_id number,                                      ' +
    '      v_arinvt_id   number )                                     ' +
    '    return number                                                ' +
    '  as                                                             ' +
    '    v_result number;                                             ' +
    '  begin                                                          ' +
    '    if nvl(v_standard_id,0) = 0 or nvl(v_arinvt_id,0) = 0 then   ' +
    '       return 0;                                                 ' +
    '    end if;                                                      ' +

    //try use_for_label_print
    '    begin                                                        ' +
    '        select x.id into v_result                                ' +
    '          from                                                   ' +
    '              ( select o.id                                      ' +
    '                  from partno p, ptoper t, opmat o, arinvt a     ' +
    '                 where p.arinvt_id = v_arinvt_id                 ' +
    '                   and p.standard_id = v_standard_id             ' +
    '                   and t.partno_id = p.id                        ' + //ptoper
    '                   and t.sndop_id = o.sndop_id                   ' + //opmat
    '                   and o.arinvt_id = a.id                        ' +
    '                   and a.class = ''PK''                          ' +
    '                   and t.use_for_label_print = ''Y''             ' +
    '                 order by o.seq                                  ' +
    '               ) x                                               ' +
    '         where rownum < 2;                                       ' +
    '    exception when no_data_found then                            ' +
    '      v_result:= 0;                                              ' +
    '    end;                                                         ' +

    '    if v_result > 0 then                                         ' +
    '       return v_result;                                          ' +
    '    end if;                                                      ' +

    //default to 1st sequence
    '    begin                                                        ' +
    '        select x.id into v_result                                ' +
    '          from                                                   ' +
    '              ( select o.id                                      ' +
    '                  from partno p, ptoper t, opmat o, arinvt a     ' +
    '                 where p.arinvt_id = v_arinvt_id                 ' +
    '                   and p.standard_id = v_standard_id             ' +
    '                   and t.partno_id = p.id                        ' + //ptoper
    '                   and t.sndop_id = o.sndop_id                   ' + //opmat
    '                   and o.arinvt_id = a.id                        ' +
    '                   and a.class = ''PK''                          ' +
    '                 order by o.seq                                  ' +
    '               ) x                                               ' +
    '         where rownum < 2;                                       ' +
    '     return v_result;                                            ' +
    '   exception when no_data_found then                             ' +
    '     return 0;                                                   ' +
    '   end;                                                          ' +
    '  end;                                                           ' +

    //---------------------------------------------------------------
    '  procedure assign_pts_per                                       ' +
    '    ( v_ps_ticket_dtl_id number )                                ' +
    '  as                                                             ' +
    '  begin                                                          ' +
    '    v_weight ::= 0;                                              ' +
    {'    if v_opmat_id = 0 then                                       '+
     '       return;                                                   '+
     '    end if;                                                      '+
     '                                                                 '+
     '    select nvl(o.ptsper_disp,0), nvl(o.weight,0) into v_pts_per, v_weight from opmat o where o.id = v_opmat_id; '+
    }
    '    v_weight:= pk_tkt.get_ticket_detail_bol_weight( v_ps_ticket_dtl_id ); ' +

    '    select pts_per_pkg into v_pts_per from ps_ticket_dtl where id = v_ps_ticket_dtl_id; ' +

    '    if nvl(v_pts_per,0) = 0 then                                 ' +
    '       v_pts_per::= 1;                                           ' +
    '    end if;                                                      ' +
    '  end;                                                           ' +

    //---------------------------------------------------------------
    '  procedure sync_user_defined_fields                             ' +
    '    ( v_arinvt_id number,                                        ' +
    '      v_ps_ticket_dtl_id number )                                ' +
    '  as                                                             ' +
    '  begin                                                          ' +
    '    update ps_ticket_dtl                                         ' +
    '       set (cuser1,                                              ' +
    '            cuser2,                                              ' +
    '            cuser3,                                              ' +
    '            cuser4,                                              ' +
    '            cuser5,                                              ' +
    '            cuser6,                                              ' +
    '            cuser7,                                              ' +
    '            cuser8,                                              ' +
    '            cuser9,                                              ' +
    '            cuser10,                                             ' +
    '            nuser1,                                              ' +
    '            nuser2,                                              ' +
    '            nuser3,                                              ' +
    '            nuser4,                                              ' +
    '            nuser5,                                              ' +
    '            nuser6,                                              ' +
    '            nuser7,                                              ' +
    '            nuser8,                                              ' +
    '            nuser9,                                              ' +
    '            nuser10) = (select cuser1,                           ' +
    '                               cuser2,                           ' +
    '                               cuser3,                           ' +
    '                               cuser4,                           ' +
    '                               cuser5,                           ' +
    '                               cuser6,                           ' +
    '                               cuser7,                           ' +
    '                               cuser8,                           ' +
    '                               cuser9,                           ' +
    '                               cuser10,                          ' +
    '                               nuser1,                           ' +
    '                               nuser2,                           ' +
    '                               nuser3,                           ' +
    '                               nuser4,                           ' +
    '                               nuser5,                           ' +
    '                               nuser6,                           ' +
    '                               nuser7,                           ' +
    '                               nuser8,                           ' +
    '                               nuser9,                           ' +
    '                               nuser10                           ' +
    '                          from arinvt where id = v_arinvt_id )   ' +
    '     where id = v_ps_ticket_dtl_id;                              ' +
    '  end;                                                           ' +
    //---------------------------------------------------------------
    'begin                                                            ' +
    '  for v in ( select td.id as ps_ticket_dtl_id,                   ' +
    '                    nvl(td.batch_label_standard_id,0) as batch_label_standard_id, ' +
    '                    nvl(td.batch_label_pk_opmat_id,0) as batch_label_pk_opmat_id, ' +
    '                    nvl(td.batch_label_weight,0) as batch_label_weight,           ' +
    '                    nvl(td.batch_label_qty,0) as batch_label_qty,                 ' +
    '                    nvl(a.standard_id,0) as default_standard_id,                  ' +
    '                    nvl(td.ship_quan * NVL(d.uom_factor,1),0) as ship_quan,       ' +
    '                    d.arinvt_id                                                   ' +
    '               from                                              ' +
    '                    ps_ticket_dtl td,                            ' +
    '                    orders o,                                    ' +
    '                    ord_detail d,                                ' +
    '                    arinvt a                                     ' +
    '                                                                 ' +
    '              where td.ps_ticket_id = v_ps_ticket_id             ' +
    '                and td.ord_detail_id = d.id(+)                   ' +
    '                and d.orders_id = o.id(+)                        ' +
    '                and d.arinvt_id = a.id(+)                        ' +
    '             order by td.seq )                                   ' +
    '  loop                                                           ' +
    //mfg #
    '     if v.batch_label_standard_id = 0 and v.default_standard_id > 0 then                                        '
    +
    '        update ps_ticket_dtl set batch_label_standard_id = v.default_standard_id where id = v.ps_ticket_dtl_id; '
    +
    '        v.batch_label_standard_id::= v.default_standard_id;      ' +
    '     end if;                                                     ' +

    //packaging
    '     if v.batch_label_pk_opmat_id = 0 then                       ' +
    '        v.batch_label_pk_opmat_id::= get_pk_opmat_id( v.batch_label_standard_id, v.arinvt_id );                        '
    +
    '        if v.batch_label_pk_opmat_id > 0 then                    ' +
    '           update ps_ticket_dtl set batch_label_pk_opmat_id = v.batch_label_pk_opmat_id where id = v.ps_ticket_dtl_id; '
    +
    '        end if;                                                  ' +
    '     end if;                                                     ' +

    //assign pts_per and weight
    {'     assign_pts_per(v.batch_label_pk_opmat_id);                  '}
    '     assign_pts_per(v.ps_ticket_dtl_id);                         ' +

    //box_qty
    '     update ps_ticket_dtl set batch_label_box_qty = v_pts_per where id = v.ps_ticket_dtl_id; '
    +

    //how many labels
    '     if v.batch_label_qty = 0 then                               ' +
    '        v_qty::= trunc(v.ship_quan / v_pts_per + 0.999999);      ' +
    '        if v_qty = 0 then                                        ' +
    '           v_qty::= trunc(v.ship_quan);                          ' +
    '        end if;                                                  ' +
    '        update ps_ticket_dtl set batch_label_qty = v_qty where id = v.ps_ticket_dtl_id; ' +
    '     end if;                                                     ' +
    '                                                                 ' +
    //weight
    '     if v.batch_label_weight = 0 and v_weight > 0 then           ' +
    '        update ps_ticket_dtl set batch_label_weight = v_weight where id = v.ps_ticket_dtl_id; ' +
    '     end if;                                                     ' +
    '                                                                 ' +
    //user defined
    '     if v_sync_ud = ''Y'' then                                   ' +
    '        sync_user_defined_fields( v.arinvt_id, v.ps_ticket_dtl_id); ' +
    '     end if;                                                     ' +
    '  end loop;                                                      ' +
    'end;',
    [FPS_Ticket_ID,
    ASyncUserDefinedFields]);

  Reopen(QryPSTicketDtl);
end;

procedure TFrmPsTkBatchLabels.SyncUserDefinedFieldsTo(AArinvt_ID: Real);
var
  I: Integer;
  A: Variant;

  procedure AssignCUser(AField: TField; AValue: string);
  begin
    if AField.IsNull and (AValue > '') then
    begin
      QryPSTicketDtl.Edit;
      AField.asString := AValue;
    end;
  end;

  procedure AssignNUser(AField: TField; AValue: Real);
  begin
    if AField.IsNull and (AValue <> 0) then
    begin
      QryPSTicketDtl.Edit;
      AField.asFloat := AValue;
    end;
  end;

begin
  if AArinvt_ID = 0 then
    Exit;

  {copy over from arinvt. assumes ps_ticket_dtl is positioned}
  A := SelectValueArrayFmt(
    'select cuser1, ' +
    'cuser2, ' +
    'cuser3, ' +
    'cuser4, ' +
    'cuser5, ' +
    'cuser6, ' +
    'cuser7, ' +
    'cuser8, ' +
    'cuser9, ' +
    'cuser10, ' +
    'nuser1, ' +
    'nuser2, ' +
    'nuser3, ' +
    'nuser4, ' +
    'nuser5, ' +
    'nuser6, ' +
    'nuser7, ' +
    'nuser8, ' +
    'nuser9, ' +
    'nuser10 from arinvt where id = %f', [AArinvt_ID]);
  if VarArrayDimCount(A) > 0 then
    for I := 1 to 10 do
    begin
      AssignCUser(QryPSTicketDtl.FieldByName('CUSER' + IntToStr(I)), A[I - 1]);
      AssignNUser(QryPSTicketDtl.FieldByName('NUSER' + IntToStr(I)), A[I - 1 + 10]);
    end;
end;

procedure TFrmPsTkBatchLabels.AssignDataInspectorCaptions(AArinvt_ID: Real);
var
  AParentName: string;

  procedure AssignUserDefinedParentFormName;
  var
    AClass: string;
  begin
    AClass := SelectValueByID('class', 'arinvt', AArinvt_ID);
    AParentName := AClass + '_Inv';
  end;

  procedure AssignCaption(ATagString, ACorrespondingComponentName: string);
  var
    S: string;
  begin
    {get user defined label caption from FrmLM_Pack form}
    S := SelectValueFmtAsString
      ('select user_text from userdef where app_name = ''IQWIN32.EXE'' and parent_name = ''%s'' and component_name = ''%s''',
      [AParentName, ACorrespondingComponentName]);
    if S > '' then
      wwDataInspectorUserFields.GetItemByTagString(ATagString).Caption := S;
  end;

begin
  AssignUserDefinedParentFormName;

  AssignCaption('CUSER1', 'IQUserDefLabel1');
  AssignCaption('CUSER2', 'IQUserDefLabel2');
  AssignCaption('CUSER3', 'IQUserDefLabel3');
  AssignCaption('CUSER4', 'IQUserDefLabel7');
  AssignCaption('CUSER5', 'IQUserDefLabel8');
  AssignCaption('CUSER6', 'IQUserDefLabel9');
  AssignCaption('CUSER7', 'IQUserDefLabel10');
  AssignCaption('CUSER8', 'IQUserDefLabel11');
  AssignCaption('CUSER9', 'IQUserDefLabel12');
  AssignCaption('CUSER10', 'IQUserDefLabel13');
  AssignCaption('NUSER1', 'IQUserDefLabel4');
  AssignCaption('NUSER2', 'IQUserDefLabel5');
  AssignCaption('NUSER3', 'IQUserDefLabel6');
  AssignCaption('NUSER4', 'IQUserDefLabel14');
  AssignCaption('NUSER5', 'IQUserDefLabel15');
  AssignCaption('NUSER6', 'IQUserDefLabel16');
  AssignCaption('NUSER7', 'IQUserDefLabel17');
  AssignCaption('NUSER8', 'IQUserDefLabel18');
  AssignCaption('NUSER9', 'IQUserDefLabel19');
  AssignCaption('NUSER10', 'IQUserDefLabel20');
end;

{ TODO -oathite -cWebConvert : 'TNavigateBtn' is not a type identifier
procedure TFrmPsTkBatchLabels.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID(TUniDBNavigator(Sender).DataSource.DataSet);
    Abort;
  end;
end;             }

procedure TFrmPsTkBatchLabels.sbtnLabelsMaintenanceClick(Sender: TObject);
begin
  {DoLabelMaintenance(self); {IQLMEdit.pas}
  Reopen(QryLabelCust);
end;

procedure TFrmPsTkBatchLabels.sbnEditBoxNumClick(Sender: TObject);
begin
  with dbeFirstBox do
    if sbnEditBoxNum.Down then
    begin
      sbnEditBoxNum.Hint := IQMS.WebVcl.ResourceStrings.cTXT0000133;
      //'The first Box Number is editable.'#13'Click to swich to Read Only.'
      readonly := False;
      Color := clWindow;
    end
    else
    begin
      sbnEditBoxNum.Hint := IQMS.WebVcl.ResourceStrings.cTXT0000134;
      //'The first Box Number is Read Only.'#13'Click to edit.'
      readonly := True;
      Color := clBtnFace;
    end;
end;

procedure TFrmPsTkBatchLabels.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then
    Exit;

  if Field.ReadOnly then
    ABrush.Color := clBtnFace;

  if Field = QryPSTicketDtlBATCH_LABEL_SELECTED then
    ABrush.Color := clSilver;
end;

procedure TFrmPsTkBatchLabels.QryPSTicketDtlCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  QryPSTicketDtlOpmatPtsPer.asFloat := 1;

  if QryPSTicketDtlBATCH_LABEL_PK_OPMAT_ID.AsLargeInt > 0 then
  begin
    A := SelectValueArrayFmt
      ('select o.ptsper_disp, o.weight, a.itemno, a.volume, a.id from opmat o, arinvt a ' +
      ' where o.id = %d and o.arinvt_id = a.id',
      [QryPSTicketDtlBATCH_LABEL_PK_OPMAT_ID.AsLargeInt]);
    if VarArrayDimCount(A) > 0 then
    begin
      QryPSTicketDtlOpmatPtsPer.asFloat := System.Variants.VarAsType(A[0], varDouble);
      QryPSTicketDtlOpmatWeight.asFloat := System.Variants.VarAsType(A[1], varDouble);
      QryPSTicketDtlOpmatItemno.asString := System.Variants.VarAsType(A[2], varDouble);
      QryPSTicketDtlOpmatVolume.asFloat := System.Variants.VarAsType(A[3], varDouble);
      QryPSTicketDtlOpmatArinvt_ID.AsLargeInt := System.Variants.VarAsType(A[4], varUInt64);
    end;
  end;

  if QryPSTicketDtlBATCH_LABEL_STANDARD_ID.AsLargeInt > 0 then
    QryPSTicketDtlMfgNo.asString := SelectValueByID('mfgno', 'standard',
      QryPSTicketDtlBATCH_LABEL_STANDARD_ID.AsLargeInt);

  QryPSTicketDtlMfgNo.asString := SelectValueFmtAsString(
    'SELECT mfgno FROM standard WHERE id = %d',
    [QryPSTicketDtlBATCH_LABEL_STANDARD_ID.AsLargeInt]);
end;

procedure TFrmPsTkBatchLabels.wwDBComboDlgLabelQtyCustomDlg(Sender: TObject);
begin
  with QryPSTicketDtl do
  begin
    Edit;
    try
      QryPSTicketDtlBATCH_LABEL_QTY.AsFloat :=
        Trunc(QryPSTicketDtlSHIP_QUAN.AsFloat / QryPSTicketDtlBATCH_LABEL_BOX_QTY.AsFloat +
        0.999999);
    except
      QryPSTicketDtlBATCH_LABEL_QTY.AsFloat := 0;
    end;
    if QryPSTicketDtlBATCH_LABEL_QTY.AsFloat = 0 then
      QryPSTicketDtlBATCH_LABEL_QTY.AsFloat := Trunc(QryPSTicketDtlSHIP_QUAN.AsFloat);
  end;
end;

procedure TFrmPsTkBatchLabels.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmPsTkBatchLabels.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPsTkBatchLabels.pnlHdrLeft1Resize(Sender: TUniControl; OldWidth,
  OldHeight: Integer);
begin
  FLeftPanelWidthRatio := pnlHdrLeft1.Width / pnlHdrTop.Width;
end;

procedure TFrmPsTkBatchLabels.pnlHdrTopResize(Sender: TUniControl; OldWidth,
  OldHeight: Integer);
begin
  if FLeftPanelWidthRatio > 0 then
    pnlHdrLeft1.Width := Round(FLeftPanelWidthRatio * pnlHdrTop.Width);
end;

procedure TFrmPsTkBatchLabels.SetPs_Ticket_ID(const Value: Real);
begin
  FPs_Ticket_ID := Value;
  ExecuteCommandFmt(
    'update ps_ticket_dtl set batch_label_standard_id = 0 ' +
    'where ps_ticket_id = %f and batch_label_standard_id is null',
    [FPS_Ticket_ID]);
  ExecuteCommandFmt(
    'update ps_ticket_dtl set batch_label_pk_opmat_id = 0 ' +
    'where ps_ticket_id = %f and batch_label_pk_opmat_id is null',
    [FPS_Ticket_ID]);
end;

procedure TFrmPsTkBatchLabels.SetUserFieldsVisibleTo(Value: Boolean);
begin
  splitUserFields.Visible := Value;
  pnlUserFields.Visible := Value;

  // ensure proper stack up seq
  if Value then
  begin
    pnlUserFields.Left := 0;
    splitUserFields.Left := 0;
  end;
end;

procedure TFrmPsTkBatchLabels.sbtnUserFieldsClick(Sender: TObject);
begin
  SetUserFieldsVisibleTo(not pnlUserFields.Visible);
end;

procedure TFrmPsTkBatchLabels.SrcPSTicketDtlDataChange(Sender: TObject;
  Field: TField);
begin
  if Assigned(QryPSTicketDtl) and (QryPSTicketDtl.State = dsBrowse) then //and FFormIsLoaded then
    AssignDataInspectorCaptions(QryPSTicketDtlARINVT_ID.AsFloat);
end;

procedure TFrmPsTkBatchLabels.btnOK1Click(Sender: TObject);
begin
  QryPsTicket.CheckBrowseMode;
  QryPSTicketDtl.CheckBrowseMode;
  AFPrintMode := 'ALL';

  // packslip_rscstr.cTXT0000238 =
  // 'You are about to print batch of labels. Do you want to continue?';
  if not IQConfirmYN(packslip_rscstr.cTXT0000238) then
    Abort;

  ProcessPkTicketItems;

  ModalResult := mrOK;
end;

procedure TFrmPsTkBatchLabels.ProcessPkTicketItems;
var
  ARecordsCount: Real;
  ABatch: Real;
  ADbfFileName: string;
  ABoxNo: Real;
  AParam: Variant;
  ALMPack: TIQWebLMPackSlip;
begin
  ARecordsCount := 1;
  // because we allow FAccumulateMultipleRecordsCount <= 1 in IQLMBase when detemining
  ABatch := 0; // dbf name I had to start with 1 instead of 0 and because of that the ARecordsCount
  ADbfFileName := ''; // will actually be 1 more than printed records
  ABoxNo := QryPsTicketBATCH_LABEL_FIRST_BOX.AsFloat;
  ALMPack := nil;

  // Calc total number of labels that are going to be printed.
  // Used in GetTotalPrintedLabelsCount callback method
  FBoxesGrandTotalCount := SelectValueFmtAsInteger(
    'select sum(batch_label_qty) from ps_ticket_dtl where ps_ticket_id = %d ' +
    '   and ( ''%s'' = ''ALL'' or ''%s'' = ''SELECTED'' and NVL(batch_label_selected, ''N'') = ''Y'') ',
    [QryPsTicketID.AsLargeInt, AFPrintMode, AFPrintMode]);

  // packslip_rscstr.cTXT0000239 = 'Processing.  Please wait.';
  { TODO -oathite -cWebConvert : Undeclared identifier: 'SimpleText'
  StatusBar1.SimpleText := packslip_rscstr.cTXT0000239;              }
  try
    QryPSTicketDtl.First;
    while not QryPSTicketDtl.Eof do
    begin
      // packslip_rscstr.cTXT0000240 = 'Processing # %d, Item # %s...';
      { TODO -oathite -cWebConvert : Undeclared identifier: 'SimpleText'
      StatusBar1.SimpleText := Format(packslip_rscstr.cTXT0000240,
        [QryPSTicketDtlSEQ.asInteger, QryPSTicketDtlITEMNO.asString]);    }
      StatusBar1.Update;

      if (AFPrintMode = 'ALL') or (AFPrintMode = 'SELECTED') and
        (QryPSTicketDtlBATCH_LABEL_SELECTED.asString = 'Y') then
      begin
        // create LM shell object
        RecreateLMPack(ALMPack);

        // load AParam variant with all the goodies
        LoadParams(AParam, ARecordsCount, ABatch, ABoxNo, ADbfFileName);

        // 12-11-2014 check reset ps_ticket_dtl_id in master label,
        // so during packing slip conversion we wont populate shipment_dtl_id
        // which in turn impacts BOL calcs. See shipment package.
        // EIQ-5283 Pick Ticket - BOL calculation is incorrect when
        // printing batch labels from pick ticket multiple
        CheckResetMasterLabelPSTicketDtl_ID(QryPSTicketDtlID.AsFloat);

        // append to master label and dbf or table
        // In IQLMPack_Multi.pas
        { TODO -oathite -cWebConvert : Dependent on IQLMPack_Multi
        TFrmLM_Pack_Multi.AppendLabels(ALMPack, AParam, GetTotalPrintedLabelsCount);}


        // Update back the vars to keep track
        ABoxNo := AParam[7] + QryPSTicketDtlBATCH_LABEL_QTY.AsFloat;
        ABatch := AParam[35]; {the batch and file name really get updated}
        ADbfFileName := AParam[36]; {only once - the first time we use it}
        ARecordsCount := AParam[37];
      end;

      QryPSTicketDtl.Next;
    end;

    {reuse last ALMPack object to print labels by just launching ProcessExec in IQLMBase}
    if ARecordsCount > 1 then
      ALMPack.Child.ProcessExec; {print the labels!}

  finally
    { TODO -oathite -cWebConvert : Undeclared identifier: 'SimpleText'
    StatusBar1.SimpleText := '';}
    CheckFreeLMPack(ALMPack);
  end;
end;

procedure TFrmPsTkBatchLabels.CheckFreeLMPack(var ALMPack: TIQWebLMPackSlip);
begin
  if Assigned(ALMPack) then
    try
      if Assigned(ALMPack.Child) then
        ALMPack.Child.Free;
      ALMPack.Free;
    finally
      ALMPack := nil;
    end;
end;

procedure TFrmPsTkBatchLabels.RecreateLMPack(var ALMPack: TIQWebLMPackSlip);
begin
  CheckFreeLMPack(ALMPack);
  ALMPack := TIQWebLMPackSlip.Create(self);
end;

procedure TFrmPsTkBatchLabels.LoadParams(var AParam: Variant; ARecordsCount, ABatch, ABoxNo: Real;
  ADbfFileName: string);
begin
  // load params. assumes QryPSTicketDtl is positioned
  AParam := VarArrayCreate([0, 37], varVariant);
  AParam[0] := QryPSTicketDtlARINVT_ID.AsLargeInt; //0 - arinvt_id
  AParam[1] := QryPSTicketDtlORDERS_ID.AsLargeInt; //1 - orders_id
  AParam[2] := QryPSTicketDtlSHIP_QUAN.AsFloat; //2 - ship_qty
  AParam[3] := QryPSTicketDtlID.AsLargeInt; //3 - ps_ticket_tl_id
  AParam[4] := QryPSTicketDtlORD_DETAIL_ID.AsLargeInt; //4 - ord_detail_id
  AParam[5] := QryPSTicketDtlBATCH_LABEL_STANDARD_ID.AsLargeInt; //5 - standard_id
  AParam[6] := QryPSTicketDtlBATCH_LABEL_BOX_QTY.AsFloat; //6 - ptsper
  AParam[7] := ABoxNo; //7 - boxno
  AParam[8] := QryPSTicketDtlOpmatArinvt_ID.AsLargeInt; //8 - opmat_pk_arinvt_id
  AParam[9] := QryPSTicketDtlBATCH_LABEL_QTY.AsFloat; //9 - label_count
  AParam[10] := QryPSTicketDtlBATCH_LABEL_LOTNO.asString; //10- lotno
  AParam[11] := QryPSTicketDtlBATCH_LABEL_WEIGHT.AsFloat; //11- weight
  AParam[12] := wwDBDateTimePickDate.DateTime; //12- date
  AParam[13] := QryPsTicketBATCH_LABEL_BILL_TO_ID.AsLargeInt; //13- bill_to_id
  AParam[14] := QryPsTicketBATCH_LABEL_LM_LABELS_ID.AsLargeInt; //14- lm_labels_id
  AParam[15] := QryPSTicketDtlCUSER1.asString; //15- cuser1
  AParam[16] := QryPSTicketDtlCUSER2.asString; //16- cuser2
  AParam[17] := QryPSTicketDtlCUSER3.asString; //17- cuser3
  AParam[18] := QryPSTicketDtlCUSER4.asString; //18- cuser4
  AParam[19] := QryPSTicketDtlCUSER5.asString; //19- cuser5
  AParam[20] := QryPSTicketDtlCUSER6.asString; //20- cuser6
  AParam[21] := QryPSTicketDtlCUSER7.asString; //21- cuser7
  AParam[22] := QryPSTicketDtlCUSER8.asString; //22- cuser8
  AParam[23] := QryPSTicketDtlCUSER9.asString; //23- cuser9
  AParam[24] := QryPSTicketDtlCUSER10.asString; //24- cuser10
  AParam[25] := QryPSTicketDtlNUSER1.AsFloat; //25- nuser1
  AParam[26] := QryPSTicketDtlNUSER2.AsFloat; //26- nuser2
  AParam[27] := QryPSTicketDtlNUSER3.AsFloat; //27- nuser3
  AParam[28] := QryPSTicketDtlNUSER4.AsFloat; //28- nuser4
  AParam[29] := QryPSTicketDtlNUSER5.AsFloat; //29- nuser5
  AParam[30] := QryPSTicketDtlNUSER6.AsFloat; //30- nuser6
  AParam[31] := QryPSTicketDtlNUSER7.AsFloat; //31- nuser7
  AParam[32] := QryPSTicketDtlNUSER8.AsFloat; //32- nuser8
  AParam[33] := QryPSTicketDtlNUSER9.AsFloat; //33- nuser9
  AParam[34] := QryPSTicketDtlNUSER10.AsFloat; //34- nuser10
  AParam[35] := ABatch; //35- batch for crw label report
  AParam[36] := ADbfFileName; //36- dbffile for lm label
  AParam[37] := ARecordsCount; //37- AccumulateMultipleRecordsCount
end;

procedure TFrmPsTkBatchLabels.QryPSTicketDtlBeforePost(DataSet: TDataSet);
begin
  if (QryPSTicketDtlBATCH_LABEL_STANDARD_ID.AsLargeInt = 0) and
    not (QryMfgNo.Eof and QryMfgNo.Bof) then
    // packslip_rscstr.cTXT0000241 = 'Please assign a MFG #';
    raise Exception.Create(packslip_rscstr.cTXT0000241);

  if (QryPSTicketDtlBATCH_LABEL_PK_OPMAT_ID.AsFloat = 0) and
    not (QryPackaging.Eof and QryPackaging.Bof) then
    // packslip_rscstr.cTXT0000242 = 'Please assign packaging.';
    raise Exception.Create(packslip_rscstr.cTXT0000242);
end;

procedure TFrmPsTkBatchLabels.PrintSelected1Click(Sender: TObject);
begin
  QryPSTicketDtl.CheckBrowseMode;

  // packslip_rscstr.cTXT0000243 = 'Please select a record.';
  IQAssert(SelectValueFmtAsInteger(
    'select count(*) from ps_ticket_dtl ' +
    'where ps_ticket_id = %f and batch_label_selected = ''Y''',
    [FPS_Ticket_ID]) > 0,
    packslip_rscstr.cTXT0000243);

  AFPrintMode := 'SELECTED';

  // packslip_rscstr.cTXT0000238 =
  // 'You are about to print batch of labels. Do you want to continue?';
  if not IQConfirmYN(packslip_rscstr.cTXT0000238) then
    Abort;

  ProcessPkTicketItems;

  ModalResult := mrOK;
end;

procedure TFrmPsTkBatchLabels.sbtnSelectAllClick(Sender: TObject);
begin
  ExecuteCommandFmt(
    'update ps_ticket_dtl set batch_label_selected = ''Y'' where ps_ticket_id = %f',
    [FPS_Ticket_ID]);
  Reopen(QryPSTicketDtl);
end;

procedure TFrmPsTkBatchLabels.sbtnUnSelectAllClick(Sender: TObject);
begin
  ExecuteCommandFmt(
    'update ps_ticket_dtl set batch_label_selected = ''N'' where ps_ticket_id = %f',
    [FPS_Ticket_ID]);
  Reopen(QryPSTicketDtl);
end;

procedure TFrmPsTkBatchLabels.sbtnCalcLabelsQtyClick(Sender: TObject);
begin
  // packslip_rscstr.cTXT0000244 =
  // 'Are you sure you want to calculate all the labels quantities?';
  if not IQConfirmYN(packslip_rscstr.cTXT0000244) then
    Exit;

  ExecuteCommandFmt(
    'update ps_ticket_dtl set batch_label_qty = 0 where ps_ticket_id = %f',
    [FPS_Ticket_ID]);
  UpdateBatchPickTicketDetails('N'); {N = ASyncUserDefinedFields}
end;

procedure TFrmPsTkBatchLabels.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(self.HelpContext); {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPsTkBatchLabels.GetTotalPrintedLabelsCount(var ACount: Integer);
begin
  // Normally passed ACount represents TBOXNO - total box count
  // for the item being printed. Since we are printing a batch
  // of items we need the total of all the boxes for all items
  ACount := FBoxesGrandTotalCount;
end;

procedure TFrmPsTkBatchLabels.CheckResetMasterLabelPSTicketDtl_ID(APS_Ticket_Dtl_ID: Real);
begin
  //clear master_label from previous batch print that populated the ps_ticket_dtl_id
  // In PSTkPara.pas
  { TODO -oathite -cWebConvert : Depends on PsTkPara
  if not GetPK_TKT_ASSIGN_ASN_ON_PRINT_LBL then
    Exit;
  }

  ExecuteCommandFmt(
    'update master_label              ' +
    '    set ps_ticket_dtl_id = null  ' +
    '  where ps_ticket_dtl_id = %f    ' +
    '    and ps_ticket_rel_id is null ' +
    '    and shipment_dtl_id is null  ',
    [APS_Ticket_Dtl_ID]);
end;

end.
