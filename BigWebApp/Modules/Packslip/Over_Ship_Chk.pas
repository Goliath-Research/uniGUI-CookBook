unit Over_Ship_Chk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  System.Variants,
  PS_Share,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Vcl.Menus,
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
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel, IQUniGrid, uniGUIFrame;


type
  TFrmOverShipCheck = class(TUniForm)
    wwDataSource1: TDataSource;
    QryRel: TFDQuery;
    QryRelQUAN: TBCDField;
    QryRelQTY_LEFT_ONORDER: TFMTBCDField;
    QryRelRELEASES_ID: TBCDField;
    SR: TIQWebSecurityRegister;
    QryRelSHIPPED_QUAN: TBCDField;
    QryRelSEQ: TBCDField;
    PopupMenu1: TUniPopupMenu;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PnlMain: TUniPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    PnlSelectActionGroup: TUniPanel;
    GroupBox3: TUniGroupBox;
    rbtnChangeRelease: TUniRadioButton;
    rbtnAddReleases: TUniRadioButton;
    PnlPORelease: TUniPanel;
    GroupBox1: TUniGroupBox;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label7: TUniLabel;
    Label4: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    edRelQty: TUniEdit;
    edRelCum: TUniEdit;
    edRecvCumBefore: TUniEdit;
    edRecvQty: TUniEdit;
    edRecvRoom: TUniEdit;
    edExceed: TUniEdit;
    Panel2: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    btnCancel: TUniButton;
    QryRelORDERNO: TStringField;
    QryRelITEMNO: TStringField;
    QryRelORD_DET_SEQNO: TBCDField;
    Label3: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    lblOrderno: TUniLabel;
    lblItemno: TUniLabel;
    lblOrdDtlSeqno: TUniLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { TODO : TGridDrawState not yet converted }
    {procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);   }
    procedure FormShow(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
    FExceeded_Releases_ID: Real;
    FShip_To_ID: Real;
    FDefault_Ship_To_ID: Real;
    FOrd_Detail_ID: Real;
    FIs_Special_RAN_Match: Boolean;
    FCum_Qty_Shipped: Real;
    FShipment_Dtl_ID: Real;
    procedure PopulateControls(AShipment_Dtl_ID, AExceeded_Releases_ID,
      ACum_Qty_Shipped: Real);
    function GetCumQuan(AReleases_ID: Real): Real;
    procedure SetCum_Qty_Shipped(const Value: Real);
    procedure SetExceeded_Releases_ID(const Value: Real);
    procedure SetShipment_Dtl_ID(const Value: Real);
  public
    { Public declarations }
    property Shipment_Dtl_ID : Real write SetShipment_Dtl_ID;
    property Exceeded_Releases_ID : Real write SetExceeded_Releases_ID;
    property Cum_Qty_Shipped : Real write SetCum_Qty_Shipped;
    class procedure Execute(AShipment_Dtl_ID: Real;
      var AExceeded_Releases_ID, ACum_Qty_Shipped: Real;
      var AFix_Release_Exceeded: TFixOrdExceeded);
    class function IsExceeding(AShipment_Dtl_ID: Real;
      var AExceeded_Releases_ID, ACum_Qty_Shipped: Real): Boolean;
  end;

implementation

{$R *.DFM}


uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  { TODO : IQSecIns not yet converted }
 // IQSecIns,
  packslip_rscstr,
  PSTkPara;

class function TFrmOverShipCheck.IsExceeding(AShipment_Dtl_ID: Real;
  var AExceeded_Releases_ID, ACum_Qty_Shipped: Real): Boolean;
begin
  if IsOutsourceShipOrder(AShipment_Dtl_ID) then {ps_share.pas}
  begin
    Result := False;
    Exit;
  end;

  {Execute Stored Proc to determine if PO Release is exceeded}
  with TFDStoredProc.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      StoredProcName := 'IQMS.SHIP_MISC.SHIPMENT_EXCEEDS_RELEASE';
      Prepare;
      ParamByName('v_shipment_dtl_id').Value := Trunc(AShipment_Dtl_ID);
      ExecFunc;
      Result := ParamByName('Result').AsInteger = 1;
      AExceeded_Releases_ID := ParamByName('v_releases_id').AsLargeInt;
      ACum_Qty_Shipped := ParamByName('v_cum_shipped').AsLargeInt;
    finally
      Free;
    end;
end;

class procedure TFrmOverShipCheck.Execute(AShipment_Dtl_ID: Real;
  var AExceeded_Releases_ID, ACum_Qty_Shipped: Real;
  var AFix_Release_Exceeded: TFixOrdExceeded);
var
  S: string;
  AKeep_Releases_Separate: Boolean;
  LFrmOverShipCheck : TFrmOverShipCheck;
begin
  AFix_Release_Exceeded := foeNone;

  // Check arcusto based PS Preserve RAN - Feb-17-05
  if SelectValueFmtAsString(
    'select a.ps_preserve_ran from c_ship_hist s, arcusto a ' +
    'where s.shipment_dtl_id = %f and s.arcusto_id = a.id',
    [AShipment_Dtl_ID]) = 'Y' then
    Exit;

  // Check
  if not TFrmOverShipCheck.IsExceeding(AShipment_Dtl_ID, AExceeded_Releases_ID,
    ACum_Qty_Shipped) then
    Exit;

  // IQRF support Jan-21-2003
  if IsConsole then
  begin
    // 08-07-2009 in case of ICT - increase the release. MPC
    if SelectValueFmtAsInteger(
      'select 1 from shipment_dtl s, ord_detail d ' +
      'where s.id = %f and s.order_dtl_id = d.id and ' +
      'ship_to_id_from is not null',
      [AShipment_Dtl_ID]) = 1 then
    begin
      AFix_Release_Exceeded := foeIncRelease;
      Exit;
    end;

    // 08-08-2013 EIQ-760: RF and WMSIQ - when over shipping SIC item
    // add to existing Sales Order release CRM # 832881 Rives
    if SelectValueFmtAsString(
      'select a.is_linked_to_serial from c_ship_hist c, arinvt a ' +
      'where c.shipment_dtl_id = %f and c.arinvt_id = a.id',
      [AShipment_Dtl_ID]) = 'Y' then
    begin
      AFix_Release_Exceeded := foeIncRelease;
      Exit;
    end;

    S := UpperCase(SelectValueFmtAsString
      ('select NVL(pk_tkt_keep_rel_separate, ''D'') ' +
      '  from ship_to, shipments s, shipment_dtl d ' +
      ' where d.id = %f                            ' +
      '   and d.shipments_id = s.id                ' +
      '   and s.ship_to_id = ship_to.id            ',
      [AShipment_Dtl_ID]));
    if (S = 'Y') or (S = 'N') then
      AKeep_Releases_Separate := (S = 'Y')
    else
      AKeep_Releases_Separate := GetPK_TKT_KEEP_REL_SEPARATE; {PSTkPara.pas}

    if AKeep_Releases_Separate then
      AFix_Release_Exceeded := foeSplitShipment;

    Exit;
  end;

  {Exceeds - Create form}
  LFrmOverShipCheck := TFrmOverShipCheck.Create(UniGUIApplication.UniApplication);
  with LFrmOverShipCheck do
  begin
    Shipment_Dtl_ID := AShipment_Dtl_ID;
    Exceeded_Releases_ID := AExceeded_Releases_ID;
    Cum_Qty_Shipped := ACum_Qty_Shipped;
      if ShowModal = mrOK then
        AFix_Release_Exceeded := IIf(
          rbtnChangeRelease.Checked,
          foeIncRelease,
          IIf(rbtnAddReleases.Checked, foeSplitShipment, foeNone))
      else
        AFix_Release_Exceeded := foeCancel;
    end;
end;

procedure TFrmOverShipCheck.FormShow(Sender: TObject);
var
  AData: Variant;
begin
   AData := SelectValueArrayFmt(
    'select d.order_dtl_id, s.ship_to_id from shipment_dtl d, shipments s ' +
    ' where d.id = %f and d.shipments_id = s.id',
    [FShipment_Dtl_ID]);
  IQAssert(
    VarArrayDimCount(AData) > 0,
    Format('Invalid shipment_dtl_id = %.0f',
    [FShipment_Dtl_ID]));

  FOrd_Detail_ID := System.Variants.VarAsType(AData[0], varUInt64);
  FShip_To_ID := System.Variants.VarAsType(AData[1], varUInt64);
  FDefault_Ship_To_ID := SelectValueFmtAsFloat(
    'select o.ship_to_id from orders o, ord_detail d where d.id = %f and d.orders_id = o.id',
    [FOrd_Detail_ID]);

  with QryRel do
  begin
    Close;
    ParamByName('ord_detail_id').Value := FOrd_Detail_ID;
    ParamByName('ship_to_id').Value := FShip_To_ID;
    ParamByName('default_ship_to_id').Value := FDefault_Ship_To_ID;
    Open;
    Locate(
      'releases_id',
      FExceeded_Releases_ID,
      []);
  end;

  FIs_Special_RAN_Match := SelectValueFmtAsString(
    'select NVL(ship_to.match_release_based_on_ran, ''N'') ' +
    'from ship_to where id = %f',
    [FShip_To_ID]) = 'Y';

  PopulateControls(
    FShipment_Dtl_ID,
    FExceeded_Releases_ID,
    FCum_Qty_Shipped);

  IQRegFormRead(self, [self]);
  { TODO : IQSecIns not yet converted }
  //EnsureSecurityInspectorOnTopOf(self);
  with QryRel do
  begin
    lblOrderno.Caption:= FieldByName('ORDERNO').asString;
    lblItemno.Caption := FieldByName('ITEMNO').asString;
    lblOrdDtlSeqno.Caption := FieldByName('ORD_DET_SEQNO').asString;
  end;
end;

procedure TFrmOverShipCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

function TFrmOverShipCheck.GetCumQuan(AReleases_ID: Real): Real;
var
  APromise_Date: TDateTime;
begin
  Result := 0;
  APromise_Date := SelectValueByID(
    'promise_date',
    'releases',
    AReleases_ID);

  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('select quan, id');
      SQL.Add('  from releases');
      SQL.Add(Format(' where ord_detail_id = %f and',
        [FOrd_Detail_ID]));
      SQL.Add(Format('       NVL(ship_to_id, %f) = %f and',
        [FDefault_Ship_To_ID, FShip_To_ID]));
      SQL.Add(Format('       promise_date <= to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'')',
        [FormatDateTime('mm/dd/yyyy hh:nn:ss', APromise_Date)]));

      if FIs_Special_RAN_Match then
        SQL.Add(IQFormat('and id = %f', [AReleases_ID]));

      SQL.Add(' order by promise_date, id');

      Open;
      while not Eof do
      begin
        Result := Result + FieldByName('quan').asFloat;
        if FieldByName('id').AsLargeInt = Trunc(AReleases_ID) then
          BREAK;
        Next;
      end;
    finally
      Free;
    end;
end;

procedure TFrmOverShipCheck.PopulateControls(AShipment_Dtl_ID,
  AExceeded_Releases_ID, ACum_Qty_Shipped: Real);
var
  A, B: Variant;
begin
  // packslip_rscstr.cTXT0000170 = 'Release # %d';
  GroupBox1.Caption := Format(
    packslip_rscstr.cTXT0000170,
    [SelectValueFmtAsInteger(
      'select seq from releases where id = %.0f',
      [AExceeded_Releases_ID])]);

  edRelQty.Text := SelectValueByID(
    'quan',
    'releases',
    AExceeded_Releases_ID);
  edRelCum.Text := FloatToStr(GetCumQuan(AExceeded_Releases_ID));

  B := SelectValueArrayFmt(
    'select qtyshipped, qtyshipped + %f from shipment_dtl where id = %f',
    [ACum_Qty_Shipped, AShipment_Dtl_ID]);
  if VarArrayDimCount(B) > 0 then
  begin
    edRecvCumBefore.Text := FloatToStr(ACum_Qty_Shipped);
    edRecvRoom.Text :=
      FloatToStr(fMax(0, StrToFloat(edRelCum.Text) - ACum_Qty_Shipped));
    edRecvQty.Text := B[0];
    edExceed.Text := FloatToStr(B[1] - StrToFloat(edRelCum.Text));
  end;

  if FIs_Special_RAN_Match then
  begin
    rbtnAddReleases.Checked := False;
    rbtnAddReleases.Enabled := False;
  end;

  if FExceeded_Releases_ID = 0 then
  begin
    rbtnChangeRelease.Checked := False;
    rbtnChangeRelease.Enabled := False;
    rbtnAddReleases.Checked := False;
    rbtnAddReleases.Enabled := False;
  end;
end;

procedure TFrmOverShipCheck.SetCum_Qty_Shipped(const Value: Real);
begin
  FCum_Qty_Shipped := Value;
end;

procedure TFrmOverShipCheck.SetExceeded_Releases_ID(const Value: Real);
begin
  FExceeded_Releases_ID := Value;
end;

procedure TFrmOverShipCheck.SetShipment_Dtl_ID(const Value: Real);
begin
  FShipment_Dtl_ID := Value;
end;

{ TODO : TGridDrawState not yet converted }
{procedure TFrmOverShipCheck.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not Highlight then
    with QryRel do
    begin
      if FieldByName('releases_id').AsLargeInt = 0 then
      begin
        ABrush.Color := clPurple;
        AFont.Color := clWhite;
      end
      else if (FieldByName('Quan').asFloat > 0) and
        (FieldByName('Qty_Left_Onorder').AsFloat = 0) then
      begin
        ABrush.Color := clLime;
        AFont.Color := clBlack;
      end
      else if (FieldByName('Qty_Left_Onorder').AsFloat < FieldByName('Quan')
        .AsFloat) and (FieldByName('Qty_Left_Onorder').AsFloat > 0) then
      begin
        ABrush.Color := clYellow;
        AFont.Color := clBlack;
      end
      else
      begin
        ABrush.Color := clPurple;
        AFont.Color := clWhite;
      end;
    end;

  if QryRelRELEASES_ID.AsFloat = FExceeded_Releases_ID then
    AFont.Style := AFont.Style + [fsBold];
end;   }

procedure TFrmOverShipCheck.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

end.
