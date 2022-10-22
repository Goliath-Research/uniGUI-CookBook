unit UpdateSalesPersonChk;

{ ** History **

  01/11/2011
  This form was added (Byron) as part of SCR 1799.
}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Phys,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel, uniImage, uniRadioGroup, IQUniGrid, uniGUIFrame;

type
  { TSalesPersonChkMode }
  TSalesPersonChkMode = (scmIndividual, scmGroup);

  { TFrmUpdateSalesPersonCheck }
  TFrmUpdateSalesPersonCheck = class(TUniForm)
    Panel1: TUniPanel;
    PnlGrid: TUniPanel;
    SrcOrders: TDataSource;
    QryOrders: TFDQuery;
    IQSearch1: TIQUniGridControl;
    PkSalesPerson: TIQWebHPick;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    Button1: TUniButton;
    PnlActions: TUniPanel;
    rgActions: TUniRadioGroup;
    PMain: TUniPopupMenu;
    JumptoSalesOrder1: TUniMenuItem;
    JOrder: TIQWebJump;
    SR: TIQWebSecurityRegister;
    PnlHeader: TUniPanel;
    PnlImage: TUniPanel;
    PnlPrompt: TUniPanel;
    lblPrompt: TUniLabel;
    imgWarning: TUniImage;
    PkSalesPersonID: TBCDField;
    PkSalesPersonFIRST_NAME: TStringField;
    PkSalesPersonMIDDLE_NAME: TStringField;
    PkSalesPersonLAST_NAME: TStringField;
    QryOrdersID: TBCDField;
    QryOrdersORDERNO: TStringField;
    QryOrdersDATE_TAKEN: TDateTimeField;
    QryOrdersBILL_TO_ATTN: TStringField;
    QryOrdersSHIP_TO_ATTN: TStringField;
    QryOrdersFREIGHT: TStringField;
    procedure DoBeforeOpen(DataSet: TDataSet);
    procedure btnOkClick(Sender: TObject);
    procedure JumptoSalesOrder1Click(Sender: TObject);
    procedure PMainPopup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  strict private
    { Private declarations }
    FMode: TSalesPersonChkMode;
    FArcustoID,
      FShipToID,
      FOldSalesPersonID,
      FNewSalesPersonID,
      FOldCommissionsID,
      FNewCommissionsID: Int64;
    FNewCommissionsPercent: Real;
    procedure ReplaceSalesPerson;
    procedure ReplaceCommissionsGroup;
    procedure ClearSalesPerson;
    procedure ClearCommissionsGroup;
    procedure CheckHasCommissionPct_IndividualMode(ASalesPersonID: Int64);
    function CheckHasCommissionPct_GroupMode(ACommissionsID: Int64;
     var ASalesPersonID: Int64; var ACommissionPercent: Real): Boolean;
    procedure SetRadioGroupCaptions;
    procedure UpdateCustomerCommissionsPercent(const AArcustoID,
      ACommissionsID: Int64);
    procedure UpdateOrdersCommissionsPercent(const ASalesPeopleID: Int64;
      APercentage: Real);
    function CountSalesPeople(const ACommissionsID: Int64): Integer;
    function GetFirstSalesPeopleID(const ACommissionsID: Int64): Int64;
    function GetSalespersonName(const ASalesPersonID: Int64): string;
  private
    FSalesPersonID: Int64;
    procedure SetArcustoID(const Value: Int64);
    procedure SetSalesPersonID(const Value: Int64);
    procedure SetShipToID(const Value: Int64);
    procedure SetMode(const Value: TSalesPersonChkMode);
    procedure SetNewCommissionsID(const Value: Int64);
    procedure SetNewSalesPersonID(const Value: Int64);
    procedure SetOldCommissionsID(const Value: Int64);
    procedure SetOldSalesPersonID(const Value: Int64);
  public
    { Public declarations }
    procedure SetCaptionStubb(const AValue: string);
    property OldSalesPersonID: Int64 read FOldSalesPersonID write SetOldSalesPersonID;
    property NewSalesPersonID: Int64 read FNewSalesPersonID write SetNewSalesPersonID;
    property OldCommissionsID: Int64 read FOldCommissionsID write SetOldCommissionsID;
    property NewCommissionsID: Int64 read FNewCommissionsID write SetNewCommissionsID;
    property Mode: TSalesPersonChkMode read FMode write SetMode;
    property SalesPersonID : Int64 write SetSalesPersonID;
    property ArcustoID : Int64 write SetArcustoID;
    property ShipToID : Int64 write SetShipToID;
  end;

  /// <summary> After setting a Salesperson inactive, prompt the user to
  /// update Sales Order commissions, if any.
  /// </summary>
