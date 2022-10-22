unit OEComm;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  System.Variants,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Wwdatsrc,
  Vcl.Buttons,
  Vcl.DBGrids,
  Vcl.Menus,
  IQMS.WebVcl.About,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu;

type
  TFrmOECommissions = class(TUniForm)
    Panel1: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    nav: TUniDBNavigator;
    grid: TUniDBGrid;
    sbGroup: TUniSpeedButton;
    sbPerson: TUniSpeedButton;
    PkGroup: TIQWebHPick;
    PKOne: TIQWebHPick;
    PkGroupSALESPEOPLE_ID: TBCDField;
    PkGroupFIRST_NAME: TStringField;
    PkGroupLAST_NAME: TStringField;
    PkGroupCOMMISSIONS_PERCENT: TFMTBCDField;
    PkGroupDESCRIP: TStringField;
    PkGroupCOMMISSIONS_ID: TBCDField;
    PkGroupSALES_CODE: TStringField;
    PKOneSALESPEOPLE_ID: TBCDField;
    PKOneFIRST_NAME: TStringField;
    PKOneLAST_NAME: TStringField;
    PKOneSALES_CODE: TStringField;
    IQAbout1: TIQWebAbout;
    Contents1: TUniMenuItem;
    SpeedButton1: TUniSpeedButton;
    PKOneMIDDLE_NAME: TStringField;
    PkGroupMIDDLE_NAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PkGroupIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure gridEditButtonClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    { TODO -oSanketG -cWC : Need to find alternative for TNavigateBtn }
    //procedure navBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  protected
     procedure TblCommNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FNewRec: TDataSetNotifyEvent;
    procedure SelectGroup;
    procedure SelectOne;
    procedure AppendGroup(AID:Real);
    procedure AppendOne(AID:Real);
    procedure AssignOne( AID, ASALESPEOPLE_ID :Real);
    procedure AppendGroupOrEmp;
    procedure RecalculatePercentAndAmount;
  protected
    { Protected declarations }
    FModified: Boolean;

    FTotalAmount:Real;
    FTable: TFDTable;         // Commissions table
    FSource: TDataSource;   // Commissions datasource
    FHeaderTable: TDataSet; // Parent dataset of the Commissions dataset

    FParentFieldName,       // Parent ID field name in the Commissions table
    FTableName,             // Oracle table name of the Commissions table
    FHeaderTableName,       // Oracle table name of the Header table (parent of Commissions table)
    FHeaderParentFieldName: String; // Parent ID field name in the Header table
    FCommissionsSource: Integer;

    FCanPromptApplyAll: Boolean; // Can prompt to apply all commissions to detail

    procedure AssignOwnerValues; virtual; // fill dataset variables
    procedure PromptApplyAll; virtual;    // prompt user to apply to all records
    procedure UpdateAllParentDetailRecs;  // applies commission scheme to all detail records
  public
    { Public declarations }
    //constructor Create(AOwner:TComponent); override;
  end;

procedure DoOECommissionSplit();



implementation

{$R *.DFM}

uses
  inv_main,
  IQMS.Common.Controls,
  IQMS.Common.ErrorDialog,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.UserMessages,
  { TODO -oSanketG -cWC : Need to revisit }
  {iv_void,
  iview,
  oe_main,}
  oe_rscstr
  { TODO -oSanketG -cWC : Need to revisit }
  {RebateManager,
  salcomm};

procedure DoOECommissionSplit();
var
  FrmOECommissions: TFrmOECommissions;
begin
  FrmOECommissions := TFrmOECommissions.Create(UniGUIApplication.uniApplication);
  FrmOECommissions.Show;
end;

procedure TFrmOECommissions.FormShow(Sender: TObject);
begin
  // adjust navigator bar to compensate for security and
  // any adjustments made in method, AssignOwnerValues.
  { TODO -oSanketG -cWC : Need to revisit ,
  [dcc32 Error] OEComm.pas(175): E2010 Incompatible types: 'TDBNavigator' and 'TUniDBNavigator'}
  //IQMS.Common.Controls.ResizeNavBar(nav);
