{QryUDCols - UpdateSQL is modified to update UD_COLS table}

unit IQMS.Common.UserFieldsLayoutManager;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  IQMS.WebVcl.Hpick,
  IQMS.Common.JumpConstants,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  System.ImageList,

  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList,
  uniBasicGrid,
  uniStringGrid,
  uniPanel,
  uniSplitter,
  dbctrls,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, uniDBGrid,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  {panels used on the layout manager}
  TUD_Panel = class(TUniPanel)
  private
    FSelected: Boolean;
    procedure AddUDColsClick(Sender: TObject);
  public
    UD_GroupBox_ID: Real;
    FPnlToolbar: TUniPanel;
    FLblFooter: TUniLabel;
    FPnlButton: TUniPanel;
    FsbtnAppendUDCols: TUniSpeedButton;

    constructor Create( AOwner: TComponent; AUD_GroupBox_ID: Real; APanelName, APanelCaption: string; AFieldsCount: Real );
    procedure UpdateText( APanelCaption: string; AFieldsCount: Real );
    destructor Destroy; override;
    procedure PanelMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Select;
    procedure UnSelect;
    property Selected: Boolean read FSelected write FSelected;
  end;

  TFrmUserFieldsLayoutManager = class(TUniForm)
    pnlLeft01: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    pnlTop01: TUniPanel;
    pnlTop02: TUniPanel;
    Panel5: TUniPanel;
    Splitter2: TUniSplitter;
    Splitter3: TUniSplitter;
    gridTabs: TIQUniGridControl;
    gridGroups: TIQUniGridControl;
    gridFields: TIQUniGridControl;
    pgctrlLayout: TUniPageControl;
    tabLayout: TUniTabSheet;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SrcUDGroupBox: TDataSource;
    SrcUDCols: TDataSource;
    SrcUDTabSheet: TDataSource;
    QryUDTabSheet: TFDQuery;
    QryUDGroupBox: TFDQuery;
    QryUDCols: TFDQuery;
    QryUDTabSheetID: TBCDField;
    QryUDTabSheetUD_TABLES_ID: TBCDField;
    QryUDTabSheetNAME: TStringField;
    QryUDTabSheetCAPTION: TStringField;
    QryUDTabSheetSEQ: TBCDField;
    QryUDGroupBoxID: TBCDField;
    QryUDGroupBoxUD_TABSHEET_ID: TBCDField;
    QryUDGroupBoxNAME: TStringField;
    QryUDGroupBoxCAPTION: TStringField;
    QryUDGroupBoxROW_NUM: TBCDField;
    QryUDGroupBoxCOL_NUM: TBCDField;
    QryUDColsID: TBCDField;
    QryUDColsUD_TABLES_ID: TBCDField;
    QryUDColsCOL_NAME: TStringField;
    QryUDColsCOL_LABEL: TStringField;
    QryUDColsUD_GROUPBOX_ID: TBCDField;
    QryUDColsGROUPBOX_SEQ: TBCDField;
    UpdateUDTabSheet: TFDUpdateSQL;
    UpdateUDGroupBox: TFDUpdateSQL;
    SG: TUniStringGrid;
    Bevel1: TUniPanel;
    ImageList1: TUniImageList;
    PnlToolbarTabs: TUniPanel;
    PnlToolbarCaption: TUniPanel;
    lblCaptionLabel: TUniLabel;
    PnlToolbarInner: TUniPanel;
    PnlToolbarGroups: TUniPanel;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    Panel3: TUniPanel;
    PnlToolbarFields: TUniPanel;
    Panel4: TUniPanel;
    Label2: TUniLabel;
    Panel13: TUniPanel;
    navUDTabSheet: TUniDBNavigator;
    navUDGroupBox: TUniDBNavigator;
    navUDCols: TUniDBNavigator;
    PnlCaption: TUniPanel;
    lblCaptionLayout: TUniLabel;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryUDTabSheetBeforeOpen(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryUDTabSheetNewRecord(DataSet: TDataSet);
    procedure QryUDTabSheetBeforePost(DataSet: TDataSet);
    procedure QryUDGroupBoxNewRecord(DataSet: TDataSet);
    procedure QryUDGroupBoxBeforePost(DataSet: TDataSet);
    procedure QryUDGroupBoxBeforeEdit(DataSet: TDataSet);
    procedure QryUDColsBeforeEdit(DataSet: TDataSet);
    procedure QryUDColsNewRecord(DataSet: TDataSet);
    procedure QryUDColsUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure PkUDColBeforeOpen(DataSet: TDataSet);
    procedure SrcUDTabSheetDataChange(Sender: TObject; Field: TField);
    procedure SGSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGDragOver(Sender, Source: TObject; X, Y: Integer;   State: TDragState; var Accept: Boolean);
    procedure SGDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tabLayoutResize(Sender: TObject);
    procedure AutoPost(DataSet: TDataSet);
    procedure RequestRebuildGrid(DataSet: TDataSet);
    procedure RequestUpdateUDPanelText(DataSet: TDataSet);
    procedure SrcUDGroupBoxDataChange(Sender: TObject; Field: TField);
    procedure gridFieldsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure gridFieldsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer;
      var Value: string; Attribs: TUniCellAttribs);
    procedure QryUDTabSheetBeforeRefresh(DataSet: TDataSet);
    procedure QryUDGroupBoxBeforeRefresh(DataSet: TDataSet);
    procedure QryUDColsBeforeRefresh(DataSet: TDataSet);
    procedure QryUDColsBeforeInsert(DataSet: TDataSet);
    procedure gridGroupsDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure gridFieldsDBGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FUD_Tables_ID: Real;
    FSrcCol, FSrcRow: Integer;
    FDraggingUD_Cols_ID: Real;
    FDragDropPoint: TPoint;

    function GetUniqueComponentName( ANamePrefix, ASQLCountExist: string ): string;
    procedure CheckComponentNameIsUnique( AComponentName, ASQLCountExist: string );
    procedure DisplayLayoutTabsheet;
    procedure DisplayLayoutStringGrid( AUD_Tabsheet_ID: Real );
    procedure ConfigureStringGrid(AUD_Tabsheet_ID: Real);
    procedure ClearStringGrid;
    procedure LoadPanelsIntoStringGrid(AUD_Tabsheet_ID: Real);
    procedure ObjectToColRow(AObject: TObject; var ACol, ARow: Integer);
    procedure AssignPanelToEmptyCell(APanel: TUD_Panel);
    procedure AlignPanelsOnStringGrid;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    function FindUDPanel( AUD_GroupBox_ID: Real ): TUD_Panel;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure UpdateUDPanelText(AUD_GroupBox_ID: Integer);
    procedure UpdateRowColInTable(Sender: TObject; ACol, ARow: Integer);
    procedure SelectLayoutPanel(AUD_Panel: TUD_Panel);
    procedure DragDropUDCol;
  public
    { Public declarations }
    procedure UnselectAll;
    constructor Create(AOwner: TComponent; AUD_Tables_ID: Real );
    class procedure DoShowModal( AOwner: TComponent; AUD_Tables_ID: Real );
    procedure ProcessUD_PanelMouseDown(Sender: TObject; Button: TMouseButton;  Shift: TShiftState; X, Y: Integer);
    procedure AppendUD_Cols;
  end;

