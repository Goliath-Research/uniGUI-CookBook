unit FaBooks;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  Mask,
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
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmFaBooks = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    Panel1: TUniPanel;
    Nav: TUniDBNavigator;
    GridBooks: TIQUniGridControl;
    SBSearch: TUniSpeedButton;
    SBToggle: TUniSpeedButton;
    SrcBooks: TDataSource;
    TblBooks: TFDTable;
    PkFaBooks: TIQWebHPick;
    PkFaBooksID: TBCDField;
    PkFaBooksDESCRIP: TStringField;
    PkFaBooksBOOK_TYPE: TStringField;
    New1: TUniMenuItem;
    Search1: TUniMenuItem;
    dbBookTypeGrid: TUniDBComboBox;
    dbDeprGrid: TUniDBComboBox;
    dbConvGrid: TUniDBComboBox;
    dbPropClassGrid: TUniDBComboBox;
    TblBooksID: TBCDField;
    TblBooksDESCRIP: TStringField;
    TblBooksDEPRECIATION_METHOD: TStringField;
    TblBooksBOOK_TYPE: TStringField;
    TblBooksDECLINING_BAL_PERCENT: TBCDField;
    TblBooksCONVENTION: TStringField;
    TblBooksPROPERTY_CLASS: TStringField;
    TblBooksSEC_1250_REAL_PROPERTY: TStringField;
    TblBooksSEC_1245_PROPERTY: TStringField;
    TblBooksLISTED_PROPERTY: TStringField;
    TblBooksNY_LIBERTY_ZONE: TStringField;
    TblBooksAMORTIZED: TStringField;
    TblBooksBUSINESS_USE_PRCNT: TBCDField;
    TblBooksITC_AMOUNT: TBCDField;
    TblBooksSECTION_179_DED: TBCDField;
    TblBooksPROCEDURE_TO_RUN: TStringField;
    PkProc: TIQWebHPick;
    PkProcOBJECT_NAME: TStringField;
    dbprocGrid: TUniEdit;
    TblBooksPOSTING_BASIS: TStringField;
    dbPostingBasisGrid: TUniDBComboBox;
    TblBooksFA_MACRS_CLASS_LIFE_ID: TBCDField;
    TblBooksAssetClass: TStringField;
    PkAssetClass: TIQWebHPick;
    PkAssetClassID: TBCDField;
    PkAssetClassASSET_CLASS: TStringField;
    PkAssetClassDESCRIP: TStringField;
    PkAssetClassGDS: TBCDField;
    PkAssetClassADS: TBCDField;
    PkAssetClassCLASS_LIFE: TBCDField;
    dbAssetClasGrid: TUniEdit;
    Contents1: TUniMenuItem;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label11: TUniLabel;
    Label29: TUniLabel;
    Splitter1: TUniSplitter;
    Splitter2: TUniSplitter;
    Panel4: TUniPanel;
    Splitter3: TUniSplitter;
    Panel6: TUniPanel;
    Panel5: TUniPanel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    dbBusinessUse: TUniDBEdit;
    dbITCAmount: TUniDBEdit;
    dbSec179: TUniDBEdit;
    dbSec1250: TUniDBCheckBox;
    dbSec1245: TUniDBCheckBox;
    dbListedProp: TUniDBCheckBox;
    dbNyLiberty: TUniDBCheckBox;
    dbAmortized: TUniDBCheckBox;
    Panel7: TUniPanel;
    dbDescrip: TUniDBEdit;
    wwDBDeprForm: TUniDBComboBox;
    dbBookTypeForm: TUniDBComboBox;
    dbDeclBal: TUniDBEdit;
    dbConvForm: TUniDBComboBox;
    dbPropClassForm: TUniDBComboBox;
    dbPostingBasisform: TUniDBComboBox;
    dbAssetClassForm: TUniEdit;
    dbProc: TUniEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure PkFaBooksIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure New1Click(Sender: TObject);
    procedure SBToggleClick(Sender: TObject);
    procedure TblBooksBeforePost(DataSet: TDataSet);
    procedure dbProcCustomDlg(Sender: TObject);
    procedure TblBooksCalcFields(DataSet: TDataSet);
    procedure dbAssetClassFormCustomDlg(Sender: TObject);
    procedure dbAssetClassFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowFaBooks();

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;
{$R *.DFM}

procedure DoShowFaBooks();
var
  LFrmFaBooks : TFrmFaBooks;
begin
  //with TFrmFaBooks.Create(AOwner) do Show;
  LFrmFaBooks := TFrmFaBooks.Create(uniGUIApplication.UniApplication);
end;

