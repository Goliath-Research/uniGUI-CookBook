
{*******************************************************}
{                                                       }
{ This unit handles exporting text files (.TXT)         }
{                                                       }
{*******************************************************}

unit dbtexptx;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Buttons,
  StdCtrls,
  DB,
  Grids,
  DBGrids,
  ComCtrls,
  ExtCtrls,
  dbthiddn,
  DBCtrls,
  ImgList,
  Menus,
  Mask,
  FileCtrl,
  Wwdbigrd,
  Wwdbgrid,
  uniGUIApplication,
  dbtschma,
  Variants,
  IQMS.WebVcl.CaptionPanel,
  SqlExpr,
  DBClient,
  ADODB,
  IQMS.Common.WizardBase,
  System.ImageList,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniImageList,
  uniButton,
  uniBitBtn,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniGroupBox,
  uniMainMenu,
  uniLabel,
  uniPageControl, uniRadioGroup, uniFileUpload;

type
  TFrmIQDBTransExportTextFile = class(TFrmDBTransHidden)
    Panel8: TUniPanel;
    List_Images: TUniImageList;
    PnlPageControl1: TUniPanel;
    pcMain: TUniPageControl;
    TabFormat: TUniTabSheet;
    TabDelimOptions: TUniTabSheet;
    Bevel1: TUniPanel;
    PData: TUniPopupMenu;
    Refresh1: TUniMenuItem;
    PnlFixedText: TUniPanel;
    TabFixedOptions: TUniTabSheet;
    PnlWizardBtnsRight: TUniPanel;
    btnNext: TUniBitBtn;
    btnFinish: TUniBitBtn;
    btnBack: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlFormat: TUniPanel;
    CaptionPanel1: TIQWebCaptionPanel;
    rgTextFormat: TUniRadioGroup;
    PnlDelimOptions: TUniPanel;
    CaptionPanel2: TIQWebCaptionPanel;
    PnlDelimOptionsCtrls: TUniPanel;
    Label2: TUniLabel;
    Label1: TUniLabel;
    cmbDelimiter: TUniComboBox;
    cmbSeparator: TUniComboBox;
    chkHasFieldNames: TUniCheckBox;
    PnlFixedOptions: TUniPanel;
    CaptionPanel3: TIQWebCaptionPanel;
    PnlFixedOptionsGroup: TUniPanel;
    gbFixedOptions: TUniGroupBox;
    Label6: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Label11: TUniLabel;
    UniFileUpload1: TUniFileUpload;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBackClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
    procedure cmbDelimiterChange(Sender: TObject);
    procedure cmbSeparatorChange(Sender: TObject);
    procedure chkHasFieldNamesClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure rgTextFormatClick(Sender: TObject);
    procedure DoCancelBtnClick(Sender: TObject);
  private
    { Private declarations }
    FFixedText: TFixedText;
    //FTargetFile: String;
    FAbort: Boolean;
    FShowProgress: Boolean;
    FDatabaseName: String;
    FSourceTableName: String;
    FFirstRowHasNames: Boolean;
    procedure BuildComboBoxLists;  // we do it his way for Internationalization
    procedure BuildSchemaFile;
    procedure ExportAsFixedText;
    procedure ExportAsDelimitedText;
    procedure SetButtons;

    function GetDelimiter: String;
    function GetSeparator: String;
    function GetFieldSize(AField:TField): Integer;
    function subBuildSchemaFields_Fixed( var ADBSchema: TDBSchema ): Boolean;
    function subBuildSchemaFields_Delim( var ADBSchema: TDBSchema ): Boolean;
    function ShowTextPreview( var AErrorMsg: String ): Boolean;
    procedure UpdateTransferOptions;
    procedure CheckFixedTextCompCreated;
    function CheckApplySchemaFile: Boolean;
  protected
    procedure DoButtonClick( AWizardButton: TWizardBtn ); override; // method for wizard buttons
    function DoProcessExec: Boolean; override; // main method called
  public
    { Public declarations }
    FFormActive: Boolean;
    constructor Create(ATargetFile: String);
    function Execute: Boolean;
  published
    { Protected declarations }
    property SQLConnection;
    property SourceDataset;
    property SourceTableName: String read FSourceTableName write FSourceTableName;
    property Logging;
    property LogFile;
    property ErrorLogFile;

    property DatabaseName: String read FDatabaseName write FDatabaseName;
    property ShowProgress: Boolean read FShowProgress write FShowProgress default True;
    property ProgressMessage;
    property SuppressPrompts;
    property OnProgressEvent;
    property OnCheckProgressAbortedEvent;
    
    property FirstRowHasNames: Boolean read FFirstRowHasNames write FFirstRowHasNames;    
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls,
  IQMS.Common.Numbers,
  IQMS.Common.ProgressDialog,
  IQMS.Common.RecordCount,
  IQMS.Common.StringUtils,
  IQMS.DBTrans.dbtshare,
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.PanelMsg;

