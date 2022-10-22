unit wave_match;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBCtrls, // TNavigateBtn
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmWaveMatch = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    wwDBGrid2: TIQUniGridControl;
    Panel13: TUniPanel;
    Panel5: TUniPanel;
    SrcWaveMatch: TDataSource;
    SrcWaveMatchDtl: TDataSource;
    QryWaveMatch: TFDQuery;
    QryWaveMatchDtl: TFDQuery;
    QryWaveMatchID: TBCDField;
    QryWaveMatchSEQ: TBCDField;
    QryWaveMatchDESCRIP: TStringField;
    QryWaveMatchDtlID: TBCDField;
    QryWaveMatchDtlWAVE_MATCH_ID: TBCDField;
    QryWaveMatchDtlCRITERIA: TStringField;
    UpdateSQLMatch: TFDUpdateSQL;
    UpdateSQLDetail: TFDUpdateSQL;
    wwDBComboBoxCriteriaName: TUniDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryWaveMatchBeforePost(DataSet: TDataSet);
    procedure QryWaveMatchDtlBeforePost(DataSet: TDataSet);
    procedure QryWaveMatchNewRecord(DataSet: TDataSet);
    procedure QryWaveMatchDtlNewRecord(DataSet: TDataSet);
    procedure PostParentBeforeEdit(DataSet: TDataSet);
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
  IQMS.Common.RegFrm;

{ TFrmWaveMatch }
class procedure TFrmWaveMatch.DoShow;
var
  frm: TFrmWaveMatch;
begin
  frm := TFrmWaveMatch.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmWaveMatch.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmWaveMatch.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;

procedure TFrmWaveMatch.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [self, wwDBGrid1, wwDBGrid2, Panel1]);
end;

procedure TFrmWaveMatch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, wwDBGrid1, wwDBGrid2, Panel1]);
  Action := caFree;
end;

procedure TFrmWaveMatch.PostParentBeforeEdit(DataSet: TDataSet);
begin
  QryWaveMatch.CheckBrowseMode;
  if QryWaveMatchID.asFloat = 0 then
    ABORT;
end;

procedure TFrmWaveMatch.QryWaveMatchBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'wave_match');
end;

procedure TFrmWaveMatch.QryWaveMatchDtlBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'wave_match_dtl');
end;

procedure TFrmWaveMatch.QryWaveMatchDtlNewRecord(DataSet: TDataSet);
begin
  QryWaveMatchDtlWAVE_MATCH_ID.asFloat := QryWaveMatchID.asFloat;
end;

procedure TFrmWaveMatch.QryWaveMatchNewRecord(DataSet: TDataSet);
begin
  QryWaveMatchSEQ.asFloat := 1 + SelectValueAsFloat('select max(seq) from wave_match');
end;


end.
