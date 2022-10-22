unit qc_doc_cert_train;

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
  ExtCtrls,
  DBCtrls,
  Grids,
  wwDataInspector,
  Wwdbigrd,
  Wwdbgrid,
  DB,
  Menus,
  IQMS.WebVcl.About,
  StdCtrls,
  Mask,
  wwdbedit,
  Wwdotdot,
  IQMS.WebVcl.Hpick,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.RepDef,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  IQMS.Common.DataConst,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, uniGUIFrame, IQUniGrid;

type
  TFrmQcDocCertTraining = class(TUniForm)
    pnlCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    pnlLeft01: TUniPanel;
    Panel2: TUniPanel;
    navMain: TUniDBNavigator;
    pnlTop01: TUniPanel;
    Panel5: TUniPanel;
    Splitter2: TUniSplitter;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    wwDBGridQuestions: TIQUniGridControl;
    wwDBGridAnswers: TIQUniGridControl;
    QryCertTraining: TFDQuery;
    SrcCertTraining: TDataSource;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryCertTrainQuestions: TFDQuery;
    SrcCertTrainQuestions: TDataSource;
    QryCertTrainAnswers: TFDQuery;
    SrcCertTrainAnswers: TDataSource;
    QryCertTrainingID: TBCDField;
    QryCertTrainingDESCRIP: TStringField;
    QryCertTrainingPASS_PERCENT: TBCDField;
    QryCertTrainQuestionsID: TBCDField;
    QryCertTrainQuestionsCERT_TRAINING_ID: TBCDField;
    QryCertTrainQuestionsSEQ: TBCDField;
    QryCertTrainQuestionsTEXT: TStringField;
    QryCertTrainQuestionsCERT_TRAINING_ANSWER_ID: TBCDField;
    wwDBComboDlgQuestion: TUniEdit;
    UpdateSQLQuestion: TFDUpdateSQL;
    QryCertTrainAnswersID: TBCDField;
    QryCertTrainAnswersCERT_TRAINING_QUESTION_ID: TBCDField;
    QryCertTrainAnswersSEQ: TBCDField;
    QryCertTrainAnswersTEXT: TStringField;
    UpdateSQLAnswer: TFDUpdateSQL;
    wwDBComboDlgAnswer: TUniEdit;
    Panel4: TUniPanel;
    Shape10: TUniPanel;
    wwDBComboDlgCorrectAnswer: TUniEdit;
    PkAnswer: TIQWebHPick;
    QryCertTrainQuestionsCorrectAnswerText: TStringField;
    UpdateSQLCertTraining: TFDUpdateSQL;
    PkAnswerID: TBCDField;
    PkAnswerSEQ: TBCDField;
    PkAnswerTEXT: TStringField;
    Contents1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SR: TIQWebSecurityRegister;
    wwDataInspector1: TwwDataInspector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryCertTrainingBeforeOpen(DataSet: TDataSet);
    procedure wwDataInspector1Items1EditButtonClick(Sender: TwwDataInspector;
      Item: TwwInspectorItem);
    procedure navMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure wwDBComboDlgQuestionCustomDlg(Sender: TObject);
    procedure wwDBComboDlgAnswerCustomDlg(Sender: TObject);
    procedure QryCertTrainQuestionsNewRecord(DataSet: TDataSet);
    procedure QryCertTrainAnswersNewRecord(DataSet: TDataSet);
    procedure QryCertTrainQuestionsBeforePost(DataSet: TDataSet);
    procedure QryCertTrainAnswersBeforePost(DataSet: TDataSet);
    procedure navQuestionsBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure navAnswersBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure wwDBGridQuestionsCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure PkAnswerBeforeOpen(DataSet: TDataSet);
    procedure wwDBComboDlgCorrectAnswerCustomDlg(Sender: TObject);
    procedure QryCertTrainQuestionsCalcFields(DataSet: TDataSet);
    procedure PostParentBeforeEdit(DataSet: TDataSet);
    procedure wwDBGridQuestionsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure wwDBGridQuestionsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure wwDBGridQuestionsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure wwDBGridAnswersMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure wwDBGridAnswersDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure wwDBGridAnswersDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FCert_Training_ID: Real;
    FExternal_Doc_ID : Real;
    FDragDropPoint: TPoint;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    function DragDropGridRecord( ADBGrid: TIQUniGridControl ): Boolean;
    procedure SetCert_Training_ID(const Value: Real);
    procedure SetExternal_Doc_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal(ACert_Training_ID, AExternal_Doc_ID: Real );
    property Cert_Training_ID : Real write SetCert_Training_ID;
    property External_Doc_ID : Real write SetExternal_Doc_ID;
    class function GenerateCertTrainingHeader: Real;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.EditMemoStr,
  IQMS.Common.Dialogs,
  IQMS.Common.HelpHook;

