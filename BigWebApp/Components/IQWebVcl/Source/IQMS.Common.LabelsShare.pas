unit IQMS.Common.LabelsShare;

interface

uses
  System.SysUtils, System.Classes, IQMS.Common.DataLib, SYstem.TypInfo;

type
  TMasterLabelType = (mltUnknown, mltPalletLicensePlate, mltPalletMixedItemLot, mltPalletMixedItem, mltPalletMixedLot, mltPalletMixedFGMulti, mltPallet, mltCase);

function MapMasterLabelType(AMixedLabelType: string): TMasterLabelType;
function GetMasterLabelType( ASerialNo: string ): TMasterLabelType; overload;
function GetMasterLabelType( AMaster_Label_ID: Real ): TMasterLabelType; overload;
function GetParentMasterLabelType( AMaster_Label_ID: Real ): TMasterLabelType;
function MasterLabelTypeToString( AMasterLabelType: TMasterLabelType ): string;

implementation

function MapMasterLabelType( AMixedLabelType: string ): TMasterLabelType;
begin
  if AMixedLabelType = 'PALLET LICENSE PLATE' then       Result:= mltPalletLicensePlate
  else if AMixedLabelType = 'PALLET MIXED ITEM LOT' then Result:= mltPalletMixedItemLot
  else if AMixedLabelType = 'PALLET MIXED ITEM' then     Result:= mltPalletMixedItem
  else if AMixedLabelType = 'PALLET MIXED LOT' then      Result:= mltPalletMixedLot
  else if AMixedLabelType = 'PALLET MIXED FGMULTI' then  Result:= mltPalletMixedFGMulti
  else if AMixedLabelType = 'PALLET' then                Result:= mltPallet
  else if AMixedLabelType = 'CASE' then                  Result:= mltCase
  else                                                   Result:= mltUnknown;
end;


function GetMasterLabelType( ASerialNo: string ): TMasterLabelType;
var
  AMaster_Label_ID: Real;
begin
  AMaster_Label_ID:= SelectValueFmtAsFloat('select id from master_label where serial = ''%s'' ', [ ASerialNo ]);
  Result:= GetMasterLabelType( AMaster_Label_ID );
end;


function GetMasterLabelType( AMaster_Label_ID: Real ): TMasterLabelType;
var
  AMixedLabelType: string;
begin
  AMixedLabelType:= SelectValueFmtAsString( 'select RF.get_master_label_type( %f ) from dual', [ AMaster_Label_ID ]);
  Result:= MapMasterLabelType( AMixedLabelType );
end;


function GetParentMasterLabelType( AMaster_Label_ID: Real ): TMasterLabelType;
var
  AParent_Master_Label_ID: Real;
begin
  Result:= mltUnknown;
  AParent_Master_Label_ID:= SelectValueFmtAsFloat('select parent_id from master_label where id = %f', [ AMaster_Label_ID ]);
  if AParent_Master_Label_ID > 0 then
     Result:= GetMasterLabelType( AParent_Master_Label_ID );
end;


function MasterLabelTypeToString( AMasterLabelType: TMasterLabelType ): string;
begin
  Result:= Copy( GetEnumName( TypeInfo( TMasterLabelType ), Ord( AMasterLabelType )), 3, 255 );     // System.TypInfo.pas
end;

end.
