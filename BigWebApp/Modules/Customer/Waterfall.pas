unit Waterfall;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniMainMenu,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls;

type
  TFrmWaterfall_Setup = class(TUniForm)
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    SrcWaterfall: TDataSource;
    TblWaterfall: TFDTable;
    TblWaterfallID: TBCDField;
    TblWaterfallDESCRIP: TStringField;
    Bevel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    NavLevels: TUniDBNavigator;
    TblWaterfallLevels: TFDTable;
    FloatField1: TBCDField;
    TblWaterfallLevelsAR_DISCOUNT_WATERFALL_ID: TBCDField;
    TblWaterfallLevelsQUAN_LEVEL: TBCDField;
    TblWaterfallLevelsQUAN: TBCDField;
    SrcWaterfallLevel: TDataSource;
    DBGrid2: TUniDBGrid;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    procedure FormCreate(Sender: TObject);
    procedure TblWaterfallBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure TblWaterfallLevelsBeforePost(DataSet: TDataSet);
    procedure TblWaterfallLevelsNewRecord(DataSet: TDataSet);
    procedure Close1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoSetupWaterfalls;

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{ TODO -oGPatil -cWebConvert : Dependency of IQSecIns.pas File
  IQSecIns}


procedure DoSetupWaterfalls;
var LFrmWaterfall_Setup : TFrmWaterfall_Setup;
begin
  LFrmWaterfall_Setup := TFrmWaterfall_Setup.Create(uniGUIApplication.UniApplication);
  LFrmWaterfall_Setup.ShowModal;
end;

procedure TFrmWaterfall_Setup.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmWaterfall_Setup.TblWaterfallBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmWaterfall_Setup.TblWaterfallLevelsBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmWaterfall_Setup.TblWaterfallLevelsNewRecord(DataSet: TDataSet);
begin
  TblWaterfallLevelsQUAN_LEVEL.AsFloat :=
    SelectValueFmtAsFloat('select max(quan_level) from ar_discount_waterfall_levels where ar_discount_waterfall_id = %.0f', [TblWaterfallID.AsFloat]) + 1;
end;

procedure TFrmWaterfall_Setup.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency of IQSecIns.pas File
  EnsureSecurityInspectorOnTopOf( self );                      }
end;

procedure TFrmWaterfall_Setup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmWaterfall_Setup.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmWaterfall_Setup.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmWaterfall_Setup.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 21012 );
end;

procedure TFrmWaterfall_Setup.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmWaterfall_Setup.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