const
  cnstRefreshQuestion = 1;
  cnstDragDropSeq = 2;

type
   TwwLocalDBGrid = class( TIQUniGridControl )    {so we could surface MouseDown event}
   public
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: integer);
   end;

procedure TwwLocalDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  inherited MouseDown( Button, Shift, X, Y );
end;


{ TFrmQcDocCertTraining }
class procedure TFrmQcDocCertTraining.DoShowModal(ACert_Training_ID, AExternal_Doc_ID: Real);
var
  LFrmQcDocCertTraining : TFrmQcDocCertTraining;
begin
  LFrmQcDocCertTraining := TFrmQcDocCertTraining.Create(UniGUIApplication.UniApplication);
  with LFrmQcDocCertTraining do
  begin
    Cert_Training_ID := ACert_Training_ID;
    External_Doc_ID := AExternal_Doc_ID;
    ShowModal;
  end;
end;

class function TFrmQcDocCertTraining.GenerateCertTrainingHeader: Real;
begin
  Result:= GetNextID('cert_training');
  ExecuteCommandFmt('insert into cert_training( id, descrip, pass_percent ) values( %f, ''Certification Training %.0f'', 65)',
            [ Result, Result ]);
end;

procedure TFrmQcDocCertTraining.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmQuality{CHM}, iqhtmQuality{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmQcDocCertTraining.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, pnlLeft01, pnlTop01, wwDBGridQuestions, wwDBGridAnswers ]);
end;


procedure TFrmQcDocCertTraining.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    cnstRefreshQuestion:
      RefreshDataSetByID(QryCertTrainQuestions);
    cnstDragDropSeq:
      DragDropGridRecord( TIQUniGridControl( Msg.LParam ));
  end;
end;

procedure TFrmQcDocCertTraining.navAnswersBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button = nbDelete) then
  begin
    if not IQConfirmYN('Delete record?') then ABORT;

    // delete the correct answer in the question
    if (QryCertTrainAnswersID.asFloat = SelectValueByID('cert_training_answer_id', 'cert_training_question', QryCertTrainQuestionsID.asFloat)) then
    begin
      ExecuteCommandFmt('declare                                                             '+
                '  v_cert_training_question_id number::= %f;                         '+
                '  v_cert_training_answer_id   number::= %f;                         '+
                'begin                                                               '+
                   // make sure questions dont point to any answers
                '  update cert_training_question set cert_training_answer_id = null  '+
                '   where id = v_cert_training_question_id                           '+
                '     and cert_training_answer_id = v_cert_training_answer_id;       '+
                'end;                                                                ',
                [ QryCertTrainQuestionsID.asFloat,
                  QryCertTrainAnswersID.asFloat ]);
      PostMessage( self.Handle, iq_Notify, cnstRefreshQuestion,  0 )    {IQMS.Common.JumpConstants.pas}
    end;
  end;

  CheckRefresh(Sender, Button);
end;

procedure TFrmQcDocCertTraining.navMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then
  begin
    if not IQConfirmYN('Delete record?') then ABORT;

    ExecuteCommandFmt('declare                                                             '+
              '  v_cert_training_id number::= %f;                                  '+
              '  v_external_doc_id  number::= %f;                                  '+
              'begin                                                               '+
                 // update external doc pointer to null
              '  update external_doc set cert_training_id = null                   '+
              '   where id = v_external_doc_id;                                    '+
              '                                                                    '+
                 // make sure questions dont point to any answers
              '  update cert_training_question set cert_training_answer_id = null  '+
              '   where cert_training_id = v_cert_training_id;                     '+
              '                                                                    '+
                 // delete answers
              '  delete from cert_training_answer                                  '+
              '   where cert_training_question_id                                  '+
              '         in                                                         '+
              '         (select id from cert_training_question                     '+
              '           where cert_training_id = v_cert_training_id);            '+
              '                                                                    '+
                 // delete questions
              '  delete from cert_training_question                                '+
              '   where cert_training_id = v_cert_training_id;                     '+
              '                                                                    '+
                 // delete cert_training
              '  delete from cert_training                                         '+
              '   where id = v_cert_training_id;                                   '+
              'end;                                                                ',
              [ FCert_Training_ID,
                FExternal_Doc_ID ]);
    // close the form!
    PostMessage( self.Handle, wm_Command, Exit1.Command, 0 );
    ABORT;
  end;

  // check refresh
  CheckRefresh(Sender, Button);