var
  FrmUserFieldsLayoutManager: TFrmUserFieldsLayoutManager;

implementation

{R usr_flds_layout.res}

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils;

const
  cnstRebuildLayoutGrid = 1;
  cnstUpdateText  = 2;
  cnstLocateGrouBoxInGrid = 3;
  cnstDragDropChangeUDColsSeq = 4;

type
   TwwLocalDBGrid = class( TIQUniGridControl )    {so we could surface MouseDown event}
   public
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: integer);
   end;

{ TwwLocalDBGrid }
procedure TwwLocalDBGrid.MouseDown(Button: TMouseButton;  Shift: TShiftState; X, Y: integer);
begin
  inherited MouseDown( Button, Shift, X, Y );
end;


{ TFrmUserFieldsLayoutManager }
class procedure TFrmUserFieldsLayoutManager.DoShowModal(AOwner: TComponent; AUD_Tables_ID: Real);
begin
  with self.Create( AOwner, AUD_Tables_ID ) do
  try
    ShowModal;
  finally
    Free;
  end;
end;


{ TUD_Panel }
constructor TUD_Panel.Create( AOwner: TComponent; AUD_GroupBox_ID: Real; APanelName, APanelCaption: string; AFieldsCount: Real );
begin
  inherited Create(AOwner);
  Parent          := TFrmUserFieldsLayoutManager( AOwner ).SG;
  Name            := APanelName;
  Cursor          := crHandPoint;
  Caption         := '';
  Color           := clBtnFace;
  ParentBackground:= FALSE;
  OnMouseDown     := PanelMouseDown;
  UD_GroupBox_ID  := AUD_GroupBox_ID;

  FPnlToolbar:= TUniPanel.Create( AOwner );
  with FPnlToolbar do
  begin
    Parent:= self;
    Caption:= '';
    Cursor:= crHandPoint;
    AlignWithMargins:= True;
    Alignment:= taLeftJustify;
    Height:= 20;
    Align:= alTop;
    BevelEdges:= [beBottom];
    BevelKind:= bkFlat;
    BevelOuter:= bvNone;
    Color:= $00FAF2ED;
    Font.Color:= clBlack;
    Font.Style:= [fsBold];
    Font.Name:= 'Segoe UI';
    Font.Size:= 8;
    ParentBackground:= False;
    OnMouseDown:= PanelMouseDown;
  end;

  FPnlButton:= TUniPanel.Create( AOwner );
  with FPnlButton do
  begin
    Parent:= FPnlToolbar;
    Width:= 20;
    Align:= alRight;
    BevelOuter:= bvNone;
  end;

  FsbtnAppendUDCols:= TUniSpeedButton.Create( AOwner );
  with FsbtnAppendUDCols do
  begin
    Parent:= FPnlButton;
    Caption:= '';
    Height:= 18;
    Width:= 18;
    Left:= 0;  // (Parent.Width - Width) div 2;
    Top:= 0;   // (Parent.Height - Height) div 2;
    Hint:= IQMS.Common.ResStrings.cTXT0000442; // 'Append user defined columns to the group box';
    ShowHint := TRUE;
    OnClick := AddUDColsClick;
    TFrmUserFieldsLayoutManager( AOwner ).ImageList1.GetBitmap( 0, Glyph);
    Enabled:= FALSE;
    Invalidate;
  end;

  FLblFooter:= TUniLabel.Create( AOwner);
  with FLblFooter do
  begin
    Parent:= self;
    Cursor:= crHandPoint;
    AlignWithMargins:= True;
    Align:= alBottom;
    Margins.Left:= 4;
    Margins.Bottom:= 5;
    Font.Color:= clGray;
    OnMouseDown:= PanelMouseDown;
  end;

  UpdateText( APanelCaption, AFieldsCount );
