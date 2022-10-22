unit IQMS.Common.TransMisc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  System.Variants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  Data.DB,
  IQMS.Common.LabelsShare;

type
  TArrayOfVAriant = array of Variant;
  TBeforeSilentDispo = procedure( Sender:TObject );

function LocationsColorLegendArray: TArrayOfVAriant;
function GetConformStateChange( AFrom_FGMulti_ID, ATo_FGMulti_ID: Real ): Integer;  // 0 - no change, 1 - conform to non-conform, 2 - non-conform to conform

// the following 3 procedures were moved from trans_share due to ComServ restriction in IQVCL
procedure AssignFGMultiMakeToOrderDetailFromOrdDetailEx( AFGMulti_ID, AOrd_Detail_ID: Real );
function IsUniqueDispoLocOnMoveEx(AArinvt_ID: Real): Boolean;
function IsCascadeParentMTOEx(AArinvt_ID: Real): Boolean;

function GetAllowInTransitNegative: Boolean;

type
  TArrangeLabelsByLocation = class
  private
    Master_Label_List: TStringList;
    FFGMultiTable: TFDMemTable;
    FLabelsTable: TFDMemTable;
    FFGMultiSrc: TDataSource;
    procedure AddLabelToList( AMaster_Label_ID, AFGMulti_ID: Integer; AQty: Real );
    procedure LoadArrangeLabels( AMaster_Label_List: TStringList );
    procedure InitStructure;
  public
    constructor Create( AMaster_Label_List: TStringList );
    destructor Destroy; override;
    property FGMultiTable: TFDMemTable read FFGMultiTable write FFGMultiTable;
    property LabelsTable: TFDMemTable read FLabelsTable write FLabelsTable;
    procedure LocationLabelsList( AFGMulti_ID: Integer; var AQty: Real; AList: TStringList );
  end;


implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils;

function LocationsColorLegendArray: TArrayOfVAriant;
begin
  Result:= VarArrayOf([ clMaroon, clBlack,   'Non-Conform',    // brush, pen, hint     hpickfrm.pas
                        clYellow, clBlack,   'VMI Location',
                        clGray,   clBlack,   'Non-Allocate',
                        clRed,    clBlack,   'Expired',
                        clBlack,  clFuchsia, 'In Transit',
                        clAqua,   clBlack,   'Hard Allocated',
                        16764134, clBlack,   'Make To Order' ]);
end;


function GetConformStateChange( AFrom_FGMulti_ID, ATo_FGMulti_ID: Real ): Integer;  // 0 - no change, 1 - conform to non-conform, 2 - non-conform to conform
var
  A:Variant;
begin
  A:= SelectValueArrayFmt( 'select decode( NVL(f1.non_conform_id,  0), 0, 0, 1), ' +
                      '       decode( NVL(f2.non_conform_id,  0), 0, 0, 1)  ' +
                      '  from fgmulti f1,                                   ' +
                      '       fgmulti f2                                    ' +
                      ' where f1.id = %f                                    ' +
                      '   and f2.id = %f                                    ',
                      [ AFrom_FGMulti_ID, ATo_FGMulti_ID ]);

  if VarArrayDimCount( A ) = 0 then   { check to see if array is not empty }
    raise Exception.CreateFmt('Unable to locate FGmulti ID = %f and/or %f', [ AFrom_FGMulti_ID, ATo_FGMulti_ID ]);

  if A[ 0 ] = A[ 1 ] then                         { moving conform to conform or non-conform to non-conform }
     Result:= 0
  else if A[ 0 ] < A[ 1 ] then                    { moving conform to non conform }
     Result:= 1
  else if A[ 0 ] > A[ 1 ] then                    { moving non conform to conform }
     Result:= 2
  else
     Result:= -1;                                 { s/n happen }
end;


procedure AssignFGMultiMakeToOrderDetailFromOrdDetailEx( AFGMulti_ID, AOrd_Detail_ID: Real );
var
  A: Variant;
begin
  if AOrd_Detail_ID = 0 then
     EXIT;

  A:= SelectValueArrayFmt( 'select is_make_to_order, arinvt_id from ord_detail where id = %f', [ AOrd_Detail_ID ]);
  if VarArrayDimCount( A ) = 0 then
  begin
     A:= SelectValueArrayFmt( 'select is_make_to_order, arinvt_id from hist_ord_detail where id = %f', [ AOrd_Detail_ID ]);
     if VarArrayDimCount( A ) = 0 then
        EXIT;
  end;

//if (A[ 0 ] = 'Y') and (A[ 1 ] = SelectValueByID('arinvt_id', 'fgmulti', AFGMulti_ID)) then
  if (A[ 0 ] = 'Y') and (SelectValueFmtAsFloat('select mto.is_item_matching_ord_detail( %f, %f ) from dual', [ AOrd_Detail_ID, AFGMulti_ID ]) = 1) then
     ExecuteCommandFmt('update fgmulti set make_to_order_detail_id = %f where id = %f', [ AOrd_Detail_ID, AFGMulti_ID ]);
end;