end;

procedure TFrmQcDocCertTraining.navQuestionsBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbDelete then
  begin
    if not IQConfirmYN('Delete record?') then ABORT;

    // delete answers
    ExecuteCommandFmt('declare                                                             '+
              '  v_cert_training_question_id number::= %f;                         '+
              'begin                                                               '+
                 // make sure questions dont point to any answers
              '  update cert_training_question set cert_training_answer_id = null  '+
              '   where id = v_cert_training_question_id;                          '+
              '                                                                    '+
                 // delete answers
              '  delete from cert_training_answer                                  '+
              '   where cert_training_question_id = v_cert_training_question_id;   '+
              '                                                                    '+
              'end;                                                                ',
              [ QryCertTrainQuestionsID.asFloat ]);
  end;


  CheckRefresh(Sender, Button);
end;

procedure TFrmQcDocCertTraining.PkAnswerBeforeOpen(DataSet: TDataSet);
begin
//  TFDQuery(DataSet).ParamByName('id').asFloat:= QryCertTrainQuestionsID.asFloat;
  AssignQueryParamValue(DataSet, 'id', QryCertTrainQuestionsID.asFloat);
end;

procedure TFrmQcDocCertTraining.PostParentBeforeEdit(DataSet: TDataSet);
begin
  if Assigned(TFDQuery(DataSet).DataSource) and Assigned(TFDQuery(DataSet).DataSource.DataSet) then
     TFDQuery(DataSet).DataSource.DataSet.CheckBrowseMode;
end;

procedure TFrmQcDocCertTraining.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmQcDocCertTraining.PrinterSetup1Click(Sender: TObject);
begin
 PrinterSetupDialog1.Execute;
end;

procedure TFrmQcDocCertTraining.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmQcDocCertTraining.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmQcDocCertTraining.QryCertTrainAnswersBeforePost(
  DataSet: TDataSet);
begin
   // Added below code because of Next record id issue i.e EIQ-12992
   if QryCertTrainAnswers.state = dsInsert then
      QryCertTrainAnswersID.asFloat := GetNextID('cert_training_answer');

  //IQAssignIDBeforePost( DataSet, 'cert_training_answer'); commented for EIQ-12992 Document Control  :Records  get removed after clicking the refresh button on "Certification Training" page
  IQAssert( Trim(QryCertTrainAnswersTEXT.asString) > '', 'Answer must be entered - operation aborted.');
end;

procedure TFrmQcDocCertTraining.QryCertTrainAnswersNewRecord(DataSet: TDataSet);
begin
  QryCertTrainAnswersCERT_TRAINING_QUESTION_ID.asFloat:= QryCertTrainQuestionsID.asFloat;
  QryCertTrainAnswersSEQ.asFloat:= 1 + SelectValueFmtAsFloat('select max(seq) from cert_training_answer where cert_training_question_id = %f', [ QryCertTrainQuestionsID.asFloat ]);
end;

procedure TFrmQcDocCertTraining.QryCertTrainingBeforeOpen(DataSet: TDataSet);
begin
//  TFDQuery(DataSet).ParamByName('cert_training_id').asFloat:= FCert_Training_ID;
  AssignQueryParamValue(DataSet, 'cert_training_id', FCert_Training_ID);
end;

procedure TFrmQcDocCertTraining.QryCertTrainQuestionsBeforePost(
  DataSet: TDataSet);
begin
  // Added below code because of Next record id issue i.e EIQ-12992
  if QryCertTrainQuestions.state = dsInsert then
     QryCertTrainQuestionsID.asFloat := GetNextID('cert_training_question');

//  IQAssignIDBeforePost( DataSet, 'cert_training_question'); commented for EIQ-12992 Document Control  :Records  get removed after clicking the refresh button on "Certification Training" page
  IQAssert( Trim(QryCertTrainQuestionsTEXT.asString) > '', 'Question must be entered - operation aborted.');
end;

