unit qc_doc_where_used;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  IQMS.WebVcl.Search,
  DB,
  Wwdatsrc,
  Menus,
  FireDAC.Comp.Client,
  MainModule,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid, uniGUIFrame;

type
  { TFrmQcDocWhereUsed }
  TFrmQcDocWhereUsed = class(TUniForm)
    GridWhereUsed: TIQUniGridControl;
    SrcWhereUsed: TDataSource;
    QryWhereUsed: TFDQuery;
    QryWhereUsedID: TBCDField;
    QryWhereUsedMODULE: TStringField;
    QryWhereUsedDESCRIP: TStringField;
    PWhereUsed: TUniPopupMenu;
    JumpTo1: TUniMenuItem;
    QryWhereUsedSOURCE_ID: TBCDField;
    QryWhereUsedSOURCE: TStringField;
    QryWhereUsedINACTIVE: TStringField;
    QryWhereUsedPRINT_WITH: TStringField;
    pnlGrid: TUniPanel;
    Splitter1: TUniSplitter;
    Panel1: TUniPanel;
    pgctrlDetails: TUniPageControl;
    tabMfg: TUniTabSheet;
    pnlPgCtrl: TUniPanel;
    tabEmpty: TUniTabSheet;
    SrcDetails: TDataSource;
    QryMfg_Arinvt: TFDQuery;
    QryMfg_Sndop: TFDQuery;
    QryMfg_ArinvtMFGNO: TStringField;
    QryMfg_SndopMFGNO: TStringField;
    PWhereUsedDetail: TUniPopupMenu;
    QryMfg_ArinvtSTANDARD_ID: TBCDField;
    QryMfg_SndopSTANDARD_ID: TBCDField;
    JumpToBOM1: TUniMenuItem;
    srchMfg: TIQUniGridControl;
    QryMfg_Standard: TFDQuery;
    StringField1: TStringField;
    FloatField1: TBCDField;
    SrcWhereUsedFlat: TDataSource;
    QryWhereUsedFlat: TFDQuery;
    pcMain: TUniPageControl;
    TabGeneral: TUniTabSheet;
    TabBOM: TUniTabSheet;
    PnlCaption: TUniPanel;
    lblCaption: TUniLabel;
    GridFlat: TIQUniGridControl;
    QryWhereUsedFlatID: TBCDField;
    QryWhereUsedFlatMODULE: TStringField;
    QryWhereUsedFlatDESCRIP: TStringField;
    QryWhereUsedFlatINACTIVE: TStringField;
    QryWhereUsedFlatPRINT_WITH: TStringField;
    QryWhereUsedFlatSOURCE_ID: TBCDField;
    QryWhereUsedFlatSOURCE: TStringField;
    QryWhereUsedFlatMFGNO: TStringField;
    QryWhereUsedFlatSTANDARD_ID: TFMTBCDField;
    PWhereUsedFlat: TUniPopupMenu;
    JumpToBOM2: TUniMenuItem;
    JumpTo2: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryWhereUsedBeforeOpen(DataSet: TDataSet);
    procedure PWhereUsedPopup(Sender: TObject);
    procedure JumpTo1Click(Sender: TObject);
    procedure SrcWhereUsedDataChange(Sender: TObject; Field: TField);
    procedure BeforeOpenQryMfg(DataSet: TDataSet);
    procedure PWhereUsedDetailPopup(Sender: TObject);
    procedure JumpToBOM1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PWhereUsedFlatPopup(Sender: TObject);
    procedure JumpToBOM2Click(Sender: TObject);
    procedure JumpTo2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FExternal_Doc_ID: Int64;
    procedure Dispatch;
    procedure JumpToSource(const ASource: string; ASourceID: Int64);
    procedure SetExternal_Doc_ID(const Value: Real);
  public
    { Public declarations }
    property External_Doc_ID: Real write SetExternal_Doc_ID;
    class procedure DoShowModal(AExternal_Doc_ID: Real );
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //iqsecins,
  qc_rscstr,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.Jump,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook;

{ TFrmQcDocWhereUsed }

class procedure TFrmQcDocWhereUsed.DoShowModal(AExternal_Doc_ID: Real);
var
  FrmQcDocWhereUsed: TFrmQcDocWhereUsed;
