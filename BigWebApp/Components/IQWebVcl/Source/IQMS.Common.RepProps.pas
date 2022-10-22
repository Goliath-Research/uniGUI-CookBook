unit IQMS.Common.RepProps;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  system.Variants,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox, Vcl.Controls,
  uniFileUpload;

type
  TFrmRepProps = class(TUniForm)
    QryAllProcs: TFDQuery;
    QryAllProcsOBJECT_NAME: TStringField;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label4: TUniLabel;
    Label1: TUniLabel;
    PnlEditCtrls2: TUniPanel;
    PnlEditCtrls1: TUniPanel;
    Edit1: TUniEdit;
    dbBefore: TUniDBLookupComboBox;
    sbReport: TUniSpeedButton;
    SbDefault: TUniSpeedButton;
    UniFileUpload1: TUniFileUpload;
    procedure sbReportClick(Sender: TObject);
    procedure SbDefaultClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
    FField, FTable: string;
    FOrigReport, FOrigBefore: string;
    FTableID: Real;
  public
    { Public declarations }
    constructor Create( AField, ATable: string; ATableID: Real );
  end;

procedure DoReportProperties( AField:String; ATable:String = 'IQSYS'; ATableID: Real = 0);


implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  IQMS.Common.RepBomWo;

procedure DoReportProperties( AField:String; ATable: string = 'IQSYS'; ATableID: Real = 0);
begin
  if CompareText( ATable, 'mfgtype' ) = 0 then
  begin
    DoReportPropertiesBomWo;
    Exit;
  end;

  with TFrmRepProps.Create( AField, ATable, ATableID ) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

constructor TFrmRepProps.Create(  AField, ATable: string; ATableID: Real );
  var
  AResEdit1: Variant;
  AResDbBefore: Variant;
begin
  inherited Create(uniGUIApplication.UniApplication);
  IQRegFormRead(self, [self, PnlLeft01]);
  Caption := Format(IQMS.Common.ResStrings.cTXT0000235 {'%s Properties'}, [Caption]);
  QryAllProcs.Open;

  FField  := AField;
  FTable  := ATable;
  FTableID:= ATableID;

  AResEdit1   := SelectValue(Where( Format('select %s from %s', [ FField, FTable ]), [ 'ID', FTableID ]));
  AResDbBefore:= SelectValue(Where( Format('select before_%s from %s', [ FField, FTable ]), [ 'ID', FTableID ]));

  if not (VarIsNull(AResEdit1)) then
  Edit1.Text := AResEdit1;

  if not (VarIsNull(AResDbBefore)) then
  dbBefore.Text := AResDbBefore;

  FOrigReport  := Edit1.Text;
  FOrigBefore  := dbBefore.Text;

  QryAllProcs.Locate('OBJECT_NAME', dbBefore.Text, []);

  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlEditCtrls1);
end;

procedure TFrmRepProps.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, PnlLeft01]);
end;

procedure TFrmRepProps.sbReportClick(Sender: TObject);
begin
  UniFileUpload1.FileName  := Edit1.Text;
  UniFileUpload1.Execute;
end;

procedure TFrmRepProps.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
begin
  if (not Empty(AStream.FileName)) and (not FileExists(AStream.FileName)) then
          raise Exception.Create(Format( IQMS.Common.ResStrings.cTXT0000125 {'File %s not found'}, [AStream.FileName]));
       Edit1.Text := UpperCase(ExtractFileName(AStream.FileName));
end;

procedure TFrmRepProps.SbDefaultClick(Sender: TObject);
var
  AReportName: string;
begin
  // IQMS.Common.ResStrings.cTXT0000236 =
  // 'Do you wish to assign default report?'
  if not IQMS.Common.Dialogs.IQConfirmYN(IQMS.Common.ResStrings.cTXT0000236) then
    Exit;

  // This field is not in the view (not listed in System Parameters),
  // so it must be hard-coded.
  if (CompareText(Trim(FField), 'BOL_ALL_PS_REPORT') = 0) then
    AReportName := 'BOL_PACKSLIPS.RPT'
  else
    // 10/01/2014 Get the default report name from the view (Byron).
    // Note:  To define the default report name for the IQSYS or IQSYS2
    // report (meaning, it is listed under "Reports and Forms" in
    // System Parameters), make sure it is noted in the view.
    AReportName := SelectValueFmtAsString(
      'SELECT default_report FROM v_iqsys_reports ' +
      'WHERE TRIM(UPPER(field_name)) = TRIM(UPPER(''%s'')) ',
      [FField]);

  // Assign the report
  if Trim(AReportName) > '' then
    Edit1.Text := AReportName
  else
    // If there is no default report, then inform the user.
    // IQMS.Common.ResStrings.cTXT0000237 =
    // 'There is no default report assigned to %s'
    IQMS.Common.Dialogs.IQInformation(Format(IQMS.Common.ResStrings.cTXT0000237, [FField]));

