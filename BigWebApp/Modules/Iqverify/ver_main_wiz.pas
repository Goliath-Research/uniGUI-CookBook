unit ver_main_wiz;

interface

uses
  MainModule,
//  IQRepDef,
  IQMS.WebVcl.About,
//  Iqhpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniEdit,
  uniDBEdit,
  uniLabel,
  uniPageControl,
  uniPanel,
  uniScrollBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniComboBox,
  uniDBComboBox,
  uniButton,
  uniBitBtn,
  uniDBGrid,
  uniSpeedButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.HPick, IQMS.WebVcl.RepDef,
  uniMainMenu, Vcl.Graphics, Vcl.ComCtrls, uniGUIFrame, IQUniGrid, Vcl.Dialogs, Vcl.Controls,
  Vcl.Forms, Vcl.Menus, Data.DB, System.Classes, System.SysUtils, uniBasicGrid,
  uniStringGrid;

type
  TWizardBtn = ( wbPrior, wbNext, wbFinish );

  TFrmVerMainWizard = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    SrcColumn: TDataSource;
    TblColumn: TFDTable;
    SrcCondition: TDataSource;
    TblCondition: TFDTable;
    SrcSegment: TDataSource;
    TblSegment: TFDTable;
    TblColumnID: TBCDField;
    TblColumnTABLE_NAME: TStringField;
    TblColumnCOLUMN_NAME: TStringField;
    TblConditionID: TBCDField;
    TblConditionVERIFY_COLUMN_ID: TBCDField;
    TblConditionCONDITION_COLUMN: TStringField;
    TblConditionCONDITION_VALUE: TStringField;
    TblSegmentID: TBCDField;
    TblSegmentVERIFY_COLUMN_ID: TBCDField;
    TblSegmentSTART_POS: TBCDField;
    TblSegmentLENGTH: TBCDField;
    TblSegmentVAL_HIGH: TBCDField;
    TblSegmentVAL_LOW: TBCDField;
    QryUserTables: TFDQuery;
    QryUserCols: TFDQuery;
    QryUserTablesTABLE_NAME: TStringField;
    QryUserColsCOLUMN_NAME: TStringField;
    QryUserColsDATA_TYPE: TStringField;
    QryUserColsDATA_LENGTH: TFMTBCDField;
    QryUserColsDATA_PRECISION: TFMTBCDField;
    QryUserColsNULLABLE: TStringField;
    PnlMain: TUniPanel;
    pcMain: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    TabSheet3: TUniTabSheet;
    TabFinish: TUniTabSheet;
    PnlColumn: TUniPanel;
    PnlCondition: TUniPanel;
    Bevel1: TUniPanel;
    PnlConditionToolbar: TUniPanel;
    NavCondition: TUniDBNavigator;
    PnlConditionGrid: TUniPanel;
    GridCondition: TIQUniGridControl;
    cmbGridConditionColumnName: TUniDBLookupComboBox;
    Panel5: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Panel2: TUniPanel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    cmbTableName: TUniDBLookupComboBox;
    cmbColumnName: TUniDBLookupComboBox;
    Label9: TUniLabel;
    Label10: TUniLabel;
    SrcValue: TDataSource;
    TblValue: TFDTable;
    TblValueVALUE: TStringField;
    TblValueID: TBCDField;
    TblValueVERIFY_SEGMENT_ID: TBCDField;
    PnlMenu: TUniPanel;
    Splitter1: TUniSplitter;
    lstMenu: TUniStringGrid;
    PkColumn: TIQWebHPick;
    PkColumnID: TBCDField;
    PkColumnTABLE_NAME: TStringField;
    PkColumnCOLUMN_NAME: TStringField;
    Panel3: TUniPanel;
    Label7: TUniLabel;
    Label13: TUniLabel;
    TblSegmentSEQ: TBCDField;
    TblSegmentNAME: TStringField;
    Bevel5: TUniPanel;
    PnlSegmentDisplay: TUniPanel;
    PnlSegmentGrids: TUniPanel;
    PnlSegment: TUniPanel;
    Bevel3: TUniPanel;
    PnlSegmentToolbar: TUniPanel;
    sbtnMoveUp: TUniSpeedButton;
    sbtnMoveDown: TUniSpeedButton;
    NavSegment: TUniDBNavigator;
    PnlSegmentGrid: TUniPanel;
    GridSegment: TIQUniGridControl;
    Panel7: TUniPanel;
    Label11: TUniLabel;
    PnlValue: TUniPanel;
    Panel8: TUniPanel;
    Label12: TUniLabel;
    Panel6: TUniPanel;
    PnlDisplayOuter: TUniPanel;
    PnlDisplay: TUniPanel;
    sbDisplay: TUniScrollBox;
    PnlRuler: TUniPanel;
    Panel4: TUniPanel;
    Label8: TUniLabel;
    Bevel4: TUniPanel;
    Splitter2: TUniSplitter;
    PnlPcValues: TUniPanel;
    pcValues: TUniPageControl;
    TabNumber: TUniTabSheet;
    TabText: TUniTabSheet;
    PnlValueToolbar: TUniPanel;
    NavValue: TUniDBNavigator;
    Bevel2: TUniPanel;
    PnlValueGrid: TUniPanel;
    GridValue: TIQUniGridControl;
    Label14: TUniLabel;
    dbeValHigh: TUniDBEdit;
    Label15: TUniLabel;
    dbeValLow: TUniDBEdit;
    TblSegmentTYPE: TBCDField;
    cmbValueType: TUniDBComboBox;
    TblColumnTRIGGER_NAME: TStringField;
    sbtnCheckMask: TUniSpeedButton;
    TblSegmentALLOW_NULL: TStringField;
    Panel9: TUniPanel;
    btnCancel: TUniBitBtn;
    btnBack: TUniBitBtn;
    btnNext: TUniBitBtn;
    btnFinish: TUniBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryUserColsBeforeOpen(DataSet: TDataSet);
    procedure cmbColumnNameDropDown(Sender: TObject);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure btnFinishClick(Sender: TObject);
    procedure lstMenuChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure btnBackClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure PkColumnIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure SrcSegmentDataChange(Sender: TObject; Field: TField);
    procedure sbtnMoveUpClick(Sender: TObject);
    procedure sbtnMoveDownClick(Sender: TObject);
    procedure TblSegmentNewRecord(DataSet: TDataSet);
    procedure DoSegmentDataSetAfterPost(DataSet: TDataSet);
    procedure TblValueBeforePost(DataSet: TDataSet);
    procedure cmbValueTypeChange(Sender: TObject);
    procedure TblSegmentBeforePost(DataSet: TDataSet);
    procedure TblColumnBeforePost(DataSet: TDataSet);
    procedure TblColumnAfterPost(DataSet: TDataSet);
    procedure sbtnCheckMaskClick(Sender: TObject);
    procedure DoSegmentClick(Sender: TObject);
    procedure GridConditionDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    FID:Real;
    FFormActive: Boolean;
    procedure Startup;
    procedure SetCaption;
    procedure SetControls;
    procedure BuildMenu;
    procedure DoButtonClick( AWizardButton: TWizardBtn ); // method for wizard buttons
    function AllowChangeMenu( ACurrentIndex, ATargetIndex: Integer ): Boolean; // Allow change?
    function ChangeMenu( ACurrentIndex, ATargetIndex: Integer ): Boolean; // Allow change?
    procedure lstMenuSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure SyncPageIndex;
    function ValidatePageBeforeEnter( APage: Integer ): Boolean;
    function ValidatePageBeforeExit( APage: Integer ): Boolean;
    procedure SetPageCheckBox( APage: Integer; AChecked: Boolean );
    procedure PostAllDataSets;
    procedure DoFinishAction;

    procedure UpdateCurrentMaskPreview;
    procedure PaintSegment( AText: String; ALeft: Integer; ABrushColor, AFontColor: TColor;
      var AFormattedWidth: Integer; AID: LongInt = 0 );
    function CheckValidMask: Boolean;

    function CreateTrigger: Boolean; // TRUE = success
    function IQVTriggerExistsFor( ATableName, AColumnName: String ): Boolean;

    // final validation of the mask
    function ValidateMask: Boolean;
    function Overlapping: Boolean;
    function SubCheckPosition( ASeq, AStart, ALen: Integer ):Integer;
    function GapsInTheMask: Boolean;
    function SubCheckForGaps( AStart:Integer ): Integer;
    function GapsInAllowNull: Boolean;
    function GetID: Real;
    procedure SetID(const Value: Real);


  public
    { Public declarations }
    class procedure DoEditIQVerify(AID: Real);
    class procedure DoNewIQVerify;

    property ID : Real read GetID write SetID;
  end;

