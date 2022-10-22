unit AccrueSched;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmAccrueShed = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    SrcHdr: TDataSource;
    SrcDtl: TDataSource;
    IQSearchHdr: TIQUniGridControl;
    QryHdr: TFDQuery;
    QryHdrID: TBCDField;
    QryHdrDESCRIP: TStringField;
    QryHdrNUM_OF_DAYS_TO_NEXT_EVAL: TBCDField;
    UpdateSQL1: TFDUpdateSQL;
    IQSearchDtl: TIQUniGridControl;
    UpdateSQL2: TFDUpdateSQL;
    QryDtl: TFDQuery;
    QryDtlID: TBCDField;
    QryDtlPR_ACCR_SCHED_ID: TBCDField;
    QryDtlYEARS_WORKED: TBCDField;
    QryDtlNUM_DAYS_ACCRUED: TBCDField;
    QryDtlADD_DAYS_PER_YEAR: TBCDField;
    QryDtlNOT_TO_EXCEED_DAYS: TBCDField;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    QryHdrHRS_PER_DAY: TBCDField;
    PkDate_Field: TIQWebHPick;
    PkDate_FieldCOLUMN_NAME: TStringField;
    QryHdrDATE_FIELD: TStringField;
    dbDateField: TUniEdit;
    PopupMenu1: TUniPopupMenu;
    ClearDateField1: TUniMenuItem;
    Contents1: TUniMenuItem;
    QryDtlMAX_QTY: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryHdrBeforePost(DataSet: TDataSet);
    procedure QryDtlBeforePost(DataSet: TDataSet);
    procedure QryHdrAfterPost(DataSet: TDataSet);
    procedure QryDtlAfterPost(DataSet: TDataSet);
    { TODO -oathite -cWebConvert : before event action is not available
    procedure NavHdrBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure NavDtlBeforeAction(Sender: TObject; Button: TNavigateBtn); }
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure dbDateFieldCustomDlg(Sender: TObject);
    procedure ClearDateField1Click(Sender: TObject);
    procedure QryDtlBeforeEdit(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoAccrueSched;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;
{$R *.dfm}

procedure DoAccrueSched;
begin
  with TFrmAccrueShed.Create(uniGUIApplication.UniApplication) do Show;
end;

procedure TFrmAccrueShed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmAccrueShed.QryHdrBeforePost(DataSet: TDataSet);
begin
  if QryHdrID.asFloat = 0 then
    QryHdrID.asFloat := GetNextID('PR_ACCR_SCHED');
end;

procedure TFrmAccrueShed.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
  IQSetTablesActive( true, self );
  dbDateField.Parent := IQSearchHdr.DBGrid;
  dbDateField.Visible := False;
end;

procedure TFrmAccrueShed.QryDtlBeforePost(DataSet: TDataSet);
begin
  if QryHdrID.asFloat = 0 then
    raise exception.Create('No Header record found');
  if QryDtlID.asFloat = 0 then
    QryDtlID.asFloat := GetNextID('PR_ACCR_SCHED_DETAIL');

  if QryDtlPR_ACCR_SCHED_ID.asFloat = 0 then
    QryDtlPR_ACCR_SCHED_ID.asFloat := QryHdrID.asFloat;
end;

procedure TFrmAccrueShed.QryHdrAfterPost(DataSet: TDataSet);
begin
{
  try
    QryHdr.DataBase.ApplyUpdates( [ QryHdr ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryHdr.Close;
      QryHdr.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmAccrueShed.QryDtlAfterPost(DataSet: TDataSet);
begin
{
  try
    QryDtl.DataBase.ApplyUpdates( [ QryDtl ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryDtl.Close;
      QryDtl.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;
{ TODO -oathite -cWebConvert : before event action is not available
procedure TFrmAccrueShed.NavHdrBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId :Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryHdrID.asFloat;
    QryHdr.Close;
    QryHdr.Open;
    QryHdr.Locate('ID', AId, []);
    Abort;
  end;
end;

procedure TFrmAccrueShed.NavDtlBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId :Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryDtlID.asFloat;
    QryDtl.Close;
    QryDtl.Open;
    QryDtl.Locate('ID', AId, []);
    Abort;
  end;

end; }

procedure TFrmAccrueShed.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmAccrueShed.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAccrueShed.dbDateFieldCustomDlg(Sender: TObject);
begin
  if PkDate_Field.Execute then
  begin
    if not (QryHdr.State in [dsEdit, dsInsert]) then QryHdr.Edit;
    QryHdrDATE_FIELD.asString := PkDate_Field.GetValue('COLUMN_NAME');
  end;
end;

procedure TFrmAccrueShed.ClearDateField1Click(Sender: TObject);
begin
  if not (QryHdr.State in [dsEdit, dsInsert]) then QryHdr.Edit;
  QryHdrDATE_FIELD.Clear;
end;

procedure TFrmAccrueShed.QryDtlBeforeEdit(DataSet: TDataSet);
begin
  QryHdr.CheckBrowseMode;
end;

procedure TFrmAccrueShed.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_TP{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmAccrueShed.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 9814 );
end;

end.