end;

destructor TUD_Panel.Destroy;
begin
  FsbtnAppendUDCols.Free;
  FPnlButton.Free;
  FPnlToolbar.Free;
  FLblFooter.Free;

  inherited;
end;

procedure TUD_Panel.UpdateText( APanelCaption: string; AFieldsCount: Real );
begin
  FPnlToolbar.Caption:= Format( ' %s', [ APanelCaption ]);
  FLblFooter.Caption := Format('Fields: %.0f', [ AFieldsCount ]);
end;

procedure TUD_Panel.PanelMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Shift = [ssLeft]) then
  begin
    TFrmUserFieldsLayoutManager( Owner ).SelectLayoutPanel( self );
    TFrmUserFieldsLayoutManager( Owner ).ProcessUD_PanelMouseDown( self, Button, Shift, X, Y );  {note we send SELF regardless who popped up OnMouseDown (top panel, bottom label or self)}
  end;
end;

procedure TUD_Panel.Select;
begin
  FPnlToolbar.Color:= clHighlight; // clNavy;
  FPnlToolbar.Font.Color:= clWhite;
  FSelected:= TRUE;
  FsbtnAppendUDCols.Enabled:= TRUE;
  FsbtnAppendUDCols.Invalidate;
end;

procedure TUD_Panel.UnSelect;
begin
  //BevelOuter:= bvRaised;
  FPnlToolbar.Color:= $00FAF2ED;
  FPnlToolbar.Font.Color:= clBlack;
  FSelected:= FALSE;
  FsbtnAppendUDCols.Enabled:= FALSE;
  FsbtnAppendUDCols.Invalidate;
end;

procedure TUD_Panel.AddUDColsClick(Sender: TObject);
begin
  TFrmUserFieldsLayoutManager( Owner ).AppendUD_Cols;
end;

{ TFrmUserFieldsLayoutManager }

constructor TFrmUserFieldsLayoutManager.Create(AOwner: TComponent; AUD_Tables_ID: Real);
begin
  FUD_Tables_ID:= AUD_Tables_ID;
  inherited Create(AOwner);
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, pnlLeft01, pnlTop01, pnlTop02, gridTabs, gridGroups, gridFields ]);

  // attached SrcUDTabSheet.OnDataChange after form is displayed to ensure correct colors of the TUD_Panels
  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
end;

procedure TFrmUserFieldsLayoutManager.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmUserFieldsLayoutManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlLeft01, pnlTop01, pnlTop02, gridTabs, gridGroups, gridFields ]);
  ExecuteCommandFmt('begin user_form_misc.organize_ud_table_form( %f ); end;', [ FUD_Tables_ID ]);
end;

procedure TFrmUserFieldsLayoutManager.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmUserFieldsLayoutManager.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

function TFrmUserFieldsLayoutManager.GetUniqueComponentName( ANamePrefix, ASQLCountExist: string ): string;
var
  I: Integer;
  ACount: Real;
begin
  I:= 1;
  repeat
    Result:= ANamePrefix + IntToStr( I );
    ACount:= SelectValueFmtAsFloat( ASQLCountExist, [ FUD_Tables_ID, Result ]);
    if ACount = 0 then
       EXIT;
    Inc(I);
  until I > 500;

  Result:= '';
  IQError(Format('Unable to assign unique component name. SQL: %s', [ ASQLCountExist ]));
end;

procedure TFrmUserFieldsLayoutManager.gridFieldsDBGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Shift = [ssLeft])
//     and
//     (Y > gridFields.DBGrid.RowHeights[ 0 ])
     and
     ( QryUDColsID.asFloat > 0 ) then
  begin
    QryUDCols.CheckBrowseMode;
    gridFields.BeginDrag(FALSE);
    FDraggingUD_Cols_ID:= QryUDColsID.asFloat;
  end;
end;

