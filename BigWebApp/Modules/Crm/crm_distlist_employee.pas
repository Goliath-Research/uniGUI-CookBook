unit crm_distlist_employee;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  crm_distlist,
  Data.DB,
  Vcl.Wwdatsrc,
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
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet,
  IQMS.WebVcl.CaptionPanel,
  IQMS.WebVcl.Search,
  Vcl.Controls,
  System.Classes, uniMainMenu, uniEdit, IQUniGrid, Vcl.Forms, uniGUIFrame,
  uniGUIClasses, uniCheckBox, uniDBNavigator, uniGUIBaseClasses, uniPanel;

type
  TFrmCRMDistListEmployee = class(TFrmCRMDistList)
    QryMasterID: TBCDField;
    QryMasterEMPNO: TStringField;
    QryMasterNAME: TStringField;
    QryMasterDISTLIST: TStringField;
    QryDistListID: TBCDField;
    QryDistListPR_EMP_ID: TBCDField;
    QryDistListNAME: TStringField;
    QryDistListEMAIL: TStringField;
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure InitValues; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib;

{ TFrmCRMDistListEmployee }

procedure TFrmCRMDistListEmployee.GridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PGrid.Popup(x,y,sender);
end;

procedure TFrmCRMDistListEmployee.InitValues;
begin
  MasterSource := 'PR_EMP';
  TableName := 'PR_EMP_DIST';
  ParentFieldName := 'PR_EMP_ID';

  if not QryMaster.Active then
    ReOpen(QryMaster);
  SourceDisplay := Format('%s - %s',
    [Trim(QryMaster.FieldByName('EMPNO').AsString),
    Trim(QryMaster.FieldByName('NAME').AsString)]);

end;

end.