function CheckUpdateInactiveSalesPerson(ASalesPersonID: Int64): Boolean;

/// <summary> After changing the commissions group, prompt the user to
/// change the commissions group on Sales Orders for the current customer.
/// </summary>
function CheckMassUpdateCommissionsGroupOnOrders(AArcustoID, AShipToID, AOldCommissionsID, ANewCommissionsID: Int64): Boolean;

implementation

{$R *.dfm}


uses
  cust_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.InquireNumber,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  { TODO : IQSecIns not yet converted }
  //IQSecIns,
  IQMS.Common.PanelMsg,
  sal_comm_detail_dlg;

{$REGION 'Internal methods'}


function SalesPersonHasOrders(ASalesPersonID: Int64): Boolean;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT 1                                           '#13 +
    '  FROM ord_detail_commissions a, ord_detail b      '#13 +
    ' WHERE a.salespeople_id = %d AND                   '#13 +
    '       b.id = a.ord_detail_id AND                  '#13 +
    '       ROWNUM < 2                                  ',
    [ASalesPersonID]) = 1;
end;

function IsCommissionsGroupUsed(AArcustoID, AShipToID, ACommissionsID: Int64): Boolean;
begin
  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(       'SELECT 1                                                   ');
    SQL.Add(       '  FROM orders a, ord_detail_commissions b, ord_detail c    ');
    SQL.Add(Format(' WHERE a.arcusto_id = %d AND                               ',[AArcustoID]));
    SQL.Add(Format('       b.commissions_id = %d AND                           ',[ACommissionsID]));
    if AShipToID > 0 then
    SQL.Add(Format('       a.ship_to_id = %d AND                               ',[AShipToID]));
    SQL.Add(       '       c.id = b.ord_detail_id AND                          ');
    SQL.Add(       '       c.orders_id = a.id AND                              ');
    SQL.Add(       '       ROWNUM < 2                                          ');
    Open;
    Result := Fields[0].AsInteger = 1;
  finally
    Free;
  end;
end;

{$ENDREGION 'Internal methods'}

{$REGION 'Global wrapper methods'}


function CheckUpdateInactiveSalesPerson(ASalesPersonID: Int64): Boolean;
var
  LFrmUpdateSalesPersonCheck : TFrmUpdateSalesPersonCheck;
begin
  Result := not SalesPersonHasOrders(ASalesPersonID);
  if not Result then
  begin
    LFrmUpdateSalesPersonCheck := TFrmUpdateSalesPersonCheck.Create(UniGUIApplication.UniApplication);
    with LFrmUpdateSalesPersonCheck do
    begin
      ArcustoID := 0;
      ShipToID := 0;
      OldSalesPersonID := ASalesPersonID;
      NewSalesPersonID := 0;
      OldCommissionsID := 0;
      NewCommissionsID := 0;
      Mode := scmIndividual;
      SalesPersonID := ASalesPersonID;
      SetCaptionStubb(cust_rscstr.cTXT0000017);
      if not (QryOrders.BOF and QryOrders.EOF) then
        Result := ShowModal = mrOk
      else
        Result := True;
    end;
  end;
end;

function CheckMassUpdateCommissionsGroupOnOrders(AArcustoID, AShipToID, AOldCommissionsID, ANewCommissionsID: Int64): Boolean;
var
  LFrmUpdateSalesPersonCheck : TFrmUpdateSalesPersonCheck;
begin
  Result := IsCommissionsGroupUsed(AArcustoID, AShipToID, AOldCommissionsID);
  if Result then
  begin
    LFrmUpdateSalesPersonCheck := TFrmUpdateSalesPersonCheck.Create(UniGUIApplication.UniApplication);
    with LFrmUpdateSalesPersonCheck do
    begin
      ArcustoID := AArcustoID;
      ShipToID := AShipToID;
      OldSalesPersonID := 0;
      NewSalesPersonID := 0;
      OldCommissionsID := AOldCommissionsID;
      NewCommissionsID := ANewCommissionsID;
      Mode := scmGroup;
      SetCaptionStubb(cust_rscstr.cTXT0000021);
      if not (QryOrders.BOF and QryOrders.EOF) then
        Result := ShowModal = mrOk
      else
        Result := True;
    end;
  end;