procedure TFrmQcDocCertTraining.QryCertTrainQuestionsCalcFields(DataSet: TDataSet);
begin
  if QryCertTrainQuestionsCERT_TRAINING_ANSWER_ID.asFLoat > 0 then
     QryCertTrainQuestionsCorrectAnswerText.asString:= SelectValueByID('text', 'cert_training_answer', QryCertTrainQuestionsCERT_TRAINING_ANSWER_ID.asFloat );
end;

procedure TFrmQcDocCertTraining.QryCertTrainQuestionsNewRecord(
  DataSet: TDataSet);
begin
  QryCertTrainQuestionsCERT_TRAINING_ID.asFloat:= QryCertTrainingID.asFloat;
  QryCertTrainQuestionsSEQ.asFloat:= 1 + SelectValueFmtAsFloat('select max(seq) from cert_training_question where cert_training_id = %f', [ QryCertTrainingID.asFloat ]);
end;

procedure TFrmQcDocCertTraining.SetCert_Training_ID(const Value: Real);
begin
  FCert_Training_ID := Value;
end;

procedure TFrmQcDocCertTraining.SetExternal_Doc_ID(const Value: Real);
begin
  FExternal_Doc_ID := Value;
end;

procedure TFrmQcDocCertTraining.UniFormShow(Sender: TObject);
begin
  IQRegFormRead(self, [ self, pnlLeft01, pnlTop01, wwDBGridQuestions, wwDBGridAnswers ]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmQcDocCertTraining.wwDataInspector1Items1EditButtonClick(
  Sender: TwwDataInspector; Item: TwwInspectorItem);
var
  S: string;
begin
  S:= QryCertTrainingDESCRIP.asString;
  if DoEditMemoStr( S, 50 ) then    {IQMS.Common.EditMemoStr.pas}
  begin
    QryCertTraining.Edit;
    QryCertTrainingDESCRIP.asString:= S;
  end;
end;

procedure TFrmQcDocCertTraining.wwDBComboDlgAnswerCustomDlg(Sender: TObject);
var
  S: string;
begin
  S:= QryCertTrainAnswersTEXT.asString;
  if DoEditMemoStr( S, 250, 'Answer' ) then    {IQMS.Common.EditMemoStr.pas}
  begin
    QryCertTrainAnswers.Edit;
    QryCertTrainAnswersTEXT.asString:= S;
  end;
end;

procedure TFrmQcDocCertTraining.wwDBComboDlgCorrectAnswerCustomDlg(
  Sender: TObject);
begin
  with PkAnswer do
    if Execute then
    begin
      QryCertTrainQuestions.Edit;
      QryCertTrainQuestionsCERT_TRAINING_ANSWER_ID.asFloat:= GetValue('id');
    end;
end;

procedure TFrmQcDocCertTraining.wwDBComboDlgQuestionCustomDlg(Sender: TObject);
var
  S: string;
begin
  S:= QryCertTrainQuestionsTEXT.asString;
  if DoEditMemoStr( S, 250, 'Question' ) then    {IQMS.Common.EditMemoStr.pas}
  begin
    QryCertTrainQuestions.Edit;
    QryCertTrainQuestionsTEXT.asString:= S;
  end;
end;

procedure TFrmQcDocCertTraining.wwDBGridAnswersDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  FDragDropPoint:= Point(X,Y);
  PostMessage( Handle, iq_Notify, cnstDragDropSeq, LongInt(TIQUniGridControl(Sender)));
end;

procedure TFrmQcDocCertTraining.wwDBGridAnswersDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= (Sender = Source) and (Sender = wwDBGridAnswers);
end;

procedure TFrmQcDocCertTraining.wwDBGridAnswersMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AGrid: TIQUniGridControl;
begin
  AGrid:= TIQUniGridControl(Sender);
  { TODO : 'TIQUniGridControl' has no property defined 'rowheight' }
 { if (Button in [mbLeft]) and (Y > AGrid.RowHeights[ 0 ]) and (AGrid.DataSource.DataSet.FieldByName('id').asFloat > 0) then
     AGrid.BeginDrag(FALSE);  }
end;

procedure TFrmQcDocCertTraining.wwDBGridQuestionsCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if QryCertTrainQuestionsCERT_TRAINING_ANSWER_ID.asFloat = 0 then
     AFont.Color:= clRed;
end;

procedure TFrmQcDocCertTraining.wwDBGridQuestionsDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  FDragDropPoint:= Point(X,Y);
  PostMessage( Handle, iq_Notify, cnstDragDropSeq, LongInt(TIQUniGridControl(Sender)));
end;

procedure TFrmQcDocCertTraining.wwDBGridQuestionsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= (Sender = Source) and (Sender = wwDBGridQuestions);
end;

procedure TFrmQcDocCertTraining.wwDBGridQuestionsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AGrid: TIQUniGridControl;
begin
  AGrid:= TIQUniGridControl(Sender);
 { TODO : 'TIQUniGridControl' has no property defined 'rowheight' }
 { if (Button in [mbLeft]) and (Y > AGrid.RowHeights[ 0 ]) and (AGrid.DataSource.DataSet.FieldByName('id').asFloat > 0) then
     AGrid.BeginDrag(FALSE);   }
end;

procedure TFrmQcDocCertTraining.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmQcDocCertTraining.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;

procedure TFrmQcDocCertTraining.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

function TFrmQcDocCertTraining.DragDropGridRecord( ADBGrid: TIQUniGridControl ): Boolean;
const
  cnstSQLSelectQuestion = 'select id, seq from cert_training_question where cert_training_id = %f order by seq';
  cnstSQLUpdateQuestion = 'update cert_training_question set seq = %d where id = %s';

  cnstSQLSelectAnswer = 'select id, seq from cert_training_answer where cert_training_question_id = %f order by seq';
  cnstSQLUpdateAnswer = 'update cert_training_answer set seq = %d where id = %s';

var
  AOnMouseDown: TMouseEvent;
  ASource_ID  : Real;
  ATarget_ID  : Real;
  AList       : TStringList;

  ACurIndex   : Integer;
  ANewIndex   : Integer;
  I           : Integer;

  function _LoadExisting( ASelectStatement: string ): Boolean;
  var
    I: Integer;
  begin
    with TFDQuery.Create(nil) do
    try
      ConnectionName:= cnstFDConnectionName;
      SQL.Add( ASelectStatement );
      Open;
      I:= 0;
      while not Eof do
      begin
        AList.AddObject( Fields[ 0 ].asString, Pointer( Fields[ 1 ].asInteger ));

        if Fields[ 0 ].asFloat = ASource_ID then
           ACurIndex:= I;

        if Fields[ 0 ].asFloat = ATarget_ID then
           ANewIndex:= I;

        Next;
        Inc(I);
      end;
    finally
      Free;
    end;
    Result:= (ACurIndex > -1) and (ANewIndex > -1);
  end;

begin
  ACurIndex:= -1;
  ANewIndex:= -1;

  {save source id}
  ASource_ID:= ADBGrid.DataSource.Dataset.FieldByName('id').asFloat;

  {make it go to the target}
  AOnMouseDown:= ADBGrid.OnMouseDown;
  ADBGrid.OnMouseDown:= NIL;
  try
    TwwLocalDBGrid(ADBGrid).MouseDown( mbLeft, [ssLeft], FDragDropPoint.X, FDragDropPoint.Y );
    ATarget_ID:= ADBGrid.DataSource.Dataset.FieldByName('id').asFloat;
  finally
    ADBGrid.OnMouseDown:= AOnMouseDown;
  end;

  {load existing}
  AList:= TStringList.Create;
  try
    if ADBGrid = wwDBGridQuestions then
       Result:= _LoadExisting( Format( cnstSQLSelectQuestion, [ QryCertTrainingID.asFloat ]))
    else if ADBGrid = wwDBGridAnswers then
       Result:= _LoadExisting( Format( cnstSQLSelectAnswer, [ QryCertTrainQuestionsID.asFloat ]))
    else
       raise Exception.Create('Unknown wwDBGrid type - operation aborted.');

    if not Result then
       EXIT;

    {move!}
    AList.Move( ACurIndex, ANewIndex );

    {update}
    for I:= 0 to AList.Count - 1 do
      if LongInt(AList.Objects[ I ]) <> I + 1 then
      begin
        if ADBGrid = wwDBGridQuestions then
           ExecuteCommandFmt( cnstSQLUpdateQuestion, [ I+1, AList[ I ] ])
        else if ADBGrid = wwDBGridAnswers then
           ExecuteCommandFmt( cnstSQLUpdateAnswer, [ I+1, AList[ I ] ]);
    end;
  finally
    AList.Free;
  end;

  Reopen(ADBGrid.DataSource.Dataset);
  ADBGrid.DataSource.Dataset.Locate('ID', ASource_ID, []);
end;

end.