procedure TFrmUserFieldsLayoutManager.gridFieldsDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  FDragDropPoint:= Point(X,Y);
  PostMessage( Handle, iq_Notify, cnstDragDropChangeUDColsSeq, 0 );
end;


procedure TFrmUserFieldsLayoutManager.gridFieldsDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= (Sender = Source) and (Source = gridFields) and not (QryUDCols.Eof and QryUDCols.Bof);
end;

procedure TFrmUserFieldsLayoutManager.gridGroupsDBGridDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn;
  Attribs: TUniCellAttribs);
begin
  if (Column.Field = QryUDGroupBoxROW_NUM) or (Column.Field = QryUDGroupBoxCOL_NUM) then
     Attribs.Font.Color:= clGray;
end;

procedure TFrmUserFieldsLayoutManager.IQAfterShowMessage(var Msg: TMessage);
begin
  SrcUDTabSheet.OnDataChange:= SrcUDTabSheetDataChange;
  SrcUDTabSheetDataChange(nil, nil);
end;

procedure TFrmUserFieldsLayoutManager.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    cnstRebuildLayoutGrid  : DisplayLayoutStringGrid( QryUDTabSheetID.asFloat );
    cnstUpdateText         : UpdateUDPanelText( Msg.LParam );
    cnstLocateGrouBoxInGrid: QryUDGroupBox.Locate('id', Msg.LParam, []);   // select that groupbox in the groupbox wwdbgrid
    cnstDragDropChangeUDColsSeq: DragDropUDCol;
  end;
end;


procedure TFrmUserFieldsLayoutManager.DragDropUDCol;
var
  AOnMouseDown: TMouseEvent;
begin
  {make to go to the target}
  AOnMouseDown:= gridFields.OnMouseDown;
  gridFields.OnMouseDown:= NIL;
  try
    TwwLocalDBGrid(gridFields).MouseDown( mbLeft, [ssLeft], FDragDropPoint.X, FDragDropPoint.Y );
  finally
    gridFields.OnMouseDown:= AOnMouseDown;
  end;

  {Update Seq}
  ExecuteCommandFmt('begin                                        '+
            '  user_form_misc.change_field_sequence( %f,  '+  // v_ud_groupbox_id number,
            '                                        %f,  '+  // v_ud_cols_id number,
            '                                        %f );'+  // v_new_seq number
            'end;',
            [ QryUDGroupBoxID.asFloat,
              FDraggingUD_Cols_ID,
              QryUDColsGROUPBOX_SEQ.asFloat ]);

  Reopen(QryUDCols);
  QryUDCols.Locate('ID', FDraggingUD_Cols_ID, []);
end;


procedure TFrmUserFieldsLayoutManager.PkUDColBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ud_tables_id', FUD_Tables_ID);
  AssignQueryParamValue(DataSet, 'ud_groupbox_id', QryUDGroupBoxID.AsLargeInt);
end;

procedure TFrmUserFieldsLayoutManager.CheckComponentNameIsUnique( AComponentName, ASQLCountExist: string );
var
  ACount: Real;
begin
  IQAssert( AComponentName <> '', 'Name must be entered - operation aborted');

  ACount:= SelectValueAsFloat( ASQLCountExist );
  IQAssert( ACount = 0, Format('Duplicated component name ''%s'' - operation aborted', [ AComponentName ]));
end;


procedure TFrmUserFieldsLayoutManager.QryUDColsBeforeEdit(DataSet: TDataSet);
begin

  if QryUDGroupBox.State in [dsEdit, dsInsert] then
     QryUDGroupBox.Post;

  if QryUDGroupBoxID.asFloat = 0 then
     ABORT;

end;

procedure TFrmUserFieldsLayoutManager.QryUDColsBeforeInsert(DataSet: TDataSet);
begin
    AppendUD_Cols;
    ABORT;
end;

procedure TFrmUserFieldsLayoutManager.QryUDColsBeforeRefresh(DataSet: TDataSet);
begin
   IQCheckRefresh(navUDCols, nbRefresh);
end;

procedure TFrmUserFieldsLayoutManager.RequestUpdateUDPanelText(DataSet: TDataSet);
var
  AOriginalUD_Groupbox_ID: Real;
begin
  AOriginalUD_Groupbox_ID:= SelectValueFmtAsFloat('select ud_groupbox_id from ud_cols where id = %f', [ DataSet.FieldByName('id').asFloat ]);

  // update caption on the panel we are pointing too
  PostMessage( self.Handle, iq_Notify, cnstUpdateText, DataSet.FieldByName('ud_groupbox_id').asInteger );

  // check what this field was pointing before the change and refresh that panel too!
  if (AOriginalUD_Groupbox_ID > 0) and (AOriginalUD_Groupbox_ID <> DataSet.FieldByName('ud_groupbox_id').asInteger) then
     PostMessage( self.Handle, iq_Notify, cnstUpdateText, Trunc(AOriginalUD_Groupbox_ID));

end;

