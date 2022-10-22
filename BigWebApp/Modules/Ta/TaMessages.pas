unit TaMessages;

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
  Menus,
  ExtCtrls,
  IQMS.WebVcl.Search,
  DBCtrls,
  Db,
  Wwdatsrc,
  IQMS.WebVcl.About,
  StdCtrls,
  Mask,
  wwdbedit,
  Wwdotdot,
  Wwdbcomb,
  Wwdbgrid,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniDBEdit, uniDateTimePicker,
  uniDBDateTimePicker, IQUniGrid, uniGUIFrame;

type
  TFrmTaMessages = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    SrcMsg: TDataSource;
    QryMsg: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryMsgID: TBCDField;
    QryMsgGLOBAL: TStringField;
    QryMsgTA_SHIFT_ID: TBCDField;
    QryMsgPR_EMP_ID: TBCDField;
    QryMsgTA_MESSAGE: TStringField;
    QryMsgDISPLAY_TIME: TBCDField;
    QryMsgINACTIVE: TStringField;
    QryMsgSOURCE: TStringField;
    QryMsgSOURCE_ID: TBCDField;
    QryMsgEMPNO: TStringField;
    QryMsgEMP_NAME: TStringField;
    QryMsgSHIFT: TStringField;
    IQAbout1: TIQWebAbout;
    QryMsgEXPIRY_DATE: TDateTimeField;
    wwDBDateTimePicker1: TUniDBDateTimePicker;
    wwDBComboEmp: TUniEdit;
    wwDBComboShift: TUniEdit;
    wwDBComboSourceID: TUniEdit;
    wwDBComboSource: TUniDBComboBox;
    wwDBComboMessage: TUniEdit;
    wwDBSpinTime: TUniDBNumberEdit;
    wwMemoDialog1: TwwMemoDialog;
    PkShift: TIQWebHPick;
    PkShiftID: TBCDField;
    PkShiftDESCRIP: TStringField;
    PkEmp: TIQWebHPick;
    PkEmpID: TBCDField;
    PkEmpLAST_NAME: TStringField;
    PkEmpEMPNO: TStringField;
    PkEmpSSNMBR: TStringField;
    PkEmpSSN: TStringField;
    PkEmpFIRST_NAME: TStringField;
    PkPM: TIQWebHPick;
    PkPMID: TBCDField;
    PkPMWO_DATE: TDateTimeField;
    PkPMDEPARTMENT: TStringField;
    PkPMSTATUS: TStringField;
    PkPMPRIORITY: TStringField;
    PkPMWO_TYPE: TStringField;
    PkPMCLASS: TStringField;
    PkPMSTART_DATE: TDateTimeField;
    PkPMEND_DATE: TDateTimeField;
    PkPMTASK_DESCRIP: TStringField;
    PkPMTASKNO: TStringField;
    PkPMEQNO: TStringField;
    PkPMPQ_CLASS: TStringField;
    PkPMEQ_DESCRIP: TStringField;
    PkPMDESCRIPTION: TStringField;
    PkPMWO_OPEN: TStringField;
    PkPMPMEQMT_ID: TBCDField;
    PkPMEPLANT_ID: TBCDField;
    PkPMEPLANT_NAME: TStringField;
    PkPMPWID: TBCDField;
    PkWorkOrder: TIQWebHPick;
    PkWorkOrderID: TBCDField;
    PkWorkOrderMFGNO: TStringField;
    PkWorkOrderITEMNO: TStringField;
    PkWorkOrderDESCRIP: TStringField;
    PkWorkOrderREV: TStringField;
    PkWorkOrderEPLANT_ID: TBCDField;
    PkWorkOrderCYCLES_REQ: TBCDField;
    PkWorkOrderBUCKET: TBCDField;
    PkWorkOrderORIGIN: TStringField;
    PkWorkOrderDESCRIP2: TStringField;
    PkWorkOrderEQNO: TStringField;
    PkWorkOrderCNTR_DESC: TStringField;
    PkWorkOrderWC_ID: TBCDField;
    PkTL: TIQWebHPick;
    PkTLTOOL_RFQ_ID: TBCDField;
    PkTLRFQ: TStringField;
    PkTLPROJECT: TStringField;
    PkTLWORKORDERNO: TStringField;
    PkTLCUSTOMER: TStringField;
    PkTLEQNO: TStringField;
    PkTLEPLANT_ID: TBCDField;
    PkTLID: TBCDField;
    PkTLTASK_NAME: TStringField;
    PkOrders: TIQWebHPick;
    PkOrdersID: TBCDField;
    PkOrdersPONO: TStringField;
    PkOrdersCUSTNO: TStringField;
    PkOrdersCOMPANY: TStringField;
    PkOrdersDATE_TAKEN: TDateTimeField;
    PkOrdersORD_BY: TStringField;
    PkOrdersCLASS: TStringField;
    PkOrdersREV: TStringField;
    PkOrdersITEMNO: TStringField;
    PkOrdersDESCRIPTION: TStringField;
    PkOrdersDESCRIPTION2: TStringField;
    PkOrdersADDR1: TStringField;
    PkOrdersADDR2: TStringField;
    PkOrdersADDR3: TStringField;
    PkOrdersSTATUS: TStringField;
    PkOrdersCUST_ITEMNO: TStringField;
    PkOrdersCUST_DESCRIP: TStringField;
    PkOrdersECODE: TStringField;
    PkOrdersTOTAL_QTY_ORD: TBCDField;
    PkOrdersEPLANT_ID: TBCDField;
    PkOrdersWEB_ORDERS_ID: TBCDField;
    PkOrdersORDERNO: TStringField;
    PkRR: TIQWebHPick;
    PkRRRMA_ID: TBCDField;
    PkRRCREATED_NO: TDateTimeField;
    PkRRLEAD_DAYS: TBCDField;
    PkRRDUE_DATE: TDateTimeField;
    PkRRQUANTITY: TBCDField;
    PkRRWORKORDERNO: TStringField;
    PkRRARCUSTO_ID: TBCDField;
    PkRRRMANO: TStringField;
    PkRRCUSTOMER: TStringField;
    PkRRITEMNO: TStringField;
    PkRRDESCRIP: TStringField;
    PkRREPLANT_ID: TBCDField;
    PkRRID: TBCDField;
    PkJobShop: TIQWebHPick;
    PkJobShopID: TBCDField;
    PkJobShopPROJECTNO: TStringField;
    PkJobShopPROJECT_DESCRIP: TStringField;
    PkJobShopCUSTNO: TStringField;
    PkJobShopCOMPANY: TStringField;
    PkJobShopITEMNO: TStringField;
    PkJobShopDESCRIP: TStringField;
    PkJobShopREV: TStringField;
    PkJobShopMFGNO: TStringField;
    PkJobShopCNTR_TYPE: TStringField;
    PkJobShopMFG_TYPE: TStringField;
    PkJobShopMAIN_ARINVT_ID: TBCDField;
    PkJobShopMAIN_STANDARD_ID: TBCDField;
    PkJobShopTASK_ARINVT_ID: TBCDField;
    PkJobShopTASK_STANDARD_ID: TBCDField;
    PKUD: TIQWebHPick;
    PKUDID: TBCDField;
    PKUDCODE: TStringField;
    PKUDDESCRIP: TStringField;
    QryMsgCLOCK_IN: TStringField;
    QryMsgCLOCK_OUT: TStringField;
    Contents1: TUniMenuItem;
    QryMsgSUPER_NAME: TStringField;
    QryMsgEPLANT_ID: TBCDField;
    QryMsgSUPERVISOR_ID: TBCDField;
    QryMsgDIVISION_ID: TBCDField;
    QryMsgDIVISION: TStringField;
    QryMsgPR_PAYGROUP_ID: TBCDField;
    QryMsgPR_PAYGROUP: TStringField;
    wwDBComboDlgSuper: TUniEdit;
    wwDBComboDlgDivision: TUniEdit;
    wwDBComboDlgEplant: TUniEdit;
    wwDBComboDlgPaygroup: TUniEdit;
    PkDivision: TIQWebHPick;
    PkDivisionID: TBCDField;
    PkDivisionNAME: TStringField;
    PkDivisionEPLANT_ID: TBCDField;
    PkEplant: TIQWebHPick;
    PkEplantID: TBCDField;
    PkEplantNAME: TStringField;
    PkPayGroup: TIQWebHPick;
    Panel2: TUniPanel;
    IQSearch2: TIQUniGridControl;
    SrcEmp: TDataSource;
    QryEmp: TFDQuery;
    QryEmpID: TBCDField;
    QryEmpTA_MESSAGES_ID: TBCDField;
    QryEmpPR_EMP_ID: TBCDField;
    QryEmpEMPNO: TStringField;
    QryEmpEMP_NAME: TStringField;
    UpdateSQL2: TFDUpdateSQL;
    wwDBComboEmpMsg: TUniEdit;
    PopupMenu1: TUniPopupMenu;
    SelectMultipleEmployees1: TUniMenuItem;
    PkEmpSuper: TIQWebHPick;
    FloatField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    PKUDPK_HIDE: TStringField;
    PkEmpMIDDLE_NAME: TStringField;
    PkEmpSuperMIDDLE_NAME: TStringField;
    PkWorkOrderWO_NUM: TBCDField;
    PkPayGroupID: TBCDField;
    PkPayGroupDESCRIPTION: TStringField;
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure About1Click(Sender: TObject);
    procedure QryMsgAfterPost(DataSet: TDataSet);
    procedure QryMsgBeforePost(DataSet: TDataSet);
    procedure wwDBComboEmpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboShiftKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBDateTimePicker1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboMessageCustomDlg(Sender: TObject);
    procedure wwDBComboShiftCustomDlg(Sender: TObject);
    procedure wwDBComboEmpCustomDlg(Sender: TObject);
    procedure wwDBComboSourceIDCustomDlg(Sender: TObject);
    procedure wwDBComboSourceIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboSourceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryMsgNewRecord(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure wwDBComboDlgSuperCustomDlg(Sender: TObject);
    procedure wwDBComboDlgDivisionCustomDlg(Sender: TObject);
    procedure wwDBComboDlgEplantCustomDlg(Sender: TObject);
    procedure wwDBComboDlgPaygroupCustomDlg(Sender: TObject);
    procedure wwDBComboDlgDivisionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgEplantKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgPaygroupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgSuperKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryEmpAfterPost(DataSet: TDataSet);
    procedure QryEmpBeforePost(DataSet: TDataSet);
    procedure SelectMultipleEmployees1Click(Sender: TObject);
    procedure QryMsgAfterScroll(DataSet: TDataSet);
    procedure NavEmpBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure wwDBComboEmpMsgCustomDlg(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoTAMessages;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.HelpHook,
  ta_rscstr;

{$R *.DFM}

procedure DoTAMessages;
var
  LFrmTaMessages : TFrmTaMessages;
begin
  LFrmTaMessages :=  TFrmTaMessages.Create(UniGUIApplication.UniApplication);
  LFrmTaMessages.Show;
end;

procedure TFrmTaMessages.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActiveEx( TRUE, self, ta_rscstr.cTXT0000198 {'Accessing Employee/Task Messages.  Please wait.'});
  IQRegFormRead( self, [self]);

  QryMsgAfterScroll(nil);

  wwDBDateTimePicker1.Parent := IqSearch1.DBGrid;
  wwDBComboEmp.Parent := IqSearch1.DBGrid;
  wwDBComboShift.Parent := IqSearch1.DBGrid;
  wwDBComboSourceID.Parent := IqSearch1.DBGrid;
  wwDBComboSource.Parent := IqSearch1.DBGrid;
  wwDBComboMessage.Parent := IqSearch1.DBGrid;
  wwDBSpinTime.Parent := IqSearch1.DBGrid;


  wwDBDateTimePicker1.Visible := False;
  wwDBComboEmp.Visible := False;
  wwDBComboShift.Visible := False;
  wwDBComboSourceID.Visible := False;
  wwDBComboSource.Visible := False;
  wwDBComboMessage.Visible := False;
  wwDBSpinTime.Visible := False;

  wwDBComboDlgSuper.Parent := IqSearch1.DBGrid;
  wwDBComboDlgDivision.Parent := IqSearch1.DBGrid;
  wwDBComboDlgEplant.Parent := IqSearch1.DBGrid;
  wwDBComboDlgPaygroup.Parent := IqSearch1.DBGrid;

  wwDBComboDlgSuper.Visible := False;
  wwDBComboDlgDivision.Visible := False;
  wwDBComboDlgEplant.Visible := False;
  wwDBComboDlgPaygroup.Visible := False;

  wwDBComboEmpMsg.Parent := IqSearch2.DBGrid;
  wwDBComboEmpMsg.Visible := False;
end;

procedure TFrmTaMessages.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTaMessages.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmTaMessages.DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  aId:Real;
begin
  if Button = nbRefresh then
  begin
    aId := QryMsgID.asFloat;
    QryMsg.Close;
    QryMsg.Open;
    QryMsg.Locate('ID', aId, []);
    SysUtils.Abort;
  end;
end;

procedure TFrmTaMessages.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmTaMessages.QryMsgAfterPost(DataSet: TDataSet);
begin
  try
    QryMsg.ApplyUpdates;
    QryMsg.CommitUpdates;
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryMsg.Close;
      QryMsg.Open;
      SysUtils.ABORT;
    end;
  end;
end;

procedure TFrmTaMessages.QryMsgBeforePost(DataSet: TDataSet);
begin
  if QryMsgID.asFloat = 0 then
     QryMsgID.asFloat:= GetNextID('TA_MESSAGES');

  if QryMsgGLOBAL.asString = 'Y' then
    if SelectValueFmtAsFloat('select id from ta_messages where NVL(global, ''N'') = ''Y'' and id <> %f', [QryMsgID.asFloat]) <> 0 then
      raise exception.create(ta_rscstr.cTXT0000119 {'Only one global message allowed.'});

  if QryMsgSOURCE.asString <> '' then
  begin
    if (QryMsgSOURCE_ID.asString = '') and (QryMsgSOURCE.asString <> 'SNDOP_DISPATCH') then
      raise exception.create(ta_rscstr.cTXT0000120 {'Please enter a Source ID.'});

    if      QryMsgSOURCE.asString = 'PM' then
    begin
      if SelectValueFmtAsFloat('select id from pmwo_dtl where id = %s', [QryMsgSOURCE_ID.asString]) = 0 then
        raise Exception.Create(ta_rscstr.cTXT0000094{'Invalid Task ID'});
    end
    else if QryMsgSOURCE.asString = 'WO' then
    begin
      if SelectValueFmtAsFloat('select id from standard where id = %s', [QryMsgSOURCE_ID.asString]) = 0 then
        raise Exception.Create(ta_rscstr.cTXT0000094{'Invalid Task ID'});
    end
    else if QryMsgSOURCE.asString = 'TL' then
    begin
      if SelectValueFmtAsFloat('select id from tool_task_information where id = %s', [QryMsgSOURCE_ID.asString]) = 0 then
        raise Exception.Create(ta_rscstr.cTXT0000094{'Invalid Task ID'});
    end
    else if QryMsgSOURCE.asString = 'SO' then
    begin
      if SelectValueFmtAsFloat('select id from ord_detail where id = %s', [QryMsgSOURCE_ID.asString]) = 0 then
        raise Exception.Create(ta_rscstr.cTXT0000094{'Invalid Task ID'});
    end
    else if QryMsgSOURCE.asString = 'UD' then
    begin
      if SelectValueFmtAsFloat('select id from master_labor where id = %s', [QryMsgSOURCE_ID.asString]) = 0 then
        raise Exception.Create(ta_rscstr.cTXT0000094{'Invalid Task ID'});
    end
    else if QryMsgSOURCE.asString = 'JS' then
    begin
      if SelectValueFmtAsFloat('select id from jobshop_task where id = %s', [QryMsgSOURCE_ID.asString]) = 0 then
        raise Exception.Create(ta_rscstr.cTXT0000094{'Invalid Task ID'});
    end
    else if QryMsgSOURCE.asString = 'RR' then
    begin
      if SelectValueFmtAsFloat('select id from rma_detail where id = %s', [QryMsgSOURCE_ID.asString]) = 0 then
        raise Exception.Create(ta_rscstr.cTXT0000094{'Invalid Task ID'});
    end
    else if QryMsgSOURCE.asString = 'SNDOP_DISPATCH' then
    begin
//
    end
    else
      raise Exception.Create(ta_rscstr.cTXT0000117{'Invalid Source'});
  end
  else
  QryMsgSOURCE_ID.Clear;

  if (QryMsgGLOBAL.asString <> 'Y') and (QryMsgSOURCE.asString = '') then
    if not ((QryMsgCLOCK_IN.asString = 'Y') or (QryMsgCLOCK_OUT.asString = 'Y')) then
       // 'Please check either "On Clock in" or "On Clock out."'
        raise Exception.Create(ta_rscstr.cTXT0000121);

  if QryMsgDISPLAY_TIME.asInteger < 0 then
    raise Exception.Create(ta_rscstr.cTXT0000122{'Display Time must be a positive number'});

end;

procedure TFrmTaMessages.wwDBComboEmpKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryMsg.Edit;
    QryMsgPR_EMP_ID.Clear;
    QryMsgEMPNO.Clear;
    QryMsgEMP_NAME.Clear;
    Key:= 0;
  end;
end;

procedure TFrmTaMessages.wwDBComboShiftKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryMsg.Edit;
    QryMsgTA_SHIFT_ID.Clear;
    QryMsgSHIFT.Clear;
    Key:= 0;
  end;
end;

procedure TFrmTaMessages.wwDBDateTimePicker1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryMsg.Edit;
    QryMsgEXPIRY_DATE.Clear;
    Key:= 0;
  end;
end;

procedure TFrmTaMessages.wwDBComboSourceIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryMsg.Edit;
    QryMsgSOURCE_ID.Clear;
    QryMsgSOURCE.Clear;
    Key:= 0;
  end;
end;

procedure TFrmTaMessages.wwDBComboSourceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryMsg.Edit;
    QryMsgSOURCE_ID.Clear;
    QryMsgSOURCE.Clear;
    Key:= 0;
  end;
end;

procedure TFrmTaMessages.wwDBComboMessageCustomDlg(Sender: TObject);
begin
  wwMemoDialog1.Execute;
end;

procedure TFrmTaMessages.wwDBComboShiftCustomDlg(Sender: TObject);
begin
  with PkShift do
  if execute then
  begin
    if not (Qrymsg.state in [dsedit, dsinsert]) then Qrymsg.Edit;
    QryMsgTA_SHIFT_ID.asFloat := GetValue('ID');
    QryMsgSHIFT.asString      := GetValue('DESCRIP');
  end;
end;

procedure TFrmTaMessages.wwDBComboEmpCustomDlg(Sender: TObject);
begin
  with PkEmp do
  if execute then
  begin
    if not (Qrymsg.state in [dsedit, dsinsert]) then Qrymsg.Edit;
    QryMsgPR_EMP_ID.asFloat := GetValue('ID');
    QryMsgEMPNO.asString    := GetValue('EMPNO');
    QryMsgEMP_NAME.asString := Trim(GetValue('first_name') + ' ' + Trim(GetValue('middle_name') + ' ' + GetValue('last_name')));
//    QryMsgEMP_NAME.asString := RTrim(GetValue('first_name')) + ' ' + RTrim(GetValue('last_name'));
  end;
end;

procedure TFrmTaMessages.wwDBComboSourceIDCustomDlg(Sender: TObject);
var
  APK:TIQWebHPick;
begin
    if      QryMsgSOURCE.asString = 'PM' then APK := PkPM
    else if QryMsgSOURCE.asString = 'WO' then APK := PkWorkOrder
    else if QryMsgSOURCE.asString = 'TL' then APK := PkTL
    else if QryMsgSOURCE.asString = 'SO' then APK := PkOrders
    else if QryMsgSOURCE.asString = 'JS' then APK := PkJobShop
    else if QryMsgSOURCE.asString = 'RR' then APK := PkRR
    else if QryMsgSOURCE.asString = 'UD' then APK := PkUD
    else Exit;

    with APK do
    if Execute then
    begin
      if not (Qrymsg.state in [dsedit, dsinsert]) then Qrymsg.Edit;
      QryMsgSOURCE_ID.asFloat := GetValue('ID');
    end;
end;


procedure TFrmTaMessages.QryMsgNewRecord(DataSet: TDataSet);
begin
  QryMsgCLOCK_IN.asString := 'Y';
end;

procedure TFrmTaMessages.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmTA{CHM}, iqhtmTA{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmTaMessages.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmTaMessages.wwDBComboDlgSuperCustomDlg(Sender: TObject);
begin
  with PkEmpSuper do
  if execute then
  begin
    if not (Qrymsg.state in [dsedit, dsinsert]) then Qrymsg.Edit;
    QryMsgSUPERVISOR_ID.asFloat := GetValue('ID');
    QryMsgSUPER_NAME.asString := Trim(GetValue('first_name') + ' ' + Trim(GetValue('middle_name') + ' ' + GetValue('last_name')));
//    QryMsgSUPER_NAME.asString := RTrim(GetValue('first_name')) + ' ' + RTrim(GetValue('last_name'));
  end;
end;

procedure TFrmTaMessages.wwDBComboDlgDivisionCustomDlg(Sender: TObject);
begin
  with PkDivision do
  if execute then
  begin
    if not (Qrymsg.state in [dsedit, dsinsert]) then Qrymsg.Edit;
    QryMsgDIVISION_ID.asFloat := GetValue('ID');
    QryMsgDIVISION.asString := GetValue('name');
  end;

end;

procedure TFrmTaMessages.wwDBComboDlgEplantCustomDlg(Sender: TObject);
begin
  with PkEplant do
  if execute then
  begin
    if not (Qrymsg.state in [dsedit, dsinsert]) then Qrymsg.Edit;
    QryMsgEPLANT_ID.asFloat := GetValue('ID');
  end;

end;

procedure TFrmTaMessages.wwDBComboDlgPaygroupCustomDlg(Sender: TObject);
begin
  with PkPaygroup do
  if execute then
  begin
    if not (Qrymsg.state in [dsedit, dsinsert]) then Qrymsg.Edit;
    QryMsgPR_PAYGROUP_ID.asFloat := GetValue('ID');
    QryMsgPR_PAYGROUP.asString := GetValue('DESCRIPTION');
  end;
end;

procedure TFrmTaMessages.wwDBComboDlgDivisionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryMsg.Edit;
    QryMsgDIVISION_ID.Clear;
    QryMsgDIVISION.Clear;
    Key:= 0;
  end;

end;

procedure TFrmTaMessages.wwDBComboDlgEplantKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryMsg.Edit;
    QryMsgEPLANT_ID.Clear;
    Key:= 0;
  end;
end;

procedure TFrmTaMessages.wwDBComboDlgPaygroupKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryMsg.Edit;
    QryMsgPR_PAYGROUP_ID.Clear;
    QryMsgPR_PAYGROUP.Clear;
    Key:= 0;
  end;
end;

procedure TFrmTaMessages.wwDBComboDlgSuperKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryMsg.Edit;
    QryMsgSUPERVISOR_ID.Clear;
    QryMsgSUPER_NAME.Clear;
    Key:= 0;
  end;
end;

procedure TFrmTaMessages.QryEmpAfterPost(DataSet: TDataSet);
begin
  try
    QryEmp.ApplyUpdates;
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryEmp.Close;
      QryEmp.Open;
      SysUtils.ABORT;
    end;
  end;

end;

procedure TFrmTaMessages.QryEmpBeforePost(DataSet: TDataSet);
begin
  if QryMsgID.asFloat = 0 then
    raise Exception.Create(ta_rscstr.cTXT0000123 {'No header record found'});
  if QryEMPID.asFloat = 0 then
     QryEMPID.asFloat:= GetNextID('TA_MESSAGES');

  QryEmpTA_MESSAGES_ID.asFloat := QryMsgID.asFloat;
end;

procedure TFrmTaMessages.SelectMultipleEmployees1Click(Sender: TObject);
begin
  QryMsg.CheckBrowsemode;
  Panel2.Visible := true;
end;

procedure TFrmTaMessages.QryMsgAfterScroll(DataSet: TDataSet);
begin
  Panel2.Visible := SelectValueFmtAsFloat('select count(id) from ta_messages_emp where ta_messages_id = %f', [QryMsgID.asFloat]) <> 0;
end;

procedure TFrmTaMessages.NavEmpBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    aId := QryEmpID.asFloat;
    QryEmp.Close;
    QryEmp.Open;
    QryEmp.Locate('ID', aId, []);
    SysUtils.Abort;
  end
end;

procedure TFrmTaMessages.wwDBComboEmpMsgCustomDlg(Sender: TObject);
begin
  if QryMsgID.asFloat <> 0 then
  with PkEmp do
  if execute then
  begin
    if not (QryEmp.state in [dsedit, dsinsert]) then QryEmp.Edit;
    QryEmpPR_EMP_ID.asFloat := GetValue('ID');
    QryEmpEMPNO.asString    := GetValue('EMPNO');
    QryEmpEMP_NAME.asString := RTrim(GetValue('first_name')) + ' ' + RTrim(GetValue('last_name'));
    QryEmpTA_MESSAGES_ID.asFloat := QryMsgID.asFloat;
  end;

end;

end.
