unit Fin_Rpt;

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
  Acct_TV,
  DB,
  Grids,
  DBGrids,
  DBCtrls,
  Buttons,
  ComCtrls,
  StdCtrls,
  ExtCtrls,
  Acct_Pk,
  IQMS.Common.JumpConstants,
  Menus,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.RepDef,
  ImgList,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
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
  uniEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniTimer,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniPageControl, uniImageList, uniStatusBar, uniTreeView, uniGUIAbstractClasses;

type
  TFrmFinancialReport = class(TAcctTreeView)
    sbtnPkAcct: TUniSpeedButton;
    PnlToolbarRpt: TUniPanel;
    sbtnSearch: TUniSpeedButton;
    NavMain: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    Splitter1: TUniSplitter;
    SrcFinancial_Rpt: TDataSource;
    TblFinancial_Rpt: TFDTable;
    PopupMenu1: TUniPopupMenu;
    Insert1: TUniMenuItem;
    Delete1: TUniMenuItem;
    TblFinancial_RptID: TBCDField;
    TblFinancial_RptDESCRIP: TStringField;
    TblFinancial_RptREPORT_NAME: TStringField;
    OpenDialog1: TOpenDialog;
    sbtnAssignDef: TUniSpeedButton;
    PkFinancialRep: TIQWebHPick;
    PkFinancialRepID: TBCDField;
    PkFinancialRepDESCRIP: TStringField;
    PkFinancialRepREPORT_NAME: TStringField;
    MainMenu1: TUniMainMenu;
    IQAbout1: TIQWebAbout;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Report1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SR: TIQWebSecurityRegister;
    N1: TUniMenuItem;
    Duplicate1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    Contents1: TUniMenuItem;
    TblFinancial_RptUSERID: TStringField;
    TimerUp: TUniTimer;
    TimerDown: TUniTimer;
    Options1: TUniMenuItem;
    InitializeEnterpriseIQSpreadsheetServer1: TUniMenuItem;
    Bevel2: TUniPanel;
    Bevel3: TUniPanel;
    PnlHeaderFooter: TUniPanel;
    pcHeaderFooter: TUniPageControl;
    sheetAccountType: TUniTabSheet;
    PnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label3: TUniLabel;
    PnlClient02: TUniPanel;
    edHeader: TUniEdit;
    edFooter: TUniEdit;
    procedure FormCreate(Sender: TObject);
    procedure SrcFinancial_RptDataChange(Sender: TObject; Field: TField);
    procedure sbtnPkAcctClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure TreeView1Changing(Sender: TObject; Node: TUniTreeNode;
      var AllowChange: Boolean);
    procedure TreeView1Change(Sender: TObject; Node: TUniTreeNode);
    procedure sbtnAssignDefClick(Sender: TObject);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edHeaderChange(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Duplicate1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure Panel3DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure sheetAccountTypeDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);

    procedure ScrollDown(Sender: TObject);
    procedure ScrollUp(Sender: TObject);
    procedure TblFinancial_RptAfterScroll(DataSet: TDataSet);
    procedure InitializeEnterpriseIQSpreadsheetServer1Click(
      Sender: TObject);
    procedure TreeView1Expanding(Sender: TObject; Node: TUniTreeNode;
      var AllowExpansion: Boolean);

  private
    { Private declarations }
    FChanged: Boolean;
    FStart  :Integer;
    FFirstAdd:boolean;
    FTopNode: TUniTreeNode;
    procedure SetChanged( AValue: Boolean );
    procedure IQAfterCloseChild( var Msg: TMessage ); message iq_AfterCloseChild;
    procedure SaveTreeToTable( ANode: TUniTreeNode; AParentID: Real );
    procedure SaveTreeToTable1( ANode: TUniTreeNode; AParentID: Real );
    function SaveNodeToTable( AParentID:Real; ANode:TUniTreeNode ):Real;
    function SaveNodeToTable1( AParentID:Real; ANode:TUniTreeNode ):Real;
    procedure InsertSubTreeNew( ANode : TUniTreeNode );
    procedure InsertSubTree( ANode : TUniTreeNode );
    procedure EnsureNoEmptyParents;
    function  LocateNode(Node:TUniTreeNode):TUniTreeNode;
    function  CreateBranch(ANode:TUniTreeNode):TUniTreeNode;
    procedure ResetQuery;

    procedure InsertInTheMiddle(ADestination, ANode:TUniTreeNode );
    function  GetParent(ANode:TUniTreeNode):TUniTreeNode;
    procedure AddDummy( ANode : TUniTreeNode );

    procedure Resort(aNode : TUniTreeNode);
    procedure DeleteTableData(aId:Real);
    procedure AddChildern(Node:TUniTreeNode);
  public
    { Public declarations }
    CurrentReportID: Real;
    PickAccount: TAcctTreeViewPk;
    DraggedNode: TUniTreeNode;
    property Changed : Boolean read FChanged write SetChanged ;
    procedure LoadTreeViewFromQuery; override;
    procedure BuildNodes( APrentNode: TUniTreeNode; TreeLevel: Integer; AQuery:TFDQuery);override;
    procedure MajorTypeProcess( Node: TUniTreeNode; DataSet: TDataSet ); override;
    procedure SubTypeProcess  ( Node: TUniTreeNode; DataSet: TDataSet  ); override;
    procedure UserTypeProcess ( Node: TUniTreeNode; DataSet: TDataSet  ); override;
    procedure GLAcctProcess   ( Node: TUniTreeNode; DataSet: TDataSet  ); override;
    procedure SaveToQueryFromTeeView;
    procedure LoadSubTreeViewFromQuery( AQuery: TFDQuery ); override;
  end;

procedure DoFinancialReport;


implementation
{$R *.DFM}

uses
  fin_rpt_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.NLS,
  IQMS.Common.PanelMsg,
  uniGUIApplication;


procedure DoFinancialReport;
begin
   TFrmFinancialReport.Create(UniApplication).Show;
end;