procedure TFrmUserFieldsLayoutManager.QryUDColsNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ud_groupbox_id').asFloat:= QryUDGroupBoxID.asFloat;
  DataSet.FieldByName('groupbox_seq').asFloat:= 1 + SelectValueFmtAsFloat('select max(groupbox_seq) from ud_cols where ud_tables_id = %f and ud_groupbox_id = %f',
                                                              [ FUD_Tables_ID,
                                                                QryUDGroupBoxID.asFloat ]);
end;

procedure TFrmUserFieldsLayoutManager.QryUDColsUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  case ARequest of
    arDelete:
      ExecuteCommandFmt(
                'update ud_cols                         '#13 +
                '   set ud_groupbox_id = null,          '#13 +
                '       groupbox_seq   = null           '#13 +
                ' where id = %.0f                       ',
                [ DtoF(ASender.FieldByName('ID').OldValue) ]);

    else
      ExecuteCommandFmt(
                'update ud_cols                         '#13 +
                '   set ud_groupbox_id = %d,            '#13 +
                '       groupbox_seq   = %d             '#13 +
                ' where id = %d                         ',
                [ ASender.FieldByName('ud_groupbox_id').AsLargeInt,
                  ASender.FieldByName('groupbox_seq').AsLargeInt,
                  ASender.FieldByName('ID').AsLargeInt ]);
  end;
  AAction := eaApplied;
end;

procedure TFrmUserFieldsLayoutManager.RequestRebuildGrid(DataSet: TDataSet);
begin
  PostMessage( self.Handle, iq_Notify, cnstRebuildLayoutGrid, 0 );
end;

procedure TFrmUserFieldsLayoutManager.QryUDGroupBoxBeforeEdit(DataSet: TDataSet);
begin
  if QryUDTabSheet.State in [dsEdit, dsInsert] then
     QryUDTabSheet.Post;

  if QryUDTabSheetID.asFloat = 0 then
     ABORT;
end;


procedure TFrmUserFieldsLayoutManager.QryUDGroupBoxBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'ud_groupbox' );

  DataSet.FieldByName('name').asString:= IQMS.Common.StringUtils.FixComponentName( RTrim(DataSet.FieldByName('name').asString ));

  IQMS.Common.Miscellaneous.ValidateComponentName( DataSet.FieldByName('name').asString );

  CheckComponentNameIsUnique( DataSet.FieldByName('name').asString,
                              IQFormat(
                              'select count(*) from ud_groupbox g, ud_tabsheet t '#13 +
                              ' where t.ud_tables_id = %f                        '#13 +
                              '   and t.id = g.ud_tabsheet_id                    '#13 +
                              '   and upper(g.name) = upper(''%s'')              '#13 +
                              '   and g.id <> %d                                 ',
                              [ FUD_Tables_ID,
                                DataSet.FieldByName('name').asString,
                                DataSet.FieldByName('id').AsLargeInt ]));

  PostMessage( self.Handle, iq_Notify, iIIf( DataSet.State = dsInsert, cnstRebuildLayoutGrid, cnstUpdateText ), DataSet.FieldByName('id').asInteger );
end;


procedure TFrmUserFieldsLayoutManager.QryUDGroupBoxBeforeRefresh(
  DataSet: TDataSet);
begin
   IQCheckRefresh(navUDGroupBox, nbRefresh);
end;

procedure TFrmUserFieldsLayoutManager.QryUDGroupBoxNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ud_tabsheet_id').asFloat:= QryUDTabSheetID.asFloat;
  DataSet.FieldByName('name').asString:= GetUniqueComponentName('GroupBox',
                                                                'select count(*) from ud_groupbox g, ud_tabsheet t '+
                                                                ' where t.ud_tables_id = %f                        '+
                                                                '   and t.id = g.ud_tabsheet_id                    '+
                                                                '   and upper(g.name) = upper(''%s'')              ');
  DataSet.FieldByName('caption').asString:= DataSet.FieldByName('name').asString;
end;

procedure TFrmUserFieldsLayoutManager.AutoPost(
  DataSet: TDataSet);
begin
  // post immediately to avoid side affects and get a blank stringgrid
  DataSet.Post;
end;

procedure TFrmUserFieldsLayoutManager.QryUDTabSheetBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ud_tables_id', FUD_Tables_ID);
end;

procedure TFrmUserFieldsLayoutManager.QryUDTabSheetBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'ud_tabsheet' );

  DataSet.FieldByName('name').asString:= IQMS.Common.StringUtils.FixComponentName( RTrim(DataSet.FieldByName('name').asString ));

  IQMS.Common.Miscellaneous.ValidateComponentName( DataSet.FieldByName('name').asString );

  CheckComponentNameIsUnique( DataSet.FieldByName('name').asString,
                              IQFormat('select count(*) from ud_tabsheet where ud_tables_id = %f and upper(name) = upper(''%s'') and id <> %f',
                                     [ FUD_Tables_ID,
                                       DataSet.FieldByName('name').asString,
                                       DataSet.FieldByName('id').asFloat ]));
end;

