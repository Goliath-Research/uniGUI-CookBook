unit PeriodVal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
{ TODO -oGPatil -cWebconvert : Dependency
  IQMS.Common.UserMessages, }
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
  uniDBNavigator,
  uniMainMenu, vcl.wwdbgrid, IQUniGrid, uniGUIFrame;

type
  TFrmPeriodVal = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    IQAbout1: TIQWebAbout;
    IQSearchHdr: TIQUniGridControl;
    IQSearchDtl: TIQUniGridControl;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    SrcHdr: TDataSource;
    QryHdr: TFDQuery;
    SrcDtl: TDataSource;
    QryDtl: TFDQuery;
    QryHdrID: TBCDField;
    QryHdrDATE_CREATED: TDateTimeField;
    QryHdrTIMESTAMP: TDateTimeField;
    QryHdrUSERID: TStringField;
    QryHdrGLPERIOD_ID: TBCDField;
    QryHdrPERIOD_START_DATE: TDateTimeField;
    QryHdrPERIOD_END_DATE: TDateTimeField;
    QryHdrCOMMENT1: TStringField;
    QryDtlID: TBCDField;
    QryDtlARINVT_PERIOD_VAL_ID: TBCDField;
    QryDtlARINVT_ID: TBCDField;
    QryDtlCLASS: TStringField;
    QryDtlITEMNO: TStringField;
    QryDtlREV: TStringField;
    QryDtlDESCRIP: TStringField;
    QryDtlDESCRIP2: TStringField;
    QryDtlSTD_COST: TFMTBCDField;
    QryDtlONHAND: TBCDField;
    QryDtlNON_CONFORM_TOTAL: TBCDField;
    UpdateSQL1: TFDUpdateSQL;
    wwDBPeriod: TUniEdit;
    wwDBComment: TUniEdit;
    PopupMenu1: TUniPopupMenu;
    ClearPeriod1: TUniMenuItem;
    wwMemoDialog1: TwwMemoDialog;
    Contents1: TUniMenuItem;
    Panel5: TUniPanel;
    Splitter2: TUniSplitter;
    Panel6: TUniPanel;
    IQSearch1: TIQUniGridControl;
    SrcFgMulti: TDataSource;
    QryFgMulti: TFDQuery;
    QryFgMultiID: TBCDField;
    QryFgMultiARINVT_PERIOD_VAL_DTL_ID: TBCDField;
    QryFgMultiLOC_ID: TBCDField;
    QryFgMultiLOC_DESC: TStringField;
    QryFgMultiONHAND: TBCDField;
    QryFgMultiNON_CONFORM_DESCRIP: TStringField;
    QryFgMultiACT_COST: TFMTBCDField;
    QryFgMultiDIVISION_ID: TBCDField;
    QryFgMultiDIVISION_NAME: TStringField;
    QryFgMultiLOTNO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QryDtlBeforeInsert(DataSet: TDataSet);
    procedure QryHdrBeforePost(DataSet: TDataSet);
    procedure QryHdrNewRecord(DataSet: TDataSet);
    procedure QryHdrAfterPost(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure NavHdrBeforeAction(Sender: TObject; Button: TNavigateBtn);  }
    procedure wwDBPeriodCustomDlg(Sender: TObject);
    procedure ClearPeriod1Click(Sender: TObject);
    procedure wwDBCommentCustomDlg(Sender: TObject);
    procedure QryHdrAfterDelete(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure IQNotify( var Msg: TMessage );{ message iq_Notify;}
    procedure EditItemInfo( AField: TField );
  public
    { Public declarations }
  end;

procedure DoInvPeriodVal;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Period,
  IQMS.Common.HelpHook,
  inv_rscstr,
  IQMS.Common.EditMemoStr;
{$R *.dfm}

procedure DoInvPeriodVal;
var
  LFrmPeriodVal : TFrmPeriodVal;
begin
  LFrmPeriodVal := TFrmPeriodVal.Create(UniGUIApplication.UniApplication);
  LFrmPeriodVal.Show;
end;

procedure TFrmPeriodVal.IQNotify( var Msg: TMessage );
begin
  IQSearchHdr.DBGrid.SetFocus;
  keybd_event(VK_DOWN, 0, 0, 0);
end;


procedure TFrmPeriodVal.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Panel1, Panel5]);
end;

procedure TFrmPeriodVal.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmPeriodVal.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPeriodVal.QryDtlBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrmPeriodVal.QryHdrBeforePost(DataSet: TDataSet);
begin
  if QryHdrID.asFloat = 0 then
    QryHdrID.asFloat := GetNextID('arinvt_period_val');
end;

