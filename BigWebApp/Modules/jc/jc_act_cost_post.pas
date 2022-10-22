unit jc_act_cost_post;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  IQMS.Common.JumpConstants,
  Data.DB,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
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
  uniGUIApplication, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmJC_ActCostPost = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    Report1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQRepDef1: TIQWebRepDef;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    Panel3: TUniPanel;
    QryLotSumArinvoiceDetail: TFDQuery;
    QryLotSumArinvoiceDetailID: TBCDField;
    QryLotSumArinvoiceDetailARINVOICE_DETAIL_ID: TBCDField;
    QryLotSumArinvoiceDetailLOTNO: TStringField;
    QryLotSumArinvoiceDetailSHIPMENT_DTL_ID: TBCDField;
    QryLotSumArinvoiceDetailARINVT_ID: TBCDField;
    QryLotSumArinvoiceDetailPROCESS_COST_DTL_ID: TBCDField;
    QryLotSumArinvoiceDetailSTANDARD_ID: TBCDField;
    QryLotSumArinvoiceDetailACCT_ID_INV: TBCDField;
    QryLotSumArinvoiceDetailCLASS: TStringField;
    QryLotSumArinvoiceDetailITEMNO: TStringField;
    QryLotSumArinvoiceDetailDESCRIP: TStringField;
    QryLotSumArinvoiceDetailREV: TStringField;
    QryLotSumArinvoiceDetailDESCRIP2: TStringField;
    QryLotSumArinvoiceDetailQTY: TFMTBCDField;
    QryLotSumArinvoiceDetailSTD_COST: TFMTBCDField;
    QryLotSumArinvoiceDetailACT_COST: TFMTBCDField;
    QryLotSumArinvoiceDetailTOTAL_STD_COST: TFMTBCDField;
    QryLotSumArinvoiceDetailTOTAL_ACT_COST: TFMTBCDField;
    QryLotSumArinvoiceDetailINVOICE_NO: TStringField;
    QryLotSumArinvoiceDetailACCT: TStringField;
    SrcLotSumArinvoiceDetail: TDataSource;
    srchArinvoiceDetail: TIQUniGridControl;
    SrcCost_Elements: TDataSource;
    QryCost_Elements: TFDQuery;
    QryCost_ElementsELEM_DESCRIP: TStringField;
    QryCost_ElementsSTD_COST: TFMTBCDField;
    QryCost_ElementsACT_COST: TFMTBCDField;
    QryCost_ElementsCostVar: TFMTBCDField;
    QryCost_ElementsPRICE_VARIANCE: TFMTBCDField;
    QryCost_ElementsQTY_VARIANCE: TFMTBCDField;
    wwDBGridCostElement: TIQUniGridControl;
    QryCost_ElementsGLACCT_ID: TBCDField;
    QryCost_ElementsACCT: TStringField;
    sbtnLotCostSummary: TUniSpeedButton;
    Bevel3: TUniPanel;
    sbtnPrepareGL: TUniSpeedButton;
    Contents1: TUniMenuItem;
    pnlCarrier: TUniPanel;
    QryLotSumArinvoiceDetailGLACCT_ID: TFMTBCDField;
    QryCost_ElementsExt_Cost: TFMTBCDField;
    QryLotSumArinvoiceDetailINVOICE_DATE: TDateTimeField;
    SecurityRegister1: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure wwDBComboDlgGLPeriodCustomDlg(Sender: TObject);
    procedure sbtnProcCostApplyClick(Sender: TObject);
    procedure QryLotSumArinvoiceDetailBeforeOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure QryCost_ElementsCalcFields(DataSet: TDataSet);
    procedure sbtnLotCostSummaryClick(Sender: TObject);
    procedure sbtnPrepareGLClick(Sender: TObject);
    procedure sbtnArchive2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
  private
    { Private declarations }
    FGLPeriods_IDFrom: Real;
    FGLPeriods_IDTo: Real;
    procedure SetGLPeriods_IDFrom(const Value: Real);
    procedure SetGLPeriods_IDTo(const Value: Real);
    procedure DeleteData;
    procedure AssignFloatBlankIfZero( AField: TField; AValue:Real );
    procedure RefreshTables;
    procedure PrepareGeneralJournalEntries;
  protected
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
  public
    { Public declarations }
    FPit_Hdr_ID:Real;
    FTransactionType:String;
    property GLPeriods_IDFrom: Real read FGLPeriods_IDFrom write SetGLPeriods_IDFrom;
    property GLPeriods_IDTo: Real read FGLPeriods_IDTo write SetGLPeriods_IDTo;

    constructor Create( AOwner: TComponent ); override;
    class procedure DoShow( AOwner: TComponent );
  end;