end;

{$ENDREGION 'Global wrapper methods'}

procedure TFrmUpdateSalesPersonCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmUpdateSalesPersonCheck.FormShow(Sender: TObject);
begin
  ReOpen(QryOrders);
  { TODO : Incompatible types: 'TForm' and 'TFrmUpdateSalesPersonCheck' }
  //IQMS.Common.Controls.CenterForm(Self);
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  SetRadioGroupCaptions;
  { TODO : IQSecIns not yet converted }
  //EnsureSecurityInspectorOnTopOf(Self);
end;

function TFrmUpdateSalesPersonCheck.GetFirstSalesPeopleID(
  const ACommissionsID: Int64): Int64;
begin
  Result := SelectValueFmtAsInt64(
   'SELECT MIN(salespeople_id) AS salespeople_id        '#13 +
   '  FROM commissions_detail                           '#13 +
   ' WHERE commissions_id = %d                          ',
   [ACommissionsID]);
end;

function TFrmUpdateSalesPersonCheck.GetSalespersonName(const ASalesPersonID
  : Int64): string;
begin
  Result := SelectValueFmtAsString(
    'SELECT SUBSTRB(misc.format_name3(a.first_name,     '#13 +
    '                                 a.middle_name,    '#13 +
    '                                 a.last_name),     '#13 +
    '               1,                                  '#13 +
    '               100)                                '#13 +
    '          AS name                                  '#13 +
    '  FROM salespeople a                               '#13 +
    ' WHERE a.id = %d                                   ',
    [ASalesPersonID]);
end;

procedure TFrmUpdateSalesPersonCheck.SetArcustoID(const Value: Int64);
begin
  FArcustoID := Value;
end;

procedure TFrmUpdateSalesPersonCheck.SetCaptionStubb(const AValue: string);
var
  AName: string;
begin
  AName := '';
  if FOldSalesPersonID > 0 then
    AName := GetSalespersonName(FOldSalesPersonID)
  else if (FArcustoID > 0) and (FShipToID = 0) then
    AName := SelectValueFmtAsString(
    'SELECT company FROM arcusto WHERE id = %d',[FArcustoID])
  else if (FShipToID > 0) then
    AName := SelectValueFmtAsString(
    'SELECT attn FROM ship_to WHERE id = %d',[FShipToID]);
  if AName > '' then
    Caption := Format('%s - %s',
      [AValue, AName])
  else
    Caption := AValue;
end;

procedure TFrmUpdateSalesPersonCheck.SetMode(const Value: TSalesPersonChkMode);
begin
  FMode := Value;
end;

procedure TFrmUpdateSalesPersonCheck.SetNewCommissionsID(const Value: Int64);
begin
  FNewCommissionsID := Value;
end;

procedure TFrmUpdateSalesPersonCheck.SetNewSalesPersonID(const Value: Int64);
begin
  FNewSalesPersonID := Value;
end;

procedure TFrmUpdateSalesPersonCheck.SetOldCommissionsID(const Value: Int64);
begin
  FOldCommissionsID := Value;
end;

procedure TFrmUpdateSalesPersonCheck.SetOldSalesPersonID(const Value: Int64);
begin
  FOldSalesPersonID := Value;
end;

procedure TFrmUpdateSalesPersonCheck.SetRadioGroupCaptions;
begin
  rgActions.Items.Clear;

  // TSalesPersonChkMode = (scmIndividual, scmGroup);
  if Mode = scmIndividual then
    begin
      if FNewSalesPersonID = 0 then
        // cust_rscstr.cTXT0000064 =
        // 'Replace salesperson on Sales Orders  (you will be prompted for new salesperson)';
        rgActions.Items.Add(cust_rscstr.cTXT0000064)
      else
        // cust_rscstr.cTXT0000065 = 'Replace salesperson on Sales Orders';
        rgActions.Items.Add(cust_rscstr.cTXT0000065);

      // cust_rscstr.cTXT0000066 = 'Clear salesperson on Sales Orders';
      rgActions.Items.Add(cust_rscstr.cTXT0000066);
      // cust_rscstr.cTXT0000067 = 'Proceed with no change to Sales Orders';
      rgActions.Items.Add(cust_rscstr.cTXT0000067);
    end
  else if Mode = scmGroup then
    begin
      // cust_rscstr.cTXT0000068 = 'Replace commissions group on Sales Orders';
      rgActions.Items.Add(cust_rscstr.cTXT0000068);
      // cust_rscstr.cTXT0000069 = 'Clear commissions group on Sales Orders';
      rgActions.Items.Add(cust_rscstr.cTXT0000069);
      // cust_rscstr.cTXT0000067 = 'Proceed with no change to Sales Orders';
      rgActions.Items.Add(cust_rscstr.cTXT0000067);
    end;

  // Selected index
  rgActions.ItemIndex := 0;