constructor TFrmIQDBTransExportTextFile.Create(ATargetFile: String);
var
   ASchemaFile: String;
begin
  FFormActive    := FALSE;
  inherited Create( uniGUIApplication.UniApplication );
  AdjustPageControlToParent( pcMain );      // IQMS.Common.Controls.pas
  DatabaseName := ATargetFile;
  BuildComboBoxLists;
  ShowProgress := True;
end;

procedure TFrmIQDBTransExportTextFile.FormShow(Sender: TObject);
var S: String;
begin
   FFormActive := TRUE;
   
   if not Assigned(SourceDataSet) then
     try
        PnlMain.Visible := FALSE;
        IQError( IQMS.DBTrans.dbtrscstr.cTXT0000045 { 'Application Error:  Source dataset not supplied.'} );
     finally
        Close;   // Call "Exit"
     end
   else
     begin
       CheckFixedTextCompCreated;
       if not CheckApplySchemaFile then
          ShowTextPreview(S);
     end;
end;

procedure TFrmIQDBTransExportTextFile.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FFormActive := FALSE;
end;

function TFrmIQDBTransExportTextFile.Execute: Boolean;
begin
  // This method is called instead of Show.  This reads an existing schema file,
  // and runs the export.

  Result := False;

  // A dataset must be assigned; it will contain the data to export
  if not Assigned(SourceDataSet) then Exit;

  // creates the "fixed text" component
  CheckFixedTextCompCreated;

  // apply the schema file data to the "fixed text" component.  We exit early
  // if this failed.  It will fail, for instance, if no schema file exists.
  if not CheckApplySchemaFile then
     Exit;

  if Assigned(FFixedText) then
     with FFixedText do
      begin
        ShowRuler := True;
        ShowMarkers := ShowRuler;
        Modified  := FALSE;
        RefreshDisplay;
      end;

  // process the file; this method calls 1 of 2 methods for delimited or fixed
  // files.  The methods read the settings established by the CheckApplySchemaFile
  // just called, including settings in the "fixed text" component.
  Result := DoProcessExec;
  
end;

procedure TFrmIQDBTransExportTextFile.UpdateTransferOptions;
begin
  FirstRowHasNames := chkHasFieldNames.Checked;
end;

procedure TFrmIQDBTransExportTextFile.BuildSchemaFile;
var
   i: Integer;
   ASeparators: array of Integer;
   AFieldSizes: array of Integer;
   AFieldName: String;
   ATextFileName: String;
   ADBSchema: TDBSchema;
begin
  // Modify controls
  ATextFileName :=  DatabaseName;
  // Build schema file
  ADBSchema := TDBSchema.Create( uniGUIApplication.UniApplication );
  with ADBSchema do
  try
     Name          := 'dbtschma';
     HasFieldNames := chkHasFieldNames.Checked;
     TextFileName  := ATextFileName;
     SchemaType    := dbtschma.TSchemaType( rgTextFormat.ItemIndex );
     Delimiter     := GetDelimiter;
     Separator     := GetSeparator;

     // See below for these subroutines
     if ( SchemaType = stFixed ) then subBuildSchemaFields_Fixed( ADBSchema )
     else subBuildSchemaFields_Delim( ADBSchema );

  finally
    Free; // free ADBSchema (TDBSchema)
  end;
end;

function TFrmIQDBTransExportTextFile.subBuildSchemaFields_Delim(
  var ADBSchema: TDBSchema): Boolean;
var
   i: Integer;
   AFieldName: String;