implementation

{$R *.DFM}

uses
//  iqctrl,
  IQMS.Common.DataLib,
//  iqmesg,
//  iqregfrm,
//  IQMS.Common.Strings,
  IQMS.Common.StringUtils,
  iqverify_rscstr,
  IQMS.Common.TableSequence;

class procedure TFrmVerMainWizard.DoEditIQVerify(AID: Real );
var
   frm : TFrmVerMainWizard;
begin
   frm    := TFrmVerMainWizard.Create(uniGUIApplication.UniApplication);
   with frm do
   begin
     ID := AID;
     FFormActive := FALSE;
     Startup;

     if ID > 0 then
         begin
              TblColumn.Locate( 'ID', ID, [] );
              UpdateCurrentMaskPreview;
         end
     else
         begin
              with PkColumn do
               if Execute then
                  begin
                       if NewResultValue then TblColumn.Insert
                       else TblColumn.Locate( 'ID', GetValue('ID'), [] );
                  end
               else Exit; //PostMessage( Self.Handle, wm_Command, Exit1.Command, 0 );   // Call "Exit"
         end;
   end;
   frm.Show;
end;

class procedure TFrmVerMainWizard.DoNewIQVerify;
var
   frm : TFrmVerMainWizard;
begin
   frm    := TFrmVerMainWizard.Create(uniGUIApplication.UniApplication);
   with frm do
   begin
     FFormActive := FALSE;
     Startup;
     TblColumn.Insert;
   end;
   frm.Show;
