unit FailCode;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
//  Wwdbdlg,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, uniComboBox,
  uniDBComboBox, Vcl.Controls;

type
  TFrmFailureCode = class(TUniForm)
    Panel1: TUniPanel;
    pnlAcct: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Splitter1: TUniSplitter;
    DataSource1: TDataSource;
    Table1: TFDTable;
    Table1ID: TBCDField;
    Table1DESCRIP: TStringField;
    Table1WARRANTY: TStringField;
    Table1GLACCT_ID_WIP: TBCDField;
    Table1GLACCT_ID_FINISHED: TBCDField;
    Table1GLACCT_ID_LABOR_APPLIED: TBCDField;
    Table1GLACCT_ID_LABOR_COGS: TBCDField;
    Table1GLACCT_ID_COMP_COGS: TBCDField;
    ScrollBox1: TUniScrollBox;
    QryGLAcct: TFDQuery;
    QryGLAcctID: TBCDField;
    QryGLAcctACCT: TStringField;
    QryGLAcctDESCRIP: TStringField;
    QryGLAcctTYPE: TStringField;
    QryGLAcctEPLANT_ID: TBCDField;
    QryGLAcctPK_HIDE: TStringField;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    wwDBLookupCombo2: TUniDBLookupComboBox;
    wwDBLookupCombo3: TUniDBLookupComboBox;
    wwDBLookupCombo4: TUniDBLookupComboBox;
    wwDBLookupCombo5: TUniDBLookupComboBox;
    PkGLAcct: TIQWebHPick;
    PkGLAcctID: TBCDField;
    PkGLAcctACCT: TStringField;
    PkGLAcctDESCRIP: TStringField;
    PkGLAcctTYPE: TStringField;
    PkGLAcctEPLANT_ID: TBCDField;
    PkGLAcctPK_HIDE: TStringField;
    Table1CODE: TStringField;
    QryGLAcctDISP_ACCT: TStringField;
    Table1GLACCT_ID_SALES_RMA: TBCDField;
    wwDBLookupCombo6: TUniDBLookupComboBox;
    Bevel1: TUniPanel;
    IQAbout1: TIQWebAbout;
    PopupMenu1: TUniPopupMenu;
    About1: TUniMenuItem;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    ds_GLAcct: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure PickGLAcct(Sender: TObject);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

//var
//  FrmFailureCode: TFrmFailureCode;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
//  IQSecIns,
  IQMS.Common.HelpHook,
  IQMS.Common.Controls;


class procedure TFrmFailureCode.DoShowModal;
var
  frm:TFrmFailureCode;
begin
  frm:=TFrmFailureCode.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TFrmFailureCode.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1, pnlAcct ]);
//  IQMS.Common.Controls.ResizeNavBar(DBNavigator1);
end;

procedure TFrmFailureCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action:= caFree;
  IQRegFormWrite( self, [ self, wwDBGrid1, pnlAcct ])
end;

procedure TFrmFailureCode.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmFailureCode.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet);
end;

procedure TFrmFailureCode.PickGLAcct(Sender: TObject);
begin
  with PkGLAcct do
    if Execute then
    begin
      Table1.Edit;
      if Sender is TUniDBLookupComboBox then
         Table1.FieldByName( TUniDBLookupComboBox(Sender).DataField ).asFloat:= GetValue('ID');
    end;
  ABORT;
end;

procedure TFrmFailureCode.Table1AfterInsert(DataSet: TDataSet);
begin
  wwDBGrid1.SetFocus;
end;

procedure TFrmFailureCode.Table1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( Dataset );
  Table1CODE.asString:= Trim(UpperCase(Table1CODE.asString));
end;

procedure TFrmFailureCode.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSHIP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmFailureCode.About1Click(Sender: TObject);
begin
  IQabout1.Execute;
end;

end.














