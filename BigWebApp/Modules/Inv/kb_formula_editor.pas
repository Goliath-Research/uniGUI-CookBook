unit kb_formula_editor;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.SqlExpr,
  Data.DBXOracle,
  FireDAC.Comp.Client,
  FireDAC.Stan.Error,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrmKB_FormulaEditor = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel4: TUniPanel;
    sbtnValidateSyntax: TUniSpeedButton;
    QryTemp: TFDQuery;
    SQLConn: TSQLConnection;
    rchedSQL: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure sbtnValidateSyntaxClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FKB_Formula_ID: Real;
    FLines: TStrings;
    procedure ValidateSyntax;
    procedure SetAKB_Formula_ID(const Value: Real);
    procedure SetLines(const Value: TStrings);
  public
    { Public declarations }
    class function DoShowModal(AKB_Formula_ID: Real; ALines: TStrings ): Boolean;
    property KB_Formula_ID : Real write SetAKB_Formula_ID;
    property Lines : TStrings write SetLines;
  end;

implementation

{$R *.dfm}

uses
  IQMS.DBTrans.dbtdbexp,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  { TODO : yet to convert }
  //kb_formulas,
  IQMS.Common.PanelMsg;

{ TFrmKB_FormulaEditor }

class function TFrmKB_FormulaEditor.DoShowModal(AKB_Formula_ID: Real; ALines: TStrings ): Boolean;
var
  LFrmKB_FormulaEditor : TFrmKB_FormulaEditor;
begin
  LFrmKB_FormulaEditor := TFrmKB_FormulaEditor.Create(UniGUIApplication.UniApplication);
  with LFrmKB_FormulaEditor do
  begin
    KB_Formula_ID := AKB_Formula_ID;
    Lines := ALines;
    Result:= ShowModal = mrOK;
    { TODO -oysingh -cWebConvert : TRichEdit not yet converted }
   { if Result then
       ALines.Assign( rchedSQL.Lines ); }
  end
end;

procedure TFrmKB_FormulaEditor.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmKB_FormulaEditor.btnOKClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TFrmKB_FormulaEditor.sbtnValidateSyntaxClick(Sender: TObject);
begin
  ValidateSyntax;
end;


procedure TFrmKB_FormulaEditor.SetAKB_Formula_ID(const Value: Real);
begin
  FKB_Formula_ID := Value;
end;

procedure TFrmKB_FormulaEditor.SetLines(const Value: TStrings);
begin
  FLines := Value;
end;

procedure TFrmKB_FormulaEditor.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
  Caption:= Format('Formula Editor [Name=%s]', [ SelectValueByID('name', 'kb_formula', FKB_Formula_ID) ]);

  { TODO : yet to convert }
  {TFrmKB_Formula.LoadSQL( FKB_Formula_ID, rchedSQL.Lines );
  if rchedSQL.Lines.Count = 0 then
  begin
    rchedSQL.Lines.Add('declare                                       ');
    rchedSQL.Lines.Add('  v_id number:= :ID;  /* mandatory IN param */');
    rchedSQL.Lines.Add('begin                                         ');
    rchedSQL.Lines.Add('  -- calculations here                        ');
    rchedSQL.Lines.Add('                                              ');
    rchedSQL.Lines.Add('  :RESULT:= 0;        /* mandatory OUT param */');
    rchedSQL.Lines.Add('end;                                          ');
  end;    }
end;

procedure TFrmKB_FormulaEditor.ValidateSyntax;
var
  hMsg: TPanelMesg;
  ATranDesc: TTransactionDesc;
begin
  hMsg:= hPleaseWait( 'Validating syntax, please wait ...');
  try
     // prepare connection
     SQLConn.Connected:= FALSE;
     IQMS.DBTrans.dbtdbexp.DBX_ConfigureSQLConnection(SQLConn);                       // Configure the SQL Connection
     IQMS.DBTrans.dbtdbexp.DBX_ConfigureTransaction(Application.Handle, ATranDesc);   // Configure the transaction record

     // just in case work under transaction that is going to be rolledback
     SQLConn.StartTransaction(ATranDesc);
     try
       try
         { TODO -oysingh -cWebConvert : TRichEdit not yet converted }
        { IQMS.DBTrans.dbtdbexp.DBX_GetValFmt( SQLConn,
                                 'select kb_eval.execute_sql_block( %f, ''%s'') from dual',
                                 [ -1.0,
                                   rchedSQL.Lines.Text ]);     }
       except
         on E: EFDDBEngineException do with E as EFDDBEngineException do
//               if Errors[ ErrorCount - 1 ].NativeCode <> 1403 then  // walk away from no data found because we pass v_id = -1
                  raise
         else
            raise;
       end;

     finally
       if SQLConn.InTransaction then
          SQLConn.Rollback( ATranDesc );
     end;
  finally
    hMsg.Free;
  end;

  IQInformation('Finished validating SQL block - no errors reported');
end;


end.
