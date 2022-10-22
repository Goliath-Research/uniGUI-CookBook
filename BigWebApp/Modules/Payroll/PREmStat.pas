unit PREmStat;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Employes,
  PREmpHR,
  PrEmp,
  Vcl.DBGrids,
  Data.DB,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator;

type
  TFrmPREmplStatus = class(TUniForm)
    Panel1: TUniPanel;
    Nav: TUniDBNavigator;
    Grid: TUniDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);
  end;

procedure DoEmplStatus(AOwner:TComponent);

var
  FrmPREmplStatus: TFrmPREmplStatus;

implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;


procedure DoEmplStatus(AOwner:TComponent);
begin
  with TFrmPREmplStatus.Create(AOwner) do Show;
end;

constructor TFrmPREmplStatus.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  if AOwner is TFrmEmployee then
  begin
    Nav.DataSource  := TFrmEmployee(AOwner).DM.SrcEmplStatus;
    Grid.DataSource := TFrmEmployee(AOwner).DM.SrcEmplStatus;
  end
  else if AOwner is TFrmPRHR then
  begin
    Nav.DataSource  := TFrmPRHR(AOwner).DM.SrcEmplStatus;
    Grid.DataSource := TFrmPRHR(AOwner).DM.SrcEmplStatus;
  end
  else
  begin
    Nav.DataSource  := TFrmPREmployee(AOwner).DM.SrcEmplStatus;
    Grid.DataSource := TFrmPREmployee(AOwner).DM.SrcEmplStatus;
  end;

  IQRegFormRead( self, [self, grid]);
end;


procedure TFrmPREmplStatus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, grid]);
  Action := caFree;
end;

procedure TFrmPREmplStatus.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_MN{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPREmplStatus.NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    Grid.DataSource.DataSet.Close;
    Grid.DataSource.DataSet.Open;
    Abort;
  end;
end;

end.
