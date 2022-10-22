unit IQMS.WebVcl.QueryInfo;

{ ** History **

  06/11/2010
    I (Byron) modified how the SQL is displayed so that the actual SQL
    used by Delphi, was displayed in it's unmodified state:

    1. Added page control with 2 tabs:  "Parsed SQL" and "Original SQL".
    2. The "Parsed SQL" tab shows much the query SQL, much like it did
       before my changes, except I switched to the parsing routine used
       in IQDBTRANS, which was a little more accurate.
    3. The "Original SQL" tab shows the SQL as it is used in the pick list
       along with whatever params are there.  This allows us to see the
       placement of the params, and in conjunction with the "Parameters"
       grid (right side) we can see exactly what is being used by Delphi.
       The point here is that this is the untouched SQL used by the query
       object.
    4. Added caption bars, and SQL formatting (which is also used in Data
       Exchange Administrator) to help with clarity and aesthetics.
    5. Added popup menus (right-click) to each editor, and to the parameter
       list to make copying text a bit easier.  I needed to work quickly
       between SQL Navigator and the debugger, and found the need to
       select the text manually a bit tedious.

}

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  Data.SqlExpr,
  Datasnap.DBClient,
  IQMS.WebVcl.DBExpress,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Time,
  Vcl.ValEdit,
  IQMS.WebVcl.About,
  FireDAC.UI.Intf,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, UniMemo,
  uniPageControl, Vcl.Controls, Vcl.Grids, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TDataSetType = (dstUndefined, dstQuery, dstTable, dstStoredProc, dstUnknown);

  { TFrmQueryInfo }
  TFrmQueryInfo = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    PnlSQL: TUniPanel;
    PnlFilter: TUniPanel;
    Splitter1: TUniSplitter;
    PnlParams: TUniPanel;
    Bevel1: TUniPanel;
    PnlParamsCaptionBar: TUniPanel;
    lblParamsCaption: TUniLabel;
    PnlFilterCaption: TUniPanel;
    lblFilterCaption: TUniLabel;
    rtfFilter: TUniMemo;
    PEditor: TUniPopupMenu;
    CopyToClipboard1: TUniMenuItem;
    CopyAllToClipboard1: TUniMenuItem;
    PParameters: TUniPopupMenu;
    CopyParameter1: TUniMenuItem;
    CopyParameterListtoClipboard1: TUniMenuItem;
    StatusBar1: TUniStatusBar;
    Panel1: TUniPanel;
    InfoValueList: TValueListEditor;
    Panel2: TUniPanel;
    Label1: TUniLabel;
    Splitter2: TUniSplitter;
    pcSQL: TUniPageControl;
    TabParsedSQL: TUniTabSheet;
    rtfParsedSQL: TUniMemo;
    TabOriginalSQL: TUniTabSheet;
    rtfOriginalSQL: TUniMemo;
    ParamsValueList: TValueListEditor;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CopyAllToClipboard1Click(Sender: TObject);
    procedure CopyToClipboard1Click(Sender: TObject);
    procedure CopyParameter1Click(Sender: TObject);
    procedure CopyParameterListtoClipboard1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
    FDataSet: TDataSet;
    FField: TField;
    FSQL:String;
    procedure ParseParams(AQuery: TIQWebDbxQuery); overload;
    procedure ParseParams(AQuery: TSQLQuery); overload;
    procedure ParseParams(AQuery: TFDQuery); overload;
    //function  StrTranComma(ASql:String):String;
    procedure CheckValidDataSetType(const ADataSet: TDataSet);
    function ValidDataSetType(const ADataSet: TDataSet): Boolean;
    procedure StartUp;
    function GetDataSetType: TDataSetType;
    procedure ShowAsQuery;
    procedure ShowAsUndefined;
    procedure ShowAsTable;
    procedure ShowAsStoredProc;
    procedure HideAllTabs;
    procedure FindHighlightFieldName(RichEdit: TRichEdit;
      const AFieldName: string; AOptions: TSearchTypes);
    property DataSetType: TDataSetType read GetDataSetType;
  public
    { Public declarations }
    constructor Create( AOwner:TComponent; ADataSet: TDataSet; AField: TField );
    procedure AssignTiming(ATimeIt: TIQWebTimeIt);
  end;