end;

procedure TFrmOECommissions.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid]);
  FTable.OnNewRecord := FNewRec;

  // prompt user to apply change to all records
//  gridColExit(Sender);
  RecalculatePercentAndAmount;
  PromptApplyAll;

  // Update owner form, if iq_RefreshDataSets is available
  if FModified then
     PostMessage( TUniForm(Owner).Handle, iq_RefreshDataSets, 0, 0 );

end;

(*
This is remmed to preserve original code
procedure TFrmOECommissions.PromptApplyAll;
var
  ACount:Real;
  AId:Real;
begin
  if Owner is TFrmMainOrder then
  begin
    if FModified then
    begin
      AId := SelectValueFmtAsFloat('select orders_id from ord_detail where id = %.0f', [FHeaderTable.FieldByName('ID').AsFloat]);
      ACount := SelectValueFmtAsFloat('select count(id) from ord_detail where orders_id = %.0f', [AId]);
      {'Do you wish to modify the rest of the Sales Order details?'}
      if (ACount > 1) and IqConfirmYN(oe_rscstr.cTXT0000061) then
      begin
        ExecuteCommandFmt(' begin ' +
                  ' for v in (select id from ord_detail where orders_id = %.0f and id <> %.0f) ' +
                  ' loop ' +
                  ' delete from ORD_DETAIL_COMMISSIONS where ord_detail_id = v.id; ' +
                  ' insert into ORD_DETAIL_COMMISSIONS (ord_detail_id, salespeople_id, commission_percent, ecode, eid, edate_time, ecopy) ' +
                  ' select v.id, salespeople_id, commission_percent, ecode, eid, edate_time, ecopy ' +
                  '   from ORD_DETAIL_COMMISSIONS ' +
                  '  where ord_detail_id = %f; ' +
                  ' end loop; ' +
                  ' end; ',
                  [AId,
                   FHeaderTable.FieldByName('ID').AsFloat,
                   FHeaderTable.FieldByName('ID').AsFloat]);
      end;
    end;
  end;
end;
*)

procedure TFrmOECommissions.PromptApplyAll;
begin
   // if Owner is Sales Order form, then prompt to apply to all records
   if FCanPromptApplyAll then
      UpdateAllParentDetailRecs; // see below
end;

procedure TFrmOECommissions.UniFormCreate(Sender: TObject);
begin
  AssignOwnerValues;
  nav.DataSource := FSource;
  grid.DataSource := FSource;
  IQRegFormRead( self, [self, Grid]);
  { TODO -oSanketG -cWC : Need to revisit }
  {FNewRec := FTable.OnNewRecord;
  FTable.OnNewRecord := TblCommNewRecord;}
end;

procedure TFrmOECommissions.UpdateAllParentDetailRecs;
var
  ACount:Real;
  AParentID:Real;
  ADebug: String;