procedure TFrmFaBooks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self, GridBooks, Panel2, Panel3, Panel5]);
  Action := caFree;
end;

procedure TFrmFaBooks.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmFaBooks.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmFaBooks.SBSearchClick(Sender: TObject);
begin
  with PkFaBooks do
  if Execute then
    TblBooks.Locate('ID', GetValue('ID'), [])
  else
    Abort;
end;

procedure TFrmFaBooks.PkFaBooksIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action     := mrOK;
  ResultValue:= 0;
  PostMessage( Handle, wm_Command, New1.Command, 0 );
end;

procedure TFrmFaBooks.New1Click(Sender: TObject);
begin
{ TODO -omugdha -cWEBIQ : [dcc32 Error] FaBooks.pas(236): E2003 Undeclared identifier: 'BtnClick'
  Nav.BtnClick(nbInsert); }
end;

procedure TFrmFaBooks.SBToggleClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    IQRegFormWrite( Self, [ GridBooks ]);
    GridBooks.DataSource:= NIL;
    PC.ActivePage := TabForm;
  end
  else
  begin
    GridBooks.DataSource  := SrcBooks;
    PC.ActivePage := TabGrid;
    IQRegFormRead( Self, [ GridBooks ]);
  end;
end;

procedure TFrmFaBooks.TblBooksBeforePost(DataSet: TDataSet);
begin
  if TblBooksPROCEDURE_TO_RUN.asString = '' then
  begin
    if TblBooksDEPRECIATION_METHOD.asString = 'VDB' then
      TblBooksPROCEDURE_TO_RUN.asString := 'FA_VAR_DECL_BAL_DEPR'
    else if TblBooksDEPRECIATION_METHOD.asString = 'SL' then
      TblBooksPROCEDURE_TO_RUN.asString := 'FA_STRAIGHT_LINE_DEPR'
    else if TblBooksDEPRECIATION_METHOD.asString = 'FDB' then
      TblBooksPROCEDURE_TO_RUN.asString := 'FA_FIXED_DECL_BAL_DEPR'
    else if TblBooksDEPRECIATION_METHOD.asString = 'GDB' then
      TblBooksPROCEDURE_TO_RUN.asString := 'FA_GENERAL_DECL_BAL_DEPR'
    else if TblBooksDEPRECIATION_METHOD.asString = 'SYD' then
      TblBooksPROCEDURE_TO_RUN.asString := 'FA_SYD_DEPR'
    else if Pos('ACRS', TblBooksDEPRECIATION_METHOD.asString) <> 0 then
      TblBooksPROCEDURE_TO_RUN.asString := 'FA_MACRS_DEPR'
    else
      raise exception.create('Please fill in the Procedure to execute to calculate depreciation');
  end;
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmFaBooks.dbProcCustomDlg(Sender: TObject);
begin
  with PkProc do
  if Execute then
  begin
    if not (TblBooks.State in [dsEdit, dsInsert])
      then TblBooks.Edit;
    TblBooksPROCEDURE_TO_RUN.asString := GetValue('OBJECT_NAME');
  end;
end;

procedure TFrmFaBooks.TblBooksCalcFields(DataSet: TDataSet);
begin
  TblBooksAssetClass.asString := SelectValueFmtAsString('select asset_class from FA_MACRS_CLASS_LIFE where id = %f',
                                             [TblBooksFA_MACRS_CLASS_LIFE_ID.asFloat]);
end;

procedure TFrmFaBooks.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( Self, [ Self, GridBooks, Panel2, Panel3, Panel5]);
  IQSetTablesActive( True, self );
  PC.ActivePage := TabForm;
  try
    sbSearchClick(NIL) ;      // activate search speed button
  except on E:EAbort do
    begin
      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
     // System.SysUtils.ABORT;
    end;
  end;
end;

procedure TFrmFaBooks.dbAssetClassFormCustomDlg(Sender: TObject);
begin
  with PkAssetClass do
  if Execute then
  begin
    if not (TblBooks.State in [dsEdit, dsInsert])
      then TblBooks.Edit;
    TblBooksFA_MACRS_CLASS_LIFE_ID.asFloat := GetValue('ID');
  end;
end;

procedure TFrmFaBooks.dbAssetClassFormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    if not (TblBooks.State in [dsEdit, dsInsert])
      then TblBooks.Edit;
    TblBooksFA_MACRS_CLASS_LIFE_ID.Clear;
    Key := 0;
  end;
end;

procedure TFrmFaBooks.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmFaBooks.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmFA{CHM}, iqhtmFA{HTM} )  {IQMS.Common.HelpHook.pas}
end;

end.
