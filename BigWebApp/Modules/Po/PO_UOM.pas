unit PO_UOM;

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
  uniGUIApplication, //UniApplication
  IQMS.Common.DataConst,
  IQMS.WebVcl.SecurityRegister, uniGUIClasses, uniMultiItem, uniListBox,
  uniButton, Vcl.Forms, uniGUIBaseClasses, uniPanel;

type
  TFrmPO_UomSelect = class(TFrmBom_UomSelect)
  private
    { Private declarations }
  protected
    procedure LoadListBox; override;
    procedure SaveNewUOM( AState: TDataSetState ); override;
    procedure ApplyConvertTo( ID:Real; AFromUOM, AToUOM: string ); override;
  public
    { Public declarations }
  end;

function GetPO_UOM:Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.UOM;
  { TODO -oLema : Dependent on UOM_Lst }
//  UOM_Lst;

function GetPO_UOM:Boolean;
var
  frm: TFrmPO_UomSelect;
begin
  frm := TFrmPO_UomSelect.Create(uniGUIApplication.UniApplication);
  Result:= (frm.ShowModal = mrOK);
end;

procedure TFrmPO_UomSelect.ApplyConvertTo( ID:Real; AFromUOM, AToUOM: string );
var
  I        : Integer;
  S        : string;
  AState   : TDataSetState;
  AFactor  : Real;
  AWasInTran: Boolean;
  aConnection : TFDConnection;

  procedure AssignValueToField( AFieldName: string; AValue: Real );
  var
     AReadOnly: Boolean;
  begin
     with TFDTable(FDataSet) do
     try
       AReadOnly:= FieldByName( AFieldName ).ReadOnly;
       FieldByName( AFieldName ).ReadOnly:= FALSE;
       FieldByName( AFieldName ).asFloat := AValue;
     finally
       FieldByName( AFieldName ).ReadOnly:= AReadOnly;
     end;
  end;

begin
  {PO_Detail}
  with TFDTable(FDataSet) do
  try
    aConnection := FDManager.FindConnection(cnstFDConnectionName) as TFDConnection;
    AWasInTran:= aConnection.InTransaction;
    if not AWasInTran then
       aConnection.StartTransaction;

    try
      AState:= State;
      Edit;
      FieldByName( FDataField ).asString:= ListBox1.Items[ ListBox1.ItemIndex ];
      AFactor:= IQConvertUom( 1,                                  // AQty
                              AFromUOM,                           // AFromUOM
                              AToUOM,                             // AToUOM
                              FieldByName('arinvt_id').asFloat,   // AArinvt_ID
                              FALSE );                            // AIgnoreError

      // FieldByName( 'total_qty_ord').asFloat:= FieldByName( 'total_qty_ord').asFloat * AFactor;
      AssignValueToField( 'total_qty_ord', FieldByName( 'total_qty_ord').asFloat * AFactor );

      {The idea here is to have ready to go uom_factor such as: order_qty * uom_factor = native arinvt qty }
      // FieldByName('uom_factor').asFloat:= IQToNativeUomFactor( AToUOM,                              // AFromUOM
      //                                                          FieldByName('arinvt_id').asFloat,    // AArinvt_ID
      //                                                          TRUE );                              // AIgnoreError
      AssignValueToField( 'uom_factor', IQToNativeUomFactor( AToUOM,                              // AFromUOM
                                                             FieldByName('arinvt_id').asFloat,    // AArinvt_ID
                                                             TRUE ));                              // AIgnoreError
      Post;

      if AFactor <> 1 then
         ExecuteCommandFmt('update po_releases set quan = quan * %.8f where po_detail_id = %f', [ AFactor, FieldByName('id').asFloat ]);

      if not AWasInTran then
         aConnection.Commit;

      if AFactor <> 1 then
         RefreshDataSetByID( FDataSet )      {IQLib}
    finally
      if not AWasInTran and aConnection.InTransaction then
         aConnection.RollBack;
    end;
  except
    if State in [dsEdit, dsInsert] then
       Cancel;
    raise;
  end;
end;

//function TFrmPO_UomSelect.ConvertValueFrom( OldValue:Real ):Real;
//begin
//  Result:= inherited ConvertValueFrom( OldValue );
//  {This is crazy - if I typed 999.999 ww converted it to 100 (!). Here I leave only 2 decimals. Field size = 10.2}
//  Result:= Round( Result * 100 ) / 100;
//end;

procedure TFrmPO_UomSelect.SaveNewUOM( AState: TDataSetState );
begin
  with FDataSet do
  begin
    FieldByName( 'total_qty_ord' ).asFloat:= FieldByName( 'total_qty_ord' ).asFloat; {Trigger AssignUnitPrice procedure}
    FieldByName( 'uom_factor' ).asFloat:= IQToNativeUomFactor( FieldByName('unit').asString,     // AFromUOM
                                                               FieldByName('arinvt_id').asFloat, // AArinvt_ID
                                                               TRUE );                           // AIgnoreError
  end;
  inherited;   {Post}
end;


procedure TFrmPO_UomSelect.LoadListBox;
begin
  { TODO -oLema : Dependent on UOM_Lst }
  //PopulateUOMs( ListBox1.Items );  {UOM_Lst}
end;

end.
