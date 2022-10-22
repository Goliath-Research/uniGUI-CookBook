unit CD_Main;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  DM_CD,
  Vcl.Menus,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  Data.DB,
  CDVendor,
  CDInv,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.Time,
  IQMS.Common.PanelMsg,
  IQMS.WebVcl.Tab,
  IQMS.WebVcl.Search,
  Vcl.Wwkeycb,
  IQMS.WebVcl.Hpick,
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
  IQMS.Common.StringUtils,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, vcl.wwdbgrid, IQMS.WebVcl.Strings, uniDateTimePicker,
  uniDBDateTimePicker, IQUniGrid, uniGUIFrame;

const FPkBankSql = 'select b.id              as id,               ' +
                   '       b.account_number  as account_number,   ' +
                   '       b.description     as description,      ' +
                   '       b.last_checkno    as last_checkno,     ' +
                   '       b.eplant_id       as eplant_id,        ' +
                   '       a.acct            as acct,             ' +
                   '       a.descrip         as descrip           ' +
                   '  from bankinfo_dtl b, glacct a, bankinfo c   ' +
                   'where b.glacct_id_cash = a.id                 ' +
                   '  and b.bankinfo_id = c.id ' +
                   '  and NVL(b.pk_hide, ''N'') <> ''Y'' ' +
                   '  and NVL(c.pk_hide, ''N'') <> ''Y'' ' +
                   '  and (misc.eplant_filter(b.eplant_id) = 1 or b.eplant_id is null) ';



const fSql1 = 'select v.id, ' +
             'v.vendor_id, ' +
             'v.on_hold, ' +
             'v.invoice_no, ' +
             'v.invoice_amount, ' +
             'v.terms_id, ' +
             'v.invoice_date, ' +
             'v.due_date, ' +
             'v.discount_days, ' +
             'v.discount, ' +
             'v.amount_paid, ' +
             'v.discount_taken, ' +
             'v.amount_to_pay, ' +
             'v.amount_to_pay  actual_amt_to_pay, ' +
             'v.current_discount, ' +
             'v.remit_to_id, ' +
             'v.remit_to_attn, ' +
             'v.disc_date, ' +
             'v.curr_code, ' +
             'v.eplant_id, ' +
             'v.currency_descrip, ' +
             'v.currency_id, ' +
             'n.Company, ' +
             'c.pending_amount, ' +
             'v.amount_to_pay - NVL(c.pending_amount, 0) as pending_balance_due ' +
             'from v_apinvoice_cheque v, ' +
             'v_vendor n, ' +
             '(select sum(amount_paid) as pending_amount, ' +
             '        apinvoice_id                        ' +
             '   from cdprepost_detail                    ' +
             '  group by apinvoice_id) c                  ' +
             'where v.vendor_id = n.id ' +
//             'and misc.eplant_filter_include_nulls( n.eplant_id ) = 1 ' +
             'and NVL(v.amount_to_pay, 0) <> 0 ' +
             'and v.id = c.apinvoice_id(+)';


const fSql3 = 'select v.id, ' +
             'v.vendor_id, ' +
             'v.on_hold, ' +
             'v.invoice_no, ' +
             'v.invoice_amount, ' +
             'v.terms_id, ' +
             'v.invoice_date, ' +
             'v.due_date, ' +
             'v.discount_days, ' +
             'v.discount, ' +
             'v.amount_paid, ' +
             'v.discount_taken, ' +
             'v.amount_to_pay, ' +
//             '0 as actual_amt_to_pay, ' +
//             '0 as actual_discount, ' +
             'v.amount_to_pay - decode(Sign(v.disc_date  - to_date(:nDate, ''MM/DD/RRRR'') ), -1, 0, v.current_discount) as actual_amt_to_pay, ' +
             'decode(Sign(v.disc_date  - to_date(:nDate, ''MM/DD/RRRR'') ), -1, 0, v.current_discount) as actual_discount, ' +
             'v.current_discount, ' +
             'v.remit_to_id, ' +
             'v.remit_to_attn, ' +
             'v.disc_date, ' +
             'v.curr_code, ' +
             'v.currency_descrip, ' +
             'v.currency_id, ' +
             'v.acct_id_apdisc, ' +
             'n.Company, ' +
             'v.eplant_id ' +
             'from v_apinvoice_cheque v, ' +
             'v_vendor n ' +
             'where v.vendor_id = n.id ' +
             ' and misc.multi_eplant_filter_incl_nulls(v.eplant_id, ''CD'') = 1 ' +
             'and misc.eplant_filter_include_nulls( n.eplant_id ) = 1 ' +
             'and NVL(v.amount_to_pay, 0) <> 0 ';


//const fSql2 = 'select distinct v.vendor_id, ' +
//              'v.remit_to_id, ' +
//              'v.remit_to_attn, ' +
//              'n.Company, ' +
//              'n.Addr1, ' +
//              'n.Addr2, ' +
//              'n.City, ' +
//              'n.State, ' +
//              'n.Vendorno, ' +
//              'n.Zip ' +
//              'from v_apinvoice_cheque v, ' +
//              'vendor n ' +
//              'where v.vendor_id = n.id(+) ' +
//              'and v.vendor_id in (select vendor_id from v_apinvoice_cheque ' +
//              'where NVL(amount_to_pay, 0) <> 0 ';

const fSql2 = 'select v.vendor_id as vendor_id, '     +
              '       v.remit_to_id as remit_to_id, ' +
              '       r.attn as remit_to_attn, '      +
              '       n.Company as company, '         +
              '       n.Addr1 as addr1, '             +
              '       n.Addr2 as addr2, '             +
              '       n.City as city, '               +
              '       n.State as state, '             +
              '       n.Vendorno as vendorno, '       +
              '       n.currency_id as currency_id, ' +
              '       c.descrip as currency, '        +
              '       c.curr_code as curr_code, '     +
              '       n.Zip as zip '                  +
              '  from v_apinvoice_cheque_eplant v, ' +
//              '  from (select distinct vendor_id, remit_to_id from v_apinvoice_cheque ' +
//              '         where misc.Eplant_Filter(eplant_id) = 1) v, ' +
//              '  from (select distinct vendor_id, remit_to_id from v_apinvoice_cheque) v, ' +
              '       remit_to r, ' +
              '       currency c, ' +
              '       v_vendor n ' +
              ' where v.vendor_id = n.id ' +
              '   and c.id(+) = n.currency_id ' +
              '   and v.remit_to_id = r.id ' +
              '   and misc.multi_eplant_filter_incl_nulls(v.eplant_id, ''CD'') = 1 ' +
              '   and misc.eplant_filter_include_nulls( n.eplant_id ) = 1 ' +
              '   and exists (select 1 from v_apinvoice_cheque where vendor_id = v.vendor_id ' +
              '                        and NVL(amount_to_pay, 0) <> 0 and NVL(ON_HOLD, ''N'') = ''N'' ';

const FSql2A = '   and exists (select 1 from v_apinvoice_cheque where remit_to_id = v.remit_to_id ' +
               '                        and NVL(amount_to_pay, 0) <> 0 and NVL(ON_HOLD, ''N'') = ''N'' ' +
                                      ' and misc.multi_eplant_filter_incl_nulls(eplant_id, ''CD'') = 1 ';



const fSql5 = 'select v.vendor_id as vendor_id, '     +
              '       v.remit_to_id as remit_to_id, ' +
              '       r.attn as remit_to_attn, '      +
              '       n.Company as company, '         +
              '       n.Addr1 as addr1, '             +
              '       n.Addr2 as addr2, '             +
              '       n.City as city, '               +
              '       n.State as state, '             +
              '       n.Vendorno as vendorno, '       +
              '       n.currency_id as currency_id, ' +
              '       c.descrip as currency, '        +
              '       c.curr_code as curr_code, '     +
              '       n.Zip as zip '                  +
//              '  from v_apinvoice_cheque_eplant v, ' +
//              '  from (select distinct vendor_id, remit_to_id from v_apinvoice_cheque ' +
//              '         where misc.Eplant_Filter(eplant_id) = 1) v, ' +
              '  from (select distinct vendor_id, remit_to_id from v_apinvoice_cheque where eplant_id = %f and misc.multi_eplant_filter_incl_nulls(eplant_id, ''CD'') = 1) v, ' +
              '       remit_to r, ' +
              '       currency c, ' +
              '       v_vendor n ' +
              ' where v.vendor_id = n.id ' +
              '   and c.id(+) = n.currency_id ' +
              '   and v.remit_to_id = r.id ' +
//              '   and misc.multi_eplant_filter_incl_nulls(n.eplant_id, ''CD'') = 1 ' +
              '   and misc.eplant_filter_include_nulls( n.eplant_id ) = 1 ' +
              '   and exists (select 1 from v_apinvoice_cheque where vendor_id = v.vendor_id ' +
              '                        and NVL(amount_to_pay, 0) <> 0 and eplant_id = %f and NVL(ON_HOLD, ''N'') = ''N'' ';

const FSql5A = '   and exists (select 1 from v_apinvoice_cheque where remit_to_id = v.remit_to_id ' +
               '                        and NVL(amount_to_pay, 0) <> 0 and eplant_id = %f and NVL(ON_HOLD, ''N'') = ''N'' ';


const fSql10 = 'select v.vendor_id as vendor_id, '     +
              '       v.remit_to_id as remit_to_id, ' +
              '       r.attn as remit_to_attn, '      +
              '       n.Company as company, '         +
              '       n.Addr1 as addr1, '             +
              '       n.Addr2 as addr2, '             +
              '       n.City as city, '               +
              '       n.State as state, '             +
              '       n.Vendorno as vendorno, '       +
              '       n.currency_id as currency_id, ' +
              '       c.descrip as currency, '        +
              '       c.curr_code as curr_code, '     +
              '       n.Zip as zip '                  +
              '  from v_apinvoice_cheque_eplant v, ' +
              '       remit_to r, ' +
              '       currency c, ' +
              '       v_vendor n ' +
              ' where v.vendor_id = n.id ' +
              '   and c.id(+) = n.currency_id ' +
              '   and misc.multi_eplant_filter_incl_nulls(n.eplant_id, ''CD'') = 1 ' +
//              '   and misc.eplant_filter_include_nulls( n.eplant_id ) = 1 ' +
              '   and v.remit_to_id = r.id ';



type
  TFrmCD = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Options1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    New1: TUniMenuItem;
    Delete1: TUniMenuItem;
    N1: TUniMenuItem;
    PrintChecks1: TUniMenuItem;
    Exit1: TUniMenuItem;
    PnlToolbarMain: TUniPanel;
    SBSearch: TUniSpeedButton;
    SBGridView: TUniSpeedButton;
    NavHeader: TUniDBNavigator;
    IQAbout1: TIQWebAbout;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQRepDef1: TIQWebRepDef;
    SBSave: TUniSpeedButton;
    SBView: TUniSpeedButton;
    PnlAp: TUniPanel;
    PnlApToolbar: TUniPanel;
    SBToggleCrPrePost: TUniSpeedButton;
    NavPrePost: TUniDBNavigator;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    PnlDetailToolbar: TUniPanel;
    Search1: TUniMenuItem;
    N2: TUniMenuItem;
    PostBatch1: TUniMenuItem;
    N3: TUniMenuItem;
    ViewpostedChecks1: TUniMenuItem;
    SBPrint: TUniSpeedButton;
    SR: TIQWebSecurityRegister;
    GridDetail: TIQUniGridControl;
    wwGlDiscAcct: TUniDBLookupComboBox;
    QryInsCheque: TFDQuery;
    PopupMenu1: TUniPopupMenu;
    JumpToVendor1: TUniMenuItem;
    IQJumpVendor: TIQWebJump;
    Splitter2: TUniSplitter;
    BrowseGLBatches1: TUniMenuItem;
    PM: TUniPopupMenu;
    JumptoAP1: TUniMenuItem;
    Contents1: TUniMenuItem;
    IQTiming1: TIQWebTiming;
    Debug1: TUniMenuItem;
    Clear1: TUniMenuItem;
    Show1: TUniMenuItem;
    sbSearchVendor: TUniSpeedButton;
    N4: TUniMenuItem;
    PopupMenu2: TUniPopupMenu;
    Quickcheck1: TUniMenuItem;
    SelectfromVendors1: TUniMenuItem;
    SelectfromInvoices1: TUniMenuItem;
    N5: TUniMenuItem;
    AddItem1: TUniMenuItem;
    DeleteItem1: TUniMenuItem;
    IQTab1: TIQWebTab;
    PrepareOutput1: TUniMenuItem;
    ShowControlTotals1: TUniMenuItem;
    N6: TUniMenuItem;
    Dontshowinvoiceswithpastduediscounts1: TUniMenuItem;
    PopupMenu3: TUniPopupMenu;
    ClearCurrency1: TUniMenuItem;
    PkGlBatchId: TIQWebHPick;
    PkGlBatchIdID: TBCDField;
    PkGlBatchIdBATCHNUMBER: TBCDField;
    PkGlBatchIdGLPERIODS_ID: TBCDField;
    PkGlBatchIdBATCH_DATE: TDateTimeField;
    PkGlBatchIdUSERID: TStringField;
    PkGlBatchIdSYSTEM_DATE: TDateTimeField;
    PkGlBatchIdPERIOD: TBCDField;
    RegenerateEFTOutputFile1: TUniMenuItem;
    wwMemoDialog1: TwwMemoDialog;
    RealizeGainandLossonMoveTransactions1: TUniMenuItem;
    EFTOutputFileDirectory1: TUniMenuItem;
    OnAcct: TUniCheckBox;
    Bevel2: TUniPanel;
    PnlHeader: TUniPanel;
    PCBatch: TUniPageControl;
    TabGrid: TUniTabSheet;
    TabForm: TUniTabSheet;
    PnlHeaderForm: TUniPanel;
    Splitter4: TUniSplitter;
    PnlLeft04: TUniPanel;
    Splitter7: TUniSplitter;
    PnlClient01: TUniPanel;
    PnlGroupCtrls2: TUniPanel;
    sbtnEPlant: TUniSpeedButton;
    PnlGroupCtrls1: TUniPanel;
    DBEditBatchDate: TUniDBDateTimePicker;
    DBEditDueDate: TUniDBDateTimePicker;
    dbePlant: TUniDBEdit;
    CBDiscount: TUniCheckBox;
    DBEditBatch: TUniDBEdit;
    PnlLeft01: TUniPanel;
    Label2: TUniLabel;
    Label13: TUniLabel;
    lblEPlant: TUniLabel;
    Label1: TUniLabel;
    PnlClient05: TUniPanel;
    Splitter3: TUniSplitter;
    PnlLeft05: TUniPanel;
    Splitter5: TUniSplitter;
    PnlClient02: TUniPanel;
    PnlBankCtrls2: TUniPanel;
    SBBank: TUniSpeedButton;
    PnlBankCtrls1: TUniPanel;
    DBEditBankAcct: TUniDBEdit;
    DBEditARAcct: TUniDBEdit;
    chkEFT: TUniDBCheckBox;
    PnlLeft02: TUniPanel;
    Label20: TUniLabel;
    Label10: TUniLabel;
    PnlClient04: TUniPanel;
    Splitter6: TUniSplitter;
    PnlLeft03: TUniPanel;
    Label9: TUniLabel;
    LblCurrency: TUniLabel;
    Label62: TUniLabel;
    PnlClient03: TUniPanel;
    PnlPeriodCtrls2: TUniPanel;
    SBPeriod: TUniSpeedButton;
    PnlPeriodCtrls1: TUniPanel;
    DBEditPeriod: TUniDBEdit;
    cbCurrency: TUniDBLookupComboBox;
    wwDBRemmitanceType: TUniDBComboBox;
    PnlApCarrier: TUniPanel;
    PCCheck: TUniPageControl;
    TabCheckGrid: TUniTabSheet;
    IQSearch1: TIQUniGridControl;
    TabAp: TUniTabSheet;
    PnlDetailForm: TUniPanel;
    Splitter8: TUniSplitter;
    Splitter9: TUniSplitter;
    PnlApRight1: TUniPanel;
    Splitter12: TUniSplitter;
    PnlLeft07: TUniPanel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    LblExChkAmt: TUniLabel;
    Label3: TUniLabel;
    LblBankAmt: TUniLabel;
    PnlClient07: TUniPanel;
    PnlTotalsCtrls1: TUniPanel;
    DBDisc: TUniDBEdit;
    DBCheck: TUniDBEdit;
    DBExChkAmt: TUniDBEdit;
    edInv: TUniEdit;
    EdBankAmt: TUniEdit;
    PnlTotalsCtrls2: TUniPanel;
    sbCalc: TUniSpeedButton;
    PnlApRight2: TUniPanel;
    PnlManualCheck: TUniPanel;
    Panel16: TUniPanel;
    GBFX: TUniGroupBox;
    Panel17: TUniPanel;
    Splitter11: TUniSplitter;
    PnlLeft09: TUniPanel;
    Label29: TUniLabel;
    Label31: TUniLabel;
    PnlClient10: TUniPanel;
    wwDBLookupCombo2: TUniDBLookupComboBox;
    DBEx: TUniDBEdit;
    PnlApVendor: TUniPanel;
    Splitter13: TUniSplitter;
    PnlLeft06: TUniPanel;
    Label6: TUniLabel;
    Label15: TUniLabel;
    Label34: TUniLabel;
    PnlClient06: TUniPanel;
    PnlVendorCtrls2: TUniPanel;
    SBEditRemit: TUniSpeedButton;
    PnlVendorCtrls1: TUniPanel;
    DBVendor: TUniDBEdit;
    DBVAddr1: TUniDBEdit;
    DBVAddr2: TUniDBEdit;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    DBComment2: TUniDBEdit;
    TabQuick: TUniTabSheet;
    PnlApFormCarrier: TUniPanel;
    sbApForm: TUniScrollBox;
    PnlApForm: TUniPanel;
    Splitter18: TUniSplitter;
    Panel5: TUniPanel;
    PnlCheckCtrls3: TUniPanel;
    Splitter15: TUniSplitter;
    PnlClient13: TUniPanel;
    PnlCheckCtrls2: TUniPanel;
    SBQCurrPk: TUniSpeedButton;
    PnlCheckCtrls1: TUniPanel;
    DBQCurrCode: TUniDBEdit;
    DBCheck2: TUniDBEdit;
    CBManual2: TUniDBCheckBox;
    PnlLeft13: TUniPanel;
    Label21: TUniLabel;
    Label12: TUniLabel;
    Label16: TUniLabel;
    Panel1: TUniPanel;
    lblNonGl: TUniLabel;
    PnlClient12: TUniPanel;
    Splitter16: TUniSplitter;
    PnlLeft12: TUniPanel;
    Label14: TUniLabel;
    Label8: TUniLabel;
    Label11: TUniLabel;
    Label17: TUniLabel;
    Label18: TUniLabel;
    Label19: TUniLabel;
    Label22: TUniLabel;
    PnlClient14: TUniPanel;
    DBPayTo: TUniDBEdit;
    DBAddr1: TUniDBEdit;
    DBAddr2: TUniDBEdit;
    DBCity: TUniDBEdit;
    DBState: TUniDBEdit;
    DBZip: TUniDBEdit;
    DBComment3: TUniDBEdit;
    PnlCheckNumber: TUniPanel;
    Splitter14: TUniSplitter;
    PnlLeft14: TUniPanel;
    PnlCheckClient1: TUniPanel;
    DBCheckNo: TUniDBEdit;
    Label7: TUniLabel;
    CBManual1: TUniDBCheckBox;
    Label23: TUniLabel;
    dbIntl_Pay_Type: TUniDBLookupComboBox;
    DBCheckNo2: TUniDBEdit;
    CbFilterVendor: TUniCheckBox;
    wwGlMiscAcct: TUniDBLookupComboBox;
    AssignAcctviaPickList1: TUniMenuItem;
    GridCtrl: TIQUniGridControl;
    wwBankAccount: TUniDBLookupComboBox;
    N7: TUniMenuItem;
    LabelDiscountDate: TUniLabel;
    wwDBDiscountDate: TUniDBDateTimePicker;
    PopupMenu4: TUniPopupMenu;
    AssignAcctviapicklist2: TUniMenuItem;
    SBEplantFilter: TUniSpeedButton;
    SBEplantFiltered: TUniSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure SBGridViewClick(Sender: TObject);
    procedure SBToggleCrPrePostClick(Sender: TObject);
    procedure SBAcctClick(Sender: TObject);
    procedure SBPeriodClick(Sender: TObject);
    procedure SBBankClick(Sender: TObject);
    procedure GridPrePostDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GridDetailDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GridPrePostDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure CBManual1Click(Sender: TObject);
    procedure CBManual2Click(Sender: TObject);
    procedure GridDetailDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure CBDiscountClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
   // procedure GridDetailCalcCellColors(Sender: TObject; Field: TField;
   //   State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   //   ABrush: TBrush);
    procedure SBSaveClick(Sender: TObject);
    procedure SBPrintClick(Sender: TObject);
    procedure SBViewClick(Sender: TObject);
    procedure JumpToVendor1Click(Sender: TObject);
    procedure BrowseGLBatches1Click(Sender: TObject);
    procedure JumptoAP1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBEditRemitClick(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure sbSearchVendorClick(Sender: TObject);
    procedure PMPopup(Sender: TObject);
    procedure sbCalcClick(Sender: TObject);

    procedure QryPrePostAfterScroll(DataSet: TDataSet);
    procedure sbtnEPlantClick(Sender: TObject);
    procedure AddItem1Click(Sender: TObject);
    procedure DeleteItem1Click(Sender: TObject);
    //procedure NavPrePostBeforeAction(Sender: TObject;
    //  Button: TNavigateBtn);
    procedure IQSearch1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure IQSearch1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure wwDBLookupCombo2DropDown(Sender: TObject);
    procedure cbCurrencyDropDown(Sender: TObject);
    procedure PrepareOutput1Click(Sender: TObject);
    procedure ShowControlTotals1Click(Sender: TObject);
    procedure GridDetailEnter(Sender: TObject);
    procedure Dontshowinvoiceswithpastduediscounts1Click(Sender: TObject);
    procedure cbCurrencyCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure wwDBRemmitanceTypeDropDown(Sender: TObject);
    procedure SBQCurrPkClick(Sender: TObject);
    procedure ClearCurrency1Click(Sender: TObject);
    procedure RegenerateEFTOutputFile1Click(Sender: TObject);
    procedure DBComment2DblClick(Sender: TObject);
    procedure RealizeGainandLossonMoveTransactions1Click(Sender: TObject);
    procedure EFTOutputFileDirectory1Click(Sender: TObject);
    procedure dbIntl_Pay_TypeDropDown(Sender: TObject);
    procedure CbFilterVendorClick(Sender: TObject);
    procedure wwGlDiscAcctDropDown(Sender: TObject);
    procedure AssignAcctviaPickList1Click(Sender: TObject);
    procedure wwDBDiscountDateExit(Sender: TObject);
    procedure SBEplantFilterClick(Sender: TObject);
    procedure DBEditDueDateCloseUp(Sender: TObject);
    procedure wwGlMiscAcctCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  protected
    procedure TblPrePostCtrlAfterScroll(DataSet: TDataSet);
    procedure TblPrePostCtrlAfterInsert(DataSet: TDataSet);
    procedure QryPrePostAfterInsert(DataSet: TDataSet);
    procedure QryPrePostNewRecord(DataSet: TDataSet);
    procedure QryPrePostDtlAfterInsert(DataSet: TDataSet);
    procedure QryPrePostBeforePost(DataSet: TDataSet);
    procedure SrcPrePostDataChange(Sender: TObject; Field: TField);
    procedure TblPrePostCtrlFilterRecordGL(DataSet: TDataSet; var Accept: Boolean);
    procedure TblPrePostCtrlFilterRecordNonGL(DataSet: TDataSet; var Accept: Boolean);
    procedure QryPrepostDtlAP_DISCOUNT_TAKENChange(Sender: TField);
    procedure TblPrePostCtrlAfterDelete(DataSet: TDataSet);
    procedure TblPrePostCtrlBeforePost(DataSet: TDataSet);
    procedure PkVendorBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
//    fHint:TNotifyEvent;
    fGLBatchDate:TDateTime;
    FXRate:Real;
    FPKSql:String;
    FDtlSql:String;
    HMsg:TPanelMesg;
    GLPeriodHint:TNotifyEvent;
    FCurrencyId:Real;
    FDiscountAcct:Real;
    FID: Real;
    procedure PrepareOutputfile(nGLBatchId_Id:Real);
    procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
//    procedure DisplayHint(Sender: TObject);
    function  LocateField(Agrid:TIQUniGridControl; AStr:String):String;
    procedure SortByChange(Sender: TObject);
    procedure CreateInvoiceCheck;
    procedure StartUp(AOwner:TComponent);
    procedure SelectCheckFromVendors;
    procedure SelectCheckFromAllVendors;
    procedure SelectInvFromVendors;
    procedure CreateQuickCheck;
    procedure CreateNONGLCheck;
    procedure OpenVendors;
    procedure CloseVendors;
    procedure OpenInv;
    procedure CloseInv;
    procedure GetDiscountAccount;
    function  GetDiscountAccount1(apinoiceId:Real):Real;
    procedure CheckDiscountTakenColumn;
    function  GetColumnNumber(cFieldName:String):Integer;
    procedure SaveGroup;
    procedure InsertGlbatchId(nGLBatchId_Id:Real);
    procedure InsertGlbatch(nGLBatchId_Id:Real);
    function  InsertCheque(nGLBatchId_Id:Real):Real;
    procedure InsertItems(nGLBatchId_Id:Real);
    procedure InsertFXItems(nGLBatchId_Id:Real);
    procedure InsertQuickFXItems(nGLBatchId_Id:Real);
    procedure InsertRevItems(nGLBatchId_Id:Real);
    procedure InsertDiscounts(nGLBatchId_Id:Real);
    procedure InsertFXDiscounts(nGLBatchId_Id:Real);
    procedure InsertRevDiscounts(nGLBatchId_Id:Real);
    procedure AppendVendorInvoices(AId, AVendorId, ARemitToId:Real);
    function  GetTotalInvoiceAmount(AId, AVendorId, ARemitToId:Real):Real;
    procedure PrintAfterPostReport(nGLBatchId_Id:Real);
    procedure SetCriteriaExpression( List:TStringList; cStr:String );
    procedure CheckMultiCurrency;
//    function  CheckForSameCurrency(AID:Real):Boolean;
    procedure InsertReval(nGLBatchId_Id:Real);
    function  GetAccountsAndRate(var AFXAcctID:Real; var AFXOffsetID:Real; var AOldRate:Real):Boolean;
    procedure CheckCurrencyRate;
    procedure SelectInvFromAllInv;
    procedure ResetOrder;
    procedure ResetQryPrepostDtl;
    procedure ResetQryPrepostDtl_FromIqSearch(Sender:TwwIncrementalSearch; IsFound:Boolean);

    procedure RevertFXAmounts(nGLBatchId_Id:Real);
    function  GetCreditFXAccount:Real;
    procedure AssignMC_GLACCT_ID_AP_DISC;
    function ProcessInvoiceCurrency(aCurrencyId, APrepostId:Real):Boolean;
    procedure ProcessOnAcct(AChequeId, ACheque_detail_id, ACDPrepost_id, aGLBatchId_Id:Real);
    procedure ResetQryBankAccount;
    procedure SetID(const Value: Real);
  public
    { Public declarations }
    FMultiCurrency :Boolean;
    fCheckType:string;    {AP or QUICK or NONGL}
    fCheckDiscount:Boolean;
    fFill:Boolean;
    fVendorSql:string;
    fInvSql:string;
    fInvSqlNoDate:string;
    fVendors:TFrmCdVendors;
    fInv:TFrmCdInv;
    FFormType:String;
    DM: TCD_DM;
    FPrintSql:String;
    FPrepostId:Real;
    {
    constructor Create(AOwner:TComponent); override;
    constructor CreateBM(AOwner:TComponent);
    constructor CreateJump(AOwner:TComponent; AId:Real);
    }


//    procedure DisplayHint(Sender: TObject);
    procedure ProcessAcceptInvoices;
    procedure ProcessAcceptAllInvoices;
    procedure ProcessAcceptVendor;
    procedure ProcessAcceptAllVendors;
    property ID:Real write SetID;
  end;

procedure DoIQCD;
procedure DoNonGLChecks;
procedure JumpToCD(AID:Real);

procedure GeneralCheckup;


implementation
{$R *.DFM}
uses
  APView,
  ArShare,
  { TODO -ombaral -cWEBIQ : Resolve dependency
  BatView,

  }
  CDConf,
  cdallinv,
  cd_rscstr,
  CDConfEFT,
  CDCtrl,
  CdOut,
  CDPrint,
  CDSelChk,
  CDView,
  IQMS.Common.DateDlg,
  edbadord,
  IQMS.Common.Period,
  IQMS.Common.AccountingShare,
  IQMS.Common.Controls,
  IQMS.Common.Cursor,
  IQMS.Common.Directory,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Print,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.Mcshare,
  PEdRemt,
  IQMS.WebVcl.PlantBase,
  MultiSelectEplants,
  IQMS.COmmon.SetPlant,
  VStatChk;

procedure JumpToCD(AID:Real);
begin
  GeneralCheckup;
  //TFrmCD.CreateJump(AOwner, AId).Show;
  with TFrmCD.Create(uniGUIApplication.UniApplication) do
  begin
    ID:=AId;
    FFormType := 'GL';
    DM.TblPrePostCtrl.OnFilterRecord := TblPrePostCtrlFilterRecordGL;
    DM.TblPrePostCtrl.Locate('ID', AID, []);
    Show;
  end;


end;

procedure DoIQCD;
begin
  GeneralCheckup;
  TFrmCD.Create(uniGUIApplication.UniApplication).Show;
end;

procedure DoNonGLChecks;    {called from BMRecons}
begin
  GeneralCheckup;
  with TFrmCD.Create(uniGUIApplication.UniApplication) do
  begin
    fCheckType := 'NONGL';
    FFormType := 'NONGL';
    DM.TblPrePostCtrl.OnFilterRecord := TblPrePostCtrlFilterRecordNonGL;
    cbManual2.Checked := true;
    DM.QryPrePostDtl.FieldByName('AcctMisc').Visible := False;
    DM.QryPrePostDtl.FieldByName('AcctMiscDesc').Visible := False;
    PCCheck.ActivePage := TabQuick;
    DBCheckNo2.Visible := True;
    Label16.Visible    := True;
    ShowModal;
  end;

end;


procedure GeneralCheckup;
var
  GlAcctId, GlPeriodsId, nBankInfoId:Real;
begin
  GlAcctId := SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_cash'') from dual');
  if GlAcctId = 0 then
    {'Default Cash account not assigned.  Please assign in System Parameters.'}
    raise Exception.Create(cd_rscstr.cTXT0000009);

  if SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_apdisc'') from dual') = 0 then
    {'Default AP Discount account not assigned.  Please assign System Parameters.'}
    raise Exception.Create(cd_rscstr.cTXT0000010);

 if SelectValueAsFloat('select glperiod_id from iqsys') = 0
    then raise Exception.Create('Default G/L Period value not assigned, please assign System Parameters');

  nBankInfoId := SelectValueAsFloat(IQFormat('select d.id from bankinfo_dtl d, bankinfo a where d.glacct_id_cash = %f ' +
                                '  and d.bankinfo_id = a.id ' +
                                 '  and NVL(d.pk_hide, ''N'') <> ''Y'' ' +
                                 '  and NVL(a.pk_hide, ''N'') <> ''Y'' ', [GlAcctId]));

  if nBankInfoId = 0 then
     // 'Bank information unavailable.  Please assign.'
    raise Exception.Create(cd_rscstr.cTXT0000011);

  GlPeriodsId :=
    SelectValueAsFloat(Format('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1',
      [FormatDateTime('mm/dd/yyyy', Date)]));

  if GlPeriodsId = 0 then
     // 'Current GL period is unavailable.  Please assign.'
    raise Exception.Create(cd_rscstr.cTXT0000078);

  if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
  begin
    if SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_fx'') from dual') = 0 then
       {'A default Foreign Exchange account value has not been ' +
        'assigned.  Please assign in System Parameters.'}
       raise Exception.Create(cd_rscstr.cTXT0000079);

    if SelectValueAsString('select group_name from glacct_def where group_name = ' +
                '(select FX_SEGMENT_NAME from iqsys)') = '' then
       {'A GL Account Structure Foreign Currency Segment Name has ' +
        'not been assigned.  Please assign in System Parameters.'}
     raise Exception.Create(cd_rscstr.cTXT0000080)
  end;

