unit std_labor_assy1;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  StdLabor,
  Data.DB,
  Vcl.Buttons,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.HPick, Vcl.Menus, uniMainMenu,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniBasicGrid, uniDBGrid,
  uniDBNavigator, System.Classes, Vcl.Controls, Vcl.Forms;

type
  TFrmStdLaborHrsAssy1 = class(TFrmStdLaborHrs)
    sbtnFilterAssy1: TUniSpeedButton;
    Bevel1: TUniPanel;
    procedure sbtnFilterAssy1Click(Sender: TObject);
    procedure QryStd_LaborBeforeOpen(DataSet: TDataSet);
  private
    function GetShowOnlyAssy1: Boolean;
    procedure SetShowOnlyAssy1(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property ShowOnlyAssy1: Boolean read GetShowOnlyAssy1 write SetShowOnlyAssy1;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers;

function TFrmStdLaborHrsAssy1.GetShowOnlyAssy1: Boolean;
begin
  Result:= sbtnFilterAssy1.Down;
end;

procedure TFrmStdLaborHrsAssy1.sbtnFilterAssy1Click(Sender: TObject);
begin
  inherited;
  Reopen( QryStd_Labor );
end;

procedure TFrmStdLaborHrsAssy1.SetShowOnlyAssy1(const Value: Boolean);
begin
  sbtnFilterAssy1.Down:= Value;
end;

procedure TFrmStdLaborHrsAssy1.QryStd_LaborBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // with DataSet as TFDQuery do
  //   ParamByName('show_only_assy1').asFloat:= IIf( ShowOnlyAssy1, 1, 0 );
  AssignQueryParamValue(DataSet, 'show_only_assy1', IIf( ShowOnlyAssy1, 1, 0 ));
end;

end.
