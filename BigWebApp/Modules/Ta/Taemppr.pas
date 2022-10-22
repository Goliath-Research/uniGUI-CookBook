unit TAEmpPR;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Db,
  Wwdatsrc,
  IQMS.WebVcl.Search,
  DBCtrls,
  StdCtrls,
  ExtCtrls,
  TAPostPR,
  IQMS.WebVcl.SecurityRegister,
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
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid, uniGUIFrame;

type
  TFrmTASelEmpPR = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnCancel: TUniButton;
    btnOk: TUniButton;
    IQSearch1: TIQUniGridControl;
    SrcEmp: TDataSource;
    QryEmp: TFDQuery;
    QryEmpEMPNO: TStringField;
    QryEmpFIRST_NAME: TStringField;
    QryEmpLAST_NAME: TStringField;
    QryEmpID: TBCDField;
    SR: TIQWebSecurityRegister;
    QryEmpMIDDLE_NAME: TStringField;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoTAEmpPR():integer;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas file
  IQSecIns,  }
  IQMS.Common.NLS,
  ta_rscstr;

function DoTAEmpPR():integer;
var
  LFrmTASelEmpPR : TFrmTASelEmpPR;
begin
 LFrmTASelEmpPR := TFrmTASelEmpPR.Create(UniGUIApplication.UniApplication);
 LFrmTASelEmpPR.ShowModal;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named wwDbGrid
 Result := IqSearch1.wwDbGrid.SelectedList.Count;  }
end;

procedure TFrmTASelEmpPR.btnCancelClick(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named UnselectAll
  IQSearch1.wwdbgrid.UnselectAll;   }
  if Assigned(TFrmTAPostPayroll(Self).FEmplList) then
    TFrmTAPostPayroll(Self).FEmplList.Clear;
  Close;
end;

procedure TFrmTASelEmpPR.btnOkClick(Sender: TObject);
var
  i: integer;
begin
  if Assigned(TFrmTAPostPayroll(Self).FEmplList) then
    TFrmTAPostPayroll(Self).FEmplList.Clear;
(* TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named wwDbGrid
  with IQSearch1.wwdbgrid,IQSearch1.wwdbgrid.datasource.dataset do
  begin
    if SelectedList.Count = 0 then
      raise exception.Create(ta_rscstr.cTXT0000042 {'Please select an employee.'});
    for i:= 0 to SelectedList.Count-1 do
    begin
      GotoBookmark(SelectedList.items[i]);
      TFrmTAPostPayroll(self.Owner).FEmplList.Add(FieldByName('ID').asString);
    end;
  end;
  Close;   *)
end;

procedure TFrmTASelEmpPR.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas File
  EnsureSecurityInspectorOnTopOf( self );  }
end;

procedure TFrmTASelEmpPR.UniFormCreate(Sender: TObject);
begin
//  CreateComponentsList(self, 'c:\iqwin\CompList\');
  IQRegFormRead( self, [self]);

with QryEmp do
  begin
    Close;
    Sql.Clear;
    Sql.Add(IQFormat('select distinct l.pr_emp_id as id,      ' +
                   '                p.first_name,           ' +
                   '                p.middle_name,          ' +
                   '                p.last_name,            ' +
                   '                p.empno,                ' +
                   '                p.ssnmbr                ' +
                   '  from   pr_emp p,                      ' +
                   '         TA_PREPOST_LOG l,              ' +
                   '         TA_PREPOST_CONTROL c           ' +
                   ' where l.pr_emp_id = p.id               ' +
                   '   and l.ta_prepost_control_id = c.id   ' +
                   '   and NVL(PK_HIDE, ''N'') = ''N''      ' +
                   '   and c.id in %s                       ', [TFrmTAPostPayroll(Self).FControlIDList]));
     Open;
  end;
end;

end.
