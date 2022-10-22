unit q_batch_print;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Buttons,
  IQMS.WebVcl.Search,
  Data.DB,
  uniDBGrid, //TUniDBGridColumn
  Vcl.DBCtrls, //TNavigateBtn
//  Vcl.Wwdatsrc,
//  Mask,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
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
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame,
  Vcl.Controls;

type
  TFrmQ_Batch_Print = class(TUniForm)
    pnlAvail: TUniPanel;
    pnlSelected: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    btnProperties: TUniButton;
    btnPrint: TUniButton;
    btnCancel: TUniButton;
    Panel5: TUniPanel;
    SBRight: TUniSpeedButton;
    SBLeft: TUniSpeedButton;
    IQSearch1: TIQUniGridControl;
    wwDBGridSelected: TIQUniGridControl;
    Splitter1: TUniSplitter;
    SrcQuote: TDataSource;
    QryQuote: TFDQuery;
    QryQuoteRFQ: TStringField;
    QryQuoteQUOTE_REV: TBCDField;
    QryQuoteQUOTE_DATE: TDateTimeField;
    QryQuoteCOMPANY: TStringField;
    QryQuoteID: TBCDField;
    SrcQuoteBatch: TDataSource;
    QryQuoteBatch: TFDQuery;
    pnlNotes: TUniPanel;
    Splitter2: TUniSplitter;
    SrcQuoteBatchDetail: TDataSource;
    QryQuoteBatchDetail: TFDQuery;
    DBMemo1: TUniDBMemo;
    QryQuoteBatchID: TBCDField;
    QryQuoteBatchUSERID: TStringField;
    QryQuoteBatchTIMESTAMP: TDateTimeField;
    QryQuoteBatchNOTE1: TStringField;
    QryQuoteBatchDetailID: TBCDField;
    QryQuoteBatchDetailQUOTE_BATCH_ID: TBCDField;
    QryQuoteBatchDetailQUOTE_ID: TBCDField;
    QryQuoteBatchDetailRFQ: TStringField;
    UpdateSQLQuoteBatchDetail: TFDUpdateSQL;
    UpdateSQLQuoteBatch: TFDUpdateSQL;
    QryQuoteIS_SELECTED: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    Contents1: TUniMenuItem;
    PnlAvailableQuotes: TUniPanel;
    lblAvailableQuotes: TUniLabel;
    PnlToolbar: TUniPanel;
    PnlToolbarCaption: TUniPanel;
    lblSelectedQuotes: TUniLabel;
    Panel2: TUniPanel;
    PnlNoteCaption: TUniPanel;
    lblNote: TUniLabel;
    Panel8: TUniPanel;
    sbtnEditNote: TUniSpeedButton;
    DBNavigator2: TUniDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPropertiesClick(Sender: TObject);
    procedure QryQuoteBatchBeforeOpen(DataSet: TDataSet);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryQuoteBatchDetailNewRecord(DataSet: TDataSet);
    procedure QryQuoteBatchDetailBeforePost(DataSet: TDataSet);
    procedure SBLeftClick(Sender: TObject);
    procedure SBRightClick(Sender: TObject);
    procedure QryQuoteBeforeOpen(DataSet: TDataSet);
    procedure sbtnEditNoteClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure IQSearch1DBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    FQuote_Batch_ID: Real;
    FIsAnyPrinted: Boolean;
    procedure CreateHeaderRecord;
  protected
    FReportFieldName: string;
    procedure AssignReportFieldName; virtual;
  public
    { Public declarations }
    class procedure DoShowModal; virtual;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.EditMemoStr,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Print,
  IQMS.Common.RegFrm,

//  IQSecIns,
  quote_rscstr,
//  RepProps,
  IQMS.Common.UCRPE32;


class procedure TFrmQ_Batch_Print.DoShowModal;
var
  frm: TFrmQ_Batch_Print;
begin
  frm := TFrmQ_Batch_Print.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TFrmQ_Batch_Print.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, wwDBGridSelected, pnlAvail ]);
end;

procedure TFrmQ_Batch_Print.FormDestroy(Sender: TObject);
begin
  if not FIsAnyPrinted then
     ExecuteCommandFmt('delete from quote_batch where id = %f', [ FQuote_Batch_ID ]);
end;

procedure TFrmQ_Batch_Print.btnPropertiesClick(Sender: TObject);
begin
  //DoReportProperties( self, FReportFieldName {'RFQ_BATCH_REPORT'} );  {RepProps.pas}
end;

procedure TFrmQ_Batch_Print.CreateHeaderRecord;
begin
  ExecuteCommandFmt('insert into quote_batch(id, userid, timestamp) values(%f, misc.GetUserName, sysdate )',
            [ FQuote_Batch_ID ]);

  {'Selected Quotes [Batch # %.0f]'}
  lblSelectedQuotes.Caption:= Format(quote_rscstr.cTXT000000063, [FQuote_Batch_ID]);
  Reopen( QryQuoteBatch );
end;

procedure TFrmQ_Batch_Print.QryQuoteBatchBeforeOpen(DataSet: TDataSet);
begin
  with TFDQuery(DataSet) do
    ParamByName('quote_batch_id').Value := FQuote_Batch_ID;
end;

procedure TFrmQ_Batch_Print.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;

procedure TFrmQ_Batch_Print.QryQuoteBatchDetailNewRecord(DataSet: TDataSet);
begin
  QryQuoteBatchDetailQUOTE_BATCH_ID.AsFloat:= FQuote_Batch_ID;