begin
   // Subroutine for delimited text files only
   with ADBSchema do
   begin
      if ( SchemaType <> stDelimited ) then
         raise Exception.Create( 'Application Error:  Invalid schema type.' );
      if not SourceDataSet.Active then SourceDataSet.Open;
      SchemaFieldList.Clear; // ensure this is cleared
      for i := 0 to SourceDataSet.FieldCount - 1 do
          SchemaFieldList.AddField( SourceDataSet.Fields[i].FieldName, GetFieldSize(SourceDataSet.Fields[i]));
      SourceDataSet.Close;
      Execute; // create the new schema file
   end;
end;

function TFrmIQDBTransExportTextFile.subBuildSchemaFields_Fixed(
  var ADBSchema: TDBSchema): Boolean;
var
   i: Integer;
   ASeparators: array of Integer;
   AFieldSizes: array of Integer;
   AFieldName: String;
begin
   // Subroutine for fixed text files only
   with ADBSchema do
   begin
     if ( SchemaType <> stFixed ) then
        raise Exception.Create( 'Application Error:  Invalid schema type.' );

        AFieldSizes := FFixedText.GetFieldSizes;
        if not VarIsEmpty(AFieldSizes) and ( VarArrayDimCount(AFieldSizes) <> 0 ) then
           begin
              SchemaFieldList.Clear;
              for i := 0 to High( AFieldSizes ) do
                begin
                   AFieldName := Format( 'FIELD%d', [i+1]);
                   SchemaFieldList.AddField( AFieldName, AFieldSizes[i] );
                end;
           end;
        if SourceDataSet.Active then SourceDataSet.Close; // must close first
        Execute; // create schema file
   end;
end;

procedure TFrmIQDBTransExportTextFile.DoButtonClick(AWizardButton: TWizardBtn);
var i: Integer;
begin
     Invalidate;
     case AWizardButton of
        wbPrior :
           begin
                i := pcMain.ActivePageIndex - 1;
                if ( pcMain.ActivePage = TabFixedOptions ) then
                   pcMain.ActivePage := TabFormat
                else if ( i >= 0 ) then pcMain.ActivePageIndex := i;
           end;
        wbNext  :
           begin
              i := pcMain.ActivePageIndex + 1; // next index
              if ( pcMain.ActivePage = TabFormat ) then
                 begin
                      if ( rgTextFormat.ItemIndex = 1 ) then // fixed
                         pcMain.ActivePage := TabFixedOptions
                      else pcMain.ActivePage := TabDelimOptions;
                 end
              else if ( pcMain.ActivePage = TabDelimOptions ) and
                 ( rgTextFormat.ItemIndex = 0 ) then
                 begin
                 // do nothing
                 end
              else if ( i <= pcMain.PageCount ) then pcMain.ActivePageIndex := i;
           end;
        wbFinish:
           begin
                UpdateTransferOptions;
                BuildSchemaFile;
                DoProcessExec;
           end;
     end;

     SetButtons;

     if Assigned( FFixedText ) then
        begin
             FFixedText.ShowRuler := ( rgTextFormat.ItemIndex = 1 ) and ( pcMain.ActivePage = TabFixedOptions );
             FFixedText.ShowMarkers := FFixedText.ShowRuler;
        end;
end;

procedure TFrmIQDBTransExportTextFile.SetButtons;
begin
     btnBack.Enabled   := ( pcMain.ActivePageIndex > 0 ); // and ( pcSchemaOptions.ActivePageIndex > 0 );
     btnNext.Enabled   := ( pcMain.ActivePageIndex < 1 );
     btnFinish.Enabled := ( pcMain.ActivePageIndex in [1..3] );
end;

procedure TFrmIQDBTransExportTextFile.btnBackClick(Sender: TObject);
begin
     DoButtonClick( wbPrior );
end;

procedure TFrmIQDBTransExportTextFile.btnNextClick(Sender: TObject);
begin
     DoButtonClick( wbNext );
end;

procedure TFrmIQDBTransExportTextFile.btnFinishClick(Sender: TObject);
begin
     DoButtonClick( wbFinish );
end;

function TFrmIQDBTransExportTextFile.DoProcessExec: Boolean;
var
   AErrorMsg: String;
