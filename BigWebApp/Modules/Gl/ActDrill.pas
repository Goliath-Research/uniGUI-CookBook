unit ActDrill;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Menus,
  { TODO -oathite -cWebConvert : Dependent on ActBachd
  ActBachd, }
  Data.DB,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet,
  IQMS.CostSource.Intf,
  IQMS.CostSource.Manager,
  IQMS.CostSource.Types,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmActDrillDown = class(TUniForm)
    Panel5: TUniPanel;
    NavBatch: TUniDBNavigator;
    Splitter1: TUniSplitter;
    BtnDrillDown: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Configure1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetUp1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PopupMenu1: TUniPopupMenu;
    PopupMenu2: TUniPopupMenu;
    DocumentAccess1: TUniMenuItem;
    BatchAccess1: TUniMenuItem;
    Contents1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    Panel3: TUniPanel;
    LblAccount: TUniLabel;
    Panel1: TUniPanel;
    LblBatch: TUniLabel;
    N1: TUniMenuItem;
    CostSource1: TUniMenuItem;
    ProjectManager1: TUniMenuItem;
    PreventativeMaintenance1: TUniMenuItem;
    FixedAssets1: TUniMenuItem;
    sbtnPITDrillDown: TUniSpeedButton;
    SR: TIQWebSecurityRegister;
    DBGridBatch: TIQUniGridControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGridBatchIdEnter(Sender: TObject);
    procedure DBGridBatchOldEnter(Sender: TObject);
    procedure BtnDrillDownClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetUp1Click(Sender: TObject);
    procedure Configure1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure DBGridBatchDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IQSearch1AfterSortChange(Sender: TObject);
    procedure DocumentAccess1Click(Sender: TObject);
    procedure sbtnPITDrillDownClick(Sender: TObject);
    procedure DBGridBatchTitleButtonClick(Sender: TObject; AFieldName: string);
    procedure DBGridBatchCalcTitleAttributes(Sender: TObject;
      AFieldName: string; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
  private
    { Private declarations }
    FSortFieldNameAKASellingPriceBreak:String;
    FCostSourceManager: ICostSourceManager;
    FOwner: TObject;
    procedure SetOwner(const Value: TObject);
  public
    { Public declarations }
    { TODO -oathite -cWebConvert : Dependent on ActBachd
    FBatchDrill : TFrmBatchDrill; }
    property Owner: TObject write SetOwner;
  end;

implementation

{$R *.DFM}

uses
  ACConfig,
  Activity,
  { TODO -oathite -cWebConvert : Dependent on Units
  APV_view,
  APView,
  BatView,
  CDView,
  cV_Void,
  cView, }
  gl_pit_drill_down,
  GLTrialB,
  { TODO -oathite -cWebConvert : Dependent on GLTrLog
  GLTrLog, }
  IQMS.Common.Controls,
  IQMS.Common.Cursor,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
  { TODO -oathite -cWebConvert : Dependent on Units
  IV_Void,
  IView;   }

procedure TFrmActDrillDown.FormCreate(Sender: TObject);
begin
  FCostSourceManager := TCostSourceManager.Create(
    Self,
    CostSource1,
    DBGridBatch.DataSource,
    TCostSourceOwnerType.GeneralLedger,
    [TCostSourceMenuType.ProjectManagerProject,
    TCostSourceMenuType.MRO,
    TCostSourceMenuType.FixedAssets]);
end;

procedure TFrmActDrillDown.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    if FOwner is TFrmActivity then
    begin
      TFrmActivity(FOwner).DrillDown1.Checked := False;
      TFrmActivity(FOwner).DrillDown2.Checked := False;
    end;
    if FOwner is TFrmActivity then
    begin
      IQRegFormWrite( self, [ TFrmActivity(FOwner).fDrillDown, DBGridBatch ]);
      TFrmActivity(FOwner).fDrillDown := nil;
    end
    else
    begin
      IQRegFormWrite( self, [ TFrmTrialBalance(FOwner).fDrillDown, DBGridBatch ]);
      TFrmTrialBalance(FOwner).fDrillDown := nil;
    end;
  finally
    Application.OnShowHint:= NIL;
  end;
end;

procedure TFrmActDrillDown.DBGridBatchIdEnter(Sender: TObject);
begin
  NavBatch.DataSource := IqSearch1.DBGrid.DataSource;
//  NavBatch.DataSource := DBGridBatchId.DataSource;
end;

procedure TFrmActDrillDown.DBGridBatchOldEnter(Sender: TObject);
begin
  NavBatch.DataSource := DBGridBatch.DataSource;
end;


procedure TFrmActDrillDown.BtnDrillDownClick(Sender: TObject);
var
  AId, AId2:Real;
  ABookMark : TBookmark;
begin
  { TODO -oathite -cWebConvert : Depends on Actbachd
  if FBatchDrill <> nil then FBatchDrill.Close;}
  if FOwner is TFrmActivity then
    AId := TFrmActivity(FOwner).QryBatchID2.asFloat
  else
    AId := TFrmTrialBalance(FOwner).QryBatchID2.asFloat;
  try
    if FOwner is TFrmActivity then
      ABookMark :=  TFrmActivity(FOwner).QryBatchId.GetBookmark
    else
      ABookMark :=  TFrmTrialBalance(FOwner).QryBatchId.GetBookmark;

    FormSTyle := fsNormal;
    if FOwner is TFrmActivity then
    begin
      TFrmActivity(FOwner).QryBatchId.GotoBookmark(ABookMark);
      TFrmActivity(FOwner).QryBatch.Locate('ID', AId, []);
    end
    else
    begin
      TFrmTrialBalance(FOwner).QryBatchId.GotoBookmark(ABookMark);
      TFrmTrialBalance(FOwner).QryBatch.Locate('ID', AId, []);
    end;

  finally
    if FOwner is TFrmActivity then
      TFrmActivity(FOwner).QryBatchId.FreeBookmark(ABookMark)
    else
      TFrmTrialBalance(FOwner).QryBatchId.FreeBookmark(ABookMark)
  end;
  (* { TODO -oathite -cWebConvert : Dependent on commented all units }
//  FormSTyle := fsNormal;
  if Owner is TFrmActivity then
  begin
    with TFrmActivity(Owner).QryBatch do
      if FieldByName('TABLENAME').asString = 'ARINVOICE_DETAIL' then
      begin

        if (SelectValueFmtAsFloat('select id from arinvoice where id = %f', [FieldByName('HEADER_ID').asFloat]) <> 0) or
           (FieldByName('HEADER_ID').asFloat = 0)
          then DoViewInvoicesFromAcctDrill(self, FieldByName('GLBATCHID_ID').asFloat, FieldByName('HEADER_ID').asFloat) {IView.pas}
          else
          begin
            if (SelectValueFmtAsFloat('select id from arinvoice_void where id = %f', [FieldByName('HEADER_ID').asFloat]) = 0)  then
              DoViewVoidInvoices(self, FieldByName('GLBATCHID_ID').asFloat, 'ORIGINAL') {IV_Void.pas}
            else
              DoViewVoidInvoices(self, FieldByName('GLBATCHID_ID').asFloat, 'ORIGINAL', FieldByName('HEADER_ID').asFloat);
          end;
      end
      else if FieldByName('TABLENAME').asString = 'ARINVOICE_DETAIL_VOID' then
          DoViewVoidInvoices(self, FieldByName('GLBATCHID_ID').asFloat, 'VOIDED', FieldByName('HEADER_ID').asFloat)
      else if FieldByName('TABLENAME').asString = 'CASHREC_DETAIL' then
        DoViewCashRec(self, FieldByName('GLBATCHID_ID').asFloat, FieldByName('HEADER_ID').asFloat)
      else if FieldByName('TABLENAME').asString = 'CASHREC_DETAIL_VOID' then
        DoViewVoidCashRec(self, FieldByName('GLBATCHID_ID').asFloat, FieldByName('HEADER_ID').asFloat)
      else if FieldByName('TABLENAME').asString = 'APINVOICE_DETAIL' then
      begin
        if (SelectValueFmtAsFloat('select id from apinvoice where id = %f', [FieldByName('HEADER_ID').asFloat]) <> 0) or
           (FieldByName('HEADER_ID').asFloat = 0)
          then DoViewAPInvoicesFromActDrill(self, FieldByName('GLBATCHID_ID').asFloat, FieldByName('HEADER_ID').asFloat)
          else DoViewVoidAPInvoicesFromActDrill(self, FieldByName('GLBATCHID_ID').asFloat, 'ORIGINAL', FieldByName('HEADER_ID').asFloat);
      end
      else if FieldByName('TABLENAME').asString = 'APINVOICE_DETAIL_VOID' then
          DoViewVoidAPInvoicesFromActDrill(self, FieldByName('GLBATCHID_ID').asFloat, 'VOIDED', FieldByName('HEADER_ID').asFloat)
      else if Copy(FieldByName('TABLENAME').asString, 1, 17) = 'CASH_DISBURSEMENT' then
        DoViewCD(self, FieldByName('GLBATCHID_ID').asFloat, FieldByName('HEADER_ID').asFloat)
      else if FieldByName('TABLENAME').asString = 'GJENTRIES' then
        DoShowGLTransLogTransactions(self, 'GLBATCHID_ID', FieldByName('GLBATCHID_ID').asFloat, TFrmActivity(Owner).SrcQry.DataSet.FieldByName('glacct_id').asFloat);  {in GLTrLog.pas in GL}

    AId := TFrmActivity(Owner).QryBatchID2.asFloat;
    try
      ABookMark :=  TFrmActivity(Owner).QryBatchId.GetBookmark;
      FormSTyle := fsStayOnTop;
      TFrmActivity(Owner).QryBatchId.GotoBookmark(ABookMark);
      TFrmActivity(Owner).QryBatch.Locate('ID', AId, []);
    finally
      TFrmActivity(Owner).QryBatchId.FreeBookmark(ABookMark);
    end;
  end
  else
  begin
    with TFrmTrialBalance(FOwner).QryBatch do
      if FieldByName('TABLENAME').asString = 'ARINVOICE_DETAIL' then
      begin

        if (SelectValueFmtAsFloat('select id from arinvoice where id = %f', [FieldByName('HEADER_ID').asFloat]) <> 0) or
           (FieldByName('HEADER_ID').asFloat = 0)
          then DoViewInvoicesFromAcctDrill(self, FieldByName('GLBATCHID_ID').asFloat, FieldByName('HEADER_ID').asFloat)
          else
          begin
            if (SelectValueFmtAsFloat('select id from arinvoice_void where id = %f', [FieldByName('HEADER_ID').asFloat]) = 0)  then
              DoViewVoidInvoices(self, FieldByName('GLBATCHID_ID').asFloat, 'ORIGINAL')
            else
              DoViewVoidInvoices(self, FieldByName('GLBATCHID_ID').asFloat, 'ORIGINAL', FieldByName('HEADER_ID').asFloat);
          end;
      end
      else if FieldByName('TABLENAME').asString = 'ARINVOICE_DETAIL_VOID' then
          DoViewVoidInvoices(self, FieldByName('GLBATCHID_ID').asFloat, 'VOIDED', FieldByName('HEADER_ID').asFloat)
      else if FieldByName('TABLENAME').asString = 'CASHREC_DETAIL' then
        DoViewCashRec(self, FieldByName('GLBATCHID_ID').asFloat, FieldByName('HEADER_ID').asFloat)
      else if FieldByName('TABLENAME').asString = 'CASHREC_DETAIL_VOID' then
        DoViewVoidCashRec(self, FieldByName('GLBATCHID_ID').asFloat, FieldByName('HEADER_ID').asFloat)
      else if FieldByName('TABLENAME').asString = 'APINVOICE_DETAIL' then
      begin
        if (SelectValueFmtAsFloat('select id from apinvoice where id = %f', [FieldByName('HEADER_ID').asFloat]) <> 0) or
           (FieldByName('HEADER_ID').asFloat = 0)
          then DoViewAPInvoicesFromActDrill(self, FieldByName('GLBATCHID_ID').asFloat, FieldByName('HEADER_ID').asFloat)
          else DoViewVoidAPInvoicesFromActDrill(self, FieldByName('GLBATCHID_ID').asFloat, 'ORIGINAL', FieldByName('HEADER_ID').asFloat);
      end
      else if FieldByName('TABLENAME').asString = 'APINVOICE_DETAIL_VOID' then
          DoViewVoidAPInvoicesFromActDrill(self, FieldByName('GLBATCHID_ID').asFloat, 'VOIDED', FieldByName('HEADER_ID').asFloat)
      else if Copy(FieldByName('TABLENAME').asString, 1, 17) = 'CASH_DISBURSEMENT' then
        DoViewCD(self, FieldByName('GLBATCHID_ID').asFloat, FieldByName('HEADER_ID').asFloat)
      else if FieldByName('TABLENAME').asString = 'GJENTRIES' then
        DoShowGLTransLogTransactions(self, 'GLBATCHID_ID', FieldByName('GLBATCHID_ID').asFloat, TFrmTrialBalance(Owner).SrcQry.DataSet.FieldByName('glacct_id').asFloat);  {in GLTrLog.pas in GL}

    AId := TFrmTrialBalance(FOwner).QryBatchID2.asFloat;
    try
      ABookMark :=  TFrmTrialBalance(FOwner).QryBatchId.GetBookmark;
      FormSTyle := fsStayOnTop;
      TFrmTrialBalance(FOwner).QryBatchId.GotoBookmark(ABookMark);
      TFrmTrialBalance(FOwner).QryBatch.Locate('ID', AId, []);
    finally
      TFrmTrialBalance(FOwner).QryBatchId.FreeBookmark(ABookMark);
    end;
  end;
  *)
end;

procedure TFrmActDrillDown.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmActDrillDown.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmActDrillDown.PrinterSetUp1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmActDrillDown.Configure1Click(Sender: TObject);
begin
  DOACConfig; {ACConfig.pas}
end;

procedure TFrmActDrillDown.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmActDrillDown.DBGridBatchDblClick(Sender: TObject);
begin
  BtnDrillDownClick(nil);
end;


procedure TFrmActDrillDown.FormActivate(Sender: TObject);
begin
  FormStyle := fsNormal;
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmGL{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmActDrillDown.Contents1Click(Sender: TObject);
begin
    IQHelp.HelpContext( 1022271 );
end;

procedure TFrmActDrillDown.FormShow(Sender: TObject);
begin

  IqSearch1.Dbgrid.Cursor := crDrill;
  DBGridBatch.Columns[6].Visible := false;
  if FOwner is TFrmActivity then
  begin
    IqSearch1.DataSource := TFrmActivity(FOwner).SrcTblBatchId;
    IqSearch1.Dbgrid.DataSource := TFrmActivity(FOwner).SrcTblBatchId;
    DBGridBatch.DataSource := TFrmActivity(FOwner).SrcTblBatch;
    if TFrmActivity(FOwner).QryBatchSTAT_VALUE.asFloat <> 0 then
    begin
      DBGridBatch.Columns[1].Visible := false;
      DBGridBatch.Columns[2].Visible := false;
      DBGridBatch.Columns[6].Visible := true;
    end;
  end
  else
  begin
    IqSearch1.DataSource := TFrmTrialBalance(FOwner).SrcTblBatchId;
    IqSearch1.Dbgrid.DataSource := TFrmTrialBalance(FOwner).SrcTblBatchId;
    DBGridBatch.DataSource := TFrmTrialBalance(FOwner).SrcTblBatch;
    if TFrmTrialBalance(FOwner).PC.activepage = TFrmTrialBalance(FOwner).TabStat then
    begin
      DBGridBatch.Columns[1].Visible := false;
      DBGridBatch.Columns[2].Visible := false;
      DBGridBatch.Columns[6].Visible := true;
    end;
  end;
  DBGridBatch.Cursor   := crDrill;
  IqSearch1.Dbgrid.OnDblClick := DocumentAccess1Click;
  IqSearch1.Dbgrid.OnEnter := DBGridBatchIdEnter;


  IqSearch1.DBGrid.DataSource.DataSet.Last;
//  DBGridBatchId.DataSource.DataSet.Last;
  application.processmessages;


  if FOwner is TFrmActivity then
    TFrmActivity(FOwner).PrevBatchBal2 := 0
  else
    TFrmTrialBalance(FOwner).PrevBatchBal2 := 0;

  IqSearch1.DBGrid.DataSource.DataSet.First;
  IQRegFormRead( self, [ self, DBGridBatch ]);
//  DBGridBatchId.DataSource.DataSet.First;
end;

procedure TFrmActDrillDown.IQSearch1AfterSortChange(Sender: TObject);
begin
  if FOwner is TFrmActivity then
    TFrmActivity(FOwner).PrevBatchBal2 := 0
  else
    TFrmTrialBalance(FOwner).PrevBatchBal2 := 0;
//  TFrmActivity(Owner).QryBatchId.Close;
//  TFrmActivity(Owner).QryBatchId.Open;
   IQSearch1.DataSource.DataSet.Close;
   IQSearch1.DataSource.DataSet.Open;

end;


procedure TFrmActDrillDown.DocumentAccess1Click(Sender: TObject);
var
  ASource:String;
  AId:Real;
begin
  if FOwner is TFrmActivity then
  begin
    AId     := TFrmActivity(FOwner).QryBatchId.FieldByName('BATCH_ID').asFloat;
  end
  else
  begin
    AId     := TFrmTrialBalance(FOwner).QryBatchId.FieldByName('BATCH_ID').asFloat;
  end;
  ASource := SelectValueFmtAsString('select source from glbatchid where id = %f', [AId]);
  FormStyle := fsNormal;
  (*
  if ASource = 'GJ' then
    DOViewBatchGJ2(self,  AId) {BatView.pas}
  else
    DoBatchDrill(self);   { Actbachd.pas }
  *)
end;

procedure TFrmActDrillDown.sbtnPITDrillDownClick(Sender: TObject);
var
  AGLBatchID_ID: Real;
  AGLAcct_ID: Real;
begin
  if FOwner is TFrmActivity then
     begin
       AGLBatchID_ID:= TFrmActivity(FOwner).QryBatch.FieldByName('GLBATCHID_ID').asFloat;
       AGLAcct_ID:= TFrmActivity(FOwner).SrcQry.DataSet.FieldByName('glacct_id').asFloat;
     end
  else
     begin
       AGLBatchID_ID:= TFrmTrialBalance(FOwner).QryBatch.FieldByName('GLBATCHID_ID').asFloat;
       AGLAcct_ID:= TFrmTrialBalance(FOwner).SrcQry.DataSet.FieldByName('glacct_id').asFloat;
     end;

  TFrmGLActivityPitDrillDown.DoShow( AGLBatchID_ID, AGLAcct_ID );  // gl_pit_drill_down.pas
end;

procedure TFrmActDrillDown.SetOwner(const Value: TObject);
begin
  FOwner := Value;
end;

procedure TFrmActDrillDown.DBGridBatchTitleButtonClick(Sender: TObject;  AFieldName: string);
begin
  FD_AssignDataSetIndexName( TFDDataSet(DBGridBatch.Datasource.Dataset), AFieldName );
  FSortFieldNameAKASellingPriceBreak := AFieldName;
end;

procedure TFrmActDrillDown.DBGridBatchCalcTitleAttributes(Sender: TObject;
  AFieldName: string; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
  inherited;
  IQMS.Common.Controls.HighlightSortColumnOnCalcTitleAttributes( Sender, AFieldName, FSortFieldNameAKASellingPriceBreak, AFont, ABrush);

end;

end.
