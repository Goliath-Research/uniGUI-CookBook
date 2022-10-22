unit BolPkShip;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  System.Variants,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  Data.DB,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniCheckBox,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl, uniDateTimePicker, uniDBDateTimePicker, IQUniGrid, uniGUIFrame;

type
  TFrmBOLPkShip = class(TUniForm)
    pnlLeft01: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    srchPS: TIQUniGridControl;
    GroupBox1: TUniGroupBox;
    wwDate1: TUniDBDateTimePicker;
    wwDate2: TUniDBDateTimePicker;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Bevel1: TUniPanel;
    sbtnApplyDate: TUniSpeedButton;
    SrcShipTo: TDataSource;
    QryShipTo: TFDQuery;
    QryShipToSHIP_TO_ID: TFMTBCDField;
    QryShipToSHIP_TO_ATTN: TStringField;
    QryShipToSHIP_TO_ADDR1: TStringField;
    QryShipToSHIP_TO_CITY: TStringField;
    QryShipToSHIP_TO_STATE: TStringField;
    QryShipToSHIP_TO_COUNTRY: TStringField;
    QryShipToSHIP_TO_ZIP: TStringField;
    SrcShipments: TDataSource;
    QryShipments: TFDQuery;
    QryShipTodate1: TDateTimeField;
    QryShipTodate2: TDateTimeField;
    QryShipmentsID: TBCDField;
    QryShipmentsPACKSLIPNO: TStringField;
    QryShipmentsSHIP_TO_ATTN: TStringField;
    QryShipmentsARCUSTO_COMPANY: TStringField;
    QryShipmentsARCUSTO_ADDR1: TStringField;
    QryShipmentsARCUSTO_CITY: TStringField;
    QryShipmentsARCUSTO_STATE: TStringField;
    QryShipmentsARCUSTO_ZIP: TStringField;
    QryShipmentsSHIPDATE: TDateTimeField;
    QryShipmentsPS_DATE: TDateTimeField;
    QryShipmentsSTATUS: TStringField;
    QryShipmentsEPLANT_ID: TBCDField;
    QryShipmentsARCHIVED: TStringField;
    Panel1: TUniPanel;
    Label2: TUniLabel;
    QryShipmentsPS_TICKET_ID: TBCDField;
    QryShipmentsFREIGHT_ID: TBCDField;
    QryShipmentsSHIP_VIA: TStringField;
    PageControl1: TUniPageControl;
    TabShipTo: TUniTabSheet;
    TabCustomer: TUniTabSheet;
    IQSearch1: TIQUniGridControl;
    SrcArcusto: TDataSource;
    QryArcusto: TFDQuery;
    QryArcustoID: TBCDField;
    QryArcustoCUSTNO: TStringField;
    QryArcustoCOMPANY: TStringField;
    QryArcustoADDR1: TStringField;
    QryArcustoCITY: TStringField;
    QryArcustoSTATE: TStringField;
    QryArcustoCOUNTRY: TStringField;
    QryArcustoZIP: TStringField;
    IQSearch2: TIQUniGridControl;
    QryArcustoPICKED_BY_ARCUSTO_ID: TBCDField;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    QryShipmentsPS_TICKET_BATCH: TBCDField;
    Panel5: TUniPanel;
    chkMultiSelect: TUniCheckBox;
    QryArcustodate1: TDateTimeField;
    QryArcustodate2: TDateTimeField;
    QryShipToPicked_By_Arcusto_ID: TBCDField;
    QryArcustoShip_To_ID: TFMTBCDField;
    procedure QryShipToBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnApplyDateClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure QryShipToCalcFields(DataSet: TDataSet);
    procedure chkMultiSelectClick(Sender: TObject);
    procedure QryArcustoBeforeOpen(DataSet: TDataSet);
    procedure QryArcustoCalcFields(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FShip_To_ID: Real;
    FPicked_By_Arcusto_ID: Real;
    FFilterDivision_ID: Real;
    FBol_ID: Real;

    procedure Validate;
    procedure IQNotify(var Msg: TMessage); message iq_Notify;
    procedure RefreshDataSets;
    procedure SetBol_ID(const Value: Real);
    procedure SetFilterDivision_ID(const Value: Real);
    procedure SetPicked_By_Arcusto_ID(const Value: Real);
  public
    { Public declarations }
    procedure AssignShipmentsTo(AList: TStringList);
    function CheckGetPicked_By_Arcusto_ID: Real;
    property Bol_ID: Real write SetBol_ID;
    property Picked_By_Arcusto_ID: Real write SetPicked_By_Arcusto_ID;
    property FilterDivision_ID: Real write SetFilterDivision_ID;
  end;

function DoBolPickShip(AShipments: TStringList; ABol_ID: Real;
  var APicked_By_Arcusto_ID: Real; AFilterDivision_ID: Real): Boolean;



implementation

{$R *.DFM}


uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  packslip_rscstr;

function DoBolPickShip(AShipments: TStringList; ABol_ID: Real;
  var APicked_By_Arcusto_ID: Real; AFilterDivision_ID: Real): Boolean;
var
  FrmBOLPkShip: TFrmBOLPkShip;
begin
  FrmBOLPkShip := TFrmBOLPkShip.Create(uniGUIApplication.UniApplication);
  with FrmBOLPkShip do
  begin
    try
      Bol_ID := ABol_ID;
      Picked_By_Arcusto_ID := APicked_By_Arcusto_ID;
      FilterDivision_ID := AFilterDivision_ID;
      Result := ShowModal = mrOK;
      if Result then
      begin
        AssignShipmentsTo(AShipments);
        APicked_By_Arcusto_ID := CheckGetPicked_By_Arcusto_ID;
      end;
    finally
      //Release;
    end;
  end;
end;

{ TFrmBOLPkShip }

procedure TFrmBOLPkShip.FormShow(Sender: TObject);
var
  A: Variant;
begin
  IQSetTablesActive(False, self);

  wwDate2.DateTime := SelectValueAsFloat('select sysdate from dual');
  { TODO -oSanketG -cWC : Need to find alternative for Time in TUniDBDateTimePicker }
  //wwDate2.Time := 1 - 1 / 86400;
  wwDate1.DateTime := wwDate2.DateTime - 1;

  A := SelectValueArrayFmt(
    'select ship_to_id, ship_to_attn from bol where id = %f', [FBol_ID]);
  if (VarArrayDimCount(A) > 0) and (A[0] > 0) then
  begin
    FShip_To_ID := System.Variants.VarAsType(A[0], varUInt64);

    // packslip_rscstr.cTXT0000122 =
    // 'BOL Packing Slips Picklist (Ship To: %s)';
    Caption := Format(packslip_rscstr.cTXT0000122,
    [System.Variants.VarToStr(A[1])]);
  end;

  PageControl1.ActivePageIndex := 0;

  // Show "By Ship_To" tab only if we never selected "By Customer" before
  TabShipTo.TabVisible := FPicked_By_Arcusto_ID = 0;

  // Show "By Customer" only if we never selected "By Ship-To" before
  TabCustomer.TabVisible := (FPicked_By_Arcusto_ID > 0)
    or
    (FPicked_By_Arcusto_ID = 0) and
    (SelectValueFmtAsInteger(
    'select count(*) from shipments where bol_id = %f',
    [FBol_ID]) = 0);

  //PostMessage(Handle, iq_Notify, 0, 0); { Launch Query }
  IQRegFormRead(self, [self, pnlLeft01]);
end;

procedure TFrmBOLPkShip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl}
  //IQRegFormWrite(self, [self, srchPS.wwDBGrid, pnlLeft01]);
