unit InvMspcs;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Vcl.Menus,
  Data.DB,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu;

type
  TFrmMasterSpecs = class(TUniForm)
    Panel1: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Nav: TUniDBNavigator;
    Grid: TUniDBGrid;
    SrcMS: TDataSource;
    TblMS: TFDTable;
    TblMSID: TBCDField;
    TblMSCODE: TStringField;
    TblMSDESCRIP: TStringField;
    TblMSREV: TStringField;
    IQAbout1: TIQWebAbout;
    Contents1: TUniMenuItem;
    Bevel1: TUniPanel;
    sbnSearch: TUniSpeedButton;
    PkMasterSpec: TIQWebHPick;
    PkMasterSpecID: TBCDField;
    PkMasterSpecCODE: TStringField;
    PkMasterSpecDESCRIP: TStringField;
    PkMasterSpecREV: TStringField;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblMSBeforePost(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoMasterSpecs;

implementation
{$R *.DFM}
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.HelpHook;
{ TODO -oGPatil -cWebConvert : Dependency on files
  IQSecIns;   }

procedure DoMasterSpecs;
var
  LFrmMasterSpecs : TFrmMasterSpecs;
begin
  LFrmMasterSpecs := TFrmMasterSpecs.Create(UniGUIApplication.UniApplication);
  LFrmMasterSpecs.ShowModal;
end;

procedure TFrmMasterSpecs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid]);
end;

procedure TFrmMasterSpecs.TblMSBeforePost(DataSet: TDataSet);
begin
  TblMSCODE.asString:= UpperCase(TblMSCODE.asString);
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmMasterSpecs.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [self, Grid]);
end;

procedure TFrmMasterSpecs.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMasterSpecs.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmMasterSpecs.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1097770 );
end;

procedure TFrmMasterSpecs.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
//  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmMasterSpecs.sbnSearchClick(Sender: TObject);
begin
  with PkMasterSpec do
    if Execute then
       TblMS.Locate('ID', GetValue('ID'), [])
end;

procedure TFrmMasterSpecs.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on files
  EnsureSecurityInspectorOnTopOf( self ); }
end;



end.
