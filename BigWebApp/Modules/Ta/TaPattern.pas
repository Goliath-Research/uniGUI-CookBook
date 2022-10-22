unit TaPattern;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  ExtCtrls,
  DB,
  Wwdatsrc,
  Menus,
  DBCtrls,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmTaPattern = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Src: TDataSource;
    Qry: TFDQuery;
    grid: TIQUniGridControl;
    QryID: TBCDField;
    QryTA_SHIFT_ID: TBCDField;
    QryDESCRIP: TStringField;
    QrySEQ: TBCDField;
    QryS_DAY: TStringField;
    QryS_TIME: TStringField;
    QryEND_DAY: TStringField;
    QryE_TIME: TStringField;
    QryPROD_DAY_GROUP: TBCDField;
    UpdateSQL1: TFDUpdateSQL;
    IQAbout1: TIQWebAbout;
    procedure QryBeforeInsert(DataSet: TDataSet);
    procedure QryBeforeDelete(DataSet: TDataSet);
    procedure QryAfterPost(DataSet: TDataSet);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetTA_Shift_Id(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property TA_Shift_Id : Real write SetTA_Shift_Id;
  end;

  procedure DoTaPattern(A_TA_Shift_Id:Real);

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  ta_rscstr;

{$R *.dfm}

procedure DoTaPattern(A_TA_Shift_Id:Real);
var
  LFrmTaPattern : TFrmTaPattern;
begin
  LFrmTaPattern :=  TFrmTaPattern.Create(UniGUIApplication.UniApplication);
  LFrmTaPattern.TA_Shift_Id := A_TA_Shift_Id;
  LFrmTaPattern.Show;
end;

procedure TFrmTaPattern.QryBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrmTaPattern.SetTA_Shift_Id(const Value: Real);
begin
  Caption := Format(ta_rscstr.cTXT0000127,
   [SelectValueFmtAsString('select descrip from ta_shift where id = %f',
    [Value])]);
  Qry.Close;
  Qry.ParamByName('AID').Value := Value;
  Qry.Open;
end;

procedure TFrmTaPattern.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, grid]);
end;

procedure TFrmTaPattern.QryBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrmTaPattern.QryAfterPost(DataSet: TDataSet);
begin
  try
    Qry.ApplyUpdates;
  except on E:Exception do
    begin
      Application.ShowException(E);
      Qry.Close;
      Qry.Open;
      SysUtils.ABORT;
    end;
  end;
end;

procedure TFrmTaPattern.DBNavigator1BeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryID.asFloat;
    Qry.Close;
    Qry.Open;
    Qry.Locate('ID', AId, []);
    Abort;
  end;

end;

procedure TFrmTaPattern.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, grid]);
end;

procedure TFrmTaPattern.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTaPattern.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

end.