end;

function TFrmBOLPkShip.CheckGetPicked_By_Arcusto_ID: Real;
begin
  if PageControl1.ActivePage = TabCustomer then
    Result := QryArcustoID.AsFloat
  else
    Result := 0;
end;

procedure TFrmBOLPkShip.QryShipToBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'date1', wwDate1.DateTime);
  AssignQueryParamValue(DataSet, 'date2', wwDate2.DateTime);
  AssignQueryParamValue(DataSet, 'ship_to_id', Trunc(FShip_To_ID));
  AssignQueryParamValue(DataSet, 'filter_division_id', Trunc(FFilterDivision_ID));
end;

procedure TFrmBOLPkShip.sbtnApplyDateClick(Sender: TObject);
begin
  // packslip_rscstr.cTXT0000121 = 'Invalid date range';
  IQAssert(wwDate1.DateTime <= wwDate2.DateTime, packslip_rscstr.cTXT0000121);
  RefreshDataSets;
  { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl }
  //IQRegFormRead(self, [srchPS.wwDBGrid]);
end;

procedure TFrmBOLPkShip.SetBol_ID(const Value: Real);
begin
  FBol_ID := Value;
end;

procedure TFrmBOLPkShip.SetFilterDivision_ID(const Value: Real);
begin
  FFilterDivision_ID := Value;
