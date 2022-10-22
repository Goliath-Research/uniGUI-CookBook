unit PRWages;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  IQMS.WebVcl.About,
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
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmPrWages = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
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
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    BtnCancel: TUniButton;
    BtnApply: TUniButton;
    rbPercent: TUniRadioButton;
    rbDollar: TUniRadioButton;
    edAmount: TUniEdit;
    Label1: TUniLabel;
    IQAbout1: TIQWebAbout;
    QryEmpRATE: TBCDField;
    SR: TIQWebSecurityRegister;
    Contents1: TUniMenuItem;
    QryEmpHR_JOB_DESCRIP: TStringField;
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoMassWagesUpdate(AOwner:TComponent);

//var
//  FrmPrWages: TFrmPrWages;

implementation
{$R *.DFM}
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.HelpHook,
  IQMS.Common.StringUtils;

procedure DoMassWagesUpdate(AOwner:TComponent);
var
  frm: TFrmPrWages;
begin
  frm := TFrmPrWages.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmPrWages.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
  IQSetTablesActive( true, self );
end;

procedure TFrmPrWages.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmPrWages.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrWages.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmPrWages.BtnApplyClick(Sender: TObject);
var
  AInc, ARate, AOldRate:Real;
  I:Integer;
begin
  if Trim(edAmount.Text) = '' then
    raise exception.create('Percentage/Amount is blank');
  AInc := StrToFloat(edAmount.Text);
  if not IqConfirmYN('Do you wish to apply the wage update') then Exit;

  if IQSearch1.DBGrid.SelectedRows.Count = 0 then
    raise exception.create('No records selected');

  with IQSearch1.DBGrid, IQSearch1.DBGrid.datasource.dataset do
  begin
    for i:= 0 to SelectedRows.Count-1 do
    begin
      GotoBookmark(SelectedRows.items[i]);
      ARate := SelectValueFmtAsFloat('select rate from pr_emp where id = %f', [FieldByName('ID').asFloat]);
      AOldRate := ARate;
      if rbPercent.Checked then
        ARate := ARate + ARate * AInc/100
      else
        ARate := ARate + AInc;
      ExecuteCommandFmt('update pr_emp set rate = %f where id = %f', [ARate, FieldByName('ID').asFloat]);

      ExecuteCommandFmt('insert into pr_emp_wages_history (pr_emp_id, old_rate, new_rate, date_change, comment1, effective_date, HR_JOB_DESCRIP) ' +
                'values (%f, %f, %f, sysdate, ''Mass wages update'', To_Date(''%s'', ''MM/DD/RRRR''), ''%s'')',
                [FieldByName('ID').asFloat,
                 AOldRate,
                 ARate,
                 FormatDateTime('mm/dd/yyyy', Date),
                 StrTran(QryEmpHR_JOB_DESCRIP.asString, '''', '''''')]);
    end;
  end;
  QryEmp.Close;
  QryEmp.Open;
  IqConfirm('Mass wages update complete');
end;

procedure TFrmPrWages.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_MN{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPrWages.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 13990 );
end;

end.
