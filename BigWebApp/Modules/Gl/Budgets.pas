unit Budgets;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  Vcl.Menus,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmBudgets = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    SrcBudgets: TDataSource;
    QryBudgets: TFDQuery;
    IQAbout1: TIQWebAbout;
    UpdateSQL1: TFDUpdateSQL;
    QryBudgetsID: TBCDField;
    QryBudgetsDESCRIP: TStringField;
    QryBudgetsCODE: TStringField;
    Panel2: TUniPanel;
    Contents1: TUniMenuItem;
    Panel3: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    QryBudgetsPO_COMPARE: TStringField;
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QryBudgetsBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryBudgetsAfterDelete(DataSet: TDataSet);
    procedure BtnOkClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FQry:TFDQuery;
  public
    { Public declarations }
    FId:Real;
    procedure DoCreate_GetBudget;
    procedure DoCreate(AQry:TFDQuery);
  end;

function GetBudget:Real;
procedure DoBudgets(AQry:TFDQuery);


implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;
{$R *.DFM}

function GetBudget:Real;
var
  LFrmBudgets : TFrmBudgets;
begin
  LFrmBudgets := TFrmBudgets.Create(uniGUIApplication.UniApplication);
  LFrmBudgets.ShowModal;
  LFrmBudgets.DoCreate_GetBudget;
  LFrmBudgets.ShowModal;
  if LFrmBudgets.ModalResult = mrOk then
    Result := LFrmBudgets.FId
  else
    Result := -1;
end;

procedure DoBudgets( AQry:TFDQuery);
var
  LFrmBudgets : TFrmBudgets;
begin
  LFrmBudgets := TFrmBudgets.Create(uniGUIApplication.UniApplication);
  LFrmBudgets.DoCreate(AQry);
  LFrmBudgets.Show;
end;

procedure TFrmBudgets.DoCreate_GetBudget;
begin
  IQRegFormRead( self, [ self ]);
  Caption := 'Please select budget';
  QryBudgets.CachedUpdates := False;
  IQSearch1.DBNavigator.Visible := True;
  QryBudgets.Open;
end;

procedure TFrmBudgets.DoCreate(AQry:TFDQuery);
begin
  IQRegFormRead( self, [ self ]);
  Panel2.Visible := False;
  if AQry <> nil then
    FQry := AQry;
  QryBudgets.Open;
end;

procedure TFrmBudgets.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
  if FQry <> nil then
  begin
    FQry.Close;
    FQry.Open;
  end;
end;


procedure TFrmBudgets.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmBudgets.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBudgets.QryBudgetsBeforePost(DataSet: TDataSet);
begin
  QryBudgetsCODE.AsString := UpperCase(QryBudgetsCODE.asString);
  if QryBudgetsCODE.AsString = 'ACTUAL' then
    raise exception.create ('''ACTUAL'' is a reserved code, please change.');
  if QryBudgets.FieldByName('ID').asFloat = 0 then
  begin
    if QryBudgetsPO_COMPARE.asString = 'Y' then
      if SelectValueAsFloat('select count(id)from budgets where NVL(PO_COMPARE, ''N'') = ''Y''') <> 0 then
        raise exception.create ('Only one budget at a time can be set to PO Comparison.');
    QryBudgets.FieldByName('ID').asFloat := GetNextID('BUDGETS');
  end
  else
  begin
    if QryBudgetsPO_COMPARE.asString = 'Y' then
      if SelectValueFmtAsFloat('select count(id)from budgets where NVL(PO_COMPARE, ''N'') = ''Y'' and id <> %f', [QryBudgetsID.asFloat]) <> 0 then
        raise exception.create ('Only one budget at a time can be set to PO Comparison.');
  end;
end;


procedure TFrmBudgets.QryBudgetsAfterDelete(DataSet: TDataSet);
begin
{
  try
    QryBudgets.DataBase.ApplyUpdates( [ QryBudgets ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryBudgets.Close;
      QryBudgets.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmBudgets.BtnOkClick(Sender: TObject);
begin
  FId := QryBudgetsID.AsFloat;
end;

procedure TFrmBudgets.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1102373 );
end;

procedure TFrmBudgets.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmGL{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
