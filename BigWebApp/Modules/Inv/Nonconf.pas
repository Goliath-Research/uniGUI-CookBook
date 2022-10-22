unit NonConf;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Search,
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
  System.Classes,
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
  TNonConformTable = class(TUniForm)
    DataSource1: TDataSource;
    SR: TIQWebSecurityRegister;
    Panel1: TUniPanel;
    IQSearch1: TIQUniGridControl;
    Query1: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    Query1CODE: TStringField;
    Query1DESCRIP: TStringField;
    Query1PK_HIDE: TStringField;
    Query1ID: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure Query1BeforePost(DataSet: TDataSet);
    //procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
  private
    { private declarations }
  protected
    procedure RefreshDataSet; virtual;
  public
    { public declarations }
  end;

procedure DoNonConformCodes;


implementation

{$R *.DFM}

uses
  //InvtShel,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
  { TODO -ohphadke : Dependency }
  //IQSecIns;

procedure DoNonConformCodes;
begin
  with TNonConformTable.Create(UniGuiApplication.UniApplication) do
  begin
    ShowModal;
  end;
end;

procedure TNonConformTable.FormCreate(Sender: TObject);
var
  AField: TField;
begin

  IQSetTablesActive( TRUE, self );

//  AField:= DataSource1.DataSet.FindField('ID');
//  if Assigned(AField) then
//     AField.Required:= FALSE;

  //CenterForm(Self); // IQMS.Common.Controls.pas
  IQRegFormRead(Self, [Self]);
end;

procedure TNonConformTable.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
  try
    if (Query1.State in [dsEdit, dsInsert]) then
      Query1.Post;
    RefreshDataSet;
  finally
    Action:= caFree;
  end;
end;

procedure TNonConformTable.RefreshDataSet;
begin
//  if Owner is TInvt_Shell then
//     TInvt_Shell(Owner).DM.TblNon_Conform.Refresh;
end;

procedure TNonConformTable.FormShow(Sender: TObject);
begin
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TNonConformTable.Query1BeforePost(DataSet: TDataSet);
begin
  if Query1ID.asFloat = 0 then
    Query1ID.asFloat := GetNextID('NON_CONFORM');
end;

procedure TNonConformTable.Table1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

//procedure TNonConformTable.DBNavigatorClick(Sender: TObject;
//  Button: TNavigateBtn);
//begin
//  IQSearch1.wwDBGrid.SetFocus;
//end;

procedure TNonConformTable.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
//  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
