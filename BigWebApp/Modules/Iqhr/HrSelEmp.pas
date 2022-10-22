unit HrSelEmp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  { TODO -oathite -cWebConvert : Dependent on HrTrainingSession
  HrTrainingSessions, }
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid,
  uniGUIFrame, Vcl.Controls;

type
  TFrmHrSelEmp = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnCancel: TUniButton;
    btnOk: TUniButton;
    PC: TUniPageControl;
    TabAll: TUniTabSheet;
    TabSkills: TUniTabSheet;
    Panel4: TUniPanel;
    NavSkills: TUniDBNavigator;
    IQSearchAll: TIQUniGridControl;
    IQSearchSkills: TIQUniGridControl;
    SrcEmpAll: TDataSource;
    QryEmpAll: TFDQuery;
    QryEmpAllEMPNO: TStringField;
    QryEmpAllFIRST_NAME: TStringField;
    QryEmpAllLAST_NAME: TStringField;
    QryEmpAllID: TBCDField;
    QryEmpAllSSNMBR: TStringField;
    SrcEmpSkills: TDataSource;
    QryEmpSkills: TFDQuery;
    QryEmpSkillsID: TBCDField;
    QryEmpSkillsSSNMBR: TStringField;
    QryEmpSkillsFIRST_NAME: TStringField;
    QryEmpSkillsLAST_NAME: TStringField;
    QryEmpSkillsPMSKILL_ID: TBCDField;
    QryEmpSkillsSKILL_DESCRIP: TStringField;
    QryEmpSkillsSKILL_TYPE: TStringField;
    QryEmpSkillsSKILLNO: TStringField;
    QryEmpSkillsTRAINING_ITEM: TStringField;
    QryEmpSkillsREV: TStringField;
    QryEmpSkillsEFFECT_DATE: TDateTimeField;
    QryEmpSkillsHR_TRAINING_ITEMS_ID: TBCDField;
    QryEmpSkillsTRAINING_DUE_DATE: TDateTimeField;
    QryEmpAllJOB_TITLE: TStringField;
    QryEmpAllBIRTH_DATE: TDateTimeField;
    QryEmpAllMIDDLE_NAME: TStringField;
    QryEmpAllADDR1: TStringField;
    QryEmpAllADDR2: TStringField;
    QryEmpAllSTATE: TStringField;
    QryEmpAllCOUNTRY: TStringField;
    QryEmpAllZIP: TStringField;
    QryEmpAllPHONE_NUMBER: TStringField;
    QryEmpAllCITY: TStringField;
    QryEmpAllCHARGE_RATE: TBCDField;
    QryEmpAllSTATUS_CODE: TStringField;
    QryEmpAllDATE_HIRED: TDateTimeField;
    QryEmpAllTERMINATION_DATE: TDateTimeField;
    QryEmpAllLAST_REVIEW_DATE: TDateTimeField;
    QryEmpAllNEXT_REVIEW_DATE: TDateTimeField;
    QryEmpSkillsDEPARTMENT: TStringField;
    QryEmpAllDEPARTMENT: TStringField;
    QryEmpAllJOB_DESC: TStringField;
    QryEmpSkillsMIDDLE_NAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FType:String;
    procedure SetType(const Value: string);
  public
    { Public declarations }
    property TypeProperty: string read FType write SetType;
    procedure DoCreate(AType:String);
  end;

function DoHREmpSelect(AType:String):integer;


implementation
{$R *.dfm}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.NLS,
  IQMS.Common.HrRscstr;

function DoHREmpSelect(AType:String):integer;
var
  LFrmHrSelEmp : TFrmHrSelEmp;
begin
  LFrmHrSelEmp := TFrmHrSelEmp.Create(uniGUIApplication.UniApplication);
  with LFrmHrSelEmp do
  begin
    DoCreate(AType);

    ShowModal;
    if AType = 'ALL' then
      Result := IqSearchAll.DBGrid.SelectedRows.Count
    else
      Result := IqSearchSkills.DBGrid.SelectedRows.Count;
  end;
end;

procedure TFrmHrSelEmp.DoCreate(AType: String);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'AOwner'
  PopupParent:= TUniForm(AOwner); }
  TypeProperty := AType;
  if AType = 'ALL' then
  begin
    QryEmpAll.Open;
    PC.ActivePage := TabAll;
  end
  else
  begin
    QryEmpSkills.Open;
    PC.ActivePage := TabSkills;
  end;
end;

procedure TFrmHrSelEmp.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmHrSelEmp.btnOkClick(Sender: TObject);
var
  i: integer;
  aId:Real;
  AStr:String;
  J, K:Integer;
  AIqSearch:TIQUniGridControl;
begin

  if FType = 'ALL' then
    AIqSearch := IqSearchAll
  else
    AIqSearch := IqSearchSkills;

  (* TODO -oathite -cWebConvert : Undeclared identifier: wwdbgrid'
  with IQMS.WebVcl.Search.wwdbgrid, IQMS.WebVcl.Search.wwdbgrid.datasource.dataset do
  begin
    if SelectedList.Count = 0 then
      raise exception.Create(IQMS.Common.HrRscstr.cTXT0000033 {'Please select an employee.'});


    ExecuteCommand('begin  execute immediate ''truncate table GTT_SELECT_EMPLOYEE''; end;');

    J := 100;
    AStr := '';

    for i:= 0 to SelectedList.Count-1 do
    begin
      k := i + 1;
      GotoBookmark(SelectedList.items[i]);
      if k > j then
      begin
        AStr := '(' + Copy(AStr, 1, Length(AStr) - 10) + ')';
        ExecuteCommandFmt('insert into GTT_SELECT_EMPLOYEE(id) %s', [AStr]);
        AStr := '';
        k := 1;
      end;
      AStr := AStr + IqFormat('select %f from dual union all ', [FieldByName('ID').asFloat]);
    end;

    if AStr <> '' then
    begin
      AStr := '(' + Copy(AStr, 1, Length(AStr) - 10) + ')';
      ExecuteCommandFmt('insert into GTT_SELECT_EMPLOYEE(id) %s', [AStr]);
      AStr := '';
    end;
  end;  *)
  Close;
end;

procedure TFrmHrSelEmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmHrSelEmp.SetType(const Value: string);
begin
  FType := Value;
end;

procedure TFrmHrSelEmp.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

end.