begin
  // * This method applies the current Commissions scheme to all records

  // ensure basic variables provided
  if (FHeaderTableName = '') or
     (FHeaderParentFieldName = '') or
     (FTableName = '') or
     (FParentFieldName = '') then
     Exit;

  // only run this if modified
  if not FModified then Exit;

  // Get parent ID from header table
  AParentID := SelectValueFmt('select %s from %s where id = %.0f',
                         [FHeaderParentFieldName,
                          FHeaderTableName,
                          FHeaderTable.FieldByName('ID').AsFloat]);

  // Get count of detail items
  ACount := SelectValueFmt('select count(id) from %s where %s = %.0f',
                      [FHeaderTableName, FHeaderParentFieldName, AParentID]);

  // Do you want to modify commissions on all detail items?
  if (ACount > 1) and IQConfirmYN(oe_rscstr.cTXT0000061) then
  try
     with TFDStoredProc.Create(nil) do
       {
         PROCEDURE update_all_parent_dtl_recs
          (
            p_source    IN NUMBER,
            p_source_id IN NUMBER, /*Example: ORD_DETAIL.ID value*/
            p_YN_was_modified IN VARCHAR2
          )
       }
     try
       Connection:= UniMainModule.FDConnection1;
       StoredProcName:= 'IQMS.SALESPERSONS.UPDATE_ALL_PARENT_DTL_RECS';
       Prepare;
       ParamByName('p_source').Value := FCommissionsSource;
       ParamByName('p_source_id').Value := FHeaderTable.FieldByName('ID').AsLargeInt;
       ParamByName('p_yn_was_modified').Value := 'Y';
       Execute;
     finally
      Free;
     end;


    (* this code kept here for posterity, but moved to package SALESPERSONS.update_all_parent_dtl_recs

    if FHeaderTableName = 'ORD_DETAIL' then
    ADebug := Format(' begin '#13 +
                     ' for v in (select id, NVL(UNIT_PRICE, 0) * NVL(TOTAL_QTY_ORD, 0) as totalamount from %s where %s = %.0f and id <> %.0f) '#13 +
                     ' loop '#13 +
                     ' delete from %s where %s = v.id; '#13 +
                     ' insert into %s (%s, salespeople_id, commission_percent, amount) '#13 +
                     ' select v.id, salespeople_id, commission_percent, commission_percent * v.totalamount/100 '#13 +
                     '   from %s '#13 +
                     '  where %s = %.0f; '#13 +
                     ' end loop; '#13 +
                     ' end; ',
                     [FHeaderTableName, FHeaderParentFieldName,
                      AParentID, FHeaderTable.FieldByName('ID').AsFloat,
                      FTableName, FParentFieldName,
                      FTableName, FParentFieldName,
                      FTableName, FParentFieldName,
                      FHeaderTable.FieldByName('ID').AsFloat])
    else

      ADebug := Format(' begin '#13 +
                       ' for v in (select id from %s where %s = %.0f and id <> %.0f) '#13 +
                       ' loop '#13 +
                       ' delete from %s where %s = v.id; '#13 +
                       ' insert into %s (%s, salespeople_id, commission_percent) '#13 +
                       ' select v.id, salespeople_id, commission_percent '#13 +
                       '   from %s '#13 +
                       '  where %s = %.0f; '#13 +
                       ' end loop; '#13 +
                       ' end; ',
                       [FHeaderTableName, FHeaderParentFieldName,
                        AParentID, FHeaderTable.FieldByName('ID').AsFloat,
                        FTableName, FParentFieldName,
                        FTableName, FParentFieldName,
                        FTableName, FParentFieldName,
                        FHeaderTable.FieldByName('ID').AsFloat]);


    ExecuteCommand(ADebug);

    *)
  except on E:Exception do
    ShowIqErrorMessage(oe_rscstr.cTXT0000062 {'Error updating records.'}, E.Message, ADebug); // IQMS.Common.ErrorDialog.pas
  end;
end;


