unit IQMS.PrintLabels.LMPack;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.PrintLabels.LMManu,
  Mask,
  Vcl.Buttons,
  IQMS.WebVcl.About,
  IQMS.Common.JumpConstants,
  Data.DB,
  Spring.Services,
  Spring.Collections,
  IQWeb.Server.DataServices,
  PickListDlg,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UserDefinedLabel,
  Vcl.Controls,
  IQMS.WebVcl.UDComboBox,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniLabel, uniMainMenu, uniSplitter, uniScrollBox, IQUniGrid, uniGUIFrame,
  uniDBNavigator, uniComboBox, uniDBComboBox, uniDateTimePicker,
  uniDBDateTimePicker, uniMultiItem, uniDBLookupComboBox, uniPageControl,
  uniPanel;

type
  TFrmLM_Pack = class(TFrmLM_Manu)
    Label4: TUniLabel;
    EditOrder: TUniEdit;
    EditPoNo: TUniEdit;
    Label2: TUniLabel;
    IQAbout1: TIQWebAbout;
    spSearchLots: TUniSpeedButton;
    procedure BtnOkClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure DefineLabelText1Click(Sender: TObject);
    procedure sbtnPickLabelClick(Sender: TObject);
    procedure EditBoxExit(Sender: TObject);
    procedure PkLotBeforeOpen(DataSet: TDataSet);
    procedure spSearchLotsClick(Sender: TObject);
  private
    { Private declarations }
    FShipmentDtlId_For_Display:Real;
    procedure CheckVerifyTotalQtyAgainstBoxQty;

 protected
    FShowPK :Boolean;
    FValidateQuantityAgainstBoxQuantity: Boolean;

    procedure AssignDefaults;override;
    procedure AssignCustomerLookupParams; override;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; ID:Real ); override;
    constructor CreateEx(AOwner:TComponent; ID:Real; ASkipMfgExistsValidation: Boolean );
    constructor PackCreate(AOwner:TComponent; ID:Real);
    constructor PackCreateEx(AOwner:TComponent; ID:Real; ASkipMfgExistsValidation: Boolean );  virtual;
    class function get_ord_detail_uom_factor( AOrd_Detail_ID: Real ): Real;
  end;

//procedure DoPrintLMPackMaterial(ArinvtId, ALMLabelsID, AStandardID, AOrdersID, AQty, ALblQty:Real; ALotNo:String);
procedure DoLabelFromPsMain( ArinvtId,
                             AordersId:Real;
                             AShipmentDtlId:Real = 0;
                             AShipQty: Real = 0;
                             APk_Ticket_Dtl_ID: Real = 0;
                             AShipments_ID: Real = 0;
                             AOrd_Detail_ID: Real = 0;
                             AShipmentDtlId_For_Display:Real = 0);


function DoLabelFromShipman( ArinvtId,
                             AordersId:Real;
                             AShipmentDtlId:Real = 0;
                             AShipQty: Real = 0;
                             APk_Ticket_Dtl_ID: Real = 0;
                             AShipments_ID: Real = 0;
                             AOrd_Detail_ID: Real = 0;
                             ABoxno: Integer = 1;
                             APrinterName: String = ''): Real ;

var
  FrmLM_Pack: TFrmLM_Pack;

