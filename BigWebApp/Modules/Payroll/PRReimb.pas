unit PRReimb;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Mask,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  IQMS.WebVcl.Hpick,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, uniMainMenu;

type
  TFrmPTReimb = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    SBSearch: TUniSpeedButton;
    SBGridView: TUniSpeedButton;
    Nav: TUniDBNavigator;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    Label1: TUniLabel;
    Label3: TUniLabel;
    SBAccount: TUniSpeedButton;
    Label7: TUniLabel;
    edDescrip: TUniDBEdit;
    edAccount: TUniDBEdit;
    dbGlPlug: TUniDBComboBox;
    TabGrid: TUniTabSheet;
    grid: TUniDBGrid;
    Label2: TUniLabel;
    Label4: TUniLabel;
    dbw2code: TUniDBEdit;
    IQAbout1: TIQWebAbout;
    PKAcct: TIQWebHPick;
    PKAcctID: TBCDField;
    PKAcctACCT: TStringField;
    PKAcctDESCRIP: TStringField;
    PKAcctTYPE: TStringField;
    SrcPayTypeReimb: TDataSource;
    tblPayTypeReimb: TFDTable;
    tblPayTypeReimbGlacct: TStringField;
    tblPayTypeReimbDESCRIPTION: TStringField;
    tblPayTypeReimbGLACCT_ID: TBCDField;
    tblPayTypeReimbID: TBCDField;
    TblGlAcct: TFDTable;
    TblGlAcctID: TBCDField;
    TblGlAcctACCT: TStringField;
    TblGlAcctDESCRIP: TStringField;
    TblGlAcctGL_SUBACCT_TYPE_ID: TBCDField;
    tblPayTypeReimbUSE_DEPT_GL_PLUG: TStringField;
    tblPayTypeReimbW2_BOX: TStringField;
    tblPayTypeReimbW2_CODE: TStringField;
    SR: TIQWebSecurityRegister;
    PKPayTypeReimb: TIQWebHPick;
    PKPayTypeReimbID: TBCDField;
    PKPayTypeReimbDESCRIPTION: TStringField;
    PKPayTypeReimbACCRUE: TStringField;
    PKPayTypeReimbACCT: TStringField;
    Toggle1: TUniMenuItem;
    Search1: TUniMenuItem;
    N1: TUniMenuItem;
    dbw2Box: TUniDBComboBox;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure SBAccountClick(Sender: TObject);
    procedure tblPayTypeReimbBeforePost(DataSet: TDataSet);
    procedure SBGridViewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBSearchClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tblPayTypeReimbNewRecord(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


procedure DoPayTypesReimb;

implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

procedure DoPayTypesReimb;
begin
  TFrmPTReimb.Create(UniGUIApplication.UniApplication).Show;
end;

procedure TFrmPTReimb.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPTReimb.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmPTReimb.SBAccountClick(Sender: TObject);
begin
  with PKAcct do
    if Execute then
    begin
      if not (tblPayTypeReimb.State in [dsEdit, dsInsert]) then tblPayTypeReimb.Edit;
      tblPayTypeReimb.FieldByName('GLACCT_ID').asFloat := GetValue('ID');
    end;
end;

procedure TFrmPTReimb.tblPayTypeReimbBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmPTReimb.tblPayTypeReimbNewRecord(DataSet: TDataSet);
begin
    tblPayTypeReimbGLACCT_ID.Clear;
end;

procedure TFrmPTReimb.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, grid]);
  IQSetTablesActive( true, self );
  Grid.DataSource:= NIL;
  PC.ActivePage := TabForm;
end;

procedure TFrmPTReimb.SBGridViewClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    Grid.DataSource:= NIL;
    PC.ActivePage := TabForm;
  end
  else
  begin
    Grid.DataSource  := SrcPayTypeReimb;
    PC.ActivePage := TabGrid;
  end;
end;

procedure TFrmPTReimb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, grid]);
end;

procedure TFrmPTReimb.SBSearchClick(Sender: TObject);
begin
  if PKPayTypeReimb.Execute then
    tblPayTypeReimb.Locate('ID', PKPayTypeReimb.GetValue('ID'), []);
end;

procedure TFrmPTReimb.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 9813 );
end;

procedure TFrmPTReimb.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_TP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
