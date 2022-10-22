unit PRWC;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Mask,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  Vcl.Buttons,
  IQMS.WebVcl.About,
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
  uniPageControl, uniMainMenu;

type
  TFrmPrWc = class(TUniForm)
    Panel1: TUniPanel;
    SBSearch: TUniSpeedButton;
    SBGridView: TUniSpeedButton;
    Nav: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Toggle1: TUniMenuItem;
    Search1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    tblWC: TFDTable;
    tblWCID: TBCDField;
    SrcWC: TDataSource;
    PKWC: TIQWebHPick;
    PKWCID: TBCDField;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    Label1: TUniLabel;
    edWC: TUniDBEdit;
    TabGrid: TUniTabSheet;
    grid: TUniDBGrid;
    PKAcct: TIQWebHPick;
    PKAcctID: TFloatField;
    PKAcctACCT: TStringField;
    PKAcctDESCRIP: TStringField;
    PKAcctTYPE: TStringField;
    Label3: TUniLabel;
    SBAccount: TUniSpeedButton;
    edAccount: TUniDBEdit;
    tblWCWORKERS_COMP_CODE: TStringField;
    tblWCGLACCT_ID: TBCDField;
    TblGlAcct: TFDTable;
    TblGlAcctID: TBCDField;
    TblGlAcctACCT: TStringField;
    TblGlAcctDESCRIP: TStringField;
    TblGlAcctGL_SUBACCT_TYPE_ID: TBCDField;
    tblWCGlacct: TStringField;
    PKWCWORKERS_COMP_CODE: TStringField;
    IQAbout1: TIQWebAbout;
    Contents1: TUniMenuItem;
    procedure SBAccountClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBGridViewClick(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure tblWCBeforePost(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tblWCNewRecord(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoWCComp;

implementation
{$R *.DFM}
uses
  IQMS.Common.JumpConstants,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

procedure DoWCComp;
begin
  TFrmPrWc.Create(uniGUIApplication.UniApplication).Show;
end;

procedure TFrmPrWc.SBAccountClick(Sender: TObject);
begin
  with PKAcct do
    if Execute then
    begin
      if not (tblWC.State in [dsEdit, dsInsert]) then tblWC.Edit;
      tblWC.FieldByName('GLACCT_ID').asFloat := GetValue('ID');
    end;
end;

procedure TFrmPrWc.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrWc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, grid]);
  if Owner is TUniForm then
    PostMessage( TUniForm(Owner).Handle, iq_RefreshDataSets, 0, 0 );
end;

procedure TFrmPrWc.SBGridViewClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    Grid.DataSource:= NIL;
    PC.ActivePage := TabForm;
  end
  else
  begin
    Grid.DataSource  := SrcWC;
    PC.ActivePage := TabGrid;
  end;
end;

procedure TFrmPrWc.SBSearchClick(Sender: TObject);
begin
  if PKWC.Execute then
    tblWC.Locate('ID', PKWC.GetValue('ID'), []);
end;

procedure TFrmPrWc.tblWCBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmPrWc.tblWCNewRecord(DataSet: TDataSet);
begin
  tblWCGLACCT_ID.Clear;
end;

procedure TFrmPrWc.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, grid]);
  IQSetTablesActive( true, self );
  Grid.DataSource:= NIL;
  PC.ActivePage := TabForm;
end;

procedure TFrmPrWc.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmPrWc.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 13992 );
//  IQHelp.HelpContext( 998457 );
end;

procedure TFrmPrWc.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_TP{HTM} )  {IQMS.Common.HelpHook.pas}
end;

end.