begin
  FrmQcDocWhereUsed := TFrmQcDocWhereUsed.Create(uniGUIApplication.uniApplication);
  FrmQcDocWhereUsed.External_Doc_ID := AExternal_Doc_ID;
  FrmQcDocWhereUsed.Show;
end;

procedure TFrmQcDocWhereUsed.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self, pnlGrid ]);
  Self.BringToFront;
  IQSetTablesActiveEx(TRUE, self, '');

  // qc_rscstr.cTXT000173 = 'Where Document Used - %s';
  Caption:= Format(qc_rscstr.cTXT000173,
   [SelectValueFmtAsString(
    'SELECT descrip FROM external_doc WHERE id = %d',
    [FExternal_Doc_ID])]);

  { TODO -oSanketG -cWebConvert : Need to revisit }
  //iqsecins.EnsureSecurityInspectorOnTopOf(Self);

end;

procedure TFrmQcDocWhereUsed.UniFormCreate(Sender: TObject);
begin

  AdjustPageControlToParent( pgctrlDetails );
  pcMain.ActivePageIndex := 0;

  { TODO -oSanketG -cWebConvert : Need to find alternative property for wwDBGrid in TIQUniGridControl }
  {GridWhereUsed.wwDBGrid.ControlType.Clear;
  GridWhereUsed.wwDBGrid.ControlType.Append('INACTIVE;CheckBox;Y;N');
  GridWhereUsed.wwDBGrid.ApplySelected;

  GridFlat.wwDBGrid.ControlType.Clear;
  GridFlat.wwDBGrid.ControlType.Append('INACTIVE;CheckBox;Y;N');
  GridFlat.wwDBGrid.ApplySelected;}

end;

procedure TFrmQcDocWhereUsed.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmQuality{CHM}, iqhtmQuality{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmQcDocWhereUsed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlGrid ]);
end;

procedure TFrmQcDocWhereUsed.SetExternal_Doc_ID(const Value: Real);
begin
  FExternal_Doc_ID := Trunc(Value);
end;

procedure TFrmQcDocWhereUsed.SrcWhereUsedDataChange(Sender: TObject;
  Field: TField);
begin
  Dispatch;
end;


procedure TFrmQcDocWhereUsed.QryWhereUsedBeforeOpen(DataSet: TDataSet);
begin
//  with DataSet as TFDQuery do
//    ParamByName('external_doc_id').AsLargeInt := FExternal_Doc_ID;
  AssignQueryParamValue(DataSet, 'external_doc_id', FExternal_Doc_ID);
end;

procedure TFrmQcDocWhereUsed.PWhereUsedPopup(Sender: TObject);
begin
  JumpTo1.Enabled:= SR.Enabled['JumpTo1'] and
    (QryWhereUsedMODULE.AsString > '') and
    (QryWhereUsedFlatSOURCE_ID.AsLargeInt > 0);
  if JumpTo1.Enabled then
    begin
      // qc_rscstr.cTXT000174 = 'Jump to %s';
      JumpTo1.Caption:= Format(qc_rscstr.cTXT000174,
        [QryWhereUsedMODULE.AsString ]);
      { TODO -oSanketG -cWebConvert : Need to find alternative property for MenuCaption in TIQUniGridControl }
      {GridWhereUsed.MenuCaption(JumpTo1, JumpTo1.Caption);
      GridWhereUsed.MenuEnabled(JumpTo1, JumpTo1.Enabled);}
    end;
end;

procedure TFrmQcDocWhereUsed.JumpTo1Click(Sender: TObject);
begin
  if SR.Enabled['JumpTo1'] and
   (QryWhereUsedMODULE.AsString > '') and
   (QryWhereUsedFlatSOURCE_ID.AsLargeInt > 0) then
   JumpToSource(QryWhereUsedSOURCE.AsString, QryWhereUsedSOURCE_ID.AsLargeInt);
end;

procedure TFrmQcDocWhereUsed.JumpTo2Click(Sender: TObject);
begin
  // Execute jump
  JumpToSource(QryWhereUsedFlatSOURCE.AsString,
    QryWhereUsedFlatSOURCE_ID.AsLargeInt);
end;

procedure TFrmQcDocWhereUsed.JumpToSource(const ASource: string;
  ASourceID: Int64);
