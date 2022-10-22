unit ud_query_base;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.DBCtrls,
  Data.DB,
  ud_query_editor_base,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMemo, IQUniGrid, uniGUIFrame,
  Vcl.Controls;

type
  TUD_QueryEditorClass = class of TFrmUD_QueryEditorBase;

  TFrmUD_QueryBase = class(TUniForm)
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    Panel4: TUniPanel;
    sbtnEditSQLBlock: TUniSpeedButton;
    SrcUDQuery: TDataSource;
    QryUDQuery: TFDQuery;
    QryUDQueryID: TBCDField;
    QryUDQueryNAME: TStringField;
    QryUDQueryDESCRIP: TStringField;
    UpdateSQLUDQuery: TFDUpdateSQL;
    QryUDQueryKIND: TStringField;
    rchedSQL: TUniMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryUDQueryNewRecord(DataSet: TDataSet);
    procedure QryUDQueryBeforeOpen(DataSet: TDataSet);
    procedure QryUDQueryBeforePost(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryUDQueryAfterScroll(DataSet: TDataSet);
    procedure sbtnEditSQLBlockClick(Sender: TObject);

  private
    { Private declarations }
  protected
    FKind: string;
    procedure SaveSQL( AUD_Query_ID: Real; ALines: TStrings );
    function GetUDQueryEditorClass: TUD_QueryEditorClass;  virtual;
  public
    { Public declarations }
    constructor Create(  AKind: string );
    class procedure DoShow(   AKind: string );
    class function LoadSQL( AUD_Query_ID: Real; ALines: TStrings ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.DataConst,
  IQMS.Common.StringUtils;


{ TFrmUDQueryBase }

class procedure TFrmUD_QueryBase.DoShow(AKind: string);
begin
  IQAssert( SecurityManager.IsPowerUser or SecurityManager.IsUserDBA, 'This functionality reserved for Power Users or DBAs only - access denied' );
  self.Create(  AKind ).Show;
end;


constructor TFrmUD_QueryBase.Create(  AKind: string);
begin
  FKind:= AKind;
  inherited Create( uniGUIApplication.UniApplication );
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;


procedure TFrmUD_QueryBase.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmUD_QueryBase.QryUDQueryNewRecord(DataSet: TDataSet);
begin
  QryUDQueryKIND.asString:= FKind;
end;

procedure TFrmUD_QueryBase.QryUDQueryBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(Dataset).Params.ParamByName('kind').asString:= FKind;
end;

procedure TFrmUD_QueryBase.QryUDQueryBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'UD_QUERY');
  QryUDQueryKIND.asString:= UpperCase( QryUDQueryKIND.asString );
end;

procedure TFrmUD_QueryBase.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmUD_QueryBase.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;

procedure TFrmUD_QueryBase.QryUDQueryAfterScroll(DataSet: TDataSet);
begin
  LoadSQL( QryUDQueryID.asFloat, rchedSQL.Lines );
end;

class function TFrmUD_QueryBase.LoadSQL( AUD_Query_ID: Real; ALines: TStrings ): Boolean;
begin
  ALines.Clear;
  with TFDQuery.Create( nil ) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(IQFormat('select text from ud_query_text where ud_query_id = %f order by seq', [ AUD_Query_ID ]));
    Open;
    while not Eof do
    begin
      ALines.Add( Fields[ 0 ].asString );
      Next;
    end;
  finally
    Free;
  end;
  Result:= ALines.Count > 0;
end;


procedure TFrmUD_QueryBase.SaveSQL( AUD_Query_ID: Real; ALines: TStrings );
var
  I: Integer;
  ID: Real;
begin
  ExecuteCommandFmt('delete ud_query_text where ud_query_id = %f', [ AUD_Query_ID ]);
  with TFDTable.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    TableName   := 'UD_QUERY_TEXT';
    Open;
    for I:= 0 to ALines.Count - 1 do
    begin
       Append;
       FieldByName('id').asFloat           := GetNextID( 'ud_query_text' );
       FieldByName('ud_query_id').asFloat:= AUD_Query_ID;
       FieldByName('seq').asFloat          := I;
       FieldByName('text').asString        := ALines[ I ];
       Post;
    end;
  finally
    Free;
  end;
end;


procedure TFrmUD_QueryBase.sbtnEditSQLBlockClick(Sender: TObject);
var
  ARef: TUD_QueryEditorClass;
begin
  QryUDQuery.CheckBrowseMode;

  ARef:= GetUDQueryEditorClass();
  if ARef.DoShowModal( QryUDQueryID.asFloat, rchedSQL.Lines ) then    // ud_query_editor_base.pas
     SaveSQL( QryUDQueryID.asFloat, rchedSQL.Lines );
end;


function TFrmUD_QueryBase.GetUDQueryEditorClass: TUD_QueryEditorClass;
begin
  Result:= TFrmUD_QueryEditorBase;  // default query editor ud_query_editor_base.pas
end;

end.