end;

procedure TFrmBOLPkShip.SetPicked_By_Arcusto_ID(const Value: Real);
begin
  FPicked_By_Arcusto_ID := Value;
end;

procedure TFrmBOLPkShip.QryShipToCalcFields(DataSet: TDataSet);
begin
  QryShipTodate1.AsDateTime := wwDate1.DateTime;
  QryShipTodate2.AsDateTime := wwDate2.DateTime;
  // this is for child query QryShipments - just keep it tidy
  QryShipToPicked_By_Arcusto_ID.AsLargeInt := 0;
end;

procedure TFrmBOLPkShip.QryArcustoCalcFields(DataSet: TDataSet);
begin
  QryArcustodate1.AsDateTime := wwDate1.DateTime;
  QryArcustodate2.AsDateTime := wwDate2.DateTime;
  // this is for child query QryShipments - just keep it tidy
  QryArcustoShip_To_ID.AsLargeInt := 0;
end;

procedure TFrmBOLPkShip.chkMultiSelectClick(Sender: TObject);
begin
  { TODO -oSanketG -cWC : Need to find alternative for Options, wwDBGrid in TIQUniGridControl }
  {if chkMultiSelect.Checked then
    srchPS.Options := srchPS.Options + [dgMultiSelect]
  else
  begin
    srchPS.Options := srchPS.Options - [dgMultiSelect];
    srchPS.wwDBGrid.UnselectAll;
  end;}
end;

procedure TFrmBOLPkShip.IQNotify(var Msg: TMessage);
begin
  sbtnApplyDate.Click;
end;

procedure TFrmBOLPkShip.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult := mrOK;
end;

procedure TFrmBOLPkShip.Validate;
begin
  if PageControl1.ActivePage = TabShipTo then
    if (QryShipTo.State <> dsBrowse) or (QryShipTo.Eof and QryShipTo.Bof) then
      // packslip_rscstr.cTXT0000123 =
      // 'Please select a shipping address.';
      raise Exception.Create(packslip_rscstr.cTXT0000123);

  if (QryShipments.Eof and QryShipments.Bof) then
    // packslip_rscstr.cTXT0000124 = 'No shipments found';
    raise Exception.Create(packslip_rscstr.cTXT0000124);
end;

procedure TFrmBOLPkShip.AssignShipmentsTo(AList: TStringList);
var
  I: Integer;
begin
  AList.Clear;
  { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl }
  {with srchPS.wwDBGrid, QryShipments do
    try
      DisableControls;

      case chkMultiSelect.Checked of
        False:
          begin
            First;
            while not Eof do
            begin
              AList.Add(QryShipmentsID.AsString);
              Next;
            end
          end;
        True:
          if SelectedList.Count > 0 then
          begin
            for I := 0 to SelectedList.Count - 1 do
            begin
              GotoBookmark(SelectedList.Items[I]);
              AList.Add(QryShipmentsID.AsString);
              FreeBookmark(SelectedList.Items[I])
            end;
            SelectedList.Clear;
          end
          else
            AList.Add(QryShipmentsID.AsString);
      end;
    finally
      EnableControls;
    end;}
end;

procedure TFrmBOLPkShip.QryArcustoBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arcusto_id',
    Trunc(FPicked_By_Arcusto_ID));
end;

procedure TFrmBOLPkShip.PageControl1Change(Sender: TObject);
begin
  RefreshDataSets;
end;

procedure TFrmBOLPkShip.RefreshDataSets;
begin
  if PageControl1.ActivePage = TabCustomer then
    QryShipments.DataSource := SrcArcusto
  else
    QryShipments.DataSource := SrcShipTo;

  Reopen(QryShipments.DataSource.DataSet);
  Reopen(QryShipments);
end;

end.