var
  AJump_ID  : Integer;
  ATarget_ID: Int64;
  AKind: string;
  AType: Integer;

  procedure _UnsupportedJump( AInfo: string = '' );
  begin
    // qc_rscstr.cTXT000175 = 'Jump information is unavailable.  Cannot jump to ' +
    // 'source.'#13#13'[%s, %d%s]';
    raise Exception.CreateFmt(
    qc_rscstr.cTXT000175,
    [ ASource, ASourceID, AInfo ]);
  end;

  function _GetRecordKind( ATableName: string = '' ): string;
  begin
    if ATableName = '' then
       ATableName:= ASource;

    Result:= SelectValueFmtAsString(
      'select qc_doc_misc.get_record_kind( ''%s'', %d ) from dual',
      [ ATableName, ASourceID ]);
  end;

  function _GetParentRecordKind: string;
  begin
    Result:= SelectValueFmtAsString(
      'select qc_doc_misc.get_parent_record_kind( ''%s'', %d ) from dual',
      [ASource, ASourceID ]);
  end;

  function _GetSourceVal(const ASourceIDFieldName: string): Int64;
  begin
    Result := SelectValueFmtAsInt64(
      'SELECT %s FROM %s WHERE id = %d',
      [ASourceIDFieldName, ASource,
      ASourceID]);
  end;

