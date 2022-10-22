unit Q_Letter;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  IQMS.Common.UCRPE32,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmQLetter = class(TUniForm)
    Panel1: TUniPanel;
    btnPrint: TUniButton;
    btnNew: TUniButton;
    btnEdit: TUniButton;
    Panel2: TUniPanel;
    btnSetup: TUniButton;
    GroupBox1: TUniGroupBox;
    chkInclReport: TUniCheckBox;
    chkFromTemplate: TUniCheckBox;
    extdocLetters: TIQWebExtDoc;
    SR: TIQWebSecurityRegister;
    Button1: TUniButton;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Bevel1: TUniPanel;
    Label1: TUniLabel;
    wwDBComboDlgQuoteLetterLib: TUniEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
    procedure btnSetupClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure wwDBComboDlgQuoteLetterLibCustomDlg(Sender: TObject);
  private
    { Private declarations }
    Internal_ExtDocs_BeforeDelete: TDataSetNotifyEvent;
    FDoc_Library_ID: Real;

    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure SetDoc_Library_ID(const Value: Real);
    property Doc_Library_ID: Real read FDoc_Library_ID write SetDoc_Library_ID;
  protected
    { Protected declarations }
    FCRWReportName: string;
    FTemplateName : string;
    FArcusto_ID   : Real;
    procedure SetCRWReportName( const AValue: string ); virtual;
    procedure SetTemplateName( const AValue: string ); virtual;
    procedure RestoreFromRegistry; virtual;
    procedure SaveToRegistry; virtual;
    function SuggestedLetterName: string;
    function AssignLetterName( var ALetterName, AOutputName: string ): Boolean;
    procedure CreateCRWReport( const ACRWReportName, AOutputName: string ); virtual;
    procedure DoBeforeDelete( DataSet: TDataSet );
    function FindCRWReportName: string;
  public
    { Public declarations }
    property CRWReportName: string read FCRWReportName write SetCRWReportName;
    property TemplateName : string read FTemplateName  write SetTemplateName ;

    constructor Create( AOwner: TComponent; ADataSource: TDataSource );
  end;

procedure DoQuoteLetter( AOwner: TComponent; ADataSource: TDataSource );

var
  FrmQLetter: TFrmQLetter;

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Web.MicrosoftWord.Utils,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQRepDefVersions,
  iqsecins,
  q_let_su,
  q_letdel,
  qc_doc_share,
  QC_PkLib,
  quote_rscstr;

const
   cUSE_PERMANENT_KEY = TRUE;

procedure DoQuoteLetter( AOwner: TComponent; ADataSource: TDataSource );
begin
  TFrmQLetter.Create( AOwner, ADataSource ).Show;
end;

constructor TFrmQLetter.Create( AOwner: TComponent; ADataSource: TDataSource );
begin
  inherited Create( AOwner );
  with extdocLetters do
  begin
    MasterSource:= ADataSource;
    Active:= TRUE;
    Internal_ExtDocs_BeforeDelete:= ExtDocs.BeforeDelete;
    ExtDocs.BeforeDelete:= DoBeforeDelete;
    ExtNav.ConfirmDelete:= FALSE;
  end;

  if Assigned(ADataSource) and Assigned(ADataSource.DataSet) and Assigned( ADataSource.DataSet.FindField('arcusto_id')) then
     FArcusto_ID:= ADataSource.DataSet.FieldByName('arcusto_id').asFloat;

  RestoreFromRegistry;

  //EIQ-3399 Summary – Engineering Tab -  Custom Quote Letter is reverting back to the stock Qletter report– CRM# 980270. AB 06-16-14
  CRWReportName:= SelectValueFmtAsString( 'select coalesce( (select qletter_report from arcusto where id = %f), '+
                                '                 (select qletter_report from iqsys), '+
                                '                 (''%s'' )) from dual ', [ FArcusto_ID, IQGetReportsPath + 'QLetter.rpt' ]);
end;


procedure TFrmQLetter.FormShow(Sender: TObject);
begin
  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmQLetter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveToRegistry;
  Action:= caFree;
end;

