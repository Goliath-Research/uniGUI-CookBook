unit TAAssignPayTypes;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
//  vcl.wwdatsrc,
//  Vcl.Buttons,
//  vcl.wwdblook,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
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
  uniLabel,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid,
  uniGUIFrame, Vcl.Menus, Vcl.Controls;


const FEmpno       = ' order by e.empno ';
const FFirstName   = ' order by e.first_name ';
const FLastName    = ' order by e.last_name ';
const FDepartment  = ' order by NVL(d.description, '' '') ';
const FTA          = ' order by NVL(t.descrip, '' '') ';
const FShift       = ' order by NVL(s.descrip, '' '') ';


type
  TFrmAssignPayTypes = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Orderby1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SrcEmp: TDataSource;
    QryEmp: TFDQuery;
    QryEmpEMPNO: TStringField;
    QryEmpNAME: TStringField;
    QryEmpDEPARTMENT: TStringField;
    QryEmpTA_SETTING: TStringField;
    QryEmpSHIFT: TStringField;
    QryEmpPAYGROUP: TStringField;
    QryEmpPAYTYPE: TStringField;
    QryEmpSSNMBR: TStringField;
    QryEmpFIRST_NAME: TStringField;
    QryEmpLAST_NAME: TStringField;
    QryEmpMIDDLE_NAME: TStringField;
    QryEmpADDR1: TStringField;
    QryEmpADDR2: TStringField;
    QryEmpSTATE: TStringField;
    QryEmpZIP: TStringField;
    QryEmpCOUNTRY: TStringField;
    QryEmpPHONE_NUMBER: TStringField;
    QryEmpBASIS: TStringField;
    QryEmpPR_PAYGROUP_ID: TBCDField;
    QryEmpPR_PAYTYPE_ID: TBCDField;
    QryEmpPR_DEPARTMENT_ID: TBCDField;
    QryEmpID: TBCDField;
    QryEmpTA_SETTINGS_ID: TBCDField;
    Panel1: TUniPanel;
    Panel4: TUniPanel;
    SBSearchPurch: TUniSpeedButton;
    Panel5: TUniPanel;
    Panel2: TUniPanel;
    lblPayGroup: TUniLabel;
    dbPayGroup: TUniDBLookupComboBox;
    Panel3: TUniPanel;
    Panel6: TUniPanel;
    btnApply: TUniButton;
    PnlClient02: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    PnlClient01: TUniPanel;
    dbPaytype2: TUniComboBox;
    dbPaytype: TUniDBLookupComboBox;
    gridEmp: TIQUniGridControl;
    srcPayGroup: TDataSource;
    QryPayGroup: TFDQuery;
    PkEmp: TIQWebHPick;
    PkEmpID: TBCDField;
    PkEmpEMPNO: TStringField;
    PkEmpFIRST_NAME: TStringField;
    PkEmpMIDDLE_NAME: TStringField;
    PkEmpLAST_NAME: TStringField;
    PkEmpSSNMBR: TStringField;
    PkEmpADDR1: TStringField;
    PkEmpADDR2: TStringField;
    PkEmpSTATE: TStringField;
    PkEmpCOUNTRY: TStringField;
    PkEmpZIP: TStringField;
    PkEmpPHONE_NUMBER: TStringField;
    PkEmpCITY: TStringField;
    PkEmpCHARGE_RATE: TBCDField;
    PkEmpSTATUS_CODE: TStringField;
    PkEmpDATE_HIRED: TDateTimeField;
    PkEmpTERMINATION_DATE: TDateTimeField;
    PkEmpLAST_REVIEW_DATE: TDateTimeField;
    PkEmpNEXT_REVIEW_DATE: TDateTimeField;
    PkEmpPK_HIDE: TStringField;
    PkEmpBADGENO: TStringField;
    QryEmpOT1_PAYTYPE: TStringField;
    QryEmpOT2_PAYTYPE: TStringField;
    QryEmpOT3_PAYTYPE: TStringField;
    QryEmpHOL_PAYTYPE: TStringField;
    SortbyEmp2: TUniMenuItem;
    SortbyEmpFirstName1: TUniMenuItem;
    SortbyLastName2: TUniMenuItem;
    SortbyDepartment2: TUniMenuItem;
    SortbyTimeAttendancesetting1: TUniMenuItem;
    SortbyShift2: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryPayType: TFDQuery;
    QryPayGroupID: TFMTBCDField;
    QryPayGroupDESCRIPTION: TStringField;
    dsPayType: TDataSource;
    procedure SortbyEmp2Click(Sender: TObject);
    procedure dbPayGroupCloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure SBSearchPurchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QryEmpAfterOpen(DataSet: TDataSet);
    procedure QryEmpBeforeClose(DataSet: TDataSet);
    procedure PkEmpBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FSql:String;
    FPayGroupStr:String;
    FOrderBy:String;
    procedure ResetQuery;
  public
    { Public declarations }

  end;

procedure DoAssignPayTypesToEmployees;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  ta_rscstr,
  IQMS.Common.StringUtils,
  IQMS.Common.NLS,
  IQMS.Common.Dialogs;
{$R *.dfm}

procedure DoAssignPayTypesToEmployees;
var
  frm : TFrmAssignPayTypes;
begin
  frm := TFrmAssignPayTypes(UniMainModule.GetFormInstance(TFrmAssignPayTypes)); // singleton
//  frm := TFrmAssignPayTypes.Create(uniGUIApplication.UniApplication); // as many as you request
  frm.Show;
end;