begin
  ATarget_ID:= ASourceID;

  if ASource = 'AKA' then
     begin
       AJump_ID  := iq_JumpToInv;
       ATarget_ID:= _GetSourceVal('arinvt_id');
     end

  else if ASource = 'HR_EMP_TRAINING' then
     begin
       AJump_ID  := iq_JumpHREmpTraining;
     end
  else if ASource = 'APQP' then
     begin
       if _GetRecordKind() = 'PROC_PQ' then
          AJump_ID:= iq_jumpToProcPQ
       else
          AJump_ID:= iq_JumpToAPQP
     end

  else if ASource = 'APQP_ELEMENT' then
     begin
       ATarget_ID:= _GetSourceVal('apqp_id');
       if _GetParentRecordKind() = 'PROC_PQ' then
          AJump_ID:= iq_jumpToProcPQ
       else
          AJump_ID:= iq_JumpToAPQP
     end

  else if ASource =  'PPAP' then
     begin
       if _GetRecordKind() = 'PROD_PQ' then
          AJump_ID:= iq_jumpToProdPQ
       else
          AJump_ID:= iq_JumpToPPAP
     end

  else if ASource = 'PPAP_ELEMENT' then
     begin
       ATarget_ID:= _GetSourceVal('ppap_id');
       if _GetParentRecordKind() = 'PROD_PQ' then
          AJump_ID:= iq_jumpToProdPQ
       else
          AJump_ID:= iq_JumpToPPAP
     end

  else if ASource =  'CAR' then
     begin
       if _GetRecordKind() = 'CAPA' then
          AJump_ID:= iq_jumpToCAPA
       else
          AJump_ID:= iq_JumpToCAR
     end

  else if ASource =  'CAR_ELEMENT' then
     begin
       ATarget_ID:= _GetSourceVal('car_id');
       if _GetParentRecordKind() = 'CAPA' then
          AJump_ID:= iq_jumpToCAPA
       else
          AJump_ID:= iq_JumpToCAR
     end

  else if ASource = 'ECO' then
     AJump_ID:= iq_JumpToECO

  else if ASource =  'ECO_ELEMENT'  then
     begin
       ATarget_ID:= _GetSourceVal('eco_id');
       AJump_ID:= iq_JumpToECO
     end

  else if ASource = 'PLM' then
     begin
       if _GetRecordKind() = 'DHR' then
          AJump_ID:= iq_JumpToDHR
       else
          AJump_ID:= iq_JumpToPLM
     end

  else if ASource = 'PLM_ITEM' then
     begin
       ATarget_ID:= SelectValueFmtAsInt64(
         'select s.plm_id from plm_item i, plm_scenario s where i.id = %d ' +
         'and i.plm_scenario_id = s.id',
         [ ASourceID ]);
       if _GetParentRecordKind() = 'DHR' then
          AJump_ID:= iq_JumpToDHR
       else
          AJump_ID:= iq_JumpToPLM
     end

  else if ASource =  'WORKFLOW' then
     begin
       AKind:= _GetRecordKind('WF_HEADER');
       if AKind = 'DEV' then
          AJump_ID:= iq_jumpToDEV
       else if AKind = 'MRB' then
          AJump_ID:= iq_jumpToMRB
       else if AKind = 'AUDIT' then
          AJump_ID:= iq_jumpToQualityAuditWorkFlow
       else
          AJump_ID:= iq_JumpToCRMWorkFlow
     end

  else if ASource =  'WF_ELEMENT'  then
     begin
       ATarget_ID:= _GetSourceVal('wf_header_id');
       AKind:= _GetParentRecordKind();
       if AKind = 'DEV' then
          AJump_ID:= iq_jumpToDEV
       else if AKind = 'MRB' then
          AJump_ID:= iq_jumpToMRB
       else if AKind = 'CRM' then
          AJump_ID:= iq_JumpToCRMWorkFlow
       else
          _UnsupportedJump( Format(', Kind = ''%s''', [ AKind ]));
     end

  // Note:  'CRM' is obsolete
  else if (ASource =  'CRM_ACTIVITY') or
   (ASource =  'CRM') then
     begin
       AType:= SelectValueFmtAsInteger(
         'SELECT type FROM crm_activity WHERE id = %d',
         [ASourceID]);
       if      AType = 1 then AJump_ID:= iq_JumpToCRMCall
       else if AType = 2 then AJump_ID:= iq_JumpToCRMTask
       else if AType = 3 then AJump_ID:= iq_JumpToCRMMeeting
       else if AType = 4 then AJump_ID:= iq_JumpToCRMSupport
       else if AType = 5 then AJump_ID:= iq_JumpToCRMNote
       else                   AJump_ID:= iq_JumpToCRMActivity
     end

  else if ASource = 'ARCUSTO' then
       AJump_ID:= iq_JumpToCustomer

  else if ASource = 'ARINVT' then
       AJump_ID:= iq_JumpToInv

  else if ASource = 'CRM_QUOTE' then
       AJump_ID:= iq_JumpToCRMQuote

  else if ASource = 'CRM_QUOTE_DETAIL' then
       begin
         AJump_ID:= iq_JumpToCRMQuote;
         ATarget_ID:= SelectValueFmtAsInt64(
           'SELECT crm_quote_id FROM crm_quote_detail WHERE id = %d',
           [ASourceID]);
       end

  else if ASource = 'FMEA' then
       begin
         if SelectValueFmtAsInteger(
           'SELECT 1 FROM fmea WHERE kind = ''FMEA_RISK'' AND id = %d',
           [ATarget_ID]) = 1 then
            AJump_ID := iq_jumpToRiskAssessment
         else
            AJump_ID := iq_jumpToFMEA;
       end

  else if ASource =  'PO' then
       AJump_ID:= iq_JumpToPO_Header

  else if ASource =  'PO_HIST' then
       AJump_ID:= iq_JumpToPOHist // iq_JumpToPO

  else if ASource =  'SNDOP' then
       AJump_ID:= iq_JumpToSndop

  else if ASource =  'STANDARD' then
       AJump_ID:= iq_JumpToBom

  else if ASource =  'TOOL_RFQ' then
       AJump_ID:= iq_JumpToTooling

  else if ASource =  'TOOL_RFQ_HISTORY' then
       AJump_ID:= iq_JumpToHistTooling

  else if ASource =  'TOOL_TASK_INFORMATION' then
       AJump_ID:= iq_JumpToToolingTask

  else if ASource =  'TOOL_TASK_HISTORY' then
       begin
         AJump_ID:= iq_JumpToHistTooling;
         ATarget_ID:= SelectValueFmtAsInt64(
          'SELECT tool_rfq_hist_id FROM tool_task_history WHERE id = %d',
          [ASourceID]);
       end

  else if ASource =  'ARINVT_VENDORS' then
     begin
       AJump_ID  := iq_JumpToInv;
       ATarget_ID:= _GetSourceVal('arinvt_id');
     end

  else if ASource =  'ORDERS' then
       AJump_ID  := iq_JumpToSalesOrder

  else if ASource =  'HIST_ORDERS' then
       AJump_ID  := iq_JumpToHistSalesOrder

  else if ASource =  'ORD_DETAIL' then
       begin
         AJump_ID  := iq_JumpToSalesOrder;
         ATarget_ID:= SelectValueFmtAsInt64(
          'SELECT orders_id FROM ord_detail WHERE id = %d',
          [ASourceID]);
       end

  else if ASource =  'ARINVT_LOT_DOCS'       then
     begin
       AJump_ID  := iq_JumpToInv;
       ATarget_ID:= _GetSourceVal('arinvt_id');
     end

  else if ASource =  'ARPREPOST' then
      AJump_ID:= iq_JumpToARPrepost

  else if ASource =  'HR_TRAINING_ITEMS'  then
      AJump_ID:= iq_JumpToWF_Training

  else if ASource =  'HR_JOB_DESCRIP' then
      AJump_ID:= iq_JumpToWF_JobDesc

  else if ASource =  'HR' then
      AJump_ID:= iq_JumpHRApp

  else if ASource =  'RM' then
      AJump_ID:= iq_JumpToRMAHeader

  else if ASource =  'HI' then
      AJump_ID:= iq_JumpToWF_Ilness

  else if ASource =  'FA' then
      AJump_ID:= iq_JumpToAM_FAMaint

  else if ASource =  'PARTNER' then
      AJump_ID:= iq_JumpToPartnerCentral

  else if ASource =  'CONTROL_PLAN' then
      AJump_ID:= iq_jumpToControlPlan

  else if ASource =  'FMEA' then
      AJump_ID:= iq_jumpToFMEA

  else if ASource =  'SPC_DEVICE' then
      AJump_ID:= iq_jumpToGagesDevices

  else if ASource =  'SPC_CALIBRATE' then
     begin
       AJump_ID:= iq_jumpToGagesDevices; // iqusrmsg
       ATarget_ID:= SelectValueFmtAsInt64(
         'SELECT spc_device_id FROM spc_calibrate WHERE id = %d',
         [ASourceID]);
     end

  else if ASource =  'PMEQMT' then
      AJump_ID:= iq_JumpToPM

  else if ASource =  'CRM_OPPORTUNITY' then
      AJump_ID:= iq_JumpToOpportunityCentral

  else if ASource =  'CRM_WARRANTY' then
      AJump_ID:= iq_JumpToCRMServiceCentral

  else if ASource =  'SHIPMENTS' then
      AJump_ID:= iq_JumpToPackSlipShipment

  else if ASource =  'WORK_CENTER' then
      AJump_ID:= iq_JumpToWorkCenter

  else if ASource =  'JOBSHOP' then
      AJump_ID:= iq_JumpToJobShop

  else if ASource =  'BOL' then
      AJump_ID:= iq_JumpToBOL

  else if ASource =  'QC_AUDIT' then
      AJump_ID:= iq_jumpToQualityAudit

  else if ASource =  'PMWO' then
      AJump_ID:= iq_JumpToPMWorkOrder

  else if ASource =  'VENDOR_RFQ_HDR' then
      AJump_ID:= iq_JumpToVendor_RFQ

  else if ASource =  'VENDOR' then
      AJump_ID:= iq_JumpToVendor

  else if ASource =  'QUOTE' then
      AJump_ID:= iq_JumpToQuote

  else if ASource =  'QSNDOP' then
      AJump_ID:= iq_JumpToQSndop

  else if ASource =  'PROD_CODE' then
      AJump_ID:= iq_JumpToProdCode

  else if ASource =  'ARINVT_GROUP' then
      AJump_ID:= iq_JumpToInvGroup

  else if ASource =  'SALESPEOPLE' then
      AJump_ID:= iq_JumpToSalesPeople

  else if ASource =  'CRPREPOST' then
      AJump_ID:= iq_JumpToCashReceipts

  else if ASource =  'VENDOR_RMA' then
      AJump_ID:= iq_JumpToVendorRMAHeader

  else if ASource =  'VENDOR_RMA' then
      AJump_ID:= iq_JumpToVendorRMAHeader

  else if ASource =  'EXP_DETAIL' then
      AJump_ID:= iq_JumpExpReportsDetail

  else if ASource =  'PR' then
      AJump_ID:= iq_JumpToPayroll_Employees

  else if ASource =  'CAMPAIGN' then
      AJump_ID:= iq_JumpToCRMCampaign //iqusrmsg

  else if ASource =  'QC_PROCESS' then
      AJump_ID:= iq_jumpToQualityProjects //iqusrmsg

  else if ASource = 'PCMON_BOM' then
      AJump_ID:= iq_jumpToRTPCMonBOMSetup

  else if ASource = 'RUNS_BEST' then
      AJump_ID:= iq_JumpToRunsBest
      
  else if ASource = 'APPREPOST' then
      AJump_ID:= iq_JumpToAPPrepost

  else if ASource = 'APINVOICE' then
      AJump_ID:= iq_JumpToAPInvoice
      
  else
       _UnsupportedJump;

  // Finally!
  JumpDirect(AJump_ID, ATarget_ID);
