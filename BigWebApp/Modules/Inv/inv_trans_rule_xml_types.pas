
{**************************************************************}
{                                                              }
{                       XML Data Binding                       }
{                                                              }
{         Generated on: 5/28/2014 1:09:44 PM                   }
{       Generated from: C:\P4\iqwin\Inv\InvTransRuleStru.xml   }
{     Settings stored in: C:\P4\iqwin\inv\InvTransRuleStru.xdb }
{                                                              }
{**************************************************************}

unit inv_trans_rule_xml_types;

interface

uses
  xmldom,
  XMLDoc,
  XMLIntf;

type

{ Forward Decls }

  IXMLInv_trans_ruleType = interface;
  IXMLRow_ruleType = interface;
  IXMLInv_trans_rule_detailType = interface;
  IXMLRow_detailType = interface;

{ IXMLInv_trans_ruleType }

  IXMLInv_trans_ruleType = interface(IXMLNodeCollection)
    ['{0AA7B916-C66D-48C2-AE5D-BF13069687BB}']
    { Property Accessors }
    function Get_Row_rule(Index: Integer): IXMLRow_ruleType;
    { Methods & Properties }
    function Add: IXMLRow_ruleType;
    function Insert(const Index: Integer): IXMLRow_ruleType;
    property Row_rule[Index: Integer]: IXMLRow_ruleType read Get_Row_rule; default;
  end;

