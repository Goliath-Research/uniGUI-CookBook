unit BudgSel;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Mask,
  Vcl.Buttons,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniLabel, IQUniGrid, uniGUIFrame, uniComboBox, uniDBComboBox;

type
  TBudgetCriteria = record
     FiscalYearID     : Real;
     AccountType      : string;
     UserDefinedTypeID: Real;
     Account          : string;
     Department       : string;
     Division         : string;
  end;

type
  TBudgetSelectCriteria = class(TUniForm)
    SrcGlYear: TDataSource;
    SrcAcctType: TDataSource;
    SrcDep: TDataSource;
    SrcDiv: TDataSource;
    QryGLYear: TFDQuery;
    QryAcctType: TFDQuery;
    QryDep: TFDQuery;
    QryDiv: TFDQuery;
    SrcAccount: TDataSource;
    QryAccount: TFDQuery;
    QryAcctTypeID: TBCDField;
    QryAcctTypeDESCRIP: TStringField;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    btnClear: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label6: TUniLabel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    Label1: TUniLabel;
    Panel1: TUniPanel;
    lcbDiv: TUniDBLookupComboBox;
    lcboxDep: TUniDBLookupComboBox;
    lcboxAccount: TUniDBLookupComboBox;
    lcboxSubAcct: TUniDBLookupComboBox;
    lcboxGLYear: TUniDBLookupComboBox;
    Panel2: TUniPanel;
    GroupBox1: TUniGroupBox;
    Panel10: TUniPanel;
    Panel13: TUniPanel;
    SbClearFilter: TUniSpeedButton;
    DBNavigator1: TUniDBNavigator;
    GridFilter: TIQUniGridControl;
    wwValue: TUniEdit;
    SrcFilter: TDataSource;
    QryFilter: TFDQuery;
    QryFilterCOLUMN_NAME: TStringField;
    QryFilterVALUE: TStringField;
    Pk: TIQWebHPick;
    PkVALUE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure lcboxSubAcctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBComboDlg1CustomDlg(Sender: TObject);
    procedure QryFilterUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure SbClearFilterClick(Sender: TObject);
  private
    { Private declarations }
    FList:TStringList;
    FListName:TStringList;
    procedure SetList(const Value: TStringList);
    procedure SetListName(const Value: TStringList);
  public
    procedure DoCreate(var Criteria: TBudgetCriteria);
    { Public declarations }
    property List : TStringList read FList write SetList;
    property ListName : TStringList read FListName write SetListName;
  end;

function GetBudgetSelectionCriteria( var Criteria : TBudgetCriteria; AList, AListName:TStringList ) : Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

function GetBudgetSelectionCriteria( var Criteria : TBudgetCriteria; AList, AListName:TStringList ) : Boolean;
var
  LBudgetSelectCriteria : TBudgetSelectCriteria;
begin
  LBudgetSelectCriteria := TBudgetSelectCriteria.Create(uniGUIApplication.UniApplication);
  LBudgetSelectCriteria.List := AList;
  LBudgetSelectCriteria.ListName := AListName;
  LBudgetSelectCriteria.DoCreate(Criteria);
  Result:= LBudgetSelectCriteria.ShowModal = mrOK;
  if Result then with Criteria do
  begin
    FiscalYearID     := LBudgetSelectCriteria.lcboxGLYear .KeyValue ;
    UserDefinedTypeID:= LBudgetSelectCriteria.lcboxSubAcct.KeyValue;
    Account          := LBudgetSelectCriteria.lcboxAccount.KeyValue;
    Department       := LBudgetSelectCriteria.lcboxDep    .KeyValue;
    Division         := LBudgetSelectCriteria.lcbDiv      .KeyValue;
  end;
end;

procedure TBudgetSelectCriteria.DoCreate( var Criteria : TBudgetCriteria);
var
  i:Integer;
begin
  with Criteria do
  begin
     lcboxGLYear.KeyValue := FiscalYearID     ;
     lcboxSubAcct.KeyValue:= UserDefinedTypeID;
     lcboxAccount.KeyValue:= Account          ;
     lcboxDep    .KeyValue:= Department       ;
     lcbDiv      .KeyValue:= Division         ;
  end;

  lcboxGLYear.Width := Panel1.width - 20;
  lcboxSubAcct.Width := Panel1.width - 20;
  lcboxAccount.Width := Panel1.width - 20;
  lcboxDep    .Width := Panel1.width - 20;
  lcbDiv      .Width := Panel1.width - 20;

  Panel2.visible := FList.Count <> 0;
  if Panel2.visible
    then QryFilter.Open
  else
    Height := 220;

  for I := 0 to FList.Count - 1 do
  begin
    QryFilter.Locate('COLUMN_NAME', FListName[I], []);
    QryFilter.Edit;
    QryFilter.FieldByName('VALUE').asString := FList[I];
    QryFilter.Post;
  end;
end;

procedure TBudgetSelectCriteria.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQMS.Common.RegFrm.IQRegFormRead(Self, [self, PnlLeft01]);
end;

procedure TBudgetSelectCriteria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [self, PnlLeft01]);
end;

procedure TBudgetSelectCriteria.lcboxSubAcctKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    if Sender = lcboxSubAcct then
       lcboxSubAcct.KeyValue:= 0
    else with Sender as TUniDBLookupComboBox do
       KeyValue:= '';
    Key:= 0;
  end
end;


procedure TBudgetSelectCriteria.QryFilterUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
//
end;


procedure TBudgetSelectCriteria.btnClearClick(Sender: TObject);
begin
  lcboxSubAcct.KeyValue:= 0;
  lcboxAccount.KeyValue:= '';
  lcboxDep    .KeyValue:= '';
  lcbDiv      .KeyValue:= '';
  SbClearFilterClick(nil)
end;

procedure TBudgetSelectCriteria.wwDBComboDlg1CustomDlg(Sender: TObject);
var
  AColumnName:String;
  I:Integer;
  AValue:String;
begin
  QryFilter.Edit;
  Pk.Sql.Clear;
  Pk.Sql.Add(Format('select Distinct %s as value from v_glacct', [QryFilter.FieldByName('COLUMN_NAME').asString]));
  AColumnName := QryFilter.FieldByName('COLUMN_NAME').asString;
  I := FListName.IndexOf(AColumnName);

  with Pk do
  begin
    Title := 'Search ' + AColumnName;
    if Execute then
    begin
      AValue := GetValue('VALUE');
      QryFilterVALUE.asString := AValue;
      FList[I] := AValue;
    end
  end;
  QryFilter.Post;
end;

procedure TBudgetSelectCriteria.SbClearFilterClick(Sender: TObject);
var
  I : Integer;
begin
  if FList.Count = 0 then exit;
  for I := 0 to FList.Count - 1 do
    FList[I] := '';
  QryFilter.Close;
  QryFilter.Open;
end;

procedure TBudgetSelectCriteria.SetList(const Value: TStringList);
begin
  FList := Value;
end;

procedure TBudgetSelectCriteria.SetListName(const Value: TStringList);
begin
  FListName := Value;
end;

end.

