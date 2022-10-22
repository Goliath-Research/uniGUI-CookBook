unit inv_user_team;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
  Data.DB,
//  Vcl.Wwdatsrc,
//  Mask,
  IQMS.WebVcl.Hpick,
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
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmInvUserTeam = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    IQSearch1: TIQUniGridControl;
    wwDBGridZone: TIQUniGridControl;
    SrcUsers: TDataSource;
    QryUsers: TFDQuery;
    QryUsersUSER_NAME: TStringField;
    QryUsersEPLANT_NAME: TStringField;
    QryUsersCODE: TStringField;
    QryUsersDESCRIP: TStringField;
    QryUsersTYPE: TStringField;
    wwDBComboDlgTeamCode: TUniEdit;
    SrcTeamZone: TDataSource;
    QryTeamZone: TFDQuery;
    QryTeamZoneZONE_CODE: TStringField;
    QryTeamZoneZONE_DESCRIP: TStringField;
    PkRFTeam: TIQWebHPick;
    PkRFTeamID: TFloatField;
    PkRFTeamCODE: TStringField;
    PkRFTeamDESCRIP: TStringField;
    PkRFTeamTYPE: TStringField;
    PkRFTeamEPLANT_NAME: TStringField;
    PkRFTeamDIVISION_NAME: TStringField;
    QryUsersDIVISION_NAME: TStringField;
    QryUsersRF_TEAM_ID: TBCDField;
    QryUsersEPLANT_ID: TBCDField;
    QryTeamZoneID: TBCDField;
    QryTeamZoneRF_TEAM_ID: TBCDField;
    QryTeamZoneINV_ZONE_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure wwDBComboDlgTeamCodeCustomDlg(Sender: TObject);
    procedure PkRFTeamBeforeOpen(DataSet: TDataSet);
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
  IQMS.Common.Numbers;

{ TFrmInvUserTeam }

procedure TFrmInvUserTeam.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;


procedure TFrmInvUserTeam.UniFormCreate(Sender: TObject);
begin
    { TODO -oLema : Find workaround for wwDBgrid.ControlType }
//  IQSearch1.wwDBgrid.ControlType.Clear;
//  IQSearch1.wwDBgrid.ControlType.Text:= 'CODE;CustomEdit;wwDBComboDlgTeamCode;F';

  IQRegFormRead( self, [self]);
  IQSetTablesActive(true, self );
end;


class procedure TFrmInvUserTeam.DoShow;
var
  frm: TFrmInvUserTeam;
begin
  frm := TFrmInvUserTeam.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmInvUserTeam.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvUserTeam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmInvUserTeam.PkRFTeamBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'eplant_id', QryUsersEPLANT_ID.asFloat);
//  TFDQuery(DataSet).ParamByName('eplant_id').Value := QryUsersEPLANT_ID.asFloat;
end;


procedure TFrmInvUserTeam.wwDBComboDlgTeamCodeCustomDlg(Sender: TObject);
begin
  with PkRFTeam do
    if Execute then
    begin
      ExecuteCommandFmt('update s_user_general set rf_team_id = %f where user_name = ''%s''', [ DtoF(GetValue('id')), QryUsersUSER_NAME.asString ]);
      RefreshDataSetByID( QryUsers, 'user_name' );
    end;
end;

end.