procedure TFrmFinancialReport.FormCreate(Sender: TObject);
begin
  inherited; {Calls IQRegFrm}
  FPkTreeview := false;

  Changed:= FALSE;
  // 'Accessing Financial Reporting.  Please wait.'
  IQSetTablesActiveEx( TRUE, self, fin_rpt_rscstr.cTXT0000001 );
  { TODO -oathite -cWebConvert : Incompatible types: 'TForm' and 'TFrmFinancialReport'
  IQMS.Common.Controls.CenterForm(Self); }
  IQRegFormRead( self, [ dbgrid1, PnlLeft01 ]);
  { TODO -oathite -cWebConvert : Incompatible types: 'TDBNavigator' and 'TUniDBNavigator'
  IQMS.Common.Controls.ResizeNavBar(NavMain); }
  IQMS.Common.Controls.AdjustPageControlToParent(pcHeaderFooter);
  Panel1.Visible := false;
  StatusBar1.Visible := false;
end;

procedure TFrmFinancialReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
//var
// DBase:TFDConnection;
begin
{
  try
    inherited;
    if Changed and IQWarningYN(fin_rpt_rscstr.cTXT0000002) then
       SaveToQueryFromTeeView;
  finally
    DBase:= FDManager.FindConnection('IQFD');
    if Assigned(DBase) and DBase.InTransaction then DBase.RollBack;
  end;
}
  IQRegFormWrite( self, [ dbgrid1, PnlLeft01 ]);
end;

procedure TFrmFinancialReport.SetChanged( AValue: Boolean );
begin
  if FChanged <> AValue then
  begin
    FChanged:= AValue;
    if FChanged then
       State:= 'Modified'
    else
       State:= '';
    btnOK.Enabled    := FChanged;
    btnCancel.Enabled:= FChanged;
  end;
end;

procedure TFrmFinancialReport.SrcFinancial_RptDataChange(Sender: TObject;
  Field: TField);
begin
  inherited; {nothing}
//  if Changed and IQWarningYN(fin_rpt_rscstr.cTXT0000002) then
//     SaveToQueryFromTeeView;
  ResetQuery;
  LoadTreeViewFromQuery;
  if (TblFinancial_Rpt.State in [dsInsert]) or (TreeView1.Items.Count = 0) then
  begin
    edHeader.Text := '';
    edFooter.Text := '';
  end;
end;

procedure TFrmFinancialReport.ResetQuery;
begin
  with QryAcct do
  begin
    Close;
//    ParamByName('nId').Value :=  TblFinancial_Rpt.FieldByName('ID').asFloat;
    AssignQueryParamValue(QryAcct, 'nId', TblFinancial_Rpt.FieldByName('ID').asFloat);
    AssignQueryParamValue(QryAcct, 'AParentId', 0);
    Open;
  end;
end;

procedure TFrmFinancialReport.LoadTreeViewFromQuery;
begin
  inherited;
  Changed:= FALSE;
  CurrentReportID:= TblFinancial_RptID.asFloat;
  //sbtnExpandClick(NIL);
end;

procedure TFrmFinancialReport.sbtnPkAcctClick(Sender: TObject);
begin
  inherited;   {nothing}
  if Assigned(PickAccount) then
     PickAccount.BringToFront
  else
  begin
     PickAccount:= TAcctTreeViewPk.Create(UniApplication);
     PickAccount.PkTreeview := false;
     PickAccount.Show;
  end;
end;

procedure TFrmFinancialReport.IQAfterCloseChild( var Msg: TMessage );
begin
  if Msg.WParam = 1 then
     PickAccount:= NIL;
end;

procedure TFrmFinancialReport.Delete1Click(Sender: TObject);
begin
  inherited; {nothing}
  if Treeview1.Selected =  nil then Exit;

  ExecuteCommandFmt('delete from financial_rpt_detail where id in ' +
                    ' (select id                                  ' +
                    '   from financial_rpt_detail                 ' +
                    '  where financial_rpt_id = %f                ' +
                    '   start with NVL(id, 0) = %f                ' +
                    ' connect by parent_id = prior id)', 
                    [TblFinancial_Rpt.FieldByName('ID').asFloat,
                    TFinCargo(TreeView1.Selected.Data).sID]);
  
  SrcFinancial_RptDataChange(nil, nil);            

  exit;

  
  with TreeView1 do
  begin
    if Assigned(  Selected.Data ) then
    begin
       DeleteTableData(TFinCargo(Selected.Data).sID);
//       ExecuteCommandFmt('delete from Financial_Rpt_Detail where id = %f', [TFinCargo(Selected.Data).sID]);
//       ExecuteCommandFmt('delete from Financial_Rpt_Detail where parent_id = %f', [TFinCargo(Selected.Data).sID]);
       TObject( Selected.Data ).Free;
    end;
    Items.Delete( Selected );
  end;
  EnsureNoEmptyParents;
  Changed:= TRUE;
end;

procedure TFrmFinancialReport.EnsureNoEmptyParents;
begin
  if Assigned(TreeView1.Selected) then with TreeView1.Selected do
     if (TFinCargo(TreeView1.Selected.Data).AcctID = 0) and not HasChildren then
     begin
       if Assigned( Data ) then
       begin
//         ExecuteCommandFmt('delete from Financial_Rpt_Detail where id = %f', [TFinCargo(Data).sID]);
//         ExecuteCommandFmt('delete from Financial_Rpt_Detail where parent_id = %f', [TFinCargo(Data).sID]);
         TObject(Data).Free;
       end;
       { TODO -oathite -cWebConvert : '(' expected but ';' found
       Delete; }
       EnsureNoEmptyParents;
     end;
end;

procedure TFrmFinancialReport.AssignIDBeforePost(DataSet: TDataSet);
begin
  inherited;
  IQAssignIDBeforePost(DataSet);
end;