procedure TFrmQLetter.RestoreFromRegistry;
var
  S: string;
  ADoc_Library_ID: Real;
begin
  IQRegFormRead( self, [ self, chkInclReport, chkFromTemplate ]);

//  if IQRegStringScalarRead( self, 'CRWReportName', S, cUSE_PERMANENT_KEY ) and ( S > '') then
//     CRWReportName:= S
//  else CRWReportName:=
//     IQGetReportsPath + 'Qletter.rpt';

  if IQRegStringScalarRead( self, 'TemplateName', S, cUSE_PERMANENT_KEY ) and (S > '') then
     TemplateName:= S
   else
     // TemplateName:= IQGetMasterHomePath + 'IQquote.dot';
     TemplateName:= IQGetReportsPath + 'IQquote.dot';

  if IQRegFloatScalarRead( self, 'Doc_Library_ID', ADoc_Library_ID ) and (ADoc_Library_ID > 0) then
     Doc_Library_ID:= ADoc_Library_ID
   else
     Doc_Library_ID:= qc_doc_share.EnsureDefaultLibraryIDExists;
end;

procedure TFrmQLetter.SaveToRegistry;
begin
//  IQRegStringScalarWrite( self,  'CRWReportName', CRWReportName, cUSE_PERMANENT_KEY );
  IQRegStringScalarWrite( self,  'TemplateName', TemplateName, cUSE_PERMANENT_KEY );
  IQRegFloatScalarWrite( self,  'Doc_Library_ID', Doc_Library_ID );
  IQRegFormWrite( self, [ self, chkInclReport, chkFromTemplate ]);
end;

procedure TFrmQLetter.SetCRWReportName( const AValue: string );
var
  ACaption:String;
begin
  if FCRWReportName <> AValue then
  begin
    FCRWReportName:= AValue;

    ACaption := FindCRWReportName;

    if FileExists( ACaption ) then
       chkInclReport.Caption:= Format(quote_rscstr.cTXT000000034 {'Include %s output'},
         [ ExtractFileName( ACaption )])
    else
       chkInclReport.Caption:= Format(quote_rscstr.cTXT000000035 {'Include %s output (not found)'},
         [ ExtractFileName( ACaption )]);

    self.Repaint; {New Letter options were getting cut off}
  end;
end;

procedure TFrmQLetter.SetTemplateName( const AValue: string );
begin
  if FTemplateName <> AValue then
  begin
    FTemplateName:= AValue;
    if FileExists( FTemplateName ) then
       chkFromTemplate.Caption:= Format(quote_rscstr.cTXT000000036 {'Generate from %s template'},
         [ ExtractFileName( FTemplateName )])
    else
       chkFromTemplate.Caption:= Format(quote_rscstr.cTXT000000037 {'Generate from %s template (not found)'},
         [ ExtractFileName( FTemplateName )])
  end;
end;

procedure TFrmQLetter.btnEditClick(Sender: TObject);
begin
  extdocLetters.ActivateOLELink;
end;

procedure TFrmQLetter.btnSetupClick(Sender: TObject);
var
  S1,S2: string;
begin
  S1:= CRWReportName;
  S2:= TemplateName;
  if GetQLetterParams( S1, S2, FArcusto_ID ) then {Q_Let_SU.pas}
  begin
    CRWReportName:= S1;
    TemplateName := S2;
  end;
end;


procedure TFrmQLetter.btnNewClick(Sender: TObject);
var
  ALetterName : string;
  AOutputName : string;
  AAfterInsert: TDataSetNotifyEvent;