end;

procedure TFrmVerMainWizard.FormShow(Sender: TObject);
begin
     FFormActive := TRUE;
     SrcSegmentDataChange(NIL,NIL);
end;

procedure TFrmVerMainWizard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FFormActive := FALSE;
//     RestoreForm(Self); // iqctrl.pas
//     IQRegFormWrite( Self, [ Self,
//                             GridCondition, GridSegment, GridValue
//                              ] ); // iqregfrm
//     Action := caFree;
end;

procedure TFrmVerMainWizard.Startup;
begin

//     CenterForm(Self); // iqctrl.pas
     SetCaption;
//     AdjustPageControlToParent( pcMain );
//     AdjustPageControlToParent( pcValues );
     IQSetTablesActive( FALSE, Self );
     IQSetTablesActive( TRUE, Self );
     BuildMenu;
     SetControls;
//     IQRegFormRead( Self, [ Self,
//                            GridCondition, GridSegment, GridValue
//                             ] ); // iqregfrm
end;

procedure TFrmVerMainWizard.SetCaption;
begin
     Caption := iqverify_rscstr.cTXT0000001; // IQVerify
end;

procedure TFrmVerMainWizard.SetControls;
begin
     // Wizard Vcl.Buttons
     btnBack.Enabled   := ( pcMain.ActivePageIndex > 0 );
     btnNext.Enabled   := ( pcMain.ActivePageIndex >= 0 ) and ( pcMain.ActivePageIndex < ( pcMain.PageCount - 1 ));
     btnFinish.Enabled := ( pcMain.ActivePageIndex = ( pcMain.PageCount - 1 ));
end;

procedure TFrmVerMainWizard.SetID(const Value: Real);
begin
  FID := Value;
end;

procedure TFrmVerMainWizard.Exit1Click(Sender: TObject);
begin
     Close;
end;

procedure TFrmVerMainWizard.Print1Click(Sender: TObject);
begin
     IQRepDef1.Execute;
end;

procedure TFrmVerMainWizard.PrinterSetup1Click(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

procedure TFrmVerMainWizard.About1Click(Sender: TObject);
begin
     IQAbout1.Execute;
end;

procedure TFrmVerMainWizard.QryUserColsBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'TABLE_NAME', TblColumnTABLE_NAME.AsString);
end;

procedure TFrmVerMainWizard.cmbColumnNameDropDown(Sender: TObject);
begin
     ReOpen( QryUserCols );
end;

procedure TFrmVerMainWizard.AssignIDBeforePost(DataSet: TDataSet);
begin
     IQAssignIDBeforePost(DataSet);
end;

procedure TFrmVerMainWizard.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); // in pas
  // Prevent orphaned record
  if Assigned( TFDTable(DataSet).MasterSource ) then
     if TFDTable(DataSet).MasterSource.DataSet.FieldByName( 'ID' ).AsFloat = 0 then
        raise Exception.Create( iqverify_rscstr.cTXT0000002 {'Application Error:  Parent ID not supplied.'} );
end;

procedure TFrmVerMainWizard.btnFinishClick(Sender: TObject);
begin
     DoButtonClick( wbFinish );
end;

procedure TFrmVerMainWizard.BuildMenu;
begin
//     lstMenu.Items.Clear;
//     with lstMenu.Items.Add do Caption := TabSheet1.Caption;
//     with lstMenu.Items.Add do Caption := TabSheet2.Caption;
//     with lstMenu.Items.Add do Caption := TabSheet3.Caption;
//     with lstMenu.Items.Add do Caption := TabFinish.Caption;
       lstMenu.Cells[0,1] := TabSheet1.Caption;
       lstMenu.Cells[0,2] := TabSheet2.Caption;
       lstMenu.Cells[0,3] := TabSheet3.Caption;
       lstMenu.Cells[0,4] := TabFinish.Caption;


end;

procedure TFrmVerMainWizard.lstMenuSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    if not FFormActive then Exit;
    ChangeMenu( pcMain.ActivePageIndex, Arow );
end;


procedure TFrmVerMainWizard.lstMenuChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
//     if not FFormActive or ( lstMenu.Selected = NIL ) then Exit;
//     ChangeMenu( pcMain.ActivePageIndex, lstMenu.Selected.Index )
end;

function TFrmVerMainWizard.AllowChangeMenu(ACurrentIndex,
  ATargetIndex: Integer): Boolean;
begin
     Result := ( ATargetIndex >= 0 ) and
               ( ACurrentIndex <> ATargetIndex ) and
               ValidatePageBeforeExit( ACurrentIndex ) and
               ValidatePageBeforeEnter( ATargetIndex );
end;

function TFrmVerMainWizard.ChangeMenu(ACurrentIndex,
  ATargetIndex: Integer): Boolean;