var
  FrmJC_ActCostPost: TFrmJC_ActCostPost;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls,
  IQMS.Common.Period,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.PanelMsg,
  jc_rscstr,
  IQMS.Common.Print,
  IQMS.Common.Dialogs,
  jc_main,
  IQMS.Common.HelpHook,
  Journal;


{ TFrmJC_ActCostPost }

procedure TFrmJC_ActCostPost.AssignFloatBlankIfZero(AField: TField;  AValue: Real);
begin
  if Abs( AValue ) <= 0.0000001 then
     AField.asString:= ''
  else
     AField.asFloat:= AValue;
end;

procedure TFrmJC_ActCostPost.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( HelpContext );
end;

constructor TFrmJC_ActCostPost.Create(AOwner: TComponent);
begin
  inherited;
  IQRegFormRead(self, [ self ]);
  IQSetTablesActive(TRUE, self);

  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
end;

procedure TFrmJC_ActCostPost.DeleteData;
begin
  ExecuteCommandFmt('declare                                                          '+
            '  v_user_name varchar2(50)::= ''%s'';                            '+
            'begin                                                            '+
            '  delete from c_process_cost_hdr                                 '+
            '   where id in                                                   '+
            '          ( select c_process_cost_hdr_id                         '+
            '              from c_process_cost_lot_sum                        '+
            '             where userid = v_user_name );                       '+
            '  delete from c_process_cost_lot_sum where userid = v_user_name; '+
            'end;                                                             ',
            [ SecurityManager.UserName ]);
end;

class procedure TFrmJC_ActCostPost.DoShow(AOwner: TComponent);
var
  AForm: TUniForm;
begin
  AForm:= IQMS.Common.Controls.FindFormByClassType( self );
  if not Assigned(AForm) then
     AForm:= self.Create(AOwner);
  AForm.Show;
end;

