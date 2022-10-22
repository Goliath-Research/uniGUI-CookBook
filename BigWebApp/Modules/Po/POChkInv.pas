unit POChkInv;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  System.Variants,
  IQMS.Common.StatChk,
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
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniButton,
  uniLabel, uniCheckBox, uniPanel, uniPageControl, uniGUIApplication;

type
  TFrmStatusExceptionInv = class(TFrmStatusException)
    Label4: TUniLabel;
    DBEdit4: TUniDBEdit;
    Label5: TUniLabel;
    DBEdit5: TUniDBEdit;
    Label6: TUniLabel;
    DBEdit6: TUniDBEdit;
    btnPriceBreaks: TUniButton;
    procedure btnPriceBreaksClick(Sender: TObject);
  private
    { Private declarations }
    FPO_ID: Real;
    FArinvt_ID: Real;
    FDivision_ID: Real;
    FVendorID: Real;
    procedure PrepareQuery( AID: Real ); override;
  public
    { Public declarations }
    FTotalQtyOrd:Real;
  end;

procedure CheckPODetail_Inv( APO_ID, ArinvtId, ADivision_ID, TotalQtyOrd:Real );


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  price_breaks_buying;

procedure CheckPODetail_Inv( APO_ID, ArinvtId, ADivision_ID, TotalQtyOrd:Real );
var
  AMin: Real;
  AMax: Real;
  A   : Variant;
  AAkaMin: Real;
  AVendorID: Real;
  LFrmStatusExceptionInv: TFrmStatusExceptionInv;
begin
  if ArinvtID = 0 then
     EXIT;

  AVendorID := SelectValueFmtAsFloat('SELECT vendor_id FROM po WHERE id = %.0f',[APO_ID]);

  TotalQtyOrd:= IQMS.Common.Numbers.IQRound( TotalQtyOrd, 2 );

  A:= SelectValueArrayFmt('select iqmisc.no_zero( d.min_order_qty, a.min_order_qty ) as min_order_qty, '+
                     '       iqmisc.no_zero( d.max_order_qty, a.max_order_qty ) as max_order_qty  '+
                     '  from arinvt a, arinvt_division d '+
                     ' where a.id = %f and a.id = d.arinvt_id(+) and d.division_id(+) = %f',
                     [ ArinvtId, ADivision_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  AMin:= A[ 0 ];
  AMax:= A[ 1 ];

  AAkaMin := SelectValueFmtAsFloat(
    'SELECT min_order_qty FROM arinvt_vendors WHERE arinvt_id = %.0f AND vendor_id = %.0f',
    [ArinvtId, AVendorID]);
  if AAkaMin > 0 then
    AMin := AAkaMin;

  if (AMax = 0) and (AMin = 0) then
     EXIT;

  if ((AMax <> 0) and (AMax < TotalQtyOrd)) or ((AMin <> 0) and (AMin > TotalQtyOrd)) then
  begin
      LFrmStatusExceptionInv := TFrmStatusExceptionInv.Create( uniGUIApplication.UniApplication );

      LFrmStatusExceptionInv.FPO_ID:= APO_ID;
      LFrmStatusExceptionInv.FTotalQtyOrd := TotalQtyOrd;
      LFrmStatusExceptionInv.FArinvt_ID:=  ArinvtId;
      LFrmStatusExceptionInv.FDivision_ID:= ADivision_ID;
      LFrmStatusExceptionInv.FVendorID := SelectValueFmtAsFloat('SELECT vendor_id FROM po WHERE id = %.0f',[APO_ID]);
      LFrmStatusExceptionInv.rcusto_ID := ArinvtId;
      if not (LFrmStatusExceptionInv.ShowModal = mrOK) then
         raise TIQNotAuthorizedException .Create;

  end;
end;

procedure TFrmStatusExceptionInv.PrepareQuery( AID: Real );
begin
    Query1.Close;
    AssignQueryParamValue(Query1, 'ID', AID);
    AssignQueryParamValue(Query1, 'TotalQtyOrd1', FTotalQtyOrd);
    AssignQueryParamValue(Query1, 'TotalQtyOrd2', FTotalQtyOrd);
    AssignQueryParamValue(Query1, 'division_id', FDivision_ID);
    AssignQueryParamValue(Query1, 'vendor_id', FVendorID);
end;


procedure TFrmStatusExceptionInv.btnPriceBreaksClick(Sender: TObject);
begin
  inherited;
  TFrmPriceBreaksBuying.DoShowModal( SelectValueByID( 'vendor_id', 'po', FPO_ID ),
                                     FArinvt_ID );
end;


end.