begin
     if not FFormActive then Exit;
     // Important to let the OnClick or OnChange process finish
     Application.ProcessMessages;
     Result := AllowChangeMenu( ACurrentIndex, ATargetIndex );
     if Result then pcMain.ActivePageIndex := ATargetIndex
     else SyncPageIndex;
     SetControls;
end;

procedure TFrmVerMainWizard.SetPageCheckBox(APage: Integer;
  AChecked: Boolean);
begin
//     if ( APage > -1 ) and ( APage < lstMenu.Items.Count ) and
//        ( lstMenu.Items[APage] <> NIL ) then
//        lstMenu.Items[APage].Checked := AChecked;
end;

procedure TFrmVerMainWizard.SyncPageIndex;
begin
   try
     lstMenu.OnChange := NIL;
     //lstMenu.Selected := lstMenu.Items[pcMain.ActivePageIndex];
     lstMenu.OnSelectCell := lstMenuSelectCell;
   finally //lstMenu.OnChange := lstMenuChange;
   end;
end;

function TFrmVerMainWizard.ValidatePageBeforeEnter(
  APage: Integer): Boolean;
begin
     Result := TRUE;
     case APage of
        0: //
         begin
         end;
        1: //
         begin
         end;
        2: //
         begin

         end;
        3: //
         begin
         end;
     end;
end;

function TFrmVerMainWizard.ValidatePageBeforeExit(APage: Integer): Boolean;
var ADummyFloat: Real;
begin
     Result := TRUE;
     case APage of
        0: //
         begin
              if IQVTriggerExistsFor( TblColumnTABLE_NAME.AsString, TblColumnCOLUMN_NAME.AsString ) then
                 raise Exception.CreateFmt( 'Trigger already exists for %s.%s', [TblColumnTABLE_NAME.AsString, TblColumnCOLUMN_NAME.AsString ] );

              if IsFoundFmt( 'select id from verify_column where table_name = ''%s'' and column_name = ''%s'' and id <> %.0f',
                             [TblColumnTABLE_NAME.AsString, TblColumnCOLUMN_NAME.AsString, TblColumnID.AsFloat] ) then
                 begin
                      //IQError( 'The table and column combination you selected has already been created.' );
                      Result := FALSE;
                 end;

         end;
        1: //
         begin
         end;
        2: // Segments
         begin
              Result := CheckValidMask;
         end;
        3: //
         begin

         end;
     end;

     SetPageCheckBox( APage, Result );
end;

procedure TFrmVerMainWizard.DoButtonClick(AWizardButton: TWizardBtn);
var i: Integer;
begin
     if not ValidatePageBeforeExit(pcMain.ActivePageIndex) then Exit;

     case AWizardButton of
        wbPrior :
           begin
                i := pcMain.ActivePageIndex - 1;
                if not ValidatePageBeforeEnter(i) then Exit;
                if i >= 0 then pcMain.ActivePageIndex := i;
           end;
        wbNext  :
           begin
                i := pcMain.ActivePageIndex + 1; // next index
                if not ValidatePageBeforeEnter(i) then Exit;
                if i < pcMain.PageCount then pcMain.ActivePageIndex := i;
           end;
        wbFinish:
           begin
                DoFinishAction;
           end;
     end;
     SyncPageIndex;
     SetControls;
end;

procedure TFrmVerMainWizard.DoFinishAction;
begin
     PostAllDataSets;

     if Overlapping then
        Abort;
     if GapsInTheMask then
        Abort;
     if GapsInAllowNull then
        Abort;

     // Create trigger
//     if not CreateTrigger then
//        IQError( 'Could not create trigger.' )
//     else IQDialogChk( 'Trigger created successfully.', 'IQVERIFY_DONE_PROMPT', mtInformation, [mbOk] );
//     // Close form
     Close;
end;

procedure TFrmVerMainWizard.PostAllDataSets;
begin
     if ( TblColumn.State in [dsEdit, dsInsert] )    then TblColumn.Post;
     if ( TblCondition.State in [dsEdit, dsInsert] ) then TblCondition.Post;
     if ( TblSegment.State in [dsEdit, dsInsert] )   then TblSegment.Post;
     if ( TblValue.State in [dsEdit, dsInsert] )     then TblValue.Post;
end;

procedure TFrmVerMainWizard.btnBackClick(Sender: TObject);
begin
     DoButtonClick( wbPrior );
end;

procedure TFrmVerMainWizard.btnNextClick(Sender: TObject);
begin
     DoButtonClick( wbNext );
end;

procedure TFrmVerMainWizard.PkColumnIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
     Action := mrOk;
     ResultValue := 0;
end;

procedure TFrmVerMainWizard.SrcSegmentDataChange(Sender: TObject;
  Field: TField);