end;
{
constructor TFrmCD.Create(AOwner:TComponent);
begin
  StartUp(AOwner);
  FFormType := 'GL';
//  DM.TblPrePostCtrl.Filter := 'BATCH_TYPE<>''NONGL''';
  DM.TblPrePostCtrl.OnFilterRecord := TblPrePostCtrlFilterRecordGL;
end;

constructor TFrmCD.CreateJump(AOwner:TComponent; AId:Real);
begin
  StartUp(AOwner);
  FFormType := 'GL';
  DM.TblPrePostCtrl.OnFilterRecord := TblPrePostCtrlFilterRecordGL;
  DM.TblPrePostCtrl.Locate('ID', AID, []);
end;

constructor TFrmCD.CreateBM(AOwner:TComponent);
begin
  StartUp(AOwner);
  fCheckType := 'NONGL';
  FFormType := 'NONGL';
//  DM.TblPrePostCtrl.Filter := 'BATCH_TYPE=''NONGL''';
  DM.TblPrePostCtrl.OnFilterRecord := TblPrePostCtrlFilterRecordNonGL;
  cbManual2.Checked := true;
  DM.QryPrePostDtl.FieldByName('AcctMisc').Visible := False;
  DM.QryPrePostDtl.FieldByName('AcctMiscDesc').Visible := False;
  PCCheck.ActivePage := TabQuick;
  DBCheckNo2.Visible := True;
  Label16.Visible    := True;

end;
}

procedure TFrmCD.StartUp(AOwner:TComponent);
var
  ASortOrder, AFieldName:String;
  AType:Integer;
begin
  DM:= TCD_DM.Create(uniGUIApplication.UniApplication);
  inherited;
  //CreateComponentsList(self, 'c:\iqwin\CompList\');
  DM.Name:= '';
  PCBatch.ActivePage := TabForm;
  GridCtrl.DataSource:= NIL;

//  IqSearch1.wwDbgrid.DataSource:= DM.SrcPrePost;
  (* TODO -ombaral -cWEBIQ : Resolve dependency
  IqSearch1.DBGrid.Color := clBtnFace;
  IqSearch1.DbGrid.CTL3D := False;
  IqSearch1.IncSearch.OnAfterSearch := ResetQryPrepostDtl_FromIqSearch;
  *)
  PCCheck.ActivePage := TabCheckGrid;


  fCheckType     := 'AP';
  fCheckDiscount := True;        // include discount days
  fFill          := True;        // Fill in Amount automatically


//  fHint := Application.OnHint;

//  Application.OnHint := DisplayHint;


//  GLPeriodHint := Application.OnHint;
//  Application.OnHint := DisplayHint;
  DM.TblPrePostCtrl.AfterScroll := TblPrePostCtrlAfterScroll;
  DM.QryPrepost.AfterScroll := QryPrePostAfterScroll;
  DM.TblPrePostCtrl.AfterInsert := TblPrePostCtrlAfterInsert;
  DM.QryPrepost.AfterInsert     := QryPrePostAfterInsert;
  DM.QryPrepost.OnNewRecord     := QryPrePostNewRecord;
  DM.QryPrePostDtl.AfterInsert  := QryPrePostDtlAfterInsert;
  DM.QryPrepost.BeforePost      := QryPrePostBeforePost;
  DM.SrcPrePost.OnDataChange    := SrcPrePostDataChange;
  DM.TblPrePostCtrl.AfterDelete := TblPrePostCtrlAfterDelete;
  DM.TblPrePostCtrl.BeforePost  := TblPrePostCtrlBeforePost;
  DM.PkVendor.BeforeOpen        := PkVendorBeforeOpen;


  DM.QryPrepostDtlAP_DISCOUNT_TAKEN.OnChange := QryPrepostDtlAP_DISCOUNT_TAKENChange;
  SrcPrePostDataChange(nil, nil);
  GridDetail.Cursor := crJump;
  FMultiCurrency := SelectValueAsString('select multicurrency from iqsys') = 'Y';
  if not FMultiCurrency then
  begin
    CbFilterVendor.Checked := false;
    CbFilterVendor.visible := false;
  end
  else
    CbFilterVendor.Checked := SelectValueAsString('select NVL(FILTER_VENDORS_BY_CURR, ''N'') from iqsys2') = 'Y';
  CheckMultiCurrency;
  FPKSql := DM.PkAllInv.Sql.Text;
  FDtlSql := DM.QryPrepostDtl.Sql.Text;
  FPrintSql := DM.QryPrePostPr.Sql.Text;

  RealizeGainandLossonMoveTransactions1.Checked := SelectValueAsString('select NVL(GAIN_AND_LOSS_ON_MOVE, ''N'') from iqsys where rownum < 2') = 'Y';
  RealizeGainandLossonMoveTransactions1.Visible := FMultiCurrency;

  AType := 0;

  if IQRegIntegerScalarRead( self, 'CD_PREPARE_OUTPUT', AType ) then
  begin
    if AType = 0 then
      PrepareOutput1.Checked := False
    else
      PrepareOutput1.Checked := True;
  end
  else
  begin
    PrepareOutput1.Checked := False;
    IQRegIntegerScalarWrite( self, 'CD_PREPARE_OUTPUT', 0);
  end;

  AType := 0;

  if IQRegIntegerScalarRead( self, 'CD_DONT_SHOW_DISC', AType ) then
  begin
    if AType = 0 then
      Dontshowinvoiceswithpastduediscounts1.Checked := False
    else
      Dontshowinvoiceswithpastduediscounts1.Checked := True;
  end
  else
  begin
    Dontshowinvoiceswithpastduediscounts1.Checked := False;
    IQRegIntegerScalarWrite( self, 'CD_DONT_SHOW_DISC', 0);
  end;

  if IQRegStringScalarRead( self, 'DtlSortOrder', ASortOrder ) then
  begin
    if ASortOrder <> '' then
    with TFDQuery(GridDetail.DataSource.DataSet) do
    begin
      AFieldName := StrTran(ASortOrder, '&', '');
      AFieldName := StrTran(AFieldName, 'Sort By ', '');
      AFieldName := LocateField(GridDetail, AFieldName);
      if AFieldName = '' then
      begin
        Open;
        Exit;
      end;
//      Close;
      Sql.Clear;
      Sql.Add(FDtlSql + ' Order by ' + AFieldName);
      ResetQryPrepostDtl;
    end
    else GridDetail.DataSource.DataSet.Open;
  end
  else GridDetail.DataSource.DataSet.Open;

  // compensate for security
  (* TODO -ombaral -cWEBIQ : Resolve dependency
  IQMS.Common.Controls.ResizeNavBar(NavHeader);
  IQMS.Common.Controls.ResizeNavBar(NavPrePost);
  IQMS.Common.Controls.ResizeNavBar(NavPrePostdetail);
  *)
  SBEplantFiltered.Left := SBEplantFilter.Left;

  if SelectValueAsFloat('select count(*) from MULTI_EPLANT_USER where module_type = ''CD'' and user_id = misc.getusername') <> 0 then
  begin
    SBEplantFiltered.Visible := true;
    SBEplantFilter.Visible := false;
  end
  else
  begin
    SBEplantFilter.Visible := true;
    SBEplantFiltered.Visible := false;
  end;


end;

procedure TFrmCD.CheckMultiCurrency;
var
  i:Integer;
begin
  LblCurrency.Visible  := FMultiCurrency;
  cbCurrency.Visible   := FMultiCurrency;
  DBQCurrCode.Visible   := FMultiCurrency;
  SBQCurrPk.Visible   := FMultiCurrency;
  Label21.Visible   := FMultiCurrency;
  DM.QryPrepostCHECK_AMOUNT_EX.Visible   := FMultiCurrency;
  DM.QryPrepostDtlAMOUNT_PAID_EX.Visible := FMultiCurrency;
  DM.QryPrepostDtlAP_DISCOUNT_TAKEN_EX.Visible := FMultiCurrency;
  DM.QryPrepostDtlAMOUNT_TO_PAY_EX.Visible := FMultiCurrency;
  DM.QryPrepostDtlCURRENT_DISCOUNT_EX.Visible := FMultiCurrency;
  DM.TblPrePostCtrlCurrency.Visible := FMultiCurrency;
//  if not FMultiCurrency then
//  with GridCtrl do
//    for I:= Columns.Count - 1 downto 0 do
//     if UpperCase(Columns[i].FieldName) = 'CURRENCY' then
//        Columns[i].Collection := nil;
end;

procedure TFrmCD.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self,  GridCtrl, GridDetail,
    PnlAp,PnlLeft01, PnlLeft02, PnlLeft03, PnlLeft04, PnlLeft05,
    PnlLeft06, PnlLeft07, PnlLeft09,
    PnlLeft12, PnlLeft13, PnlLeft14,
    PnlApRight1, PnlApRight2 ]);
  IQSetTablesActiveEx( TRUE, DM,  cd_rscstr.cTXT0000076 {'Accessing Cash Disbursements.  Please wait.'});
  IQSetTablesActiveEx( TRUE, self, cd_rscstr.cTXT0000076 {'Accessing Cash Disbursements.  Please wait.'} );
  TabAP.Cursor      := crJump;

  IqSearch1.Dbgrid.Cursor:= crJump;


  // aligns page control to parent panel; streamlines screen a bit.
  IQMS.Common.Controls.AdjustPageControlToParent(PCBatch);
  IQMS.Common.Controls.AdjustPageControlToParent(PCCheck);

  // ensure controls line up
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlGroupCtrls1);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlBankCtrls1);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlManualCheck);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlDetailToolbar);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCheckCtrls1);

  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlGroupCtrls1);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlBankCtrls1);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlPeriodCtrls1);

  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlVendorCtrls1);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlTotalsCtrls1);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCheckClient1);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient10);

  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient14);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCheckCtrls1);

  //sbApForm.VertScrollBar.Position := 0;
  //IQMS.Common.Controls.ResizeNavBar(NavHeader);
  //IQMS.Common.Controls.ResizeNavBar(NavPrePost);
  //IQMS.Common.Controls.ResizeNavBar(NavPrePostdetail);

  StartUp(self);
  DM.TblPrePostCtrl.OnFilterRecord := TblPrePostCtrlFilterRecordGL;

end;

procedure TFrmCD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    IQRegFormWrite( self, [self,  GridCtrl, GridDetail,
    PnlAp, PnlLeft01, PnlLeft02, PnlLeft03, PnlLeft04, PnlLeft05,
    PnlLeft06, PnlLeft07, PnlLeft09,
    PnlApRight1, PnlApRight2]);
  finally
    Application.OnShowHint:= NIL;
  end;
end;

//procedure TFrmCD.DisplayHint(Sender: TObject);
//begin
//  with DM.TblPrePostCtrl do
//    DBEditPeriod.Hint := Format('From: %s To: %s', [DateToStr(FieldByName('Start_Date').asDateTime),
//                                                    DateToStr(FieldByName('End_Date').asDateTime)]);
//end;



procedure TFrmCD.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmCD.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmCD.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmCD.SBGridViewClick(Sender: TObject);
begin
  if (PCBatch.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    GridCtrl.DataSource:= NIL;
    PCBatch.ActivePage := TabForm;
  end
  else
  begin
    GridCtrl.DataSource:= DM.SrcPrePostCtrl;
    PCBatch.ActivePage := TabGrid;
  end;
end;

procedure TFrmCD.SBToggleCrPrePostClick(Sender: TObject);
begin
  if (PCCheck.ActivePage = TabCheckGrid) or (Sender = NIL) then
  begin
//    GridPrePost.DataSource:= NIL;
    if Copy(DM.QryPrepost.FieldByName('CHECK_TYPE').asString, 1, 2) = 'AP'
      then PCCheck.ActivePage := TabAP
      else PCCheck.ActivePage := TabQuick;
  end
  else
  begin
//    GridPrePost.DataSource:= DM.SrcPrePost;
    PCCheck.ActivePage := TabCheckGrid;
  end;

end;

procedure TFrmCD.SBAcctClick(Sender: TObject);
begin
  with DM, TblPrePostCtrl do
    if PkAcct.Execute then
    begin
      if not (State in [dsEdit, dsInsert]) then Edit;
      FieldByName('GLACCT_ID_CASH').asFloat := PkAcct.GetValue('ID');
    end;

end;

procedure TFrmCD.SBPeriodClick(Sender: TObject);
var
  Id:Real;
begin
  with DM.TblPrePostCtrl do
  begin
    Id := DoFindPeriod;
    if Id <> 0 then
    begin
      if not (State in [dsEdit, dsInsert]) then Edit;
      FieldByName('GLPERIODS_ID').asFloat := Id;
    end;
  end;

end;

procedure TFrmCD.SBBankClick(Sender: TObject);
var
  Currency_id:Real;
  ASuspAcctId:Real;
  ACurrCode, ANativeCurrCode:String;
  AEplantId:Real;
begin
  DM.PkBank.Sql.Clear;
  DM.PkBank.Sql.Add(FPkBankSql);
  if DM.TblPrePostCtrlCURRENCY_ID.asFloat <> 0 then
    DM.PkBank.Sql.Add(IqFormat(' and b.currency_id in (select id from currency where curr_code = ''%s'')',
        [SelectValueFmtAsString('select curr_code from currency where id = %f', [DM.TblPrePostCtrlCURRENCY_ID.asFloat])]));

  with DM, TblPrePostCtrl do
    if PkBank.Execute then
    begin
      if not (State in [dsEdit, dsInsert]) then Edit;
      FieldByName('BANKINFO_DTL_ID').asFloat := PkBank.GetValue('ID');

      ASuspAcctId := SelectValueFmtAsFloat('select glacct_id_suspense from bankinfo_dtl where id = %f', [FieldByName('BANKINFO_DTL_ID').asFloat]);
      if (ASuspAcctId <> 0) and (TblPrePostCtrlEFT.asString = 'Y') then
        FieldByName('GlAcctIdSusp').asFloat := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(%f, ''acct_id_cash'', %f) from dual',
                                                        [ASuspAcctId, FieldByName('EPLANT_ID').AsFloat])
      else
        FieldByName('GlAcctIdSusp').asFloat := 0;



      if FMultiCurrency then
      begin

        ACurrCode := SelectValueFmtAsString('select curr_code from currency where id = %f', [DM.TblPrePostCtrlCURRENCY_ID.asFloat]);


        Currency_id := SelectValueFmtAsFloat('select id from currency where curr_code = ''%s'' and native_curr = ''%s''',
                                 [ACurrCode, ACurrCode]);



        Currency_id := SelectValueFmtAsFloat('select currency_id from bankinfo_dtl where id = %f',
                                 [FieldByName('BANKINFO_DTL_ID').asFloat]);
        if Currency_id <> 0 then
          FieldByName('CURRENCY_ID').asFloat := Currency_id
        else
        FieldByName('CURRENCY_ID').asFloat := GetEplantNativeCurrencyId;
          {in McShare.pas}
      end;
    end;
end;

procedure TFrmCD.TblPrePostCtrlAfterInsert(DataSet: TDataSet);
var
  GlAcctId, GlPeriodsId, BankInfoDtlId, Currency_id:Real;
  AEPlantIDStr:String;
  ASuspAcctId:Real;
  ACurrCode, ANativeCurrCode:String;
  AEplantId:Real;
begin
  with DM.TblPrePostCtrl do
  begin
    FieldByName('BATCH_TYPE').asString := FFormType;
    FieldByName('OUTLOOK_DATE').asDateTime := Date + 14;
    FieldByName('CHECK_DATE').asDateTime   := Date ;
    GlPeriodsId :=
      SelectValueAsFloat(Format('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1',
        [FormatDateTime('mm/dd/yyyy', Date)]));
    if GlPeriodsId <> 0 then FieldByName('GLPERIODS_ID').asFloat := GlPeriodsId;
    if SecurityManager.EPlantsExist then
    begin
      if SecurityManager.EPlant_ID <> 'NULL' then
        FieldByName('EPLANT_ID').AsFloat := StrToFloat(SecurityManager.EPlant_ID)
      else
      begin
        AEPlantIDStr := SecurityManager.EPlant_ID;
        if DoPickEPlant( AEPlantIDStr ) and (AEPlantIDStr <> 'NULL')  then
          FieldByName('EPLANT_ID').AsFloat := StrToFloat(AEPlantIDStr);
      end;
    end;
    GlAcctId := SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_cash'') from dual');
    if GlAcctId <> 0 then
    begin
      FieldByName('GLACCT_ID_CASH').asFloat := GlAcctId;
      BankInfoDtlId := SelectValueFmtAsFloat('select b.id from bankinfo_dtl b, bankinfo c ' +
                                 ' where b.glacct_id_cash = %f ' +
                                 '   and b.bankinfo_id = c.id  ' +
                                 '   and NVL(b.pk_hide, ''N'') <> ''Y'' ' +
                                 '   and NVL(c.pk_hide, ''N'') <> ''Y'' ' +
                                 '   and (misc.eplant_filter(b.eplant_id) = 1 or b.eplant_id is null) ', [GlAcctId]);
      if BankInfoDtlId <> 0 then
      begin
        FieldByName('BANKINFO_DTL_ID').asFloat := BankInfoDtlId;
        FieldByName('EFT').asString := SelectValueFmtAsString('select NVL(eft, ''N'') from bankinfo_dtl where id = %f',
                                                    [BankInfoDtlId]);
        ASuspAcctId := SelectValueFmtAsFloat('select glacct_id_suspense from bankinfo_dtl where id = %f', [BankInfoDtlId]);
        if ASuspAcctId <> 0 then
          FieldByName('GlAcctIdSusp').asFloat := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(%f, ''acct_id_cash'', %f) from dual',
                                                        [ASuspAcctId, FieldByName('EPLANT_ID').AsFloat]);


      end;
      if FMultiCurrency then
      begin

          AEplantId := 0;
          if SecurityManager.EPlantsExist then
            if SecurityManager.EPlant_ID <> 'NULL' then
              AEplantId := StrToFloat(SecurityManager.EPlant_ID);

          if AEplantId <> 0 then
          begin
            ANativeCurrCode := SelectValueFmtAsString('select native_curr from eplant where id = %f', [AEplantId]);
          end
          else
          begin
            Currency_id := SelectValueAsFloat('select currency_id from iqsys where rownum < 2');
            ANativeCurrCode := SelectValueFmtAsString('select native_curr from currency where id = %f', [Currency_id]);
          end;

          Currency_id := SelectValueFmtAsFloat('select currency_id from bankinfo_dtl where id = %f',
                                   [FieldByName('BANKINFO_DTL_ID').asFloat]);

          ACurrCode := SelectValueFmtAsString('select curr_code from currency where id = %f', [Currency_id]);

          Currency_id := SelectValueFmtAsFloat('select id from currency where curr_code = ''%s'' and native_curr = ''%s''', [ACurrcode, ANativeCurrCode]);


        if Currency_id <> 0 then
          FieldByName('CURRENCY_ID').asFloat := Currency_id
                else FieldByName('CURRENCY_ID').asFloat := GetEplantNativeCurrencyId;  {in McShare.pas}

      end;
    end;
  end;
  ResetQryPrepostDtl;
end;

procedure TFrmCD.QryPrePostAfterScroll(DataSet: TDataSet);
begin
  if FMultiCurrency then
  begin
    GBFX.Visible :=  DM.QryPrePostCURRENCY_ID.asFloat <> 0;
   EdBankAmt.Visible   := GBFX.Visible;
   LblBankAmt.Visible  := GBFX.Visible;
   DBExChkAmt.Visible  := GBFX.Visible;
   LblExChkAmt.Visible := GBFX.Visible;
  end
  else
  begin
   GBFX.Visible        := False;
   EdBankAmt.Visible   := False;
   LblBankAmt.Visible  := False;
   DBExChkAmt.Visible  := False;
   LblExChkAmt.Visible := False;
  end;


  edInv.Text := '';
  edBankAmt.Text := '';
  ResetQryPrepostDtl;
  DM.QryPrePostCheck.Filter := Format('CDPREPOST_ID=%f', [DM.QryPrepost.FieldByName('ID').asFloat]);
  CheckDiscountTakenColumn;
end;

procedure TFrmCD.ResetQryPrepostDtl_FromIqSearch(Sender:TwwIncrementalSearch; IsFound:Boolean);
var
  AId:Real;
begin
  AId := DM.QryPrepostDtlID.asFloat;
  DM.QryPrepostDtl.Close;
  DM.QryPrepostDtl.ParamByName('AID').Value := DM.QryPrepostID.asFloat;
  DM.QryPrepostDtl.Open;
  DM.QryPrepostDtl.Locate('ID', AId, []);
end;

procedure TFrmCD.ResetQryPrepostDtl;
var
  AId:Real;
begin
  AId := DM.QryPrepostDtlID.asFloat;
  DM.QryPrepostDtl.Close;
  DM.QryPrepostDtl.ParamByName('AID').Value := DM.QryPrepostID.asFloat;
  DM.QryPrepostDtl.Open;
  DM.QryPrepostDtl.Locate('ID', AId, []);
end;

procedure TFrmCD.QryPrePostAfterInsert(DataSet: TDataSet);
begin
  CloseVendors;
  CloseInv;
  IqSearch1.Dbgrid.DataSource := DM.SrcPrePost;
  if FFormType = 'GL' then
  begin
    PCCheck.ActivePage  := TabCheckGrid;
    DM.QryPrepost.Cancel;
    try
      if not DoSelectCheckType(self) then exit;
    finally
      Screen.Cursor := crDefault;
    end;
    if fCheckType = 'AP'
      then SelectCheckFromVendors
    else if fCheckType = 'QUICK' then CreateQuickCheck
    else if fCheckType = 'VEN' then SelectCheckFromAllVendors
    else CreateInvoiceCheck;

    DM.QryPrePostDtl.FieldByName('ACCTMISC').Visible :=
      DM.QryPrepost.FieldByName('CHECK_TYPE').asString <> 'NONGL';
    DM.QryPrePostDtl.FieldByName('ACCTMISCDESC').Visible := DM.QryPrePostDtl.FieldByName('ACCTMISC').Visible;
  end
//  else CreateNONGLCheck;
end;


procedure TFrmCD.QryPrePostDtlAfterInsert(DataSet: TDataSet);
begin
  CloseVendors;

  if DM.QryPrePostDtl.FieldByName('ID').asFloat = 0 then
     DM.QryPrePostDtl.FieldByName('ID').asFloat := GetNextID('CDPREPOST_DETAIL');

  if DM.QryPrePostDtl.FieldByName('CDPREPOST_ID').asFloat = 0 then
     DM.QryPrePostDtl.FieldByName('CDPREPOST_ID').asFloat := DM.QryPrepost.FieldByName('ID').asFloat;

//  if DM.QryPrepost.FieldByName('ID').asFloat = 0 then
//  begin
//    CloseInv;
//    DM.QryPrePostDtl.Cancel;
//    SelectInvFromAllInv;
//    Exit;
//  end;

  if SelectValueFmtAsFloat('select count(id) from cdprepost_detail where cdprepost_id = %f and ON_ACCT = ''Y''', [DM.QryPrepost.FieldByName('ID').asFloat]) <> 0 then
    OnAcct.Checked := false; {do not allow more than one on_acct per check}


  if (DM.QryPrepost.FieldByName('VENDOR_ID').asFloat = 0) then
    OnAcct.Checked := false; // Mar 15 2012 Per Nancy: We should only generate an onacct invoice if there is a vendor. Quick checks should never become onacct invoices CRM# 609978


  if (DM.QryPrepost.FieldByName('VENDOR_ID').asFloat = 0) or (OnAcct.Checked) then
  begin
    if OnAcct.Checked then
    begin
      DM.QryPrepostDtlON_ACCT.ReadOnly := false;
      DM.QryPrepostDtlON_ACCT.asString := 'Y';
      DM.QryPrepostDtlON_ACCT.ReadOnly := true;
    end;
    CloseInv;
    Exit;
  end;
  DM.QryPrePostDtl.Cancel;
  SelectInvFromVendors;
end;


procedure TFrmCD.SelectInvFromVendors;
begin
  if fCheckDiscount then
  begin
    if wwDBDiscountDate.DateTime > DM.TblPrePostCtrlOUTLOOK_DATE.asDateTime then