procedure TFrmJC_ActCostPost.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmJC_ActCostPost.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmCosting6{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmJC_ActCostPost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
  Action:= caFree;
end;

procedure TFrmJC_ActCostPost.FormDestroy(Sender: TObject);
begin
  DeleteData;
end;

procedure TFrmJC_ActCostPost.IQAfterShowMessage(var Msg: TMessage);
begin
  GLPeriods_IDFrom:= DoFindPeriod( self );  // returns glperiod_id iqshare\IQMS.Common.Period.pas
  if GLPeriods_IDFrom = 0 then
     PostMessage(Handle, wm_Command, Exit1.Command, 0);   { Call "Exit" }
  GLPeriods_IDTo:= DoFindPeriod( self );  // returns glperiod_id iqshare\IQMS.Common.Period.pas
  if GLPeriods_IDTo = 0 then
     PostMessage(Handle, wm_Command, Exit1.Command, 0);   { Call "Exit" }

end;

procedure TFrmJC_ActCostPost.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmJC_ActCostPost.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmJC_ActCostPost.QryLotSumArinvoiceDetailBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    AssignQueryParamValue( DataSet, 'userid', IntToStr(Trunc(FPit_Hdr_ID)));
//    Params.ParamByName('userid').asString:= IntToStr(Trunc(FPit_Hdr_ID));
//    Params.ParamByName('userid').asString:= SecurityManager.UserName;
  end;
end;

procedure TFrmJC_ActCostPost.QryCost_ElementsCalcFields(DataSet: TDataSet);
begin
  AssignFloatBlankIfZero( DataSet.FieldByName('CostVar'),  DataSet.FieldByName('Std_Cost').asFloat - DataSet.FieldByName('Act_Cost').asFloat );

  AssignFloatBlankIfZero( DataSet.FieldByName('Ext_Cost'), DataSet.FieldByName('Act_Cost').asFloat * QryLotSumArinvoiceDetailQTY.asFloat );
end;

procedure TFrmJC_ActCostPost.sbtnArchive2Click(Sender: TObject);
begin
  // 11-10-2011 obsolete. archiving is now part of posting
  if not IQConfirmYN('Save Costing Info?') then
     EXIT;

  TFrmJCMain.SaveProcessCostingInfoBasedOnUserName( SecurityManager.UserName + '_LOT_SUM' );  // jc_main
end;

procedure TFrmJC_ActCostPost.sbtnLotCostSummaryClick(Sender: TObject);
var
  SelectionList:TStringList;
begin
  if QryLotSumArinvoiceDetail.Eof and QryLotSumArinvoiceDetail.Bof then
     EXIT;

  if not IqConfirmYN(jc_rscstr.cTXT0000016) then    // 'Print lot cost summary report?';
     EXIT;

  try
    SelectionList := TStringList.Create;
    SelectionList.Add(Format('{C_PROCESS_COST_LOT_SUM.USERID} = ''%s''', [IntToStr(Trunc(FPit_Hdr_ID)) + '_LOT_SUM']));
    PrintDefaultReport( self, 'PROC_COST_BY_LOT_REPORT', SelectionList );  {IQMS.Common.Print.pas}
  finally
    SelectionList.Free;
  end;
end;


procedure TFrmJC_ActCostPost.sbtnPrepareGLClick(Sender: TObject);
begin
  if QryLotSumArinvoiceDetail.Eof and QryLotSumArinvoiceDetail.Bof then
     EXIT;

  if not IQConfirmYN('Are you sure you wish to prepare General Journal Entries?') then
     EXIT;

  PrepareGeneralJournalEntries;

  // 11-18-2011 if we ever decide to stay instead of leaving make sure the apply button is clicked again before
  // post to GJ. By clicking on Apply a new set of c_process_cost_hdr_id will be generated and thus when we post to GJ
  // the history table h_proc_cost_lot_sum will retain previous posted records because it will be associated with different
  // c_process_cost_hdr_id(s). Note c_process_cost_hdr_id is assigned based on arinvt_id + lot but c_process_cost_lot_sum
  // may have multiple records for the same arinvt + lot but different arinvoice_detail_id - all assigned the same c_process_cost_hdr_id.
  // Apply button changed the c_process_cost_hdr_id so when we post to GJ the previous records in h_proc_cost_lot_sum are not wiped out.
  Close;

  if Owner is TUniForm then
     PostMessage( TUniForm(Owner).Handle, iq_AfterExecute, 0, 0 );
end;

procedure TFrmJC_ActCostPost.sbtnProcCostApplyClick(Sender: TObject);
var
  AStart: TDateTime;
  AEnd  : TDateTime;
  hMsg  : TPanelMesg;
begin
  AStart:= SelectValueByID('start_date', 'glperiods', GLPeriods_IDFrom );
  AEnd  := SelectValueByID('end_date', 'glperiods', GLPeriods_IDTo );

  hMsg:= hPleaseWait('');
  try
    ExecuteCommandFmt('begin                                                                              '+
              '  proc_cost_lot_sum.populate_c_proc_cost_lot_sum( 0,                               '+  // v_arcusto_id    number
              '                                                  to_date(''%s'', ''mm/dd/yyyy''), '+  // v_from          date
              '                                                  to_date(''%s'', ''mm/dd/yyyy''), '+  // v_to            date
              '                                                  365,                             '+  // v_lot_cost_days number
              '                                                  ''Y'', ''%s'', ''%s'' );         '+  // exclude posted
              'end;                                                                               ',
              [ FormatDateTime('mm/dd/yyyy', AStart),
                FormatDateTime('mm/dd/yyyy', AEnd ),
                IntToStr(Trunc(FPit_Hdr_ID)),
                FTransactionType]);
  finally
    hMsg.Free;
    RefreshTables;
  end;
end;

procedure TFrmJC_ActCostPost.RefreshTables;
begin
  QryLotSumArinvoiceDetail.Close;
  QryLotSumArinvoiceDetail.Open;

  Reopen( QryCost_Elements );
end;

procedure TFrmJC_ActCostPost.SetGLPeriods_IDFrom(const Value: Real);
begin
  FGLPeriods_IDFrom:= Value;
//  wwDBComboDlgGLPeriod.Text:= SelectValueFmtAsString('select p.period || ''/'' || y.descrip from glperiods p, glyear y where p.id = %f and p.glyear_id = y.id', [ FGLPeriods_ID ]);
end;

procedure TFrmJC_ActCostPost.SetGLPeriods_IDTo(const Value: Real);
begin
  FGLPeriods_IDTo:= Value;
//  wwDBComboDlgGLPeriod.Text:= SelectValueFmtAsString('select p.period || ''/'' || y.descrip from glperiods p, glyear y where p.id = %f and p.glyear_id = y.id', [ FGLPeriods_ID ]);
end;


procedure TFrmJC_ActCostPost.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;


procedure TFrmJC_ActCostPost.wwDBComboDlgGLPeriodCustomDlg(Sender: TObject);
var
  AGLPeriods_ID: Real;
begin
  AGLPeriods_ID:= DoFindPeriod( self );  // returns glperiod_id iqshare\IQMS.Common.Period.pas
  if AGLPeriods_ID = 0 then
     EXIT;

  GLPeriods_IDFrom:= AGLPeriods_ID;
  GLPeriods_IDTo:= AGLPeriods_ID;

  DeleteData;
  RefreshTables;
end;

procedure TFrmJC_ActCostPost.PrepareGeneralJournalEntries;
var
  I: Integer;
var
  hMsg: TPanelMesg;
  AArinvoiceDetailList: TStringList;
  AGlprepostId, AGlprepostCycleId:Real;

  // ---------------------------------------------------------------------------
  procedure _Init;
  begin
    ExecuteCommand('begin glprepost_misc.arr_clear(); end;');
  end;

  // ---------------------------------------------------------------------------
  procedure _CheckAddArinvoiceDetail( AArinvoice_Detail_ID: Real );
  begin
    // precaution
    if AArinvoice_Detail_ID = 0 then
       EXIT;

    if AArinvoiceDetailList.IndexOf( FloatToStr( AArinvoice_Detail_ID )) > -1 then
       EXIT;

    // precaution
    if SelectValueFmtAsString('select actual_cost_posted from arinvoice_detail where id = %f', [ AArinvoice_Detail_ID ]) = 'Y' then
       EXIT;

    // update list in memory
    AArinvoiceDetailList.Add( FloatToStr( AArinvoice_Detail_ID ));

    // add to list on the backend
    ExecuteCommandFmt('begin glprepost_misc.arr_add( %f ); end;', [ AArinvoice_Detail_ID ]);
  end;

  // ---------------------------------------------------------------------------
  procedure _RemoveHistory;
  var
    AProcessCostHdrList:  TStringList;
    I: Integer;
  begin
    // remove any records for selected arinvoice_details that may be in the hist tables
    AProcessCostHdrList:= TStringList.Create;
    try
      // get all c_process_cost_hdr_id associated with the selected arinvoice_details
      for I:= 0 to AArinvoiceDetailList.Count - 1 do
        LoadColumnValueIntoStringList( AProcessCostHdrList,
                                             Format('select distinct c_process_cost_hdr_id from h_proc_cost_lot_sum where arinvoice_detail_id = %s and userid = ''%s''',
                                                    [  AArinvoiceDetailList[ I ],
                                                      IntToStr(Trunc(FPit_Hdr_ID))]));
//                                                       SecurityManager.UserName ]));

      // delete the history

      for I:= 0 to AProcessCostHdrList.Count - 1 do
      begin
        ExecuteCommandFmt('declare                                                                                '+
                  '  v_process_cost_hdr_id number::= %s;                                                  '+
                  'begin                                                                                  '+
                  '  delete from h_proc_cost_hdr where id = v_process_cost_hdr_id;                        '+
                  '  delete from h_proc_cost_lot_sum where c_process_cost_hdr_id = v_process_cost_hdr_id; '+
                  'end;                                                                                   ',
                  [ AProcessCostHdrList[ I ]]);
      end;

      ExecuteCommand('begin proc_cost.clear_arinvoice_detail_list; end;');
    finally
      AProcessCostHdrList.Free;
    end;
  end;


  // ---------------------------------------------------------------------------
  procedure _SaveToHistory;
  var
    AProcessCostHdrList:  TStringList;
    I: Integer;
    J: Integer;
  begin
    AProcessCostHdrList:= TStringList.Create;
    try
      // add arinvoice_details to the list
      for I:= 0 to AArinvoiceDetailList.Count - 1 do
        ExecuteCommandFmt('begin proc_cost.add_arinvoice_detail_list( %s ); end;', [ AArinvoiceDetailList[ I ]]);

      // get all c_process_cost_hdr_id associated with the selected arinvoice_details
      for I:= 0 to AArinvoiceDetailList.Count - 1 do
      begin
        LoadColumnValueIntoStringList( AProcessCostHdrList,
                                             Format('select distinct c_process_cost_hdr_id from c_process_cost_lot_sum where arinvoice_detail_id = %s and userid = ''%s''',
                                                    [ AArinvoiceDetailList[ I ],
                                                      IntToStr(Trunc(FPit_Hdr_ID))]));
//                                                      SecurityManager.UserName ]));

        // now save to history
        for J:= 0 to AProcessCostHdrList.Count - 1 do
          ExecuteCommandFmt('begin proc_cost.do_archive( %s ); end;', [ AProcessCostHdrList[ J ]]);
      end;

    finally
      AProcessCostHdrList.Free;
    end;
  end;

  // ---------------------------------------------------------------------------
  function _Execute:Real;
  var
    AResult :Real;
  begin
    AResult := GetNextID('GLPREPOST_CYCLE');
    // note the list of the arinvoice_detail.id is kept on the backend in an array. See above local _CheckAddArinvoiceDetail
    ExecuteCommandFmt('begin glprepost_misc.post_lot_sum_to_glprepost( %f, %f, %f); end;', [ GLPeriods_IDFrom, FPit_Hdr_ID, AResult ]);

    Result := SelectValueFmtAsFloat('select id from glprepost_cycle where id = %f', [AResult])
  end;

// -----------------------------------------------------------------------------
begin
  hMsg:= hPleaseWait('');
  AArinvoiceDetailList:= TStringList.Create;
  try
    // clear list of arinvoice_detail on the backend
    _Init;

    // prepare list of arinvoice_details
    with srchArinvoiceDetail do
    begin
      if wwDBGrid.SelectedList.Count > 0 then
         for I:= 0 to wwDBGrid.SelectedList.Count - 1 do
         begin
           DataSet.GotoBookmark( wwDBGrid.SelectedList.Items[ I ]);
           _CheckAddArinvoiceDetail( DataSet.FieldByName('arinvoice_detail_id').asFloat );
         end
      else
         _CheckAddArinvoiceDetail( DataSet.FieldByName('arinvoice_detail_id').asFloat );

      wwDBGrid.UnselectAll;
    end;

    // archive
    _RemoveHistory;   // precaution
    _SaveToHistory;

    // execute the list
    AGlprepostCycleId := _Execute;
    AGlprepostId :=  SelectValueFmtAsFloat('select glprepost_id from glprepost_cycle where id = %f', [AGlprepostCycleId]);

    if (AGlprepostId <> 0) and (AGlprepostCycleId <> 0) then
      DoGJTransLog(self, AGlprepostId, AGlprepostCycleId);     {in Journal.pas}


  finally
    hMsg.Free;
    AArinvoiceDetailList.Free;
    RefreshTables;
  end;
end;

end.


