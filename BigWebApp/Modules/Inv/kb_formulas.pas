unit kb_formulas;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
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
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniPageControl, Vcl.StdCtrls, Vcl.ComCtrls, uniGUIFrame, IQUniGrid;

type
  TFrmKB_Formula = class(TUniForm)
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    Panel4: TUniPanel;
    sbtnEditSQLBlock: TUniSpeedButton;
    SrcKB_Formula: TDataSource;
    QryKB_Formula: TFDQuery;
    QryKB_FormulaID: TBCDField;
    QryKB_FormulaNAME: TStringField;
    QryKB_FormulaDESCRIP: TStringField;
    UpdateSQLFormula: TFDUpdateSQL;
    QryKB_FormulaKIND: TStringField;
    rchedSQL: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryKB_FormulaNewRecord(DataSet: TDataSet);
    procedure QryKB_FormulaBeforeOpen(DataSet: TDataSet);
    procedure QryKB_FormulaBeforePost(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
   // procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryKB_FormulaAfterScroll(DataSet: TDataSet);
    procedure sbtnEditSQLBlockClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FKind: string;
    procedure SaveSQL(AKB_Formula_ID: Real; ALines: TStrings);
    procedure SetKind(const Value: String);
  public
    { Public declarations }
    class procedure DoShow(AKind: string );
    class function LoadSQL(AKB_Formula_ID: Real; ALines: TStrings): Boolean;
    property Kind : String write SetKind;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  kb_formula_editor,
  kb_share;

{ TFrmKBFormulas }

class procedure TFrmKB_Formula.DoShow(AKind: string);
var
  LFrmKB_Formula : TFrmKB_Formula;
begin
  IQAssert( StrInList( AKind, [kb_share.cnstFORMULA_EPEI, kb_share.cnstFORMULA_KANBAN_CARD_COUNT, cnstFORMULA_FIXED_PITCH ]), 'Invalid KB_CONTROL.KIND parameter' );
  //IQAssert( SecurityManager.IsPowerUser or SecurityManager.IsUserDBA, 'This functionality reserved for Power Users or DBAs only - access denied' );

  LFrmKB_Formula := TFrmKB_Formula.Create(UniGUIApplication.UniApplication);
  with LFrmKB_Formula do
  begin
    Kind := AKind;
    Show;
  end;
end;

procedure TFrmKB_Formula.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmKB_Formula.QryKB_FormulaNewRecord(DataSet: TDataSet);
begin
  QryKB_FormulaKIND.asString:= FKind;
end;

procedure TFrmKB_Formula.QryKB_FormulaBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(Dataset).Params.ParamByName('kind').Value := FKind;
end;

procedure TFrmKB_Formula.QryKB_FormulaBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'KB_FORMULA' );
  QryKB_FormulaNAME.asString:= UpperCase( QryKB_FormulaNAME.asString );
  QryKB_FormulaKIND.asString:= UpperCase( QryKB_FormulaKIND.asString );
end;

procedure TFrmKB_Formula.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

{ TODO : yet to convert }
{procedure TFrmKB_Formula.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;   }

procedure TFrmKB_Formula.QryKB_FormulaAfterScroll(DataSet: TDataSet);
begin
 { TODO : TRichEdit has no uni component }
 // LoadSQL( QryKB_FormulaID.asFloat, rchedSQL.Lines );
end;

class function TFrmKB_Formula.LoadSQL( AKB_Formula_ID: Real; ALines: TStrings ): Boolean;
begin
  ALines.Clear;
  with TFDQuery.Create( nil ) do
  try
    Connection := UniMainModule.FDConnection1;

//    DataBaseName:= 'IQ';
    SQL.Add(IQFormat('select text from kb_formula_text where kb_formula_id = %f order by seq', [ AKB_Formula_ID ]));
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


procedure TFrmKB_Formula.SaveSQL( AKB_Formula_ID: Real; ALines: TStrings );
var
  I: Integer;
  ID: Real;
begin
  ExecuteCommandFmt('delete kb_formula_text where kb_formula_id = %f', [ AKB_Formula_ID ]);
  with TFDTable.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;

//    DataBaseName:= 'IQ';
    TableName   := 'KB_FORMULA_TEXT';
    Open;
    for I:= 0 to ALines.Count - 1 do
    begin
       Append;
       FieldByName('id').asFloat           := GetNextID( 'kb_formula_text' );
       FieldByName('kb_formula_id').asFloat:= AKB_Formula_ID;
       FieldByName('seq').asFloat          := I;
       FieldByName('text').asString        := ALines[ I ];
       Post;
    end;
  finally
    Free;
  end;
end;


procedure TFrmKB_Formula.sbtnEditSQLBlockClick(Sender: TObject);
begin
  QryKB_Formula.CheckBrowseMode;
  { TODO : TRichEdit has no uni component }
 { if TFrmKB_FormulaEditor.DoShowModal(QryKB_FormulaID.asFloat, rchedSQL.Lines ) then    // kb_formula_editor.pas
     SaveSQL( QryKB_FormulaID.asFloat, rchedSQL.Lines );}
end;

procedure TFrmKB_Formula.SetKind(const Value: String);
begin
  FKind := Value;
end;

procedure TFrmKB_Formula.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  Caption:= Format('User Defined Calculations [Kind=%s]', [ FKind ]);
end;

end.