end;

procedure TFrmQ_Batch_Print.QryQuoteBatchDetailBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'QUOTE_BATCH_DETAIL' );
  IQAssert( QryQuoteBatchDetailQUOTE_ID.asFloat > 0, quote_rscstr.cTXT000000064{'Please assign an RFQ number.'});
end;

procedure TFrmQ_Batch_Print.SBLeftClick(Sender: TObject);
var
  I: Integer;
begin
  with wwDBGridSelected do
  try
     DataSource.DataSet.DisableControls;

     if DBGrid.SelectedRows.Count > 0 then
        for I:= 0 to DBGrid.SelectedRows.Count - 1 do
        begin
          DataSource.DataSet.GotoBookmark( DBGrid.SelectedRows.Items[ I ]);
          DataSource.DataSet.Delete;
        end
     else if DataSource.DataSet.FieldByName('id').asFloat > 0 then
        DataSource.DataSet.Delete;

     { TODO -oLema : Unknown method UnselectAll }
//     UnselectAll;
  finally
     DataSource.DataSet.EnableControls;
  end;

  RefreshDataSetByID( QryQuote );
  RefreshDataSetByID( QryQuoteBatchDetail );
end;

procedure TFrmQ_Batch_Print.SBRightClick(Sender: TObject);
var
  I: Integer;

  procedure CheckAppendToQuoteBatch( AQuote_ID: Real );
  begin
    if SelectValueFmtAsFloat('select 1 from quote_batch_detail where quote_batch_id = %f and quote_id = %f', [ FQuote_Batch_ID, AQuote_ID ]) = 1 then
       EXIT;
    QryQuoteBatchDetail.Append;
    QryQuoteBatchDetailQUOTE_ID.asFloat:= AQuote_ID;
    QryQuoteBatchDetail.Post;
  end;

begin
  with IQSearch1 do
  try
     DBGrid.DataSource.DataSet.DisableControls;

     if DBGrid.SelectedRows.Count > 0 then
        for I:= 0 to DBGrid.SelectedRows.Count - 1 do
        begin
          DBGrid.DataSource.DataSet.GotoBookmark( DBGrid.SelectedRows.Items[ I ]);
          CheckAppendToQuoteBatch( DBGrid.DataSource.DataSet.FieldByName('ID').asFloat )
        end
     else if DBGrid.DataSource.DataSet.FieldByName('id').asFloat > 0 then
        CheckAppendToQuoteBatch( DBGrid.DataSource.DataSet.FieldByName('ID').asFloat );

     { TODO -oLema : Unknown method UnselectAll }
     //wwDBGrid.UnselectAll;
  finally
     DBGrid.DataSource.DataSet.EnableControls;
  end;

  RefreshDataSetByID( QryQuote );
  RefreshDataSetByID( QryQuoteBatchDetail );
end;

procedure TFrmQ_Batch_Print.QryQuoteBeforeOpen(DataSet: TDataSet);
begin
  with TFDQuery(DataSet) do
    ParamByName('quote_batch_id').Value := FQuote_Batch_ID;
end;


procedure TFrmQ_Batch_Print.IQSearch1DBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if QryQuoteIS_SELECTED.AsString = 'Y' then
  begin
//    if not Highlight then
//       AFont.Color:= clSilver
//    else
       Attribs.Font.Color:= clSilver;
       Attribs.Color:= clBlack;
  end;

end;


procedure TFrmQ_Batch_Print.sbtnEditNoteClick(Sender: TObject);
var
  S: string;
begin
  S:= QryQuoteBatchNOTE1.asString;
  if DoEditMemoStr( S, 4000, quote_rscstr.cTXT000000065{'Edit Note'}) then
  begin
     QryQuoteBatch.Edit;
     QryQuoteBatchNOTE1.asString:= S;
  end;
end;

procedure TFrmQ_Batch_Print.UniFormCreate(Sender: TObject);
begin
  AssignReportFieldName;

  FQuote_Batch_ID:= GetNextID( 'QUOTE_BATCH' );
  CreateHeaderRecord;

  IQSetTablesActiveEx(TRUE, self, quote_rscstr.cTXT000000212 {'Accessing database.  Please wait.'});
  IQRegFormRead( self, [self, wwDBGridSelected, pnlAvail ]);

end;

procedure TFrmQ_Batch_Print.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmQ_Batch_Print.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmQ_Batch_Print.btnPrintClick(Sender: TObject);
var
  SelectionList: TStringList;
  AReportName  : string;
begin
  SelectionList:= TStringList.Create;
  try
    SelectionList.Add( Format('{QUOTE_BATCH.ID} = %.0f', [ FQuote_Batch_ID ]));
    AReportName:= SelectValueFmtAsString('select %s from iqsys', [ FReportFieldName ]);
    // 'The report has not been assigned.  Please assign a report in System Parameters.'
    IQAssert( AReportName > '', quote_rscstr.cTXT000000066);

    if PrintDefaultReportEx( self, AReportName, SelectionList ) then
       FIsAnyPrinted:= TRUE;
  finally
    SelectionList.Free;
  end;
end;

procedure TFrmQ_Batch_Print.FormShow(Sender: TObject);
begin
  //EnsureSecurityInspectorOnTopOf( self );
end;


procedure TFrmQ_Batch_Print.AssignReportFieldName;
begin
  FReportFieldName:= 'RFQ_BATCH_REPORT';
end;

procedure TFrmQ_Batch_Print.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmQ_Batch_Print.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmQUOTE{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
