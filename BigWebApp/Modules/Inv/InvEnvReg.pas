unit InvEnvReg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmInvEnvRegulation = class(TUniForm)
    wwDBGrid1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    wwQuery1REGNO: TStringField;
    wwQuery1DESCRIP: TStringField;
    SR: TIQWebSecurityRegister;
    wwQuery1ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQuery1BeforePost(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);  }
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

{ TFrmInvEnvRegulations }

class procedure TFrmInvEnvRegulation.DoShow;
var
  LFrmInvEnvRegulation : TFrmInvEnvRegulation;
begin
  LFrmInvEnvRegulation := TFrmInvEnvRegulation.Create(UniGUIApplication.UniApplication);
  LFrmInvEnvRegulation.Show;
end;

procedure TFrmInvEnvRegulation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormRead( self, [ self, wwDBgrid1 ]);
end;

procedure TFrmInvEnvRegulation.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, wwDBGrid1 ])
end;

procedure TFrmInvEnvRegulation.wwQuery1BeforePost(DataSet: TDataSet);
begin
  wwQuery1REGNO.asString:= UpperCase(wwQuery1REGNO.asString);
  IQAssignIDBeforePost( wwQuery1, 'env_reg');
end;

procedure TFrmInvEnvRegulation.ApplyUpdate(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInvEnvRegulation.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button );
end;    }

procedure TFrmInvEnvRegulation.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