begin
  with extdocLetters, ExtDocs do
  try
    try
      AAfterInsert:= AfterInsert;  {Avoid OpenDialog box}
      AfterInsert := NIL;

      Append;
      if not AssignLetterName( ALetterName, AOutputName ) then
         ABORT;

      AssignDoc_Library( self.FDoc_Library_ID );

      // Jan-13-2003: AttachFile_Ex( ALetterName, Format('Created on %s', [ DateTimeToStr( Now ) ]));
      AttachFile_Ex( ALetterName, ExtractFileName( ALetterName ));

      if chkInclReport.Checked then
      try
         CreateCRWReport( FindCRWReportName, AOutputName );
      except on E:Exception do
         if MessageDlg( E.Message, mtError, [mbCancel, mbIgnore], 0) = mrCancel then
            ABORT;
      end;

      IQMS.Web.MicrosoftWord.Utils.CreateDocumentInsertFile(
        ALetterName,
        sIIf( chkFromTemplate.Checked, FTemplateName, ''),
        sIIf( chkInclReport.Checked,   AOutputName,   ''));
      Post;
    finally
      DeleteFile( AOutputName );
      AfterInsert:= AAfterInsert;
    end;
  except
    if State <> dsBrowse then
       Cancel;
    raise;
  end
end;

procedure TFrmQLetter.CreateCRWReport( const ACRWReportName, AOutputName: string );
var
  ConnectionName   : string;
  cServername    : string;
  cUID           : string;
  cPassword      : string;
  ACrpe          : TCrpe;
  Quote_ID       : Real;
  I              : Integer;
  ACRDotNetObject: Variant;
  CW             : Word;
begin
  if not FileExists( ACRWReportName ) then
     // 'Report %s not found. Please use Setup to assign report'
     raise Exception.CreateFmt(quote_rscstr.cTXT000000038, [ ACRWReportName ]);

  //Connection := MainModule.FDConnection;
  cServername := IQGetServerName;
  cUID        := IQGetUID;
  cPassword   := IQGetPassword;
  Quote_ID    := extdocLetters.MasterSource.DataSet.FieldByName('ID').asFloat;

  CheckDisableFPUExceptions( CW );
  try
    CheckCreateReportObject( ACrpe, ACRDotNetObject, Application );

    SetReportName( ACrpe, ACRDotNetObject, ACRWReportName );

    SetOutput( ACrpe, ACRDotNetObject, Ord(toExport) );

    if chkFromTemplate.Checked or IsCRDotVersion then
      // 10-27-05 Prevents each report field from being framed, like regular RTF does,
      // and overlapping text when inserted into another word doc
      // Note: CR9 doesn't support Editable RTF so we just use plain Text for CR 9.
      SetDestinationToEditableRTF( ACrpe, ACRDotNetObject, AOutputName )
    else
      SetDestinationMSWord( ACrpe, ACRDotNetObject, AOutputName );  //  WordForWindows

    SetReportConnection( ACrpe, ACRDotNetObject, cServerName, cUID, cPassword );

    CheckConfigureDNetRpt( ACRDotNetObject );

    SetSelectionFormula( ACrpe, ACRDotNetObject, IQFormat( '{QUOTE.ID}= %f', [ Quote_ID ]) );

    CheckApplyVerifyDatabase( ACrpe, ACRDotNetObject );

    DoExecuteReport( ACrpe, ACRDotNetObject );
  finally
    CheckFreeCRDotNetObject( ACRDotNetObject );
    CheckFreeCRPEObject( ACrpe );
    CheckRestoreFPU( CW );
  end;
end;

function TFrmQLetter.AssignLetterName( var ALetterName, AOutputName: string ): Boolean;
begin
  with TSaveDialog.Create( self ) do
  try
    Title   := quote_rscstr.cTXT000000039; // 'Enter new quote letter name'
    Filter  := '*.doc|(*.doc)|*.*|(*.*)';
    FileName:= SuggestedLetterName;
    InitialDir:= ExtractFilePath( FileName );
    Result  := Execute;
    if Result then
    begin
       ALetterName:= FileName;
       if (ExtractFileExt( ALetterName ) = '') and (FilterIndex = 1) then
          ALetterName:= ALetterName + '.doc';

       if Doc_Library_ID <> qc_doc_share.EnsureDefaultLibraryIDExists() then
          AOutputName:= IncludeTrailingBackslash(qc_doc_share.DocumentLibraryPath( Doc_Library_ID )) + '_QLetter.rtf'
       else
          AOutputName:= ExtractFilePath( ALetterName ) + '_QLetter.rtf';

       IQRegStringScalarWrite( self, 'ALetterPath', ExtractFilePath( ALetterName ));
    end;
  finally
    Free;
  end;
