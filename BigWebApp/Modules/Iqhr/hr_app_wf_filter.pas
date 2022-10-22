unit hr_app_wf_filter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  wf_filter,
  Data.DB,
  wf_const,
  FireDAC.Comp.Client,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniGUIClasses,
  uniRadioButton, uniGroupBox, Vcl.Controls, Vcl.Forms, uniGUIBaseClasses,
  uniButton;

type
  TFrmHrAppWorkflowFilter = class(TFrmWorkflowFilter)
    QryHrApp: TFDQuery;
    QryHrAppLAST_NAME: TStringField;
    QryHrAppFIRST_NAME: TStringField;
    QryHrAppID: TBCDField;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure AssignFilter( var AFilter: TWorkflowFilter ); override;
    procedure InitVars(AFilter: TWorkflowFilter);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

{ TFrmHrAppWorkflowFilter }

procedure TFrmHrAppWorkflowFilter.AssignFilter(var AFilter: TWorkflowFilter);
begin
  inherited;

  with AFilter do
  begin
    if rbtnCustAll.Checked then
       HR_App_ID:= 0
    else
       HR_App_ID:= QryHrAppID.asFloat;
  end;
end;

procedure TFrmHrAppWorkflowFilter.btnOKClick(Sender: TObject);
begin
  if rbtnCustOne.Checked and (wwDBLookupComboArcusto.Text = '') then
     raise Exception.Create('Applicant is not selected');

  inherited;
end;


procedure TFrmHrAppWorkflowFilter.InitVars(AFilter: TWorkflowFilter);
begin
  inherited;
  with AFilter do
  begin
    rbtnCustAll.Checked:= Hr_App_ID <= 0;
    rbtnCustOne.Checked:= Hr_App_ID > 0;
    if rbtnCustOne.Checked then with wwDBLookupComboArcusto do
    begin
      ListField := SelectValueByID( 'last_name', 'hr_app', Hr_App_ID );
      { TODO -oathite -cWebConvert : Undeclare identifier Performsearch
      PerformSearch;}
    end;
  end;
end;

end.
