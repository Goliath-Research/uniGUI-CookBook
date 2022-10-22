unit ref_code;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.DBCtrls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Search,
  vcl.wwdatsrc,
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
  uniGUIApplication,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniDBNavigator,
  uniMainMenu,
  IQUniGrid, uniGUIFrame;

type
  TFrmRefCodes = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Help1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    navHeader: TUniDBNavigator;
    SBSearch: TUniSpeedButton;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    navDetail: TUniDBNavigator;
    gridHeader: TUniDBGrid;
    SrcCathegory: TDataSource;
    TblCathegory: TFDTable;
    SrcRefCode2: TDataSource;
    TblRefCode: TFDTable;
    TblCathegoryID: TBCDField;
    TblCathegoryDESCRIP: TStringField;
    TblRefCodeID: TBCDField;
    TblRefCodeDESCRIP: TStringField;
    TblRefCodeREF_CODE: TStringField;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PKCathegory: TIQWebHPick;
    PKCathegoryID: TBCDField;
    PKCathegoryDESCRIP: TStringField;
    N1: TUniMenuItem;
    Search1: TUniMenuItem;
    TblRefCodeRC_CATEGORY_ID: TBCDField;
    Contents1: TUniMenuItem;
    TblCathegoryEPLANT_ID: TBCDField;
    SR: TIQWebSecurityRegister;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    QryRefCode: TFDQuery;
    SrcRefCode: TDataSource;
    IQSearch1: TIQUniGridControl;
    UpdateSQL1: TFDUpdateSQL;
    QryRefCodeID: TBCDField;
    QryRefCodeRC_CATEGORY_ID: TBCDField;
    QryRefCodeDESCRIP: TStringField;
    QryRefCodeREF_CODE: TStringField;
    QryRefCodePK_HIDE: TStringField;
    procedure TblCathegoryBeforePost(DataSet: TDataSet);
    procedure TblRefCodeBeforeEdit(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gridHeaderEditButtonClick(Sender: TObject);
    procedure TblCathegoryBeforeOpen(DataSet: TDataSet);
    procedure TblRefCodeBeforePost(DataSet: TDataSet);
    procedure QryRefCodeAfterPost(DataSet: TDataSet);
    procedure navDetailBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure QryRefCodeBeforeEdit(DataSet: TDataSet);
    procedure QryRefCodeBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoRefCode;


implementation

uses
  IQMS.Common.SetPlant,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;


{$R *.DFM}

procedure DoRefCode;
var
   FrmRefCodes : TFrmRefCodes;
begin
  FrmRefCodes := TFrmRefCodes.Create(uniGUIApplication.UniApplication);
  FrmRefCodes.ShowModal;
  //with TFrmRefCodes.create(Application) do show;
end;

{ TFrmRefCodes }

procedure TFrmRefCodes.FormCreate(Sender: TObject);
begin
  //IQMS.Common.Controls.CenterForm(Self);
  IQSetTablesActive(true, self);
//IQRegFormRead( self, [ self, gridHeader, Panel2]);
//  IQMS.Common.Controls.ResizeNavBar(navHeader);
//  IQMS.Common.Controls.ResizeNavBar(navDetail);
end;

procedure TFrmRefCodes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  IQRegFormWrite( self, [ self, gridHeader, Panel2]);
//  Action := caFree;
end;

procedure TFrmRefCodes.TblCathegoryBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
  if TblCathegoryEPLANT_ID.asFloat = 0 then
    TblCathegoryEPLANT_ID.Clear;
end;

procedure TFrmRefCodes.TblRefCodeBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmRefCodes.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRefCodes.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmRefCodes.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmRefCodes.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmRefCodes.SBSearchClick(Sender: TObject);
begin
  with PKCathegory do
    if Execute then
      TblCathegory.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmRefCodes.Contents1Click(Sender: TObject);
begin
//  Application.HelpContext(43);
  IQHelp.HelpContext( 1139860 );
end;

procedure TFrmRefCodes.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmRefCodes.gridHeaderEditButtonClick(Sender: TObject);
begin
  DoChangePlantID( TblCathegory ); {IQMS.COmmon.SetPlant.pas}
end;

procedure TFrmRefCodes.TblCathegoryBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet, True );  {pas}
end;

procedure TFrmRefCodes.TblRefCodeBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmRefCodes.QryRefCodeAfterPost(DataSet: TDataSet);
begin
{
  try
    QryRefCode.DataBase.ApplyUpdates( [ QryRefCode ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryRefCode.Close;
      QryRefCode.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmRefCodes.QryRefCodeBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmRefCodes.QryRefCodeBeforePost(DataSet: TDataSet);
begin
  if QryRefCodeID.asFloat = 0 then
    QryRefCodeID.asFloat := GetNextID('REF_CODE');
  QryRefCodeRC_CATEGORY_ID.asFloat := TblCathegoryID.asFloat;
end;

procedure TFrmRefCodes.navDetailBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  aId:Real;
begin
  if Button = nbRefresh then
  begin
    aId := QryRefCodeID.asFloat;
    QryRefCode.Close;
    QryRefCode.Open;
    QryRefCode.Locate('ID', aId, []);
    Abort;
  end;
end;



end.