end;

procedure TFrmUpdateSalesPersonCheck.SetSalesPersonID(const Value: Int64);
begin
  FSalesPersonID := Value;
end;

procedure TFrmUpdateSalesPersonCheck.SetShipToID(const Value: Int64);
begin
  FShipToID := Value;
end;

procedure TFrmUpdateSalesPersonCheck.UniFormCreate(Sender: TObject);
begin
  FNewCommissionsPercent := 0;
end;

procedure TFrmUpdateSalesPersonCheck.UpdateCustomerCommissionsPercent(
  const AArcustoID, ACommissionsID: Int64);
begin
  // Ensure the correct commisions is applied
  // See private procedure this unit, above.
  if AArcustoID > 0 then
    ExecuteCommandFmt(
      'UPDATE arcusto                             '#13 +
      '   SET comm_pcnt =                         '#13 +
      '          (SELECT SUM(commission_percent)  '#13 +
      '             FROM commissions_detail       '#13 +
      '            WHERE commissions_id = %d)     '#13 +
      ' WHERE id = %d                             ',
      [ACommissionsID, AArcustoID]);
end;

procedure TFrmUpdateSalesPersonCheck.UpdateOrdersCommissionsPercent
  (const ASalesPeopleID: Int64; APercentage: Real);
begin
  if (ASalesPeopleID > 0) then
    ExecuteCommandFmt(
      'BEGIN salespersons.update_commission_amount_for(' +
      'IQMS.SALESPERSONS.CS_SALESORDERS, %d, %.6f); END;',
      [ASalesPeopleID, APercentage]);
end;

procedure TFrmUpdateSalesPersonCheck.DoBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'SALESPEOPLE_ID', FOldSalesPersonID);
  AssignQueryParamValue(DataSet, 'COMMISSIONS_ID', FOldCommissionsID);
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', FArcustoID);
  AssignQueryParamValue(DataSet, 'SHIP_TO_ID', FShipToID);
end;

procedure TFrmUpdateSalesPersonCheck.ReplaceCommissionsGroup;
var
  hMsg: TPanelMesg;
  AUpdateCommissionPercent: Boolean;
  ASalesPersonID: Int64;
  ACommissionPercent: Real;
begin
  if (FArcustoID > 0) and (FOldCommissionsID > 0) and
    (FNewCommissionsID > 0) and
  // cust_rscstr.cTXT0000072 =
  // 'Replace the commissions group on all Sales Orders for this customer?  ' +
  // 'You will not be able to undo this action.';
    IQConfirmYN(cust_rscstr.cTXT0000072) then
    begin
      // Determine if the user wants to update the commission percent.
      // This function merely obtains the values; it does not update data.
      AUpdateCommissionPercent := CheckHasCommissionPct_GroupMode(
        FNewCommissionsID, ASalesPersonID, ACommissionPercent);
      // cust_rscstr.cTXT0000071 =
      // 'Replacing commissions group references.  Please wait.';
      hMsg := hPleaseWait(cust_rscstr.cTXT0000014);
      try
        ExecuteCommandFmt(
          'BEGIN salespersons.replace_commissions_group(' +
          'IQMS.SALESPERSONS.CS_SALESORDERS, %d, %d, %d, %d); END;',
          [FArcustoID, FOldCommissionsID, FNewCommissionsID, FShipToID]);
        // If updating the commission percent, do it here, after the
        // commissions group has been replaced.
        if AUpdateCommissionPercent then
          begin
            // Update commissions on Sales Orders for that one salesperson ID.
            // This also updates the order totals.
            UpdateOrdersCommissionsPercent(ASalesPersonID, ACommissionPercent);
            // Update the customer.
            UpdateCustomerCommissionsPercent(FArcustoID, FNewCommissionsID);
          end;
        ModalResult := mrOk;
      finally
        if Assigned(hMsg) then
          FreeAndNil(hMsg);
      end;
    end;