procedure TFrmUserFieldsLayoutManager.QryUDTabSheetBeforeRefresh(
  DataSet: TDataSet);
begin
   IQCheckRefresh(navUDTabSheet, nbRefresh);
end;

procedure TFrmUserFieldsLayoutManager.QryUDTabSheetNewRecord(DataSet: TDataSet);
var
  ACount: Integer;
begin
  DataSet.FieldByName('ud_tables_id').asFloat:= FUD_Tables_ID;
  DataSet.FieldByName('seq').asFloat:= 1 + SelectValueFmtAsFloat('select max(seq) from ud_tabsheet where ud_tables_id = %f', [ FUD_Tables_ID ]);

  DataSet.FieldByName('name').asString:= GetUniqueComponentName('Tabsheet',
                                                                'select count(*) from ud_tabsheet t   '+
                                                                ' where t.ud_tables_id = %f           '+
                                                                '   and upper(t.name) = upper(''%s'') ');
  DataSet.FieldByName('caption').asString:= DataSet.FieldByName('name').asString;
end;

procedure TFrmUserFieldsLayoutManager.SGSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if (ACol < 1) or (ARow < 1) then
     ABORT;

  CanSelect:= FALSE;
end;


procedure TFrmUserFieldsLayoutManager.SrcUDGroupBoxDataChange(Sender: TObject;  Field: TField);
begin
  if Assigned(QryUDGroupBox) and (QryUDGroupBox.State = dsBrowse) and (QryUDGroupBoxID.asFloat > 0) then
     SelectLayoutPanel( FindUDPanel( QryUDGroupBoxID.asFloat ))
end;


procedure TFrmUserFieldsLayoutManager.SelectLayoutPanel( AUD_Panel: TUD_Panel );
begin
  if not Assigned( AUD_Panel ) then
     EXIT;
  if AUD_Panel.Selected then
     EXIT;
  UnselectAll;
  AUD_Panel.Select;
end;


procedure TFrmUserFieldsLayoutManager.SrcUDTabSheetDataChange(Sender: TObject;  Field: TField);
begin
  if Assigned(QryUDTabSheet) and (QryUDTabSheet.State in [ dsBrowse ]) then
     DisplayLayoutTabsheet;
end;

procedure TFrmUserFieldsLayoutManager.tabLayoutResize(Sender: TObject);
begin
  SG.Invalidate;
end;

procedure TFrmUserFieldsLayoutManager.DisplayLayoutTabsheet;
begin
  // tabsheet caption
  tabLayout.Caption:= IQMS.Common.Numbers.sIIf( QryUDTabSheet.Eof and QryUDTabSheet.Bof, '', IQMS.Common.StringUtils.nz( QryUDTabSheetCAPTION.asString, QryUDTabSheetNAME.asString ));

  // stringgrid
  DisplayLayoutStringGrid( QryUDTabSheetID.asFloat );
end;

procedure TFrmUserFieldsLayoutManager.DisplayLayoutStringGrid( AUD_Tabsheet_ID: Real );
begin
  ConfigureStringGrid( AUD_Tabsheet_ID );
  LoadPanelsIntoStringGrid( AUD_Tabsheet_ID );
end;

procedure TFrmUserFieldsLayoutManager.ConfigureStringGrid( AUD_Tabsheet_ID: Real );
//const
//   NoSelection : TGridRect = (Left:-1; Top:-1; Right:-1; Bottom:-1 );
var
  ACount: Integer;
  I: Integer;
begin
  ClearStringGrid;

  ACount:= Trunc(SelectValueFmtAsFloat('select count(*) from ud_groupbox where ud_tabsheet_id = %f', [ AUD_Tabsheet_ID ]));

  // how many rows and cols
  SG.RowCount:= ACount + 1;
  SG.ColCount:= ACount + 1;

  // header
  SG.ColWidths [ 0 ]:= 19;
  SG.RowHeights[ 0 ]:= 19;

  for I:= 1 to SG.ColCount - 1 do SG.Cells[ I, 0 ]:= IntToStr( I );
  for I:= 1 to SG.RowCount - 1 do SG.Cells[ 0, I ]:= IntToStr( I );

  if SG.RowCount > 1 then
     SG.FixedRows:= 1;
  if SG.ColCount > 1 then
     SG.FixedCols:= 1;

//  SG.Selection:= NoSelection;
end;


procedure TFrmUserFieldsLayoutManager.ClearStringGrid;
var
  R, C: Integer;
begin
  for R:= 0 to SG.RowCount - 1 do
    for C:= 0 to SG.RowCount - 1 do
//      if Assigned( SG.Objects[ C, R ]) and (SG.Objects[ C, R ] is TUD_Panel) then
//      begin
//        TUD_Panel(SG.Objects[ C, R ]).Free;
//        SG.Objects[ C, R ]:= nil;
//      end;
end;


procedure TFrmUserFieldsLayoutManager.LoadPanelsIntoStringGrid( AUD_Tabsheet_ID: Real );
var
  Q: TFDQuery;
  APanel: TUD_Panel;
  R, C: Integer;
  AHasPanels: Boolean;
