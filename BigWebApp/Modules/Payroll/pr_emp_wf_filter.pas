unit pr_emp_wf_filter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  wf_filter,
  Data.DB,
  wf_const,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox, uniComboBox, uniDBComboBox, Vcl.Forms, uniButton;

type
  TFrmPrEmpWorkflowFilter = class(TFrmWorkflowFilter)
    GroupBox3: TUniGroupBox;
    rbtnEmpAll: TUniRadioButton;
    rbtnEmpOne: TUniRadioButton;
    wwDBLookupComboEmp: TUniDBLookupComboBox;
    QryPrEmp: TFDQuery;
    QryPrEmpEMPNO: TStringField;
    QryPrEmpFIRST_NAME: TStringField;
    QryPrEmpLAST_NAME: TStringField;
    QryPrEmpID: TBCDField;
    SrcPrEmp: TDataSource;
    procedure btnOKClick(Sender: TObject);
    procedure EnableControlEmpDropDown(Sender: TObject);
  private
    { Private declarations }
    procedure InitVars( AFilter: TWorkflowFilter ); override;
  protected
    procedure AssignFilter( var AFilter: TWorkflowFilter ); override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Controls;

{ TFrmPrEmpWorkflowFilter }

procedure TFrmPrEmpWorkflowFilter.AssignFilter(var AFilter: TWorkflowFilter);
begin
  inherited;

  with AFilter do
  begin
    if rbtnEmpAll.Checked then
       PR_Emp_ID:= 0
    else
       PR_Emp_ID:= QryPrEmpID.asFloat;
  end;
end;

procedure TFrmPrEmpWorkflowFilter.btnOKClick(Sender: TObject);
begin
  if rbtnEmpOne.Checked and (wwDBLookupComboEmp.Text = '') then
     raise Exception.Create('Employee is not selected');

  inherited;
end;

procedure TFrmPrEmpWorkflowFilter.EnableControlEmpDropDown(Sender: TObject);
begin
  inherited;
  IQEnableControl( wwDBLookupComboEmp, rbtnEmpOne.Checked );
end;

procedure TFrmPrEmpWorkflowFilter.InitVars(AFilter: TWorkflowFilter);
begin
  inherited;

  with AFilter do
  begin
    rbtnEmpAll.Checked:= Vendor_ID <= 0;
    rbtnEmpOne.Checked:= Vendor_ID > 0;
    if rbtnEmpOne.Checked then with wwDBLookupComboEmp do
    begin
      ListField:= SelectValueByID( 'empno', 'pr_emp', PR_Emp_ID );
      { TODO -oathite -cWebConvert : Undeclared identifier
      PerformSearch; }
    end;
  end;
end;

end.
