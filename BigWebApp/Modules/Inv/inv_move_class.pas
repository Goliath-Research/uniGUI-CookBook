unit inv_move_class;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  Mask,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmInvMoveClass = class(TUniForm)
    Panel2: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    SrcMoveClass: TDataSource;
    QryMoveClass: TFDQuery;
    QryMoveClassCODE: TStringField;
    QryMoveClassDESCRIP: TStringField;
    MainMenu1: TUniMainMenu;
    IQAbout1: TIQWebAbout;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SecurityRegister1: TIQWebSecurityRegister;
    UpdateSQLMoveClass: TFDUpdateSQL;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    wwDBComboBox1: TUniDBComboBox;
    SrcParams: TDataSource;
    QryParams: TFDQuery;
    QryParamsINV_MOVE_CLASS_RANKING: TStringField;
    Contents1: TUniMenuItem;
    QryMoveClassSEQ: TBCDField;
    QryMoveClassRANK_PERCENT: TBCDField;
    QryMoveClassRANK_AMOUNT: TBCDField;
    QryMoveClassID: TBCDField;
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure QryMoveClassBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    //procedure RefreshClass(Sender: TObject; Button: TNavigateBtn);
    procedure QryMoveClassNewRecord(DataSet: TDataSet);
    procedure QryParamsUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure wwDBComboBox1Change(Sender: TObject);
    procedure sbtnRecalcRankClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure CheckPercent100;
    procedure EnsureRankingCriteriaAssigned;
    procedure ConfigureGridColumns;
    procedure Validate;
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow(AOwner: TComponent );
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  inv_rscstr,
  IQMS.Common.Controls,
  //inv_move_ranking,
  IQMS.Common.HelpHook;

class procedure TFrmInvMoveClass.DoShow;
begin
  self.Create(UniGUIApplication.UniApplication).Show;
end;


procedure TFrmInvMoveClass.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmInvMoveClass.ApplyUpdate(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmInvMoveClass.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvMoveClass.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvMoveClass.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CheckPercent100;
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmInvMoveClass.QryMoveClassBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'INV_MOVE_CLASS');
  QryMoveClassCODE.asString:= UpperCase(QryMoveClassCODE.asString);
end;

procedure TFrmInvMoveClass.QryMoveClassNewRecord(DataSet: TDataSet);
begin
  QryMoveClassSEQ.asFloat:= 1 + SelectValueAsFloat('select max(seq) from inv_move_class');
end;

procedure TFrmInvMoveClass.QryParamsUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  ExecuteCommandFmt('update params set inv_move_class_ranking = ''%s''', [ ASender.FieldByName('inv_move_class_ranking').asString]);
  AAction := eaApplied;
end;

{ TODO -ohphadke : Refactor
procedure TFrmInvMoveClass.RefreshClass(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;   }

procedure TFrmInvMoveClass.sbtnRecalcRankClick(Sender: TObject);
begin
  Validate;
  //TFrmInvMovementRanking.DoShow( self );  // inv_move_ranking.pas
end;

procedure TFrmInvMoveClass.UniFormCreate(Sender: TObject);
begin
  EnsureRankingCriteriaAssigned;
  inherited;
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  IQSetTablesActive(TRUE, self);
  ConfigureGridColumns;
end;

procedure TFrmInvMoveClass.wwDBComboBox1Change(Sender: TObject);
begin
  //QryParams.CheckBrowseMode;
  ConfigureGridColumns;
end;

procedure TFrmInvMoveClass.CheckPercent100;
begin
  if SelectValueAsFloat('select count(*) from inv_move_class') = 0 then
     EXIT;

  Validate;
end;

procedure TFrmInvMoveClass.Validate;
var
  AValid : Boolean;
  AErrMsg: string;
begin
  if QryParamsINV_MOVE_CLASS_RANKING.asString  = 'P' then
     begin
        AValid := (SelectValueAsFloat('select sum(rank_percent) from inv_move_class') = 100)
                  and
                  (SelectValueAsFloat('select 1 from inv_move_class where NVL(rank_percent,0) <= 0') = 0);
        AErrMsg:= inv_rscstr.cTXT0000175 {'Every Transaction Rank % must be assigned and the total must equal 100.'}
     end
  else
     begin
        AValid := SelectValueAsFloat('select 1 from inv_move_class where NVL(rank_amount,0) <= 0') = 0;
        AErrMsg:= inv_rscstr.cTXT0000176; {'Every Defined Amount must be assigned'}
     end;

  if not AValid then
     raise Exception.Create( AErrMsg );
end;


procedure TFrmInvMoveClass.EnsureRankingCriteriaAssigned;
begin
  if SelectValueAsString('select inv_move_class_ranking from params') = '' then
     ExecuteCommand('update params set inv_move_class_ranking = ''P'' ');
end;

procedure TFrmInvMoveClass.ConfigureGridColumns;
begin
  if QryParamsINV_MOVE_CLASS_RANKING.asString  = 'A' then
     begin
       //IQMS.Common.Controls.EnsureWWColumnExists ( wwDBGrid1, 'RANK_AMOUNT', 'Defined Amount', 18 );
       //IQMS.Common.Controls.EnsureWWColumnRemoved( wwDBGrid1, 'RANK_PERCENT' );
     end
  else
     begin
       //IQMS.Common.Controls.EnsureWWColumnExists ( wwDBGrid1, 'RANK_PERCENT', 'Transaction Rank %', 18 );
       //IQMS.Common.Controls.EnsureWWColumnRemoved( wwDBGrid1, 'RANK_AMOUNT' );
     end
end;


procedure TFrmInvMoveClass.Contents1Click(Sender: TObject);
begin
 IQHelp.HelpContext( HelpContext );
end;

end.