begin
  // NOTE:  This method will use the existing schema file if the data file
  //        is a text file.  It can be called without executing the wizard
  //        if if the data file and, for text files, the schema file exist.
  //        Point is, we can use this method without displaying an interface,
  //        except for maybe a picklist.
  try
     Hide;

     // Export file.  See subroutines for details.
     if rgTextFormat.ItemIndex = 0 then
        ExportAsDelimitedText
     else
        ExportAsFixedText;

     // We close the application to prevent the user from click the back button
     // or from running another import for this session.
     Close;                 // close form, since process is done
     ModalResult := mrOk;   // close this COM executable to release cursor to the BDE
                            // NOTE: if we don't release connection to BDE, then an error
                            //       may occur if user tries to import another file during
                            //       this session:  ORA-00904: invalid column name.
     Result := TRUE;

     // write to log file
     if Logging then
        WriteToLog(Format('Exported table, %s, to ASCII file, "%s".',
         [SourceTableName, DatabaseName]));

  except on E:Exception do
    try
       {if ( E is EDBEngineError ) then
          begin
             with ( E as EDBEngineError ) do
                if Errors[ ErrorCount - 1 ].NativeError = 904 then // Invalid field name.  ORA-00904: Invalid column name.
                   AErrorMsg := IQMS.DBTrans.dbtrscstr.cTXT0000046 // 'Could not open source dataset.'
                 //'Could not open source dataset:'#13'%s'
                else AErrorMsg := Format(IQMS.DBTrans.dbtrscstr.cTXT0000047, [E.Message] );
          end
       else}
       AErrorMsg := E.Message;

       if not SuppressPrompts then
          IQError(AErrorMsg);

       if Logging then
          begin
            WriteToErrorLog(AErrorMsg);
            WriteToLog(Format('Encountered error exporting to %s:'#13#13'%s',
             [DatabaseName, AErrorMsg]));
          end;
    finally
       ModalResult := mrCancel;
    end;
  end;
end;

procedure TFrmIQDBTransExportTextFile.ExportAsDelimitedText;
var
  AMax, ACount, I: Integer;
  AFileStream: TStream;
  ALine, AText, ADelim, ASep: string;
  APrg: TIQWebProgressDialog;
begin
  // Initialization
  AMax := 0;
  ACount := 0;
  AFileStream := NIL;
  APrg := NIL;
  
  try
      AMax := GetRecordCount;

      // Do we show a progress dialog?
      if ShowProgress and (AMax > 0) and (ProgressMessage > '') then
         begin
           // create and initialize the progress dialog
           APrg := TIQWebProgressDialog.Create(Application); // IQMS.Common.ProgressDialog.pas
           APrg.MinProgress := 0;
           APrg.MaxProgress := AMax;
           APrg.Caption     := IQMS.DBTrans.dbtrscstr.cTXT0000057; // 'Import'
           APrg.Execute;

           APrg.CancelBtn.OnClick := DoCancelBtnClick;
           APrg.Status1     := ProgressMessage; 
           APrg.Status2     := '';

           Application.ProcessMessages;

         end;

     if Assigned(OnProgressEvent) then
        OnProgressEvent(AMax, 0, ProgressMessage);

     // get values
     ADelim := GetDelimiter; // offsets text
     ASep   := GetSeparator; // separates fields

     // Create text file
     AFileStream := TFileStream.Create(DatabaseName, fmCreate);

     // initialize
     AText := '';


     // open the dataset
     if not SourceDataSet.Active then
        SourceDataSet.Open;

     // Column Headers
     if FirstRowHasNames then
        begin
          for I:= 0 to SourceDataSet.FieldCount-1 do
              begin
                   if not SourceDataSet.Fields[I].Visible then CONTINUE;
                   if ALine > '' then
                      ALine:= ALine + ASep + ADelim + SourceDataSet.Fields[I].DisplayLabel + ADelim
                   else ALine := ADelim + SourceDataSet.Fields[I].DisplayLabel + ADelim;
              end;
          ALine := ALine + #13#10;
          AFileStream.WriteBuffer(Pointer(ALine)^, Length(ALine));
        end;

     // first record; start looping
     SourceDataSet.First;

     // Loop through the records
     while not SourceDataSet.EOF do
     begin

       // initialize variable
       ALine:= '';

       // check if the process was aborted
       if IQMS.Common.ProgressDialog.CheckProcessAborted(APrg, FAbort) then
          Break;
          
       if Assigned(OnCheckProgressAbortedEvent) and
          OnCheckProgressAbortedEvent then
          begin
            FAbort := True;
            Break;
          end;
          
       // Loop through the fields
       for I:= 0 to SourceDataSet.FieldCount-1 do
           begin
             if not SourceDataSet.Fields[I].Visible then CONTINUE;
             // Get field text
             if SourceDataSet.Fields[I].DataType in [ftString, ftMemo, ftFixedChar, ftWideString] then
                AText := ADelim + SourceDataSet.Fields[I].AsString + ADelim
             else AText := SourceDataSet.Fields[I].AsString;
             // Add field text to line
             if ALine > '' then ALine:= ALine + ASep + AText
             else ALine:= AText;
           end;

       // append new line char
       ALine:= ALine + #13#10;

       // Write line to file
       AFileStream.WriteBuffer(Pointer(ALine)^, Length(ALine));


       // next record in dataset
       SourceDataSet.Next;

       Inc(ACount);

       // step progress
       if Assigned(APrg) then
          APrg.StepProgress;

       if Assigned(OnProgressEvent) then
          OnProgressEvent(AMax, ACount, ProgressMessage);

       Application.ProcessMessages;

     end;

  finally
    AFileStream.Free;
    if Assigned(APrg) then FreeAndNil(APrg);
  end;