end;

procedure TFrmQcDocWhereUsed.BeforeOpenQryMfg(DataSet: TDataSet);
begin
//  with TFDQuery(DataSet) do
//    ParamByName('source_id').AsLargeInt := QryWhereUsedSOURCE_ID.AsLargeInt;
  AssignQueryParamValue(DataSet, 'source_id', QryWhereUsedSOURCE_ID.AsLargeInt);
end;


procedure TFrmQcDocWhereUsed.Dispatch;

   procedure _AssignActiveDataSet( ADataSet: TDataSet );
   begin
     Reopen( ADataSet );
     SrcDetails.DataSet:= ADataSet;
   end;

begin
  if CompareText(QryWhereUsedSOURCE.AsString, 'ARINVT') = 0 then
     begin
       pgctrlDetails.ActivePage:= tabMfg;
       _AssignActiveDataSet( QryMfg_Arinvt );
     end

  else if CompareText(QryWhereUsedSOURCE.AsString, 'STANDARD') = 0 then
     begin
       pgctrlDetails.ActivePage:= tabMfg;
       _AssignActiveDataSet( QryMfg_Standard );
     end

  else if CompareText(QryWhereUsedSOURCE.AsString, 'SNDOP') = 0 then
     begin
       pgctrlDetails.ActivePage:= tabMfg;
       _AssignActiveDataSet( QryMfg_Sndop );
     end

  else
     pgctrlDetails.ActivePage:= tabEmpty;