procedure TFrmFinancialReport.DBGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
  with OpenDialog1 do
  begin
    InitialDir:= IQGetReportsPath;
    FileName  := (Sender as TUniDBGrid).DataSource.DataSet.FieldByName('report_name').asString;
    if Execute then
    begin
       if (not (Trim(FileName) = '')) and (not FileExists(FileName)) then
          // 'Cannot find file, %s.'
          raise Exception.Create(Format(fin_rpt_rscstr.cTXT0000003, [FileName]));

       with (Sender as TUniDBGrid).DataSource.DataSet do
       begin
         Edit;
         FieldByName('report_name').asString := ExtractFileName(FileName);
       end
    end;
  end;
end;

procedure TFrmFinancialReport.MajorTypeProcess( Node: TUniTreeNode; DataSet :TDataSet  );
begin
//  Node.Data:= TFinCargo.Create( DataSet.FieldByName('major_heading').asString,
//                                DataSet.FieldByName('major_footer').asString,
//                                0 );
end;

procedure TFrmFinancialReport.SubTypeProcess( Node: TUniTreeNode; DataSet :TDataSet  );
begin
//  Node.Data:= TFinCargo.Create( DataSet.FieldByName('subtype_heading').asString,
//                                DataSet.FieldByName('subtype_footer').asString,
//                                0 );
end;

procedure TFrmFinancialReport.UserTypeProcess( Node: TUniTreeNode; DataSet :TDataSet  );
begin
//  Node.Data:= TFinCargo.Create( DataSet.FieldByName('usertype_heading').asString,
//                                DataSet.FieldByName('usertype_footer').asString,
//                                0 );
end;

procedure TFrmFinancialReport.GLAcctProcess( Node: TUniTreeNode; DataSet :TDataSet  );
begin
//  Node.Data:= TFinCargo.Create( DataSet.FieldByName('glacct_heading').asString,
//                                DataSet.FieldByName('glacct_footer').asString,
//                                DataSet.FieldByName('glacct_id').asFloat);
end;

procedure TFrmFinancialReport.TreeView1Changing(Sender: TObject;
  Node: TUniTreeNode; var AllowChange: Boolean);
begin
  inherited; {nothing}

  if Changing then
     EXIT;

  { Store back into Cargo object from Edits}
  if (Sender is TUniTreeView)
     and Assigned( TUniTreeView( Sender ).Selected )
     and Assigned( TUniTreeView( Sender ).Selected.Data ) then
        with TFinCargo( TUniTreeView( Sender ).Selected.Data ) do
        begin
           Header:= edHeader.Text;
           Footer:= edFooter.Text;
        end
end;

procedure TFrmFinancialReport.TreeView1Change(Sender: TObject;
  Node: TUniTreeNode);
begin
  inherited;

  if Changing then
     EXIT;

  { Assign from Cargo object into Edit fields }
  if Assigned(Node) and Assigned(Node.Data) then
     with TFinCargo( Node.Data ) do
     begin
        edHeader.Text:= Header;
        edFooter.Text:= Footer;
     end
  else
     begin
        edHeader.Text:= '';
        edFooter.Text:= '';
     end
end;

procedure TFrmFinancialReport.sbtnAssignDefClick(Sender: TObject);
var
  I:Integer;
begin
  inherited; {nothing}

  // 'Assign Header and Footer text based on Tree View Nodes names?'
  if IQConfirmYN(fin_rpt_rscstr.cTXT0000004) then
  with TreeView1 do
  try
    ExecuteCommandFmt('update financial_rpt_detail set heading = acct_type, footer = ''TOTAL '' || acct_type where financial_rpt_id = %f', [TblFinancial_RptID.asFloat]);
    Changing:= TRUE;
    for I:= 0 to Items.Count - 1 do with Items[ I ] do
      if Assigned(Data) then with TFinCargo( Data ) do
      begin
        Header:= Items[ I ].Text;
        //Footer:= 'TOTAL ' + Items[ I ].Text;
        Footer := Format(fin_rpt_rscstr.cTXT0000016 {'TOTAL %s'}, [Items[I].Text]);
      end;

    {Take care of the current}
    if Assigned(Selected) then
    begin
       edHeader.Text:= Selected.Text;
       //edFooter.Text:= 'TOTAL ' + Selected.Text;
       edFooter.Text := Format(fin_rpt_rscstr.cTXT0000016 {'TOTAL %s'}, [Selected.Text]);
    end;
  finally
    Changing:= FALSE;
    Changed:= TRUE;
  end;
end;

procedure TFrmFinancialReport.btnCancelClick(Sender: TObject);
begin
  // 'Cancel changes?'
  if Changed and IQWarningYN(fin_rpt_rscstr.cTXT0000005) then
     LoadTreeViewFromQuery;
  // inherited;
end;

procedure TFrmFinancialReport.btnOKClick(Sender: TObject);
begin
  if Changed then
     SaveToQueryFromTeeView;
  // inherited;
end;

procedure TFrmFinancialReport.SaveToQueryFromTeeView;
begin
  TblFinancial_Rpt.CheckBrowseMode;
  with FDManager.FindConnection('IQFD') do
  try
    StartTransaction;
    Status:= fin_rpt_rscstr.cTXT0000006; // 'Updating database.  Please wait...'
    Cursor:= crHourGlass;

    ExecuteCommandFmt('delete from Financial_Rpt_Detail where FINANCIAL_RPT_ID = %f', [ CurrentReportID ]);
    SaveTreeToTable( TreeView1.Items.GetFirstNode, 0 );
    Commit;

    Changed:= FALSE;
  finally
    Status := '';
    if InTransaction then
       RollBack;
    Cursor:= crDefault;
  end;
end;

procedure TFrmFinancialReport.SaveTreeToTable( ANode: TUniTreeNode; AParentID: Real );
var
  I:Integer;
  ID:Real;
begin
  while Assigned(ANode) do
  begin
    Application.ProcessMessages;
    ID:= SaveNodeToTable( AParentID, ANode );
    SaveTreeToTable( ANode.GetFirstChild, ID );
    { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNextSibling'
    ANode:= ANode.GetNextSibling; }
  end;
end;

procedure TFrmFinancialReport.SaveTreeToTable1( ANode: TUniTreeNode; AParentID: Real );
var
  I:Integer;
  ID:Real;
