unit DownTime;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  Grids,
  ExtCtrls,
  DBCtrls,
  DBGrids,
  DB,
  Wwdatsrc,
  Wwdbigrd,
  Wwdbgrid,
  IQMS.WebVcl.Hpick,
  Mask,
  wwdbedit,
  Wwdotdot,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator, uniDateTimePicker, uniDBDateTimePicker, IQUniGrid, uniGUIFrame;

type
  TFrmDown = class(TUniForm)
    SrcILLM_DRT: TDataSource;
    Query1: TFDQuery;
    Query1DOWN_CODE: TStringField;
    Query1DOWN_DESCRIP: TStringField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Button1: TUniButton;
    Grid: TIQUniGridControl;
    QryILLM_DRT: TFDQuery;
    QryILLM_DRTID: TBCDField;
    QryILLM_DRTHIST_ILLUM_RT_ID: TBCDField;
    QryILLM_DRTPROD_DATE: TDateTimeField;
    QryILLM_DRTSHIFT: TBCDField;
    QryILLM_DRTDWN_ST_TIME: TDateTimeField;
    QryILLM_DRTDWN_END_TIME: TDateTimeField;
    QryILLM_DRTDWN_MEMO: TStringField;
    QryILLM_DRTDOWN_CODE: TStringField;
    QryILLM_DRTTOTAL_DT: TBCDField;
    QryILLM_DRTDescrip: TStringField;
    dbStart: TUniDBDateTimePicker;
    UpdateSQL1: TFDUpdateSQL;
    Query1EPLANT_ID: TBCDField;
    QryILLM_DRTDAYPROD_ID: TBCDField;
    Bevel1: TUniPanel;
    PkDownCode: TIQWebHPick;
    PkDownCodeDOWN_CODE: TStringField;
    PkDownCodeDOWN_DESCRIP: TStringField;
    PkDownCodeEPLANT_ID: TBCDField;
    wwDBComboDlgReason: TUniEdit;
    wwDBComboDlgMemo: TUniEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QryILLM_DRTAfterPost(DataSet: TDataSet);
    procedure QryILLM_DRTNewRecord(DataSet: TDataSet);
    procedure QryILLM_DRTBeforePost(DataSet: TDataSet);
    procedure QryILLM_DRTBeforeClose(DataSet: TDataSet);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure QryILLM_DRTAfterOpen(DataSet: TDataSet);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure QryILLM_DRTUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure wwDBComboDlgReasonCustomDlg(Sender: TObject);
    procedure wwDBComboDlgMemoCustomDlg(Sender: TObject);
    procedure wwDBComboDlgMemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryILLM_DRTCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FID:Real;   {hist_illum_rt_id}
    FProd_Date:TDateTime;
    FShift:Integer;
    FSource:TDataSource;
    FDayprod_ID: Real;
  public
    { Public declarations }
    property ID:Real read FID write FID;
    property Prod_Date:TDateTime read FProd_Date write FProd_Date;
    property Shift:Integer read FShift write FShift;
    property Source:TDataSource read FSource write FSource;
  end;

procedure DoEditRTDownTime( _DayProd_ID, _Hist_Illum_RT_ID: Real; _Prod_Date:TDateTime; _Shift:Integer; ASource:TDataSource );

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  prod_rscstr,
  IQMS.Common.EditMemoStr,
  IQMS.Common.Controls;

//procedure DoEditRTDownTime( ID:Real; Prod_Date:TDateTime; Shift:Integer );
procedure DoEditRTDownTime( _DayProd_ID, _Hist_Illum_RT_ID: Real; _Prod_Date:TDateTime; _Shift:Integer; ASource:TDataSource );
begin
//  with TFrmDown.Create( Application, ID, Prod_Date, Shift ) do
  with TFrmDown.Create( uniGUIApplication.UniApplication ) do
  begin
    ID         := _Hist_Illum_RT_ID;
    Prod_Date  := Trunc(_Prod_Date);
    Shift      := _Shift;
    Source     := ASource;
    FDayprod_ID:= _DayProd_ID;
    ShowModal;
  end;
end;

procedure TFrmDown.FormCreate(Sender: TObject);
begin
  { if (ID > 0) and (Prod_Date > 0) and (Shift > 0) then}
  { begin }
//    IQSetTablesActive( TRUE, self );
//    TblILLM_DRT.SetRange( [ID, Prod_Date, Shift], [ID, Prod_Date, Shift] );
    IQRegFormRead( self, [ self ]);
    IQSetTablesActive( False, self );
    QryILLM_DRT.DataSource := Source;
    IQSetTablesActive( True, self );
  { end; }
