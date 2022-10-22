unit EditMap;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  Data.DB,
  Vcl.DBCtrls, //TNavigateBtn
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
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame;

type
  TFrmEditMap = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    SrcMap: TDataSource;
    QryMap: TFDQuery;
    QryMapID: TBCDField;
    QryMapPR_IMPORT_TABLES_ID: TBCDField;
    QryMapLOOKUP_VALUE: TBCDField;
    QryMapLOOKUP_TABLE: TStringField;
    QryMapUSER_VALUE: TStringField;
    UpdateSQL1: TFDUpdateSQL;
    QryAllTables: TFDQuery;
    QryAllTablesTABLE_NAME: TStringField;
    dbAllTables: TUniDBLookupComboBox;
    dbLookUpValue: TUniEdit;
    Pk: TIQWebHPick;
    ds_AllTables: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure QryMapAfterPost(DataSet: TDataSet);
    procedure QryMapBeforePost(DataSet: TDataSet);
    procedure dbLookUpValueCustomDlg(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FId:Real;
    procedure SetId(Value : Real);
    function GetId: Real;
  public
    { Public declarations }
    property Id : Real read GetId write SetId;
  end;

procedure DoEditMap(AId:Real);


implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.DataConst,
  IQMS.Common.RegFrm;
{$R *.DFM}

procedure DoEditMap(AId:Real);
var
  frm : TFrmEditMap;
begin
  frm := TFrmEditMap.Create(uniGUIApplication.UniApplication);
  frm.Id := AId;
  frm.ShowModal;
end;

procedure TFrmEditMap.UniFormCreate(Sender: TObject);
begin
//
end;


procedure TFrmEditMap.UniFormShow(Sender: TObject);
begin
  QryMap.Close;
  QryMap.Filter := Format('PR_IMPORT_TABLES_ID=%d', [Trunc(FId)]);
  QryMap.Open;
  IQRegFormRead( Self, [ Self, IqSearch1.DBGrid ] ); // IQMS.Common.RegFrm.pas

  { TODO -oLema : TUniControl can not accept child controls }
//  dbAllTables.Parent  := IqSearch1.DBGrid;
//  dbAllTables.Visible := False;
//  dbLookUpValue.Parent  := IqSearch1.DBGrid;
//  dbLookUpValue.Visible := False;

end;

procedure TFrmEditMap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self, IqSearch1.DBGrid ] ); // IQMS.Common.RegFrm.pas
end;


procedure TFrmEditMap.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEditMap.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;


procedure TFrmEditMap.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    QryMap.Close;
    QryMap.Open;
    Abort;
  end
end;


procedure TFrmEditMap.QryMapAfterPost(DataSet: TDataSet);
begin
{
  try
    QryMap.DataBase.ApplyUpdates( [ QryMap ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryMap.Close;
      QryMap.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmEditMap.QryMapBeforePost(DataSet: TDataSet);
begin
  if QryMapID.asFloat = 0 then
     QryMapID.asFloat:= GetNextID('iq_mapping');

  if SelectValueFmtAsFloat('select id from %s where id = %f', [QryMapLOOKUP_TABLE.asString, QryMapLOOKUP_VALUE.asFloat]) = 0 then
    raise exception.create('Invalid lookup value');

  QryMapPR_IMPORT_TABLES_ID.asFloat := FId;
end;


function TFrmEditMap.GetId: Real;
begin
  result := GetId;
end;

procedure TFrmEditMap.SetId(Value: Real);
begin
  FId := Value;
end;

procedure TFrmEditMap.dbLookUpValueCustomDlg(Sender: TObject);
var
  AId:Real;
  AQry:TFDQuery;
  AStr:String;
  AIdFound:Boolean;
begin
  with Pk do
  begin
    Sql.Clear;
    if UpperCase(QryMapLOOKUP_TABLE.asString) = 'PR_EMP' then
      Sql.Add('select id, empno, first_name, middle_name, last_name from pr_emp')
    else
    begin
      AIdFound :=False;
      AStr := 'select ';
      AQry := TFDQuery.Create(self);
      try
        AQry.ConnectionName := cnstFDConnectionName;
//        AQry.Connection := MainModule.FDConnection;
        AQry.Sql.Add(Format('select column_name from all_tab_columns where owner = ''IQMS'' and table_name = ''%s''',
                            [QryMapLOOKUP_TABLE.asString]));
        AQry.Open;
        while not AQry.eof do
        begin
          if not AIdFound then
            AIdFound := (AQry.FieldByName('column_name').asString = 'ID');
          AStr := AStr + Format(' %s as %s, ', [AQry.FieldByName('column_name').asString, AQry.FieldByName('column_name').asString]);
          AQry.next;
        end;
      finally
        AQry.Free;
      end;
      if not AIdFound then
        raise exception.create('No ID field found, cannot assign lookup value');

      AStr := Copy(AStr, 1, Length(AStr) - 2);
      AStr := Format('%s from %s', [AStr, QryMapLOOKUP_TABLE.asString]);

      Sql.Add(AStr);
    end;
    if Execute then
    begin
      AId := GetValue('ID');
      if Aid <> 0 then
      begin
        if not (QryMap.State in [dsEdit, dsInsert]) then QryMap.Edit;
        QryMapLOOKUP_VALUE.asFloat := AId;
      end;
    end;
  end
end;

end.