end;


procedure TFrmQcDocWhereUsed.PWhereUsedDetailPopup(Sender: TObject);
begin
  JumpToBOM1.Enabled := SR.Enabled['JumpToBOM1'] and
    (SrcDetails.DataSet.FieldByName('standard_id').AsLargeInt > 0);
  { TODO -oSanketG -cWebConvert : Need to find alternative property for MenuEnabled in TIQUniGridControl }
  //srchMfg.MenuEnabled(JumpToBOM1, JumpToBOM1.Enabled);
end;

procedure TFrmQcDocWhereUsed.PWhereUsedFlatPopup(Sender: TObject);
begin
  JumpTo2.Visible := SR.Enabled['JumpTo2'] and
    (QryWhereUsedFlatMODULE.AsString > '') and
    (QryWhereUsedFlatSOURCE_ID.AsLargeInt > 0) and
    (QryWhereUsedFlatSOURCE.AsString <> 'STANDARD');
  { TODO -oSanketG -cWebConvert : Need to find alternative property for MenuVisible in TIQUniGridControl }
  //GridFlat.MenuVisible(JumpTo2, JumpTo2.Visible);
  if JumpTo2.Visible then
    begin
      // qc_rscstr.cTXT000174 = 'Jump to %s';
      JumpTo2.Caption:= Format(qc_rscstr.cTXT000174,
        [QryWhereUsedFlatMODULE.AsString ]);
      { TODO -oSanketG -cWebConvert : Need to find alternative property for MenuEnabled, MenuCaption in TIQUniGridControl }
      {GridFlat.MenuCaption(JumpTo2, JumpTo2.Caption);
      GridFlat.MenuEnabled(JumpTo2, JumpTo2.Enabled);}
    end;
  JumpToBOM2.Enabled := SR.Enabled['JumpToBOM2'] and
    (QryWhereUsedFlatSTANDARD_ID.AsLargeInt > 0);
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //GridFlat.MenuEnabled(JumpToBOM2, JumpToBOM2.Enabled);
end;

procedure TFrmQcDocWhereUsed.JumpToBOM1Click(Sender: TObject);
begin
  // Jump to the BOM
  JumpDirect( iq_JumpToBom,
    SrcDetails.DataSet.FieldByName('standard_id').AsLargeInt );
end;


procedure TFrmQcDocWhereUsed.JumpToBOM2Click(Sender: TObject);
begin
  // Jump to the BOM
  if SR.Enabled['JumpToBOM2'] and
    (QryWhereUsedFlatSTANDARD_ID.AsLargeInt > 0) then
    JumpDirect( iq_JumpToBom,
      QryWhereUsedFlatSTANDARD_ID.AsLargeInt );
end;

end.