{ IXMLRow_ruleType }

  IXMLRow_ruleType = interface(IXMLNode)
    ['{16D13885-7419-43C0-9271-4A0813DE58BD}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Descrip: UnicodeString;
    function Get_Kind: UnicodeString;
    function Get_Eplant_id: UnicodeString;
    function Get_Division_id: UnicodeString;
    function Get_Source_module: UnicodeString;
    function Get_Inv_move_class_id: UnicodeString;
    function Get_Trouble_locations_id: UnicodeString;
    function Get_Arinvt_group_id: UnicodeString;
    function Get_Wms_inv_group_id: UnicodeString;
    function Get_Inv_trans_rule_detail: IXMLInv_trans_rule_detailType;
    procedure Set_Id(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Descrip(Value: UnicodeString);
    procedure Set_Kind(Value: UnicodeString);
    procedure Set_Eplant_id(Value: UnicodeString);
    procedure Set_Division_id(Value: UnicodeString);
    procedure Set_Source_module(Value: UnicodeString);
    procedure Set_Inv_move_class_id(Value: UnicodeString);
    procedure Set_Trouble_locations_id(Value: UnicodeString);
    procedure Set_Arinvt_group_id(Value: UnicodeString);
    procedure Set_Wms_inv_group_id(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Descrip: UnicodeString read Get_Descrip write Set_Descrip;
    property Kind: UnicodeString read Get_Kind write Set_Kind;
    property Eplant_id: UnicodeString read Get_Eplant_id write Set_Eplant_id;
    property Division_id: UnicodeString read Get_Division_id write Set_Division_id;
    property Source_module: UnicodeString read Get_Source_module write Set_Source_module;
    property Inv_move_class_id: UnicodeString read Get_Inv_move_class_id write Set_Inv_move_class_id;
    property Trouble_locations_id: UnicodeString read Get_Trouble_locations_id write Set_Trouble_locations_id;
    property Arinvt_group_id: UnicodeString read Get_Arinvt_group_id write Set_Arinvt_group_id;
    property Wms_inv_group_id: UnicodeString read Get_Wms_inv_group_id write Set_Wms_inv_group_id;
    property Inv_trans_rule_detail: IXMLInv_trans_rule_detailType read Get_Inv_trans_rule_detail;
  end;

{ IXMLInv_trans_rule_detailType }

  IXMLInv_trans_rule_detailType = interface(IXMLNodeCollection)
    ['{2DE52A37-88EA-4314-94A3-782F5DF05EB1}']
    { Property Accessors }
    function Get_Row_detail(Index: Integer): IXMLRow_detailType;
    { Methods & Properties }
    function Add: IXMLRow_detailType;
    function Insert(const Index: Integer): IXMLRow_detailType;
    property Row_detail[Index: Integer]: IXMLRow_detailType read Get_Row_detail; default;
  end;

{ IXMLRow_detailType }

  IXMLRow_detailType = interface(IXMLNode)
    ['{E024D083-1A92-46E7-874E-998DC7F94F6E}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_Inv_trans_rule_id: UnicodeString;
    function Get_Seq: UnicodeString;
    function Get_Max_locations: UnicodeString;
    function Get_Min_pk_units: UnicodeString;
    function Get_Max_pk_units: UnicodeString;
    function Get_Inv_zone_id: UnicodeString;
    function Get_Location_type_id: UnicodeString;
    function Get_Pk_unit_type: UnicodeString;
    function Get_Loc_status: UnicodeString;
    function Get_Al_inv_zone_id: UnicodeString;
    function Get_Req_qty: UnicodeString;
    function Get_Alloc_partial_case: UnicodeString;
    function Get_Alloc_partial_pallet: UnicodeString;
    function Get_Alloc_partial_lp: UnicodeString;
    function Get_Inv_type: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
    procedure Set_Inv_trans_rule_id(Value: UnicodeString);
    procedure Set_Seq(Value: UnicodeString);
    procedure Set_Max_locations(Value: UnicodeString);
    procedure Set_Min_pk_units(Value: UnicodeString);
    procedure Set_Max_pk_units(Value: UnicodeString);
    procedure Set_Inv_zone_id(Value: UnicodeString);
    procedure Set_Location_type_id(Value: UnicodeString);
    procedure Set_Pk_unit_type(Value: UnicodeString);
    procedure Set_Loc_status(Value: UnicodeString);
    procedure Set_Al_inv_zone_id(Value: UnicodeString);
    procedure Set_Req_qty(Value: UnicodeString);
    procedure Set_Alloc_partial_case(Value: UnicodeString);
    procedure Set_Alloc_partial_pallet(Value: UnicodeString);
    procedure Set_Alloc_partial_lp(Value: UnicodeString);
    procedure Set_Inv_type(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property Inv_trans_rule_id: UnicodeString read Get_Inv_trans_rule_id write Set_Inv_trans_rule_id;
    property Seq: UnicodeString read Get_Seq write Set_Seq;
    property Max_locations: UnicodeString read Get_Max_locations write Set_Max_locations;
    property Min_pk_units: UnicodeString read Get_Min_pk_units write Set_Min_pk_units;
    property Max_pk_units: UnicodeString read Get_Max_pk_units write Set_Max_pk_units;
    property Inv_zone_id: UnicodeString read Get_Inv_zone_id write Set_Inv_zone_id;
    property Location_type_id: UnicodeString read Get_Location_type_id write Set_Location_type_id;
    property Pk_unit_type: UnicodeString read Get_Pk_unit_type write Set_Pk_unit_type;
    property Loc_status: UnicodeString read Get_Loc_status write Set_Loc_status;
    property Al_inv_zone_id: UnicodeString read Get_Al_inv_zone_id write Set_Al_inv_zone_id;
    property Req_qty: UnicodeString read Get_Req_qty write Set_Req_qty;
    property Alloc_partial_case: UnicodeString read Get_Alloc_partial_case write Set_Alloc_partial_case;
    property Alloc_partial_pallet: UnicodeString read Get_Alloc_partial_pallet write Set_Alloc_partial_pallet;
    property Alloc_partial_lp: UnicodeString read Get_Alloc_partial_lp write Set_Alloc_partial_lp;
    property Inv_type: UnicodeString read Get_Inv_type write Set_Inv_type;
  end;

{ Forward Decls }

  TXMLInv_trans_ruleType = class;
  TXMLRow_ruleType = class;
  TXMLInv_trans_rule_detailType = class;
  TXMLRow_detailType = class;

{ TXMLInv_trans_ruleType }

  TXMLInv_trans_ruleType = class(TXMLNodeCollection, IXMLInv_trans_ruleType)
  protected
    { IXMLInv_trans_ruleType }
    function Get_Row_rule(Index: Integer): IXMLRow_ruleType;
    function Add: IXMLRow_ruleType;
    function Insert(const Index: Integer): IXMLRow_ruleType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRow_ruleType }

  TXMLRow_ruleType = class(TXMLNode, IXMLRow_ruleType)
  protected
    { IXMLRow_ruleType }
    function Get_Id: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Descrip: UnicodeString;
    function Get_Kind: UnicodeString;
    function Get_Eplant_id: UnicodeString;
    function Get_Division_id: UnicodeString;
    function Get_Source_module: UnicodeString;
    function Get_Inv_move_class_id: UnicodeString;
    function Get_Trouble_locations_id: UnicodeString;
    function Get_Arinvt_group_id: UnicodeString;
    function Get_Wms_inv_group_id: UnicodeString;
    function Get_Inv_trans_rule_detail: IXMLInv_trans_rule_detailType;
    procedure Set_Id(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Descrip(Value: UnicodeString);
    procedure Set_Kind(Value: UnicodeString);
    procedure Set_Eplant_id(Value: UnicodeString);
    procedure Set_Division_id(Value: UnicodeString);
    procedure Set_Source_module(Value: UnicodeString);
    procedure Set_Inv_move_class_id(Value: UnicodeString);
    procedure Set_Trouble_locations_id(Value: UnicodeString);
    procedure Set_Arinvt_group_id(Value: UnicodeString);
    procedure Set_Wms_inv_group_id(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInv_trans_rule_detailType }

  TXMLInv_trans_rule_detailType = class(TXMLNodeCollection, IXMLInv_trans_rule_detailType)
  protected
    { IXMLInv_trans_rule_detailType }
    function Get_Row_detail(Index: Integer): IXMLRow_detailType;
    function Add: IXMLRow_detailType;
    function Insert(const Index: Integer): IXMLRow_detailType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRow_detailType }

  TXMLRow_detailType = class(TXMLNode, IXMLRow_detailType)
  protected
    { IXMLRow_detailType }
    function Get_Id: UnicodeString;
    function Get_Inv_trans_rule_id: UnicodeString;
    function Get_Seq: UnicodeString;
    function Get_Max_locations: UnicodeString;
    function Get_Min_pk_units: UnicodeString;
    function Get_Max_pk_units: UnicodeString;
    function Get_Inv_zone_id: UnicodeString;
    function Get_Location_type_id: UnicodeString;
    function Get_Pk_unit_type: UnicodeString;
    function Get_Loc_status: UnicodeString;
    function Get_Al_inv_zone_id: UnicodeString;
    function Get_Req_qty: UnicodeString;
    function Get_Alloc_partial_case: UnicodeString;
    function Get_Alloc_partial_pallet: UnicodeString;
    function Get_Alloc_partial_lp: UnicodeString;
    function Get_Inv_type: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
    procedure Set_Inv_trans_rule_id(Value: UnicodeString);
    procedure Set_Seq(Value: UnicodeString);
    procedure Set_Max_locations(Value: UnicodeString);
    procedure Set_Min_pk_units(Value: UnicodeString);
    procedure Set_Max_pk_units(Value: UnicodeString);
    procedure Set_Inv_zone_id(Value: UnicodeString);
    procedure Set_Location_type_id(Value: UnicodeString);
    procedure Set_Pk_unit_type(Value: UnicodeString);
    procedure Set_Loc_status(Value: UnicodeString);
    procedure Set_Al_inv_zone_id(Value: UnicodeString);
    procedure Set_Req_qty(Value: UnicodeString);
    procedure Set_Alloc_partial_case(Value: UnicodeString);
    procedure Set_Alloc_partial_pallet(Value: UnicodeString);
    procedure Set_Alloc_partial_lp(Value: UnicodeString);
    procedure Set_Inv_type(Value: UnicodeString);
  end;

{ Global Functions }

function Getinv_trans_rule(Doc: IXMLDocument): IXMLInv_trans_ruleType;
function Loadinv_trans_rule(const FileName: string): IXMLInv_trans_ruleType;
function Newinv_trans_rule: IXMLInv_trans_ruleType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function Getinv_trans_rule(Doc: IXMLDocument): IXMLInv_trans_ruleType;
begin
  Result := Doc.GetDocBinding('inv_trans_rule', TXMLInv_trans_ruleType, TargetNamespace) as IXMLInv_trans_ruleType;
end;

function Loadinv_trans_rule(const FileName: string): IXMLInv_trans_ruleType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('inv_trans_rule', TXMLInv_trans_ruleType, TargetNamespace) as IXMLInv_trans_ruleType;
end;

function Newinv_trans_rule: IXMLInv_trans_ruleType;
begin
  Result := NewXMLDocument.GetDocBinding('inv_trans_rule', TXMLInv_trans_ruleType, TargetNamespace) as IXMLInv_trans_ruleType;
end;

{ TXMLInv_trans_ruleType }

procedure TXMLInv_trans_ruleType.AfterConstruction;
begin
  RegisterChildNode('row_rule', TXMLRow_ruleType);
  ItemTag := 'row_rule';
  ItemInterface := IXMLRow_ruleType;
  inherited;
end;

function TXMLInv_trans_ruleType.Get_Row_rule(Index: Integer): IXMLRow_ruleType;
begin
  Result := List[Index] as IXMLRow_ruleType;
end;

function TXMLInv_trans_ruleType.Add: IXMLRow_ruleType;
begin
  Result := AddItem(-1) as IXMLRow_ruleType;
end;

function TXMLInv_trans_ruleType.Insert(const Index: Integer): IXMLRow_ruleType;
begin
  Result := AddItem(Index) as IXMLRow_ruleType;
end;

{ TXMLRow_ruleType }

procedure TXMLRow_ruleType.AfterConstruction;
begin
  RegisterChildNode('inv_trans_rule_detail', TXMLInv_trans_rule_detailType);
  inherited;
end;

function TXMLRow_ruleType.Get_Id: UnicodeString;
begin
  Result := ChildNodes['id'].Text;
end;

procedure TXMLRow_ruleType.Set_Id(Value: UnicodeString);
begin
  ChildNodes['id'].NodeValue := Value;
end;

function TXMLRow_ruleType.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLRow_ruleType.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLRow_ruleType.Get_Descrip: UnicodeString;
begin
  Result := ChildNodes['descrip'].Text;
end;

procedure TXMLRow_ruleType.Set_Descrip(Value: UnicodeString);
begin
  ChildNodes['descrip'].NodeValue := Value;
end;

function TXMLRow_ruleType.Get_Kind: UnicodeString;
begin
  Result := ChildNodes['kind'].Text;
end;

procedure TXMLRow_ruleType.Set_Kind(Value: UnicodeString);
begin
  ChildNodes['kind'].NodeValue := Value;
end;

function TXMLRow_ruleType.Get_Eplant_id: UnicodeString;
begin
  Result := ChildNodes['eplant_id'].Text;
end;

procedure TXMLRow_ruleType.Set_Eplant_id(Value: UnicodeString);
begin
  ChildNodes['eplant_id'].NodeValue := Value;
end;

function TXMLRow_ruleType.Get_Division_id: UnicodeString;
begin
  Result := ChildNodes['division_id'].Text;
end;

procedure TXMLRow_ruleType.Set_Division_id(Value: UnicodeString);
begin
  ChildNodes['division_id'].NodeValue := Value;
end;

function TXMLRow_ruleType.Get_Source_module: UnicodeString;
begin
  Result := ChildNodes['source_module'].Text;
end;

procedure TXMLRow_ruleType.Set_Source_module(Value: UnicodeString);
begin
  ChildNodes['source_module'].NodeValue := Value;
end;

function TXMLRow_ruleType.Get_Inv_move_class_id: UnicodeString;
begin
  Result := ChildNodes['inv_move_class_id'].Text;
end;

procedure TXMLRow_ruleType.Set_Inv_move_class_id(Value: UnicodeString);
begin
  ChildNodes['inv_move_class_id'].NodeValue := Value;
end;

function TXMLRow_ruleType.Get_Trouble_locations_id: UnicodeString;
begin
  Result := ChildNodes['trouble_locations_id'].Text;
end;

procedure TXMLRow_ruleType.Set_Trouble_locations_id(Value: UnicodeString);
begin
  ChildNodes['trouble_locations_id'].NodeValue := Value;
end;

function TXMLRow_ruleType.Get_Arinvt_group_id: UnicodeString;
begin
  Result := ChildNodes['arinvt_group_id'].Text;
end;

procedure TXMLRow_ruleType.Set_Arinvt_group_id(Value: UnicodeString);
begin
  ChildNodes['arinvt_group_id'].NodeValue := Value;
end;

function TXMLRow_ruleType.Get_Wms_inv_group_id: UnicodeString;
begin
  Result := ChildNodes['wms_inv_group_id'].Text;
end;

procedure TXMLRow_ruleType.Set_Wms_inv_group_id(Value: UnicodeString);
begin
  ChildNodes['wms_inv_group_id'].NodeValue := Value;
end;

function TXMLRow_ruleType.Get_Inv_trans_rule_detail: IXMLInv_trans_rule_detailType;
begin
  Result := ChildNodes['inv_trans_rule_detail'] as IXMLInv_trans_rule_detailType;
end;

{ TXMLInv_trans_rule_detailType }

procedure TXMLInv_trans_rule_detailType.AfterConstruction;
begin
  RegisterChildNode('row_detail', TXMLRow_detailType);
  ItemTag := 'row_detail';
  ItemInterface := IXMLRow_detailType;
  inherited;
end;

function TXMLInv_trans_rule_detailType.Get_Row_detail(Index: Integer): IXMLRow_detailType;
begin
  Result := List[Index] as IXMLRow_detailType;
end;

function TXMLInv_trans_rule_detailType.Add: IXMLRow_detailType;
begin
  Result := AddItem(-1) as IXMLRow_detailType;
end;

function TXMLInv_trans_rule_detailType.Insert(const Index: Integer): IXMLRow_detailType;
begin
  Result := AddItem(Index) as IXMLRow_detailType;
end;

{ TXMLRow_detailType }

function TXMLRow_detailType.Get_Id: UnicodeString;
begin
  Result := ChildNodes['id'].Text;
end;

procedure TXMLRow_detailType.Set_Id(Value: UnicodeString);
begin
  ChildNodes['id'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Inv_trans_rule_id: UnicodeString;
begin
  Result := ChildNodes['inv_trans_rule_id'].Text;
end;

procedure TXMLRow_detailType.Set_Inv_trans_rule_id(Value: UnicodeString);
begin
  ChildNodes['inv_trans_rule_id'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Seq: UnicodeString;
begin
  Result := ChildNodes['seq'].Text;
end;

procedure TXMLRow_detailType.Set_Seq(Value: UnicodeString);
begin
  ChildNodes['seq'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Max_locations: UnicodeString;
begin
  Result := ChildNodes['max_locations'].Text;
end;

procedure TXMLRow_detailType.Set_Max_locations(Value: UnicodeString);
begin
  ChildNodes['max_locations'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Min_pk_units: UnicodeString;
begin
  Result := ChildNodes['min_pk_units'].Text;
end;

procedure TXMLRow_detailType.Set_Min_pk_units(Value: UnicodeString);
begin
  ChildNodes['min_pk_units'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Max_pk_units: UnicodeString;
begin
  Result := ChildNodes['max_pk_units'].Text;
end;

procedure TXMLRow_detailType.Set_Max_pk_units(Value: UnicodeString);
begin
  ChildNodes['max_pk_units'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Inv_zone_id: UnicodeString;
begin
  Result := ChildNodes['inv_zone_id'].Text;
end;

procedure TXMLRow_detailType.Set_Inv_zone_id(Value: UnicodeString);
begin
  ChildNodes['inv_zone_id'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Location_type_id: UnicodeString;
begin
  Result := ChildNodes['location_type_id'].Text;
end;

procedure TXMLRow_detailType.Set_Location_type_id(Value: UnicodeString);
begin
  ChildNodes['location_type_id'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Pk_unit_type: UnicodeString;
begin
  Result := ChildNodes['pk_unit_type'].Text;
end;

procedure TXMLRow_detailType.Set_Pk_unit_type(Value: UnicodeString);
begin
  ChildNodes['pk_unit_type'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Loc_status: UnicodeString;
begin
  Result := ChildNodes['loc_status'].Text;
end;

procedure TXMLRow_detailType.Set_Loc_status(Value: UnicodeString);
begin
  ChildNodes['loc_status'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Al_inv_zone_id: UnicodeString;
begin
  Result := ChildNodes['al_inv_zone_id'].Text;
end;

procedure TXMLRow_detailType.Set_Al_inv_zone_id(Value: UnicodeString);
begin
  ChildNodes['al_inv_zone_id'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Req_qty: UnicodeString;
begin
  Result := ChildNodes['req_qty'].Text;
end;

procedure TXMLRow_detailType.Set_Req_qty(Value: UnicodeString);
begin
  ChildNodes['req_qty'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Alloc_partial_case: UnicodeString;
begin
  Result := ChildNodes['alloc_partial_case'].Text;
end;

procedure TXMLRow_detailType.Set_Alloc_partial_case(Value: UnicodeString);
begin
  ChildNodes['alloc_partial_case'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Alloc_partial_pallet: UnicodeString;
begin
  Result := ChildNodes['alloc_partial_pallet'].Text;
end;

procedure TXMLRow_detailType.Set_Alloc_partial_pallet(Value: UnicodeString);
begin
  ChildNodes['alloc_partial_pallet'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Alloc_partial_lp: UnicodeString;
begin
  Result := ChildNodes['alloc_partial_lp'].Text;
end;

procedure TXMLRow_detailType.Set_Alloc_partial_lp(Value: UnicodeString);
begin
  ChildNodes['alloc_partial_lp'].NodeValue := Value;
end;

function TXMLRow_detailType.Get_Inv_type: UnicodeString;
begin
  Result := ChildNodes['inv_type'].Text;
end;

procedure TXMLRow_detailType.Set_Inv_type(Value: UnicodeString);
begin
  ChildNodes['inv_type'].NodeValue := Value;
end;

end.