(*
  if      Trim(FField) = 'PR_AFTERPOST_REPORT'     then Edit1.Text := 'PRPOST.RPT'
  else if Trim(FField) = 'GJ_AFTERPOST_REPORT'     then Edit1.Text := 'POST.RPT'
  else if Trim(FField) = 'AP_AFTERPOST_REPORT'     then Edit1.Text := 'POST.RPT'
  else if Trim(FField) = 'AR_AFTERPOST_REPORT'     then Edit1.Text := 'POST.RPT'
  else if Trim(FField) = 'CD_AFTERPOST_REPORT'     then Edit1.Text := 'POST.RPT'
  else if Trim(FField) = 'CR_AFTERPOST_REPORT'     then Edit1.Text := 'POST.RPT'
  else if Trim(FField) = 'CD_CHECK_REMITANCE'      then Edit1.Text := 'REMITADV.RPT'
  else if Trim(FField) = 'PR_CHECK_REPNAME'        then Edit1.Text := 'PR_CHECK.RPT'
  else if Trim(FField) = 'CD_CHECK_REPNAME'        then Edit1.Text := 'AP_CHECK.RPT'
  else if Trim(FField) = 'PO_REPORT'               then Edit1.Text := 'PURCHORD.RPT'
  else if Trim(FField) = 'ORD_ACK_REPORT'          then Edit1.Text := 'ORD_ACK.RPT'
  else if Trim(FField) = 'PACKSLIP_REPORT'         then Edit1.Text := 'PACKSLIP.RPT'
  else if Trim(FField) = 'INVOICE_REPORT'          then Edit1.Text := 'INVOICE.RPT'
  else if Trim(FField) = 'ORD_REPORT'              then Edit1.Text := 'SALESORD.RPT'
  else if Trim(FField) = 'ORD_STAT_REPORT'         then Edit1.Text := 'STATEMNT.RPT'
  else if Trim(FField) = 'CUST_STATEMENT_REPORT'   then Edit1.Text := 'STATEMNT.RPT'
  else if Trim(FField) = 'QLETTER_REPORT'          then Edit1.Text := 'QLETTER.RPT'
  else if Trim(FField) = 'BOL_REPORT'              then Edit1.Text := 'LADING.RPT'
  else if Trim(FField) = 'PR_DD_REPNAME'           then Edit1.Text := 'PR_CHECK.RPT'
  else if Trim(FField) = 'TL_RFQ_REPORT'           then Edit1.Text := 'TOOLRFQ.RPT'
  else if Trim(FField) = 'TL_WO_REPORT'            then Edit1.Text := 'TOOLWO.RPT'
  else if Trim(FField) = 'PROD_REPORT'             then Edit1.Text := 'PROD_RPT.RPT'
  else if Trim(FField) = 'PM_WO_REPORT'            then Edit1.Text := 'PMWRKORD.RPT'
  else if Trim(FField) = 'PS_TICKET_REPORT'        then Edit1.Text := 'PICKTICK.RPT'
  else if Trim(FField) = 'RECV_TICKET_REPORT'      then Edit1.Text := 'RECVTICK.RPT'
  else if Trim(FField) = 'JOBSHOP_REPORT'          then Edit1.Text := 'JSHOPRFQ.RPT'
  else if Trim(FField) = 'BOL_HEADER_REPORT'       then Edit1.Text := 'BOL_HDR.RPT'
  else if Trim(FField) = 'WO_ROUTE_REPORT'         then Edit1.Text := 'WO_ROUTE.RPT'
  else if Trim(FField) = 'RR_WO_REPORT'            then Edit1.Text := 'RR_WO.RPT'
  else if Trim(FField) = 'FAB_LOT_TRAVELER_REPORT' then Edit1.Text := 'FAB_LOT_TRAVELER.RPT'
  {*} else if Trim(FField) =  'BOL_ALL_PS_REPORT'      then Edit1.Text := 'BOL_PACKSLIPS.RPT'
  else if Trim(FField) =  'STAGING_REPORT'         then Edit1.Text := 'STAGE.RPT'
  else if Trim(FField) =  'KB_CARD_REPORT'         then Edit1.Text := 'KB_CARD.RPT'
  else if Trim(FField) =  'RFQ_BATCH_REPORT'       then Edit1.Text := 'QLETTER_MULTI.RPT'
  else if Trim(FField) =  'RFQ_COMPARE_REPORT'     then Edit1.Text := 'QUOTE_COMPARE.RPT'
  else if Trim(FField) =  'MRB_WO_REPORT'          then Edit1.Text := 'MRB_WORKORDER.RPT'
  else if Trim(FField) =  'ASSY1_TRAVELER_REPORT'  then Edit1.Text := 'ASSY1_TRAVELER_AD.RPT'
  else if Trim(FField) =  'MANUAL_PS_REPORT'       then Edit1.Text := 'MANPACK.RPT'
  else if Trim(FField) =  'MANUAL_BOL_REPORT'      then Edit1.Text := 'MANBOL.RPT'
  else if Trim(FField) =  'COMMER_INVOICE_REPORT'  then Edit1.Text := 'COMM_INVOICE.RPT'
  else if Trim(FField) = 'EXPECTED_RECEIPT_REPORT' then Edit1.Text := 'EXPECTED_RECEIPTS.RPT'
  else if Trim(FField) = 'TRANSLOG_PREP_REPORT'    then Edit1.Text := sIIf( SelectValueAsString('select act_cost_posting from iqsys where rownum < 2') = 'Y',
                                                                            'PCPREP_ACT.RPT',
                                                                            'PCPREP.RPT')
  else if Trim(FField) =  'REQ_REPORT'  then Edit1.Text := 'REQUISITION.RPT'
  else
      // 'There is no default report assigned to %s'
      IQConfirm(Format(IQMS.Common.ResStrings.cTXT0000237, [ FField ]));
*)
end;

procedure TFrmRepProps.btnOKClick(Sender: TObject);
begin
  if FOrigReport <> Edit1.Text then
    ExecuteCommand(Where( Format( 'update %s set %s = ''%s''', [ FTable, FField, Edit1.Text ]), [ 'ID', FTableID ]));

  if FOrigBefore <> dbBefore.Text then
    ExecuteCommand(Where( Format( 'update %s set before_%s = ''%s''', [ FTable, FField, dbBefore.Text ]), [ 'ID', FTableID ]));

  Close;
end;

end.