procedure TFrmAssignPayTypes.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmAssignPayTypes.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, gridEmp]);
  dbPayGroup.KeyValue := 0;
  FSql := QryEmp.Sql.Text;
  FPayGroupStr := '';
  FOrderBy     := '';
  IQSetTablesActive( TRUE, self );
  SortbyEmp2Click(SortbyEmp2);
end;

procedure TFrmAssignPayTypes.dbPayGroupCloseUp(Sender: TObject);
var
  AValue:Integer;
begin
  FPayGroupStr := '';
  AValue := dbPayGroup.KeyValue;
  if AValue <> 0 then
    FPayGroupStr := IQFormat(' and pr_paygroup_id = %d ', [AValue]);
  ResetQuery;
end;

procedure TFrmAssignPayTypes.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAssignPayTypes.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, gridEmp]);
  Action := caFree;
end;

procedure TFrmAssignPayTypes.QryEmpAfterOpen(DataSet: TDataSet);
begin
  IQRegFormRead( self, [self, gridEmp]);
end;

procedure TFrmAssignPayTypes.QryEmpBeforeClose(DataSet: TDataSet);
begin
  IQRegFormWrite( self, [self, gridEmp]);
end;

procedure TFrmAssignPayTypes.SortbyEmp2Click(Sender: TObject);
begin
  TUniMenuItem(Sender).Checked := True;
  if      (TUniMenuItem(Sender) = SortbyEmp2) then
  begin
    FOrderBy := FEmpno;
  end
  else if (TUniMenuItem(Sender) = SortbyEmpFirstName1) then
  begin
    FOrderBy := FFirstName;
  end
  else if (TUniMenuItem(Sender) = SortbyLastName2) then
  begin
    FOrderBy := FLastName;
  end
  else if (TUniMenuItem(Sender) = SortbyDepartment2) then
  begin
    FOrderBy := FDepartment;
  end
  else if (TUniMenuItem(Sender) = SortbyTimeAttendancesetting1) then
  begin
    FOrderBy := FTA;
  end
  else if (TUniMenuItem(Sender) = SortbyShift2) then
  begin
    FOrderBy := FShift;
  end;

  Panel2.Caption := ta_rscstr.cTXT0000238 {'Sorted by'} + ' ' + Strtran(TUniMenuItem(Sender).Caption, '&', '');
  ResetQuery;
end;

procedure TFrmAssignPayTypes.ResetQuery;
begin
  if QryEmp.Sql.Text = (FSql + FPayGroupStr + FOrderBy + #13#10)
    then Exit;

  //gridEmp.UnselectAll;
  //Javascript alternative to uniDBgrid.UnselectAll
   UniSession.AddJS(gridEmp.DBGrid.JSName + '.getSelectionModel().deselectAll()');

//  IQRegFormWrite( self, [self, gridEmp]);
  with QryEmp do
  begin
    Close;
    Sql.Clear;
    Sql.Add(FSql + ' ' + FPayGroupStr + FOrderBy);
    Open;
  end;
//  IQRegFormRead( self, [self, gridEmp]);
end;

procedure TFrmAssignPayTypes.btnApplyClick(Sender: TObject);
var
  i: integer;
  AFieldName:String;
  AId, nID:Real;
begin
  if gridEmp.DBGrid.SelectedRows.Count = 0 then
    raise Exception.Create(ta_rscstr.cTXT0000239 {'Please select a record.'});
  try
    AId := dbPaytype.KeyValue;
  except
    AID := 0;
  end;
  if AID < 1 then raise Exception.Create(ta_rscstr.cTXT0000240 {'Please select a Default Pay Type'});

  { TODO -oLema : to find a workaround }
  //  AFieldName := dbPaytype2.GetComboValue(dbPaytype2.Text);

  if AFieldName = '' then raise Exception.Create(ta_rscstr.cTXT0000241 {'Please select an Inventory account.'});

  with gridEmp, QryEmp do
  begin
//    DisableControls; {Disable controls to improve performance}
    nID := FieldByName('ID').asFloat;
    for i:= 0 to DBGrid.SelectedRows.Count-1 do begin
     GotoBookmark(DBGrid.SelectedRows[i]);
     ExecuteCommandFmt('update pr_emp set %s = %f where id = %f', [AFieldName, AId, FieldByName('ID').asFloat]);
    end;

//    IQRegFormWrite( self, [self, gridEmp]);
    Close;
    Open;
//    IQRegFormRead( self, [self, gridEmp]);
    Locate('ID', nId, []);

    IQInformation(ta_rscstr.cTXT0000242 {'Done'});
//    EnableControls;  { Re-enable controls }
  end;
end;


procedure TFrmAssignPayTypes.SBSearchPurchClick(Sender: TObject);
var
  nId:Real;
begin

//2016.10.17 Error in IQMS.WebVcl.HPick -> TIQWebHpick.ShowDefaultPickList
  with pkEmp do
    if Execute then
    begin
      nId := GetValue('ID');
      if nID > 0 then
        QryEmp.Locate('ID', nId, [])
    end;
end;

procedure TFrmAssignPayTypes.PkEmpBeforeOpen(DataSet: TDataSet);
var
  AValue:Integer;
begin
  AValue := dbPayGroup.KeyValue;
  AssignQueryParamValue(DataSet, 'nId', AValue);
//  TFDQuery(DataSet).ParamByName('nId').Value := AValue;
  if AValue <> 0 then
    AssignQueryParamValue(DataSet, 'nNum', 0)
//    TFDQuery(DataSet).ParamByName('nNum').Value := 0
  else
    AssignQueryParamValue(DataSet, 'nNum', 1);
//    TFDQuery(DataSet).ParamByName('nNum').Value := 1;
end;

end.
