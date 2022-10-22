unit dbtdbgfm;

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
//  wwrcdpnl,
  Grids,
//  Wwdbigrd,
//  Wwdbgrid,
  DBCtrls,
  Buttons,
  ExtCtrls,
  StdCtrls,
  ComCtrls,
  DB,
  SqlExpr,
  DBClient,
  ADODB,
  IQMS.WebVcl.DBExpress,
//  Wwdatsrc,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniPageControl,
  uniMemo,
  uniPanel,
  uniDBNavigator,
  uniButton,
  uniBitBtn,
  uniSpeedButton, uniImage, IQUniGrid, uniGUIFrame;

type
  TFrmDebugFrame = class(TUniFrame)
    SrcQuery: TDataSource;
    pcMain: TUniPageControl;
    TabSQL: TUniTabSheet;
    memSQL: TUniMemo;
    Bevel1: TUniPanel;
    Panel1: TUniPanel;
    sbtnFind: TUniSpeedButton;
    sbtnToggleTableFormView: TUniSpeedButton;
    NavMain: TUniDBNavigator;
    TabData: TUniTabSheet;
    TabGrid: TUniTabSheet;
    Grid: TIQUniGridControl;
    //rvFormView: TwwRecordViewPanel;
    PnlError: TUniPanel;
    Panel11: TUniPanel;
    lblError: TUniLabel;
    PnlErrorText: TUniPanel;
    memErrorText: TUniMemo;
    TabParsedSQL: TUniTabSheet;
    memParsedSQL: TUniMemo;
    PnlErrorImg: TUniPanel;
    imgError: TUniImage;
    Panel2: TUniPanel;
    sbtnRefresh: TUniSpeedButton;
    procedure sbtnToggleTableFormViewClick(Sender: TObject);
    procedure sbtnFindClick(Sender: TObject);
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure sbtnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    FDataSet : TDataSet;
    FFindText: String;
    FShowQuerySQL: Boolean;
    procedure SetDataSet(const Value: TDataSet);
    procedure ShowError(AMsg: String);
    procedure HideError;
    procedure RefreshDataSet;
    procedure SetShowQuerySQL(const Value: Boolean);
    procedure SetControls;
    function DataSetIsQuery: Boolean;
    function DataSetHasParams: Boolean;
    function DataSetSQL: String;
  public
    { Public declarations }
    procedure CreateWnd; override;
    procedure OpenDataSet;
  published
    { Published declarations }
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property ShowQuerySQL: Boolean read FShowQuerySQL write SetShowQuerySQL default True;
  end;

implementation

{$R *.dfm}

uses
  //dbtshare,
  //iqctrl,
 // iqerrdlg,
  IQMS.Common.DataLib;
  //iqmesg,
  //iqregfrm;

{ TFrmDebugFrame }

procedure TFrmDebugFrame.CreateWnd;
begin
  inherited;
  FShowQuerySQL := True;
  pcMain.ActivePageIndex := 0;
  TabData.TabVisible := false;
end;

procedure TFrmDebugFrame.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
  SrcQuery.DataSet := FDataSet;

  SetControls;

  if TabSQL.TabVisible then
     begin
       if (FDataSet is TIQWebDbxQuery) then
          memSQL.Text := TIQWebDbxQuery(FDataSet).SQL.Text
       else if (FDataSet is TSQLQuery) then
          memSQL.Text := TSQLQuery(FDataSet).SQL.Text
       else if (FDataSet is TADOQuery) then
          memSQL.Text := TADOQuery(FDataSet).SQL.Text;
     end;

end;

procedure TFrmDebugFrame.SetControls;
begin
  TabSQL.TabVisible := FShowQuerySQL and DataSetIsQuery;
  TabParsedSQL.TabVisible := FShowQuerySQL and DataSetIsQuery and DataSetHasParams;
end;

function TFrmDebugFrame.DataSetIsQuery: Boolean;
begin
  Result := Assigned(FDataSet) and
              ((FDataSet is TIQWebDbxQuery) or
               (FDataSet is TSQLQuery) or
               (FDataSet is TADOQuery));