begin
  AHasPanels:= FALSE;
  Q:= TFDQuery.Create(nil);
  try
    Q.ConnectionName := 'IQFD';
    Q.SQL.Add(IQFormat('select id,                                     '+
                       '       name,                                   '+
                       '       nvl( rtrim(caption), name) as caption,  '+
                       '       row_num,                                '+
                       '       col_num,                                '+
                       '       (select count(*) from ud_cols where ud_groupbox_id = ud_groupbox.id) as cols_count '+
                       '  from ud_groupbox                             '+
                       ' where ud_tabsheet_id = %f                     '+
                       ' order by id                                   ',
                       [ AUD_Tabsheet_ID ]));
    Q.Open;
    while not Q.Eof do
    begin
      // create panel
      APanel:= TUD_Panel.Create( self,
                                 Q.FieldByName('id').asFloat,
                                 Q.FieldByName('name').asString,
                                 Q.FieldByName('caption').asString,
                                 Q.FieldByName('cols_count').asFloat );

      R:= Trunc(Q.FieldByName('row_num').asFloat);
      C:= Trunc(Q.FieldByName('col_num').asFloat);

      // place it on the grid
//      if (R <= SG.RowCount - 1) and (R > 0) and (C <= SG.ColCount - 1) and (C > 0) and not Assigned(SG.Objects[ C, R ]) then
//         SG.Objects[ C, R ]:= APanel
//      else
//         AssignPanelToEmptyCell( APanel );    // find free cell and assign panel to it

      AHasPanels:= TRUE;

      Q.Next;
    end;
  finally
    Q.Free;
  end;

  if AHasPanels then
  begin
    AlignPanelsOnStringGrid;
    SrcUDGroupBoxDataChange( nil, nil );            // whichever groupbox is currently selected highlight it in the stringgrid
  end;

  SG.Invalidate;
end;

procedure TFrmUserFieldsLayoutManager.AppendUD_Cols;
var
  I: Integer;
begin
  if QryUDGroupBoxID.asFloat = 0 then
     ABORT;

//  with PkUDCol do
//    if ExecuteEx('id') then
//    begin
//       for I:= 0 to ResultList.Count - 1 do
//       begin
//         QryUDCols.Append;
//         QryUDColsID.asFloat:= StrToFLoat( ResultList[ I ]);
//         QryUDColsUD_GROUPBOX_ID.asFloat:= QryUDGroupBoxID.asFloat;
//         QryUDColsGROUPBOX_SEQ.asFloat  := 1 + SelectValueFmtAsFloat('select max(seq) from ud_cols where ud_tables_id = %f and ud_groupbox_id = %f',
//                                                         [ FUD_Tables_ID,
//                                                           QryUDGroupBoxID.asFloat ]);
//         QryUDCols.Post;
//       end;
//       ExecuteCommandFmt('begin user_form_misc.check_fix_fields_sequence( %f ); end;', [ QryUDGroupBoxID.asFloat ]);
//       Reopen(QryUDCols);
//    end;
end;


procedure TFrmUserFieldsLayoutManager.ProcessUD_PanelMouseDown(Sender: TObject; Button: TMouseButton;  Shift: TShiftState; X, Y: Integer);
begin
  // called from UD_Panel OnMouseDown
  if Shift = [ssLeft] then
  begin
    ObjectToColRow( Sender, FSrcCol, FSrcRow );
    IQAssert( (FSrcCol > -1) and (FSrcRow > -1), 'Unable to determine source row & column.');

    {start dragging}
    TUD_Panel(Sender).BeginDrag(False);

    {locate that groupbox in the groupbox wwdbgrid}
    PostMessage( self.Handle, iq_Notify, cnstLocateGrouBoxInGrid, Trunc(TUD_Panel(Sender).UD_Groupbox_ID));
  end;
end;

procedure TFrmUserFieldsLayoutManager.ObjectToColRow( AObject: TObject; var ACol, ARow: Integer );
var
  I, J: Integer;
begin
  for I:= 1 to SG.ColCount - 1 do
    for J:= 1 to SG.RowCount - 1 do
//       if Assigned(SG.Objects[ I, J ]) and (SG.Objects[ I, J ] = AObject) then
//       begin
//         ACol:= I;
//         ARow:= J;
//         EXIT;
//       end;

  ACol:= -1;
  ARow:= -1;
end;


procedure TFrmUserFieldsLayoutManager.SGDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  C, R: Integer;
begin
//  SG.MouseToCell(X, Y, C, R );
  Accept := (C > 0) and (C <= SG.ColCount - 1)
            and
            (R > 0) and (R <= SG.RowCount - 1)
//            and not Assigned(SG.Objects[ C, R ])
            and (Source is TUD_Panel)
            and (Sender is TUniStringGrid);
end;


procedure TFrmUserFieldsLayoutManager.SGDrawCell(Sender: TObject; ACol,
  ARow: Integer; var Value: string; Attribs: TUniCellAttribs);