begin
     if ( FFormActive = FALSE ) then Exit;
     GridValue.Enabled :=  ( TblSegmentID.AsFloat > 0 );
     NavValue.Enabled  :=  ( TblSegmentID.AsFloat > 0 );
     TblValueVALUE.EditMask := Repl( 'c', TblSegmentLENGTH.AsInteger );
     pcValues.ActivePageIndex := TblSegmentTYPE.AsInteger;
     if ( QryUserColsDATA_TYPE.AsString = 'CHAR' ) or
        ( QryUserColsDATA_TYPE.AsString = 'VARCHAR' ) or
        ( QryUserColsDATA_TYPE.AsString = 'VARCHAR2' ) then
     try
        SrcSegment.OnDataChange := NIL;
        TblSegmentVAL_HIGH.EditMask := Repl( '0', TblSegmentLENGTH.AsInteger );
        TblSegmentVAL_LOW.EditMask  := Repl( '0', TblSegmentLENGTH.AsInteger );
     finally
        SrcSegment.OnDataChange := SrcSegmentDataChange;
     end;
end;


procedure TFrmVerMainWizard.UpdateCurrentMaskPreview;
   procedure GetNextColor( var ACurIndex: Integer; var ABrushColor, AFontColor: TColor  );
   const
        cBrushColor: array[0..11] of TColor = ( clBlue, clGreen, clRed, clNavy, clOlive,
                                               clMaroon, clAqua, clLime, clFuchsia, clPurple,
                                               clTeal, clDkGray );
        cFontColor: array[0..11] of TColor = ( clWhite, clWhite, clWhite, clWhite, clWhite,
                                               clWhite, clBlack, clBlack, clBlack, clWhite,
                                               clWhite, clWhite );
   begin
        Inc( ACurIndex );
        if not ( ACurIndex in [0..11] ) then ACurIndex := 0;
        ABrushColor := cBrushColor[ACurIndex];

        AFontColor  := cFontColor[ACurIndex];
   end;
   // ==========================================================================
var
  ALeft, ANextLeft, AColorIndex, i: Integer;
  ASampleText, S: String;
  AID: Real;
  ABrushColor, AFontColor: TColor;
begin

     if ( TblColumn.State in [ dsInsert ] ) then Exit;
     if ( TblColumn.State in [ dsEdit ] ) then TblColumn.Post;

     AID:= TblColumnID.AsFloat;

     // Clear the display
     for i := sbDisplay.ControlCount - 1 downto 0 do
         if ( sbDisplay.Controls[i] is TUniLabel ) then
            ( sbDisplay.Controls[i] as TUniLabel ).Free;

     if ( AID = 0 ) then Exit;

     sbDisplay.HorzScrollBar.Position := 0;
     ALeft       := 0;  // initial
     ANextLeft   := 0;  // initial
     AColorIndex := -1; // initial
     ABrushColor := clYellow; // initial
     AFontColor  := clBlack;  // initial

     with TFDQuery.Create(Self) do
     try
        Connection := UniMainModule.FDConnection1;
        SQL.Add(         'select id, start_pos, length, val_high, val_low, type ' );
        SQL.Add(         'from verify_segment ' );
        SQL.Add( Format( 'where verify_column_id = %.0f order by seq', [AID] ));
        Open;
        First;

        while not EOF do
         begin
              ASampleText := SelectValueFmtAsString( 'select VALUE from VERIFY_VALUE where VERIFY_SEGMENT_ID = %.0f', [FieldByName('ID').AsFloat] );
              ASampleText := LeftStr( ASampleText, FieldByName('LENGTH').AsInteger ); // enforce length


              if ( Trim(ASampleText) = '' ) then
                 begin
                      if FieldByName('TYPE').AsInteger = 0 then ASampleText := Repl( 'X', FieldByName('LENGTH').AsInteger )
                      else
                         begin
                              ASampleText := FieldByName('VAL_HIGH').AsString;
                              if Trim(ASampleText) = '' then
                                 ASampleText := Repl( '9', FieldByName('LENGTH').AsInteger );
                         end;
                 end;

              GetNextColor(AColorIndex, ABrushColor, AFontColor );
              PaintSegment( ASampleText, ALeft, ABrushColor, AFontColor, ANextLeft, FieldByName('ID').AsInteger );
              ALeft := ALeft + ANextLeft;
              Next;
         end;
     finally Free;
     end;

     // Paint ruler numbers
     for i := 1 to 9 do
         S := S + IntToStr(i);
     S := S + '0';
     S := Repl( S, 20 );
     PnlRuler.Caption := S;
     PnlRuler.Width := Self.Canvas.TextWidth(S) + Length(S);
     sbDisplay.HorzScrollBar.Position := 0;
end;

procedure TFrmVerMainWizard.PaintSegment(AText: String; ALeft: Integer;
  ABrushColor, AFontColor: TColor; var AFormattedWidth: Integer; AID: LongInt = 0 );
begin
     with TUniLabel.Create(Self) do
       begin
            Parent := sbDisplay;
            Left   := ALeft;
            Top    := 17;
            Caption:= AText;
            Color  := ABrushColor;
            Font.Color := AFontColor;
            AutoSize := TRUE;
            AFormattedWidth := Width;
            if ( AID < 2147483647 {2,147,483,647} ) then
               begin
                    Tag := AID;
                    OnClick := DoSegmentClick;
               end;
       end;
