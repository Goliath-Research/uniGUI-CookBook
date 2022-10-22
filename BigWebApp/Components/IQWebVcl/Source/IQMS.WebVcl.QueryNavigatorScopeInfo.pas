unit IQMS.WebVcl.QueryNavigatorScopeInfo;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Data.DB,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniGUIApplication,
  uniBitBtn,
  uniSpeedButton, IQMS.Common.GridBase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.Jump,
  Vcl.Menus, uniMainMenu, FireDAC.Comp.DataSet, FireDAC.Comp.Client, IQUniGrid,
  Vcl.Forms, uniGUIFrame, uniDBNavigator, Vcl.Controls, uniPanel;

type
  TFrmQueryNavigatorScopeInfo = class(TFrmIQGridBase)
    sbtnCopyData: TUniSpeedButton;
    Query1BATCH: TBCDField;
    Query1ID: TBCDField;
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure sbtnCopyDataClick(Sender: TObject);
  private
    { Private declarations }
    FBatch: Real;
  public
    { Public declarations }
    class procedure DoShow(AOwner: TComponent; ABatch: Real);
    property Batch:Real read FBatch write FBatch;
  end;

var
  FrmQueryNavigatorScopeInfo: TFrmQueryNavigatorScopeInfo;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs;

class procedure TFrmQueryNavigatorScopeInfo.DoShow(AOwner: TComponent; ABatch: Real);
begin
 with self.Create(uniGUIApplication.UniApplication) do
  begin
    Batch:=ABatch;
    show;
  end;
end;

procedure TFrmQueryNavigatorScopeInfo.Query1BeforeOpen(DataSet: TDataSet);
begin
  inherited;
  AssignQueryParamValue(DataSet, 'batch', FBatch);
end;

procedure TFrmQueryNavigatorScopeInfo.sbtnCopyDataClick(Sender: TObject);
var
  S: string;
begin
  inherited;

  S:= 'TEMP_PICKLIST_SCOPE';
  if not IQConfirmYN(Format('This option copies current navigator scope to a temporary table %s. Please confirm to continue.', [ S ])) then
     EXIT;

  try
    ExecuteCommandFmt('drop table %s', [ S ]);
  except
  end;

  ExecuteCommandFmt('create table %s as select * from GTT_picklist_scope where batch = %f', [ S, FBatch ]);

  IQConfirm(Format('Table %s was populated successfully.', [ S ]));
end;

end.
