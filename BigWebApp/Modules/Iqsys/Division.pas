unit Division;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBCtrls, //TNavigateBtn
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.Search,
//  Mask,
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
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmDivision = class(TUniForm)
    Panel1: TUniPanel;
    wwDataSource1: TDataSource;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Contents1: TUniMenuItem;
    Bevel1: TUniPanel;
    QryDivision: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryDivisionID: TBCDField;
    QryDivisionNAME: TStringField;
    QryDivisionDESCRIP: TStringField;
    QryDivisionEPLANT_ID: TBCDField;
    QryDivisionGL_PLUG_VALUE: TStringField;
    QryDivisionOVERRIDE_SIC: TStringField;
    IQSearch1: TIQUniGridControl;
    wwDBComboDlgEPlant: TUniEdit;
    QryDivisionEPLANT_NAME: TStringField;
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QryDivisionBeforePost(DataSet: TDataSet);
    procedure wwDBComboDlgEPlantCustomDlg(Sender: TObject);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoDivisions;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook,
  IQMS.COmmon.SetPlant;

procedure DoDivisions;
var
  frm: TFrmDivision;
begin
  frm := TFrmDivision.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TFrmDivision.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmDivision.QryDivisionBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'DIVISION');
end;

procedure TFrmDivision.wwDBComboDlgEPlantCustomDlg(Sender: TObject);
begin

{ TODO -oLema : Incompatible parameters in function DoChangePlantIDEx }
(*
  if DoChangePlantIDEx( self, QryDivision ) then  {IQMS.COmmon.SetPlant.pas}
  begin
     QryDivision.Edit;
     // note this is not a real physical field
     QryDivisionEPLANT_NAME.asString:= SelectValueByID('name', 'eplant', QryDivisionEPLANT_ID.asFloat)
  end;
*)

end;

procedure TFrmDivision.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
//  Action:= caFree;
end;

procedure TFrmDivision.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable( DataSet );
  RefreshDataSetByID( DataSet );
end;

procedure TFrmDivision.AssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
end;

procedure TFrmDivision.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDivision.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmDivision.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button );
end;

procedure TFrmDivision.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1097686 );
end;

procedure TFrmDivision.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