end;

procedure TFrmVerMainWizard.sbtnMoveUpClick(Sender: TObject);
begin
     MoveUpSequence( TblSegmentSEQ ); //
end;

procedure TFrmVerMainWizard.sbtnMoveDownClick(Sender: TObject);
begin
     MoveDownSequence( TblSegmentSEQ ); //
end;

procedure TFrmVerMainWizard.TblSegmentNewRecord(DataSet: TDataSet);
var AMaxID: Real;
  ALength: Integer;
begin
     AMaxID := SelectValueFmtAsFloat( 'select max(id) from verify_segment where verify_column_id = %.0f',[TblColumnID.AsFloat] );
     ALength := Trunc(SelectValueFmtAsFloat( 'select sum(length) from verify_segment where verify_column_id = %.0f',[TblColumnID.AsFloat] ));
     AssignIDBeforePost(DataSet);
     TblSegmentSEQ.AsInteger := Trunc(SelectValueFmtAsFloat( 'select max(seq) from verify_segment where verify_column_id = %.0f',[TblColumnID.AsFloat] )) + 1;
     TblSegmentSTART_POS.AsInteger := ALength + 1; // Trunc(SelectValueFmtAsFloat( 'select start_pos + length from verify_segment where verify_column_id = %.0f and id = %.0f ',[TblColumnID.AsFloat, AMaxID] )) + 1;
     TblSegmentTYPE.AsInteger := 0;
end;

function TFrmVerMainWizard.CreateTrigger: Boolean;
var
   ATriggerName, ATriggerWhen, ATableName, AFieldName, ATemp, ASQLText: String;
   ASQL, AWhen: TStringList;
   b: Boolean;
   i: Integer;
begin

     if ( TblColumn.State in [ dsEdit, dsInsert ] ) then
        TblColumn.Post;

     ATriggerWhen  := '';
     ATableName    := UpperCase( cmbTableName.Text );
     AFieldName    := UpperCase( cmbColumnName.Text );

     if IsFoundFmt( 'select * from user_triggers where trigger_name = ''%s'' ', [TblColumnTRIGGER_NAME.AsString]) then
        begin
             ATriggerName := TblColumnTRIGGER_NAME.AsString;
             ExecuteCommandFmt( 'DROP TRIGGER %s', [ATriggerName] );
        end
     else
        begin
             // Trigger name must be 30 characters or less
             ATriggerName  := LeftStr( Format( 'TIQV_%s_%s', [ATableName, AFieldName] ), 25 );
             ATemp         := Format( '%s_1', [ ATriggerName, i] );
             i := 2;
             repeat
                b := TableExists(ATemp);
                if b then ATemp := Format( '%s_%d', [ATriggerName, i] );
                Inc( i );
             until ( b = FALSE );
             ATriggerName := ATemp;
        end;

     if not ( TblCondition.BOF and TblCondition.EOF ) then
      try
         AWhen := TStringList.Create;
         // Example: (NEW.CLASS = 'FG' or NEW.REV = 'A')
         TblCondition.First;
         while not TblCondition.EOF do
            begin
                 if ( Trim( TblConditionCONDITION_COLUMN.AsString ) > '' ) and
                    ( Trim( TblConditionCONDITION_VALUE.AsString ) > '' ) then
                    AWhen.Add( Format( 'NEW.%s=''%s''', [TblConditionCONDITION_COLUMN.AsString, TblConditionCONDITION_VALUE.AsString] ));
                 TblCondition.Next;
            end;
         ATemp        := AWhen.CommaText;
         ATemp        := StrTran( ATemp, '"', '' );
         ATemp        := StrTran( ATemp, ',', ' or ' );
         ATriggerWhen := Trim( ATemp );
      finally if Assigned(AWhen) then FreeAndNil(AWhen);
      end;

     Result := FALSE;
     try
        ASQL:= TStringList.Create;
        ASQL.Add( Format( 'CREATE OR REPLACE TRIGGER %s', [ATriggerName] ));
        ASQL.Add( 'BEFORE INSERT OR UPDATE OF' );
        ASQL.Add( Format( '  %s ', [ AFieldName ] ));
        ASQL.Add( Format( 'ON %s', [ ATableName ] ));
        ASQL.Add( 'REFERENCING NEW AS NEW OLD AS OLD' );
        ASQL.Add( 'FOR EACH ROW' );
        if ( Trim( ATriggerWhen ) > '' ) then
           ASQL.Add( Format( 'WHEN (%s)', [ATriggerWhen] ));
        ASQL.Add( 'begin' );
        ASQL.Add( Format( '     if iqms.iqverify.iqv_validate( ''%s'', ''%s'', trim( ::NEW.%s ) ) = 0 then', [ATableName, AFieldName, AFieldName] ));
        ASQL.Add( Format( '        raise_application_error( -20577, ''Invalid value format for field segment:  '' || ::NEW.%s  );', [AFieldName] ));
        ASQL.Add( '     end if;' );
        ASQL.Add( 'end;' );
        ASQLText := ASQL.Text;

     finally
        if Assigned(ASQL) then FreeAndNil(ASQL);
     end;

     // Create trigger
     ExecuteCommand( ASQLText );

     // Update the trigger name
     if not ( TblColumn.State in [ dsEdit, dsInsert ] ) then
        TblColumn.Edit;
     TblColumnTRIGGER_NAME.AsString := ATriggerName;
     TblColumn.Post;

     Result := TRUE;