begin
//  if not (gdFixed in State) then
//     AlignPanelsOnStringGrid();
end;

procedure TFrmUserFieldsLayoutManager.SGDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  ATrgCol, ATrgRow: Integer;
begin
//  SG.MouseToCell(X, Y, ATrgCol, ATrgRow);

//  if not((FSrcCol > 0) and (FSrcRow > 0) and Assigned( SG.Objects[ FSrcCol, FSrcRow ])) then
//     raise Exception.Create('Invalid Source');

  if not((ATrgCol > 0) and (ATrgRow > 0)) then
     raise Exception.Create('Invalid Target');

//  SG.Objects[ FSrcCol, FSrcRow ]:= NIL;
//  SG.Objects[ ATrgCol, ATrgRow ]:= Source;

  UpdateRowColInTable( Source, ATrgCol, ATrgRow );
end;

procedure TFrmUserFieldsLayoutManager.AssignPanelToEmptyCell( APanel: TUD_Panel );
var
  R, C: Integer;
begin
  for C:= 1 to SG.ColCount - 1 do
    for R:= 1 to SG.RowCount - 1 do
//       if not Assigned(SG.Objects[ C, R ]) then
//       begin
//         SG.Objects[ C, R ]:= APanel;
//         UpdateRowColInTable( APanel, C, R );
//         EXIT;
//       end;

  raise Exception.CreateFmt('Unable to find free location for groupbox panel ''%s''', [ APanel.Name ]);
end;


procedure TFrmUserFieldsLayoutManager.AlignPanelsOnStringGrid;
const
  cnstVMargin = 6;
  cnstHMargin = 6;
var
  R1: TRect;
  R, C: Integer;
begin
  for R:= 1 to SG.RowCount - 1 do
    for C:= 1 to SG.ColCount - 1 do
//      if Assigned(SG.Objects[ C, R ]) then
//      begin
//        R1:= SG.CellRect(C,R);
//        R1.Left  := R1.Left + cnstHMargin;
//        R1.Top   := R1.Top + cnstVMargin;
//        R1.Right := R1.Right - cnstHMargin;
//        R1.Bottom:= R1.Bottom - cnstVMargin;
//
//        if (R1.Bottom - R1.Top < SG.DefaultRowHeight) and (R1.Right - R1.Left < SG.DefaultColWidth) then
//           TUD_Panel(SG.Objects[ C, R ]).SetBounds( R1.Left, R1.Top, R1.Right - R1.Left, R1.Bottom - R1.Top);
//      end;
end;


function TFrmUserFieldsLayoutManager.FindUDPanel( AUD_GroupBox_ID: Real ): TUD_Panel;
var
  I: Integer;
  R, C: Integer;
begin
  for R:= 1 to SG.RowCount - 1 do
    for C:= 1 to SG.ColCount - 1 do
//      if Assigned(SG.Objects[ C, R ]) and (SG.Objects[ C, R ] is TUD_Panel) and (TUD_Panel(SG.Objects[ C, R ]).UD_GroupBox_ID = AUD_GroupBox_ID) then
//       begin
//         Result:= SG.Objects[ C, R ] as TUD_Panel;
//         EXIT;
//       end;
  Result:= nil;
end;

procedure TFrmUserFieldsLayoutManager.UpdateUDPanelText( AUD_GroupBox_ID: Integer );
var
  AUDPanel: TUD_Panel;
  A: Variant;
begin
  AUDPanel:= FindUDPanel( AUD_GroupBox_ID );
  if not Assigned( AUDPanel ) then
     EXIT;

  A:= SelectValueArrayFmt( 'select nvl( rtrim(caption), name) as caption,                               '+
                      '       (select count(*) from ud_cols where ud_groupbox_id = ud_groupbox.id) '+
                      '  from ud_groupbox                                                          '+
                      ' where id = %d                                                              ',
                      [ AUD_GroupBox_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  AUDPanel.UpdateText( A[ 0 ], A[ 1 ]);
end;


procedure TFrmUserFieldsLayoutManager.UnselectAll;
var
  I: Integer;
  R, C: Integer;
begin
  for R:= 1 to SG.RowCount - 1 do
    for C:= 1 to SG.ColCount - 1 do
//      if Assigned(SG.Objects[ C, R ]) and (SG.Objects[ C, R ] is TUD_Panel) then
//         TUD_Panel(SG.Objects[ C, R ]).UnSelect;
end;

procedure TFrmUserFieldsLayoutManager.UpdateRowColInTable( Sender: TObject; ACol, ARow: Integer );
var
  AUD_Panel: TUD_Panel;
begin
  if not (Sender is TUD_Panel) then EXIT;  // prwcaution

  AUD_Panel:= Sender as TUD_Panel;

  ExecuteCommandFmt('update ud_groupbox set col_num = %d, row_num = %d where id = %f', [ ACol, ARow, AUD_Panel.UD_Groupbox_ID ]);
  RefreshDataSetByID( QryUDGroupBox );
end;


end.
