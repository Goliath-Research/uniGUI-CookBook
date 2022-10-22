unit OERelAct;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  wwDialog,
  Vcl.Wwfltdlg,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmReleasesActivity = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    IQSearch1: TIQUniGridControl;
    SrcActivity: TDataSource;
    QryActivity: TFDQuery;
    QryActivityTR_VALUE_ID: TBCDField;
    QryActivityTR_BATCH_ID: TBCDField;
    QryActivityCOL_NAME: TStringField;
    QryActivityTABLE_NAME: TStringField;
    QryActivityACTION: TStringField;
    QryActivityTIME_STAMP: TDateTimeField;
    QryActivityUSER_NAME: TStringField;
    QryActivityPARENT_ID: TBCDField;
    IQAbout1: TIQWebAbout;
    wwFilterDialog1: TwwFilterDialog;
    sbtnFilter: TUniSpeedButton;
    Contents1: TUniMenuItem;
    QryActivityOLD_VALUE: TStringField;
    QryActivityNEW_VALUE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure sbtnFilterClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    FOrddetailID: Real;
    procedure SetOrddetailID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    //constructor Create(AOwner:TComponent; AOrddetailID:Real);
    procedure ResetShowReleasesActivityQuery(AOrddetailID:Real);
    property OrddetailID:Real write SetOrddetailID;
  end;

procedure DoShowReleasesActivity( AOrddetailID:Real);




implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oSanketG -cWC : Need to revisit }
  //Oe_Main,
  IQMS.Common.HelpHook;
{$R *.DFM}

procedure DoShowReleasesActivity( AOrddetailID:Real);
var
  FrmReleasesActivity: TFrmReleasesActivity;
begin
  FrmReleasesActivity := TFrmReleasesActivity.Create(UniGUIApplication.uniApplication);
  with FrmReleasesActivity do
  begin
    OrddetailID := AOrddetailID;
    Show;
  end;
end;

procedure TFrmReleasesActivity.UniFormCreate(Sender: TObject);
begin
  { TODO -oSanketG -cWC : Need to revisit , depends on oe_main}
  //TFrmMainOrder(uniAppication).FShowingReleasesActivity := self;
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmReleasesActivity.UniFormShow(Sender: TObject);
begin
  ResetShowReleasesActivityQuery(FOrddetailID);
end;

procedure TFrmReleasesActivity.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { TODO -oSanketG -cWC : Need to revisit , depends on oe_main}
  //TFrmMainOrder(Owner).FShowingReleasesActivity := nil;
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmReleasesActivity.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmReleasesActivity.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmReleasesActivity.ResetShowReleasesActivityQuery(AOrddetailID:Real);
begin
  QryActivity.Close;
  QryActivity.ParamByName('AID').asString := IntToStr(Trunc(AOrddetailID));
  QryActivity.Open;
end;


procedure TFrmReleasesActivity.sbtnFilterClick(Sender: TObject);
begin
  wwFilterDialog1.Execute;
end;

procedure TFrmReleasesActivity.SetOrddetailID(const Value: Real);
begin
  FOrddetailID := Value;
end;

procedure TFrmReleasesActivity.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmReleasesActivity.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSALES_ORDER{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
