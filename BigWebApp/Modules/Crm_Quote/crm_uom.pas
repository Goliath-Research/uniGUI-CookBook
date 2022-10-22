unit crm_uom;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Bom_Uom,
  Data.DB,
  FireDAC.Comp.DataSet,
  MainModule,
  IQMS.WebVcl.SecurityRegister, uniGUIClasses, uniMultiItem, uniListBox,
  uniButton, Vcl.Forms, uniGUIBaseClasses, uniPanel,
  uniGUIApplication;

type
  TFrmCRM_UomSelect = class(TFrmBom_UomSelect)
  private
    function GetArinvtID: Real;
    { Private declarations }
  protected
    procedure SaveNewUOM( AState: TDataSetState ); override;
    procedure ApplyConvertTo( ID:Real; AFromUOM, AToUOM: string ); override;
  public
    { Public declarations }
  end;

function GetCRM_UOM( ):Boolean;



implementation

{$R *.DFM}

uses
  IQMS.Common.UOM,
  IQMS.Common.DataLib,
  crmquote_const;

function GetCRM_UOM():Boolean;
var
  FrmCRM_UomSelect: TFrmCRM_UomSelect;
begin
  FrmCRM_UomSelect := TFrmCRM_UomSelect.Create(uniGUIApplication.UniApplication);
  Result:= FrmCRM_UomSelect.ShowModal = mrOK;
end;

procedure TFrmCRM_UomSelect.ApplyConvertTo(ID: Real; AFromUOM,
  AToUOM: string);
var
  I      : Integer;
  S      : string;
  AFactor, AListPrice: Real;
  AArinvtID: Real;
begin
  // NOTE:  Applies only to ARINVT sources
  if Assigned( FDataSet ) then
     with FDataSet do
       begin
         AArinvtID := GetArinvtID;
         Edit;
         AFactor:= IQConvertUom( 1,           // AQty
                                 AFromUOM,    // AFromUOM
                                 AToUOM,      // AToUOM
                                 AArinvtID,   // AArinvt_ID
                                 FALSE );     // AIgnoreError

         FieldByName( FDataField ).AsString:= ListBox1.Items[ ListBox1.ItemIndex ];
         FieldByName( 'QTY').AsFloat:= FieldByName( 'QTY').AsFloat * AFactor;
         // The idea here is to have ready to go uom_factor such as: order_qty * uom_factor = native arinvt qty }
         FieldByName('UOM_FACTOR').AsFloat:= IQToNativeUomFactor( AToUOM,    // AFromUOM
                                                                  AArinvtID, // AArinvt_ID
                                                                  TRUE );    // AIgnoreError

         Post;

         if AFactor <> 1 then
            RefreshDataSetByID( FDataSet ); // iqlib

  end;
end;

procedure TFrmCRM_UomSelect.SaveNewUOM(AState: TDataSetState);
begin
  with FDataSet do
  begin
    FieldByName('QTY').AsFloat := FieldByName( 'QTY' ).AsFloat;             { Trigger AssignUnitPrice procedure }
    FieldByName('UOM_FACTOR').AsFloat := IQToNativeUomFactor(FieldByName('UNIT').AsString, // AFromUOM
                                                              GetArinvtID, // AArinvt_ID
                                                              TRUE ); // AIgnoreError

  end;

  inherited;
end;

function TFrmCRM_UomSelect.GetArinvtID: Real;
begin
  Result := 0;
  with FDataSet do
   begin
     // 03/05/2010 Get the ARINVT.ID
     if (FieldByName('SOURCE').AsString = crmquote_const.cSOURCE_ARINVT) then
        Result := FieldByName('SOURCE_ID').AsFloat
     else if (FieldByName('SOURCE').AsString = crmquote_const.cSOURCE_AKA) then
        Result := SelectValueFmtAsFloat('SELECT arinvt_id FROM aka WHERE id = %.0f',
         [FieldByName('SOURCE_ID').AsFloat]);
   end;
end;


end.