end;

procedure TFrmIQDBTransExportTextFile.ExportAsFixedText;
var
   AMax, ACount, I, APad: Integer;
   AFileStream: TStream;
   ALine, AText: string;
   AMarks: Array of Integer;
   APrg: TIQWebProgressDialog;
begin
   // Export Fixed Text file

   // Initialization
   APrg := NIL;
   AMax := 0;
   ACount := 0;
   
   try

      // Do we show a progress dialog?
      AMax := GetRecordCount;

      if ShowProgress and (AMax > 0) and (ProgressMessage > '') then
         begin
           // create and initialize the progress dialog
           APrg := TIQWebProgressDialog.Create(Application); // IQMS.Common.ProgressDialog.pas
           APrg.MinProgress := 0;
           APrg.MaxProgress := AMax;
           APrg.Caption     := IQMS.DBTrans.dbtrscstr.cTXT0000057; // 'Import'
           APrg.Execute;

           APrg.CancelBtn.OnClick := DoCancelBtnClick;
           APrg.Status1     := ProgressMessage;
           APrg.Status2     := '';

           Application.ProcessMessages;

         end;


      if Assigned(OnProgressEvent) then
         OnProgressEvent(AMax, 0, ProgressMessage);

      // Create text file
      AFileStream := TFileStream.Create(DatabaseName, fmCreate);
      AText := '';
      SetLength(AMarks, FFixedText.RulerMarkerList.Count );
      AMarks:= FFixedText.GetFieldSizes;

      // Must open dataset at this point
      if not SourceDataSet.Active then SourceDataSet.Open;
      
      // Ensure same count
      if (SourceDataSet.FieldCount <> High(AMarks)+1) then
         raise Exception.Create( 'Application Error:  Field count does not match separator count.' );


      // Column Headers
      if FirstRowHasNames then
         begin
           for I:= 0 to SourceDataSet.FieldCount-1 do
               begin
                 if not SourceDataSet.Fields[I].Visible then CONTINUE;
      
                 // 03/27/2008 Remmed - I don't know why these 2 lines were here...
                 //if i = 0 then APad := AMarks[i]
                 //else APad := AMarks[i]-AMarks[i-1];
      
                 APad := AMarks[i];
      
                 if ALine > '' then
                    ALine:= ALine + PadR(SourceDataSet.Fields[I].DisplayLabel, APad)
                 else ALine := PadR(SourceDataSet.Fields[I].DisplayLabel, APad);
      
               end;
           ALine := ALine + #13#10;
           AFileStream.WriteBuffer(Pointer(ALine)^, Length(ALine));
         end;

      SourceDataSet.First;

      // Loop through the records
      while not SourceDataSet.EOF do
      begin
      
        // initialize variable
        ALine:= '';
      
        // check if the process was aborted
        if IQMS.Common.ProgressDialog.CheckProcessAborted(APrg, FAbort) then
           BREAK;

       if Assigned(OnCheckProgressAbortedEvent) and
          OnCheckProgressAbortedEvent then
          begin
            FAbort := True;
            Break;
          end;

        // Loop through the fields
        for I:= 0 to SourceDataSet.FieldCount-1 do
            begin
              if not SourceDataSet.Fields[I].Visible then CONTINUE;
      
              // 03/27/2008 Remmed - I don't know why these 2 lines were here...
              //if i = 0 then APad := AMarks[i]
              //else APad := AMarks[i]-AMarks[i-1];
      
              APad := AMarks[i];
      
              // Get field text
              AText := PadR(SourceDataSet.Fields[I].AsString, APad);
              // Add field text to line
              if ALine > '' then ALine:= ALine + AText
              else ALine:= AText;
            end;
      
        // append new line char
        ALine:= ALine + #13#10;
         
        // Write line to file
        AFileStream.WriteBuffer(Pointer(ALine)^, Length(ALine));
      
        // next record in dataset
        SourceDataSet.Next;

        Inc(ACount);

        // step progress
        if Assigned(APrg) then
           APrg.StepProgress;

        if Assigned(OnProgressEvent) then
           OnProgressEvent(AMax, ACount, ProgressMessage);

        Application.ProcessMessages;
        
      end;
  finally
    AFileStream.Free;
    if Assigned(APrg) then FreeAndNil(APrg);
  end;
