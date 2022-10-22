unit po_type;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  Data.DB,
  Vcl.DBCtrls, //TNavigateBtn
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmPO_Type = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    SR: TIQWebSecurityRegister;
    wwDBGrid1: TIQUniGridControl;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    Query1ID: TBCDField;
    Query1NAME: TStringField;
    Query1DESCRIP: TStringField;
    Query1CLOSEPOWITHIN: TBCDField;
    Contents1: TUniMenuItem;
    N1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Query1NewRecord(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

class procedure TFrmPO_Type.DoShow;
var
  frm: TFrmPO_Type;
begin
  frm := TFrmPO_Type.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmPO_Type.FormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmPO_Type.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [ self, wwDBGrid1 ]);
end;

procedure TFrmPO_Type.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmGEN, iqhtmGEN); // IQMS.Common.HelpHook.pas
end;

procedure TFrmPO_Type.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGrid1 ]);
end;

procedure TFrmPO_Type.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPO_Type.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmPO_Type.Query1NewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID').asFloat:= GetNextID('po_type');
end;

procedure TFrmPO_Type.SRAfterApply(Sender: TObject);
begin
//  IQMS.Common.Controls.AutoSizeNavBar(NavMain);
end;

procedure TFrmPO_Type.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmPO_Type.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;

procedure TFrmPO_Type.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(HelpContext);
end;

end.