end;

procedure TFrmUpdateSalesPersonCheck.ReplaceSalesPerson;
var
  hMsg: TPanelMesg;
  ACount: Integer;
  ATempSalesPersonID: Int64;
begin
  // Replace the contact on Sales Orders
  if FNewSalesPersonID = 0 then
    begin
      with PkSalesPerson do
        if Execute then
          FNewSalesPersonID := System.Variants.VarAsType(GetValue('ID'), varInt64)
        else
          Exit;
    end;

  // cust_rscstr.cTXT0000015 =
  // 'Replace the salesperson on all Sales Orders?  ' +
  // 'You will not be able to undo this action.';
  if IQConfirmYN(cust_rscstr.cTXT0000015) then
    begin
      // Check and update commission percentage
      CheckHasCommissionPct_IndividualMode(FNewSalesPersonID);
      // cust_rscstr.cTXT0000014 =
      // 'Replacing salesperson references.  Please wait.';
      hMsg := hPleaseWait(cust_rscstr.cTXT0000014);
      try
        ExecuteCommandFmt(
          'BEGIN iqms.salespersons.replace_all_salespersons(' +
          'IQMS.SALESPERSONS.CS_SALESORDERS, %d, %d,%d, %d); END;',
          [FOldSalesPersonID, FNewSalesPersonID, FArcustoID, FShipToID]);
        UpdateCustomerCommissionsPercent(FArcustoID, NewCommissionsID);
        // Update the order detail commissions
        UpdateOrdersCommissionsPercent(FNewSalesPersonID,
          FNewCommissionsPercent);
        ModalResult := mrOk;
      finally
        if Assigned(hMsg) then
          FreeAndNil(hMsg);
      end;
    end;
end;

function TFrmUpdateSalesPersonCheck.CheckHasCommissionPct_GroupMode(
  ACommissionsID: Int64; var ASalesPersonID: Int64;
  var ACommissionPercent: Real): Boolean;
var
  ACount: Integer;
begin
  // Initialize
  Result := False;
  ASalesPersonID := 0;
  ACommissionPercent := 0;

  // How many Salespeople does the commissions group have?
  ACount := CountSalesPeople(ACommissionsID);

  // If the count is exactly 1, then proceed.  If group has more than one
  // person, do nothing.
  if ACount = 1 then
    begin
      // Get the salesperson ID in that group
      ASalesPersonID := GetFirstSalesPeopleID(ACommissionsID);

      // If there is no salesperson in the group, exit early.  This would never
      // happen.
      if ASalesPersonID = 0 then
        Exit(False);

      // If the group has just one person, what is the commission?
      ACommissionPercent := SelectValueFmtAsFloat(
        'SELECT commission_percent                        '#13 +
        '  FROM commissions_detail                        '#13 +
        ' WHERE commissions_id = %d AND                   '#13 +
        '       salespeople_id = %d                       ',
        [ACommissionsID, ASalesPersonID]);

      //  If the commission is zero, ask for commission percent:
      // cust_rscstr.cTXT0000018 = 'Commission Percentage';
      // cust_rscstr.cTXT0000019 = 'Please enter a commission percentage:';
      Result := (ACommissionPercent = 0) and
        IQMS.Common.InquireNumber.IQInputFloatEx(cust_rscstr.cTXT0000018,
        cust_rscstr.cTXT0000019, 0, 100, ACommissionPercent);
    end;
end;

procedure TFrmUpdateSalesPersonCheck.CheckHasCommissionPct_IndividualMode
  (ASalesPersonID: Int64);