procedure ShowQueryInfo(var Key: Word; Shift: TShiftState; AQuery: TDataSet;
 ATimeIt: TIQWebTimeIt);

var
  FrmQueryInfo: TFrmQueryInfo;

implementation

uses
//  dbtformat,
//  dbtshare,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  System.TypInfo;

{$R *.DFM}

procedure ShowQueryInfo(var Key: Word; Shift: TShiftState; AQuery: TDataSet;
 ATimeIt: TIQWebTimeIt);
begin
  if not ((Key = VK_F1) and (ssAlt in Shift)) then
     Exit;

  if not Assigned(AQuery) or
     not ((AQuery is TIQWebDbxQuery) or
          (AQuery is TSQLQuery) or
          (AQuery is TFDQuery)) then
     Exit;

  with TFrmQueryInfo.Create(Application, AQuery, nil) do
  try
    AssignTiming(ATimeIt);
    ShowModal;
  finally
    Key:= 0;
    Free;
  end;
end;

constructor TFrmQueryInfo.Create( AOwner:TComponent; ADataSet: TDataSet; AField: TField );
var
  I:Integer;
  ASQL: String;
begin
  FSQL := '';
  ASQL := '';

  FDataSet:= ADataSet;
  FField:= AField;

  inherited Create(AOwner);

  pcSQL.ActivePageIndex := -1;

  if Assigned(ADataSet) then
    CheckValidDataSetType(ADataSet);

  IQRegFormRead( self, [self, PnlParams]);

  rtfParsedSQL.Lines.Clear;
  rtfOriginalSQL.Lines.Clear;

  PnlFilter.Visible := Assigned(ADataSet) and ADataSet.Filtered and (Trim(ADataSet.Filter) > '');
  rtfFilter.Text := ADataSet.Filter;

  StartUp;
end;


procedure TFrmQueryInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, PnlParams]);
end;


procedure TFrmQueryInfo.StartUp;
begin
  // Show ID
  if Assigned(FDataSet) and Assigned(FDataSet.FindField('id')) then
     InfoValueList.InsertRow('ID', FDataSet.FieldByName('id').asString, True);

  // Show DataSet Type - Query, Table etc
  if Assigned(FDataSet) then
     InfoValueList.InsertRow('DataSet Type', Copy( GetEnumName( TypeInfo( TDataSetType ), Ord( DataSetType )), 4, 255 ), True);

  case DataSetType of
    dstUndefined : ShowAsUndefined;
    dstQuery     : ShowAsQuery;
    dstTable     : ShowAsTable;
    dstStoredProc: ShowAsStoredProc;
    dstUnknown   : ShowAsUndefined;
  end;

  if Assigned(FField) then
  begin
    InfoValueList.InsertRow('Field Name', FField.FieldName, True);
    InfoValueList.InsertRow('Field Kind', Copy( GetEnumName( TypeInfo(TFieldKind), Ord( FField.FieldKind )), 3, 255 ), True);
    if FField.FieldKind = fkLookup then
      InfoValueList.InsertRow('Lookup Key Fields', FField.KeyFields, True);
  end;
end;


procedure TFrmQueryInfo.HideAllTabs;
var
  I: integer;
begin
  pcSQL.TabIndex:= -1;
  for I:= 0 to pcSQL.PageCount - 1 do
    pcSQL.Pages[i].TabVisible:= False;
end;


procedure TFrmQueryInfo.ShowAsUndefined;
begin
  HideAllTabs;
end;


procedure TFrmQueryInfo.ShowAsTable;
begin
  HideAllTabs;

  // Show Table Name
  InfoValueList.InsertRow('Table Name', TFDTable(FDataSet).TableName, True);
end;


procedure TFrmQueryInfo.ShowAsStoredProc;
begin
  HideAllTabs;

  // Show Proc Name
  InfoValueList.InsertRow('Stored Procedure Name',
                      Format('%s.%s', [ TFDStoredProc(FDataSet).PackageName, TFDStoredProc(FDataSet).StoredProcName ]),
                      True);
end;