procedure TFrmOECommissions.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSALES_ORDER{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmOECommissions.AssignOwnerValues;
var
  I:integer;
begin
  // * Assign dataset variables *
  // These are referenced when modifying data.  This method (virtual)
  // may also be overridden by a descendant unit.

  // Sales Order
  { TODO -oSanketG -cWC : Need to revisit , depends on oe_main}
  {if TForm(Owner) is TFrmMainOrder then
  begin
    FTable                 := TFrmMainOrder(Owner).DM.TblComm;           // Commissions table (TFDTable)
    FSource                := TFrmMainOrder(Owner).DM.SrcComm;           // Commissions datasource (TDataSource)
    if TFrmMainOrder(Owner).QuickOrderEntryNoReleases1.checked then
      FHeaderTable           := TFrmMainOrder(Owner).DM.QryQuickOE     // Commissions parent table (TFDTable)
    else
      FHeaderTable           := TFrmMainOrder(Owner).DM.TblOrd_Detail;     // Commissions parent table (TFDTable)
    FParentFieldName       := 'ORD_DETAIL_ID';                           // Commissions parent field name
    FTableName             := 'ORD_DETAIL_COMMISSIONS';                  // Commissions table name
    FHeaderTableName       := 'ORD_DETAIL';                              // Parent table name
    FHeaderParentFieldName := 'ORDERS_ID';                               // Parent table's parent field name
    FCommissionsSource     := 1;
    FTotalAmount           := TFrmMainOrder(Owner).DM.TblOrd_detail.FieldByName('UNIT_PRICE').asFloat * TFrmMainOrder(Owner).DM.TblOrd_detail.FieldByName('TOTAL_QTY_ORD').asFloat;
//    grid.columns[4].visible := false;
    SpeedButton1.visible := false;
    FCanPromptApplyAll     := TRUE;                                      // On Close, prompt to apply scheme to all detail items
  end}

  // AR Invoice
  //else
  { TODO -oSanketG -cWC : Need to revisit, [dcc32 Error] OEComm.pas(376): E2010 Incompatible types: 'TUniForm' and 'TFrmInvoice' }
  {if TForm(Owner) is TFrmInvoice then
  begin
    FTable                 := TFrmInvoice(Owner).TblComm;                // Commissions table (TFDTable)
    FSource                := TFrmInvoice(Owner).SrcComm;                // Commissions datasource (TDataSource)
    FHeaderTable           := TFrmInvoice(Owner).QryARPrepostDetail;     // Commissions parent table (TFDTable)
    FParentFieldName       := 'ARPREPOST_DETAIL_ID';                     // Commissions parent field name
    FTableName             := 'ARPREPOST_COMM';                          // Commissions table name
    FHeaderTableName       := '';                                        // Parent table name
    FHeaderParentFieldName := '';                                        // Parent table's parent field name
    FCommissionsSource     := 2;
    FCanPromptApplyAll     := FALSE;                                     // On Close, prompt to apply scheme to all detail items
    FTotalAmount           := TFrmInvoice(Owner).QryARPrepostDetail.FieldByName('UNIT_PRICE').asFloat * TFrmInvoice(Owner).QryARPrepostDetail.FieldByName('INVOICE_QTY').asFloat;
  end}

  // Voided AR Invoices
  { TODO -oSanketG -cWC : Need to revisit ,depends on Iv_Void}
  {else if TForm(Owner) is TFrmVoidInvoices then
  begin
    FTable                 := TFrmVoidInvoices(Owner).TblCommVoid;       // Commissions table (TFDTable)
    FSource                := TFrmVoidInvoices(Owner).SrcComm;           // Commissions datasource (TDataSource)
    FHeaderTable           := TFDTable(TFrmVoidInvoices(Owner).QryDetail); // Commissions parent table (TFDTable)
    FParentFieldName       := 'ARINVOICE_DETAIL_VOID_ID';                // Commissions parent field name
    FTableName             := 'ARINVOICE_COMM_VOID';                     // Commissions table name
    FHeaderTableName       := '';                                        // Parent table name
    FHeaderParentFieldName := '';                                        // Parent table's parent field name
    FCommissionsSource     := 3;
    FCanPromptApplyAll     := FALSE;                                     // On Close, prompt to apply scheme to all detail items
    grid.ReadOnly          := True;
    SpeedButton1.visible := false;

    for I:= 0 to grid.Columns.Count - 1 do
    begin
      grid.Columns[I].ReadOnly := true;
      if (grid.Columns[I].FieldName =  'FIRST_NAME') or (grid.Columns[I].FieldName =  'LAST_NAME') or (grid.Columns[I].FieldName =  'MIDDLE_NAME') then
        grid.Columns[I].ButtonStyle := cbsNone;
    end;


    with nav do
       VisibleButtons:= VisibleButtons - [ nbInsert, nbDelete ];

    FTotalAmount           := TFrmVoidInvoices(Owner).QryDetail.FieldByName('UNIT_PRICE').asFloat * TFrmVoidInvoices(Owner).QryDetail.FieldByName('INVOICE_QTY').asFloat;
  end}

  // Posted AR Invoices
  { TODO -oSanketG -cWC : Need to revisit ,depends on Iview}
  {else if (TForm(Owner) is TFrmView) then
  begin
    FTable                 := TFrmView(Owner).TblComm;                   // Commissions table (TFDTable)
    FSource                := TFrmView(Owner).SrcComm;                   // Commissions datasource (TDataSource)
    FHeaderTable           := TFDTable(TFrmView(Owner).QryDetail);         // Commissions parent table (TFDTable)
    FParentFieldName       := 'ARINVOICE_DETAIL_ID';                     // Commissions parent field name
    FTableName             := 'ARINVOICE_COMM';                          // Commissions table name
    FHeaderTableName       := '';                                        // Parent table name
    FHeaderParentFieldName := '';                                        // Parent table's parent field name
    FCommissionsSource     := 4;
    FCanPromptApplyAll     := FALSE;                                     // On Close, prompt to apply scheme to all detail items
    if SelectValueasString(
      'select NVL(use_accrued_comm, ''N'') from iqsys where rownum < 2') = 'Y' then
    begin
      grid.ReadOnly          := True;
      SpeedButton1.visible := false;
      with nav do
         VisibleButtons:= VisibleButtons - [ nbInsert, nbDelete ];

      for I:= 0 to grid.Columns.Count - 1 do
      begin
        grid.Columns[I].ReadOnly := true;
        if (grid.Columns[I].FieldName =  'FIRST_NAME') or (grid.Columns[I].FieldName =  'LAST_NAME') or (grid.Columns[I].FieldName =  'MIDDLE_NAME') then
          grid.Columns[I].ButtonStyle := cbsNone;
      end;


    end;
    FTotalAmount           := TFrmView(Owner).QryDetail.FieldByName('UNIT_PRICE').asFloat * TFrmView(Owner).QryDetail.FieldByName('INVOICE_QTY').asFloat;
  end}

  { TODO -oSanketG -cWC : Need to revisit , depends on RebateManager}
  {else if (TForm(Owner) is TFrmRebMan) then
  begin
    FTable                 := TFrmRebMan(Owner).TblComm;                 // Commissions table (TFDTable)
    FSource                := TFrmRebMan(Owner).SrcComm;                 // Commissions datasource (TDataSource)
    FHeaderTable           := TFDTable(TFrmRebMan(Owner).QryInv);          // Commissions parent table (TFDTable)
    FParentFieldName       := 'ARINVOICE_DETAIL_ID';                     // Commissions parent field name
    FTableName             := 'ARINVOICE_COMM';                          // Commissions table name
    FHeaderTableName       := '';                                        // Parent table name
    FHeaderParentFieldName := '';                                        // Parent table's parent field name
    FCommissionsSource     := 5;
    FCanPromptApplyAll     := FALSE;                                     // On Close, prompt to apply scheme to all detail items
    grid.ReadOnly          := True;
//    grid.columns[4].visible := false;
    SpeedButton1.visible := false;
    FTotalAmount           := TFrmRebMan(Owner).QryInv.FieldByName('UNIT_PRICE').asFloat * TFrmRebMan(Owner).QryInv.FieldByName('INVOICE_QTY').asFloat;
    with nav do
         VisibleButtons:= VisibleButtons - [ nbInsert, nbDelete ];
  end; }


end;

procedure TFrmOECommissions.TblCommNewRecord(DataSet: TDataSet);
begin
  FTable.Cancel;
  if FHeaderTableName = 'ORD_DETAIL' then
    { TODO -oSanketG -cWC : Need to revisit, depends on oe_main }
    //TFrmMainOrder(Owner).DM.FAmountChanged := false;

  AppendGroupOrEmp;

  System.SysUtils.ABORT; {Abort here to fix "DataSet not in Edit mode"}
end;

procedure TFrmOECommissions.AppendGroupOrEmp;
begin
  if sbGroup.Down then
     SelectGroup
  else
     SelectOne;
end;

procedure TFrmOECommissions.SelectGroup;
begin
  try
    FormSTyle := fsNormal;
    with PkGroup do
      if Execute then
         AppendGroup(System.Variants.VarAsType(GetValue('COMMISSIONS_ID'), varInt64));
  finally
    FormSTyle := fsStayOnTop;
  end;
end;

procedure TFrmOECommissions.SelectOne;
begin
  try
    FormSTyle := fsNormal;
    with PkOne do
      if Execute then
         AppendOne(System.Variants.VarAsType(GetValue('SALESPEOPLE_ID'), varInt64))
  finally
    FormSTyle := fsStayOnTop;
  end;
end;


procedure TFrmOECommissions.PkGroupIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  { TODO -oSanketG -cWC : Need to revisit , depends on SalComm}
  //Action:= DoNewCommissionsGroup(ResultValue); {SalComm.pas}
end;

procedure TFrmOECommissions.AppendGroup(AID:Real);
var
  AComm:Real;
  AId1:Real;
begin
  AComm := SelectValueFmtAsFloat(
    'select sum(COMMISSION_PERCENT) from %s where %s = %d',
    [FTableName, FParentFieldName, FHeaderTable.FieldByName('ID').AsLargeInt]) +
    SelectValueFmtAsFloat(
    'select sum(COMMISSION_PERCENT) from commissions_detail where commissions_id = %d',
    [Trunc(AID)]);

  if AComm > 100 then
    raise Exception.Create('Total commissions is greater that 100%, cannot assign');

//  ExecuteCommandFmt(
//    'insert into %s (%s, SALESPEOPLE_ID, COMMISSION_PERCENT, amount, commissions_id) ' +
//    'select %d, salespeople_id, COMMISSION_PERCENT, COMMISSION_PERCENT * %.6f/100  from commissions_detail where commissions_id = %d',
//    [FTableName, FParentFieldName, FHeaderTable.FieldByName('ID').AsLargeInt, FTotalAmount, Trunc(AID)]);

  // 04/28/2016 Expanded SQL for easier maintenance (Byron)
  ExecuteCommandFmt(
    'INSERT INTO %s(%s,                                           '#13 +
    '                            salespeople_id,                  '#13 +
    '                            commission_percent,              '#13 +
    '                            amount,                          '#13 +
    '                            commissions_id)                  '#13 +
    '   SELECT %d,                                                '#13 +
    '          salespeople_id,                                    '#13 +
    '          commission_percent,                                '#13 +
    '          commission_percent * %.6f / 100,                   '#13 +
    '          %d                                                 '#13 +
    '     FROM commissions_detail                                 '#13 +
    '    WHERE commissions_id = %d                                ',
    [FTableName, FParentFieldName, FHeaderTable.FieldByName('ID').AsLargeInt,
    FTotalAmount, Trunc(AID), Trunc(AID)]);


  FTable.Refresh;
  if (FHeaderTable is TFDTable) then
    FHeaderTable.Refresh
  else
  begin
    AId1 := FHeaderTable.FieldByName('ID').AsFloat;
    ReOpen(FHeaderTable);
    FHeaderTable.Locate('ID', AID1, []);
  end;
  FModified := true;
end;

procedure TFrmOECommissions.AppendOne(AID:Real);
var
  AId1, ACommis:Real;
begin
  ACommis := SelectValueFmtAsFloat(
    'select commission_percent from SALESPEOPLE where id = %d', [Trunc(AId)]);
  ExecuteCommandFmt('insert into %s (%s, SALESPEOPLE_ID, commission_percent, amount) ' +
            'values (%d, %d, %.6f, %.6f * %.6f/100)',
            [FTableName, FParentFieldName,
            FHeaderTable.FieldByName('ID').AsLargeInt, Trunc(AID), ACommis,
            ACommis, FTotalAmount]);
  FTable.Refresh;
  if FHeaderTable is TFDTable then
    FHeaderTable.Refresh
  else
  if FHeaderTable is TFDTable then
    FHeaderTable.Refresh
  else
  begin
    AId1 := FHeaderTable.FieldByName('ID').AsFloat;
    ReOpen(FHeaderTable);
    FHeaderTable.Locate('ID', AID1, []);
  end;
  FModified := true;
end;

procedure TFrmOECommissions.AssignOne( AID, ASALESPEOPLE_ID :Real);
var
  AId1:Real;
begin
  ExecuteCommandFmt('update %s set SALESPEOPLE_ID = %d where id = %d',
    [ FTableName, Trunc(ASalesPeople_ID), Trunc(AID) ]);
  FTable.Refresh;
  if FHeaderTable is TFDTable then
    FHeaderTable.Refresh
  else
  if FHeaderTable is TFDTable then
    FHeaderTable.Refresh
  else
  begin
    AId1 := FHeaderTable.FieldByName('ID').AsFloat;
    ReOpen(FHeaderTable);
    FHeaderTable.Locate('ID', AID1, []);
  end;
  FModified := true;
end;

procedure TFrmOECommissions.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmOECommissions.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmOECommissions.gridEditButtonClick(Sender: TObject);
begin
  if FTable.Eof and FTable.Bof then
     FTable.Append
  else
     with PkOne do
       if Execute then
          AssignOne(FTable.FieldByName('ID').asFloat,
            System.Variants.VarAsType(GetValue( 'SALESPEOPLE_ID' ), varInt64));
end;

procedure TFrmOECommissions.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  {IQMS.Common.HelpHook.pas}
end;

{ TODO -oSanketG -cWC : Need to revisit }
{procedure TFrmOECommissions.navBeforeAction(Sender: TObject;  Button: TNavigateBtn);
begin
  if (Button = nbDelete) or (Button = nbPost) then
    FModified := true;

end;}

procedure TFrmOECommissions.SpeedButton1Click(Sender: TObject);
begin
  ExecuteCommandFmt(
    'update %s set amount = commission_percent * %.6f/100 where %s = %d',
    [FTableName, FTotalAmount, FParentFieldName,
    FHeaderTable.FieldByName('ID').AsLargeInt]);
  FTable.Refresh;
end;

procedure TFrmOECommissions.RecalculatePercentAndAmount;
var
  aPercent, aAmount:Real;
  aAmtChangedID,
  aPrctChangedID : Real;
begin
  if not ( FHeaderTableName = 'ORD_DETAIL' ) then
    EXIT;

    { TODO -oSanketG -cWC : Need to revisit, depends on oe_main }
  {if ( TFrmMainOrder(Owner).DM.FAmountChanged ) or ( TFrmMainOrder(Owner).DM.FPercentChanged ) then
  begin
    aAmtChangedID := IIIF( TFrmMainOrder(Owner).DM.FAmountChangedId > 0, TFrmMainOrder(Owner).DM.FAmountChangedId, 0);
    aPrctChangedID:= IIIF( TFrmMainOrder(Owner).DM.FPercentChangedId > 0, TFrmMainOrder(Owner).DM.FPercentChangedId, 0);

    FCanPromptApplyAll := not ( TFrmMainOrder(Owner).DM.FAmountChanged ); //we can only apply percentage to all

      (*
      PROCEDURE recalculate_percent_amount
      (
        p_source    IN NUMBER, /*See Commission Sources, declared above*/
        p_source_id IN NUMBER, /*Example: ORD_DETAIL.ID value*/
        p_amt_changed_id IN NUMBER, /*Example: ORD_DETAIL_COMMISSIONS.ID value whose amount changed*/
        p_percent_changed_id IN NUMBER,  /*Example: ORD_DETAIL_COMMISSIONS.ID value whose commission percent changed*/
        p_total_amount   IN NUMBER
      )
      *)
    with TFDStoredProc.Create(nil) do
    try
      Connection:= UniMainModule.FDConnection1;
      StoredProcName:= 'IQMS.SALESPERSONS.RECALCULATE_PERCENT_AMOUNT';
      Params.CreateParam(ftFMTBcd, 'p_source', ptInput).AsFMTBCD:= FCommissionsSource;
      Params.CreateParam(ftFMTBcd, 'p_source_id', ptInput).AsFMTBCD
        := Trunc(FHeaderTable.FieldByName('id').AsFloat);
      Params.CreateParam(ftFMTBcd, 'p_amt_changed_id', ptInput).AsFMTBCD
        := Trunc(aAmtChangedID);
      Params.CreateParam(ftFMTBcd, 'p_percent_changed_id', ptInput).AsFMTBCD
          := Trunc(aPrctChangedID);
      Params.CreateParam(ftFMTBcd, 'p_total_amount', ptInput).AsFMTBCD
        := FTotalAmount;
      Prepare;
      Execute;
    finally
      Free;
    end;

    //Reflect this recalculation in the Table
    TFrmMainOrder(Owner).DM.TblComm.Close;
    TFrmMainOrder(Owner).DM.TblComm.Open;
  end;}



      (*
          This code kept to preserve original code - this logic was migrated to the backend
          HTM-1011 SalesPerson Commissions Split - Migrate logic to Stored Procedures AMB 04-17-15

      AQry := TFDQuery.Create(nil);
      try
        AQry.Connection := MainModule.FDConnection;
        AQry.Sql.Add(IqFormat('select id, amount, salespeople_id from ORD_DETAIL_COMMISSIONS where ord_detail_id = %f and id = %f',
        [FHeaderTable.FieldByName('ID').AsFloat, TFrmMainOrder(Owner).DM.FAmountChangedId]));
        AQry.Open;
        while not AQry.eof do
        begin
          aPercent := 100 * AQry.FieldByName('amount').asFloat/FTotalAmount;
          ExecuteCommandFmt('update ORD_DETAIL_COMMISSIONS set COMMISSION_PERCENT = %.6f where id = %f',
                           [aPercent, AQry.FieldByName('id').asFloat],
                           MainModule.FDConnection.ConnectionName);
          AQry.Next;
        end;
      finally
        AQry.Free;
      end;

      TFrmMainOrder(Owner).DM.TblComm.Close;
      TFrmMainOrder(Owner).DM.TblComm.Open;
    end
    else if TFrmMainOrder(Owner).DM.FPercentChanged then
    begin
      AQry := TFDQuery.Create(nil);
      try
        AQry.Connection := MainModule.FDConnection;
        AQry.Sql.Add(IqFormat('select id, COMMISSION_PERCENT, salespeople_id from ORD_DETAIL_COMMISSIONS where ord_detail_id = %f and id = %f',
        [FHeaderTable.FieldByName('ID').AsFloat, TFrmMainOrder(Owner).DM.FPercentChangedId]));
        AQry.Open;
        while not AQry.eof do
        begin
          aAmount := AQry.FieldByName('COMMISSION_PERCENT').asFloat*FTotalAmount/100;
          ExecuteCommandFmt('update ORD_DETAIL_COMMISSIONS set amount = %f where id = %f',
                            [aAmount, AQry.FieldByName('id').asFloat],
                            MainModule.FDConnection.ConnectionName);
          AQry.Next;
        end;
      finally
        AQry.Free;
      end;
      TFrmMainOrder(Owner).DM.TblComm.Close;
      TFrmMainOrder(Owner).DM.TblComm.Open;
    end;
  *)
end;

end.