{
CREATE OR REPLACE TRIGGER tbu_test
BEFORE INSERT OR UPDATE OF
  itemno
ON arinvt
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
WHEN (NEW.CLASS = 'FG')
begin
     if iqms.iqverify.iqv_validate( 'ARINVT', 'ITEMNO', trim( :NEW.itemno ) ) = 0 then
        raise_application_error( -20500, 'Invalid column value:  ' || :NEW.itemno  );
     end if;
end;
/

}

end;

procedure TFrmVerMainWizard.DoSegmentDataSetAfterPost(DataSet: TDataSet);
begin
     UpdateCurrentMaskPreview;
end;

procedure TFrmVerMainWizard.TblValueBeforePost(DataSet: TDataSet);
begin
     AssignIDBeforePost(DataSet);
     // enforce length restriction
     //if ( TblSegmentLENGTH.AsInteger > 0 ) then
     TblValueVALUE.AsString := LeftStr( TblValueVALUE.AsString, TblSegmentLENGTH.AsInteger ); // enforce length
end;

procedure TFrmVerMainWizard.cmbValueTypeChange(Sender: TObject);
begin
     pcValues.ActivePageIndex := cmbValueType.ItemIndex;
end;

procedure TFrmVerMainWizard.TblSegmentBeforePost(DataSet: TDataSet);
begin
     AssignIDBeforePost(DataSet);
     if ( TblSegmentTYPE.AsInteger = 1 ) and ( TblSegmentVAL_HIGH.AsInteger + TblSegmentVAL_LOW.AsInteger > 0 ) then // numeric
        begin
             if ( TblSegmentVAL_HIGH.AsInteger < TblSegmentVAL_LOW.AsInteger ) then
                //IQWarning( 'Invalid numeric range.  High value must be greater than low value.' );
        end;

    if TblSegmentLENGTH.AsInteger + TblSegmentSTART_POS.AsInteger > 0 then
       begin
            // validate these fields
            if ( TblSegmentLENGTH.AsInteger <= 0 ) then
               raise Exception.Create( 'Length is required.' );

            if ( TblSegmentSTART_POS.AsInteger <= 0 ) then
               raise Exception.Create( 'Start position is required.' );
       end;
end;

function TFrmVerMainWizard.CheckValidMask: Boolean;
begin
     //
     Result := TRUE;
end;

function TFrmVerMainWizard.IQVTriggerExistsFor(ATableName,
  AColumnName: String): Boolean;
begin
     Result := IsFoundFmt( 'select * from user_triggers ' +
                           'where table_owner = ''IQMS'' ' +
                           'and triggering_event = ''INSERT OR UPDATE'' ' +
                           'and trigger_type = ''BEFORE EACH ROW'' ' +
                           'and table_name = ''%s'' ' +
                           'and column_name = ''%s'' ' +
                           'and substr( trigger_name, 0, 5 ) = ''TIQV_'' ',
                           [ATableName, AColumnName] );
end;

procedure TFrmVerMainWizard.TblColumnBeforePost(DataSet: TDataSet);
begin
     AssignIDBeforePost(DataSet);
     if IQVTriggerExistsFor( TblColumnTABLE_NAME.AsString, TblColumnCOLUMN_NAME.AsString ) then
        raise Exception.CreateFmt( 'Trigger exists for %s.%s', [TblColumnTABLE_NAME.AsString, TblColumnCOLUMN_NAME.AsString ] );

end;

procedure TFrmVerMainWizard.TblColumnAfterPost(DataSet: TDataSet);
begin
     UpdateCurrentMaskPreview;
end;

function TFrmVerMainWizard.ValidateMask: Boolean;
begin
     Result := TRUE; // Everything OK

end;

function TFrmVerMainWizard.GapsInTheMask: Boolean;
var
  nSeq:Integer;
begin
     // TRUE = Has gaps, not good

  Result := False; // no gaps
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(Format( 'select seq, start_pos from verify_segment where verify_column_id = %.0f', [TblColumnID.AsFloat]));
    Open;
    while not Eof do
    begin
      nSeq := SubCheckForGaps(FieldByName('start_pos').AsInteger);
      if nSeq <> 0 then
      begin
        Result := True;
        raise Exception.Create(Format('There is a gap between sequence %d and sequence %d', [FieldByName('SEQ').AsInteger, nSeq]));
      end;
      Next;
    end;
  finally
    Free;
  end;

end;

function TFrmVerMainWizard.GetID: Real;
begin
  Result := FID;
end;

procedure TFrmVerMainWizard.GridConditionDBGridDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin

