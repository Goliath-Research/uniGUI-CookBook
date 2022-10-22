unit Emp_Level;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Mask,
//  Vcl.Wwdatsrc,
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
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniComboBox,
  uniDBComboBox, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmEmpLevel = class(TUniForm)
    DataSource1: TDataSource;
    TblEmp_Level: TFDTable;
    Panel1: TUniPanel;
    TblEmp_LevelID: TBCDField;
    TblEmp_LevelCODE: TStringField;
    TblEmp_LevelDESCRIP: TStringField;
    TblEmp_LevelLABOR_RATE: TFMTBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    TblEmp_LevelTYPE: TStringField;
    TblEmp_LevelELEMENTS_ID: TBCDField;
    wwDBGrid1: TIQUniGridControl;
    wwDBComboBoxType: TUniDBComboBox;
    TblEmp_LevelElem_Descrip: TStringField;
    QryElements: TFDQuery;
    wwDBLookupComboCostElement: TUniDBLookupComboBox;
    QryElementsID: TBCDField;
    QryElementsELEM_DESCRIP: TStringField;
    Contents1: TUniMenuItem;
    TblEmp_LevelQUOTE_RATE: TFMTBCDField;
    TblEmp_LevelEXCLUDE_FROM_RT_LABOR: TStringField;
    TblEmp_LevelFUTURE_LABOR_RATE: TFMTBCDField;
    TblEmp_LevelBUDGET_LABOR_RATE: TFMTBCDField;
    TblEmp_LevelFORECAST_LABOR_RATE: TFMTBCDField;
    ds_Elements: TDataSource;
    procedure TblEmp_LevelBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

class procedure TFrmEmpLevel.DoShow;
var
  frm: TFrmEmpLevel;
begin
  frm := TFrmEmpLevel.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmEmpLevel.FormCreate(Sender: TObject);
begin
  IQsetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmEmpLevel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmEmpLevel.TblEmp_LevelBeforePost(DataSet: TDataSet);
begin
  TblEmp_LevelCODE.asString:= UpperCase( TblEmp_LevelCODE.asString );
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmEmpLevel.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmEmpLevel.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEmpLevel.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmEmpLevel.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