function IsUniqueDispoLocOnMoveEx(AArinvt_ID: Real): Boolean;
begin
  Result:= SelectValueFmtAsString('select unique_dispo_loc from arinvt where id = %f', [ AArinvt_ID ]) = 'Y';
end;


function IsCascadeParentMTOEx(AArinvt_ID: Real): Boolean;
begin
  Result:= SelectValueByID('sched_cascade_parent_mto', 'arinvt', AArinvt_ID) = 'Y';
end;

function GetAllowInTransitNegative: Boolean;
begin
  Result:= SelectValueAsString('select allow_in_transit_negative from params') = 'Y';
end;


{ TArrangeLabelsByLocation  }

constructor TArrangeLabelsByLocation.Create( AMaster_Label_List: TStringList );
begin
  InitStructure;
  if Assigned(AMaster_Label_List) and (AMaster_Label_List.Count > 0) then
     LoadArrangeLabels( AMaster_Label_List );
end;

destructor TArrangeLabelsByLocation.Destroy;
begin
  FFGMultiSrc.Free;
  FFGMultiTable.Free;
  FLabelsTable.Free;
  inherited;
end;

procedure TArrangeLabelsByLocation.InitStructure;
begin
  // fgmulti
  FFGMultiTable:= TFDMemTable.Create(nil);
  with FFGMultiTable.FieldDefs do
    with AddFieldDef do
    begin
      Name := 'ID';
      DataType:= ftInteger;
    end;

  FFGMultiSrc:= TDataSource.Create(nil);
  FFGMultiSrc.DataSet:= FFGMultiTable;

  // master_labels
  FLabelsTable:= TFDMemTable.Create(nil);
  with FLabelsTable.FieldDefs do
  begin
    with AddFieldDef do
    begin
      Name := 'FGMULTI_ID';
      DataType:= ftInteger;
    end;

    with AddFieldDef do
    begin
      Name := 'MASTER_LABEL_ID';
      DataType:= ftInteger;
    end;

    with AddFieldDef do
    begin
      Name := 'QTY';
      DataType:= ftFMTBcd;
    end;
  end;

  with FLabelsTable do
  begin
    MasterSource:= FFGMultiSrc;
    MasterFields:= 'ID';
    IndexFieldNames:= 'FGMULTI_ID';
  end;

  FGMultiTable.Open;
  LabelsTable.Open;
end;


procedure TArrangeLabelsByLocation.LoadArrangeLabels( AMaster_Label_List: TStringList );
label
  NextRec;
var
  ALabelType: TMasterLabelType;
  AList: TStringList;
begin
  with TFDQuery.Create( nil ) do
  try
    ConnectionName:= 'IQFD';
    SQL.Add(Format('select id,                                    '+
                   '       fgmulti_id,                            '+
                   '       qty,                                   '+
                   '       decode( nvl(is_pallet,''N''),          '+
                   '         ''Y'', RF.get_master_label_type(id), '+
                   '         ''CASE'')  as label_type             '+
                   ' from master_label                            '+
                   ' where id in (%s)                             ',
                   [ StringListToStr( AMaster_Label_List, ',')]));
    Open;
    while not Eof do
    begin
      ALabelType:= MapMasterLabelType( FieldByName('label_type').asString );

      case ALabelType of
        mltPalletLicensePlate, mltPalletMixedItemLot, mltPalletMixedItem, mltPalletMixedLot, mltPalletMixedFGMulti:
          begin
            AList:= TStringList.Create;
            try
               LoadColumnValueIntoStringList( AList, Format('select id from master_label where parent_id = %d', [ FieldByName('id').asInteger ]));
               LoadArrangeLabels( AList );  // recursion
            finally
              AList.Free;
            end;
          end ;

        mltPallet, mltCase:
          begin
            AddLabelToList( FieldByName('id').AsInteger, FieldByName('fgmulti_id').AsInteger, FieldByName('qty').asFloat );
          end;
      end;

      Next;
    end;
  finally
    Free;
  end;
end;


procedure TArrangeLabelsByLocation.AddLabelToList( AMaster_Label_ID, AFGMulti_ID: Integer; AQty: Real );
begin
  if not FGMultiTable.Locate('id', AFGMulti_ID, []) then with FGMultiTable do
  begin
    Append;
    FieldByName('id').asInteger:= AFGMulti_ID;
    Post;
  end;

  with LabelsTable do
  begin
    Append;
    FieldByName('fgmulti_id').asInteger:= AFGMulti_ID;
    FieldByName('master_label_id').asInteger:= AMaster_Label_ID;
    FieldByName('qty').asFloat:= AQty;
  end;
end;


procedure TArrangeLabelsByLocation.LocationLabelsList( AFGMulti_ID: Integer; var AQty: Real; AList: TStringList );
begin
  AList.Clear;
  AQty:= 0;

  if not FGMultiTable.Locate('id', AFGMulti_ID, []) then
    EXIT;

  LabelsTable.First;
  while not LabelsTable.Eof do
  begin
    AList.Add( LabelsTable.FieldByName('master_label_id').asString );
    AQty:= AQty + LabelsTable.FieldByName('qty').asFloat;
    LabelsTable.Next;
  end;
end;


end.