//     if Highlight then Exit;

     if ( UpperCase( Column.FieldName ) = 'SEQ' ) then
        Attribs.Font.Color := clBtnFace;

end;

function TFrmVerMainWizard.Overlapping: Boolean;
var
  nPos:Integer;
begin
     // TRUE = Is overlapping, not good
  Result := False;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(Format('select seq, start_pos, length from verify_segment where start_pos + length > 0 and verify_column_id = %.0f', [TblColumnID.AsFloat]));
    Open;
    while not Eof do
    begin
      nPos := SubCheckPosition(FieldByName('SEQ').AsInteger,
                               FieldByName('START_POS').AsInteger,
                               FieldByName('LENGTH').AsInteger);
      if nPos <> 0 then
      begin
        //IqWarning(Format('parameters at sequence %d conflict with parameters at sequence %d', [FieldByName('SEQ').AsInteger, nPos]));
        Result := True;
        Exit;
      end;
      Next;
    end;
  finally
    Free;
  end;
end;

function TFrmVerMainWizard.SubCheckForGaps(AStart: Integer): Integer;
var
 nLocalStart, nLocalLen, nSum:Integer;
begin
  Result := 0;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(Format('select seq, ' +
                   'start_pos, ' +
                   'length ' +
                   'from verify_segment ' +
                   'where start_pos = ' +
                   '(select max(start_pos) ' +
                   'from verify_segment where start_pos < %d) ' +
                   'and start_pos <> 0 ' +
                   ' and verify_column_id = %.0f' ,
                    [AStart, TblColumnID.AsFloat]));
    Open;

    nLocalStart   := FieldByName('START_POS').AsInteger;
    nLocalLen     := FieldByName('LENGTH').AsInteger;

    nSum  := (nLocalLen + nLocalStart );
    if nSum <> AStart then
      Result := FieldByName('SEQ').AsInteger
  finally
    Free;
  end;
end;

function TFrmVerMainWizard.SubCheckPosition(ASeq, AStart,
  ALen: Integer): Integer;
var
 nlStart, nlLen, nPos, nlPos:Integer;
begin
  Result := 0;

  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(Format('select seq, start_pos, length from verify_segment where seq <> %d and start_pos + length > 0 and verify_column_id = %.0f', [ASeq, TblColumnID.AsFloat]));
    Open;
    while not Eof do
    begin
      nlStart    := FieldByName('START_POS').AsInteger;
      nlLen      := FieldByName('LENGTH').AsInteger;

      nlPos   := nlStart + nlLen - 1;
      nPos    := AStart + ALen - 1;
      if nlStart + nlLen + 1 > 0 then
        if ( (nlPos >= AStart) and (nlPos <= nPos) ) or ( (nlStart >= AStart) and (nlStart <= nPos) ) then
        begin
          Result := FieldByName('SEQ').AsInteger;
          Exit
        end;
      Next;
    end;
  finally
    Free;
  end;
end;

function TFrmVerMainWizard.GapsInAllowNull: Boolean;
var
   ACurSeq, ALastSeq: Integer;
begin
     Result := FALSE;
     ALastSeq := -1;
     with TFDQuery.Create(Self) do
     try
        Connection := UniMainModule.FDConnection1;
        SQL.Add(Format('select seq, NVL( allow_null, ''N'' ) as allow_null from verify_segment where verify_column_id = %.0f order by seq', [TblColumnID.AsFloat]));
        Open;
        while not EOF do
           begin
                ACurSeq := FieldByName( 'SEQ' ).AsInteger;
                if (( ALastSeq + 1 ) = ACurSeq ) and ( FieldByName( 'ALLOW_NULL' ).AsString = 'N' ) then
                   begin
                        Result := TRUE;
                        raise Exception.Create(Format('There is an invalid "Allow Null" gap between sequence %d and sequence %d', [ALastSeq, ACurSeq]));
                        BREAK;
                   end
                else if ( FieldByName( 'ALLOW_NULL' ).AsString = 'Y' ) then
                   begin
                        ALastSeq := ACurSeq;
                   end;
                Next;
           end;
     finally
        Free;
     end;

end;

procedure TFrmVerMainWizard.sbtnCheckMaskClick(Sender: TObject);
begin
     if not Overlapping and not GapsInTheMask and not GapsInAllowNull then
        //IQInformation( 'Check complete.  No errors.' );
end;

procedure TFrmVerMainWizard.DoSegmentClick(Sender: TObject);
var AID: Real;
    ACursor: Integer;
begin
     if ( TComponent( Sender ) is TUniLabel ) then
        begin
          if not ( TblSegment.State in [ dsInsert, dsEdit ] ) then
             try
                ACursor := Screen.Cursors[crSQLWait];
                Screen.Cursors[crSQLWait] := Screen.Cursors[crArrow];
                AID := TComponent( Sender ).Tag;
                TblSegment.Locate( 'ID', AID, [] );
             finally
                Screen.Cursor := crArrow; // necessary, or SQL wait will appear again
                Screen.Cursors[crSQLWait] := ACursor;
             end;
        end;
end;

end.