//      fInvSql := fSql1 + IQFormat('and v.vendor_id = %f and NVL(remit_to_id, 0) = %f and (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(v.current_discount, 0) > 0)',
      fInvSql := fSql1 + IQFormat('and v.vendor_id = %f and NVL(remit_to_id, 0) = %f and (v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                          'or (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') ) )',
                                         [DM.QryPrepost.FieldByName('VENDOR_ID').asFloat,
                                          DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat,
                                         FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                         FormatDateTime('mm/dd/yyyy', wwDBDiscountDate.DateTime)])
    else
      fInvSql := fSql1 + IQFormat('and v.vendor_id = %f and NVL(remit_to_id, 0) = %f and (v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                          'or (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                          'and NVL(v.current_discount, 0) > 0) )',
                                         [DM.QryPrepost.FieldByName('VENDOR_ID').asFloat,
                                          DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat,
                                         FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                         FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
    fInvSqlNoDate := fSql1 + IQFormat('and v.vendor_id = %f and NVL(remit_to_id, 0) = %f',
                                       [DM.QryPrepost.FieldByName('VENDOR_ID').asFloat,
                                        DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat]);


    if Dontshowinvoiceswithpastduediscounts1.Checked then
    begin
      fInvSql := fInvSql + Format(' and v.disc_date >= To_Date(''%s'', ''MM/DD/RRRR'') ',
                           [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE').asDateTime)]);

      fInvSqlNoDate := fInvSqlNoDate + Format(' and v.disc_date >= To_Date(''%s'', ''MM/DD/RRRR'') ',
                           [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE').asDateTime)]);



      fInvSql := fInvSql + Format(' and not (v.disc_date < To_Date(''%s'', ''MM/DD/RRRR'') '+
                                  ' and v.due_date  > To_Date(''%s'', ''MM/DD/RRRR''))',
                           [FormatDateTime('mm/dd/yyyy', Date),
                            FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);

      fInvSqlNoDate := fInvSqlNoDate + Format(' and not (v.disc_date < To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                  ' and v.due_date  > To_Date(''%s'', ''MM/DD/RRRR''))',
                           [FormatDateTime('mm/dd/yyyy', Date),
                            FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
    end;

  end
  else
  begin
   fInvSql := fSql1 + IQFormat('and v.vendor_id = %f and NVL(remit_to_id, 0) = %f and v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'')',
                       [DM.QryPrepost.FieldByName('VENDOR_ID').asFloat,
                        DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat,
                       FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
   fInvSqlNoDate := fSql1 + IQFormat('and v.vendor_id = %f and NVL(remit_to_id, 0) = %f',
                       [DM.QryPrepost.FieldByName('VENDOR_ID').asFloat,
                        DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat]);
  end;

  if DM.TblPrePostCtrlAP_REMITTANCE_TYPE.asString <> '' then
  begin
    fInvSql := fInvSql + Format(' and v.remit_to_id  in (select id from remit_to where AP_REMITTANCE_TYPE = ''%s'') ',
                       [DM.TblPrePostCtrlAP_REMITTANCE_TYPE.asString]);

    fInvSqlNoDate := fInvSqlNoDate + Format(' and v.remit_to_id  in (select id from remit_to where AP_REMITTANCE_TYPE = ''%s'') ',
                       [DM.TblPrePostCtrlAP_REMITTANCE_TYPE.asString]);
  end;



  OpenInv;
end;

procedure TFrmCD.SelectInvFromAllInv;
var
  AId        :Real;
  AVendorId  :Real;
  ARemitToId :Real;
  AOnHold    :String;
  AInvoiceNo :String;
  ADiscDate  :TDateTime;
  AAmountToPay :Real;
  ACurrentDisc :Real;
begin
  with DM.PKAllInv do
  begin
    if fCheckDiscount then
    begin
      if wwDBDiscountDate.DateTime > DM.TblPrePostCtrlOUTLOOK_DATE.asDateTime then
        Sql.Text := FPKSql + Format(' and (v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                    'or (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') ) )',
                                   [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                    FormatDateTime('mm/dd/yyyy', wwDBDiscountDate.DateTime)])

//       Sql.Text := FPKSql + Format(' and (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(v.current_discount, 0) > 0) )',
//                                   [FormatDateTime('mm/dd/yyyy', wwDBDiscountDate.Date)])
      else
        Sql.Text := FPKSql + Format(' and (v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                    'or (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(v.current_discount, 0) > 0) )',
                                   [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                    FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)])
    end
    else
      Sql.Text := FPKSql + Format(' and v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'')',
                         [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
    if Execute then
    begin

      try
        DM.QryPrepost.CheckBrowseMode;

        AId        := GetValue('ID');
        AVendorId  := GetValue('VENDOR_ID');
        ARemitToId := GetValue('REMIT_TO_ID');
        AOnHold    := GetValue('ON_HOLD');
        AInvoiceNo := GetValue('INVOICE_NO');
        ADiscDate  := GetValue('DISC_DATE');
        AAmountToPay := GetValue('AMOUNT_TO_PAY');
        ACurrentDisc := GetValue('CURRENT_DISCOUNT');

        CheckVendStatusFor( AVendorId, ['Payment Hold', 'Not Active'] );  {in VStatChk.pas}
        if SelectValueAsFloat(IQFormat('select count(id) from cdprepost ' +
                            'where vendor_id = %f ' +
                            'and NVL(remit_to_id, 0) = %f ' +
                            'and cdprepost_control_id = %f ',
                         [AVendorId, ARemitToId,
                          DM.TblPrePostCtrl.FieldByName('ID').asFloat])) <> 0
           //'Vendor already exists in the batch.'
           then raise Exception.Create(cd_rscstr.cTXT0000012);

        if SelectValueAsFloat(IQFormat('select count(id) from cdprepost where vendor_id = %f and NVL(remit_to_id, 0) = %f',
                         [AVendorId, ARemitToId])) <> 0
           //'Vendor already exists in the prepost table.'
           then raise Exception.Create(cd_rscstr.cTXT0000013);

        DM.QryPrepost.AfterInsert := nil;
        if not (DM.QryPrepost.State in [dsEdit, dsInsert]) then DM.QryPrepost.Append;
        DM.QryPrepost.FieldByName('VENDOR_ID').asFloat := AVendorId;
        if ARemitToId <> 0 then
          DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat := ARemitToId;
        DM.QryPrepost.FieldByName('PRINT').asString := 'Y';
        DM.QryPrepost.FieldByName('CHECK_TYPE').asString := 'AP';
        DM.QryPrepost.Post;
        SrcPrePostDataChange(nil, nil);

//        if not CheckForSameCurrency(AID) then
//          raise Exception.Create('Cannot accept invoice with a different currency');
        if AOnHold = 'Y' then
           // 'The invoice is on hold.  Do you still want to use it?'
          if not IQConfirmYN(cd_rscstr.cTXT0000014) then Exit;
        try
          DM.QryPrePostDtl.AfterInsert := nil;
          DM.SrcPrePost.OnDataChange   := nil;

          if SelectValueAsFloat(IQFormat('select count(id) from cdprepost_detail where apinvoice_id = %f and cdprepost_id = %f',
                           [AId,
                            DM.QryPrepost.FieldByName('ID').asFloat])) <> 0
             then raise Exception.Create(Format(cd_rscstr.cTXT0000015, // 'Invoice %s already exists in the check'
                                         [AInvoiceNo]));

          if not (DM.QryPrePostDtl.State in [dsEdit, dsInsert]) then DM.QryPrePostDtl.Append;
          DM.QryPrePostDtl.FieldByName('APINVOICE_ID').asFloat := AId;
          DM.QryPrePostDtl.FieldByName('CDPREPOST_ID').asFloat := DM.QryPrepost.FieldByName('ID').asFloat;

          if fFill then
          begin
//            if ADiscDate  >= DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime then
            if ADiscDate  >= DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime then
            begin
              DM.QryPrePostDtl.FieldByName('AMOUNT_PAID').asFloat       := AAmountToPay - ACurrentDisc;
              DM.QryPrePostDtl.FieldByName('AP_DISCOUNT_TAKEN').asFloat := ACurrentDisc;
            end
            else
              DM.QryPrePostDtl.FieldByName('AMOUNT_PAID').asFloat       := AAmountToPay;
            if DM.QryPrePostDtl.FieldByName('AP_DISCOUNT_TAKEN').asFloat <> 0 then GetDiscountAccount;
          end;
        finally
          DM.QryPrePostDtl.AfterInsert := QryPrePostDtlAfterInsert;
          DM.SrcPrePost.OnDataChange   := SrcPrePostDataChange;
          DM.QryPrePostDtl.CheckBrowseMode;
        end;
      finally
        DM.QryPrepost.AfterInsert := QryPrePostAfterInsert;
        Screen.Cursor := crDefault;
      end;
//      DM.QryCtrlTotal.Close;
//      DM.QryCtrlTotal.Open;
    end;
  end;
end;

procedure TFrmCD.CreateInvoiceCheck;
var
  ASql, ASqlNoDate:String;
  ACode:String;
begin
  ASqlNoDate := fSql3;
  if fCheckDiscount then
  begin
    if wwDBDiscountDate.DateTime > DM.TblPrePostCtrlOUTLOOK_DATE.asDateTime then
      ASql := fSql3 + Format('and (v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                          'or (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') ) )',
                                         [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                         FormatDateTime('mm/dd/yyyy', wwDBDiscountDate.DateTime)])

//      ASql := fSql3 + Format('and (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(v.current_discount, 0) > 0) ',
//                                         [FormatDateTime('mm/dd/yyyy', wwDBDiscountDate.Date)])
    else
      ASql := fSql3 + Format('and (v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                          'or (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                          'and NVL(v.current_discount, 0) > 0) )',
                                         [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                         FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);


    if CbFilterVendor.Checked then
    begin
      ACode := SelectValueFmtAsString('select curr_code from currency where id = %f', [DM.TblPrePostCtrlCURRENCY_ID.asFloat]);
      ASql := ASql + IqFormat(' and v.currency_id in (select id from currency where curr_code = ''%s'') ', [ACode]);
    end;


    if Dontshowinvoiceswithpastduediscounts1.Checked then
//      ASql := ASql + ' and v.disc_date >= To_Date(:nDate, ''MM/DD/RRRR'') '
      ASql := ASql + Format(' and not (v.disc_date < To_Date(''%s'', ''MM/DD/RRRR'') '+
                                  ' and v.due_date > To_Date(''%s'', ''MM/DD/RRRR'')) ',
                           [FormatDateTime('mm/dd/yyyy', Date),
                            FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);




  end
  else
    ASql := fSql3 + Format('and v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'')',
                         [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);

    if CbFilterVendor.Checked then
    begin
      ACode := SelectValueFmtAsString('select curr_code from currency where id = %f', [DM.TblPrePostCtrlCURRENCY_ID.asFloat]);
      ASql := ASql + IqFormat(' and v.currency_id in (select id from currency where curr_code = ''%s'') ', [ACode]);
    end;


  if DM.TblPrePostCtrlAP_REMITTANCE_TYPE.asString <> '' then
    ASql := ASql + Format(' and v.remit_to_id  in (select id from remit_to where AP_REMITTANCE_TYPE = ''%s'') ',
                       [DM.TblPrePostCtrlAP_REMITTANCE_TYPE.asString]);


  if DM.TblPrePostCtrlINTL_PAY_TYPE.AsString <> '' then
    ASql := ASql + Format(' and v.remit_to_id  in (select id from remit_to where intl_pay_type = ''%s'') ', [DM.TblPrePostCtrlINTL_PAY_TYPE.AsString]);
  DoCDAllInvoices(ASql, ASqlNoDate);  {in cdallinv.pas}

end;

procedure TFrmCD.SelectCheckFromVendors;
var
  ASql:String;
  AStr:String;
  ACode:String;
begin

  if DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat <> 0 then
    AStr := IQFormat('select distinct vendor_id, remit_to_id from v_apinvoice_cheque ' +
                   ' where eplant_id = %f and NVL(amount_to_pay, 0) <> 0 and NVL(ON_HOLD, ''N'') = ''N'' ',
//                   '  and misc.multi_eplant_filter_incl_nulls(eplant_id, ''CD'') = 1 ',
                   [DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat])
  else
    AStr := 'select distinct vendor_id, remit_to_id from v_apinvoice_cheque ' +
                   ' where NVL(amount_to_pay, 0) <> 0 and NVL(ON_HOLD, ''N'') = ''N'' ';
//                   '  and misc.multi_eplant_filter_incl_nulls(eplant_id, ''CD'') = 1 ';



  if CbFilterVendor.Checked then
  begin
    ACode := SelectValueFmtAsString('select curr_code from currency where id = %f', [DM.TblPrePostCtrlCURRENCY_ID.asFloat]);
    AStr := AStr + IqFormat(' and currency_id in (select id from currency where curr_code = ''%s'') ', [ACode]);
  end;



  if Dontshowinvoiceswithpastduediscounts1.Checked then
//    AStr := AStr + Format(' and disc_date >= To_Date(''%s'', ''MM/DD/RRRR'') ',
//                           [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE').asDateTime)]);

    AStr := AStr + Format(' and not (disc_date < To_Date(''%s'', ''MM/DD/RRRR'') '+
                                  ' and due_date > To_Date(''%s'', ''MM/DD/RRRR''))',
                           [FormatDateTime('mm/dd/yyyy', Date),
                            FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);


  if fCheckDiscount then
  begin
    if wwDBDiscountDate.DateTime > DM.TblPrePostCtrlOUTLOOK_DATE.asDateTime then
      AStr := AStr + Format('and (due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                          'or (disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') )) ',
                                       [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                       FormatDateTime('mm/dd/yyyy', wwDBDiscountDate.DateTime)])

//      AStr := AStr + Format('and (disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(current_discount, 0) > 0) ',
//                                       [FormatDateTime('mm/dd/yyyy', wwDBDiscountDate.Date)])
   else
      AStr := AStr + Format('and (due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                          'or (disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                        ' and NVL(current_discount, 0) > 0)) ',
                                       [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                       FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
  end
  else
  begin
    AStr := AStr + Format('and due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ',
                       [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
  end;


  if DM.TblPrePostCtrlAP_REMITTANCE_TYPE.asString <> '' then
    AStr := AStr + Format(' and remit_to_id  in (select id from remit_to where AP_REMITTANCE_TYPE = ''%s'') ',
                       [DM.TblPrePostCtrlAP_REMITTANCE_TYPE.asString]);


  if DM.TblPrePostCtrlINTL_PAY_TYPE.AsString <> '' then
    fVendorSql := StrTran(Format(fSql10 + 'and r.intl_pay_type = ''%s''', [DM.TblPrePostCtrlINTL_PAY_TYPE.AsString]), 'v_apinvoice_cheque_eplant', Format(' ( %s ) ', [AStr]))
  else
    fVendorSql := StrTran(fSql10, 'v_apinvoice_cheque_eplant', Format(' ( %s ) ', [AStr]));





{
  if DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat <> 0 then
    ASql := Format(FSql5, [DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat, DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat])
  else
    ASql := FSql2;

  if fCheckDiscount then
  begin
    fVendorSql := ASql + Format('and (due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                      'or (invoice_date +  ' +
                                      'NVL(discount_days, 0) <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(current_discount, 0) > 0))) ',
                                     [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                     FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
    if DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat <> 0 then
      fVendorSql := fVendorSql + Format(FSql5A, [DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat,
                                                 DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat]) +
                    Format('and (due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                      'or (invoice_date +  ' +
                                      'NVL(discount_days, 0) <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(current_discount, 0) > 0))) ',
                                     [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                     FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)])
    else
      fVendorSql := fVendorSql + FSql2A  + Format('and (due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                      'or (invoice_date +  ' +
                                      'NVL(discount_days, 0) <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(current_discount, 0) > 0))) ',
                                     [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                     FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)])

  end
  else
  begin
    fVendorSql := ASql + Format('and due_date <= To_Date(''%s'', ''MM/DD/RRRR'')) ',
                       [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
    if DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat <> 0 then
      fVendorSql := fVendorSql + Format(FSql5A, [DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat,
                                                DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat]) +
                         Format('and due_date <= To_Date(''%s'', ''MM/DD/RRRR'')) ',
                         [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)])
    else
      fVendorSql := fVendorSql + FSql2A + Format('and due_date <= To_Date(''%s'', ''MM/DD/RRRR'')) ',
                         [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
  end;
 }
  OpenVendors;
end;

procedure TFrmCD.SelectCheckFromAllVendors;
var
  AId:Real;
  AVendorId:Real;
  AQry:TFDQuery;
  Anative_curr, Acurr_code:String;
  ACurrId, ASpotrate, AOldSpotRate:Real;
  ARemittoId:Real;
begin
  with DM.PkVendor do
  if execute then
    AVendorId := GetValue('ID')
  else
    exit;

  AQry := TFDQuery.Create(nil);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IqFormat('select * from vendor where id = %f', [AVendorId]));
    Open;
    if Eof and Bof then exit;

     AId := GetNextID('CDPREPOST');
     ARemittoId := SelectValueFmtAsFloat('select id from remit_to where vendor_id = %f and NVL(default_remit_to, ''N'') = ''Y''', [AVendorId]);
     if ARemittoId = 0 then
       ARemittoId := SelectValueFmtAsFloat('select min(id) from remit_to where vendor_id = %f' , [AVendorId]);

     if ARemittoId <> 0 then
       ExecuteCommandFmt('insert into cdprepost (id, cdprepost_control_id, vendor_id, remit_to_id, print, check_type, currency_id) ' +
                 'values (%f, %f, %f, Decode(%f, 0, null, %f), ''Y'', ''AP'', Decode(%f, 0, null, %f))',
                 [AID,
                  DM.TblPrePostCtrl.FieldByName('ID').asFloat,
                  FieldByName('ID').asFloat,
                  ARemittoId,
                  ARemittoId,
                  FieldByName('CURRENCY_ID').asFloat,
                  FieldByName('CURRENCY_ID').asFloat])
      else
       ExecuteCommandFmt('insert into cdprepost (id, cdprepost_control_id, vendor_id, print, check_type, currency_id) ' +
                 'values (%f, %f, %f, ''Y'', ''AP'', Decode(%f, 0, null, %f))',
                 [AID,
                  DM.TblPrePostCtrl.FieldByName('ID').asFloat,
                  FieldByName('ID').asFloat,
                  FieldByName('CURRENCY_ID').asFloat,
                  FieldByName('CURRENCY_ID').asFloat]);

       if (FieldByName('CURRENCY_ID').asFloat = 0)
       and (DM.TblPrePostCtrlCURRENCY_ID.asFloat <> 0) then
         ExecuteCommandFmt('update cdprepost set currency_id = %f, exchange_rate = 1 where id = %f',
                   [DM.TblPrePostCtrlCURRENCY_ID.asFloat, AId]);

       if DM.TblPrePostCtrlEPLANT_ID.asFloat <> 0 then
         ExecuteCommandFmt('update cdprepost set eplant_id = %f where id = %f',
                   [DM.TblPrePostCtrlEPLANT_ID.asFloat, AId]);

       if (FieldByName('CURRENCY_ID').asFloat <> 0)
       and (DM.TblPrePostCtrlCURRENCY_ID.asFloat <> 0)
       and FMultiCurrency then
       begin

         Anative_curr := SelectValueFmtAsString('select curr_code from currency where id = %f',
         [DM.TblPrePostCtrlCURRENCY_ID.asFloat]);

         Acurr_code := SelectValueFmtAsString('select curr_code from currency where id = %f',
         [FieldByName('CURRENCY_ID').asFloat]);


         ACurrId := SelectValueFmtAsFloat('select id from currency where native_curr = ''%s'' and curr_code = ''%s''',
         [Anative_curr, Acurr_code]);

         ASpotrate := SelectValueFmtAsFloat('select balsheet_rate from currencypost where currency_id = %f and glperiods_id = %f',
                      [ACurrId,
                       DM.TblPrePostCtrlGLPERIODS_ID.asFloat]);



         if ASpotrate = 0 then
         begin
           AOldSpotRate := ASpotRate;
           if SelectValueFmtAsString('select NVL(use_daily_rate, ''N'') from currency where id = %f', [ACurrId]) = 'Y' then
           begin
             ASpotRate := SelectValueFmtAsFloat('select min(spot_rate) ' +
                                    '     from currency_rate_hist ' +
                                    '    where currency_id = %f   ' +
                                    '      and effective_date <= (select check_date from cdprepost_control h, cdprepost d  ' +
                                                                    ' where d.id = %f and d.cdprepost_control_id = h.id) ' +
                                    '      and effective_date = (select max(effective_date) ' +
                                    '                              from currency_rate_hist  ' +
                                    '                             where currency_id = %f    ' +
                                    '                               and effective_date <= (select check_date from cdprepost_control h, cdprepost d  ' +
                                                                    ' where d.id = %f and d.cdprepost_control_id = h.id))',

                                    [ACurrId,
                                     AId,
                                     ACurrId,
                                     AId]);
           if ASpotrate = 0 then
             ASpotRate := AOldSpotRate;
           end;

         end;



         if ASpotrate = 0 then
           ASpotrate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f',
                                   [ACurrId]);

         if ASpotrate <> 0 then
           ExecuteCommandFmt('update cdprepost set exchange_rate = %.6f where id = %f',
                     [ASpotRate, AId]);

       end;

    DM.QryPrepost.Close;
    DM.QryPrepost.Open;
    SrcPrePostDataChange(nil, nil);



  finally
    Free;
  end;

end;


procedure TFrmCD.OpenVendors;
begin
  if fVendors <> nil then Exit;
  fVendors := TFrmCdVendors.Create(self);
  fVendors.Show;
end;

procedure TFrmCD.CloseVendors;
begin
  if fVendors <> nil then fVendors.Close;
  fVendors := nil;
end;

procedure TFrmCD.OpenInv;
begin
  if fInv <> nil then Exit;
  fInv := TFrmCdInv.Create(self);
  fInv.Show;
end;

procedure TFrmCD.CloseInv;
begin
  if fInv <> nil then fInv.Close;
  fInv := nil;
end;


procedure TFrmCD.CreateQuickCheck;
begin
  try
    DM.QryPrepost.AfterInsert := nil;
    with DM.QryPrePost do
    begin
      if not (State in [dsEdit, dsInsert]) then Append;
      FieldByName('PRINT').asString := 'Y';
      FieldByName('CHECK_TYPE').asString := 'QUICK';
      if DM.TblPrePostCtrlCURRENCY_ID.asFloat <> 0 then
        FieldByName('CURRENCY_ID').asFloat := DM.TblPrePostCtrlCURRENCY_ID.asFloat;

       if DM.TblPrePostCtrlEPLANT_ID.asFloat <> 0 then
         FieldByName('EPLANT_ID').asFloat := DM.TblPrePostCtrlEPLANT_ID.asFloat;
    end;
//    GridPrePost.DataSource:= NIL;
    PCCheck.ActivePage := TabQuick;
    ResetQryPrepostDtl;
  finally
    DM.QryPrepost.AfterInsert := QryPrePostAfterInsert;
  end;
end;

procedure TFrmCD.CreateNONGLCheck;
begin
  try
    DM.QryPrepost.AfterInsert := nil;
    with DM.QryPrePost do
    begin
//      if not (State in [dsEdit, dsInsert]) then Append;
      FieldByName('PRINT').asString := 'Y';
      FieldByName('CHECK_TYPE').asString := 'NONGL';
    end;
//    GridPrePost.DataSource:= NIL;
    PCCheck.ActivePage := TabQuick;
  finally
    DM.QryPrepost.AfterInsert := QryPrePostAfterInsert;
    cbManual2.Checked := true;
    PCCheck.ActivePage := TabQuick;
    DBCheckNo2.Visible := True;
    Label16.Visible    := True;
  end;
end;



procedure TFrmCD.GridPrePostDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if ( (fVendors <> nil) and (Source = fVendors.IqSearch1.DbGrid) )
    then Accept := True
    else Accept := False;

end;

procedure TFrmCD.GridDetailDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if ( (fInv <> nil) and (Source = fInv.IQSearch1.DbGrid) )
    then Accept := True
    else Accept := False;

end;

procedure TFrmCD.GridPrePostDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (fVendors <> nil) and (Source = fVendors.IqSearch1.DBGrid)
    then ProcessAcceptVendor;

end;

procedure TFrmCD.ProcessAcceptAllVendors;
var
  AAfterPost : TDataSetNotifyEvent;
  AID:Real;
  ABadVendors:TStringList;
  I:Integer;
  AAmount:Real;
  ASpotRate:Real;
  Anative_curr, Acurr_code:String;
  ACurrId:Real;
  AOldSpotRate:Real;
begin
  AId := 0;
  try
    ABadVendors := TStringList.Create;
    DM.TblPrePostCtrl.CheckBrowseMode;
    AAfterPost := DM.QryPrepost.AfterPost;
    DM.QryPrepost.AfterPost := nil;

    DM.QryPrepost.AfterInsert := nil;
    DM.QryPrepost.CheckBrowseMode;

    with fVendors.IqSearch1.DbGrid, fVendors.IqSearch1.DbGrid.datasource.dataset do
    begin
      for i:= 0 to selectedRows.Count-1 do
      begin
        GoToBookmark(selectedRows.items[i]);
        try
          CheckVendStatusFor( fVendors.QryVendor.FieldByName('VENDOR_ID').asFloat,
                            ['Payment Hold', 'Not Active'] );  {in VStatChk.pas}
        except
          on E:Exception do
          begin
            IqConfirm(E.Message);
            Continue;
          end;
        end;

        if SelectValueAsFloat(IQFormat('select count(c.id) from cdprepost c, cdprepost_control d ' +
                         'where c.cdprepost_control_id = d.id and c.vendor_id = %f and c.remit_to_id = %f ' +
                         'and NVL(d.eplant_id, 0) = %f',
                         [fVendors.QryVendor.FieldByName('VENDOR_ID').asFloat,
                          fVendors.QryVendor.FieldByName('REMIT_TO_ID').asFloat,
                          DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat])) <> 0
        then
        begin
          ABadVendors.Add(PadR(fVendors.QryVendor.FieldByName('COMPANY').asString, 30) + ' (Exists in the Prepost table)');
          Continue;
        end;

//        if FMultiCurrency and (fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat <> 0) and
//           (fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat <> DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat)
//        then
//        begin
//          ABadVendors.Add(PadR(fVendors.QryVendor.FieldByName('COMPANY').asString, 30) + ' (Has different currency)');
//          Continue;
//        end;

        if fVendors.CBIncInv.Checked then
        begin
          AAmount := GetTotalInvoiceAmount(AId, fVendors.QryVendor.FieldByName('VENDOR_ID').asFloat,
                                           fVendors.QryVendor.FieldByName('REMIT_TO_ID').asFloat);
          if AAmount < 0 then
          begin
            ABadVendors.Add(PadR(fVendors.QryVendor.FieldByName('COMPANY').asString, 30) +
                            ' (Outstanding amount is less than zero)');
            Continue;
          end;
        end;

        AId := GetNextID('CDPREPOST');
        if SelectValueFmtAsFloat('select id from remit_to where id = %f',
         [fVendors.QryVendor.FieldByName('REMIT_TO_ID').asFloat]) <> 0 then
          ExecuteCommandFmt('insert into cdprepost (id, cdprepost_control_id, vendor_id, remit_to_id, print, check_type, currency_id) ' +
                    'values (%f, %f, %f, Decode(%f, 0, null, %f), ''Y'', ''AP'', Decode(%f, 0, null, %f))',
                    [AID,
                     DM.TblPrePostCtrl.FieldByName('ID').asFloat,
                     fVendors.QryVendor.FieldByName('VENDOR_ID').asFloat,
                     fVendors.QryVendor.FieldByName('REMIT_TO_ID').asFloat,
                     fVendors.QryVendor.FieldByName('REMIT_TO_ID').asFloat,
                     fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat,
                     fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat])
         else
          ExecuteCommandFmt('insert into cdprepost (id, cdprepost_control_id, vendor_id, print, check_type, currency_id) ' +
                    'values (%f, %f, %f, ''Y'', ''AP'', Decode(%f, 0, null, %f))',
                    [AID,
                     DM.TblPrePostCtrl.FieldByName('ID').asFloat,
                     fVendors.QryVendor.FieldByName('VENDOR_ID').asFloat,
                     fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat,
                     fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat]);

          if (fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat = 0)
          and (DM.TblPrePostCtrlCURRENCY_ID.asFloat <> 0) then
            ExecuteCommandFmt('update cdprepost set currency_id = %f, exchange_rate = 1 where id = %f',
                      [DM.TblPrePostCtrlCURRENCY_ID.asFloat, AId]);

          if DM.TblPrePostCtrlEPLANT_ID.asFloat <> 0 then
            ExecuteCommandFmt('update cdprepost set eplant_id = %f where id = %f',
                   [DM.TblPrePostCtrlEPLANT_ID.asFloat, AId]);
                     

          if (fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat <> 0)
          and (DM.TblPrePostCtrlCURRENCY_ID.asFloat <> 0)
          and FMultiCurrency then
          begin



            Anative_curr := SelectValueFmtAsString('select curr_code from currency where id = %f',
            [DM.TblPrePostCtrlCURRENCY_ID.asFloat]);

            Acurr_code := SelectValueFmtAsString('select curr_code from currency where id = %f',
            [fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat]);


            ACurrId := SelectValueFmtAsFloat('select id from currency where native_curr = ''%s'' and curr_code = ''%s''',
            [Anative_curr, Acurr_code]);

            ASpotrate := SelectValueFmtAsFloat('select balsheet_rate from currencypost where currency_id = %f and glperiods_id = %f',
                         [ACurrId,
                          DM.TblPrePostCtrlGLPERIODS_ID.asFloat]);



            if ASpotrate = 0 then
            begin
              AOldSpotRate := ASpotRate;
              if SelectValueFmtAsString('select NVL(use_daily_rate, ''N'') from currency where id = %f', [ACurrId]) = 'Y' then
              begin
                ASpotRate := SelectValueFmtAsFloat('select min(spot_rate) ' +
                                       '     from currency_rate_hist ' +
                                       '    where currency_id = %f   ' +
                                       '      and effective_date <= (select check_date from cdprepost_control h, cdprepost d  ' +
                                                                       ' where d.id = %f and d.cdprepost_control_id = h.id) ' +
                                       '      and effective_date = (select max(effective_date) ' +
                                       '                              from currency_rate_hist  ' +
                                       '                             where currency_id = %f    ' +
                                       '                               and effective_date <= (select check_date from cdprepost_control h, cdprepost d  ' +
                                                                       ' where d.id = %f and d.cdprepost_control_id = h.id))',

                                       [ACurrId,
                                        AId,
                                        ACurrId,
                                        AId]);
              if ASpotrate = 0 then
                ASpotRate := AOldSpotRate;
              end;

            end;



            if ASpotrate = 0 then
              ASpotrate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f',
                                      [ACurrId]);

            if ASpotrate <> 0 then
              ExecuteCommandFmt('update cdprepost set exchange_rate = %.6f where id = %f',
                        [ASpotRate, AId]);


{
            ASpotrate := SelectValueFmtAsFloat('select balsheet_rate from currencypost where currency_id = %f and glperiods_id = %f',
                         [DM.TblPrePostCtrlCURRENCY_ID.asFloat,
                          DM.TblPrePostCtrlGLPERIODS_ID.asFloat]);
//                         [fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat,
//                          DM.TblPrePostCtrlGLPERIODS_ID.asFloat]);

            if ASpotrate = 0 then
              ASpotrate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f',
                                      [DM.TblPrePostCtrlCURRENCY_ID.asFloat]);
//                                      [fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat]);

            if ASpotrate <> 0 then
              ExecuteCommandFmt('update cdprepost set exchange_rate = %.6f where id = %f',
                        [1/ASpotRate, AId]);
//            ExecuteCommandFmt('update cdprepost set exchange_rate = %.6f where id = %f',
//                      [ASpotRate/DM.TblPrePostCtrlSPOTRATE.asFloat, AId]);

}
          end;


         if fVendors.CBIncInv.Checked then
           AppendVendorInvoices(AId, fVendors.QryVendor.FieldByName('VENDOR_ID').asFloat,
                                     fVendors.QryVendor.FieldByName('REMIT_TO_ID').asFloat);

      end;
    end;
    DM.QryPrepost.Close;
    DM.QryPrepost.Open;
    SrcPrePostDataChange(nil, nil);
    DM.QryPrePostDtl.Close;
    DM.QryPrePostDtl.Open;
    if ABadVendors.Count <> 0 then
      DoShowCDErrors( ABadVendors, cd_rscstr.cTXT0000016 {'Rejected Vendors'} );    {in edbadord.pas (EDI)}
    //fVendors.IQSearch1.DbGrid.UnSelectAll;
    CloseVendors;

  finally
    ABadVendors.Free;
    DM.QryPrepost.AfterPost := AAfterPost;
    DM.QryPrepost.AfterInsert := QryPrePostAfterInsert;
    Screen.Cursor := crDefault;
  end;

//  DM.QryCtrlTotal.Close;
//  DM.QryCtrlTotal.Open;
end;

procedure TFrmCD.ProcessAcceptVendor;
var
  AId:Real;
  AAmount:Real;
begin
  AId := 0;
  try
    DM.QryPrepost.CheckBrowseMode;
    CheckVendStatusFor( fVendors.QryVendor.FieldByName('VENDOR_ID').asFloat,
                        ['Payment Hold', 'Not Active'] );  {in VStatChk.pas}
    if SelectValueAsFloat(IQFormat('select count(id) from cdprepost ' +
                        'where vendor_id = %f ' +
                        'and NVL(remit_to_id, 0) = %f ' +
                        'and cdprepost_control_id = %f ',
                     [fVendors.QryVendor.FieldByName('VENDOR_ID').asFloat,
                      fVendors.QryVendor.FieldByName('REMIT_TO_ID').asFloat,
                      DM.TblPrePostCtrl.FieldByName('ID').asFloat])) <> 0
       // 'Vendor already exists in the batch.'
       then raise Exception.Create(cd_rscstr.cTXT0000081);

//    if FMultiCurrency and (fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat <> 0) and
//       (fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat <> DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat)
//     then raise Exception.Create('Vendor has a different currency');

    if SelectValueAsFloat(IQFormat('select count(c.id) from cdprepost c, cdprepost_control d ' +
                     'where c.cdprepost_control_id = d.id and c.vendor_id = %f ' +
                     'and NVL(c.remit_to_id, 0) = %f and NVL(d.eplant_id, 0) = %f',
                     [fVendors.QryVendor.FieldByName('VENDOR_ID').asFloat,
                      fVendors.QryVendor.FieldByName('REMIT_TO_ID').asFloat,
                      DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat])) <> 0
       //'Vendor already exists in the prepost table.'
       then raise Exception.Create(cd_rscstr.cTXT0000013);

    if fVendors.CBIncInv.Checked then
    begin
      AAmount := GetTotalInvoiceAmount(AId, fVendors.QryVendor.FieldByName('VENDOR_ID').asFloat,
                                       fVendors.QryVendor.FieldByName('REMIT_TO_ID').asFloat);
      if AAmount < 0
         { 'The sum of the amount of outstanding invoices from this vendor
           is less than zero.'}
         then raise Exception.Create(cd_rscstr.cTXT0000017);
    end;


    DM.QryPrepost.AfterInsert := nil;
    with DM.QryPrePost do
    begin
      if not (State in [dsEdit, dsInsert]) then Append;
      FieldByName('VENDOR_ID').asFloat := fVendors.QryVendor.FieldByName('VENDOR_ID').asFloat;
      if fVendors.QryVendor.FieldByName('REMIT_TO_ID').asFloat <> 0 then
        if SelectValueFmtAsFloat('select id from remit_to where id = %f',
        [fVendors.QryVendor.FieldByName('REMIT_TO_ID').asFloat]) <> 0 then
        FieldByName('REMIT_TO_ID').asFloat := fVendors.QryVendor.FieldByName('REMIT_TO_ID').asFloat;
      FieldByName('PRINT').asString := 'Y';
      FieldByName('CHECK_TYPE').asString := 'AP';
      FieldByName('ID').asFloat := GetNextID('CDPREPOST');
      if fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat <> 0 then
        FieldByName('CURRENCY_ID').asFloat := fVendors.QryVendor.FieldByName('CURRENCY_ID').asFloat;

      if (FieldByName('CURRENCY_ID').asFloat = 0) and (DM.TblPrePostCtrlCURRENCY_ID.asFloat <> 0) then
        FieldByName('CURRENCY_ID').asFloat := DM.TblPrePostCtrlCURRENCY_ID.asFloat;

      AId := FieldByName('ID').asFloat;
      Post;
      Close;
      Open;
      Locate('ID', AId, []);
      SrcPrePostDataChange(nil, nil);
      if fVendors.CBIncInv.Checked then AppendVendorInvoices(0, 0, 0);
      DM.QryPrePostDtl.Close;
      DM.QryPrePostDtl.Open;

    end;
  finally
    DM.QryPrepost.AfterInsert := QryPrePostAfterInsert;
    Screen.Cursor := crDefault;
  end;
//  DM.QryCtrlTotal.Close;
//  DM.QryCtrlTotal.Open;
  DM.QryPrePostDtl.Close;
  DM.QryPrePostDtl.Open;
  DM.QryPrepost.Close;
  DM.QryPrepost.Open;
end;


function TFrmCD.GetTotalInvoiceAmount(AId, AVendorId, ARemitToId:Real):Real;
var
  cSqlSum:String;
  Qry:TFDQuery;
  NotAccepted:Integer;
  AVendId, ARemitId, AAmount:Real;
begin
  cSqlSum := 'Select sum(decode(Sign(v.disc_date - to_date(''%s'', ''MM/DD/RRRR'')), -1, v.amount_to_pay,            ' +
             ' v.amount_to_pay - v.current_discount)) ' +
          '   from v_apinvoice_cheque v  ' +
          '  where 1 = Decode(NVL(v.multicurrency, ''N''), ''Y'', Decode(v.currency_id - %f, 0, 1, 0), 1) ' +
          '    and NVL(v.amount_to_pay, 0) <> 0 ';
//  if (AId = 0) then
  if DM.QryPrepost.FieldByName('ID').asFloat <> 0 then
  begin
//    APrepostId := DM.QryPrepost.FieldByName('ID').asFloat;
    AVendId    := DM.QryPrepost.FieldByName('VENDOR_ID').asFloat;
    ARemitId   := DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat;
  end
  else
  begin
//    APrepostId := AId;
    AVendId    := AVendorId;
    ARemitId   := ARemitToId;
  end;

  if fCheckDiscount then
  begin
    if wwDBDiscountDate.DateTime > DM.TblPrePostCtrlOUTLOOK_DATE.asDateTime then
      cSqlSum := cSqlSum + IQFormat(' and NVL(v.on_hold, ''N'') = ''N'' and v.vendor_id = %f and NVL(remit_to_id, 0) = %f and (v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                        'or (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'')) )',
                                       [AVendId,
                                        ARemitId,
                                       FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                       FormatDateTime('mm/dd/yyyy', wwDBDiscountDate.DateTime)])

//      cSqlSum := cSqlSum + IQFormat(' and NVL(v.on_hold, ''N'') = ''N'' and v.vendor_id = %f and NVL(remit_to_id, 0) = %f and ((v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(v.current_discount, 0) > 0) )',
//                                       [AVendId,
//                                        ARemitId,
//                                       FormatDateTime('mm/dd/yyyy', wwDBDiscountDate.Date)])
    else
      cSqlSum := cSqlSum + IQFormat(' and NVL(v.on_hold, ''N'') = ''N'' and v.vendor_id = %f and NVL(remit_to_id, 0) = %f and (v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                        'or (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(v.current_discount, 0) > 0) )',
                                       [AVendId,
                                        ARemitId,
                                       FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                       FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
  end
  else
  begin
   cSqlSum := cSqlSum + IQFormat(' and NVL(v.on_hold, ''N'') = ''N''  and v.vendor_id = %f and NVL(remit_to_id, 0) = %f and v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'')',
                       [AVendId,
                        ARemitId,
                       FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
  end;
  if DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat <> 0 then
  begin
    cSqlSum := IQFormat(cSqlSum + ' and v.eplant_id = %f',
                   [FormatDateTime('mm/dd/yyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime),
                    DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat,
                    DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat ]);

   end
   else if IQEPlantFilterExpr <> '' then
   begin
    cSqlSum := IQFormat(cSqlSum + ' and (%s)',
                   [FormatDateTime('mm/dd/yyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime),
                    DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat,
                    IQEPlantFilterExprOracle( 'v.eplant_id' ) ]);
   end
   else
   begin
    cSqlSum := IQFormat(cSqlSum,
                   [FormatDateTime('mm/dd/yyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime),
                    DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat]);
   end;
   Result := SelectValueAsFloat(cSqlSum);
end;

procedure TFrmCD.AppendVendorInvoices(AId, AVendorId, ARemitToId:Real);
var
  cSql:string;
  Qry:TFDQuery;
  NotAccepted:Integer;
  APrepostId, AVendId, ARemitId, AAmount, ACurrencyId:Real;
  aFrom:String;
  cInsert:String;


  Apositive_amount :real;
  ANegative_amount :real;

  Apositive_Insert :String;
  ANegative_Insert :String;

begin
  cInsert := 'insert into cdprepost_detail (cdprepost_id,                                                         ' +
          '                               amount_paid,                                                         ' +
          '                               apinvoice_id,                                                        ' +
          '                               ap_discount_taken,                                                   ' +
          '                               glacct_id_ap_disc)                                                   ';


   cSql := ' select %f as cdprepost_id,                                                                         ' +
          '        decode(Sign(v.disc_date - to_date(''%s'', ''MM/DD/RRRR'')), -1, v.amount_to_pay,            ' +
          '                                                           v.amount_to_pay - v.current_discount) as amount_paid,   ' +
          '        V.id as apinvoice_id,                                                                                       ' +
          '        decode(Sign(v.disc_date - to_date(''%s'', ''MM/DD/RRRR'')), -1, 0, v.current_discount) as ap_discount_taken,     ' +
          '        decode(Sign(v.disc_date - to_date(''%s'', ''MM/DD/RRRR'')), -1, null,                       ' +
          '               Decode(Sign(Abs(v.current_discount)), 1, acct_id_apdisc, null)) as glacct_id_ap_disc    ' +
          '   from v_apinvoice_cheque v                                                                        ' +
          '    where NVL(v.amount_to_pay, 0) <> 0                                                                ';

  if Dontshowinvoiceswithpastduediscounts1.Checked then

    cSql := cSql + Format(' and not (disc_date < To_Date(''%s'', ''MM/DD/RRRR'') '+
                                  ' and due_date > To_Date(''%s'', ''MM/DD/RRRR''))',
                           [FormatDateTime('mm/dd/yyyy', Date),
                            FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);



  if AId = 0 then
  begin
    APrepostId  := DM.QryPrepost.FieldByName('ID').asFloat;
    AVendId     := DM.QryPrepost.FieldByName('VENDOR_ID').asFloat;
    ARemitId    := DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat;
  end
  else
  begin
    APrepostId := AId;
    AVendId    := AVendorId;
    ARemitId   := ARemitToId;
  end;

  if fCheckDiscount then
  begin
    if wwDBDiscountDate.DateTime > DM.TblPrePostCtrlOUTLOOK_DATE.asDateTime then
//      cSql := cSql + IQFormat(' and NVL(v.on_hold, ''N'') = ''N'' and v.vendor_id = %f and NVL(remit_to_id, 0) = %f and ((v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(v.current_discount, 0) > 0) )',
//                                       [AVendId,
//                                        ARemitId,
//                                       FormatDateTime('mm/dd/yyyy', wwDBDiscountDate.Date)])
      cSql := cSql + IQFormat(' and NVL(v.on_hold, ''N'') = ''N'' and v.vendor_id = %f and NVL(remit_to_id, 0) = %f and (v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                        'or (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'')) )',
                                       [AVendId,
                                        ARemitId,
                                       FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                       FormatDateTime('mm/dd/yyyy', wwDBDiscountDate.DateTime)])

    else
      cSql := cSql + IQFormat(' and NVL(v.on_hold, ''N'') = ''N'' and v.vendor_id = %f and NVL(remit_to_id, 0) = %f and (v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                        'or (v.disc_date <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(v.current_discount, 0) > 0) )',
                                       [AVendId,
                                        ARemitId,
                                       FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime),
                                       FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
  end
  else
  begin
   cSql := cSql + IQFormat(' and NVL(v.on_hold, ''N'') = ''N''  and v.vendor_id = %f and NVL(remit_to_id, 0) = %f and v.due_date <= To_Date(''%s'', ''MM/DD/RRRR'')',
                       [AVendId,
                        ARemitId,
                       FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('OUTLOOK_DATE').asDateTime)]);
  end;
  if DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat <> 0 then
  begin
    cSql := IQFormat(cSql + ' and v.eplant_id = %f',
                   [APrepostId,
                    FormatDateTime('mm/dd/yyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime),
                    FormatDateTime('mm/dd/yyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime),
                    FormatDateTime('mm/dd/yyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime),
                    DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat ]);
   end
   else if IQEPlantFilterExpr <> '' then
   begin
    cSql := IQFormat(cSql + ' and (%s)',
                   [APrepostId,
                    FormatDateTime('mm/dd/yyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime),
                    FormatDateTime('mm/dd/yyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime),
                    FormatDateTime('mm/dd/yyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime),
                    IQEPlantFilterExprOracle( 'v.eplant_id' ) ]);
   end
   else
   begin
    cSql := IQFormat(cSql,
                   [APrepostId,
                    FormatDateTime('mm/dd/yyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime),
                    FormatDateTime('mm/dd/yyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime),
                    FormatDateTime('mm/dd/yyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime)]);
   end;


  if DM.TblPrePostCtrlAP_REMITTANCE_TYPE.asString <> '' then
    cSql := cSql + Format(' and v.remit_to_id  in (select id from remit_to where AP_REMITTANCE_TYPE = ''%s'') ',
                       [DM.TblPrePostCtrlAP_REMITTANCE_TYPE.asString]);



  Apositive_amount := SelectValueFmtAsFloat('select sum(NVL(amount_paid, 0)) from ( %s ) where NVL(amount_paid, 0) > 0', [cSql]);
  ANegative_amount := SelectValueFmtAsFloat('select sum(NVL(amount_paid, 0)) from ( %s ) where NVL(amount_paid, 0) < 0', [cSql]);


  Apositive_Insert :=  Format('%s select * from ( %s ) where NVL(amount_paid, 0) > 0', [cInsert, cSql]);
  ExecuteCommand(Apositive_Insert);

  ANegative_Insert := IqFormat ('declare ' +
                                '  v_sum number; ' +
                                'begin   ' +
                                '  v_sum := 0; ' +
                                '  for v1 in (select * from ( %s ) where NVL(amount_paid, 0) < 0 order by NVL(amount_paid, 0) desc ) ' +
                                '    loop ' +
                                '     v_sum := v_sum + Abs(NVL(v1.amount_paid, 0)); ' +
                                '     if v_sum <= %f then ' +
                                '       insert into cdprepost_detail (cdprepost_id,      ' +
                                '                                     amount_paid,       ' +
                                '                                     apinvoice_id,      ' +
                                '                                     ap_discount_taken, ' +
                                '                                     glacct_id_ap_disc) ' +
                                '       values (v1.cdprepost_id,      ' +
                                '               v1.amount_paid,       ' +
                                '               v1.apinvoice_id,      ' +
                                '               v1.ap_discount_taken, ' +
                                '               v1.glacct_id_ap_disc); ' +
                                '     end if;  ' +
                                '    end loop; ' +
                                ' end; ', [cSql, Apositive_amount]);

  ExecuteCommand(ANegative_Insert);


//   ExecuteCommand(cSql);
   AFrom := Copy(cSql, Pos('from', cSql), Length(cSql));

   ACurrencyId := SelectValueFmtAsFloat('select currency_id %s and NVL(currency_id, 0) <> 0', [AFrom]);

   ProcessInvoiceCurrency(ACurrencyId, APrepostId);

end;

//function TFrmCD.CheckForSameCurrency(AID:Real):Boolean;
//var
//  nId:Real;
//begin
//  Result := True;
//  if not FMultiCurrency then Exit;
//  nId := SelectValueFmtAsFloat('select currency_id from apinvoice where id = %f', [AID]);
//  if nId = 0 then
//    nId := GetEplantNativeCurrencyId; {in McShare.pas}
//  if nId <> DM.QryPrepost.FieldByName('CURRENCY_ID').asFloat then
//    Result := False;
//end;


procedure TFrmCD.QryPrePostBeforePost(DataSet: TDataSet);
var
  ASpotrate:Real;
  Anative_curr, Acurr_code:String;
  ACurrId:Real;
  AOldSpotRate:Real;
begin
  with DM.QryPrePost do
  begin
    if (FieldByName('PRINT').asString = 'N') and Empty(FieldByName('CHECK_NO').asString)
      // 'Manual Check must have a check number.'
      then raise Exception.Create(cd_rscstr.cTXT0000018);
  end;
  if DM.TblPrePostCtrl.FieldByName('ID').asFloat = 0 then
     // 'Parent record not found.  Please assign a parent record.'
    raise Exception.Create(cd_rscstr.cTXT0000003);

  if DM.QryPrepostID.AsFloat = 0 then
  begin
    DM.QryPrepostID.AsFloat := GetNextID('CDPREPOST');
//    if PCCheck.ActivePage = TabQuick then
//      FPrepostId := DM.QryPrepostID.AsFloat
//    else
//      FPrepostId := 0;
  end;
  FPrepostId := DM.QryPrepostID.AsFloat;



  DM.QryPrepostEXCHANGE_RATE.asFloat := 1;

  if (DM.QryPrepostCURRENCY_ID.asFloat <> 0) and (DM.TblPrePostCtrlSPOTRATE.asFloat <> 0) then
  begin

     Anative_curr := SelectValueFmtAsString('select curr_code from currency where id = %f',
     [DM.TblPrePostCtrlCURRENCY_ID.asFloat]);

     Acurr_code := SelectValueFmtAsString('select curr_code from currency where id = %f',
     [DM.QryPrepostCURRENCY_ID.asFloat]);


     ACurrId := SelectValueFmtAsFloat('select id from currency where native_curr = ''%s'' and curr_code = ''%s''',
     [Anative_curr, Acurr_code]);

     ASpotrate := SelectValueFmtAsFloat('select balsheet_rate from currencypost where currency_id = %f and glperiods_id = %f',
                  [ACurrId,
                   DM.TblPrePostCtrlGLPERIODS_ID.asFloat]);

     if ASpotrate = 0 then
     begin
       AOldSpotRate := ASpotRate;


       if SelectValueFmtAsString('select NVL(use_daily_rate, ''N'') from currency where id = %f', [ACurrId]) = 'Y' then
       begin
         ASpotRate := SelectValueFmtAsFloat('select min(spot_rate) ' +
                                '     from currency_rate_hist ' +
                                '    where currency_id = %f   ' +
                                '      and effective_date <= (select check_date from cdprepost_control h, cdprepost d  ' +
                                                                ' where d.id = %f and d.cdprepost_control_id = h.id) ' +
                                '      and effective_date = (select max(effective_date) ' +
                                '                              from currency_rate_hist  ' +
                                '                             where currency_id = %f    ' +
                                '                               and effective_date <= (select check_date from cdprepost_control h, cdprepost d  ' +
                                                                ' where d.id = %f and d.cdprepost_control_id = h.id))',

                                [ACurrId,
                                 DM.QryPrepostID.AsFloat,
                                 ACurrId,
                                 DM.QryPrepostID.AsFloat]);
       if ASpotrate = 0 then
         ASpotRate := AOldSpotRate;
       end;

     end;

     if ASpotrate = 0 then
       ASpotrate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f',
                               [ACurrId]);

     if ASpotrate <> 0 then
     begin
       DM.QryPrepostEXCHANGE_RATE.asFloat := ASpotrate;
       DM.QryPrepostCURRENCY_ID.asFloat   := ACurrId;
     end


//    ASpotrate := SelectValueFmtAsFloat('select balsheet_rate from currencypost where currency_id = %f and glperiods_id = %f',
//                         [DM.QryPrepostCURRENCY_ID.asFloat,
//                          DM.TblPrePostCtrlGLPERIODS_ID.asFloat]);

//    if ASpotrate = 0 then
//      ASpotrate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f', [DM.QryPrepostCURRENCY_ID.asFloat]);
//    DM.QryPrepostEXCHANGE_RATE.asFloat := ASpotRate/DM.TblPrePostCtrlSPOTRATE.asFloat;
  end;

  if DM.QryPrepostCDPREPOST_CONTROL_ID.AsFloat = 0 then
    DM.QryPrepostCDPREPOST_CONTROL_ID.AsFloat := DM.TblPrePostCtrlID.asFloat;
end;

procedure TFrmCD.SrcPrePostDataChange(Sender: TObject; Field: TField);
begin
  CloseInv;
  with DM.QryPrePost do
  begin
    if (State in [dsBrowse]) and (PCCheck.ActivePage <> TabCheckGrid) then
    begin
      if FieldByName('CHECK_TYPE').asString = 'AP'
        then PCCheck.ActivePage := TabAp
        else PCCheck.ActivePage := TabQuick;
    end;
     if State in [dsBrowse] then
    begin
      DM.QryRemitTo.Close;
      DM.QryRemitTo.ParamByName('nId').Value := FieldByName('VENDOR_ID').asFloat;
      if DM.TblPrePostCtrlINTL_PAY_TYPE.AsString <> '' then
      begin
        DM.QryRemitTo.ParamByName('AINTL_PAY_TYPE').Value := DM.TblPrePostCtrlINTL_PAY_TYPE.AsString;
        DM.QryRemitTo.ParamByName('ADummy').Value := 0;
      end
      else
      begin
        DM.QryRemitTo.ParamByName('AINTL_PAY_TYPE').Value := '';
        DM.QryRemitTo.ParamByName('ADummy').Value := 1;
      end;
      DM.QryRemitTo.Open;
    end;

    if State = dsBrowse then
    begin
      edInv.Text := '';
      edBankAmt.Text := '';
      DM.QryPrepostDtl.Filter := Format('CDPREPOST_ID=%f',  [FieldByName('ID').asFloat]);
      DM.QryPrePostCheck.Filter := Format('CDPREPOST_ID=%f',[FieldByName('ID').asFloat]);
    end;
  end;

  CheckDiscountTakenColumn;
  lblNonGL.Visible := fCheckType = 'NONGL';
//  lblNonGL.Visible := DM.QryPrepost.FieldByName('CHECK_TYPE').asString = 'NONGL';
  if not lblNonGL.Visible then
  begin
    DBCheckNo2.Visible := (CBManual2.Checked = True);
    Label16.Visible    := (CBManual2.Checked = True);
  end
  else
  begin
    CBManual2.Checked := true;
    DBCheckNo2.Visible := True;
    Label16.Visible    := True;
  end;
  PnlCheckNumber.Visible  :=  (CBManual1.Checked = True);
//  if lblNonGL.Visible then CBManual2.Checked := True;
  if fCheckType = 'NONGL' then CBManual2.Checked := true;

end;

procedure TFrmCD.CheckDiscountTakenColumn;
begin
//  DM.QryPrePostDtl.FieldByName('REF_NO').Visible :=
//    PCCheck.ActivePage = TabQuick;
  if DM.QryPrepost.FieldByName('ID').asFloat = 0 then
  begin
    DM.QryPrePostDtl.FieldByName('AP_DISCOUNT_TAKEN').Visible :=
      PCCheck.ActivePage <> TabQuick;
    DM.QryPrePostDtl.FieldByName('INVOICE_NO').Visible :=
      PCCheck.ActivePage <> TabQuick;
    DM.QryPrePostDtl.FieldByName('AMOUNT_TO_PAY').Visible :=
      PCCheck.ActivePage <> TabQuick;
    DM.QryPrePostDtl.FieldByName('DUE_DATE').Visible :=
      PCCheck.ActivePage <> TabQuick;
    DM.QryPrePostDtl.FieldByName('DISC_DATE').Visible :=
      PCCheck.ActivePage <> TabQuick;
    DM.QryPrePostDtl.FieldByName('CURRENT_DISCOUNT').Visible :=
      PCCheck.ActivePage <> TabQuick;
    DM.QryPrePostDtl.FieldByName('ACCTDISC').Visible :=
      PCCheck.ActivePage <> TabQuick;
    DM.QryPrePostDtl.FieldByName('ACCTDISCDESC').Visible :=
      PCCheck.ActivePage <> TabQuick;
    DM.QryPrepostDtlAMOUNT_PAID_EX.Visible :=
      PCCheck.ActivePage <> TabQuick;
    DM.QryPrepostDtlAP_DISCOUNT_TAKEN_EX.Visible :=
      PCCheck.ActivePage <> TabQuick;
    DM.QryPrepostDtlAMOUNT_TO_PAY_EX.Visible :=
      PCCheck.ActivePage <> TabQuick;
    DM.QryPrepostDtlCURRENT_DISCOUNT_EX.Visible :=
      PCCheck.ActivePage <> TabQuick;
//  DM.QryPrePostDtl.FieldByName('ACCTMISC').Visible :=
//    PCCheck.ActivePage <> TabQuick;
  end
  else
  with DM.QryPrePost  do
    if State in [dsBrowse] then
    begin
        DM.QryPrepostDtlAMOUNT_PAID_EX.Visible :=
          FieldByName('CHECK_TYPE').asString = 'AP';
        DM.QryPrepostDtlAP_DISCOUNT_TAKEN_EX.Visible :=
          FieldByName('CHECK_TYPE').asString = 'AP';
        DM.QryPrepostDtlAMOUNT_TO_PAY_EX.Visible :=
          FieldByName('CHECK_TYPE').asString = 'AP';
        DM.QryPrepostDtlCURRENT_DISCOUNT_EX.Visible :=
          FieldByName('CHECK_TYPE').asString = 'AP';
        DM.QryPrePostDtl.FieldByName('AP_DISCOUNT_TAKEN').Visible :=
          FieldByName('CHECK_TYPE').asString = 'AP';
        DM.QryPrePostDtl.FieldByName('INVOICE_NO').Visible :=
          FieldByName('CHECK_TYPE').asString = 'AP';
        DM.QryPrePostDtl.FieldByName('AMOUNT_TO_PAY').Visible :=
          FieldByName('CHECK_TYPE').asString = 'AP';
        DM.QryPrePostDtl.FieldByName('DUE_DATE').Visible :=
          FieldByName('CHECK_TYPE').asString = 'AP';
        DM.QryPrePostDtl.FieldByName('DISC_DATE').Visible :=
          FieldByName('CHECK_TYPE').asString = 'AP';
        DM.QryPrePostDtl.FieldByName('CURRENT_DISCOUNT').Visible :=
          FieldByName('CHECK_TYPE').asString = 'AP';
        DM.QryPrePostDtl.FieldByName('ACCTDISC').Visible :=
          FieldByName('CHECK_TYPE').asString = 'AP';
        DM.QryPrePostDtl.FieldByName('ACCTDISCDESC').Visible :=
          FieldByName('CHECK_TYPE').asString = 'AP';
        DM.QryPrePostDtl.FieldByName('ACCTMISC').Visible :=
          FieldByName('CHECK_TYPE').asString <> 'NONGL';
        DM.QryPrePostDtl.FieldByName('ACCTMISCDESC').Visible :=
          FieldByName('CHECK_TYPE').asString <> 'NONGL';

    end;
end;

function TFrmCD.GetColumnNumber(cFieldName:String):Integer;
begin
  (* TODO -ombaral -cWEBIQ : Dependency
  with GridDetail do
   for Result := 0 to FieldCount - 1 do
     if Fields[Result].Name  = cFieldName then Break;
  *)
end;


procedure TFrmCD.CBManual1Click(Sender: TObject);
begin
  PnlCheckNumber.Visible :=  (CBManual1.Checked = True);
end;

procedure TFrmCD.CBManual2Click(Sender: TObject);
begin
  if fCheckType  = 'NONGL' then
  begin
    CBManual2.Checked := true;
    exit;
  end;
//  if DM.QryPrePost.FieldByName('CHECK_TYPE').asString = 'NONGL' then exit;

  DBCheckNo2.Visible := (CBManual2.Checked = True);
  Label16.Visible    := (CBManual2.Checked = True);

end;

procedure TFrmCD.GridDetailDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (fInv <> nil) and (Source = fInv.IQSearch1.DbGrid)
    then ProcessAcceptInvoices;
end;

procedure TFrmCD.ProcessAcceptAllInvoices;
var
  nOnHold, nRec:Integer;
  cMessage: String;
  NotAccepted:Integer;
  I:Integer;
  AId:Real;
  AposSum, ANegSum, Amount:Real;
  AEft:String;
  AConfirm:Integer;
  APrepostId:Real;
begin
  (* TODO -ombaral -cWEBIQ : Dependency
  if (DM.QryPrePostPRINT.asString = 'Y') and (DM.QryPrePostCHECK_NO.asString  <> '') then
     // 'Cannot add invoices to a printed check.'
    raise Exception.Create(cd_rscstr.cTXT0000019);

  APrepostId := DM.QryPrepost.FieldByName('ID').asFloat;

  nOnHold := 0;
  nRec    := 0;
  NotAccepted := 0;
  try
    DM.QryPrePostDtl.BeforePost  := nil;
    DM.QryPrePostDtl.AfterInsert := nil;
    DM.SrcPrePost.OnDataChange   := nil;
    DM.QryPrepostDtlAP_DISCOUNT_TAKEN.OnChange := nil;

    APosSum := 0;
    DM.QryPrePostDtl.CheckBrowseMode;

    with fInv.IqSearch1.DbGrid, fInv.IqSearch1.wwDbGrid.datasource.dataset do
    for i:= 0 to SelectedList.Count-1 do begin
      GotoBookmark(SelectedList.items[i]);
      Inc(nRec);
      if FieldByName('ON_HOLD').asString = 'Y' then
      begin
        Inc(nOnHold);
        Continue;
      end;

      Amount := FieldByName('AMOUNT_TO_PAY').asFloat - FieldByName('CURRENT_DISCOUNT').asFloat;
//      if Amount < 0 then
//        Continue;

      APosSum := APosSum + Amount;

//      if not CheckForSameCurrency(FieldByName('ID').asFloat) then
//      begin
//        Inc(NotAccepted);
//        Continue;
//      end;

      if SelectValueAsFloat(IQFormat('select count(id) from cdprepost_detail where apinvoice_id = %f and cdprepost_id = %f',
                   [FieldByName('ID').asFloat, APrepostId])) = 0 then
      begin
        if not (DM.QryPrePostDtl.State in [dsEdit, dsInsert]) then DM.QryPrePostDtl.Append;

        if DM.QryPrePostDtl.FieldByName('ID').asFloat = 0 then
          DM.QryPrePostDtl.FieldByName('ID').asFloat := GetNextID('CDPREPOST_DETAIL');

        if DM.QryPrePostDtl.FieldByName('CDPREPOST_ID').asFloat = 0 then
          DM.QryPrePostDtl.FieldByName('CDPREPOST_ID').asFloat := APrepostId;


        DM.QryPrePostDtl.FieldByName('APINVOICE_ID').asFloat := FieldByName('ID').asFloat;
        DM.QryPrePostDtl.FieldByName('CDPREPOST_ID').asFloat := APrepostId;
        if fFill then
        begin
          if FieldByName('DISC_DATE').asDateTime  >=
             DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime then
          begin
            DM.QryPrePostDtl.FieldByName('AMOUNT_PAID').asFloat := FieldByName('AMOUNT_TO_PAY').asFloat -
                                                                   FieldByName('CURRENT_DISCOUNT').asFloat;
            DM.QryPrePostDtl.FieldByName('AP_DISCOUNT_TAKEN').asFloat := FieldByName('CURRENT_DISCOUNT').asFloat;
          end
          else
            DM.QryPrePostDtl.FieldByName('AMOUNT_PAID').asFloat := FieldByName('AMOUNT_TO_PAY').asFloat;
          if DM.QryPrePostDtl.FieldByName('AP_DISCOUNT_TAKEN').asFloat <> 0 then GetDiscountAccount;
        end;
        if (DM.QryPrepost.FieldByName('CHECK_TYPE').asString = 'AP') and
           (DM.QryPrePostDtl.FieldByName('AMOUNT_PAID').asFloat + DM.QryPrePostDtl.FieldByName('AP_DISCOUNT_TAKEN').asFloat -
                                             FieldByName('AMOUNT_TO_PAY').asFloat > 0.000000001) then
        begin
          {'Cannot accept.  Amount suggested for payment is greater than the
            amount left to pay.'}
          IQWarning(cd_rscstr.cTXT0000020);
          Cancel;
        end
        else if (DM.QryPrePostDtl.FieldByName('GLACCT_ID_AP_DISC').asFloat = 0)  and
                (DM.QryPrePostDtl.FieldByName('APINVOICE_ID').asFloat <> 0)      and
                (DM.QryPrePostDtl.FieldByName('AP_DISCOUNT_TAKEN').asFloat <> 0) then
        begin
          {'Cannot accept.  An expense account is not assigned to the discount.'}
          IQWarning(cd_rscstr.cTXT0000021);
          Cancel;
        end
        else if (DM.QryPrePostDtl.FieldByName('GLACCT_ID_MISC_EXPENSE').asFloat = 0) and
                (DM.QryPrePostDtl.FieldByName('APINVOICE_ID').asFloat = 0) then
        begin
         {'Cannot accept.  An expense account is not assigned to the
           miscellaneous disbursement.'}
         IQWarning(cd_rscstr.cTXT0000022);
         Cancel;
        end
        else DM.QryPrePostDtl.Post;
        Application.ProcessMessages;
      end;




      ProcessInvoiceCurrency(FieldByName('CURRENCY_ID').asFloat, APrepostId);


    end;




    ANegSum := 0;
    AConfirm := 10;
    DM.QryPrePostDtl.CheckBrowseMode;
    with fInv.IqSearch1.wwDbGrid, fInv.IqSearch1.wwDbGrid.datasource.dataset do
    for i:= 0 to SelectedList.Count-1 do begin
      GotoBookmark(SelectedList.items[i]);
      Inc(nRec);
      if FieldByName('ON_HOLD').asString = 'Y' then
      begin
        Inc(nOnHold);
        Continue;
      end;

      Amount := FieldByName('AMOUNT_TO_PAY').asFloat - FieldByName('CURRENT_DISCOUNT').asFloat;

      if (Amount < 0) and (DM.TblPrePostCtrlEFT.asString = 'Y') then
      begin
        if AConfirm = 0 then Continue
        else if AConfirm <> 1 then
        begin
          AConfirm := IQDialogChkEx( TFrmCDConfEFT, cd_rscstr.cTXT0000088, 'CD_ConfirmEFT' );
          if AConfirm <> 1 then
            Continue;
        end
      end;

      if Amount > 0 then
        Continue;

      Amount := Abs(FieldByName('AMOUNT_TO_PAY').asFloat - FieldByName('CURRENT_DISCOUNT').asFloat);

      ANegSum := ANegSum + Amount;

      if (ANegSum > APosSum) and (APosSum > 0) then
        Continue;





      if SelectValueAsFloat(IQFormat('select count(id) from cdprepost_detail where apinvoice_id = %f and cdprepost_id = %f',
                   [FieldByName('ID').asFloat, APrepostId])) = 0 then
      begin
        if not (DM.QryPrePostDtl.State in [dsEdit, dsInsert]) then DM.QryPrePostDtl.Append;

        if DM.QryPrePostDtl.FieldByName('ID').asFloat = 0 then
          DM.QryPrePostDtl.FieldByName('ID').asFloat := GetNextID('CDPREPOST_DETAIL');

        if DM.QryPrePostDtl.FieldByName('CDPREPOST_ID').asFloat = 0 then
          DM.QryPrePostDtl.FieldByName('CDPREPOST_ID').asFloat := APrepostId;


        DM.QryPrePostDtl.FieldByName('APINVOICE_ID').asFloat := FieldByName('ID').asFloat;
        DM.QryPrePostDtl.FieldByName('CDPREPOST_ID').asFloat := APrepostId;
        if fFill then
        begin
          if FieldByName('DISC_DATE').asDateTime  >=
             DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime then
          begin
            DM.QryPrePostDtl.FieldByName('AMOUNT_PAID').asFloat := FieldByName('AMOUNT_TO_PAY').asFloat -
                                                                   FieldByName('CURRENT_DISCOUNT').asFloat;
            DM.QryPrePostDtl.FieldByName('AP_DISCOUNT_TAKEN').asFloat := FieldByName('CURRENT_DISCOUNT').asFloat;
          end
          else
            DM.QryPrePostDtl.FieldByName('AMOUNT_PAID').asFloat := FieldByName('AMOUNT_TO_PAY').asFloat;
          if DM.QryPrePostDtl.FieldByName('AP_DISCOUNT_TAKEN').asFloat <> 0 then GetDiscountAccount;
        end;
        if (DM.QryPrepost.FieldByName('CHECK_TYPE').asString = 'AP') and
           (DM.QryPrePostDtl.FieldByName('AMOUNT_PAID').asFloat + DM.QryPrePostDtl.FieldByName('AP_DISCOUNT_TAKEN').asFloat -
                                             FieldByName('AMOUNT_TO_PAY').asFloat > 0.000000001) then
        begin
          IQWarning(cd_rscstr.cTXT0000020);
          Cancel;
        end
        else if (DM.QryPrePostDtl.FieldByName('GLACCT_ID_AP_DISC').asFloat = 0)  and
                (DM.QryPrePostDtl.FieldByName('APINVOICE_ID').asFloat <> 0)      and
                (DM.QryPrePostDtl.FieldByName('AP_DISCOUNT_TAKEN').asFloat <> 0) then
        begin
          IQWarning(cd_rscstr.cTXT0000021);
          Cancel;
        end
        else if (DM.QryPrePostDtl.FieldByName('GLACCT_ID_MISC_EXPENSE').asFloat = 0) and
                (DM.QryPrePostDtl.FieldByName('APINVOICE_ID').asFloat = 0) then
        begin
         IQWarning(cd_rscstr.cTXT0000022);
         Cancel;
        end
        else DM.QryPrePostDtl.Post;
        Application.ProcessMessages;
      end;

      ProcessInvoiceCurrency(FieldByName('CURRENCY_ID').asFloat, APrepostId);


    end;


    if NotAccepted = 1 then
       { 'One invoice was not accepted because its currency differs from the
          check''s currency.'}
      cMessage := cd_rscstr.cTXT0000023
    else if NotAccepted > 1 then
      {'%d invoices where not accepted because their currency differs from the
       check''s currency'}
      cMessage := Format(cd_rscstr.cTXT0000024, [NotAccepted])
    else
    begin
      if nOnHold = 0 then cMessage := cd_rscstr.cTXT0000025; // 'Records assigned.';
      // 'Records assigned. One invoice is on hold.  It was not processed.';
      if nOnHold = 1 then cMessage := cd_rscstr.cTXT0000026;
      // 'Records assigned. %d invoices are on hold.  They were not processed.'
      if nOnHold = 2 then cMessage := Format(cd_rscstr.cTXT0000027,
                                              [nOnHold]);
      //'No Records assigned. All invoices are on hold.'
      if (nRec <> 0) and (nRec = nOnHold) then cMessage := cd_rscstr.cTXT0000028;
      if (nRec = 0) then cMessage := cd_rscstr.cTXT0000029; // 'No records assigned.';
    end;
    if cMessage <> cd_rscstr.cTXT0000025 {'Records assigned.'} then
      ShowMessage(cMessage);
    CloseInv;
  finally

    AId := DM.QryPrepost.FieldByName('ID').asFloat;
    DM.QryPrepost.Close;
    DM.QryPrepost.Open;
    DM.QryPrepost.Locate('ID', AId, []);
    DM.QryPrePostDtl.BeforePost  := DM.QryPrePostDtlBeforePost;
    DM.QryPrePostDtl.AfterInsert := QryPrePostDtlAfterInsert;
    DM.SrcPrePost.OnDataChange   := SrcPrePostDataChange;
    DM.QryPrepostDtlAP_DISCOUNT_TAKEN.OnChange := QryPrepostDtlAP_DISCOUNT_TAKENChange;

    DM.QryPrePostDtl.Close;
    DM.QryPrePostDtl.Open;
  end;
  *)

end;


function TFrmCD.ProcessInvoiceCurrency(aCurrencyId, APrepostId:Real):Boolean;
var
  Anative_curr, Acurr_code:String;
  ACurrId, ASpotrate:Real;
  AOldSpotRate:Real;
begin
   Result := False;
   if (ACurrencyId <> 0) and FMultiCurrency then
   begin
     ExecuteCommandFmt('update cdprepost set currency_id = %f, exchange_rate = 1 where id = %f',
                      [ACurrencyId, APrepostId ]);


     Anative_curr := SelectValueFmtAsString('select curr_code from currency where id = %f',
     [DM.TblPrePostCtrlCURRENCY_ID.asFloat]);

     Acurr_code := SelectValueFmtAsString('select curr_code from currency where id = %f',
     [ACurrencyId]);


     ACurrId := SelectValueFmtAsFloat('select id from currency where native_curr = ''%s'' and curr_code = ''%s''',
     [Anative_curr, Acurr_code]);

     ASpotrate := SelectValueFmtAsFloat('select balsheet_rate from currencypost where currency_id = %f and glperiods_id = %f',
                  [ACurrId,
                   DM.TblPrePostCtrlGLPERIODS_ID.asFloat]);

     if ASpotrate = 0 then
     begin
       AOldSpotRate := ASpotRate;


       if SelectValueFmtAsString('select NVL(use_daily_rate, ''N'') from currency where id = %f', [ACurrId]) = 'Y' then
       begin
         ASpotRate := SelectValueFmtAsFloat('select min(spot_rate) ' +
                                '     from currency_rate_hist ' +
                                '    where currency_id = %f   ' +
                                '      and effective_date <= (select check_date from cdprepost_control h, cdprepost d  ' +
                                                                ' where d.id = %f and d.cdprepost_control_id = h.id) ' +
                                '      and effective_date = (select max(effective_date) ' +
                                '                              from currency_rate_hist  ' +
                                '                             where currency_id = %f    ' +
                                '                               and effective_date <= (select check_date from cdprepost_control h, cdprepost d  ' +
                                                                ' where d.id = %f and d.cdprepost_control_id = h.id))',

                                [ACurrId,
                                 APrepostId,
                                 ACurrId,
                                 APrepostId]);
       if ASpotrate = 0 then
         ASpotRate := AOldSpotRate;
       end;

     end;

     if ASpotrate = 0 then
       ASpotrate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f',
                               [ACurrId]);

     if ASpotrate <> 0 then
       ExecuteCommandFmt('update cdprepost set exchange_rate = %.6f, currency_id = decode(%f, 0, null, %f) where id = %f',
              [ASpotRate, ACurrId, ACurrId, APrepostId]);

     Result := True;
   end;
end;

procedure TFrmCD.ProcessAcceptInvoices;
var
  AmountPaid, ADiscountTaken, AAccTId, AId:Real;
  AConfirm:Integer;
begin
  AId := -1;
//  if not CheckForSameCurrency(fInv.QryInv.FieldByName('ID').asFloat) then
//    raise Exception.Create('Cannot accept invoice with a different currency');
  if (DM.QryPrePostPRINT.asString = 'Y') and (DM.QryPrePostCHECK_NO.asString  <> '') then
     // 'Cannot add invoices to a printed check.'
    raise Exception.Create(cd_rscstr.cTXT0000019);

  if fInv.QryInv.FieldByName('ON_HOLD').asString = 'Y' then
    // 'The Invoice is on hold.  Do you still want to use it?'
    if not IQConfirmYN(cd_rscstr.cTXT0000014) then Exit;

  if fInv.QryInv.FieldByName('PENDING_BALANCE_DUE').asFloat = 0 then
    if not IQConfirmYN(cd_rscstr.cTXT0000087) then Exit;


  try
    DM.QryPrePostDtl.AfterInsert := nil;
    DM.SrcPrePost.OnDataChange   := nil;

    DM.QryPrePostDtl.CheckBrowseMode;
    if SelectValueAsFloat(IQFormat('select count(id) from cdprepost_detail where apinvoice_id = %f and cdprepost_id = %f',
                     [fInv.QryInv.FieldByName('ID').asFloat,
                      DM.QryPrepost.FieldByName('ID').asFloat])) <> 0
       //'Invoice %s already exists in the check'
       then raise Exception.Create(Format(cd_rscstr.cTXT0000015,
                                   [fInv.QryInv.FieldByName('INVOICE_NO').asString]));
    with DM.QryPrePostDtl do
    begin
      if (DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat = 0) and
         (fInv.QryInv.FieldByName('REMIT_TO_ID').asFloat <> 0) then
      begin
        DM.QryPrepost.Edit;
        DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat :=
             fInv.QryInv.FieldByName('REMIT_TO_ID').asFloat;
        DM.QryPrepost.Post;
      end;

      if (DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat <> 0) and
         (DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat <> fInv.QryInv.FieldByName('REMIT_TO_ID').asFloat) and
         (fInv.QryInv.FieldByName('REMIT_TO_ID').asFloat <> 0) then
         {'The Vendor "Remit To" is different from the Invoice ' +
          '"Remit To."  Do you want to keep the assigned remittance address?'#13 +
          'Pressing, "No," will overwrite the assigned remittance address with ' +
          'the remittance address on the Invoice.'}
        if not IqConfirmYN(cd_rscstr.cTXT0000030) then
        begin
          DM.QryPrepost.Edit;
          DM.QryPrepost.FieldByName('REMIT_TO_ID').asFloat :=
               fInv.QryInv.FieldByName('REMIT_TO_ID').asFloat;
          DM.QryPrepost.Post;
        end;

        AId := DM.QryPrepost.FieldByName('ID').asFloat;
        if ProcessInvoiceCurrency(fInv.QryInv.FieldByName('CURRENCY_ID').asFloat,
                               DM.QryPrepost.FieldByName('ID').asFloat) then
        begin
          DM.QryPrepost.Close;
          DM.QryPrepost.Open;
          DM.QryPrepost.Locate('ID', AId, []);
        end;


//      if not (State in [dsEdit, dsInsert]) then Append;
//      FieldByName('APINVOICE_ID').asFloat := fInv.QryInv.FieldByName('ID').asFloat;


      if fFill then
      begin
        if fInv.QryInv.FieldByName('DISC_DATE').asDateTime  >=
           DM.TblPrePostCtrl.FieldByName('CHECK_DATE') .asDateTime then
        begin
//          AmountPaid := fInv.QryInv.FieldByName('AMOUNT_TO_PAY').asFloat -
          AmountPaid := fInv.QryInv.FieldByName('PENDING_BALANCE_DUE').asFloat -
                        fInv.QryInv.FieldByName('CURRENT_DISCOUNT').asFloat;
          ADiscountTaken := fInv.QryInv.FieldByName('CURRENT_DISCOUNT').asFloat;


//          FieldByName('AMOUNT_PAID').asFloat       := fInv.QryInv.FieldByName('AMOUNT_TO_PAY').asFloat -
//                                                      fInv.QryInv.FieldByName('CURRENT_DISCOUNT').asFloat;
//          FieldByName('AP_DISCOUNT_TAKEN').asFloat := fInv.QryInv.FieldByName('CURRENT_DISCOUNT').asFloat;
        end
        else
        begin
//          AmountPaid     := fInv.QryInv.FieldByName('AMOUNT_TO_PAY').asFloat;
          AmountPaid := fInv.QryInv.FieldByName('PENDING_BALANCE_DUE').asFloat;
          ADiscountTaken := 0;
//          FieldByName('AMOUNT_PAID').asFloat       := fInv.QryInv.FieldByName('AMOUNT_TO_PAY').asFloat;
        end;
//        if FieldByName('AP_DISCOUNT_TAKEN').asFloat <> 0 then GetDiscountAccount;
        AAcctId := 0;
        if ADiscountTaken <> 0 then AAcctId := GetDiscountAccount1(fInv.QryInv.FieldByName('ID').asFloat);

        if (DM.TblPrePostCtrlEFT.asString = 'Y') and (AmountPaid < 0) then
        begin
          { TODO -ombaral -cWEBIQ : Dependency
          AConfirm := IQDialogChkEx( TFrmCDConfEFT, cd_rscstr.cTXT0000088, 'CD_ConfirmEFT' );
          }
          if AConfirm <> 1 then
            raise Exception.Create(cd_rscstr.cTXT0000089);
        end;

        AId := GetNextID('CDPREPOST_DETAIL');
        ExecuteCommandFmt('insert into cdprepost_detail (id, cdprepost_id, apinvoice_id, amount_paid, ' +
                  'ap_discount_taken, GLACCT_ID_AP_DISC) ' +
                  'values (%f, %f, %f, %f, %f, Decode(%f, 0, null, %f))',
                  [AId,
                   DM.QryPrepost.FieldByname('ID').asFloat,
                   fInv.QryInv.FieldByName('ID').asFloat,
                   AmountPaid,
                   ADiscountTaken,
                   AAcctId,
                   AAcctId]);

      end
      else
      begin
        AId := GetNextID('CDPREPOST_DETAIL');
        ExecuteCommandFmt('insert into cdprepost_detail (id, cdprepost_id, apinvoice_id) values (%f, %f, %f)',
                  [AId, DM.QryPrepost.FieldByname('ID').asFloat, fInv.QryInv.FieldByName('ID').asFloat]);
      end;
    end;
  finally
    DM.QryPrePostDtl.AfterInsert := QryPrePostDtlAfterInsert;
    DM.SrcPrePost.OnDataChange   := SrcPrePostDataChange;
    DM.QryPrePostDtl.Close;
    DM.QryPrePostDtl.Open;
//    DM.QryCtrlTotal.Close;
//    DM.QryCtrlTotal.Open;
    if AId > 0 then
      DM.QryPrePostDtl.Locate('ID', aId, []);
//      if not (DM.QryPrePostDtl.State in [dsEdit, dsInsert]) then DM.QryPrePostDtl.Edit;
  end;
end;

procedure TFrmCD.GetDiscountAccount;
var
  nAcctId:Real;
begin
  nAcctId := SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_apdisc'') from dual');
  if nAcctId <> 0
    then DM.QryPrePostDtl.FieldByName('GLACCT_ID_AP_DISC').asFloat := nAcctId;
end;

function TFrmCD.GetDiscountAccount1(apinoiceId:Real):Real;
var
  AEplantId:Real;
begin
//  AEplantId := SelectValueAsFloat('select misc.geteplantid from dual');
  AEplantId := SelectValueFmtAsFloat('select eplant_id from apinvoice where id = %f', [apinoiceId]);

  if AEplantId = 0 then
    Result := SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_apdisc'') from dual')
  else
    Result := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_eplant_id(''acct_id_apdisc'', %f) from dual', [AEplantId]);
end;


procedure TFrmCD.CBDiscountClick(Sender: TObject);
begin
  // allow click to finish
  Application.ProcessMessages;
  // check value
  fCheckDiscount            := CBDiscount.Checked;
  LabelDiscountDate.Visible := fCheckDiscount;
  wwDBDiscountDate.Visible  := fCheckDiscount;
  wwDBDiscountDate.DateTime := DM.TblPrePostCtrlOUTLOOK_DATE.asDateTime;
end;

procedure TFrmCD.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCD.New1Click(Sender: TObject);
begin
  //NavHeader.BtnClick(nbInsert);
end;

procedure TFrmCD.Delete1Click(Sender: TObject);
begin
  //NavHeader.BtnClick(nbDelete);
end;

procedure TFrmCD.SBSearchClick(Sender: TObject);
begin
  with DM.PkBatch do
    if Execute then DM.TblPrePostCtrl.FindKey([GetValue('ID')]);
end;
(* TODO -ombaral -cWEBIQ : Dependency
procedure TFrmCD.GridDetailCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if (UpperCase(Field.FieldName) = 'AMOUNT_PAID') or
     (UpperCase(Field.FieldName) = 'AP_DISCOUNT_TAKEN') or
     (UpperCase(Field.FieldName) = 'ACCTMISC') or
     (UpperCase(Field.FieldName) = 'ACCTDISC') or
     (UpperCase(Field.FieldName) = 'REF_NO')
  then if (not Highlight) then ABrush.Color := clWindow;
end;
*)
procedure TFrmCD.SBSaveClick(Sender: TObject);
var
  cDate:String;
  AId :Real;
  ADate:TDateTime;
begin
  with DM.QryPrePostDtl do
    if State in [dsInsert, dsEdit] then Post;
  with DM.QryPrePost do
    if State in [dsInsert, dsEdit] then Post;
  with DM.TblPrePostCtrl do
    if State in [dsInsert, dsEdit] then Post;
//  if not IQConfirmYN(Format('Do you with to post batch# %d',
//    [Trunc(DM.TblPrePostCtrl.FieldByName('ID').asFloat)])) then Exit;

  if Pos(DM.TblPrePostCtrlAP_REMITTANCE_TYPE.asString, 'EFT-----DIRECT_DEBIT') <> 0 then
     {'Printing has been bypassed. Are you sure payments are ready to post?'}
    if not IqConfirmYN(cd_rscstr.cTXT0000031) then
      Exit;


  AId := DM.QryPrePostID.asFloat;
  DM.QryPrePost.Close;
  DM.QryPrePost.Open;
  DM.QryPrePost.Locate('ID', AId, []);

  CheckForOpenPeriod('ap_status', DM.TblPrePostCtrl.FieldByName('GLPERIODS_ID').asFloat);  {in IqAcct.pas}

  cDate := DateToStr(Date);
  ADate := Date;
//  if IQInputQuery('G/L Batch Date', 'Please Enter G/L Batch Date', cDate, '!99/99/0000;1; ') then    {IqInQry.pas}
  (* TODO -ombaral -cWEBIQ : Dependency
  if GetDateDialog( ADate, cd_rscstr.cTXT0000032{'Batch Date'}) then   {in DateDlg.pas}
  begin
    CheckPostDate(ADate, DM.TblPrePostCtrlGLPERIODS_ID.asFloat, 'CD_CHECK_POST_DATE' ); {ArShare.pas}
    cDate := DateToStr(ADate);
    fGLBatchDate := ADate;

//    fGLBatchDate := StrToDate(cDate);
    if SelectValueAsFloat(IQFormat('select c.id from cdprepost c where c.cdprepost_control_id = %f ' +
                     'and 0 = (select count(cdprepost_id) from cdprepost_detail where cdprepost_id = c.id)',
                [DM.TblPrePostCtrl.FieldByName('ID').asFloat])) <> 0 then
      // 'At least one of the Vendors has no check assigned.  Cannot post.'
      raise Exception.Create(cd_rscstr.cTXT0000077);
    if Pos(DM.TblPrePostCtrlAP_REMITTANCE_TYPE.asString, 'EFT-----DIRECT_DEBIT') = 0 then
      if SelectValueAsFloat(IQFormat('select id from cdprepost where NVL(check_no, 0) = 0 and cdprepost_control_id = %f',
                  [DM.TblPrePostCtrl.FieldByName('ID').asFloat])) <> 0 then
        // 'At least one of the checks was not printed.  Cannot post.'
        raise Exception.Create(cd_rscstr.cTXT0000033);
    SaveGroup;
  end;
  *)
end;


procedure TFrmCD.SaveGroup;
var
  DBase:TFDCustomConnection;
  nGLBatchId_Id:Real;
  nBatchNum:Integer;
  lAtLeastOneCheckWentToGL:Boolean;
  BefDel:TDataSetNotifyEvent;
  ADiff:Real;
  AId:Real;
  AHeaderId:Real;
  Abatchnumber:Real;
begin
  lAtLeastOneCheckWentToGL := False;
  try
    DBase := FDManager.FindConnection('IQFD');
    DBase.StartTransaction;
    nBatchNum :=Trunc(DM.TblPrePostCtrl.FieldByName('ID').asFloat);
    ExecuteCommandFmt('begin IQ_CD_POST.populate_c_cdprepost_report(''%s''); end;', [SecurityManager.UserName]);

    with DM.QryPrePost do
    begin
      nGLBatchId_Id  := GetNextID('GLBATCHID');
      InsertGlbatchId(nGLBatchId_Id);
      First;
      while (FieldbyName('cdprepost_control_id').asfloat = DM.TblPrePostCtrl.FieldByName('ID').asFloat)
            and not eof do
      begin
        if FieldByName('CHECK_TYPE').AsString <> 'NONGL' then
        begin
          lAtLeastOneCheckWentToGL := True;
          ExecuteCommandFmt('begin IQ_CD_POST.InsertGlBatch(%f, %f, ''%s''); end;',
                 [nGLBatchId_Id,
                  DM.QryPrePostID.asFloat,
                  SecurityManager.UserName]);

//          InsertGlbatch(nGLBatchId_Id);
        end;
        AHeaderId := InsertCheque(nGLBatchId_Id);
        ExecuteCommandFmt('begin IQ_CD_POST.ProcessGainAndLoss(%f); end;',
               [nGLBatchId_Id]);

        Next;
      end;
    end;
{
    ADiff := SelectValueFmtAsFloat('select sum(debit) - sum(credit) from glbatch where glbatchid_id = %f', [nGLBatchId_Id]);
    if ADiff <> 0 then
    begin
      if Abs(Abs(ADiff) - 0.01) < 0.0001 then
      begin
        AId := SelectValueFmtAsFloat('select id from glbatch where glbatchid_id = %f and glacct_id = %f',
                         [nGLBatchId_Id, FDiscountAcct]);
        if AId <> 0 then
        begin
          if ADiff > 0 then
            ExecuteCommandFmt('update glbatch set debit = debit - 0.01 where id = %f', [AId])
          else
            ExecuteCommandFmt('update glbatch set credit = credit - 0.01 where id = %f', [AId]);
        end
        else
        raise Exception.Create('Batch not balanced, cannot post');
      end
      else
      raise Exception.Create('Batch not balanced, cannot post');
    end;

}

    ExecuteCommandFmt('begin IQ_CD_POST.InsertIntercompany(%f, %f, ''%s''); end;',
              [nGLBatchId_Id,
               DM.TblPrePostCtrl.FieldByName('ID').asFloat,
               SecurityManager.UserName]);


    if not lAtLeastOneCheckWentToGL then
      ExecuteCommandFmt('delete from glbatchid where id = %f', [nGLBatchId_Id]);
    try
      BefDel := DM.TblPrePostCtrl.BeforeDelete;
      DM.TblPrePostCtrl.BeforeDelete := nil;
      DM.TblPrePostCtrl.Delete;
    finally
      DM.TblPrePostCtrl.BeforeDelete := BefDel;
    end;
    DBase.Commit;

//    ExecuteCommandFmt('begin intercomp.update_glbatch(%f); end;', [nGLBatchId_Id]);
    ResetQryPrepostDtl;
    Abatchnumber := SelectValueFmtAsFloat('select batchnumber from glbatchid where id = %f', [nGLBatchId_Id]);
    //'Group %d, Batch %d has been posted.  Do you want to print the AfterPost report?'
    if IqConfirmYN(Format(cd_rscstr.cTXT0000034, [nBatchNum, Trunc(Abatchnumber)]))
      then  PrintAfterPostReport(nGLBatchId_Id);
    if PrepareOutput1.Checked then
      PrepareOutputfile(nGLBatchId_Id);
  finally
    if DBase.InTransaction then
    begin
      DBase.RollBack;
      ShowMessage(IQFormat(cd_rscstr.cTXT0000035, // 'Batch # %d was not posted.'
        [Trunc(DM.TblPrePostCtrl.FieldByName('ID').asFloat)]));
    end;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCD.PrepareOutputfile(nGLBatchId_Id:Real);
var
  ADir:String;
begin

  IQRegStringScalarRead( self, 'CD_EFT_OUTPUT_DIR', ADir );

  if DirectoryExists(ADir) then
    DoCDOut(self, nGLBatchId_Id, ADir)  {in CdOut.pas}
  else
    DoCDOut(self, nGLBatchId_Id)  {in CdOut.pas}
end;

procedure TFrmCD.PrintAfterPostReport(nGLBatchId_Id:Real);
var
  cServerName, cUID, cPassword:String;
  SelectionList:TStringList;
begin

  try
    SelectionList := TStringList.Create;
    SetCriteriaExpression( SelectionList,  IQFormat('{GLBATCHID.ID} = %f', [nGLBatchId_Id]));
    PrintDefaultReport( self, 'cd_afterpost_report', SelectionList );  {in IQMS.Common.Print.pas}
  finally
    SelectionList.Free;
  end;

//  cServername := IQGetServerName( 'IQ' );
//  cUID        := IQGetUID( 'IQ' );
//  cPassword   := IQGetPassword( 'IQ' );
//  with Crpe1 do
//  begin
//    ReportName:= IQGetReportsPath + SelectValueAsString('select cd_afterpost_report from iqsys');
//    if not FileExists(ReportName) then
//       raise Exception.CreateFmt('Report %s not found, please assign system parameters', [ ReportName ]);
//    Connect:= Format('DSN = %s; UID = %s; PWD = %s; DSQ = ',
//              [cServername, cUID, cPassword ]);
//    SetCriteriaExpression( SelectionFormula,  Format('{GLBATCHID.ID} = %f', [nGLBatchId_Id]));
//    Execute;
//  end;
  Screen.Cursor := crDefault;
end;

procedure TFrmCD.SetCriteriaExpression( List:TStringList; cStr:String );
begin
  List.Clear;
  List.Add(cStr);
end;


procedure TFrmCD.SetID(const Value: Real);
begin
  FID := Value;
end;

procedure TFrmCD.InsertGlbatchId(nGLBatchId_Id:Real);
var
  nBatchnumber:Real;
begin
  nBatchNumber   := GetNextSequenceNumber('S_CASHDISB');
  ExecuteCommand(IQFormat('insert into glbatchid ' +
                '(id, ' +
                'batchnumber, ' +
                'source, ' +
                'tablename, ' +
                'glperiods_id, ' +
                'userid, ' +
                'system_date, ' +
                'batch_date) ' +
                'values ' +
                '(%f, ' +
                '%f, ' +
                '''CD'', ' +
                '''CASH_DISBURSEMENT'', ' +
                '%f, ' +
                '''%s'', ' +
                'To_Date(''%s'', ''MM/DD/RRRR''), ' +
                'To_Date(''%s'', ''MM/DD/RRRR''))',
                [nGlBatchId_Id,
                 nBatchNumber,
                 DM.TblPrePostCtrl.FieldByName('GLPERIODS_ID').asFloat,
                 SecurityManager.UserName,
                 FormatDateTime('mm/dd/yyyy', Date),
                 FormatDateTime('mm/dd/yyyy', fGLBatchDate)]));

//                 FormatDateTime('dd/mmm/yy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE').asDateTime)]));

end;

procedure TFrmCD.InsertGlbatch(nGLBatchId_Id:Real);
var
  nSum:Real;
begin
  InsertItems(nGLBatchId_Id);
  InsertRevItems(nGLBatchId_Id);
  if FMulticurrency then
  begin
    InsertFXItems(nGLBatchId_Id);
    InsertQuickFXItems(nGLBatchId_Id);
  end;
  InsertDiscounts(nGLBatchId_Id);
  InsertRevDiscounts(nGLBatchId_Id);
  if FMulticurrency then
    InsertFXDiscounts(nGLBatchId_Id);

  if FMultiCurrency then InsertReval(nGLBatchId_Id);
end;

procedure TFrmCD.InsertReval(nGLBatchId_Id:Real);
var
  AFXAcctID, AFXOffsetID, AOldRate, Amount:Real;
  ABankFxAcctId:Real;
begin
  CheckCurrencyRate;
  DM.QryPrePostDtl.First;
  with DM.QryPrePostDtl do
  while not eof do
  begin
    if GetAccountsAndRate(AFXAcctID, AFXOffsetID, AOldRate) then
    begin
      Amount := (FXRate - AOldRate) * FieldByName('amount_paid').asFloat;
      ExecuteCommand(IQFormat('insert into glbatch ' +
                    '(glbatchid_id, ' +
                    'glacct_id, ' +
                    'debit, ' +
                    'credit, ' +
                    'descrip) ' +
                    'values ( ' +
                    '%f, ' +
                    '%f, ' +
                    'decode(sign(%f) , -1, Abs(%f), 0 ), ' +
                    'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                    '''INV# %s (FX)'')',
                    [nGlBatchId_Id,
                     AFXAcctID,
                     Amount,
                     Amount,
                     Amount,
                     Amount,
                     DM.QryPrePostDtl.FieldByName('Invoice_No').asString]));

      ExecuteCommand(IQFormat('insert into glbatch ' +
                    '(glbatchid_id, ' +
                    'glacct_id, ' +
                    'debit, ' +
                    'credit, ' +
                    'descrip) ' +
                    'values ( ' +
                    '%f, ' +
                    '%f, ' +
                    'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                    'decode(sign(%f) , -1, Abs(%f), 0 ), ' +
                    '''INV# %s (FX)'')',
                    [nGlBatchId_Id,
                     AFXOffsetID,
                     Amount,
                     Amount,
                     Amount,
                     Amount,
                     DM.QryPrePostDtl.FieldByName('Invoice_No').asString]));

//Debit fx_glacct_id for (1 - 1/nxrate) * amount received
//Credit the BankinfoDtl.glacct_id_fx for the same amount.
      ABankFxAcctId := SelectValueFmtAsFloat('select glacct_id_fx from bankinfo_dtl where id = %f',
                                 [DM.TblPrePostCtrl.FieldByName('BANKINFO_DTL_ID').asFloat]);
      if ABankFxAcctId <> 0 then
      begin
        Amount := (1- 1/AOldRate) * FieldByName('amount_paid').asFloat;
        ExecuteCommand(IQFormat('insert into glbatch ' +
                      '(glbatchid_id, ' +
                      'glacct_id, ' +
                      'debit, ' +
                      'credit, ' +
                      'descrip) ' +
                      'values ( ' +
                      '%f, ' +
                      '%f, ' +
                      'decode(sign(%f) , -1, Abs(%f), 0 ), ' +
                      'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                      '''INV# %s (FX)'')',
                      [nGlBatchId_Id,
                       AFXAcctID,
                       Amount,
                       Amount,
                       Amount,
                       Amount,
                       DM.QryPrePostDtl.FieldByName('Invoice_No').asString]));

        ExecuteCommand(IQFormat('insert into glbatch ' +
                      '(glbatchid_id, ' +
                      'glacct_id, ' +
                      'debit, ' +
                      'credit, ' +
                      'descrip) ' +
                      'values ( ' +
                      '%f, ' +
                      '%f, ' +
                      'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                      'decode(sign(%f) , -1, Abs(%f), 0 ), ' +
                      '''INV# %s (FX)'')',
                      [nGlBatchId_Id,
                       ABankFxAcctId,
                       Amount,
                       Amount,
                       Amount,
                       Amount,
                      DM.QryPrePostDtl.FieldByName('Invoice_No').asString]));
      end;
    end;
    Next;
  end;
end;

procedure TFrmCD.CheckCurrencyRate;
var
  nID, AId:Real;
  ACurrcode, ANativeCode:String;
  AOldSpotRate:Real;
begin

  if not FMultiCurrency then
  begin
    FXRate := 1;
    Exit;
  end;
  with DM.TblPrePostCtrl do
  begin
    nId := DM.QryPrePost.FieldByName('CURRENCY_ID').asFloat;
    if nId = 0 then
      nId := FieldByName('CURRENCY_ID').asFloat;
    (* TODO -ombaral -cWEBIQ : Dependency }
    if nId = 0 then
      nId := GetEplantNativeCurrencyId; {in McShare.pas}
    *)
//    if nId = 0 then nId := SelectValueAsFloat('select currency_id from iqsys');

    // 'Currency has not been assigned.'
    if nId = 0 then raise Exception.Create(cd_rscstr.cTXT0000036);

    ACurrcode := SelectValueFmtAsString('select curr_code from currency where id = %f', [nId]);
    ANativeCode := SelectValueFmtAsString('select native_curr from currency where id = %f', [FieldByName('CURRENCY_ID').asFloat]);


    AId := SelectValueFmtAsFloat('select id from currency where curr_code = ''%s'' and native_curr = ''%s''', [ACurrcode, ANativeCode]);
    if AId = 0 then
      AId := nId
    else
      nId := aId;


    FXrate := SelectValueFmtAsFloat('select balsheet_rate from currencypost where currency_id = %f and glperiods_id = %f',
                         [nId, FieldByName('GLPERIODS_ID').asFloat]);

    if FXrate = 0 then
    begin
      AOldSpotRate := FXrate;


      if SelectValueFmtAsString('select NVL(use_daily_rate, ''N'') from currency where id = %f', [nId]) = 'Y' then
      begin
        FXrate := SelectValueFmtAsFloat('select min(spot_rate) ' +
                               '     from currency_rate_hist ' +
                               '    where currency_id = %f   ' +
                               '      and effective_date <= (select check_date from cdprepost_control where id = %f) ' +
                               '      and effective_date = (select max(effective_date) ' +
                               '                              from currency_rate_hist  ' +
                               '                             where currency_id = %f    ' +
                               '                               and effective_date <= (select check_date from cdprepost_control where id = %f)) ',

                               [nId,
                                FieldByName('ID').asFloat,
                                nId,
                                FieldByName('ID').asFloat]);
      if FXrate = 0 then
        FXrate := AOldSpotRate;
      end;
    end;

    if FXRate = 0 then
      FXrate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f', [nId]);
  end;
end;


function TFrmCD.GetAccountsAndRate(var AFXAcctID:Real; var AFXOffsetID:Real; var AOldRate:Real):Boolean;
var
  Amount:Real;
begin
  Result := False;
  if DM.TblPrePostCtrlCURRENCY_ID.asFloat = DM.QryPrepostCURRENCY_ID.asFloat then exit;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select fx_acct_id, fx_offset_acct_id, fx_gain_acct_id from glacct where id = ' +
                   '(select glacct_id_ap from apinvoice where id = %f)',
                   [DM.QryPrePostDtl.FieldByName('APINVOICE_ID').asFloat]));
    Open;
    if (eof and bof) or (FieldByName('fx_acct_id').asFloat = 0) or (FieldByName('fx_offset_acct_id').asFloat = 0)  then
      Exit;
    AFXAcctID   := FieldByName('fx_acct_id').asFloat;
    AFXOffsetID := FieldByName('fx_offset_acct_id').asFloat;
    if SelectValueAsString('select NVL(hist_ex_rate, ''N'') from iqsys where rownum < 2') = 'Y' then
    begin
      AOldRate := SelectValueFmtAsFloat('select NVL(fx_revalue_rate, fx_rate) from apinvoice where id = %f', [DM.QryPrePostDtl.FieldByName('APINVOICE_ID').asFloat]);
      if AOldRate = 0 then
        AOldRate    := SelectValueFmtAsFloat('select old_spot_rate from glacct where id = %f', [AFXAcctID]);
    end
    else
      AOldRate    := SelectValueFmtAsFloat('select old_spot_rate from glacct where id = %f', [AFXAcctID]);
    if AOldRate = 0 then Exit;
    if Abs(FXRate - AOldRate) < 0.00000000001 then Exit;
    Amount := (FXRate - AOldRate) * DM.QryPrePostDtl.FieldByName('amount_paid').asFloat;

    if  FieldByName('fx_gain_acct_id').asFloat > 0 then
    if Amount <= 0 then
      AFXOffsetID := FieldByName('fx_gain_acct_id').asFloat;


    Result := True;
  finally
    Free;
  end;
end;


procedure TFrmCD.InsertItems(nGLBatchId_Id:Real);
var
  AcctId:Real;
begin
  AcctId := DM.TblPrePostCtrlGlAcctIdSusp.asFloat;
  if AcctId = 0 then
  AcctId := DM.TblPrePostCtrl.FieldByName('GLACCT_ID_CASH').asFloat;
  ExecuteCommand(IQFormat('insert into glbatch ' +
                '(glbatchid_id, ' +
                'glacct_id, ' +
                'debit, ' +
                'credit, ' +
                'descrip) ' +
                'select ' +
                '%f, ' +
                '%f, ' +
                'decode(sign( d.amount_paid_ex ) , -1, ' +
                'Abs(d.amount_paid_ex ), 0), ' +
                'decode(sign(d.amount_paid_ex ), -1, ' +
                '0, Abs(d.amount_paid_ex )), ' +
                '''AMOUNT FOR CHECK# '' || ''%s'' || '' %s'' ' +
                'from ' +
                'V_CDPREPOST_CHEQUE d ' +
                'where d.cdprepost_id = %f' ,
                [nGlBatchId_Id,
                 AcctId,
                IntToStr(Trunc(DM.QryPrepost.FieldByName('CHECK_NO').asFloat)),
                StrTran(DM.QryPrepost.FieldByName('Payto').asString,  '''', ''''''),
                DM.QryPrepost.FieldByName('ID').asFloat]));

  RevertFXAmounts(nGLBatchId_Id);

end;




procedure TFrmCD.RevertFXAmounts(nGLBatchId_Id:Real);
var
  Arinvoice_id:Real;
  AQry:TFDQuery;
  ADebitFXAccount:Real;
  ACreditFXAccount:Real;
  ArinvoiceFXRate:Real;
  AEPlantId:Real;
  Amount:Real;
  AStr:String;
  ANative:Boolean;
begin

  if SecurityManager.EPlant_ID = 'NULL' then
    AEPlantId := 0
  else
    AEPlantId := StrToFloat(SecurityManager.EPlant_ID);

  if AEplantID = 0 then
    ANative := (SelectValueAsFloat('select currency_id from iqsys where rownum < 2') = DM.TblPrePostCtrlCURRENCY_ID.asFloat)
  else
//    ANative := (SelectValueFmtAsString('select native_curr from eplant where id = %f', [AEplantID]) = DM.TblPrePostCtrlCURRENCY_ID.asString);
    ANative := (SelectValueFmtAsString('select native_curr from eplant where id = %f', [AEplantID]) = DM.TblPrePostCtrlCurrency.asString);


  AQry := TFDQuery.Create(self);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IqFormat('select d.amount_paid, d.apinvoice_id, a.invoice_no, a.glacct_id_fx, ' +
                   ' NVL(a.fx_revalue_rate, a.fx_rate) as fx_rate ' +
                   ' from cdprepost_detail d, apinvoice a ' +
                   ' where d.cdprepost_id = %f and d.apinvoice_id = a.id',
                   [DM.QryPrepostID.asFloat]));
    Open;
    while not eof do
    begin
      if FieldByName('apinvoice_id').asFloat <> 0 then
      begin
        ADebitFXAccount := FieldByName('glacct_id_fx').asFloat;
        if (ADebitFXAccount <> 0) and not ANative and (DM.TblPrePostCtrlCURRENCY_ID.asFloat = DM.QryPrepostCURRENCY_ID.asFloat) then
        begin
          ArinvoiceFXRate :=  FieldByName('fx_rate').asFloat;
          if ArinvoiceFXRate <> 0 then
          begin
            ACreditFXAccount := GetCreditFXAccount;
            if ACreditFXAccount <> 0 then
            begin

              if SecurityManager.EPlant_ID = 'NULL' then
                AEPlantId := 0
              else
                AEPlantId := StrToFloat(SecurityManager.EPlant_ID);


              ACreditFXAccount := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(%f, ''ACCT_ID_FX'', %f) from dual',
                                            [ACreditFXAccount, AEplantId]);

              ACreditFXAccount := SelectValueFmtAsFloat('select plugins.IQ_Plug_Currency2(%f, %f) from dual',
                                            [ACreditFXAccount, DM.QryPrepostCURRENCY_ID.asFloat]);



              AStr := Format('GRP# %s', [FloatToStr(DM.TblPrePostCtrlID.asFloat)]);
              if Trim(DM.QryPrepostVENDORNO.asString) <> '' then
                AStr := AStr + Format(', VEND# %s FX MOVE', [DM.QryPrepostVENDORNO.asString])
              else
                AStr := AStr + ', (Misc.) FX MOVE';

              Amount := FieldByName('amount_paid').asFloat * (1- ArinvoiceFXRate);


              ExecuteCommand(IQFormat('insert into glbatch ' +
                            '(glbatchid_id, ' +
                            'glacct_id, ' +
                            'credit, ' +
                            'debit, ' +
                            'descrip) ' +
                            ' values ( ' +
                            '%f, ' +
                            '%f, ' +
                            'decode(sign(%f) , -1, Abs(%f), 0 ), ' +
                            'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                            '''%s'' || '', CD INV# '' || ''%s'' )',
                            [nGlBatchId_Id,
                             ACreditFXAccount,
                             Amount, Amount, Amount, Amount,
                             AStr,
                             FieldByName('invoice_no').asString]));

              ExecuteCommand(IQFormat('insert into glbatch ' +
                            '(glbatchid_id, ' +
                            'glacct_id, ' +
                            'debit, ' +
                            'credit, ' +
                            'descrip) ' +
                            ' values ( ' +
                            '%f, ' +
                            '%f, ' +
                            'decode(sign(%f) , -1, Abs(%f), 0 ), ' +
                            'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                            '''%s'' || '', CD INV# '' || ''%s'' )',
                            [nGlBatchId_Id,
                             ADebitFXAccount,
                             Amount, Amount, Amount, Amount,
                             AStr,
                             FieldByName('invoice_no').asString]));


            end;
          end;
        end;
      end;
      next;
    end;
  finally
    free;
  end;
end;

function TFrmCD.GetCreditFXAccount:Real;
var
  AId:Real;
begin
  result := 0;
  AId := SelectValueFmtAsFloat('select gl_subacct_type_id from glacct where id = %f', [DM.TblPrePostCtrlGlAcct_Id_Cash.asFloat]);
  if AId <> 0 then
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IqFormat('select NVL(glacct_id_fx, 0) as glacct_id_fx from GLSUB_ACCT_TYPE start with id = %f ' +
                     ' connect by id = prior parent_id', [AId]));
    open;
    while not eof do
    begin
      result := FieldByName('glacct_id_fx').asFloat;
      if result <> 0 then Exit;
      next;
    end;
  finally
    free;
  end;

end;






procedure TFrmCD.InsertFXItems(nGLBatchId_Id:Real);
var
  AFxAcctId:Real;
  ADif:Real;
  AId:Real;
  AQry:TFDQuery;
begin
  AQry := TFDQuery.Create(self);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select sum(fxamount) as fxamount, ' +
                   '       glacct_id_fx               ' +
                   '       from (select sum(cr.amount_paid * NVL(c.exchange_rate, 1) - cr.amount_paid) as fxamount, ' +
                   '                     c.exchange_rate,                       ' +
                   '                     a.glacct_id_fx                         ' +
                   '                  from cdprepost_detail cr,                 ' +
                   '                       cdprepost c,                         ' +
                   '                       apinvoice a                          ' +
                   '                 where cr.cdprepost_id = c.id               ' +
                   '                       and cr.apinvoice_id = a.id           ' +
                   '                       and NVL(c.exchange_rate, 1) <> 1     ' +
                   '                       and NVL(c.exchange_rate, 1) <> 0     ' +
                   '                       and c.id = %f                        ' +
                   '                 group by a.glacct_id_fx, c.exchange_rate)  ' +
                   '         group by glacct_id_fx                              ',
                   [DM.QryPrepostID.asFloat]));
    Open;
    if eof and bof then Exit;
    AFxAcctId := FieldByName('glacct_id_fx').asFloat;
    while not eof do
    begin
      if FieldByName('fxamount').asFloat <> 0 then
      begin

        AId := GetNextID('GLBATCH');

        ExecuteCommandFmt('insert into glbatch ' +
                             '(id, ' +
                             'glbatchid_id, ' +
                             'glacct_id, ' +
                             'credit, ' +
                             'debit, ' +
                             'descrip) ' +
                             'values ' +
                             '(%f, ' +
                             ' %f, ' +
                             ' %f, ' +
                             'decode(sign( %f ) , -1, Abs(%f), 0 ), ' +
                             'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                             ' ''CD FX POSTING'')',
                      [AId,
                       nGlBatchId_Id,
                       FieldByName('glacct_id_fx').asFloat,
                       FieldByName('fxamount').asFloat,
                       FieldByName('fxamount').asFloat,
                       FieldByName('fxamount').asFloat,
                       FieldByName('fxamount').asFloat]);
      end;
      Next;
    end;

    ADif := SelectValueFmtAsFloat('select sum(debit) - sum(credit) from glbatch where glbatchid_id = %f', [nGlBatchId_Id]);

    if Abs(ADif) > 0.001 then
    begin
      ExecuteCommandFmt('insert into glbatch ' +
                           '(glbatchid_id, ' +
                           'glacct_id, ' +
                           'debit, ' +
                           'credit, ' +
                           'descrip) ' +
                           'values ' +
                           '(%f, ' +
                           ' %f, ' +
                           'decode(sign( %f ) , -1, Abs(%f), 0 ), ' +
                           'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                           '''CD FX ROUNDING'')',
                    [nGlBatchId_Id,
                     AFxAcctId,
                     ADif,
                     ADif,
                     ADif,
                     ADif]);
    end;
  finally
    Free;
  end;
end;

procedure TFrmCD.InsertQuickFXItems(nGLBatchId_Id:Real);
var
  AFxAcctId:Real;
  ADif:Real;
  AId:Real;
  AQry:TFDQuery;
begin
  AQry := TFDQuery.Create(self);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;

    Sql.Add(IQFormat('select sum(fxamount) as fxamount, ' +
                   '       glacct_id_cash       ' +
                   '       from (select sum(cr.amount_paid * NVL(c.exchange_rate, 1) - cr.amount_paid) as fxamount, ' +
                   '                     c.exchange_rate,                       ' +
                   '                     plugins.get_glacct_id_with_ep_gl(bd.glacct_id_cash, ''acct_id_cash'', cl.eplant_id) as glacct_id_cash ' +
                   '                  from cdprepost_detail cr,                 ' +
                   '                       cdprepost_control cl,                ' +
                   '                       bankinfo_dtl bd,                     ' +
                   '                       cdprepost c                          ' +
                   '                 where cr.cdprepost_id = c.id               ' +
                   '                       and NVL(cr.apinvoice_id, 0) = 0      ' +
                   '                       and c.cdprepost_control_id = cl.id   ' +
                   '                       and NVL(bd.glacct_id_cash, 0) <> 0   ' +
                   '                       and cl.bankinfo_dtl_id = bd.id       ' +
                   '                       and NVL(c.exchange_rate, 1) <> 1     ' +
                   '                       and NVL(c.exchange_rate, 1) <> 0     ' +
                   '                       and c.id = %f                        ' +
                   '                 group by plugins.get_glacct_id_with_ep_gl(bd.glacct_id_cash, ''acct_id_cash'', cl.eplant_id), c.exchange_rate)  ' +
                   '         group by glacct_id_cash                            ',
                   [DM.QryPrepostID.asFloat]));
    Open;
    if eof and bof then Exit;
    AFxAcctId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(NVL(g.glacct_id_fx, a.fx_acct_id), ''acct_id_cash'', %f) from glacct a, GLSUB_ACCT_TYPE g ' +
                           ' where a.gl_subacct_type_id = g.id and a.id = %f',
                           [DM.TblPrePostCtrl.FieldByName('EPLANT_ID').AsFloat,
                            FieldByName('glacct_id_cash').asFloat]);
    if AFxAcctId = 0 then
     AFxAcctId := FieldByName('glacct_id_cash').asFloat;


    AFxAcctId := SelectValueFmtAsFloat('select plugins.IQ_Plug_Currency2(%f, %f) from dual',
                                            [AFxAcctId, DM.QryPrepostCURRENCY_ID.asFloat]);


    while not eof do
    begin
      if FieldByName('fxamount').asFloat <> 0 then
      begin

        AId := GetNextID('GLBATCH');

        ExecuteCommandFmt('insert into glbatch ' +
                             '(id, ' +
                             'glbatchid_id, ' +
                             'glacct_id, ' +
                             'credit, ' +
                             'debit, ' +
                             'descrip) ' +
                             'values ' +
                             '(%f, ' +
                             ' %f, ' +
                             ' %f, ' +
                             'decode(sign( %f ) , -1, Abs(%f), 0 ), ' +
                             'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                             ' ''CD FX POSTING'')',
                      [AId,
                       nGlBatchId_Id,
                       AFxAcctId,
                       FieldByName('fxamount').asFloat,
                       FieldByName('fxamount').asFloat,
                       FieldByName('fxamount').asFloat,
                       FieldByName('fxamount').asFloat]);
      end;
      Next;
    end;

    ADif := SelectValueFmtAsFloat('select sum(debit) - sum(credit) from glbatch where glbatchid_id = %f', [nGlBatchId_Id]);

    if Abs(ADif) > 0.001 then
    begin
      ExecuteCommandFmt('insert into glbatch ' +
                           '(glbatchid_id, ' +
                           'glacct_id, ' +
                           'debit, ' +
                           'credit, ' +
                           'descrip) ' +
                           'values ' +
                           '(%f, ' +
                           ' %f, ' +
                           'decode(sign( %f ) , -1, Abs(%f), 0 ), ' +
                           'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                           '''CD FX ROUNDING'')',
                    [nGlBatchId_Id,
                     AFxAcctId,
                     ADif,
                     ADif,
                     ADif,
                     ADif]);
    end;
  finally
    Free;
  end;
end;



procedure TFrmCD.InsertRevItems(nGLBatchId_Id:Real);
begin
  ExecuteCommand(IQFormat('insert into glbatch ' +
                '(glbatchid_id, ' +
                'glacct_id, ' +
                'debit, ' +
                'credit, ' +
                'descrip) ' +
                'select ' +
                '%f, ' +
                'decode(NVL(d.apinvoice_id, 0), 0, D.GLACCT_ID_MISC_EXPENSE, a.glacct_id_ap), '+
                'decode(sign( d.amount_paid ) , -1, ' +
                '0, Abs(d.amount_paid)), ' +
                'decode(sign(d.amount_paid), -1, ' +
                'Abs(d.amount_paid), 0), ' +
                '''REV. AMOUNT FOR CHECK# '' || ''%s'' || '' %s'' ' +
                'from ' +
                'cdprepost_detail d, ' +
                'apinvoice a ' +
                'where d.cdprepost_id = %f ' +
                'and d.apinvoice_id = a.id(+) ' +
                'and NVL(d.amount_paid, 0) <> 0',
                [nGlBatchId_Id,
                IntToStr(Trunc(DM.QryPrepost.FieldByName('CHECK_NO').asFloat)),
                StrTran(DM.QryPrepost.FieldByName('Payto').asString,  '''', ''''''),
                DM.QryPrepost.FieldByName('ID').asFloat]));
end;


procedure TFrmCD.InsertDiscounts(nGLBatchId_Id:Real);
begin
{
  ExecuteCommandFmt('insert into glbatch ' +
            '(glbatchid_id, ' +
            'glacct_id, ' +
            'credit, ' +
            'debit, ' +
            'descrip) ' +
            'select ' +
            '%f, ' +
            '%f, ' +
            'decode(sign( d.ap_discount_taken * NVL(c.exchange_rate, 1) ) , -1, ' +
            'Abs(d.ap_discount_taken * NVL(c.exchange_rate, 1)), 0), ' +
            'decode(sign(d.ap_discount_taken * NVL(c.exchange_rate, 1)), -1, ' +
            '0, Abs(d.ap_discount_taken * NVL(c.exchange_rate, 1))), ' +
            '''DISCOUNT FOR CHECK# '' || ''%s'' || '' %s''  ' +
            'from ' +
            'cdprepost_detail d, cdprepost c ' +
            'where d.cdprepost_id = c.id and c.id = %f ' +
            'and NVL(d.ap_discount_taken, 0) <> 0',
            [nGlBatchId_Id,
             DM.TblPrePostCtrl.FieldByName('GLACCT_ID_CASH').asFloat,
            IntToStr(Trunc(DM.QryPrepost.FieldByName('CHECK_NO').asFloat)),
            StrTran(DM.QryPrepost.FieldByName('Payto').asString,  '''', ''''''),
            DM.QryPrepost.FieldByName('ID').asFloat]);

  ExecuteCommandFmt('insert into glbatch ' +
            '(glbatchid_id, ' +
            'glacct_id, ' +
            'credit, ' +
            'debit, ' +
            'descrip) ' +
            'select ' +
            '%f, ' +
            'decode(NVL(d.apinvoice_id, 0), 0, D.GLACCT_ID_MISC_EXPENSE, a.glacct_id_ap), '+
            'decode(sign( d.ap_discount_taken * NVL(c.exchange_rate, 1) ) , -1, ' +
            'Abs(d.ap_discount_taken * NVL(c.exchange_rate, 1)), 0), ' +
            'decode(sign(d.ap_discount_taken * NVL(c.exchange_rate, 1)), -1, ' +
            '0, Abs(d.ap_discount_taken * NVL(c.exchange_rate, 1))), ' +
            '''DISCOUNT FOR CHECK# '' || ''%s'' || '' %s''  ' +
            'from ' +
            'cdprepost_detail d, cdprepost c, ' +
            ' apinvoice a ' +
            'where d.cdprepost_id = c.id and c.id = %f ' +
            'and d.apinvoice_id = a.id(+) ' +
            'and NVL(d.ap_discount_taken, 0) <> 0',
            [nGlBatchId_Id,
            IntToStr(Trunc(DM.QryPrepost.FieldByName('CHECK_NO').asFloat)),
            StrTran(DM.QryPrepost.FieldByName('Payto').asString,  '''', ''''''),
            DM.QryPrepost.FieldByName('ID').asFloat]);

}


  ExecuteCommandFmt('insert into glbatch ' +
            '(glbatchid_id, ' +
            'glacct_id, ' +
            'credit, ' +
            'debit, ' +
            'descrip) ' +
            'select ' +
            '%f, ' +
            'decode(NVL(d.apinvoice_id, 0), 0, D.GLACCT_ID_MISC_EXPENSE, a.glacct_id_ap), '+
            'decode(sign( d.ap_discount_taken ) , -1, ' +
            'Abs(d.ap_discount_taken ), 0), ' +
            'decode(sign(d.ap_discount_taken ), -1, ' +
            '0, Abs(d.ap_discount_taken )), ' +
            '''DISCOUNT FOR CHECK# '' || ''%s'' || '' %s''  ' +
            'from ' +
            'cdprepost_detail d, cdprepost c, ' +
            ' apinvoice a ' +
            'where d.cdprepost_id = c.id and c.id = %f ' +
            'and d.apinvoice_id = a.id(+) ' +
            'and NVL(d.ap_discount_taken, 0) <> 0',
            [nGlBatchId_Id,
            IntToStr(Trunc(DM.QryPrepost.FieldByName('CHECK_NO').asFloat)),
            StrTran(DM.QryPrepost.FieldByName('Payto').asString,  '''', ''''''),
            DM.QryPrepost.FieldByName('ID').asFloat]);

end;

procedure TFrmCD.InsertFXDiscounts(nGLBatchId_Id:Real);
var
  AFxAcctId:Real;
  ADif:Real;
  AId:Real;
  AQry:TFDQuery;
begin
  AQry := TFDQuery.Create(self);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select sum(fxamount) as fxamount, ' +
                   '       glacct_id_fx               ' +
                   '       from (select sum(cr.ap_discount_taken * NVL(c.exchange_rate, 1) - cr.ap_discount_taken) as fxamount, ' +
                   '                     c.exchange_rate,                       ' +
                   '                     a.glacct_id_fx                         ' +
                   '                  from cdprepost_detail cr,                 ' +
                   '                       cdprepost c,                         ' +
                   '                       apinvoice a                          ' +
                   '                 where cr.cdprepost_id = c.id               ' +
                   '                       and cr.apinvoice_id = a.id           ' +
                   '                       and NVL(c.exchange_rate, 1) <> 1     ' +
                   '                       and NVL(c.exchange_rate, 1) <> 0     ' +
                   '                       and c.id = %f                        ' +
                   '                 group by a.glacct_id_fx, c.exchange_rate)  ' +
                   '         group by glacct_id_fx                              ',
                   [DM.QryPrepostID.asFloat]));
    Open;
    if eof and bof then Exit;
    AFxAcctId := FieldByName('glacct_id_fx').asFloat;
    while not eof do
    begin
      if FieldByName('fxamount').asFloat <> 0 then
      begin
        AId := GetNextID('GLBATCH');

        ExecuteCommandFmt('insert into glbatch ' +
                             '(id, ' +
                             'glbatchid_id, ' +
                             'glacct_id, ' +
                             'credit, ' +
                             'debit, ' +
                             'descrip) ' +
                             'values ' +
                             '(%f, ' +
                             ' %f, ' +
                             ' %f, ' +
                             'decode(sign( %f ) , -1, Abs(%f), 0 ), ' +
                             'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                             ' ''CD FX DISCOUNT POSTING'')',
                      [AId,
                       nGlBatchId_Id,
                       FieldByName('glacct_id_fx').asFloat,
                       FieldByName('fxamount').asFloat,
                       FieldByName('fxamount').asFloat,
                       FieldByName('fxamount').asFloat,
                       FieldByName('fxamount').asFloat]);
      end;
      Next;
    end;

    ADif := SelectValueFmtAsFloat('select sum(debit) - sum(credit) from glbatch where glbatchid_id = %f', [nGlBatchId_Id]);

    if Abs(ADif) > 0.001 then
    begin
      ExecuteCommandFmt('insert into glbatch ' +
                           '(glbatchid_id, ' +
                           'glacct_id, ' +
                           'debit, ' +
                           'credit, ' +
                           'descrip) ' +
                           'values ' +
                           '(%f, ' +
                           ' %f, ' +
                           'decode(sign( %f ) , -1, Abs(%f), 0 ), ' +
                           'decode(sign(%f), -1, 0, Abs(%f) ), ' +
                           '''CD FX DISCOUNT ROUNDING'')',
                    [nGlBatchId_Id,
                     AFxAcctId,
                     ADif,
                     ADif,
                     ADif,
                     ADif]);
    end;
  finally
    Free;
  end;
end;


procedure TFrmCD.InsertRevDiscounts(nGLBatchId_Id:Real);
var
  AQry:TFDQuery;
  ACurrid, ACurrid2, AFxRate, AEplantId:Real;
  Amount1, Amount2:Real;
  ANativeCurr, ACurrCode:String;
  ACreditAcctId:Real;
begin
  AQry := TFDQuery.Create(self);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;

    Sql.Add(IqFormat('select decode(NVL(d.apinvoice_id, 0), 0, D.GLACCT_ID_MISC_EXPENSE, d.glacct_id_ap_disc) as  glacct_id_disc, '+
                            'd.ap_discount_taken as discount_applied, ' +
                            ' i.glacct_id_fx, ' +
                            ' NVL(i.fx_revalue_rate, i.fx_rate) as fx_rate, ' +
                            'decode(NVL(d.apinvoice_id, 0), 0, ''REV. MISC. DISCOUNT FOR CHECK# '' || ''%s'' || '' %s''  , ''REV. DISC. INV# '' || i.invoice_no || '' CHECK# '' || ''%s'')  as info ' +
                      'from cdprepost_detail d, ' +
                           'apinvoice i ' +
                    'where d.cdprepost_id = %f ' +
                      'and d.apinvoice_id = i.id ' +
                      'and NVL(d.ap_discount_taken, 0) <> 0',
                [IntToStr(Trunc(DM.QryPrepost.FieldByName('CHECK_NO').asFloat)),
                 StrTran(DM.QryPrepost.FieldByName('Payto').asString,  '''', ''''''),
                 IntToStr(Trunc(DM.QryPrepost.FieldByName('CHECK_NO').asFloat)),
                 DM.QryPrepost.FieldByName('ID').asFloat]));
    open;
    while not eof do
    begin

      ACurrid := DM.QryPrepostCURRENCY_ID.asFloat;

//      ACurrid := SelectValueFmtAsFloat('select c.id from currency c, eplant e, glacct g ' +
//                           'where g.id = %f and g.eplant_id = e.id and e.native_curr = c.curr_code', [FieldByName('glacct_id_disc').asFloat]);

      if ACurrid = 0 then
        ACurrid := SelectValueAsFloat('select currency_id from iqsys where rownum < 2');

      if SecurityManager.EPlant_ID = 'NULL' then
        AEPlantId := 0
      else
        AEPlantId := StrToFloat(SecurityManager.EPlant_ID);


      ACreditAcctId := FieldByName('glacct_id_fx').asFloat;

       ANativeCurr := SelectValueFmtAsString('select curr_code from currency where id = %f', [DM.TblPrePostCtrlCURRENCY_ID.asfloat]);
       ACurrCode := SelectValueFmtAsString('select curr_code from currency where id = %f', [ACurrid]);


//      ACurrCode   := SelectValueFmtAsString('select curr_code from currency where id = %f', [DM.TblPrePostCtrlCURRENCY_ID.asfloat]);
//      ANativeCurr := SelectValueFmtAsString('select native_curr from currency where id = %f', [ACurrid]);

      if ANativeCurr  = '' then
        ACurrid2 := DM.TblPrePostCtrlCURRENCY_ID.asfloat
      else
        ACurrid2 := SelectValueFmtAsFloat('select id from currency where native_curr = ''%s'' and curr_code = ''%s''', [ANativeCurr, ACurrCode]);

      AFXrate := FieldByName('fx_rate').asFloat;

//      AFXrate := DM.QryPrepostEXCHANGE_RATE.asFloat;
      if AFXRate = 0 then
        AFXrate := SelectValueFmtAsFloat('select balsheet_rate from currencypost where currency_id = %f and glperiods_id = %f',
                           [ACurrid2, DM.TblPrePostCtrlGLPERIODS_ID.asFloat]);
      if AFXRate = 0 then
        AFXrate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f', [ACurrid2]);

      if ACurrid = DM.TblPrePostCtrlCURRENCY_ID.asfloat then
        AFXrate := DM.QryPrepostEXCHANGE_RATE.asFloat;


      FDiscountAcct := FieldByName('glacct_id_disc').asFloat;

      if FMultiCurrency and (ACurrid <> 0)
//         (ACurrid <> DM.TblCrPrePostCtrlCURRENCY_ID.asfloat)
         and (ACreditAcctId <> 0) and (AFxRate <> 0) then
      begin
        Amount1 := FieldByName('discount_applied').asFloat * AFxRate;
        Amount2 := 0;
        Amount2 := FieldByName('discount_applied').asFloat - FieldByName('discount_applied').asFloat * AFxRate;


        ExecuteCommand(IQFormat('insert into glbatch ' +
                      '(glbatchid_id, ' +
                      'glacct_id, ' +
                      'credit, ' +
                      'debit, ' +
                      'descrip) ' +
                      'values ( ' +
                      '%f, ' +
                      '%f, ' +
                      'decode(sign( %f ) , -1, ' +
                      '0, Abs(%f)), ' +
                      'decode(sign(%f), -1, ' +
                      'Abs(%f), 0), ' +
                      '''%s'' )',
                      [nGlBatchId_Id,
                       FieldByName('glacct_id_disc').asFloat,
                       Amount1, Amount1, Amount1, Amount1,
                       FieldByName('info').asString]));

        if Amount2 <> 0 then
        ExecuteCommand(IQFormat('insert into glbatch ' +
                      '(glbatchid_id, ' +
                      'glacct_id, ' +
                      'credit, ' +
                      'debit, ' +
                      'descrip) ' +
                      'values ( ' +
                      '%f, ' +
                      '%f, ' +
                      'decode(sign( %f ) , -1, ' +
                      '0, Abs(%f)), ' +
                      'decode(sign(%f), -1, ' +
                      'Abs(%f), 0), ' +
                      '''%s FX'' )',
                      [nGlBatchId_Id,
                       ACreditAcctId,
                       Amount2, Amount2, Amount2, Amount2,
                       FieldByName('info').asString]));
      end
      else
      begin
        Amount1 := FieldByName('discount_applied').asFloat;
        ExecuteCommand(IQFormat('insert into glbatch ' +
                      '(glbatchid_id, ' +
                      'glacct_id, ' +
                      'credit, ' +
                      'debit, ' +
                      'descrip) ' +
                      'values ( ' +
                      '%f, ' +
                      '%f, ' +
                      'decode(sign( %f ) , -1, ' +
                      '0, Abs(%f)), ' +
                      'decode(sign(%f), -1, ' +
                      'Abs(%f), 0), ' +
                      '''%s'' )',
                      [nGlBatchId_Id,
                       FieldByName('glacct_id_disc').asFloat,
                       Amount1, Amount1, Amount1, Amount1,
                       FieldByName('info').asString]));
      end;
      next;
    end;
  finally
    free;
  end;
{

  ExecuteCommand(IQFormat('insert into glbatch ' +
                '(glbatchid_id, ' +
                'glacct_id, ' +
                'debit, ' +
                'credit, ' +
                'descrip) ' +
                'select ' +
                '%f, ' +
                'decode(NVL(d.apinvoice_id, 0), 0, D.GLACCT_ID_MISC_EXPENSE, a.glacct_id_ap), '+
                'decode(sign( d.ap_discount_taken ) , -1, ' +
                '0, Abs(d.ap_discount_taken)), ' +
                'decode(sign(d.ap_discount_taken), -1, ' +
                'Abs(d.ap_discount_taken), 0), ' +
                '''REV. DISCOUNT FOR CHECK# '' || ''%s'' || '' %s'' ' +
                'from ' +
                'cdprepost_detail d, ' +
                'apinvoice a ' +
                'where d.cdprepost_id = %f ' +
                'and d.apinvoice_id = a.id(+) ' +
                'and NVL(d.ap_discount_taken, 0) <> 0',
                [nGlBatchId_Id,
                IntToStr(Trunc(DM.QryPrepost.FieldByName('CHECK_NO').asFloat)),
                StrTran(DM.QryPrepost.FieldByName('Payto').asString,  '''', ''''''),
                DM.QryPrepost.FieldByName('ID').asFloat]));

}
end;

function TFrmCD.InsertCheque(nGLBatchId_Id:Real):Real;
var
  nChequeId:Real;
  AID :Real;
  ASum:Real;
  ApInvoiceId, AFxid, ARate:Real;
  ACheque_detail_id:Real;
  AQry:TFDQuery;
  aQuckFXAccountId : Real;
begin
   nChequeId  := GetNextID('CHEQUE');
   result := nChequeId;
   ExecuteCommandFmt('update glbatch set header_id = %f where glbatchid_id = %f and header_id is null', [nChequeId, nGLBatchId_Id]);

    with QryInsCheque do
    begin
      Close;
      ParamByName('dDate').Value := DM.TblPrePostCtrl.FieldByName('CHECK_DATE').asDateTime;
      ParamByName('nBankInfoDtlId').Value := DM.TblPrePostCtrl.FieldByName('bankinfo_dtl_id').asFloat;
      ParamByName('nGlPeriodsId').Value := DM.TblPrePostCtrl.FieldByName('glperiods_id').asFloat;
      ParamByName('nGlBatchId_Id').Value := nGLBatchId_Id;
      ParamByName('nChequeId').Value := nChequeId;
      ParamByName('nCDPrePostId').Value := DM.QryPrepost.FieldByName('ID').asFloat;
      ParamByName('cGlAcct').Value := SelectValueFmtAsString('select acct from glacct, bankinfo_dtl ' +
                                                            'where bankinfo_dtl.id = %f ' +
                                             'and glacct.id = NVL(bankinfo_dtl.glacct_id_suspense, bankinfo_dtl.glacct_id_cash)',
                                                            [DM.TblPrePostCtrl.FieldByName('bankinfo_dtl_id').asFloat]);

//      Prepare;
      ExecSql;
    end;


  if DM.QryPrepost.FieldByName('CHECK_TYPE').asString = 'NONGL' then
    ExecuteCommandFmt('update cheque set glbatchid_id = NULL where id = %f', [nChequeId]);

//  AID := DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat;

//  if AID <> 0 then
//    ExecuteCommandFmt('update cheque set CURRENCY_ID = %f, CURRENCY_CODE = ''%s'', ' +
//               'CURRENCY_DESCRIP = ''%s'', FX_RATE = %f where id = %f',
//      [AID,
//       SelectValueFmtAsString('select CURR_CODE from CURRENCY where id = %f', [AID]),
//       SelectValueFmtAsString('select DESCRIP from CURRENCY where id = %f', [AID]),
//       FXRate,
//       nChequeId]);

  if FMulticurrency then
    ExecuteCommandFmt('update cheque set fx_rate = %.6f where id = %f', [FXRate, nChequeId]);

  aQuckFXAccountId := 0;
  if SelectValueFmt('select fx_rate from cheque where id = %f', [nChequeId]) = 0 then
  begin
    FXRate := SelectValueFmt('select iq_cd_post.GetSpotRate(%f) from dual', [DM.QryPrepost.FieldByName('ID').asFloat]);
    ExecuteCommandFmt('update cheque set fx_rate = %.6f where id = %f', [FXRate, nChequeId]);

    aQuckFXAccountId := SelectValueFmt('select iq_cd_post.GetQuckChechFxAccount(%f) from dual', [DM.QryPrepost.FieldByName('ID').asFloat]);
    if aQuckFXAccountId <> 0 then
      ExecuteCommandFmt('update cheque set glacct_id_fx = %f where id = %f', [aQuckFXAccountId, nChequeId]);
  end;


  ARate := SelectValueFmtAsFloat('select NVL(exchange_rate, 1) from cheque where id = %f', [nChequeId]);

  AQry := TFDQuery.Create(nil);

  with AQry do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IqFormat('select id, NVL(on_acct, ''N'') as on_acct ' +
         'from cdprepost_detail where cdprepost_id = %f',
         [DM.QryPrepost.FieldByName('ID').asFloat]));
   Open;
   while not eof do
   begin
     ACheque_detail_id := GetNextID('CHEQUE_DETAIL');
     ExecuteCommandFmt('insert into cheque_detail ' +
            '(id, ' +
            ' amount_paid, ' +
            ' bank_amount, ' +
            'apinvoice_id, ' +
            'ap_discount_taken, ' +
            'glacct_id_ap_disc, ' +
            'glacct_id_misc_expense, ' +
            'ref_no, ' +
            'cheque_id) ' +
            'select %f, ' +
            'amount_paid, ' +
            'amount_paid * %.6f, ' +
            'apinvoice_id, ' +
            'ap_discount_taken, ' +
            'glacct_id_ap_disc, ' +
            'glacct_id_misc_expense, ' +
            'ref_no, ' +
            '%f ' +
            'from cdprepost_detail where id = %f', [ACheque_detail_id, ARate, nChequeId, FieldByname('ID').asFloat]);
     if FieldByname('ON_ACCT').asString = 'Y' then
       ProcessOnAcct(nChequeId, ACheque_detail_id, DM.QryPrepost.FieldByName('ID').asFloat, nGLBatchId_Id);
     next;
   end;


  finally
    Free;
  end;

{
  ExecuteCommand(IQFormat('insert into cheque_detail ' +
         '(amount_paid, ' +
         ' bank_amount, ' +
         'apinvoice_id, ' +
         'ap_discount_taken, ' +
         'glacct_id_ap_disc, ' +
         'glacct_id_misc_expense, ' +
         'ref_no, ' +
         'cheque_id) ' +
         'select amount_paid, ' +
         'amount_paid * %.6f, ' +
         'apinvoice_id, ' +
         'ap_discount_taken, ' +
         'glacct_id_ap_disc, ' +
         'glacct_id_misc_expense, ' +
         'ref_no, ' +
         '%f ' +
         'from cdprepost_detail where cdprepost_id = %f',
         [ ARate, nChequeId, DM.QryPrepost.FieldByName('ID').asFloat]));
}

  ASum        := SelectValueFmtAsFloat('select sum(amount_paid) from cheque_detail where cheque_id = %f', [nChequeId]);
  ApInvoiceId := SelectValueFmtAsFloat('select min(apinvoice_id) from cheque_detail ' +
                           'where cheque_id = %f and NVL(apinvoice_id, 0) <> 0', [nChequeId]);
  if ApInvoiceId <> 0 then
    AFxid := SelectValueFmtAsFloat('select IQ_CD_POST.AddjustAccount(glacct_id_fx, %f) from apinvoice where id = %f', [DM.QryPrepost.FieldByName('ID').asFloat, ApInvoiceId])
//    AFxid := SelectValueFmtAsFloat('select glacct_id_fx from apinvoice where id = %f', [ApInvoiceId])
  else
  begin

    AFxid :=  SelectValueFmtAsFloat('select  plugins.IQ_Plug_Currency2(plugins.get_glacct_id_with_ep_gl(NVL(NVL(g.glacct_id_fx, l.fx_acct_id), bd.glacct_id_cash), ''acct_id_cash'', cl.eplant_id), c.currency_id) as glacct_id_fx ' +
                        '                  from cdprepost_detail cr, ' +
                        '                       cdprepost c, ' +
                        '                       glacct l, ' +
                        '                       cdprepost_control cl, ' +
                        '                       bankinfo_dtl bd, ' +
                        '                       GLSUB_ACCT_TYPE g ' +
                        '                 where cr.cdprepost_id = c.id ' +
                        '                   and NVL(cr.apinvoice_id, 0) = 0 ' +
                        '                   and c.cdprepost_control_id = cl.id ' +
                        '                   and NVL(bd.glacct_id_cash, 0) <> 0 ' +
                        '                   and cl.bankinfo_dtl_id = bd.id ' +
                        '                   and NVL(c.exchange_rate, 1) <> 1 ' +
                        '                   and NVL(c.exchange_rate, 1) <> 0 ' +
                        '                   and l.gl_subacct_type_id = g.id(+) ' +
                        '                   and c.id = %f ' +
                        '                   and l.id = bd.glacct_id_cash ',
                        [DM.QryPrepost.FieldByName('ID').asFloat]);
  end;

  if aQuckFXAccountId <> 0  then
    ExecuteCommandFmt('update cheque set bank_amount = NVL(exchange_rate, 1) * %f  where id = %f', [ASum, nChequeId])
  else
    ExecuteCommandFmt('update cheque set bank_amount = NVL(exchange_rate, 1) * %f, ' +
            'glacct_id_fx = decode(%f, 0, null, %f)  where id = %f', [ASum, AFxid, AFxid, nChequeId]);


end;

procedure TFrmCD.ProcessOnAcct(AChequeId, ACheque_detail_id, ACDPrepost_id, aGLBatchId_Id:Real);
begin
  ExecuteCommandFmt('begin iq_cd_post.ProcessONAcct(%f, %f, %f, %f); end;', [AChequeId, ACheque_detail_id, ACDPrepost_id, aGLBatchId_Id]);
end;


procedure TFrmCD.SBPrintClick(Sender: TObject);
begin
  try
    with DM.QryPrePostPr do
    begin
      Close;
      Sql.Clear;
      Sql.Add(FPrintSql);
      Open;
    end;
    DOCDPrint(self, '');         {CDPrint.pas}
  finally
    Screen.Cursor := crDefault;
  end;
  DM.QryPrePost.Close;
  DM.QryPrePost.Open;
end;

procedure TFrmCD.SBViewClick(Sender: TObject);
begin
  DoViewCD(0);         {CDView.pas}
end;

procedure TFrmCD.JumpToVendor1Click(Sender: TObject);
begin
  IQJumpVendor.Execute;
end;

procedure TFrmCD.BrowseGLBatches1Click(Sender: TObject);
begin
  (* TODO -ombaral -cWEBIQ : Dependency
  DOViewBatch('CD');  {in BatView.pas in GL}
  *)
end;

procedure TFrmCD.TblPrePostCtrlFilterRecordGL(DataSet: TDataSet;
  var Accept: Boolean);
begin
//  DM.TblPrePostCtrl.Filter := 'BATCH_TYPE<>''NONGL''';
  Accept := (DM.TblPrePostCtrl.FieldByName('BATCH_TYPE').AsString <> 'NONGL')
            and IQAssignEPlantFilterRecord(DM.TblPrePostCtrl);
end;

procedure TFrmCD.TblPrePostCtrlFilterRecordNonGL(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (DM.TblPrePostCtrl.FieldByName('BATCH_TYPE').AsString = 'NONGL')
            and IQAssignEPlantFilterRecord(DM.TblPrePostCtrl);
end;

procedure TFrmCD.JumptoAP1Click(Sender: TObject);
begin
  with DM.QryPrePostDtl do
    if fieldByName('APINVOICE_ID').asFloat <> 0 then
      DoViewAPfromCD(fieldByName('APINVOICE_ID').asFloat);  {in APView.pas}
end;

procedure TFrmCD.Contents1Click(Sender: TObject);
begin
//  Application.HelpContext(7);
  IQHelp.HelpContext( 1030391 );
end;

procedure TFrmCD.FormActivate(Sender: TObject);
begin
  Application.OnShowHint:= DoOnShowHint;
//  Application.OnHint := DisplayHint;
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmAP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCD.SBEditRemitClick(Sender: TObject);
var
  nId, AId:Real;
  AINTL_PAY_TYPE:String;
begin
  try
    with DM.QryPrePost do
    begin
      { TODO -ombaral -cWEBIQ : Dependency
      nId := DoRemitTo(FieldByName('VENDOR_ID').asFloat, FieldByName('REMIT_TO_ID').asFloat);  {in PEdRemt.pas}

      if nId = 0 then exit;

      if DM.TblPrePostCtrlINTL_PAY_TYPE.AsString <> '' then
      begin
        AINTL_PAY_TYPE := SelectValueFmtAsString('select INTL_PAY_TYPE from remit_to where id = %f', [nId]);
        if AINTL_PAY_TYPE <> DM.TblPrePostCtrlINTL_PAY_TYPE.AsString then
          raise Exception.Create(cd_rscstr.cTXT0000083);
      end;

      DM.QryRemitto.Close;
      DM.QryRemitto.ParamByName('NID').Value := FieldByName('VENDOR_ID').asFloat;
      DM.QryRemitto.Open;
      AId := DM.QryPrepostID.asFloat;
      Close;
      Open;
      Locate('ID', AID, []);
//      Refresh;
      if nId <> FieldByName('REMIT_TO_ID').asFloat then
      begin
        if not (State in [dsEdit, dsInsert]) then Edit;
        FieldByName('REMIT_TO_ID').asFloat := nId;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCD.Clear1Click(Sender: TObject);
begin
  IqTiming1.Clear;
end;

procedure TFrmCD.Show1Click(Sender: TObject);
begin
  IQTiming1.Display;
end;

procedure TFrmCD.sbSearchVendorClick(Sender: TObject);
begin
  with DM.PKCDPrepost do
    if Execute then
      DM.QryPrepost.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmCD.SortByChange(Sender: TObject);
var
  i:Integer;
  AFieldName:String;
begin
  for i := 3 to PM.Items.Count - 1 do
    TUniMenuItem(PM.Items[i]).Checked := False;
  TUniMenuItem(Sender).Checked := True;
  AFieldName := StrTran(TUniMenuItem(Sender).Caption, '&', '');
  AFieldName := StrTran(AFieldName, 'Sort By ', '');
  AFieldName := LocateField(GridDetail, AFieldName);
  with TFDQuery(GridDetail.DataSource.DataSet) do
  try
    HMsg:= hPleaseWait(cd_rscstr.cTXT0000037 {'Sorting.  Please wait.'});
    Close;
    Sql.Clear;
    Sql.Add(FDtlSql + ' Order by ' + AFieldName);
//    IqTiming1.Start('Open');
    ResetOrder;
    ResetQryPrepostDtl;
//    IqTiming1.Stop('Open');
//    Open;
  finally;
    HMsg.Free;
  end;
  IQRegStringScalarWrite( self, 'DtlSortOrder', StrTran(TUniMenuItem(Sender).Caption, '&', ''));
end;

procedure TFrmCD.ResetOrder;
begin
  if DM.QryPrepostID.asString <> '' then
  ExecuteCommandFmt('declare '          +
            '  i number::= 0; ' +
            'begin '            +
            '  for v in (%s) '  +
            '  loop '           +
            '    i::= i + 1; '  +
            '    update cdprepost_detail set order_seq = i where id = v.id; ' +
            '  end loop; '      +
            '  commit;   '      +
            'end;', [StrTran( StrTran(UpperCase(DM.QryPrepostDtl.Sql.Text), ':AID', DM.QryPrepostID.asString), #13#10, ' ')]);
end;

procedure TFrmCD.PMPopup(Sender: TObject);
var
  NewItem: TUniMenuItem;
  i      : Integer;
  ASortOrder:String;
begin
  if DM.QryPrepost.FieldByName('CHECK_TYPE').asString = 'QUICK' then Abort;
  IQRegStringScalarRead( self, 'DtlSortOrder', ASortOrder );
  (* TODO -ombaral -cWEBIQ : Dependency }
  if PM.Items.Count = 5 then
    for i:= 0 to GridDetail.FieldCount - 1 do
    if GridDetail.Fields[i].tag <> 1 then
    begin
      NewItem:= TUniMenuItem.Create( GridDetail );
      NewItem.Caption:= Format(cd_rscstr.cTXT0000038, // 'Sort By %s'
       [GridDetail.Fields[i].DisplayLabel]);
      NewItem.RadioItem:= TRUE;
      NewItem.Checked  := NewItem.Caption = ASortOrder;
      NewItem.OnClick  := SortByChange;
      PM.Items.Add( NewItem );
    end;
  *)
end;

function TFrmCD.LocateField(Agrid:TIQUniGridControl; AStr:String):String;
var
  i:integer;
begin
  (* TODO -ombaral -cWEBIQ : Dependency }
  for i :=0 to Agrid.FieldCount - 1 do
    if Agrid.Fields[i].DisplayLabel = AStr then
    begin
      Result := Agrid.Fields[i].Origin;
      Exit;
    end;
  *)
end;


procedure TFrmCD.sbCalcClick(Sender: TObject);
begin
  edInv.Text := Format('%m',
                       [SelectValueFmtAsFloat('select TOTAL_INV_TO_PAY from V_CDPREPOST_APINVOICE_TOTAL where cdprepost_id = %f',
                        [DM.QryPrepost.FieldByName('ID').asFloat])]);
  edBankAmt.Text := Format('%m',
                       [SelectValueFmtAsFloat('select TOTAL_INV_TO_PAY_EX from V_CDPREPOST_APINVOICE_TOTAL where cdprepost_id = %f',
                        [DM.QryPrepost.FieldByName('ID').asFloat])]);
end;

procedure TFrmCD.DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
begin
//  with HintInfo do
//  begin
//    if HintControl = DBEditPeriod then with DM.TblPrePostCtrl do
//      HintStr := Format('From: %s To: %s', [DateToStr(FieldByName('Start_Date').asDateTime),
//                                                      DateToStr(FieldByName('End_Date').asDateTime)]);
//  end;
end;


procedure TFrmCD.sbtnEPlantClick(Sender: TObject);
begin
  if SelectValueFmtAsFloat('select count(id) from cdprepost where cdprepost_control_id = %f',
  [DM.TblPrePostCtrl.FieldByName('ID').asFloat]) <> 0 then
    //'Cannot change EPlant.  Detail records were found.'
    raise exception.Create(cd_rscstr.cTXT0000039);
  DoChangePlantID(DM.TblPrePostCtrl ); { IQMS.COmmon.SetPlant.pas}
end;

//procedure TFrmCD.DisplayHint(Sender: TObject);
//begin
//  with DM.TblPrePostCtrl do
//  DBEditPeriod.Hint := Format(cd_rscstr.cTXT0000066 {'Start Date: %s'#13'End Date: %s'},
//                       [FormatDateTime('dd/mmm/yy', FieldByName('START_DATE').asDateTime),
//                        FormatDateTime('dd/mmm/yy', FieldByName('END_DATE').asDateTime)]);
//end;


procedure TFrmCD.QryPrepostDtlAP_DISCOUNT_TAKENChange(Sender: TField);
var
  AAcctId:Real;
begin
  if DM.QryPrepostDtlAP_DISCOUNT_TAKEN.AsFloat <> 0 then
  begin
    AAcctId := GetDiscountAccount1(DM.QryPrepostDtlAPINVOICE_ID.asFloat);
    if AAcctId <> 0 then
    begin
      DM.QryPrepostDtlGLACCT_ID_AP_DISC.AsFloat := AAcctId;
      AssignMC_GLACCT_ID_AP_DISC;
    end;
  end
  else DM.QryPrepostDtlGLACCT_ID_AP_DISC.Clear;



//  if IqConfirmYN('Auto adjust amount to pay?') then
//  begin
    DM.QryPrepostDtlAMOUNT_PAID.AsFloat :=  DM.QryPrepostDtlAMOUNT_TO_PAY.AsFloat  -
                                            DM.QryPrepostDtlAP_DISCOUNT_TAKEN.AsFloat;
    GridDetail.Refresh;
//  end;
end;



procedure TFrmCD.AddItem1Click(Sender: TObject);
begin
 // NavPrepost.BtnClick(nbInsert);
end;

procedure TFrmCD.DeleteItem1Click(Sender: TObject);
begin
  //NavPrepost.BtnClick(nbDelete);
end;
(*
procedure TFrmCD.NavPrePostBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    DM.QryPrepost.Close;
    DM.QryPrepost.Open;
    Abort;
  end;
end;
*)
procedure TFrmCD.IQSearch1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin

  if ( (fVendors <> nil) and (Source = fVendors.IqSearch1.DbGrid) )
    then Accept := True
    else Accept := False;

end;

procedure TFrmCD.IQSearch1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if (fVendors <> nil) and (Source = fVendors.IqSearch1.DBGrid)
    then ProcessAcceptVendor;
end;



procedure TFrmCD.wwDBLookupCombo2DropDown(Sender: TObject);
var
  ACount:Integer;
begin
  ACount := Trunc(SelectValueFmtAsFloat('select count(id) from cdprepost_detail where cdprepost_id = %f',
                  [DM.QryPrepostID.asFloat]));
  if ACount <> 0 then Abort;
end;

procedure TFrmCD.cbCurrencyDropDown(Sender: TObject);
var
  ACount:Integer;
begin
  FCurrencyId := DM.TblPrePostCtrlCURRENCY_ID.AsFloat;
  ACount := Trunc(SelectValueFmtAsFloat('select count(id) from cdprepost where cdprepost_control_id = %f',
                  [DM.TblPrePostCtrlID.asFloat]));
//  if ACount <> 0 then Abort;
  if ACount <> 0 then
    // 'This group has details.  Cannot edit currency.'
    raise Exception.Create(cd_rscstr.cTXT0000040);
end;

procedure TFrmCD.PrepareOutput1Click(Sender: TObject);
begin
  PrepareOutput1.Checked := not PrepareOutput1.Checked;
  if PrepareOutput1.Checked then
    IQRegIntegerScalarWrite( self, 'CD_PREPARE_OUTPUT', 1)
  else
    IQRegIntegerScalarWrite( self, 'CD_PREPARE_OUTPUT', 0)
end;

procedure TFrmCD.ShowControlTotals1Click(Sender: TObject);
begin
//  DM.QryCtrlTotal.Close;
//  DM.QryCtrlTotal.Open;
  DoShowControlTotals(self); {in CDCtrl.pas}
end;

procedure TFrmCD.TblPrePostCtrlBeforePost(DataSet: TDataSet);
var
  GlPeriodsId:Real;
  AStartdate, AEndDate:TDateTime;
  AStr:String;
  AConfirm:Integer;
  AQry:TFDQuery;
begin
  if (SelectValueAsString('select multicurrency from iqsys') = 'Y') and (DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat = 0)
    then raise Exception.Create(cd_rscstr.cTXT0000041{'Please assign a currency.'});
  IQAssignIDBeforePost(DataSet); {in IQlib}


  GlPeriodsId :=
      SelectValueAsFloat(Format('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1',
        [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE').asDateTime)]));

    if GlPeriodsId <> 0 then
      if GlPeriodsId <> DM.TblPrePostCtrl.FieldByName('GLPERIODS_ID').asFloat then
      begin
        if DM.TblPrePostCtrl.FieldByName('GLPERIODS_ID').asFloat <> 0 then
        begin
          AStartdate := SelectValueFmtAsFloat('select start_date from glperiods where id = %f', [DM.TblPrePostCtrl.FieldByName('GLPERIODS_ID').asFloat]);
          AEnddate := SelectValueFmtAsFloat('select end_date from glperiods where id = %f', [DM.TblPrePostCtrl.FieldByName('GLPERIODS_ID').asFloat]);
          {'The Check date (%s) does not fall within the Period dates (%s - %s)'}
          AStr := Format(cd_rscstr.cTXT0000042,
                                [FormatDateTime('dd/mmm/yy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE').asDateTime),
                                 FormatDateTime('dd/mmm/yy', AStartdate),
                                 FormatDateTime('dd/mmm/yy', AEnddate)]);

          { TODO -ombaral -cWEBIQ : Dependency
          AConfirm := IQDialogChkEx( TFrmCDConf, AStr, 'CD_ConfirmDateChange' );
          }

          if AConfirm = 1 then
          begin

            AQry := TFDQuery.Create(self);
            try
              AQry.Connection := UniMainModule.FDConnection1;
              Aqry.Sql.Add(Format('select id, period, start_date, end_date from glperiods where ' +
                                   'To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1',
                                   [FormatDateTime('mm/dd/yyyy', DM.TblPrePostCtrl.FieldByName('CHECK_DATE').asDateTime)]));
              AQry.Open;
              if not AQry.Eof then
              begin
                DM.TblPrePostCtrl.FieldByName('GLPERIODS_ID').asFloat := AQry.FieldByName('id').asFloat;
  //              FieldByName('start_date').asDateTime   := AQry.FieldByName('start_date').asDateTime;
  //              FieldByName('end_date').asDateTime   := AQry.FieldByName('end_date').asDateTime;
  //              FieldByName('period').asstring   := AQry.FieldByName('period').asString;
              end;
            finally
              AQry.Free;
            end;
          end
          else if AConfirm = 2 then
          begin
            if PCBatch.ActivePage = TabForm then
              DBEditBatchDate.SetFocus;
            Abort;
          end;
//          IqWarning('The Check date does not fall within the period dates.')
        end
        else
          DM.TblPrePostCtrl.FieldByName('GLPERIODS_ID').asFloat := GlPeriodsId;
      end;
end;

procedure TFrmCD.TblPrePostCtrlAfterDelete(DataSet: TDataSet);
begin
  ResetQryPrepostDtl;
end;

procedure TFrmCD.TblPrePostCtrlAfterScroll(DataSet: TDataSet);
begin
  ResetQryPrepostDtl;
  ResetQryBankAccount;
  wwDBDiscountDate.DateTime:= DM.TblPrePostCtrlOUTLOOK_DATE.asDateTime;
end;

procedure TFrmCD.GridDetailEnter(Sender: TObject);
begin
  if PCCheck.ActivePage = TabQuick then
    DM.QryPrepost.CheckBrowseMode;
end;

procedure TFrmCD.Dontshowinvoiceswithpastduediscounts1Click(Sender: TObject);
begin
  if Dontshowinvoiceswithpastduediscounts1.Checked then
  begin
    IQRegIntegerScalarWrite( self, 'CD_DONT_SHOW_DISC', 0);
    Dontshowinvoiceswithpastduediscounts1.Checked := False;
  end
  else
  begin
    IQRegIntegerScalarWrite( self, 'CD_DONT_SHOW_DISC', 1);
    Dontshowinvoiceswithpastduediscounts1.Checked := True;
  end;
end;

procedure TFrmCD.cbCurrencyCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if  DM.TblPrePostCtrlCURRENCY_ID.AsFloat <> FCurrencyId then
  begin
    if not (DM.TblPrePostCtrl.State in [dsEdit, dsInsert]) then DM.TblPrePostCtrl.Edit;
    DM.TblPrePostCtrlBANKINFO_DTL_ID.Clear;
    SBBankClick(nil);
  end;
end;

procedure TFrmCD.wwDBRemmitanceTypeDropDown(Sender: TObject);
var
  ACount:Integer;
begin
  ACount := Trunc(SelectValueFmtAsFloat('select count(id) from cdprepost where cdprepost_control_id = %f',
                  [DM.TblPrePostCtrlID.asFloat]));
//  if ACount <> 0 then Abort;
  if ACount <> 0 then
     // 'This group has details.  Cannot edit Remittance Type.'
    raise Exception.Create(cd_rscstr.cTXT0000043);
end;

procedure TFrmCD.AssignMC_GLACCT_ID_AP_DISC;
var
  AGLValue:String;
  AGLAcct, aNewGLAcct:String;
  I, nStart, nLength:Integer;
  AID:Real;
begin
  AGLValue := SelectValueFmtAsString('select glvalue from currency where id = %f',
                           [DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat]);

  if SelectValueAsString('select NVL(multicurrency, ''N'') from iqsys') = 'N' then exit;
  with DM.QryPrepostDtl do
  begin
    AGLAcct := SelectValueFmtAsString('select acct from glacct where id = %f', [FieldByName('GLACCT_ID_AP_DISC').asFloat]);
    aNewGLAcct := AGLAcct;
    nStart  := Trunc(SelectValueAsFloat('select group_start from glacct_def where group_name = ' +
                         '(select FX_SEGMENT_NAME from iqsys)'));
    nLength  := Trunc(SelectValueAsFloat('select group_length from glacct_def where group_name = ' +
                         '(select FX_SEGMENT_NAME from iqsys)'));
    try
      for I:= nStart to (nStart + nLength - 1) do
        ANewGLAcct[ I ] := AGLValue[ I - nStart + 1 ];
    except
      {'Foreign Exchange account not assigned.'#13 +
       'Proceeding with current discount account as a default account.'}
      IQInformation(cd_rscstr.cTXT0000044);
      ANewGLAcct := AGLAcct;
    end;
    if ANewGLAcct = AGLAcct then Exit;
    AID := SelectValueFmtAsFloat('select id from glacct where acct = ''%s''', [ANewGLAcct]);
    if AID = 0 then
    begin
      {'Foreign Exchange account not assigned.'#13 +
       'Proceeding with current discount account as a default account.'}
      IQInformation(cd_rscstr.cTXT0000044);
    end
    else FieldByName('GLACCT_ID_AP_DISC').asFloat := AID;
  end;

end;


procedure TFrmCD.SBQCurrPkClick(Sender: TObject);
var
  ACode:String;
begin
  with DM, QryPrepost do
    if PkQCurr.Execute then
    begin
      ACode := PkQCurr.GetValue('CURR_CODE');
      if not (State in [dsEdit, dsInsert]) then Edit;
      FieldByName('CURRENCY_ID').asFloat := SelectValueFmtAsFloat('select id from currency where curr_code = ''%s''', [ACode]);
      FieldByName('CURR_CODE').asString := ACode;
    end;
end;

procedure TFrmCD.ClearCurrency1Click(Sender: TObject);
begin
  with DM, QryPrepost do
  begin
    if not (State in [dsEdit, dsInsert]) then Edit;
    FieldByName('CURRENCY_ID').Clear;
    FieldByName('CURR_CODE').Clear;
  end;

end;

procedure TFrmCD.RegenerateEFTOutputFile1Click(Sender: TObject);
var
  AId:Real;
begin
  with PkGlBatchId do
  if execute then
  begin
    AId := GetValue('ID');
    PrepareOutputfile(AId);
  end;
end;

procedure TFrmCD.DBComment2DblClick(Sender: TObject);
begin
  wwMemoDialog1.Execute;
end;

procedure TFrmCD.RealizeGainandLossonMoveTransactions1Click(Sender: TObject);
begin
  if RealizeGainandLossonMoveTransactions1.Checked then
  begin
    ExecuteCommand('update iqsys set GAIN_AND_LOSS_ON_MOVE = ''N''');
    RealizeGainandLossonMoveTransactions1.Checked := False;
  end
  else
  begin
    ExecuteCommand('update iqsys set GAIN_AND_LOSS_ON_MOVE = ''Y''');
    RealizeGainandLossonMoveTransactions1.Checked := True;
  end;
end;

procedure TFrmCD.EFTOutputFileDirectory1Click(Sender: TObject);
var
  s:String;
begin

  IQRegStringScalarRead( self, 'CD_EFT_OUTPUT_DIR', s );
  { TODO -ombaral -cWEBIQ : Dependency
  if not DirBrowse( s ) then
     EXIT
  else
  }
  IQRegStringScalarWrite( self, 'CD_EFT_OUTPUT_DIR', s );

end;

procedure TFrmCD.dbIntl_Pay_TypeDropDown(Sender: TObject);
var
  ACount:Integer;
begin
  ACount := Trunc(SelectValueFmtAsFloat('select count(id) from cdprepost where cdprepost_control_id = %f',
                  [DM.TblPrePostCtrlID.asFloat]));
  if ACount <> 0 then
     // 'This group has details.  Cannot edit EFT Pay. Type.'
    raise Exception.Create(cd_rscstr.cTXT0000082);
end;

procedure TFrmCD.CbFilterVendorClick(Sender: TObject);
begin
  if CbFilterVendor.Checked then
    ExecuteCommand('update iqsys2 set FILTER_VENDORS_BY_CURR = ''Y''')
  else
    ExecuteCommand('update iqsys2 set FILTER_VENDORS_BY_CURR = ''N''');
end;

procedure TFrmCD.PkVendorBeforeOpen(DataSet: TDataSet);
var
  ACode:String;
begin
  if CbFilterVendor.Checked then
  begin
    ACode := SelectValueFmtAsString('select curr_code from currency where id = %f', [DM.TblPrePostCtrlCURRENCY_ID.asFloat]);
    AssignQueryParamValue(DataSet, 'ADummy', 1);
    AssignQueryParamValue(DataSet, 'ACurrcode', ACode);
//    TFDQuery(Dataset).ParamByName('ADummy').Value := 1;
//    TFDQuery(Dataset).ParamByName('ACurrcode').Value := ACode;
  end
  else
  begin
    AssignQueryParamValue(DataSet, 'ADummy', 0);
    AssignQueryParamValue(DataSet, 'ACurrcode', '0');
//    TFDQuery(Dataset).ParamByName('ADummy').Value := 0;
//    TFDQuery(Dataset).ParamByName('ACurrcode').Value := '0';
  end;
end;

procedure TFrmCD.QryPrepostNewRecord(DataSet: TDataSet);
begin
  if FFormType <> 'GL' then
  begin
    DM.QryPrepost.FieldByName('PRINT').asString := 'Y';
    DM.QryPrepost.FieldByName('CHECK_TYPE').asString := 'NONGL';
    PCCheck.ActivePage := TabQuick;
    DM.QryPrepost.AfterInsert := QryPrePostAfterInsert;
    cbManual2.Checked := true;
    PCCheck.ActivePage := TabQuick;
    DBCheckNo2.Visible := True;
    Label16.Visible    := True;
    DM.QryPrePostDtl.FieldByName('ACCTMISC').Visible :=  DM.QryPrepost.FieldByName('CHECK_TYPE').asString <> 'NONGL';
    DM.QryPrePostDtl.FieldByName('ACCTMISCDESC').Visible := DM.QryPrePostDtl.FieldByName('ACCTMISC').Visible;
  end;

end;




procedure TFrmCD.wwGlDiscAcctDropDown(Sender: TObject);
begin
//  DM.wwQryGLAcctDisc.Close;
//  DM.wwQryGLAcctDisc.ParamByName('AID').Value := DM.QryPrepostVENDOR_ID.asFloat;
//  DM.wwQryGLAcctDisc.Open;
//  DM.wwQryGLAcctDisc.Locate('ID', DM.QryPrepostDtlGLACCT_ID_AP_DISC.asFloat, []);
end;


procedure TFrmCD.AssignAcctviaPickList1Click(Sender: TObject);
begin
  (* TODO -ombaral -cWEBIQ : Dependency
  with GridDetail.DataSource.DataSet do
    if GridDetail.SelectedField = DM.QryPrepostDtlAcctMisc then
    begin
      if DM.PKAcct.Execute then
      begin
        if not (State in [dsEdit, dsInsert]) then Edit;
        DM.QryPrepostDtlGLACCT_ID_MISC_EXPENSE.asFloat := DM.PkAcct.GetValue('ID');
        DM.QryPrepostDtlAcctMisc.asString              := DM.PKAcct.GetValue('ACCT');
        DM.QryPrepostDtlAcctMiscDesc.asString          := DM.PKAcct.GetValue('DESCRIP');
      end;
    end
    else if GridDetail.SelectedField = DM.QryPrepostDtlAcctDisc then
    begin
      if DM.PKAcct.Execute then
      begin
        if not (State in [dsEdit, dsInsert]) then Edit;
        DM.QryPrepostDtlGLACCT_ID_AP_DISC.asFloat  := DM.PKAcct.GetValue('ID');
        DM.QryPrepostDtlAcctDisc.AsString          := DM.PKAcct.GetValue('ACCT');
        DM.QryPrepostDtlAcctDiscDesc.AsString      := DM.PKAcct.GetValue('DESCRIP');
      end;
    end;
  *)
end;

procedure TFrmCD.ResetQryBankAccount;
begin
  DM.QryBankAcount.Close;
  DM.QryBankAcount.Sql.Clear;
  DM.QryBankAcount.Sql.Add(FPkBankSql);
  if DM.TblPrePostCtrlCURRENCY_ID.asFloat <> 0 then
    DM.QryBankAcount.Sql.Add(IqFormat(' and b.currency_id in (select id from currency where curr_code = ''%s'')',
        [SelectValueFmtAsString('select curr_code from currency where id = %f', [DM.TblPrePostCtrlCURRENCY_ID.asFloat])]));
  DM.QryBankAcount.Open;
end;

procedure TFrmCD.wwDBDiscountDateExit(Sender: TObject);
begin
  if wwDBDiscountDate.DateTime < DM.TblPrePostCtrlOUTLOOK_DATE.asDateTime then
  begin
    wwDBDiscountDate.DateTime  := DM.TblPrePostCtrlOUTLOOK_DATE.asDateTime;
    IqWarning('The Discount Date cannot be earlier than the Due Date.');
  end;

end;


procedure TFrmCD.SBEplantFilterClick(Sender: TObject);
begin
  DoMultiSelectEplants( 'CD');   {MultiSelectEplants.pas}
  if SelectValueAsFloat('select count(*) from MULTI_EPLANT_USER where module_type = ''CD'' and user_id = misc.getusername') <> 0 then
  begin
    SBEplantFiltered.Visible := true;
    SBEplantFilter.Visible := false;
  end
  else
  begin
    SBEplantFilter.Visible := true;
    SBEplantFiltered.Visible := false;
  end;
end;

procedure TFrmCD.DBEditDueDateCloseUp(Sender: TObject);
begin
//  if wwDBDiscountDate.Date < DBEditDueDate.Date then
//  begin
    wwDBDiscountDate.DateTime  := DBEditDueDate.Datetime;
//  end;
end;


procedure TFrmCD.wwGlMiscAcctCloseUp(Sender: TObject; LookupTable,  FillTable: TDataSet; modified: Boolean);
begin
  if modified then 
  begin
    if not (DM.QryPrepostDtl.State in [dsEdit, dsInsert]) then DM.QryPrepostDtl.Edit;
    DM.QryPrepostDtlGLACCT_ID_MISC_EXPENSE.asFloat := DM.wwQryGLAcctID.asFloat;
    DM.QryPrepostDtlAcctMisc.asString := SelectValueFmtAsString('select acct from glacct where id = %f', [DM.QryPrepostDtlGLACCT_ID_MISC_EXPENSE.asFloat]);
  end;
end;



end.