begin
  FNewCommissionsPercent := SelectValueFmtAsFloat(
    'SELECT commission_percent FROM salespeople WHERE id = %d',
    [ASalesPersonID]);
  // cust_rscstr.cTXT0000018 = 'Commission Percentage';
  // cust_rscstr.cTXT0000019 = 'Please enter a commission percentage:';
  if (SelectValueFmtAsInteger(
    'SELECT 1                                     '#13 +
    '  FROM salespeople                           '#13 +
    ' WHERE id = %d AND                           '#13 +
    '       NVL(commission_percent, 0) = 0        ',
    [ASalesPersonID]) = 1) and
    IQMS.Common.InquireNumber.IQInputFloatEx(cust_rscstr.cTXT0000018,
    cust_rscstr.cTXT0000019, 0, 100, FNewCommissionsPercent) then
    begin
      // Update the commissions detail
      ExecuteCommandFmt(
        'UPDATE commissions_detail                '#13 +
        '   SET commission_percent = %.6f         '#13 +
        ' WHERE salespeople_id = %d               ',
        [FNewCommissionsPercent, ASalesPersonID]);
      // Per Nancy, some customers do not want the percentage updated
      // on the Sales Person record because they apply the percentage
      // from the commissions group.  So, only update the value in
      // Salesperson(s) if the value is not null; meaning, it has a
      // value because that is how the customer is using it.
      ExecuteCommandFmt(
        'UPDATE salespeople                       '#13 +
        '   SET commission_percent = %.6f         '#13 +
        ' WHERE id = %d AND                       '#13 +
        '       NVL(commission_percent, 0) > 0    ',
        [FNewCommissionsPercent, ASalesPersonID]);
    end;
end;

procedure TFrmUpdateSalesPersonCheck.ClearCommissionsGroup;
var
  hMsg: TPanelMesg;
begin
  // Clear the contact on Sales Orders
  // cust_rscstr.cTXT0000070 =
  // 'The commissions group will be cleared on all Sales Orders ' +
  // 'that are assigned to this contact.  You will not be able to undo ' +
  // 'this action.  Do you want to continue?';
  if IQConfirmYN(cust_rscstr.cTXT0000070) then
    begin
      hMsg := hPleaseWait('');
      try
        ExecuteCommandFmt(
          'BEGIN iqms.salespersons.clear_all_commissions_group(' +
          'IQMS.SALESPERSONS.CS_SALESORDERS, %d, %d, %d); END;',
          [FOldCommissionsID, FArcustoID, FShipToID]);
        ModalResult := mrOk;
      finally
        if Assigned(hMsg) then
          FreeAndNil(hMsg);
      end;
    end;
end;

procedure TFrmUpdateSalesPersonCheck.ClearSalesPerson;
var
  hMsg: TPanelMesg;
begin
  // Clear the contact on Sales Orders
  // cust_rscstr.cTXT0000013 =
  // 'The salesperson will be cleared on all Sales Orders ' +
  // 'that are assigned to this salesperson.  You will not be able to undo ' +
  // 'this action.  Do you want to continue?';
  if IQConfirmYN(cust_rscstr.cTXT0000003) then
    begin
      hMsg := hPleaseWait('');
      try
        ExecuteCommandFmt(
          'BEGIN iqms.salespersons.clear_all_salespersons(' +
          'IQMS.SALESPERSONS.CS_SALESORDERS, %d, %d, %d); END;',
          [FOldSalesPersonID, FArcustoID, FShipToID]);
        ModalResult := mrOk;
      finally
        if Assigned(hMsg) then
          FreeAndNil(hMsg);
      end;
    end;
end;

function TFrmUpdateSalesPersonCheck.CountSalesPeople(
  const ACommissionsID: Int64): Integer;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT COUNT( * ) FROM commissions_detail WHERE commissions_id = %d',
    [ACommissionsID]);
end;

procedure TFrmUpdateSalesPersonCheck.btnOkClick(Sender: TObject);
begin
  // TSalesPersonChkMode = (scmIndividual, scmGroup);
  case rgActions.ItemIndex of
    0:
      if Mode = scmIndividual then
        ReplaceSalesPerson
      else if Mode = scmGroup then
        ReplaceCommissionsGroup;
    1:
      if Mode = scmIndividual then
        ClearSalesPerson
      else if Mode = scmGroup then
        ClearCommissionsGroup;
    2:
      ModalResult := mrOk;
  end;
end;

procedure TFrmUpdateSalesPersonCheck.JumptoSalesOrder1Click(Sender: TObject);
begin
  if QryOrdersID.AsLargeInt > 0 then
    JOrder.Execute;
end;

procedure TFrmUpdateSalesPersonCheck.PMainPopup(Sender: TObject);
begin
  JumptoSalesOrder1.Enabled := (QryOrdersID.AsLargeInt > 0) and
    SR.Enabled['JumptoSalesOrder1'];
end;

end.