end;

function TFrmQLetter.SuggestedLetterName: string;
var
  S: string;
  I: Integer;
  ALetterPath: string;
  AFileName:String;
begin
  with extdocLetters do
    S:= Format( '%s_%s', [ MasterSource.DataSet.FieldByName('RFQ').asString,
                               ExtDocs.FieldByName( 'seq' ).asString ]);

  for I:= 1 to Length( S ) do
    if not ( S[ I ] in ['a'..'z', 'A'..'Z', '0'..'9', '_' ]) then
       S[ I ]:= '_';

  if Doc_Library_ID <> qc_doc_share.EnsureDefaultLibraryIDExists() then
     ALetterPath:= qc_doc_share.DocumentLibraryPath( Doc_Library_ID )
  else
     ALetterPath := SelectValueAsString('select quote_letter_file_path from iqsys2 where rownum < 2');

  if ALetterPath = '' then
    begin
      if (IQRegStringScalarRead( self, 'ALetterPath', ALetterPath )) and  (ALetterPath <> '') then
         AFileName:= ALetterPath + S + '.doc'
      else
         AFileName:= IQGetLocalHomePath + S + '.doc';
    end
  else
    begin
      if Copy(ALetterPath, Length(ALetterPath), 1) <> '\' then
        AFileName:= ALetterPath + '\' + S + '.doc'
      else
        AFileName:= ALetterPath + S + '.doc';
    end;

  Result := AFileName;
end;

procedure TFrmQLetter.btnPrintClick(Sender: TObject);
begin
  with extdocLetters, ExtDocs do
  if not ( Eof and Bof ) then
     IQMS.Web.MicrosoftWord.Utils.PrintMSWordDoc( FieldByName('filename').asString );
end;
procedure TFrmQLetter.DoBeforeDelete( DataSet: TDataSet );
var
  ADelFile: Boolean;
begin
  if not QuoteDelConfirm( ADelFile ) then  {Q_LetDel.pas}
     ABORT;

  if Assigned( Internal_ExtDocs_BeforeDelete ) then
     Internal_ExtDocs_BeforeDelete( DataSet );

  if ADelFile then
  begin
    DeleteFile( extdocLetters.ExtDocs.FieldByName('filename').asString );
    PostMessage( Handle, iq_Notify, 0, extdocLetters.ExtDocs.FieldByName('external_doc_id').asInteger );   { attempt to delete external_doc }
  end;
end;

procedure TFrmQLetter.IQNotify( var Msg: TMessage );
begin
  if SelectValueFmtAsFloat('select count(*) from doc_used where external_doc_id = %d', [ Msg.LParam ]) = 0 then
     ExecuteCommandFmt('delete from external_doc where id = %d', [ Msg.LParam ]);
end;

procedure TFrmQLetter.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmQUOTE{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmQLetter.Button1Click(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

function TFrmQLetter.FindCRWReportName: string;
var
  S1, S2 : string;
begin
  S1:= SelectValueFmtAsString('select qletter_report from arcusto where id = %f', [ FArcusto_ID ]);
  if S1 <> '' then
    Result:= IQGetReportsPath + S1;

  S2:= SelectValueAsString('select qletter_report from iqsys');
  if (S2 <> '') and (S1 = '') then
    Result:= IQGetReportsPath + S2;

  if (S1 = '') and (S2 = '')then
    Result:= IQGetReportsPath + 'QLetter.rpt';
end;

procedure TFrmQLetter.wwDBComboDlgQuoteLetterLibCustomDlg(Sender: TObject);
var
  ADoc_Library_ID: Real;
begin
  if QC_PkLib.DoPkList_Doc_Library( ADoc_Library_ID ) then
     Doc_Library_ID:= ADoc_Library_ID;
end;

procedure TFrmQLetter.SetDoc_Library_ID(const Value: Real);
begin
  FDoc_Library_ID := Value;
  wwDBComboDlgQuoteLetterLib.Text:= SelectValueByID('descrip', 'doc_library', FDoc_Library_ID);
end;


end.