end;

function TFrmDebugFrame.DataSetHasParams: Boolean;
begin
  Result := Assigned(FDataSet);
  if not Result then Exit;
  if DataSet is TIQWebDbxQuery then
     Result := TIQWebDbxQuery(DataSet).ParamCount  > 0
  else if DataSet is TSQLQuery then
     Result := TSQLQuery(DataSet).Params.Count  > 0
  else if DataSet is TADOQuery then
     Result := TADOQuery(DataSet).Parameters.Count > 0
  else Result := False;
end;

function TFrmDebugFrame.DataSetSQL: String;
begin
  if DataSet is TIQWebDbxQuery then
     //GetParsedSQL(TIQWebDbxQuery(DataSet), Result)
  else if DataSet is TSQLQuery then
     //GetParsedSQL(TSQLQuery(DataSet), Result)
  else if DataSet is TADOQuery then
     //GetParsedSQL(TADOQuery(DataSet), Result)
  else Result := '';
end;

procedure TFrmDebugFrame.sbtnToggleTableFormViewClick(Sender: TObject);
begin
  //iqctrl.TogglePageControl(pcData);
end;

procedure TFrmDebugFrame.sbtnFindClick(Sender: TObject);
var
   AField: TField;
   AFound: Boolean;
begin
  AField := nil; //Grid.SelectedField; //not implemented

  if AField = NIL then
     raise Exception.Create('Please select a field.');

  if not InputQuery('Search', 'Enter search text:', FFindText) then Exit;

  with SrcQuery.DataSet do
  begin
    First;
    while not EOF do
    begin
      AFound := FieldByName(AField.FieldName).AsString = FFindText;
      if AFound then
         BREAK
      else
         Next;
    end;
  end;

  if not AFound then
     //IQInformation('Search text not found.');
end;

procedure TFrmDebugFrame.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
 if Button = nbRefresh then
    begin
      RefreshDataSet;
      SysUtils.Abort;
    end;
end;

procedure TFrmDebugFrame.RefreshDataSet;
begin
  if (DataSet is TIQWebDbxTable) then
     TIQWebDbxTable(DataSet).Refresh
  else if (DataSet is TSQLTable) then
     TSQLTable(DataSet).Refresh
  else if (DataSet is TADOTable) then
     TADOTable(DataSet).Refresh
  else
     try
       DataSet.DisableControls;
       DataSet.Close;
       OpenDataSet;
     finally
       DataSet.EnableControls;
     end;
end;

procedure TFrmDebugFrame.OpenDataSet;
var
   ASQLText: String;
begin

  if (DataSet = NIL) or not Assigned(DataSet) then
     Exit;

  memParsedSQL.Text := '';

  try
    pcMain.ActivePageIndex := 0;
    Reopen(DataSet);
    ASQLText := DataSetSQL;

    if ASQLText > '' then
       begin
         memParsedSQL.Text := ASQLText;
         TabParsedSQL.TabVisible := DataSetHasParams;
       end;
       
    HideError;

    SetControls;

    //iqctrl.AdjustPageControlToParent(pcData);
    TabData.TabVisible := True;
    
  except on E:Exception do
    begin
      TabData.TabVisible := False;
      TabParsedSQL.TabVisible := False;
      ShowError(E.Message);
    end;
  end;
end;

procedure TFrmDebugFrame.HideError;
begin
  PnlError.Visible := False;
end;

procedure TFrmDebugFrame.ShowError(AMsg: String);
begin
  memErrorText.Text := AMsg;
  PnlError.Visible := AMsg > '';
end;

procedure TFrmDebugFrame.SetShowQuerySQL(const Value: Boolean);
begin
  FShowQuerySQL := Value;
  SetControls;
end;

procedure TFrmDebugFrame.sbtnRefreshClick(Sender: TObject);
begin
  RefreshDataSet;
end;

end.