end;

procedure TFrmIQDBTransExportTextFile.cmbDelimiterChange(Sender: TObject);
var S: String;
begin
     if FFormActive = FALSE then Exit;
     ShowTextPreview(S);
end;

procedure TFrmIQDBTransExportTextFile.cmbSeparatorChange(Sender: TObject);
var S: String;
begin
     if FFormActive = FALSE then Exit;
     ShowTextPreview(S);
end;

procedure TFrmIQDBTransExportTextFile.chkHasFieldNamesClick(Sender: TObject);
var S: String;
begin
     ShowTextPreview(S);
     // Do not allow user to change field names
     // We are ready to import file at this point
     btnFinish.Enabled := chkHasFieldNames.Checked;
     btnNext.Enabled   := not chkHasFieldNames.Checked;
end;

procedure TFrmIQDBTransExportTextFile.BuildComboBoxLists;
begin
     // Delimiter
     with cmbDelimiter do
     try
        OnChange := NIL;
        Items.Clear;
        Items.Add( IQMS.DBTrans.dbtrscstr.cTXT0000005 ); // <None>
        Items.Add( '"' );
        Items.Add( '''' );
     finally
        OnChange := cmbDelimiterChange;
     end;

     // Separator
     with cmbSeparator do
     try
        OnChange := NIL;
        Items.Clear;
        Items.Add( IQMS.DBTrans.dbtrscstr.cTXT0000005 ); // <None>
        Items.Add( IQMS.DBTrans.dbtrscstr.cTXT0000008 ); // Comma
        Items.Add( '|' );
        Items.Add( IQMS.DBTrans.dbtrscstr.cTXT0000007 ); // Semicolon
        Items.Add( IQMS.DBTrans.dbtrscstr.cTXT0000006 ); // Tab Character
     finally
        OnChange := cmbSeparatorChange;
     end;
end;

function TFrmIQDBTransExportTextFile.ShowTextPreview( var AErrorMsg: String): Boolean;
const
    cMaxCount = 11;
var
   i, ACount, ASize, AFromLeft: Integer;
   S, AFieldText, ADelim, ASep: String;
   ATemp: TStringList;

   ARecords: TStringList;
   AFieldSizes: Array of Integer;
begin
   // This method creates the TFixedText object which shows the file's text
   // We use this component, and not the TMemo or TRichEdit component because
   // if the lines are too long, the standard components will wrap the text.
   // Also, the TFixedText component includes a ruler and allows the user to
   // specify fixed field spacing.

   // The method returns TRUE, if the file was opened and the text displayed.
   // The method returns FALSE, if an error was encountered.

   // An error will occur if the text file cannot be open by the
   // TTable or the file cannot be opened.

   try
      try
         // Initialization
         AErrorMsg := '';
         ARecords:= TStringList.Create;
         ADelim := '';
         ASep   := ''; // default to 2 spaces

         if rgTextFormat.ItemIndex = 0 then
            begin
               ADelim := GetDelimiter;
               ASep   := GetSeparator;
            end;

         // Get marks array
         SetLength(AFieldSizes, 0);
         SetLength(AFieldSizes, SourceDataSet.FieldCount);
         AFromLeft := 0;
         for i := 0 to SourceDataSet.FieldCount - 1 do
           begin
              // data by type
              ASize := GetFieldSize( SourceDataSet.Fields[i] );
              AFromLeft := AFromLeft + ASize;
              AFieldSizes[i] := AFromLeft;
           end;

         try
            ATemp:= TStringList.Create;
            if not SourceDataSet.Active then SourceDataSet.Open;
            SourceDataSet.First;
            ACount := 0;
            while not SourceDataSet.EOF do
             begin
                ATemp.Clear;
                S := '';

                // Get the text from all fields for this row
                for i := 0 to SourceDataSet.FieldCount - 1 do
                  begin
                     ASize := GetFieldSize(SourceDataSet.Fields[i]);

                     // data by type
                     if (ACount=0) and chkHasFieldNames.Checked then
                        begin
                           if rgTextFormat.ItemIndex=0 then
                              begin
                                 AFieldText := ADelim + SourceDataSet.Fields[i].FieldName + ADelim;
                              end
                           else
                              begin
                                 AFieldText := PadR(SourceDataSet.Fields[i].FieldName, ASize);
                                 AFieldText := LeftStr(AFieldText, ASize);
                              end;
                        end
                     else
                        begin
                           case SourceDataSet.Fields[i].DataType of
                              ftString, ftFixedChar, ftWideString, ftMemo, ftFmtMemo:
                                begin
                                   if rgTextFormat.ItemIndex=0 then
                                      begin
                                         AFieldText := ADelim + SourceDataSet.Fields[i].AsString + ADelim;
                                      end
                                   else
                                      begin
                                         AFieldText := PadR(SourceDataSet.Fields[i].AsString, ASize);
                                         AFieldText := LeftStr(AFieldText, ASize);
                                      end;
                                end;
                              ftSmallint, ftInteger, ftWord, ftBytes, ftVarBytes,
                              ftFloat, ftCurrency, ftAutoInc, ftLargeint:
                                begin
                                   AFieldText:= Format( '%s', [ SourceDataSet.Fields[i].AsString ] );
                                   if rgTextFormat.ItemIndex=1 then
                                      begin
                                         AFieldText := PadR(SourceDataSet.Fields[i].AsString, ASize);
                                         AFieldText := LeftStr(AFieldText, ASize);
                                      end;
                                end;
                              ftDate, ftTime, ftDateTime:
                                begin
                                   if SourceDataSet.Fields[i].AsDateTime <= 1 then
                                      AFieldText := '' // return the word NULL, not in quotes
                                   else
                                      AFieldText:= FormatDateTime( 'c', SourceDataSet.Fields[i].AsDateTime );

                                   if rgTextFormat.ItemIndex=1 then
                                      begin
                                         AFieldText := PadR(SourceDataSet.Fields[i].AsString, ASize);
                                         AFieldText := LeftStr(AFieldText, ASize);
                                      end;
                                end;
                           end;
                        end;
                    // Add to the line 
                    S := sIIf( i=0, AFieldText, S + ASep + AFieldText );
                  end;


                ARecords.Add(S);
                SourceDataSet.Next;
                Inc(ACount);
                if ACount > cMaxCount then BREAK;
             end;
          finally
             if Assigned(ATemp) then FreeAndNil(ATemp);
          end;

         // Ensure TFixedText created
         CheckFixedTextCompCreated;

         // Apply values and settings
         if Assigned(FFixedText) then
         with FFixedText  do
           begin
             Lines.Clear;
             Lines.AddStrings(ARecords);
             ApplyList;
             if rgTextFormat.ItemIndex = 1 then SetMarksArray(AFieldSizes)
             else ClearMarkers;
             ShowRuler := ( pcMain.ActivePage = TabFixedOptions );
             ShowMarkers := ShowRuler;
             Modified  := FALSE;
             RefreshDisplay;
           end;



         Result := TRUE; // success

         finally
            if Assigned(ARecords) then FreeAndNil(ARecords);
         end;
   except on E:Exception do
     begin
        AErrorMsg := E.Message;
        Result := FALSE;
     end;
   end;
end;

procedure TFrmIQDBTransExportTextFile.CheckFixedTextCompCreated;
begin
  // Ensure TFixedText created
  if not Assigned( FFixedText ) then
     begin
        FFixedText := TFixedText.Create(Self);
        with FFixedText  do
           begin
              Parent := PnlFixedText;
              Name   := 'FixedText';
              Caption := '';
              Align  := alClient;
              AllowAddMarker := FALSE;    // do not allow when exporting
              AllowDeleteMarker := FALSE; // do not allow when exporting
              AllowMoveMarker := FALSE;   // do not allow when exporting
              ParentBackground := False;
              Tag := 1999;
           end;
     end;
end;

function TFrmIQDBTransExportTextFile.CheckApplySchemaFile: Boolean;
var
   ADBSchema: TDBSchema;
   ASchemaFile, S: String;
   i: Integer;
   ev: TNotifyEvent;
begin
  Result := False;
  // the schema file name must be provided; the data file doesn't have to exist,
  // but the schema file does.
  if (DatabaseName > '') then
     begin
       GetSchemaFileName(DatabaseName, ASchemaFile);
       if (ASchemaFile > '') and FileExists(ASchemaFile) then
       begin
         // Build schema file
         ADBSchema := TDBSchema.Create( Self );
         with ADBSchema do
         try
            Name := 'dbtschma_1';
            Result := LoadSchemaFile(ASchemaFile);
            if not Result then Exit;

            ev := rgTextFormat.OnClick;
            rgTextFormat.OnClick := NIL;

            chkHasFieldNames.Checked := HasFieldNames;
            //TextFileName  := ATextFileName;
            //SchemaType    := TSchemaType( rgTextFormat.ItemIndex );
            rgTextFormat.ItemIndex := Ord(SchemaType);
            Delimiter     := GetDelimiter;
            Separator     := GetSeparator;

            ShowTextPreview(S);

            if Assigned(FFixedText) then
               begin
                 // add markers
                 if (SchemaFieldList.Count > 0) and (SchemaType = stFixed) then
                    begin
                      // clear the markers
                      FFixedText.ClearMarkers;

                      // add the new markers
                      for i := 0 to SchemaFieldList.Count - 1 do
                       if TSchemaField(SchemaFieldList.Items[i]).FieldOffset > 0 then
                          FFixedText.AddRulerMarker(TSchemaField(SchemaFieldList.Items[i]).FieldOffset);
                    end;

                 // show/hide the markers, as needed
                 with FFixedText do
                  begin
                    ShowRuler := ( pcMain.ActivePage = TabFixedOptions );
                    ShowMarkers := ShowRuler;
                    RefreshDisplay;
                  end;

               end;

         finally
            Free; // free ADBSchema (TDBSchema)
            rgTextFormat.OnClick := ev;
         end;

         SetButtons;

       end;
     end;
end;

procedure TFrmIQDBTransExportTextFile.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmIQDBTransExportTextFile.rgTextFormatClick(Sender: TObject);
var S: String;
begin
     ShowTextPreview(S);
end;

function TFrmIQDBTransExportTextFile.GetDelimiter: String;
begin
     // Get the delimiter, based on user selection
     // A "delimiter" is a character that surrounds text (by contrast to numbers)
     // in the text data
     Result := sIIf(( cmbDelimiter.Text = IQMS.DBTrans.dbtrscstr.cTXT0000005 {<None>} ), '', cmbDelimiter.Text );
end;

function TFrmIQDBTransExportTextFile.GetSeparator: String;
begin
     // Get the separator, based on user selection
     // A "separator" is a character that separates fields from each other
          if cmbSeparator.Text = IQMS.DBTrans.dbtrscstr.cTXT0000006 then Result := #9 // Tab Character
     else if cmbSeparator.Text = IQMS.DBTrans.dbtrscstr.cTXT0000007 then Result := ';' // Semicolon
     else if cmbSeparator.Text = IQMS.DBTrans.dbtrscstr.cTXT0000008 then Result := ',' // Comma
     else if cmbSeparator.Text = IQMS.DBTrans.dbtrscstr.cTXT0000005 then Result := '' // <None>
     else Result := cmbSeparator.Text ;
end;

function TFrmIQDBTransExportTextFile.GetFieldSize(AField: TField): Integer;
begin
     Result := 0;
     if AField=NIL then Exit;
     Result := AField.Size;
     if Result = 0 then Result := 18
     else if Result = 1 then Result := 2;
end;

procedure TFrmIQDBTransExportTextFile.DoCancelBtnClick(Sender: TObject);
begin
  FAbort := TRUE;
end;

end.


