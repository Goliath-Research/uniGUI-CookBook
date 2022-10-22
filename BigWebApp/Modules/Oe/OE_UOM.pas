unit OE_UOM;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Bom_Uom,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  IQMS.WebVcl.SecurityRegister, uniGUIClasses, uniMultiItem, uniListBox,
  uniButton, Vcl.Forms, uniGUIBaseClasses, uniPanel,UniGUIApplication;

type
  TFrmOE_UomSelect = class(TFrmBom_UomSelect)
  private
    { Private declarations }
  protected
    procedure LoadListBox; override;
    procedure SaveNewUOM( AState: TDataSetState ); override;
    procedure ApplyConvertTo( ID:Real; AFromUOM, AToUOM: string ); override;
  public
    { Public declarations }
  end;

function GetOE_UOM:Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.UOM;
{ TODO -oGPatil -cWebConvert : Dependency
  UOM_Lst; }

function GetOE_UOM:Boolean;
var
  LFrmOE_UomSelect : TFrmOE_UomSelect;
begin
  LFrmOE_UomSelect := TFrmOE_UomSelect.Create( UniGUIApplication.UniApplication );
  Result:= LFrmOE_UomSelect.ShowModal = mrOK;
end;

procedure TFrmOE_UomSelect.ApplyConvertTo( ID:Real; AFromUOM, AToUOM: string );
var
  I      : Integer;
  S      : string;
  AFactor: Real;
  AWasInTran: Boolean;
begin
  AWasInTran := UniMainModule.FDConnection1.InTransaction;
  with TFDTable(FDataSet) do
  try
    if not AWasInTran then
       UniMainModule.FDConnection1.StartTransaction;

    Edit; {Ord_Detail}

    AFactor:= IQConvertUom( 1,                                  // AQty
                            AFromUOM,                           // AFromUOM
                            AToUOM,                             // AToUOM
                            FieldByName('arinvt_id').asFloat,   // AArinvt_ID
                            FALSE );                            // AIgnoreError

    FieldByName( FDataField ).asString:= ListBox1.Items[ ListBox1.ItemIndex ];

    FieldByName( 'total_qty_ord').asFloat:= FieldByName( 'total_qty_ord').asFloat * AFactor;


    {The idea here is to have ready to go uom_factor such as: order_qty * uom_factor = native arinvt qty }
    FieldByName('uom_factor').asFloat:= IQToNativeUomFactor( AToUOM,                              // AFromUOM
                                                             FieldByName('arinvt_id').asFloat,    // AArinvt_ID
                                                             TRUE );                              // AIgnoreError
    Post;

    if AFactor <> 1 then
      ExecuteCommandFmt('update releases set quan = quan * %.8f where ord_detail_id = %f', [ AFactor, FieldByName('id').asFloat ]);

    if not AWasInTran then
       UniMainModule.FDConnection1.Commit;

    if AFactor <> 1 then
       RefreshDataSetByID( FDataSet )      { This will cause the releases list to be rebuilt}

  finally
    if not AWasInTran and UniMainModule.FDConnection1.InTransaction then
       UniMainModule.FDConnection1.RollBack;
  end;
end;

procedure TFrmOE_UomSelect.SaveNewUOM( AState: TDataSetState );
begin
  with FDataSet do
  begin
    FieldByName( 'total_qty_ord' ).asFloat:= FieldByName( 'total_qty_ord' ).asFloat;             { Trigger AssignUnitPrice procedure }
    FieldByName( 'uom_factor' ).asFloat:= IQToNativeUomFactor( FieldByName('unit').asString,     // AFromUOM
                                                               FieldByName('arinvt_id').asFloat, // AArinvt_ID
                                                               TRUE );                           // AIgnoreError

  end;
  inherited;   {Post}
end;


procedure TFrmOE_UomSelect.LoadListBox;
begin
{ TODO -oGPatil -cWebConvert : Dependency
  PopulateUOMs( ListBox1.Items );  {UOM_Lst}
end;


end.