procedure TFrmPeriodVal.QryHdrNewRecord(DataSet: TDataSet);
begin
  QryHdrDATE_CREATED.ReadOnly := False;
  QryHdrUSERID.ReadOnly := False;
  QryHdrDATE_CREATED.AsDateTime := SelectValueAsFloat('select sysdate from dual');
  QryHdrTIMESTAMP.asDateTime := QryHdrDATE_CREATED.AsDateTime;
  QryHdrUSERID.asString := SelectValueAsString('select misc.getusername from dual');
  QryHdrDATE_CREATED.ReadOnly := True;
  QryHdrUSERID.ReadOnly := True;
end;

procedure TFrmPeriodVal.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, Panel1, Panel5]);
  IQSetTablesActive( TRUE, self );
  wwDBPeriod.Parent := IQSearchHdr.DBGrid;
{ TODO -oGPatil -cWebconvert : TuniControls cannot accept child controls
  wwDBPeriod.Visible := false;
  wwDBComment.Parent := IQSearchHdr.DBGrid;
  wwDBComment.Visible := false;
  QryHdr.Last;
  Application.ProcessMessages;  }
{ TODO -oGPatil -cWebconvert : Dependency
  PostMessage( Handle, iq_Notify, 0, 0);    {IQMS.Common.UserMessages.pas}
end;

procedure TFrmPeriodVal.QryHdrAfterPost(DataSet: TDataSet);
begin
{
  try
    QryHdr.DataBase.ApplyUpdates( [ QryHdr ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryHdr.Close;
      QryHdr.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
  if SelectValueFmtAsFloat('select count(id) from Arinvt_period_val_dtl where Arinvt_period_val_id = %f', [QryHdrID.asFloat]) = 0 then
  begin
    ExecuteCommandFmt('insert into Arinvt_period_val_dtl (Arinvt_period_val_id, ' +
              ' arinvt_id,           ' +
              ' class,               ' +
              ' itemno,              ' +
              ' rev,                 ' +
              ' descrip,             ' +
              ' descrip2,            ' +
              ' std_cost,            ' +
              ' onhand,              ' +
              ' non_conform_total)   ' +
              ' select %f, id,       ' +
                    ' class,               ' +
                    ' itemno,              ' +
                    ' rev,                 ' +
                    ' descrip,             ' +
                    ' descrip2,            ' +
                    ' std_cost,            ' +
                    ' onhand,              ' +
                    ' non_conform_total    ' +
              ' from arinvt ' +
              ' where misc.eplant_filter(eplant_id) = 1', [QryHdrID.asFloat]);

    ExecuteCommandFmt('begin inv_misc.PopulateARINVT_PERIOD_FGMULTI(%f); end;', [QryHdrID.asFloat]);
    QryDtl.Close;
    QryDtl.Open;
    QryFgMulti.Close;
    QryFgMulti.Open;
  end;
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmPeriodVal.NavHdrBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryHdrID.asFloat;
    QryHdr.Close;
    QryHdr.Open;
    QryHdr.Locate('ID', AId, []);
    System.SysUtils.ABORT;
  end;
end;    }

procedure TFrmPeriodVal.wwDBPeriodCustomDlg(Sender: TObject);
var
  AId:Real;
begin
  AId := DoFindPeriod;
  if AId <> 0 then
  begin
    if not (QryHdr.State in [dsEdit, dsInsert]) then QryHdr.Edit;
    QryHdrPERIOD_START_DATE.asDateTime := SelectValueFmtAsFloat('select start_date from glperiods where id = %f', [AId]);
    QryHdrPERIOD_END_DATE.asDateTime := SelectValueFmtAsFloat('select end_date from glperiods where id = %f', [AId]);
    QryHdrGLPERIOD_ID.asFloat := AId;
  end;
end;

procedure TFrmPeriodVal.ClearPeriod1Click(Sender: TObject);
begin
  if not (QryHdr.State in [dsEdit, dsInsert]) then QryHdr.Edit;
  QryHdrPERIOD_START_DATE.Clear;
  QryHdrPERIOD_END_DATE.Clear;
  QryHdrGLPERIOD_ID.Clear;
end;

procedure TFrmPeriodVal.wwDBCommentCustomDlg(Sender: TObject);
begin
  EditItemInfo( QryHdrCOMMENT1 );
//  wwMemoDialog1.Execute;
end;

procedure TFrmPeriodVal.QryHdrAfterDelete(DataSet: TDataSet);
begin
{
  try
    QryHdr.DataBase.ApplyUpdates( [ QryHdr ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryHdr.Close;
      QryHdr.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmPeriodVal.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext )
end;

procedure TFrmPeriodVal.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPeriodVal.EditItemInfo( AField: TField );
var
  S: string;
begin
  S:= AField.asString;
  if DoEditMemoStr(S, AField.Size, inv_rscstr.cTXT0000157 {'Edit Comment'}) then  {IQMS.Common.EditMemoStr.pas}
     with AField.DataSet do
     begin
       Edit;
       AField.asString:= S;
     end;
end;


end.
