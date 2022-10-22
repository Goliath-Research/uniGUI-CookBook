unit IQMS.WebVcl.HpickFrm;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Winapi.Messages,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,IQUniGrid,
  Vcl.DBGrids, uniGUITypes,
  Data.DB, IQMS.WebVcl.HpickBase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniGUIClasses, uniImageList, Vcl.AppEvnts,
//  vcl.wwDialog,
//  vcl.Wwfltdlg,
  Vcl.Menus, uniMainMenu, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniLabel, uniBitBtn, uniStatusBar, uniButton,
  uniSpeedButton, uniCheckBox, uniEdit, uniPanel, uniScrollBox, uniGUIAbstractClasses;

type
  TModifyProc = procedure( Sender:TObject; var Action:TModalResult; var ResultValue:Variant ) of object;
  TIQCreateHPickColumn = procedure( Sender: TObject; AField: TField ) of object;

type
  THyperPick = class(TFrmPickListBase)
    dbGrid: TUniDBGrid;
    ExportData1: TUniMenuItem;
    XMLFormat1: TUniMenuItem;
    ExcelFormat1: TUniMenuItem;
    Count1: TUniMenuItem;
    procedure dbGridDblClick(Sender: TObject);
    procedure BtnModifyClick(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    procedure dbGridKeyPress(Sender: TObject; var Key: Char);
    procedure SearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure dbGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSelectClick(Sender: TObject);
    procedure dbGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure sbtnFoundClick(Sender: TObject);
    procedure dbGridTitleClick(Column: TUniDBGridColumn);
    procedure dbGridColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure FormActivate(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure chkCaseInsensitiveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure XMLFormat1Click(Sender: TObject);
    procedure ExcelFormat1Click(Sender: TObject);
    procedure Count1Click(Sender: TObject);
    procedure AvailableSortByPopup(Sender: TObject);

  private
    { Private declarations }
    procedure AdjustGridTitleColor;
    procedure ExportDataToExcel( AFileName: string );
    procedure ExportDataToXML(AFileName: string);
    function ExecuteFrontEndCount: Real;
    function ExecuteOracleCount: Real;
  protected
    { Protected declarations }
    procedure Startup; override;
    procedure CreateTFields; override;
    procedure SetSortColumn( AValue: TField ); override;
    procedure DoExecuteSort; override;

  public
    { Public declarations }
    function Grid: TUniDBGrid; override;
  end;


  THyperPickOfIQSearch = class(THyperPick)
  private
  protected
    procedure CreateTFields; override;
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.DebugSQL,
  IQMS.WebVcl.ExportDBGrid,
  IQMS.WebVcl.Hpick,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Web.MicrosoftExcel.Utils,
  IQMS.WebVcl.Search,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  IQMS.WebVcl.QueryInfo,
  IQMS.Common.SysShare,
  System.StrUtils,
  IQMS.WebVcl.ResourceStrings;



type
  TLocalDBGrid = class(TUniDBGrid)
  public
  end;

procedure THyperPick.Startup;
var
   i: Integer;
begin
  inherited Startup;
end;

procedure THyperPick.CreateTFields;
var
  i         : integer;
  AFieldSrc,
  AFieldTrg : TField;
  PhysicalFieldName:string;
  AColumn : TUniBaseDBGridColumn;
  ACanCreateColumn: Boolean;
begin
  VisiCols.Clear;
  SortCols.Clear;

  {Underlying structure}
  Query.FieldDefs.Update;

  { Get Columns }
  for i:= 0 to Query.FieldDefs.Count - 1 do
  begin
    with TFDQuery(FIQHpick) do
      if FieldCount = 0 then begin     // Developer didn't use Fields Editor
        AFieldTrg:= Query.FieldDefs[i].CreateField(Query);

        AFieldTrg.DisplayLabel:= ProperCase(Query.FieldDefs.Items[i].Name);
        AFieldTrg.Visible     := TRUE;
        AFieldTrg.DisplayWidth:= Query.FieldDefs.Items[i].Size;
      end
      else  // Developer did use Fields Editor and Added this field to the list of fields
        if FindField( Query.FieldDefs.Items[i].Name ) <> NIL then begin

          AFieldSrc:= FieldByName( Query.FieldDefs.Items[i].Name );

          AFieldTrg:= Query.FieldDefs[i].CreateField(Query);

          AFieldTrg.DisplayLabel:= AFieldSrc.DisplayLabel;
          AFieldTrg.Visible     := AFieldSrc.Visible;
          AFieldTrg.DisplayWidth:= AFieldSrc.DisplayWidth;
          AFieldTrg.Origin := AFieldSrc.Origin;
        end
        else
          begin  // Developer did use Fields Editor but did not included this field in the list
            AFieldTrg:= Query.FieldDefs[i].CreateField(Query);

            AFieldTrg.DisplayLabel:= ProperCase(Query.FieldDefs.Items[i].Name);
            AFieldTrg.Visible     := FALSE;
            AFieldTrg.DisplayWidth:= Query.FieldDefs.Items[i].Size;
          end;

    PhysicalFieldName:= ParseSQLPhysicalFieldName( SQLselect, DELIMETER, i+1 {i - is 0 based} );

    {10-22-2013 add support for security on columns}
    ACanCreateColumn:= TRUE;
    if Assigned( OnIQBeforeCreateHPickColumn ) then
       OnIQBeforeCreateHPickColumn( self, AFieldTrg, ACanCreateColumn );

    {Target Field is Created. Store the Header Name in VisiCols combobox and the field itself in the Objects[] array}
    if AFieldTrg.Visible and ACanCreateColumn then
    begin
       {Aug-07-03 - division vs warehouse}
       if ( Pos('Division', AFieldTrg.DisplayLabel ) > 0 ) then
          AFieldTrg.DisplayLabel:= CheckReplaceDivisionCaption( AFieldTrg.DisplayLabel ); {IQMS.Common.SysShare.pas}

       if System.StrUtils.ContainsText( AFieldTrg.DisplayLabel, 'EMAIL' ) then
          AFieldTrg.DisplayLabel:= IQMS.Common.SysShare.CheckReplaceEmailCaption( AFieldTrg.DisplayLabel );

       VisiCols.AddObject( PhysicalFieldName, AFieldTrg );

       {add support for user defined labels}
       if Assigned( OnIQCreateHPickColumn ) then
          TIQWebHPick( FIQHpick ).OnIQCreateHPickColumn( self, AFieldTrg );

       AColumn:= Grid.Columns.Add;
       with AColumn do
       begin
         FieldName    := AFieldTrg.FieldName;
         Title.Caption:= AFieldTrg.DisplayLabel;
         //Width        := AFieldTrg.DisplayWidth
       end;

       if Assigned( OnIQAfterCreateHPickColumn ) then
          TIQWebHPick( FIQHpick ).OnIQAfterCreateHPickColumn( self, Query, (AColumn) );
    end;  {if visible }

    if CompareText(AFieldTrg.FieldName, 'PK_HIDE') = 0 then
    begin
      PkHideColumn:= PhysicalFieldName;
      pnlPkHide.Visible:= TRUE and (Trim(PkHideColumn) > '');  {Oct-04-2004}
    end;

  end; {for}
end;

procedure THyperPick.dbGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  // if (Column.Field = SortColumn) and (Query.FieldCount > 1) then
  //   with Grid.Canvas do
  //   begin
  //      // Brush.Color:= clTeal;  // $00FFF4E8; very light blue
  //      // Font.Color := clWhite; // clBlack
  //      // this is better because we follow highlight theme
  //      TLocalDBGrid( Grid ).DrawCellHighlight( Rect, [], DataCol, 0 ); // make this column same color as highlighted row
  //   end
  // else

  // 09-13-2011 drop highlighting the column altogether
  if Assigned( TIQWebHPick( FIQHpick ).OnIQDrawColumnCell ) then
  begin
    TIQWebHPick( FIQHpick ).OnIQDrawColumnCell( Sender, ACol,ARow, Column, Attribs );
    EXIT;
  end;

  Grid.OnDrawColumnCell( Sender, ACol,ARow, Column, Attribs );
end;

procedure THyperPick.dbGridDblClick(Sender: TObject);
begin
  with Query do
    if not (Eof and Bof) then ModalResult:= mrOK
end;

procedure THyperPick.BtnModifyClick(Sender: TObject);
var
  Action: TModalResult;
  AResultValue: Variant;
begin
  Action:= mrNone;
  if Assigned(OnModify) then
  begin
     TIQWebHPick( FIQHpick ).NewResultValue:= FALSE;                  {for "New" button}
     TIQWebHPick( FIQHpick ).DoModify( self, Action, AResultValue );   {I don't call directly OnModify because I need to do some processing prior to the call}
     ResultValue:= AResultValue;
  end;

  TIQWebHPick( FIQHpick ).NewResultValue:= Action = mrOK;

  if Action = mrOK then
     ModalResult:= mrOK
  else if Action = mrABORT then
     ModalResult:= mrCancel
  else
     OpenSQL;
end;

procedure THyperPick.btnLaunchClick(Sender: TObject);
begin
  OpenSQL;
  //Search.SetFocus;
  Grid.SetFocus;
end;

procedure THyperPick.dbGridKeyPress(Sender: TObject; var Key: Char);
begin
  if key in ASCII_SET then
     Search.Text:= Search.Text + Key
  else if key = #8 then
     Search.Text:= Copy(Search.Text, 1, Length( Search.Text )-1 );
end;

procedure THyperPick.SearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key in [VK_DOWN, VK_UP, VK_PRIOR, VK_NEXT] then
     Grid.SetFocus
  else if Key = VK_RETURN then
  begin
     Key:= 0;
     btnLaunch.Click;
  end
  else if Key = VK_F3 then
     PopUpAvailableSortByMenu( Key )
//  else if Key = VK_F1 then
//     ShowID( Key, Shift, SrcQuery.DataSet )  {IQmisc}
  else if Key = VK_F1 then
     ShowQueryInfo(Key, Shift, Query, FTimeIt)  {QryInfo}
  else
    IQMS.Common.DebugSQL.CheckShowDebugSQL( Key, Shift);
end;

procedure THyperPick.FormResize(Sender: TObject);
const
  cMEASURE_CHAR   = '0';
  iINDICATOR_WIDE = 11;
var
  W:Integer;
begin
  // {If only 1 column is displayed - make sure we occupy the whole grid}
  // if (Query.FieldCount = 1) then begin
  //    W:= Trunc( (Grid.Width - iINDICATOR_WIDE) / GetTextWidthPixels(Grid.Font, cMEASURE_CHAR, self ) );
  //    Query.Fields[0].DisplayWidth:= W;
  // end;

  // 10-31-2012 Report selection criteria picklists with ID field arent displaying entire ID number
  inherited;

  //{Launch button location}
  //btnLaunch.Left:= Width - btnLaunch.Width - 12;
  //
  //{Search Edit width}
  //Search.Width:= btnLaunch.Left - 7;
end;



procedure THyperPick.dbGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  P:TPoint;
  MousePos: TSmallPoint;
begin
  if Key = VK_RETURN then
  begin
     Key:= 0;
     btnSelect.Click;
  end
  else if Key = VK_F3 then
     PopUpAvailableSortByMenu( Key )
//  else if Key = VK_F1 then
//     ShowID( Key, Shift, SrcQuery.DataSet )  {IQmisc}
  else if Key = VK_F1 then
     ShowQueryInfo(Key, Shift, Query, FTimeIt) {QryInfo}
  else if Key = VK_LEFT then
  begin
    SendMessage(Grid.Handle, WM_HSCROLL, SB_LINELEFT, 0);
    Key:= 0;
  end
  else if Key = VK_RIGHT then
  begin
    SendMessage(Grid.Handle, WM_HSCROLL, SB_LINERIGHT, 0);
    Key:= 0;
  end

end;

procedure THyperPick.BtnSelectClick(Sender: TObject);
begin
  with Query do
    if not (Eof and Bof) then ModalResult:= mrOK
                         else ModalResult:= mrCancel;
end;

procedure THyperPick.sbtnFoundClick(Sender: TObject);
var
  S: string;
begin
  try
    S:= Format( IQMS.WebVcl.ResourceStrings.cTXT0000042 {'Found: %d'}, [ GetResultRecordCount ]);
  except
    S:= 'N/A';
  end;
  IQConfirm(Format( IQMS.WebVcl.ResourceStrings.cTXT0000043 {'Row Count: %s'}, [ S ]));
end;

procedure THyperPick.dbGridTitleClick(Column: TUniDBGridColumn);
begin
  if FOnColumnFlag then
  begin
    if SortColumn = Column.Field then
       FDescOrd:= not FDescOrd
    else
       FDescOrd:= FALSE;

    SortByChange( Column.Field );
  end;
end;

procedure THyperPick.dbGridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  FOnColumnFlag:= FALSE;
end;

procedure THyperPick.AdjustGridTitleColor;
var
  I: Integer;
begin
  for I:= 0 to Grid.Columns.Count - 1 do with Grid.Columns[ I ] do
    if Field = SortColumn then
       begin
         // Title.Color     := clBlue;  //clTeal;  // 09-07-2011 XE Doesnt take the setting
         Title.Font.Style:= Title.Font.Style + [fsBold];
         Title.Font.Color:= clNavy; //clWhite;
       end
    else
       begin
         Title.Font.Style:= Title.Font.Style - [fsBold];
         //Title.Color:= clBtnFace;
         //Title.Font.Color:= clBlack;
       end;
end;

procedure THyperPick.FormActivate(Sender: TObject);
begin
  if not FOnActivateDone then
  begin
    FOnActivateDone:= TRUE;                  {Jul-18-2002}
    FOnShowHint:= Application.OnShowHint;    {Apr-11-2002}
    Application.OnShowHint:= DoOnShowHint;
  end;
end;


procedure THyperPick.DoExecuteSort;
begin
  AdjustGridTitleColor;
  SortByChange( SortCols );
  FDescOrd:= FALSE;
end;


procedure THyperPick.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  i: SmallInt;
begin
  if Msg.message = WM_MOUSEWHEEL then
  begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;
    i := HiWord(Msg.wParam) ;
    if i > 0 then
      Msg.wParam := VK_UP
    else
      Msg.wParam := VK_DOWN;

    Handled := False;
  end;
end;

procedure THyperPick.AvailableSortByPopup(Sender: TObject);
begin
  inherited;

  ExcelFormat1.Enabled := IQMS.Web.MicrosoftExcel.Utils.IsMicrosoftExcelInstalled;
end;

procedure THyperPick.chkCaseInsensitiveClick(Sender: TObject);
begin
  {this will trigger rebuild of the SQL}
  if SortColumn <> nil then
    SortByChange( nil );
end;

procedure THyperPick.FormShow(Sender: TObject);
begin
  //if Assigned(Application.MainForm) then
  //   PostMessage( Application.MainForm.Handle, iq_NotifySetForegroundWindow, 0, 0);
  inherited;
end;

procedure THyperPick.XMLFormat1Click(Sender: TObject);
begin
  ExportDataToXML('data.xml');
end;

procedure THyperPick.ExcelFormat1Click(Sender: TObject);
begin
  ExportDataToExcel('data.xls');
end;


procedure THyperPick.ExportDataToExcel( AFileName: string );
begin
  with TExportDBGrid.Create( self, AFileName, Grid ) do  // IQMS.WebVcl.ExportDBGrid.pas
  try
    ToExcel;
  finally
    Free;
  end;
  // IQMS.WebVcl.ResourceStrings.cTXT0000551 = 'Export finished successfully.';
  IQInformation(IQMS.WebVcl.ResourceStrings.cTXT0000551);
end;


procedure THyperPick.ExportDataToXML( AFileName: string );
begin
  with TExportDBGrid.Create( self, AFileName, Grid ) do  // IQMS.WebVcl.ExportDBGrid.pas
  try
    ToXML;
  finally
    Free;
  end;
  // IQMS.WebVcl.ResourceStrings.cTXT0000551 = 'Export finished successfully.';
  IQInformation(IQMS.WebVcl.ResourceStrings.cTXT0000551);
end;

function THyperPick.Grid: TUniDBGrid;
begin
  Result := dbGrid;
end;

procedure THyperPick.SetSortColumn(AValue: TField);
begin
  inherited;
  AdjustGridTitleColor;
end;

procedure THyperPick.Count1Click(Sender: TObject);
var
  ACount: Real;
begin
//  if Assigned(Query.OnFilterRecord) or (wwFilterDialog1.FieldInfo.Count > 0) then
//     ACount:= ExecuteFrontEndCount
//  else
//     ACount:= ExecuteOracleCount;

  // IQMS.WebVcl.ResourceStrings.cTXT0000552 = 'Record count: %s';
  ShowMessage(Format(IQMS.WebVcl.ResourceStrings.cTXT0000552,
    [FormatFloat1000SeparatorA(ACount, 0)]));
end;


function THyperPick.ExecuteOracleCount: Real;
var
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait('');
  try
    QryCount.Close;

    SetParams( QryCount );
    CheckAssignParamsType( QryCount );

    QryCount.Open;
    Result:= QryCount.FieldByName('the_count').asFloat;
    QryCount.Close;
  finally
    hMsg.Free;
  end;
end;


function THyperPick.ExecuteFrontEndCount: Real;
var
  hMsg: TPanelMesg;
  ABkMark: TBookMark;
begin
  if not IQConfirmYN( IQMS.WebVcl.ResourceStrings.cTXT0000361 {'Due to existing filter condition the count may take several minutes. Are you sure you want to continue?'}) then
     ABORT;

  Result:= 0;
  ABkMark:= Query.GetBookmark;
  try
    hMsg:= hPleaseWait('');
    try
      Query.DisableControls;
      Query.First;
      while not Query.Eof do
      begin
        Application.ProcessMessages;
        Result:= Result + 1;

        Query.Next;
      end;
    finally
      Query.EnableControls;
      hMsg.Free;
    end;

    Query.GotoBookMark( ABkMark );
  finally
    Query.FreeBookMark( ABkMark );
  end;
end;



{ -- THyperPickSearch -------------------------------------------------------- }

procedure THyperPickOfIQSearch.CreateTFields;
var
  i, x, y: integer;
  AFieldSrc,
  AFieldTrg : TField;
  PhysicalFieldName:string;
  AColumn : TUniBaseDBGridColumn;
  AIQSearch: TIQUniGridControl;
  ACanCreateColumn: Boolean;
begin
  VisiCols.Clear;
  SortCols.Clear;

  {Underlying structure}
  Query.FieldDefs.Update;

  AIQSearch:= TIQWebHPick(FIQHpick).AssociatedIQSearch as TIQUniGridControl;
  IQAssert( Assigned(AIQSearch),
    'Application Error:  IQSearch Parent component is not assigned.  Opearation aborted');

  { Get Columns }
  for i:= 0 to Query.FieldDefs.Count - 1 do
  begin
    AFieldSrc:= AIQSearch.DataSource.DataSet.FieldByName( Query.FieldDefs.Items[i].Name );
    if AFieldSrc.FieldKind <> fkData then
       Continue;

    with TFDQuery(FIQHpick) do
    begin
      AFieldTrg:= Query.FieldDefs[i].CreateField(Query);

      IQAssert( Assigned(AFieldSrc),
        Format('Application Error:  Unable to find IQSearch field, ''%s''.',
        [Query.FieldDefs.Items[i].Name]));

      AFieldTrg.DisplayLabel:= StrTRan(AFieldSrc.DisplayLabel, '~', '');
      AFieldTrg.Visible     := AFieldSrc.Visible and (AFieldSrc.Origin > '');
      AFieldTrg.DisplayWidth:= AFieldSrc.DisplayWidth;
    end;

    PhysicalFieldName:= AFieldSrc.Origin;

    {10-22-2013 add support for security on columns}
    ACanCreateColumn:= TRUE;
    if Assigned( OnIQBeforeCreateHPickColumn ) then
       OnIQBeforeCreateHPickColumn( self, AFieldTrg, ACanCreateColumn );

    {Target Field is Created. Store the Header Name in VisiCols combobox and the field itself in the Objects[] array}
    if AFieldTrg.Visible and ACanCreateColumn then
    begin
      // IQMS.WebVcl.ResourceStrings.cTXT0000553 = 'Division';
       if ( Pos(IQMS.WebVcl.ResourceStrings.cTXT0000553, AFieldTrg.DisplayLabel ) > 0 ) then
          AFieldTrg.DisplayLabel:= CheckReplaceDivisionCaption( AFieldTrg.DisplayLabel ); {IQMS.Common.SysShare.pas}

       if System.StrUtils.ContainsText( AFieldTrg.DisplayLabel, 'EMAIL' ) then
          AFieldTrg.DisplayLabel:= IQMS.Common.SysShare.CheckReplaceEmailCaption( AFieldTrg.DisplayLabel );

       VisiCols.AddObject( PhysicalFieldName, AFieldTrg );

       {add support for user defined labels}
       if Assigned( OnIQCreateHPickColumn ) then
          TIQWebHPick(FIQHpick).OnIQCreateHPickColumn( self, AFieldTrg );

       AColumn:= Grid.Columns.Add;
       with AColumn do
       begin
         FieldName    := AFieldTrg.FieldName;
         Title.Caption:= AFieldTrg.DisplayLabel;
       end;

       if Assigned( OnIQAfterCreateHPickColumn ) then
          TIQWebHPick( FIQHpick ).OnIQAfterCreateHPickColumn( self, Query, (AColumn) );
    end;  {if visible }

    if CompareText(AFieldTrg.FieldName, 'PK_HIDE') = 0 then
    begin
      PkHideColumn:= PhysicalFieldName;
      pnlPkHide.Visible:= TRUE and (Trim(PkHideColumn) > '');  {Oct-04-2004}
    end;
  end; {for}
end;


end.