implementation
{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.PrintLabels.LabelMatrix,
  IQMS.PrintLabels.LMChkBoxQty,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  System.Math,
  System.Variants,
  IQMS.WebVcl.ResourceStrings;


class function TFrmLM_Pack.get_ord_detail_uom_factor( AOrd_Detail_ID: Real ): Real;
var
  A: Variant;
begin
  Result:= 1;
  try
    if AOrd_Detail_ID = 0 then EXIT;

    A:= SelectValueArrayFmt( 'select NVL(uom_factor,1) from ord_detail where id = %f', [ AOrd_Detail_ID ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      Result:= A[ 0 ];
      EXIT;
    end;

    A:= SelectValueArrayFmt( 'select NVL(uom_factor,1) from hist_ord_detail where id = %f', [ AOrd_Detail_ID ]);
    if VarArrayDimCount( A ) > 0 then
       Result:= A[ 0 ];

  finally
    if Result <= 0 then Result:= 1;
  end;
end;

procedure DoLabelFromPsMain( ArinvtId,
                             AordersId:Real;
                             AShipmentDtlId:Real = 0;
                             AShipQty: Real = 0;
                             APk_Ticket_Dtl_ID: Real = 0;
                             AShipments_ID: Real = 0;
                             AOrd_Detail_ID: Real = 0;
                             AShipmentDtlId_For_Display:Real = 0);

var
  ALMPack:TIQWebLMPackSlip;
  A:Variant;
  AStandardId:Real;
  AOnDataChange: TDataChangeEvent;
  N: Real;
begin
  try
    ALMPack := TIQWebLMPackSlip.Create(Application);
    ALMPack.FHistOrddetailId := SelectValueFmtAsFloat('select id from hist_orders where id = %f', [AordersId]);
    ALMPack.FShipmentDtlId   := AShipmentDtlId;
    ALMPack.Arinvt_ID  := ArinvtId;
    ALMPack.Orders_id  := AOrdersID;


    {04-16-2009 if AOrd_Detail_ID is passed take it. It's important to assign AOrd_Detail_ID after assigning orders_id that assigns default ord_detail.}
    if AOrd_Detail_ID > 0 then
       ALMPack.Ord_Detail_ID:= AOrd_Detail_ID;

    ALMPack.ArCusto_id := SelectValueFmtAsFloat('select arcusto_id from orders where id = %f', [AOrdersID]);
    ALMPack.FShipments_ID:= AShipments_ID;

    if ALMPack.This_Standard_ID > 0 then
       ASTandardID:= ALMPack.This_Standard_ID
    else
       AStandardId:= SelectValueFmtAsFloat('select standard_id from arinvt where id = %f', [ArinvtId]);

    ALMPack.FShipQty:= AShipQty * TFrmLM_Pack.get_ord_detail_uom_factor( AOrd_Detail_ID );

    ALMPack.Pk_Ticket_Dtl_ID:= APk_Ticket_Dtl_ID;

    // RAN #
    if ALMPack.FShipmentDtlId > 0 then
       ALMPack.FRan:= SelectValueFmtAsString('select ran from shipment_dtl where id = %f', [ ALMPack.FShipmentDtlId ])
    else if AShipmentDtlId_For_Display > 0 then
       ALMPack.FRan:= SelectValueFmtAsString('select ran from shipment_dtl where id = %f', [ AShipmentDtlId_For_Display ])
    else if ALMPack.Pk_Ticket_Dtl_ID > 0 then
       ALMPack.FRan:= SelectValueFmtAsString('select r.ran from ps_ticket_dtl t, releases r where t.id = %f and t.release_id = r.id', [ ALMPack.Pk_Ticket_Dtl_ID ]);

    if (ALMPack.FPackno = '0') and (ALMPack.FShipments_ID <> 0) then
      ALMPack.FPackno := SelectValueByID('packslipno', 'shipments', ALMPack.FShipments_ID );

    if ALMPack.FShipments_ID > 0 then
       ALMPack.FPackslipno:= SelectValueByID('packslipno', 'shipments', ALMPack.FShipments_ID );

    with TFrmLM_Pack.PackCreateEx( ALMPack, ArinvtID, TRUE ) do
    try
      FValidateQuantityAgainstBoxQuantity:= TRUE;  // when printing from pkticket or packslip validate total qty vs box qty
      FShipmentDtlId_For_Display := AShipmentDtlId_For_Display;
      spSearchLots.Visible := AShipmentDtlId_For_Display <> 0;
      FId := ALMPack.FArinvt_id;
      {Jun-1-04}
      AOnDataChange:= DM.SrcPackage.OnDataChange;
      DM.SrcPackage.OnDataChange := nil;

      IQSetTablesActive( true, DM );
      if DM.QryMfgNo.Locate('ID', AStandardID, []) then
        wwMfgNo.text := DM.QryMfgNo.FieldByName('MFGNO').asString;
      wwDBLookupComboCustomer.Text :=  DM.wwQryCustomer.FieldByName('COMPANY').asString;

      // 10/24/2013 Added ORDER BY to SQL so that the field, use_for_label_print,
      // is the first record.  This SQL may return multiple records, but only
      // applies the first in the dataset.  This change was made by Byron for:
      // EIQ-1345 Pick Ticket - printing Assy1 label with process/pkg marked 'Use for Label on BOM' is selecting wrong box qty

      {EIQ-11211 Labels- Box # not resetting when
                 'Reset box number on lot number change'
                 checked- Phoenix Closures CRM# 1409049
       Package: WORKORDER_MISC
         FUNCTION get_boxno
                  ( p_arinvt_id    IN NUMBER,
                    p_standard_id  IN NUMBER,
                    p_workorder_id IN NUMBER:= 0,
                    p_ptorder_id   IN NUMBER:= 0 )
                  RETURN NUMBER; }

      A:= SelectValueArrayFmt(
                          'select  o.ptsper,                                                         ' +
                          '        workorder_misc.get_boxno(%d, %d) as boxno,                        ' +
                          '        a.id as arinvt_id                                                 ' +
                          '   from partno p,                                                         ' +
                          '        opmat o,                                                          ' +
                          '        ptoper t,                                                         ' +
                          '        arinvt a                                                          ' +
                          '  where a.class = ''PK''                                                  ' +
                          '    and p.arinvt_id = %f                                                  ' +
                          '    and p.standard_id = %f                                                ' +  {default standard_id!}
                          '    and t.partno_id = p.id                                                ' +
                          '    and t.sndop_id = o.sndop_id                                           ' +
                          '    and o.arinvt_id = a.id                                                ' +
                          '    and NVL(o.seq, 999999999999)  = (select MIN(NVL(o.seq, 999999999999)) ' +
                          '                                       from partno p,                     ' +
                          '                                            opmat o,                      ' +
                          '                                            arinvt a,                     ' +
                          '                                            ptoper t                      ' +
                          '                                      where a.class = ''PK''              ' +
                          '                                        and p.arinvt_id = %f              ' +
                          '                                        and p.standard_id = %f            ' +  {default standard_id!}
                          '                                        and t.partno_id = p.id            ' +
                          '                                        and t.sndop_id = o.sndop_id       ' +
                          '                                        and o.arinvt_id = a.id)           ' +
                          'ORDER BY DECODE(NVL(t.use_for_label_print, ''N''), ''Y'', 1, 0) DESC          ',
                          [ Trunc(ArinvtId), Trunc(AStandardId), ArinvtId, AStandardId, ArinvtId, AStandardId ]);
      if VarArrayDimCount( A ) > 0 then
      begin
        EditBox.Text    := A[0];
        EditBoxNum.Text := FloatToStr(Max( 1, A[ 1 ]));
        if DM.QryPackage.Locate('ARINVT_ID', A[2], []) then
          wwPackage.Text := DM.QryPackage.FieldByName('DESCRIP').asString;
      end;

      if APk_Ticket_Dtl_ID > 0 then
      begin
        N:= SelectValueByID('pts_per_pkg', 'ps_ticket_dtl', APk_Ticket_Dtl_ID);
        if N > 0 then
           EditBox.Text:= FloatToStr( N );
      end;

      {reinstate ondatachange}
      DM.SrcPackage.OnDataChange:= AOnDataChange;

      ShowModal;
    finally
      Free;
    end;
  finally
    ALMPack.Free;
  end;
end;

function DoLabelFromShipman( ArinvtId,
                             AordersId:Real;
                             AShipmentDtlId:Real = 0;
                             AShipQty: Real = 0;
                             APk_Ticket_Dtl_ID: Real = 0;
                             AShipments_ID: Real = 0;
                             AOrd_Detail_ID: Real = 0;
                             ABoxno: Integer = 1;
                             APrinterName: String = ''): Real ;

var
  ALMPack:TIQWebLMPackSlip;
  A:Variant;
  AStandardId:Real;
  AOnDataChange: TDataChangeEvent;
begin
  try
    ALMPack := TIQWebLMPackSlip.Create(Application);
    ALMPack.FHistOrddetailId := SelectValueFmtAsFloat('select id from hist_orders where id = %f', [AordersId]);
    ALMPack.FShipmentDtlId   := AShipmentDtlId;
    ALMPack.Arinvt_ID  := ArinvtId;
    ALMPack.Orders_id  := AOrdersID;


    {04-16-2009 if AOrd_Detail_ID is passed take it. It's important to assign AOrd_Detail_ID after assigning orders_id that assigns default ord_detail.}
    if AOrd_Detail_ID > 0 then
       ALMPack.Ord_Detail_ID:= AOrd_Detail_ID;

    ALMPack.ArCusto_id := SelectValueFmtAsFloat('select arcusto_id from orders where id = %f', [AOrdersID]);
    ALMPack.FShipments_ID:= AShipments_ID;

    if ALMPack.This_Standard_ID > 0 then
       ASTandardID:= ALMPack.This_Standard_ID
    else
       AStandardId:= SelectValueFmtAsFloat('select standard_id from arinvt where id = %f', [ArinvtId]);

    ALMPack.FShipQty:= AShipQty * TFrmLM_Pack.get_ord_detail_uom_factor( AOrd_Detail_ID );

    ALMPack.Pk_Ticket_Dtl_ID:= APk_Ticket_Dtl_ID;

    // RAN #
    if ALMPack.FShipmentDtlId > 0 then
       ALMPack.FRan:= SelectValueFmtAsString('select ran from shipment_dtl where id = %f', [ ALMPack.FShipmentDtlId ])
    else if ALMPack.Pk_Ticket_Dtl_ID > 0 then
       ALMPack.FRan:= SelectValueFmtAsString('select r.ran from ps_ticket_dtl t, releases r where t.id = %f and t.release_id = r.id', [ ALMPack.Pk_Ticket_Dtl_ID ]);

    if (ALMPack.FPackno = '0') and (ALMPack.FShipments_ID <> 0) then
      ALMPack.FPackno := SelectValueByID('packslipno', 'shipments', ALMPack.FShipments_ID );

    if ALMPack.FShipments_ID > 0 then
      begin
       ALMPack.FPackslipno:= SelectValueByID('packslipno', 'shipments', ALMPack.FShipments_ID );
       ALMPack.FForceShip_To_ID := SelectValueByID('ship_to_id', 'shipments', ALMPack.FShipments_ID );
       ALMPack.FForceBill_To_ID := SelectValueByID('bill_to_id', 'shipments', ALMPack.FShipments_ID );
      end;

    with TFrmLM_Pack.PackCreateEx( ALMPack, ArinvtID, TRUE ) do
    try
      FValidateQuantityAgainstBoxQuantity:= TRUE;  // when printing from pkticket or packslip validate total qty vs box qty
      FId := ALMPack.FArinvt_id;
      {Jun-1-04}
      AOnDataChange:= DM.SrcPackage.OnDataChange;
      DM.SrcPackage.OnDataChange := nil;

      IQSetTablesActive( true, DM );
      if DM.QryMfgNo.Locate('ID', AStandardID, []) then
        wwMfgNo.text := DM.QryMfgNo.FieldByName('MFGNO').asString;
      wwDBLookupComboCustomer.Text :=  DM.wwQryCustomer.FieldByName('COMPANY').asString;

      EditBox.Text    := FloatToStr(AShipQty);
      EditBoxNum.Text := FloatToStr(Max(1, ABoxno));

      {reinstate ondatachange}
      DM.SrcPackage.OnDataChange:= AOnDataChange;
      CheckAssignPrinterName(APrinterName);
      DoForceCRWPrinterName(APrinterName);
      BtnOkClick(nil);
      Result:= ALMPack.FSerial;
    finally
      Free;
    end;
  finally
    ALMPack.Free;
  end;
end;

{procedure DoPrintLMPackMaterial(ArinvtId, ALMLabelsID, AStandardID, AOrdersID, AQty, ALblQty:Real; ALotNo:String);
var
  ALMPack:TLMPackSlip;
  A:Variant;
begin
  try
    ALMPack := TLMPackSlip.Create(Application);
    ALMPack.Arinvt_ID  := ArinvtId;
    ALMPack.Orders_id  := AOrdersID;
    ALMPack.ArCusto_id := SelectValueFmtAsFloat('select arcusto_id from orders where id = %f', [AOrdersID]);
    with TFrmLM_Pack.PackCreate( ALMPack, ArinvtId) do
    try
      FId := ALMPack.FArinvt_id;
      DM.SrcPackage.OnDataChange := nil;
      edLotNo.Text := ALotNo;
      IQSetTablesActive( false, DM );
      DM.QryLabels.ParamByName('cLabelType').asString :=
        SelectValueFmtAsString('select label_type from lm_labels where id = %f', [ALMLabelsID]);
      IQSetTablesActive( true, DM );
      EditLblQty.Text := IntToStr(Trunc(ALblQty));
      DM.QryMfgNo.Locate('ID', AStandardID, []);
      A:= SelectValueArrayFmt( 'select o.ptsper,                                                          ' +
                          '        p.boxno,                                                          ' +
                          '        a.id as arinvt_id                                                 ' +
                          '   from partno p,                                                         ' +
                          '        opmat o,                                                          ' +
                          '        ptoper t,                                                         ' +
                          '        arinvt a                                                          ' +
                          '  where a.class = ''PK''                                                  ' +
                          '    and p.arinvt_id = %f                                                  ' +
                          '    and t.partno_id = p.id                                                ' +
                          '    and t.sndop_id = o.sndop_id                                           ' +
                          '    and o.arinvt_id = a.id                                                ' +
                          '    and NVL(o.seq, 999999999999)  = (select MIN(NVL(o.seq, 999999999999)) ' +
                          '                                       from partno p,                     ' +
                          '                                            opmat o,                      ' +
                          '                                            arinvt a,                     ' +
                          '                                            ptoper t                      ' +
                          '                                      where a.class = ''PK''              ' +
                          '                                        and p.arinvt_id = %f              ' +
                          '                                        and t.partno_id = p.id            ' +
                          '                                        and t.sndop_id = o.sndop_id       ' +
                          '                                        and o.arinvt_id = a.id)', [ArinvtId, ArinvtId]);
      if VarArrayDimCount( A ) > 0 then
      begin
        EditBox.Text    := A[0];
        EditBoxNum.Text := FloatToStr( Max( 1, A[ 1 ]));
        DM.QryPackage.Locate('ARINVT_ID', A[2], []);
//        lloc := DM.QryLocation.Locate('ID', AFGMultiID, []);
      end;
      EditBox.Text := IntToStr(Trunc(AQty));
      if DM.QryLabelCust.Locate('ID', ALMLabelsID, []) then
        BtnOkClick(nil);
    finally
      Free;
    end;
  finally
    ALMPack.Free;
  end;
end; }

constructor TFrmLM_Pack.PackCreate(AOwner:TComponent; Id:Real);
begin
  FShowPK   := False;
  inherited Create( AOwner, Id );
  EditQty.Text := '1';
end;

constructor TFrmLM_Pack.PackCreateEx(AOwner:TComponent; ID:Real; ASkipMfgExistsValidation: Boolean );
begin
  FShowPK   := False;
  SkipMfgExistsValidation:= ASkipMfgExistsValidation;  {introduced in IQLMManu.pas}
  inherited Create( AOwner, ID );

  if TIQWebLMBase(self.Owner).FShipQty > 0 then
    EditQty.Text := FloatToStr( TIQWebLMBase(self.Owner).FShipQty )
  else
    EditQty.Text := '1';
end;

constructor TFrmLM_Pack.Create( AOwner: TComponent; ID: Real);
begin
  FShowPK := True;
  inherited Create( AOwner, Id );
end;

constructor TFrmLM_Pack.CreateEx( AOwner: TComponent; ID: Real; ASkipMfgExistsValidation: Boolean );
begin
  FShowPK := True;
  SkipMfgExistsValidation:= ASkipMfgExistsValidation;  {introduced in IQLMManu.pas}
  inherited Create( AOwner, Id );
end;

procedure TFrmLM_Pack.AssignDefaults;
  procedure _AssignStandard;
  var
    AStandard_ID: Real;
  begin
    AStandard_ID:= 0;
    // order detail
    if TIQWebLMBase(self.Owner).Ord_detail_ID > 0 then
       AStandard_ID:= SelectValueByID('standard_id', 'ord_detail', TIQWebLMBase(self.Owner).Ord_detail_ID );
    // default
    if AStandard_ID = 0 then
       AStandard_ID:= SelectValueByID('standard_id', 'arinvt', FId);
     // assign standard_id
     TIQWebLMBase(self.Owner).Standard_ID := AStandard_ID;
     TIQWebLMBase(self.Owner).This_Standard_ID := AStandard_ID;
     // wwMfgNo.LookupValue:= FloatToStr(AStandard_ID);
     // wwMfgNo.PerformSearch;
  end;


begin
//  if fId = 0 then
  if FShowPK then
  try
    with DM.PkAllItems do
       if Execute then
       begin
         TIQWebLMBase(self.Owner).Arinvt_id    := GetValue('arinvtid');
         TIQWebLMBase(self.Owner).Orders_id    := GetValue('orderid');
         TIQWebLMBase(self.Owner).ArCusto_id   := GetValue('Id');
         TIQWebLMBase(self.Owner).Ord_detail_id:= GetValue('OrderDetailId');         {08-27-2007}
         TIQWebLMBase(self.Owner).Ship_To_ID   := GetValue('ship_to_id');
         TIQWebLMBase(self.Owner).FAka_Kind    := GetValue('aka_kind');
         FId                              := TIQWebLMBase(self.Owner).FArinvt_id;
         // TLMBase(self.Owner).Standard_ID  := SelectValueByID('standard_id', 'arinvt', FId);
         _AssignStandard;
       end
       else Abort;
  except on E:EAbort do
    begin
      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
      ABORT;
    end;
  end;

  {Disable ondropdown of Customer as it was interfering when repeating print
   and displaying default customer instead of AKA one }
  wwDBLookupComboCustomer.OnChange:= NIL;
  try
    inherited;
  finally
    wwDBLookupComboCustomer.OnChange:= wwDBLookupComboCustomerChange;
  end;

  EditOrder.Text      := TIQWebLMBase(Owner).FOrder_No;
  EditPoNo.Text       := TIQWebLMBase(Owner).FPoNo;
  EditQty.Text    := FloatToStr(TIQWebLMBase(Owner).FOrd_quan);

  AssignShipTo;  {By default addr1-3 is coming from arcusto. Get it from ship_to}
end;

procedure TFrmLM_Pack.AssignCustomerLookupParams;
begin
  // inherited;  completely override inherited to pickup all the arcusto: default + orders.arcusto_id
  with DM.wwQryCustomer do
  begin
    Close;
    ParamByName('arinvt_id').Value := TIQWebLMBase(self.Owner).Arinvt_ID;
    ParamByName('arcusto_id').Value := TIQWebLMBase(self.Owner).ArCusto_ID;
    Open;
  end;
end;

procedure TFrmLM_Pack.BtnOkClick(Sender: TObject);
var
  ABoxQty: Real;
  AQty: Real;
begin
  if FValidateQuantityAgainstBoxQuantity then
     CheckVerifyTotalQtyAgainstBoxQty;

  inherited;

  if Sender <> nil then
  begin
    if IQConfirmYN( IQMS.WebVcl.ResourceStrings.cTXT0000136  {'Would you like to print another label?'} ) then
      PostMessage( Handle, iq_Notify, 0, 0 )  {see IQNotify}
    else
      Close;
  end;
end;


procedure TFrmLM_Pack.CheckVerifyTotalQtyAgainstBoxQty;
var
  ABoxQty: Real;
  AQty   : Real;
  S      : string;
begin
  IQAssert( IQMS.Common.Numbers.IsStringValidFloat( EditQty.Text, AQty), IQMS.WebVcl.ResourceStrings.cTXT0000112 {'Valid Quantity must be entered'} );
  IQAssert( IQMS.Common.Numbers.IsStringValidFloat( EditBox.Text, ABoxQty), IQMS.WebVcl.ResourceStrings.cTXT0000130 {'Valid Box Quantity must be entered'} );
  if AQty >= ABoxQty then
     EXIT;

  S:= Format( 'Print Qty (%s) is greater than Ship Qty (%s). The label will print Ship Qty.'#13#13'Please confirm to continue.',
              [ FloatToStr( ABoxQty ), FloatToStr( AQty )]);

  { IQDialogChkEx is defined in IQMesg,  TFrmIQLMChkBoxQty is in IQLMChkBoxQty }
  case IQDialogChkEx( TFormClass(TFrmIQLMChkBoxQty),
                      S,
                      'FrmIQLMChkBoxQty' ) of
    0: ABORT;
    1: {Do nothing!};
  end;
end;


procedure TFrmLM_Pack.IQNotify( var Msg: TMessage );
begin
  AssignDefaults;
end;

procedure TFrmLM_Pack.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmLM_Pack.DefineLabelText1Click(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmLM_Pack.sbtnPickLabelClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmLM_Pack.EditBoxExit(Sender: TObject);
begin
  inherited;
  // Delphi ...
end;

procedure TFrmLM_Pack.PkLotBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AID', FShipmentDtlId_For_Display);
end;


procedure TFrmLM_Pack.spSearchLotsClick(Sender: TObject);
var
  Qry : TDataSet;
  IDS : IIQDataServices;
  ID  : integer;
begin
  IDS := ServiceLocator.GetService<IIQDataServices>('FireDAC-Oracle');

  Qry := IDS.GetQuery('select distinct lotno from shipment_releases where shipment_dtl_id = :AID');
  try
    Qry.Open;

    ID := DoSinglePickList(Qry, 0);
    edLotNo.Text := Qry.FieldByName('LOTNO').AsString
  finally
    Qry.Free;
  end;
end;


end.