procedure TFrmQueryInfo.ShowAsQuery;
var
  ASQL: string;
begin
  pcSQL.TabIndex:= 0;

  if (FDataSet is TIQWebDbxQuery) then
     begin
       FSQL := TIQWebDbxQuery(FDataSet).SQL.Text;
//       dbtshare.GetParsedSQL(TIQWebDbxQuery(FDataSet), ASQL);
     end
  else if (FDataSet is TSQLQuery) then
     begin
       FSQL := TSQLQuery(FDataSet).SQL.Text;
//       dbtshare.GetParsedSQL(TSQLQuery(FDataSet), ASQL);
     end
  else if (FDataSet is TFDQuery) then
     begin
       FSQL := TFDQuery(FDataSet).SQL.Text;
//       dbtshare.GetParsedSQL(TFDQuery(FDataSet), ASQL);
     end;

  // 06/10/2010 Assign original SQL text
  rtfParsedSQL.Text := ASQL;
  rtfOriginalSQL.Text := FSQL;
//  dbtformat.FormatEditor(rtfParsedSQL);
//  dbtformat.FormatEditor(rtfOriginalSQL);

  if Assigned(FField) then
  begin
//    FindHighlightFieldName(rtfParsedSQL, FField.FieldName, [stWholeWord]);
//    FindHighlightFieldName(rtfOriginalSQL, FField.FieldName, [stWholeWord]);
  end;

  if (FDataSet is TIQWebDbxQuery) then
     ParseParams(TIQWebDbxQuery(FDataSet))
  else if (FDataSet is TSQLQuery) then
     ParseParams(TSQLQuery(FDataSet))
  else if (FDataSet is TFDQuery) then
     ParseParams(TFDQuery(FDataSet));
end;

procedure TFrmQueryInfo.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmQueryInfo.AssignTiming(ATimeIt: TIQWebTimeIt);
begin
//  if Assigned(ATimeIt) and (ATimeIt.Elapsed > 0) then
//    IQMS.Common.Controls.SetStatus(StatusBar1, Format('Execution Time:  %s',
//     [ATimeIt.ShortDisplay]), 0);
  StatusBar1.Visible := Assigned(ATimeIt) and (ATimeIt.Elapsed > 0);
//  if StatusBar1.Visible then
//    IQMS.Common.Controls.AutoSizeStatusBarPanel(StatusBar1, 0);
end;

procedure TFrmQueryInfo.CheckValidDataSetType(const ADataSet: TDataSet);
begin
  if not ValidDataSetType(ADataSet) then
     begin
      IQWarning('Dataset must be TDbxQuery, TSQLQuery, TFDQuery or TFDTable.');
      System.SysUtils.Abort;
     end;
end;

function TFrmQueryInfo.ValidDataSetType(const ADataSet: TDataSet): Boolean;
begin
  // 01/08/2010 Returns True if the dataset is a valid type for use by
  // this component (Byron).
  Result := Assigned(ADataSet) and
             ((ADataSet is TIQWebDbxQuery) or
             (ADataSet is TSQLQuery) or
             (ADataSet is TFDQuery) or
             (ADataSet is TFDTable) or
             (ADataSet is TFDStoredProc));
end;

procedure TFrmQueryInfo.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmQueryInfo.ParseParams(AQuery: TIQWebDbxQuery);
var
   i: Integer;
begin
  with AQuery do
    for i := 0 to ParamCount - 1 do
      ParamsValueList.InsertRow(Params[i].Name, Params[i].AsString, True );
end;

procedure TFrmQueryInfo.ParseParams(AQuery: TSQLQuery);
var
   i: Integer;
begin
  with AQuery do
    for i := 0 to ParamCount - 1 do
      ParamsValueList.InsertRow(Params[i].Name, Params[i].AsString, True );
end;

procedure TFrmQueryInfo.ParseParams(AQuery: TFDQuery);
var
   i: Integer;
begin
  with AQuery do
    for i := 0 to ParamCount - 1 do
      ParamsValueList.InsertRow(Params[i].Name, Params[i].AsString, True );
end;


procedure TFrmQueryInfo.CopyAllToClipboard1Click(Sender: TObject);
var
   o: TRichEdit;
