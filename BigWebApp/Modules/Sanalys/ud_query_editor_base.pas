unit ud_query_editor_base;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.SqlExpr,
  FireDAC.Comp.Client,
  FireDAC.Stan.Error,
  FireDAC.Phys,
  DBXOracle,
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
  uniGUIApplication, uniMemo;

type
  TFrmUD_QueryEditorBase = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel4: TUniPanel;
    sbtnValidateSyntax: TUniSpeedButton;
    QryTemp: TFDQuery;
    SQLConn: TSQLConnection;
    rchedSQL: TUniMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure sbtnValidateSyntaxClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FUD_Query_ID: Real;
    procedure ValidateSQLBlockSyntax;
    procedure ValidateQuerySyntax;
  protected
    procedure BeforeValidateOpenQuerySyntax; virtual;
  public
    { Public declarations }
    constructor Create(AUD_Query_ID: Real; ALines: TStrings );
    class function DoShowModal(AUD_Query_ID: Real; ALines: TStrings ): Boolean;
  end;


implementation

{$R *.dfm}

uses
  IQMS.DBTrans.dbtdbexp,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg,
  ud_query_base;

{ TFrmUD_QueryEditorBase }

class function TFrmUD_QueryEditorBase.DoShowModal( AUD_Query_ID: Real; ALines: TStrings ): Boolean;
begin
  with self.Create( AUD_Query_ID, ALines ) do
  begin
    Result:= ShowModal = mrOK;
    if Result then
       ALines.Assign( rchedSQL.Lines );
  end
end;

constructor TFrmUD_QueryEditorBase.Create(  AUD_Query_ID: Real; ALines: TStrings);
begin
  FUD_Query_ID:= AUD_Query_ID;
  inherited Create(uniGUIApplication.UniApplication);

  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
  Caption:= Format('Query Editor [Name=%s]', [ SelectValueByID('name', 'ud_query', AUD_Query_ID) ]);

  TFrmUD_QueryBase( uniGUIApplication.UniApplication ).LoadSQL( FUD_Query_ID, rchedSQL.Lines );
  if rchedSQL.Lines.Count = 0 then
  begin
  end;
end;

procedure TFrmUD_QueryEditorBase.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmUD_QueryEditorBase.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TFrmUD_QueryEditorBase.btnOKClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TFrmUD_QueryEditorBase.sbtnValidateSyntaxClick(Sender: TObject);
begin
  ValidateQuerySyntax;
end;

procedure TFrmUD_QueryEditorBase.ValidateQuerySyntax;
var
  I: Integer;
begin
  if rchedSQL.Lines.Count = 0 then
  begin
    IQInformation('QryTemp: No SQL Statement available.');
    Exit;
  end;  
  {populate internal Qry SQL with the text}
  with QryTemp do
  begin
    Close;
    SQL.Clear;
    for I:= 0 to rchedSQL.Lines.Count - 1 do
       SQL.Add(rchedSQL.Lines[i]);

    BeforeValidateOpenQuerySyntax;

    Open;
    Close;

  end;
  IQInformation('Finished validating SQL block - no errors reported');
end;


procedure TFrmUD_QueryEditorBase.BeforeValidateOpenQuerySyntax;
begin
  {use to assign params}
end;

procedure TFrmUD_QueryEditorBase.ValidateSQLBlockSyntax;
var
  hMsg: TPanelMesg;
  ATranDesc: TTransactionDesc;
begin
  // future use

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
         IQMS.DBTrans.dbtdbexp.DBX_GetValFmt( SQLConn,
                                 'select kb_eval.execute_sql_block( %f, ''%s'') from dual',
                                 [ -1.0,
                                   rchedSQL.Lines.Text ]);
       except
         on E: EFDDBEngineException do with E as EFDDBEngineException do
               if Errors[ ErrorCount - 1 ].ErrorCode <> 1403 then  // walk away from no data found because we pass v_id = -1
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