begin
  while Assigned(ANode) do
  begin
    Application.ProcessMessages;
    ID:= SaveNodeToTable1( AParentID, ANode );
    SaveTreeToTable1( ANode.GetFirstChild, ID );
    { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNextSibling'
    ANode:= ANode.GetNextSibling; }
  end;
end;
function TFrmFinancialReport.SaveNodeToTable( AParentID:Real; ANode:TUniTreeNode ):Real;
var
  AIndex:Integer;
  AParentId2:String;
begin
  {Note: SORT_ID is populated via trigger }
  Status:= Format(fin_rpt_rscstr.cTXT0000007 {'Saving %s ...'}, [ ANode.Text ]);
  if ANode.Data = nil then
  begin
    with QryGLAcct do
    begin
      Filtered:= TRUE;
      Filter  := Format('GL_SUBACCT_TYPE_ID = %.0f', [ TFinCargo(ANode.Parent.Data).sID ]);
      Open;
      First;
      AIndex := 1;
      while not Eof do
      begin
        Result:= GetNextID( 'financial_rpt_detail' );
        AParentId2 := sIIf( AParentID > 0, FloatToStr(AParentID), 'NULL');
        ExecuteCommandFmt('insert into financial_rpt_detail ' +
                  '        (id, financial_rpt_id, parent_id, acct_type, seq, glacct_id ) '+
                  ' values( %f, %f, %s, ''%s'', %d, %f )',
                  [ Result,                                                {id}
                    CurrentReportID,                                       {financial_rpt_id}
                    AParentId2,   {parent_id}
                    StrTran( ANode.Parent.Text,  '''', '''''' ),           {acct_type}
                    AIndex,                                                {seq}
                    QryGLAcctID.asFloat]); {acct_id }
        AIndex := AIndex + 1;
        Next;
      end;
    end;
  end
  else
  begin
    Result:= GetNextID( 'financial_rpt_detail' );
    ExecuteCommandFmt('insert into financial_rpt_detail '+
              '        (id, financial_rpt_id, parent_id, acct_type, seq, heading, footer, glacct_id ) '+
              ' values( %f, %f,               %s,        ''%s'',    %d,  ''%s'',  ''%s'', %s )',
              [ Result,                                                {id}
                CurrentReportID,                                       {financial_rpt_id}
                sIIf( AParentID > 0, FloatToStr(AParentID), 'NULL'),   {parent_id}
                StrTran( ANode.Text,  '''', '''''' ),                  {acct_type}
                { TODO -oathite -cWebConvert : Undeclared identifier: Index'
                ANode.Index,                                           {seq}
                StrTran( TFinCargo(ANode.Data).Header, '''', '''''' ), {heading}
                StrTran( TFinCargo(ANode.Data).Footer, '''', '''''' ), {footer}
                sIIf( TFinCargo(ANode.Data).AcctID > 0, FloatToStr(TFinCargo(ANode.Data).AcctID), 'NULL')]); {acct_id }

  end;


end;

function TFrmFinancialReport.SaveNodeToTable1( AParentID:Real; ANode:TUniTreeNode ):Real;
var
  AIndex:Integer;
  AParentId2:String;
  aId:Real;
begin
  {Note: SORT_ID is populated via trigger }
  Status:= Format(fin_rpt_rscstr.cTXT0000007 {'Saving %s ...'}, [ ANode.Text ]);
  if ANode.Data = nil then
  begin
    with QryGLAcct do
    begin
      Filtered:= TRUE;
      Filter  := Format('GL_SUBACCT_TYPE_ID = %.0f', [ TFinCargo(ANode.Parent.Data).sID ]);
      Open;
      First;
      AIndex := 1;
      while not Eof do
      begin
        Result:= GetNextID( 'financial_rpt_detail' );
        AParentId2 := sIIf( AParentID > 0, FloatToStr(AParentID), 'NULL');
        ExecuteCommandFmt('insert into financial_rpt_detail ' +
                  '        (id, financial_rpt_id, parent_id, acct_type, seq, glacct_id ) '+
                  ' values( %f, %f, %s, ''%s'', %d, %f )',
                  [ Result,                                                {id}
                    CurrentReportID,                                       {financial_rpt_id}
                    AParentId2,   {parent_id}
                    StrTran( ANode.Parent.Text,  '''', '''''' ),           {acct_type}
                    AIndex,                                                {seq}
                    QryGLAcctID.asFloat]); {acct_id }
        AIndex := AIndex + 1;
        Next;
      end;
    end;
  end
  else
  begin
    aId := TFinCargo(ANode).sId;
    if (aId = 0) or (SelectValueFmtAsFloat('select id from financial_rpt_detail where id = %f', [aId]) = 0) then
    begin
      Result:= GetNextID( 'financial_rpt_detail' );

      TFinCargo(ANode.Data).sId := Result;
      if Assigned(ANode.Parent) and (ANode.Parent <> nil) then
        TFinCargo(ANode).sParentId := TFinCargo(ANode.Parent).sId
      else
        TFinCargo(ANode).sParentId := 0;

      if (TFinCargo(ANode).sParentId = 0) and (AParentID <> 0) then
        TFinCargo(ANode).sParentId := AParentID;

      AParentID := TFinCargo(ANode).sParentId;

      ExecuteCommandFmt('insert into financial_rpt_detail '+
                '        (id, financial_rpt_id, parent_id, acct_type, seq, heading, footer, glacct_id ) '+
                ' values( %f, %f,               %s,        ''%s'',    %d,  ''%s'',  ''%s'', %s )',
                [ Result,                                                {id}
                  CurrentReportID,                                       {financial_rpt_id}
                  sIIf( AParentID > 0, FloatToStr(AParentID), 'NULL'),   {parent_id}
                  StrTran( ANode.Text,  '''', '''''' ),                  {acct_type}
                  { TODO -oathite -cWebConvert : Undeclared identifier: Index'
                  ANode.Index,                                           {seq}
                  StrTran( TFinCargo(ANode.Data).Header, '''', '''''' ), {heading}
                  StrTran( TFinCargo(ANode.Data).Footer, '''', '''''' ), {footer}
                  sIIf( TFinCargo(ANode.Data).AcctID > 0, FloatToStr(TFinCargo(ANode.Data).AcctID), 'NULL')]); {acct_id }

    end
    else
      Result := aId;
  end;


end;
procedure TFrmFinancialReport.edHeaderChange(Sender: TObject);
begin
  inherited; {nothing}

  if Assigned(TreeView1.Selected) then with TreeView1.Selected do
     if Assigned( Data ) then with TFinCargo( Data ) do
     begin
        if Sender = edHeader then
        begin
           Changed:= Changed or (edHeader.Text <> TFinCargo(Data).Header);
           Header:= edHeader.Text;
        end
        else if Sender = edFooter then
        begin
           Changed:= Changed or (edFooter.Text <> TFinCargo(Data).Footer );
           Footer := edFooter.Text;
        end
     end
end;

procedure TFrmFinancialReport.TreeView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited; {nothing}

  if ssLeft in Shift then
  begin
     DraggedNode:= TUniTreeView( Sender ).Selected;
     TreeView1.BeginDrag(FALSE);
  end;    
end;

procedure TFrmFinancialReport.TreeView1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  ANode: TUniTreeNode;
begin
  inherited; {nothing}
  TimerUp.Enabled := False;
  TimerDown.Enabled := False;

  Accept:= FALSE;
  if not ( (Source is TUniTreeView) and (Sender is TUniTreeView) ) then
     EXIT;

  if Sender = Source then
  begin
     { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNodeAt'
     ANode:= (Sender as TUniTreeView).GetNodeAt( X,Y );
     if Assigned(ANode) then
        Accept:= ( DraggedNode.Parent = ANode.Parent );                }
  end
  else
  begin
    Accept:= TRUE;
  end;
end;


procedure TFrmFinancialReport.TreeView1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  Destination:TUniTreeNode;
  DestinText, SourceText:String;
  AItemsCount:Integer;
begin
  inherited; {nothing}
  AItemsCount := TreeView1.Items.Count;
  { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNodeAt'
  Destination:= (Sender as TUniTreeView).GetNodeAt(X,Y); }
  if Sender = Source then
  begin
    if Assigned(Destination) then
    begin
      { TODO -oathite -cWebConvert : Undeclared identifier: 'MoveTo'
      DraggedNode.MoveTo( Destination, naInsert );                   }
      Resort(Destination);
    end;
  end
  else
  begin
    FStart := 0;
    FFirstAdd := true;
    FTopNode := nil;
    InsertSubTreeNew( (Source as TUniTreeView).Selected );  {This Source Node came from the picklist}
    AddDummy( (Source as TUniTreeView).Selected );

//    if FTopNode <> nil then
//    SaveTreeToTable1( TreeView1.Items.GetFirstNode, 0 );
    if (Destination <> nil) and Assigned(Destination) and (Destination.Level = (Source as TUniTreeView).Selected.Level) then
    begin
      DestinText := '';
      SourceText := '';
      if Destination.Parent <> nil then DestinText := Destination.Parent.Text;
      if (Source as TUniTreeView).Selected.Parent <> nil then SourceText := (Source as TUniTreeView).Selected.Parent.Text;
      if DestinText = SourceText then
      begin
        InsertInTheMiddle(Destination, (Source as TUniTreeView).Selected );
        Resort(Destination);
      end;
    end;
  end;
  Changed:= TRUE;
  {Weird Fix of TreeView refresh problem}
//  if AItemsCount = 0 then with TreeView1 do
//  begin
//    TopItem.Expand( FALSE {Recurse} );
//    TopItem.Collapse( FALSE {Recurse} ) ;
//  end;
end;


procedure TFrmFinancialReport.InsertInTheMiddle(ADestination, ANode:TUniTreeNode );
var
  AFirstParent:TUniTreeNode;
  AMyNode:TUniTreeNode;
  i:Integer;
begin
  AFirstParent := GetParent(ANode);
  AMyNode := LocateNode(AFirstParent);
  if AMyNode <> nil then
  begin
    { TODO -oathite -cWebConvert : Undeclared identifier: 'MoveTo'
    AMyNode.MoveTo( ADestination, naInsert );  }
  end;
end;

function TFrmFinancialReport.GetParent(ANode:TUniTreeNode):TUniTreeNode;
begin
  if ANode.Parent = nil then
    Result := ANode
  else
    Result:= GetParent(ANode.Parent);
end;


//procedure TFrmFinancialReport.TreeView1DragDrop(Sender, Source: TObject; X,
//  Y: Integer);
//var
//  Destination:TTreeNode;
//begin
//  inherited; {nothing}
//  if Sender = Source then
//  begin
//    Destination:= (Sender as TTreeView).GetNodeAt(X,Y);
//    if Assigned(Destination) then
//      DraggedNode.MoveTo( Destination, naInsert );
//  end
//  else
//  begin
//    FStart := 0;
//    InsertSubTree( (Source as TTreeView).Selected );  {This Source Node came from the picklist}
//  end;
//  Changed:= TRUE;
//end;

procedure TFrmFinancialReport.InsertSubTree( ANode : TUniTreeNode );
var
  i:Integer;
begin
    if ANode <> nil then
    begin
      CreateBranch(ANode);
      for I:= 0 to ANode.Count - 1 do
        InsertSubTree( ANode.Item[ I ]);
    end;

end;

function TFrmFinancialReport.CreateBranch(ANode:TUniTreeNode):TUniTreeNode;
var
  aId, AParentID:Real;
begin
  Result:= LocateNode(ANode);

  if Assigned(ANode) and not Assigned( Result ) then
  begin
    if ANode.Data <> nil then
    begin
       { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
       Result:= TreeView1.Items.AddChildObject( CreateBranch( ANode.Parent ),  // ANode.Parent,
                                                ANode.Text,
                                                TFinCargo.Create( '', '', TFinCargo(ANode.Data).AcctID, TFinCargo(ANode.Data).sID, 0)); }

      aId:= GetNextID( 'financial_rpt_detail' );

      TFinCargo(Result.Data).sId := aId;
      if Assigned(Result.Parent) and (Result.Parent <> nil) then
        TFinCargo(Result.Data).sParentId := TFinCargo(Result.Parent.Data).sId
      else
        TFinCargo(Result.Data).sParentId := 0;

      if (TFinCargo(Result.Data).sParentId = 0) and (AParentID <> 0) then
        TFinCargo(Result.Data).sParentId := AParentID;

      AParentID := TFinCargo(Result.Data).sParentId;

      if Abs(AParentID) < 0.1 then
        AParentID  := 0;


      ExecuteCommandFmt('insert into financial_rpt_detail '+
                '        (id, financial_rpt_id, parent_id, acct_type, seq, heading, footer, glacct_id ) '+
                ' values( %f, %f,               %s,        ''%s'',    %d,  ''%s'',  ''%s'', %s )',
                [ aId,                                                {id}
                  TblFinancial_Rpt.FieldByName('ID').asFloat,         {financial_rpt_id}
                  sIIf( AParentID > 0, FloatToStr(AParentID), 'NULL'),   {parent_id}
                  StrTran( Result.Text,  '''', '''''' ),                  {acct_type}
                  { TODO -oathite -cWebConvert : Undeclared identifier: 'Index'
                  ANode.Index,                                           {seq}
                  StrTran( TFinCargo(Result.Data).Header, '''', '''''' ), {heading}
                  StrTran( TFinCargo(Result.Data).Footer, '''', '''''' ), {footer}
                  sIIf( TFinCargo(Result.Data).AcctID > 0, FloatToStr(TFinCargo(Result.Data).AcctID), 'NULL')]); {acct_id }



     end;
  end;
end;

function TFrmFinancialReport.LocateNode(Node:TUniTreeNode):TUniTreeNode;
var
  i:integer;
  CurrNode:TUniTreeNode;
begin
// if Assigned(Node) then
//  with TreeView1 do
//  for i:= FStart to Items.Count-1 do
//    if (Node.Level = Items[i].Level) and (Node.Text = Items[i].Text) then
//    begin
//      Result := Items[i];
//      Exit;
//    end;
//  Result := NIL;


 if Assigned(Node) and (TreeView1.Items.Count <> 0) and (FStart < TreeView1.Items.Count)then
  with TreeView1 do
  begin
    CurrNode := Items[FStart];
    if CurrNode <> nil then
    begin
      repeat
        if (Node.Level = CurrNode.Level) and (Node.Text = CurrNode.Text) then
        begin
          Result := CurrNode;
          Exit;
        end;
        { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNext'
        CurrNode := CurrNode.GetNext;                                   }
      until CurrNode = nil;
    end;
  end;
  Result := NIL;

end;

procedure TFrmFinancialReport.sbtnSearchClick(Sender: TObject);
begin
  inherited; {nothing}
  with PkFinancialRep do
    if Execute then
       TblFinancial_Rpt.FindKey([ GetValue('ID') ])
end;

procedure TFrmFinancialReport.About1Click(Sender: TObject);
begin
  inherited; {nothing}
  IQAbout1.Execute;
end;

procedure TFrmFinancialReport.PrintSetup1Click(Sender: TObject);
begin
  inherited; {nothing}
  PrinterSetupDialog1.Execute;
end;

procedure TFrmFinancialReport.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
{  with TPrintDialog.Create(self) do
  try
    MaxPage := -1;
    Options := [poPageNums];
    if not Execute then
      Exit;
  finally
    Free;
  end;

  ACrpe:= TCrpe.Create(self);
  with ACrpe do
  try
    ReportName:= IQGetReportsPath + TblFinancial_RptREPORT_NAME.asString;
    if not FileExists(ReportName) then
      raise Exception.Create('Report not found');

    Destination:= toPrinter;
    Connect:= Format('DSN = %s; UID = %s; PWD = %s; DSQ = ', [IQGetServerName('IQ'),
                                                              IQGetUID('IQ'),
                                                              IQGetPassword('IQ')]);
    SetCRWPrinter( ACrpe );  //IQPrint
    Execute;
  finally
    Free;
  end;}
end;

procedure TFrmFinancialReport.Exit1Click(Sender: TObject);
begin
  inherited; {nothing}
  Close;
end;

procedure TFrmFinancialReport.Duplicate1Click(Sender: TObject);
begin
  inherited; {nothing}
  FStart := TreeView1.Items.Count;
  InsertSubTree( TreeView1.Selected );
end;

procedure TFrmFinancialReport.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmGL{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmFinancialReport.Contents1Click(Sender: TObject);
begin
//  Application.HelpContext(52);
  IQHelp.HelpContext( 1113106 );
end;

procedure TFrmFinancialReport.ScrollDown(Sender: TObject);
var
  ATopItem:TUniTreeNode;
  NextNode:TUniTreeNode;
begin
  with Treeview1 do
  begin
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TopItem'
    ATopItem := TopItem; }
    { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNextVisible'
    NextNode := ATopItem.GetNextVisible;
    if NextNode <> nil then
      TopItem := NextNode; }
  end;
end;

procedure TFrmFinancialReport.ScrollUp(Sender: TObject);
var
  ATopItem:TUniTreeNode;
  PrevNode:TUniTreeNode;
begin
  with Treeview1 do
  begin
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TopItem'
    ATopItem := TopItem; }
    if ATopItem = nil then exit;
    { TODO -oathite -cWebConvert : Undeclared identifier: 'GetPrevVisible'
    PrevNode := ATopItem.GetPrevVisible;
    if PrevNode <> nil then
      TopItem := PrevNode; }
  end;
end;

procedure TFrmFinancialReport.Panel3DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  TimerUp.Enabled := True;
  Accept := False;
end;

procedure TFrmFinancialReport.sheetAccountTypeDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  TimerDown.Enabled := True;
  Accept := False;
end;

procedure TFrmFinancialReport.TblFinancial_RptAfterScroll(
  DataSet: TDataSet);
begin
//  inherited;
  if visible then
    TreeView1.SetFocus;
end;

procedure TFrmFinancialReport.InitializeEnterpriseIQSpreadsheetServer1Click(Sender: TObject);
begin
  ExecuteCommand('begin gl_misc.rebuild_views; end;');
  IQInformation('Views initialized.');
end;

procedure TFrmFinancialReport.AddDummy( ANode : TUniTreeNode );
var
  aNode1 : TUniTreeNode;
begin
  ANode1 := LocateNode(ANode);
  if aNode1 = nil then exit;
  
  if ANode1.Data = nil then exit;
//  if TFinCargo(ANode.Data).AcctID = 0 then
    TreeView1.Items.AddChild( ANode1, 'Tmp');
  while true do
  begin
    { TODO -oathite -cWebConvert : Undeclared identifier: 'getNext'
    ANode1 := ANode1.getNext; }
    if ANode1 = nil then exit;
    if ANode1.Data <> nil then
//      if TFinCargo(ANode1.Data).AcctID = 0 then
        TreeView1.Items.AddChild( ANode1, 'Tmp');
  end;
end;

procedure TFrmFinancialReport.Resort(aNode : TUniTreeNode);
var
  aSibling : TUniTreeNode;
  aParent : TUniTreeNode;
  aIndex : integer;
begin
  if assigned(aNode.Parent) and (aNode.Parent <> nil) then
  begin
    aParent := aNode.Parent;

    aSibling := aParent.getFirstChild;
    aIndex := 1;
    repeat
      ExecuteCommandFmt('update financial_rpt_detail set seq = %d where id = %f', [aIndex, TFinCargo(aSibling.data).sId]);
      { TODO -oathite -cWebConvert : Undeclared identifier: 'GetNextChild'
      aSibling := aParent.GetNextChild(aSibling); }
      aIndex := aIndex + 1;
    until aSibling = nil;
  end;
end;

procedure TFrmFinancialReport.BuildNodes( APrentNode: TUniTreeNode; TreeLevel: Integer; AQuery:TFDQuery);
var
  QryLevel   : Integer;
  cAcctType  : string;
  nId        : Real;
  nParentId  : Real;
  CurrentNode: TUniTreeNode;

  GLAcct_ID_field  : TField;
  GLAcct_field     : TField;
  GLAcct_Desc_field: TField;
  QryLevel_field   : TField;
  AQuery2:TFDQuery;
begin
   with AQuery do
   begin
     GLAcct_ID_field  := FindField('GLACCT_ID');
     GLAcct_field     := FindField('ACCT');
     GLAcct_Desc_field:= FindField('ACCT_Descrip');
     QryLevel_field   := FindField('v_level');
     if not Assigned( QryLevel_field ) then
        QryLevel_field   := FindField('level');

     while not Eof do
     begin
       cAcctType := FieldByName('descrip').asString;
       QryLevel  := QryLevel_field.asInteger;
       nId       := FieldByName('id').asFloat;
       nParentId := FieldByName('parent_id').asFloat;

       {SAME LEVEL?}
//       if QryLevel = TreeLevel then
//       begin
         {No GLAcct.ID field}
         if not Assigned( GLAcct_ID_field )  then
            begin
              { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
              CurrentNode := TreeView1.Items.AddChildObject( APrentNode,
                                                             cAcctType,
                                                             TFinCargo.Create( '', '', 0, nId, nParentId)); }
//              TFinCargo(CurrentNode).sId := nId;
//              TFinCargo(CurrentNode).sParentId := nParentId;
              AssignAccounts(CurrentNode, nId);
            end

         {GLAcct_ID = 0 }
         else if GLAcct_ID_field.asFloat = 0 then
         begin
              { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
              CurrentNode := TreeView1.Items.AddChildObject( APrentNode,
                                                             cAcctType,
                                                             TFinCargo.Create( FieldByName('heading').asString, FieldByName('footer').asString, 0, nId, nParentId)); }
//              TFinCargo(CurrentNode).sId := nId;
//              TFinCargo(CurrentNode).sParentId := nParentId;

         end
         {No GLAcct.Acct, GLAcct.Descrip is linked in}
         else if not Assigned( GLAcct_field ) then
         begin
              CurrentNode:= AssignAccount( APrentNode,
                                           GLAcct_ID_field.asFloat,
                                           nId,
                                           nParentId,
                                           FieldByName('heading').asString,
                                           FieldByName('footer').asString,
                                           QryLevel );

//              TFinCargo(CurrentNode).sId := nId;
//              TFinCargo(CurrentNode).sParentId := nParentId;
         end

         {GLAcct.Acct, GLAcct.Descrip is linked in to speed up performance}
         else
         begin
              { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
              CurrentNode:= TreeView1.Items.AddChildObject( APrentNode,
                                                            Format('[%s] %s', [ GLAcct_field.asString, GLAcct_Desc_field.asString ]),
                                                            TFinCargo.Create( FieldByName('heading').asString,
                                                                              FieldByName('footer').asString ,
                                                                              GLAcct_ID_field.asFloat,
                                                                              nId,
                                                                              nParentId));   }
//              TFinCargo(CurrentNode).sId := nId;
//              TFinCargo(CurrentNode).sParentId := nParentId;
         end;
{
         AQuery2 := TFDQuery.Create(nil);
         try
           AQuery2.Connection := MainModule.FDConnection;
           AQuery2.Sql.Add('select x.financial_rpt_id,');
           AQuery2.Sql.Add('       x.seq,');
           AQuery2.Sql.Add('       x.heading,');
           AQuery2.Sql.Add('       x.footer,');
           AQuery2.Sql.Add('       x.id, ');
           AQuery2.Sql.Add('       x.parent_id,');
           AQuery2.Sql.Add('       x.v_level,');
           AQuery2.Sql.Add('       x.descrip,');
           AQuery2.Sql.Add('       x.glacct_id,');
           AQuery2.Sql.Add('       x.sort_id,');
           AQuery2.Sql.Add('       g.acct,');
           AQuery2.Sql.Add('       g.descrip as acct_descrip');
           AQuery2.Sql.Add('  from glacct g,');
           AQuery2.Sql.Add('       (select financial_rpt_id,');
           AQuery2.Sql.Add('               seq,');
           AQuery2.Sql.Add('               heading,');
           AQuery2.Sql.Add('               footer,');
           AQuery2.Sql.Add('               id, ');
           AQuery2.Sql.Add('               sort_id,');
           AQuery2.Sql.Add('               parent_id,');
           AQuery2.Sql.Add('               level as v_level,');
           AQuery2.Sql.Add('               acct_type as descrip,');
           AQuery2.Sql.Add('               glacct_id');
           AQuery2.Sql.Add('          from financial_rpt_detail');
           AQuery2.Sql.Add(IqFormat('        where financial_rpt_id = %f', [TblFinancial_Rpt.FieldByName('ID').asFloat]));
           AQuery2.Sql.Add('         start with parent_id is NULL');
           AQuery2.Sql.Add('        connect by parent_id = prior id ) x');
           AQuery2.Sql.Add(' where x.glacct_id = g.id(+) ');
           AQuery2.Sql.Add(IqFormat('   and NVL(x.parent_id, 0) = %f', [nId]));
           AQuery2.Sql.Add(' order by x.sort_ID');
           AQuery2.Open;
           if not(AQuery2.Bof and AQuery2.Eof) then
             BuildNodes(CurrentNode, TreeLevel + 1, AQuery2);
         finally
           AQuery2.Free;
         end;
}

         if TFinCargo(CurrentNode.Data).AcctID = 0  then
           TreeView1.Items.AddChild( CurrentNode, 'Tmp');
             
//         Next;
//       end
//       else
         Next;
     end;
   end;  {with AQuery}
end;

procedure TFrmFinancialReport.DeleteTableData(aId:Real);
var
  AQry:TFDQuery;
begin
  AQry := TFDQuery.Create(nil);
  try
    AQry.Connection := UniMainModule.FDConnection1;
    aQry.Sql.Add(IqFormat('select id from Financial_Rpt_Detail where parent_id = %f', [aId]));
    AQry.Open;
    if not(AQry.Bof and AQry.Eof) then
    begin
       while not AQry.Eof do
       begin
         DeleteTableData(AQry.FieldByName('id').asFloat);
         ExecuteCommandFmt('delete from Financial_Rpt_Detail where id = %f', [AQry.FieldByName('id').asFloat]);
         AQry.Next;
       end;
    end;
    ExecuteCommandFmt('delete from Financial_Rpt_Detail where id = %f', [aId]);
  finally
    AQry.Free;
  end;
end;


procedure TFrmFinancialReport.TreeView1Expanding(Sender: TObject;  Node: TUniTreeNode; var AllowExpansion: Boolean);
var
  aChild :TUniTreeNode;
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'Delete' and 'GetNextChild'
  aChild := Node.getFirstChild;
  repeat
    if aChild.Text = 'Tmp' then
      aChild.Delete;
    aChild := Node.GetNextChild(aChild);
  until aChild = nil;
  if not Node.HasChildren then
    AddChildern(Node)
  else
  begin  
    aChild := Node.getFirstChild;
    repeat
      if aChild.Text = 'Tmp' then
        aChild.Delete;
      aChild := Node.GetNextChild(aChild);
    until aChild = nil;
    if not Node.HasChildren then
      AddChildern(Node)
  end;
  Screen.Cursor := crDefault;  }
end;

procedure TFrmFinancialReport.AddChildern(Node:TUniTreeNode);
begin
  QryAcct.Close;
  AssignQueryParamValue(QryAcct, 'nId', TblFinancial_Rpt.FieldByName('ID').asFloat);
  AssignQueryParamValue(QryAcct, 'AParentId', TFinCargo(Node.Data).sID);
  QryAcct.Open;
  BuildNodes( Node, Node.Level, QryAcct);
  QryGLAcct.Close;
  QryGLAcct.Open;
end;            

procedure TFrmFinancialReport.LoadSubTreeViewFromQuery( AQuery: TFDQuery );
var
  sMajorType, sSubType, sUserType, sGLAcct:string;
  MajorTreeID, SubTypeTreeID, UserTypeTreeID, GLAcctNode : TUniTreeNode;
  hMsg: TPanelMesg;
begin
  try
     Changing:= TRUE;
     Status:= fin_rpt_rscstr.cTXT0000008; // 'Loading Accounts.  Please wait...';
     hMsg:= hPleaseWait(fin_rpt_rscstr.cTXT0000008);
     AQuery.Open;
     AQuery.First;
     BuildNodes(nil, 1, AQuery);
//     DeleteEmptyNodes;
  finally
     Changing:= FALSE;
     Merging := FALSE;
     Status:= '';
     hMsg.Free;
  end;
end;


procedure TFrmFinancialReport.InsertSubTreeNew( ANode : TUniTreeNode );
var
  aId, aFin_RptId, aParentId, acctId:Real;
  AStr:String;
  aParentNode :TUniTreeNode;
begin
  aId := TFinCargo(ANode.Data).sID;
  aFin_RptId := TblFinancial_Rpt.FieldByName('ID').asFloat;
  aParentId := TFinCargo(ANode.Data).sParentId;
  acctId := TFinCargo(ANode.Data).AcctID;
  if acctId <> 0 then
  begin
    aParentNode := ANode.Parent;
    aId := TFinCargo(aParentNode.Data).sID;
    aParentId := TFinCargo(aParentNode.Data).sParentId;
  end;
  
 ExecuteCommandFmt('begin fin_rpt.Populate_Fin_Rpt_details(%f, %f, %f, 0, %f); end;',
           [aId, 
            aFin_RptId,
            aParentId,
            acctId]);

  SrcFinancial_RptDataChange(nil, nil);            

end;


end.