begin
  if PEditor.PopupComponent is TRichEdit then
     o := PEditor.PopupComponent as TRichEdit;
  if not Assigned(o) then
     Exit;
  o.SelectAll;
  o.CopyToClipboard;
  o.SelStart := 0;
end;

procedure TFrmQueryInfo.CopyToClipboard1Click(Sender: TObject);
var
   o: TRichEdit;
begin
  if PEditor.PopupComponent is TRichEdit then
     o := PEditor.PopupComponent as TRichEdit;
  if not Assigned(o) then
     Exit;
  o.CopyToClipboard;
end;

procedure TFrmQueryInfo.CopyParameter1Click(Sender: TObject);
var
   s: String;
begin
  // 06/11/2010
  s := ParamsValueList.Cells[ ParamsValueList.Col, ParamsValueList.Row];
//  if Length(s) > 0 then
//     IQMS.Common.StringUtils.CopyStrToClipbrd(s);
end;

procedure TFrmQueryInfo.CopyParameterListtoClipboard1Click(
  Sender: TObject);
var
   i: Integer;
   s: String;
   sl: TStringList;
begin
  // 06/11/2010
  try
     sl := TStringList.Create;
     sl.Add(Format('%s=%s',
              [ParamsValueList.Cells[0, 0],
               ParamsValueList.Cells[1, 0]]));
     sl.Add(Repl('-',20));
     for i := 1 to ParamsValueList.RowCount - 1 do
       sl.Add(Format('%s=%s',
              [ParamsValueList.Cells[0, i],
               ParamsValueList.Cells[1, i]]));
//     IQMS.Common.StringUtils.CopyStrToClipbrd(sl.Text);
  finally
     if Assigned(sl) then FreeAndNil(sl);
  end;
end;

function TFrmQueryInfo.GetDataSetType: TDataSetType;
begin
  if FDataSet = nil then
     Result:= dstUnknown
  else if (FDataSet is TFDTable) then
     Result:= dstTable
  else if (FDataSet is TFDQuery) or (FDataSet is TIQWebDbxQuery) or (FDataSet is TSQLQuery)  then
     Result:= dstQuery
  else if (FDataSet is TFDStoredProc) then
     Result:= dstStoredProc
  else
     Result:= dstUnknown
end;


procedure TFrmQueryInfo.FindHighlightFieldName( RichEdit: TRichEdit; const AFieldName: string; AOptions: TSearchTypes);
var
  OrigSelStart, OrigSelLen: integer;
  Start, Found: integer;

//  procedure _HighlightSelection;
//  var
//    cf: TCharFormat2;
//  begin
//    FillChar(cf, sizeof(cf), 0);
//    cf.cbSize := sizeof( cf );
//    cf.dwMask := CFM_BACKCOLOR;
//    cf.crBackColor := ColorToRGB( clYellow );
//    RichEdit.Perform( EM_SETCHARFORMAT, SCF_SELECTION, lparam(@cf));
//    RichEdit.SelAttributes.Color:= clBlack;
//    RichEdit.SelAttributes.Style:= [fsBold];
//  end;

begin
  if AFieldName = '' then
    Exit;

  OrigSelStart := RichEdit.SelStart;
  OrigSelLen := RichEdit.SelLength;

  RichEdit.Perform(WM_SETREDRAW, 0, 0);
  try
    Start := 0;
    Found := RichEdit.FindText(AFieldName, Start, MaxInt, AOptions);
    while Found <> -1 do begin
      RichEdit.SelStart := Found;
      RichEdit.SelLength := Length(AFieldName);
      //RichEdit.SelAttributes.Color:= clRed;
      //RichEdit.SelAttributes.Style:= [fsBold];
//      _HighlightSelection();
      Start := Found + Length(AFieldName);
      Found := RichEdit.FindText(AFieldName, Start, MaxInt, AOptions);
    end;
  finally
    RichEdit.SelStart := OrigSelStart;
    RichEdit.SelLength := OrigSelLen;
    RichEdit.Perform(WM_SETREDRAW, 1, 0);
    RichEdit.Repaint;
  end;
end;

end.