end;

procedure TFrmDown.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid]);
  //QryILLM_DRT.Close;
end;

procedure TFrmDown.AssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmDown.FormActivate(Sender: TObject);
begin
     IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmPROD_REP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmDown.QryILLM_DRTAfterPost(DataSet: TDataSet);
var
  AId:Real;
begin
  try
    QryILLM_DRT.ApplyUpdates;
    aId := QryILLM_DRTID.asFloat;
    Reopen(QryILLM_DRT);
    QryILLM_DRT.Locate('ID', AID, []);
  except on E:Exception do
    begin
      Application.ShowException(E);
      Reopen( QryILLM_DRT );
      SysUtils.ABORT;
    end;
  end;
end;

procedure TFrmDown.QryILLM_DRTNewRecord(DataSet: TDataSet);
begin
  QryILLM_DRTHIST_ILLUM_RT_ID.asFloat := ID;
  QryILLM_DRTPROD_DATE.asDateTime     := Prod_Date;
  QryILLM_DRTSHIFT.asInteger          := Shift;
  QryILLM_DRTDwn_St_Time.asDateTime   := Prod_Date;
  QryILLM_DRTDwn_End_Time.asDateTime  := Prod_Date;
  QryILLM_DRTDAYPROD_ID.asFloat       := FDayprod_ID;
end;

procedure TFrmDown.QryILLM_DRTBeforePost(DataSet: TDataSet);
begin
  if ((QryILLM_DRTDwn_St_Time.asDateTime <> 0) and (QryILLM_DRTDwn_End_Time.asDateTime = 0) or
      (QryILLM_DRTDwn_St_Time.asDateTime = 0) and (QryILLM_DRTDwn_End_Time.asDateTime <> 0)) then
    raise exception.create(prod_rscstr.cTXT0000018 {'Please enter both a Start Date and an End Dates.'});

  if QryILLM_DRTID.asFloat = 0 then
    QryILLM_DRTID.asFloat := GetNextID('ILLM_DRT');
end;

procedure TFrmDown.QryILLM_DRTCalcFields(DataSet: TDataSet);
begin
  if QryILLM_DRTDOWN_CODE.asString <> '' then
    QryILLM_DRTDescrip.asString:=
      SelectValueFmtAsString(
        'select c.down_descrip from DOWN_CODE c where c.down_code = ''%s'' ',
        [QryILLM_DRTDOWN_CODE.asString]);
end;

procedure TFrmDown.QryILLM_DRTBeforeClose(DataSet: TDataSet);
begin
  IQRegFormWrite( self, [ Grid ]);
  with QryILLM_DRT do
  if (State in [dsInsert, dsEdit]) and IQWarningYN(prod_rscstr.cTXT0000019 {'Save Down Time changes?'}) then
    Post;
end;

procedure TFrmDown.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    Reopen(QryILLM_DRT);
    Abort;
  end;
end;

procedure TFrmDown.QryILLM_DRTAfterOpen(DataSet: TDataSet);
begin
  IQRegFormRead( self, [ Grid ]);
end;

procedure TFrmDown.Query1BeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet, TRUE );
end;

procedure TFrmDown.QryILLM_DRTUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
//  IQApplyCachedUpdate( UpdateSQL1, UpdateKind ); {pas}
  UpdateSQL1.Apply(ARequest, AAction, AOptions);
  AAction := eaApplied;
end;

procedure TFrmDown.wwDBComboDlgMemoCustomDlg(Sender: TObject);
var
  S: string;
begin
  S:= QryILLM_DRTDWN_MEMO.asString;
  if DoEditMemoStr( S, 2000, 'Comments' ) then    {IQMS.Common.EditMemoStr.pas}
  begin
    QryILLM_DRT.Edit;
    QryILLM_DRTDWN_MEMO.asString:= S;
  end;
end;

procedure TFrmDown.wwDBComboDlgMemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IQMS.Common.Controls.CheckClearWWDBComboDlg( Sender, Key, QryILLM_DRTDWN_MEMO);
end;

procedure TFrmDown.wwDBComboDlgReasonCustomDlg(Sender: TObject);
begin
  with PkDownCode do
    if Execute then
    begin
      QryILLM_DRT.Edit;
      QryILLM_DRTDOWN_CODE.asString:= GetValue('DOWN_CODE')
    end
end;

end.
