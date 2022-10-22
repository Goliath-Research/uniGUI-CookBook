
{************************************************}
{                                                }
{                XML Data Binding                }
{                                                }
{         Generated on: 8/29/2012 9:55:05 PM     }
{       Generated from: C:\In\ud_arinvt_fg.xml   }
{   Settings stored in: C:\In\ud_arinvt_fg.xdb   }
{                                                }
{************************************************}

unit IQMS.Common.UserFieldsXMLTypes;

interface

uses Xml.XMLDoc, Xml.XMLIntf;

type

{ Forward Decls }

  IXMLUd_formType = interface;
  IXMLUd_tablesType = interface;
  IXMLUd_tables_rowType = interface;
  IXMLUd_colsType = interface;
  IXMLUd_cols_rowType = interface;
  IXMLUd_tabsheetType = interface;
  IXMLUd_tabsheet_rowType = interface;
  IXMLUd_groupboxType = interface;
  IXMLUd_groupbox_rowType = interface;

{ IXMLUd_formType }

  IXMLUd_formType = interface(IXMLNode)
    ['{2F6867C0-01B0-49A7-B0A1-56AB96DD1570}']
    { Property Accessors }
    function Get_Ud_tables: IXMLUd_tablesType;
    function Get_Ud_cols: IXMLUd_colsType;
    function Get_Ud_tabsheet: IXMLUd_tabsheetType;
    { Methods & Properties }
    property Ud_tables: IXMLUd_tablesType read Get_Ud_tables;
    property Ud_cols: IXMLUd_colsType read Get_Ud_cols;
    property Ud_tabsheet: IXMLUd_tabsheetType read Get_Ud_tabsheet;
  end;

{ IXMLUd_tablesType }

  IXMLUd_tablesType = interface(IXMLNode)
    ['{3A1C8F7A-672D-47E0-B5A5-23076B700AEC}']
    { Property Accessors }
    function Get_Ud_tables_row: IXMLUd_tables_rowType;
    { Methods & Properties }
    property Ud_tables_row: IXMLUd_tables_rowType read Get_Ud_tables_row;
  end;

{ IXMLUd_tables_rowType }

  IXMLUd_tables_rowType = interface(IXMLNode)
    ['{46A035B5-4648-47B0-8E9A-B7C3C8A19CB9}']
    { Property Accessors }
    function Get_Id: Integer;
    function Get_Table_name: UnicodeString;
    function Get_Form_caption: UnicodeString;
    function Get_Menu_caption: UnicodeString;
    function Get_Source_attribute: UnicodeString;
    function Get_Source: UnicodeString;
    function Get_Next_id: Integer;
    procedure Set_Id(Value: Integer);
    procedure Set_Table_name(Value: UnicodeString);
    procedure Set_Form_caption(Value: UnicodeString);
    procedure Set_Menu_caption(Value: UnicodeString);
    procedure Set_Source_attribute(Value: UnicodeString);
    procedure Set_Source(Value: UnicodeString);
    procedure Set_Next_id(Value: Integer);
    { Methods & Properties }
    property Id: Integer read Get_Id write Set_Id;
    property Table_name: UnicodeString read Get_Table_name write Set_Table_name;
    property Form_caption: UnicodeString read Get_Form_caption write Set_Form_caption;
    property Menu_caption: UnicodeString read Get_Menu_caption write Set_Menu_caption;
    property Source_attribute: UnicodeString read Get_Source_attribute write Set_Source_attribute;
    property Source: UnicodeString read Get_Source write Set_Source;
    property Next_id: Integer read Get_Next_id write Set_Next_id;
  end;

{ IXMLUd_colsType }

  IXMLUd_colsType = interface(IXMLNodeCollection)
    ['{CB259354-4E03-47FD-9788-96BA8B1CD003}']
    { Property Accessors }
    function Get_Ud_cols_row(Index: Integer): IXMLUd_cols_rowType;
    { Methods & Properties }
    function Add: IXMLUd_cols_rowType;
    function Insert(const Index: Integer): IXMLUd_cols_rowType;
    property Ud_cols_row[Index: Integer]: IXMLUd_cols_rowType read Get_Ud_cols_row; default;
  end;

{ IXMLUd_cols_rowType }

  IXMLUd_cols_rowType = interface(IXMLNode)
    ['{55A456B6-E13F-4D6C-8320-8D688308ACB2}']
    { Property Accessors }
    function Get_Id: Integer;
    function Get_Ud_tables_id: Integer;
    function Get_Col_name: UnicodeString;
    function Get_Col_label: UnicodeString;
    function Get_Col_type: UnicodeString;
    function Get_Seq: Integer;
    function Get_Use_component: UnicodeString;
    function Get_Tab_name: UnicodeString;
    function Get_Col_kind: UnicodeString;
    function Get_Linked_Col_Name: UnicodeString;
    function Get_Sql_text: UnicodeString;
    function Get_Ud_groupbox_id: Integer;
    function Get_Groupbox_seq: Integer;
    function Get_Next_id: Integer;
    procedure Set_Id(Value: Integer);
    procedure Set_Ud_tables_id(Value: Integer);
    procedure Set_Col_name(Value: UnicodeString);
    procedure Set_Col_label(Value: UnicodeString);
    procedure Set_Col_type(Value: UnicodeString);
    procedure Set_Seq(Value: Integer);
    procedure Set_Use_component(Value: UnicodeString);
    procedure Set_Tab_name(Value: UnicodeString);
    procedure Set_Col_kind(Value: UnicodeString);
    procedure Set_Linked_Col_Name(Value: UnicodeString);
    procedure Set_Sql_text(Value: UnicodeString);
    procedure Set_Ud_groupbox_id(Value: Integer);
    procedure Set_Groupbox_seq(Value: Integer);
    procedure Set_Next_id(Value: Integer);
    { Methods & Properties }
    property Id: Integer read Get_Id write Set_Id;
    property Ud_tables_id: Integer read Get_Ud_tables_id write Set_Ud_tables_id;
    property Col_name: UnicodeString read Get_Col_name write Set_Col_name;
    property Col_label: UnicodeString read Get_Col_label write Set_Col_label;
    property Col_type: UnicodeString read Get_Col_type write Set_Col_type;
    property Seq: Integer read Get_Seq write Set_Seq;
    property Use_component: UnicodeString read Get_Use_component write Set_Use_component;
    property Tab_name: UnicodeString read Get_Tab_name write Set_Tab_name;
    property Col_kind: UnicodeString read Get_Col_kind write Set_Col_kind;
    property Linked_Col_Name: UnicodeString read Get_Linked_Col_Name write Set_Linked_Col_Name;
    property Sql_text: UnicodeString read Get_Sql_text write Set_Sql_text;
    property Ud_groupbox_id: Integer read Get_Ud_groupbox_id write Set_Ud_groupbox_id;
    property Groupbox_seq: Integer read Get_Groupbox_seq write Set_Groupbox_seq;
    property Next_id: Integer read Get_Next_id write Set_Next_id;
  end;

{ IXMLUd_tabsheetType }

  IXMLUd_tabsheetType = interface(IXMLNodeCollection)
    ['{6B9E5B73-F810-457A-B0D1-DE7A2C2D928B}']
    { Property Accessors }
    function Get_Ud_tabsheet_row(Index: Integer): IXMLUd_tabsheet_rowType;
    { Methods & Properties }
    function Add: IXMLUd_tabsheet_rowType;
    function Insert(const Index: Integer): IXMLUd_tabsheet_rowType;
    property Ud_tabsheet_row[Index: Integer]: IXMLUd_tabsheet_rowType read Get_Ud_tabsheet_row; default;
  end;

{ IXMLUd_tabsheet_rowType }

  IXMLUd_tabsheet_rowType = interface(IXMLNode)
    ['{F86C2258-0B23-4669-A0D1-7DA279837522}']
    { Property Accessors }
    function Get_Id: Integer;
    function Get_Ud_tables_id: Integer;
    function Get_Name: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_Seq: Integer;
    function Get_Next_id: Integer;
    function Get_Ud_groupbox: IXMLUd_groupboxType;
    procedure Set_Id(Value: Integer);
    procedure Set_Ud_tables_id(Value: Integer);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_Seq(Value: Integer);
    procedure Set_Next_id(Value: Integer);
    { Methods & Properties }
    property Id: Integer read Get_Id write Set_Id;
    property Ud_tables_id: Integer read Get_Ud_tables_id write Set_Ud_tables_id;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Caption: UnicodeString read Get_Caption write Set_Caption;
    property Seq: Integer read Get_Seq write Set_Seq;
    property Next_id: Integer read Get_Next_id write Set_Next_id;
    property Ud_groupbox: IXMLUd_groupboxType read Get_Ud_groupbox;
  end;

{ IXMLUd_groupboxType }

  IXMLUd_groupboxType = interface(IXMLNodeCollection)
    ['{80D1DF1A-E4C4-4179-97F4-6766F154189C}']
    { Property Accessors }
    function Get_Ud_groupbox_row(Index: Integer): IXMLUd_groupbox_rowType;
    { Methods & Properties }
    function Add: IXMLUd_groupbox_rowType;
    function Insert(const Index: Integer): IXMLUd_groupbox_rowType;
    property Ud_groupbox_row[Index: Integer]: IXMLUd_groupbox_rowType read Get_Ud_groupbox_row; default;
  end;

{ IXMLUd_groupbox_rowType }

  IXMLUd_groupbox_rowType = interface(IXMLNode)
    ['{08601456-9F06-4236-B897-E8607A0678DF}']
    { Property Accessors }
    function Get_Id: Integer;
    function Get_Ud_tabsheet_id: Integer;
    function Get_Name: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_Row_num: Integer;
    function Get_Col_num: Integer;
    function Get_Next_id: Integer;
    procedure Set_Id(Value: Integer);
    procedure Set_Ud_tabsheet_id(Value: Integer);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_Row_num(Value: Integer);
    procedure Set_Col_num(Value: Integer);
    procedure Set_Next_id(Value: Integer);
    { Methods & Properties }
    property Id: Integer read Get_Id write Set_Id;
    property Ud_tabsheet_id: Integer read Get_Ud_tabsheet_id write Set_Ud_tabsheet_id;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Caption: UnicodeString read Get_Caption write Set_Caption;
    property Row_num: Integer read Get_Row_num write Set_Row_num;
    property Col_num: Integer read Get_Col_num write Set_Col_num;
    property Next_id: Integer read Get_Next_id write Set_Next_id;
  end;

{ Forward Decls }

  TXMLUd_formType = class;
  TXMLUd_tablesType = class;
  TXMLUd_tables_rowType = class;
  TXMLUd_colsType = class;
  TXMLUd_cols_rowType = class;
  TXMLUd_tabsheetType = class;
  TXMLUd_tabsheet_rowType = class;
  TXMLUd_groupboxType = class;
  TXMLUd_groupbox_rowType = class;

{ TXMLUd_formType }

  TXMLUd_formType = class(TXMLNode, IXMLUd_formType)
  protected
    { IXMLUd_formType }
    function Get_Ud_tables: IXMLUd_tablesType;
    function Get_Ud_cols: IXMLUd_colsType;
    function Get_Ud_tabsheet: IXMLUd_tabsheetType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLUd_tablesType }

  TXMLUd_tablesType = class(TXMLNode, IXMLUd_tablesType)
  protected
    { IXMLUd_tablesType }
    function Get_Ud_tables_row: IXMLUd_tables_rowType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLUd_tables_rowType }

  TXMLUd_tables_rowType = class(TXMLNode, IXMLUd_tables_rowType)
  protected
    { IXMLUd_tables_rowType }
    function Get_Id: Integer;
    function Get_Table_name: UnicodeString;
    function Get_Form_caption: UnicodeString;
    function Get_Menu_caption: UnicodeString;
    function Get_Source_attribute: UnicodeString;
    function Get_Source: UnicodeString;
    function Get_Next_id: Integer;
    procedure Set_Id(Value: Integer);
    procedure Set_Table_name(Value: UnicodeString);
    procedure Set_Form_caption(Value: UnicodeString);
    procedure Set_Menu_caption(Value: UnicodeString);
    procedure Set_Source_attribute(Value: UnicodeString);
    procedure Set_Source(Value: UnicodeString);
    procedure Set_Next_id(Value: Integer);
  end;

{ TXMLUd_colsType }

  TXMLUd_colsType = class(TXMLNodeCollection, IXMLUd_colsType)
  protected
    { IXMLUd_colsType }
    function Get_Ud_cols_row(Index: Integer): IXMLUd_cols_rowType;
    function Add: IXMLUd_cols_rowType;
    function Insert(const Index: Integer): IXMLUd_cols_rowType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLUd_cols_rowType }

  TXMLUd_cols_rowType = class(TXMLNode, IXMLUd_cols_rowType)
  protected
    { IXMLUd_cols_rowType }
    function Get_Id: Integer;
    function Get_Ud_tables_id: Integer;
    function Get_Col_name: UnicodeString;
    function Get_Col_label: UnicodeString;
    function Get_Col_type: UnicodeString;
    function Get_Seq: Integer;
    function Get_Use_component: UnicodeString;
    function Get_Tab_name: UnicodeString;
    function Get_Col_kind: UnicodeString;
    function Get_Linked_Col_Name: UnicodeString;
    function Get_Sql_text: UnicodeString;
    function Get_Ud_groupbox_id: Integer;
    function Get_Groupbox_seq: Integer;
    function Get_Next_id: Integer;
    procedure Set_Id(Value: Integer);
    procedure Set_Ud_tables_id(Value: Integer);
    procedure Set_Col_name(Value: UnicodeString);
    procedure Set_Col_label(Value: UnicodeString);
    procedure Set_Col_type(Value: UnicodeString);
    procedure Set_Seq(Value: Integer);
    procedure Set_Use_component(Value: UnicodeString);
    procedure Set_Tab_name(Value: UnicodeString);
    procedure Set_Col_kind(Value: UnicodeString);
    procedure Set_Linked_Col_Name(Value: UnicodeString);
    procedure Set_Sql_text(Value: UnicodeString);
    procedure Set_Ud_groupbox_id(Value: Integer);
    procedure Set_Groupbox_seq(Value: Integer);
    procedure Set_Next_id(Value: Integer);
  end;

{ TXMLUd_tabsheetType }

  TXMLUd_tabsheetType = class(TXMLNodeCollection, IXMLUd_tabsheetType)
  protected
    { IXMLUd_tabsheetType }
    function Get_Ud_tabsheet_row(Index: Integer): IXMLUd_tabsheet_rowType;
    function Add: IXMLUd_tabsheet_rowType;
    function Insert(const Index: Integer): IXMLUd_tabsheet_rowType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLUd_tabsheet_rowType }

  TXMLUd_tabsheet_rowType = class(TXMLNode, IXMLUd_tabsheet_rowType)
  protected
    { IXMLUd_tabsheet_rowType }
    function Get_Id: Integer;
    function Get_Ud_tables_id: Integer;
    function Get_Name: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_Seq: Integer;
    function Get_Next_id: Integer;
    function Get_Ud_groupbox: IXMLUd_groupboxType;
    procedure Set_Id(Value: Integer);
    procedure Set_Ud_tables_id(Value: Integer);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_Seq(Value: Integer);
    procedure Set_Next_id(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLUd_groupboxType }

  TXMLUd_groupboxType = class(TXMLNodeCollection, IXMLUd_groupboxType)
  protected
    { IXMLUd_groupboxType }
    function Get_Ud_groupbox_row(Index: Integer): IXMLUd_groupbox_rowType;
    function Add: IXMLUd_groupbox_rowType;
    function Insert(const Index: Integer): IXMLUd_groupbox_rowType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLUd_groupbox_rowType }

  TXMLUd_groupbox_rowType = class(TXMLNode, IXMLUd_groupbox_rowType)
  protected
    { IXMLUd_groupbox_rowType }
    function Get_Id: Integer;
    function Get_Ud_tabsheet_id: Integer;
    function Get_Name: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_Row_num: Integer;
    function Get_Col_num: Integer;
    function Get_Next_id: Integer;
    procedure Set_Id(Value: Integer);
    procedure Set_Ud_tabsheet_id(Value: Integer);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_Row_num(Value: Integer);
    procedure Set_Col_num(Value: Integer);
    procedure Set_Next_id(Value: Integer);
  end;

{ Global Functions }

function Getud_form(Doc: IXMLDocument): IXMLUd_formType;
function Loadud_form(const FileName: string): IXMLUd_formType;
function Newud_form: IXMLUd_formType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function Getud_form(Doc: IXMLDocument): IXMLUd_formType;
begin
  Result := Doc.GetDocBinding('ud_form', TXMLUd_formType, TargetNamespace) as IXMLUd_formType;
end;

function Loadud_form(const FileName: string): IXMLUd_formType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('ud_form', TXMLUd_formType, TargetNamespace) as IXMLUd_formType;
end;

function Newud_form: IXMLUd_formType;
begin
  Result := NewXMLDocument.GetDocBinding('ud_form', TXMLUd_formType, TargetNamespace) as IXMLUd_formType;
end;

{ TXMLUd_formType }

procedure TXMLUd_formType.AfterConstruction;
begin
  RegisterChildNode('ud_tables', TXMLUd_tablesType);
  RegisterChildNode('ud_cols', TXMLUd_colsType);
  RegisterChildNode('ud_tabsheet', TXMLUd_tabsheetType);
  inherited;
end;

function TXMLUd_formType.Get_Ud_tables: IXMLUd_tablesType;
begin
  Result := ChildNodes['ud_tables'] as IXMLUd_tablesType;
end;

function TXMLUd_formType.Get_Ud_cols: IXMLUd_colsType;
begin
  Result := ChildNodes['ud_cols'] as IXMLUd_colsType;
end;

function TXMLUd_formType.Get_Ud_tabsheet: IXMLUd_tabsheetType;
begin
  Result := ChildNodes['ud_tabsheet'] as IXMLUd_tabsheetType;
end;

{ TXMLUd_tablesType }

procedure TXMLUd_tablesType.AfterConstruction;
begin
  RegisterChildNode('ud_tables_row', TXMLUd_tables_rowType);
  inherited;
end;

function TXMLUd_tablesType.Get_Ud_tables_row: IXMLUd_tables_rowType;
begin
  Result := ChildNodes['ud_tables_row'] as IXMLUd_tables_rowType;
end;

{ TXMLUd_tables_rowType }

function TXMLUd_tables_rowType.Get_Id: Integer;
begin
  Result := ChildNodes['id'].NodeValue;
end;

procedure TXMLUd_tables_rowType.Set_Id(Value: Integer);
begin
  ChildNodes['id'].NodeValue := Value;
end;

function TXMLUd_tables_rowType.Get_Table_name: UnicodeString;
begin
  Result := ChildNodes['table_name'].Text;
end;

procedure TXMLUd_tables_rowType.Set_Table_name(Value: UnicodeString);
begin
  ChildNodes['table_name'].NodeValue := Value;
end;

function TXMLUd_tables_rowType.Get_Form_caption: UnicodeString;
begin
  Result := ChildNodes['form_caption'].Text;
end;

procedure TXMLUd_tables_rowType.Set_Form_caption(Value: UnicodeString);
begin
  ChildNodes['form_caption'].NodeValue := Value;
end;

function TXMLUd_tables_rowType.Get_Menu_caption: UnicodeString;
begin
  Result := ChildNodes['menu_caption'].Text;
end;

procedure TXMLUd_tables_rowType.Set_Menu_caption(Value: UnicodeString);
begin
  ChildNodes['menu_caption'].NodeValue := Value;
end;

function TXMLUd_tables_rowType.Get_Source_attribute: UnicodeString;
begin
  Result := ChildNodes['source_attribute'].Text;
end;

procedure TXMLUd_tables_rowType.Set_Source_attribute(Value: UnicodeString);
begin
  ChildNodes['source_attribute'].NodeValue := Value;
end;

function TXMLUd_tables_rowType.Get_Source: UnicodeString;
begin
  Result := ChildNodes['source'].Text;
end;

procedure TXMLUd_tables_rowType.Set_Source(Value: UnicodeString);
begin
  ChildNodes['source'].NodeValue := Value;
end;

function TXMLUd_tables_rowType.Get_Next_id: Integer;
begin
  Result := ChildNodes['next_id'].NodeValue;
end;

procedure TXMLUd_tables_rowType.Set_Next_id(Value: Integer);
begin
  ChildNodes['next_id'].NodeValue := Value;
end;

{ TXMLUd_colsType }

procedure TXMLUd_colsType.AfterConstruction;
begin
  RegisterChildNode('ud_cols_row', TXMLUd_cols_rowType);
  ItemTag := 'ud_cols_row';
  ItemInterface := IXMLUd_cols_rowType;
  inherited;
end;

function TXMLUd_colsType.Get_Ud_cols_row(Index: Integer): IXMLUd_cols_rowType;
begin
  Result := List[Index] as IXMLUd_cols_rowType;
end;

function TXMLUd_colsType.Add: IXMLUd_cols_rowType;
begin
  Result := AddItem(-1) as IXMLUd_cols_rowType;
end;

function TXMLUd_colsType.Insert(const Index: Integer): IXMLUd_cols_rowType;
begin
  Result := AddItem(Index) as IXMLUd_cols_rowType;
end;

{ TXMLUd_cols_rowType }

function TXMLUd_cols_rowType.Get_Id: Integer;
begin
  Result := ChildNodes['id'].NodeValue;
end;

procedure TXMLUd_cols_rowType.Set_Id(Value: Integer);
begin
  ChildNodes['id'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Ud_tables_id: Integer;
begin
  Result := ChildNodes['ud_tables_id'].NodeValue;
end;

procedure TXMLUd_cols_rowType.Set_Ud_tables_id(Value: Integer);
begin
  ChildNodes['ud_tables_id'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Col_name: UnicodeString;
begin
  Result := ChildNodes['col_name'].Text;
end;

procedure TXMLUd_cols_rowType.Set_Col_name(Value: UnicodeString);
begin
  ChildNodes['col_name'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Col_label: UnicodeString;
begin
  Result := ChildNodes['col_label'].Text;
end;

procedure TXMLUd_cols_rowType.Set_Col_label(Value: UnicodeString);
begin
  ChildNodes['col_label'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Col_type: UnicodeString;
begin
  Result := ChildNodes['col_type'].Text;
end;

procedure TXMLUd_cols_rowType.Set_Col_type(Value: UnicodeString);
begin
  ChildNodes['col_type'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Seq: Integer;
begin
  Result := ChildNodes['seq'].NodeValue;
end;

procedure TXMLUd_cols_rowType.Set_Seq(Value: Integer);
begin
  ChildNodes['seq'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Use_component: UnicodeString;
begin
  Result := ChildNodes['use_component'].Text;
end;

procedure TXMLUd_cols_rowType.Set_Use_component(Value: UnicodeString);
begin
  ChildNodes['use_component'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Tab_name: UnicodeString;
begin
  Result := ChildNodes['tab_name'].Text;
end;

procedure TXMLUd_cols_rowType.Set_Tab_name(Value: UnicodeString);
begin
  ChildNodes['tab_name'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Col_kind: UnicodeString;
begin
  Result := ChildNodes['col_kind'].Text;
end;

procedure TXMLUd_cols_rowType.Set_Col_kind(Value: UnicodeString);
begin
  ChildNodes['col_kind'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Linked_Col_Name: UnicodeString;
begin
  Result := ChildNodes['linked_col_name'].Text;
end;

procedure TXMLUd_cols_rowType.Set_Linked_Col_Name(Value: UnicodeString);
begin
  ChildNodes['linked_col_name'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Sql_text: UnicodeString;
begin
  Result := ChildNodes['sql_text'].Text;
end;

procedure TXMLUd_cols_rowType.Set_Sql_text(Value: UnicodeString);
begin
  ChildNodes['sql_text'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Ud_groupbox_id: Integer;
begin
  Result := ChildNodes['ud_groupbox_id'].NodeValue;
end;

procedure TXMLUd_cols_rowType.Set_Ud_groupbox_id(Value: Integer);
begin
  ChildNodes['ud_groupbox_id'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Groupbox_seq: Integer;
begin
  Result := ChildNodes['groupbox_seq'].NodeValue;
end;

procedure TXMLUd_cols_rowType.Set_Groupbox_seq(Value: Integer);
begin
  ChildNodes['groupbox_seq'].NodeValue := Value;
end;

function TXMLUd_cols_rowType.Get_Next_id: Integer;
begin
  Result := ChildNodes['next_id'].NodeValue;
end;

procedure TXMLUd_cols_rowType.Set_Next_id(Value: Integer);
begin
  ChildNodes['next_id'].NodeValue := Value;
end;

{ TXMLUd_tabsheetType }

procedure TXMLUd_tabsheetType.AfterConstruction;
begin
  RegisterChildNode('ud_tabsheet_row', TXMLUd_tabsheet_rowType);
  ItemTag := 'ud_tabsheet_row';
  ItemInterface := IXMLUd_tabsheet_rowType;
  inherited;
end;

function TXMLUd_tabsheetType.Get_Ud_tabsheet_row(Index: Integer): IXMLUd_tabsheet_rowType;
begin
  Result := List[Index] as IXMLUd_tabsheet_rowType;
end;

function TXMLUd_tabsheetType.Add: IXMLUd_tabsheet_rowType;
begin
  Result := AddItem(-1) as IXMLUd_tabsheet_rowType;
end;

function TXMLUd_tabsheetType.Insert(const Index: Integer): IXMLUd_tabsheet_rowType;
begin
  Result := AddItem(Index) as IXMLUd_tabsheet_rowType;
end;

{ TXMLUd_tabsheet_rowType }

procedure TXMLUd_tabsheet_rowType.AfterConstruction;
begin
  RegisterChildNode('ud_groupbox', TXMLUd_groupboxType);
  inherited;
end;

function TXMLUd_tabsheet_rowType.Get_Id: Integer;
begin
  Result := ChildNodes['id'].NodeValue;
end;

procedure TXMLUd_tabsheet_rowType.Set_Id(Value: Integer);
begin
  ChildNodes['id'].NodeValue := Value;
end;

function TXMLUd_tabsheet_rowType.Get_Ud_tables_id: Integer;
begin
  Result := ChildNodes['ud_tables_id'].NodeValue;
end;

procedure TXMLUd_tabsheet_rowType.Set_Ud_tables_id(Value: Integer);
begin
  ChildNodes['ud_tables_id'].NodeValue := Value;
end;

function TXMLUd_tabsheet_rowType.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLUd_tabsheet_rowType.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLUd_tabsheet_rowType.Get_Caption: UnicodeString;
begin
  Result := ChildNodes['caption'].Text;
end;

procedure TXMLUd_tabsheet_rowType.Set_Caption(Value: UnicodeString);
begin
  ChildNodes['caption'].NodeValue := Value;
end;

function TXMLUd_tabsheet_rowType.Get_Seq: Integer;
begin
  Result := ChildNodes['seq'].NodeValue;
end;

procedure TXMLUd_tabsheet_rowType.Set_Seq(Value: Integer);
begin
  ChildNodes['seq'].NodeValue := Value;
end;

function TXMLUd_tabsheet_rowType.Get_Next_id: Integer;
begin
  Result := ChildNodes['next_id'].NodeValue;
end;

procedure TXMLUd_tabsheet_rowType.Set_Next_id(Value: Integer);
begin
  ChildNodes['next_id'].NodeValue := Value;
end;

function TXMLUd_tabsheet_rowType.Get_Ud_groupbox: IXMLUd_groupboxType;
begin
  Result := ChildNodes['ud_groupbox'] as IXMLUd_groupboxType;
end;

{ TXMLUd_groupboxType }

procedure TXMLUd_groupboxType.AfterConstruction;
begin
  RegisterChildNode('ud_groupbox_row', TXMLUd_groupbox_rowType);
  ItemTag := 'ud_groupbox_row';
  ItemInterface := IXMLUd_groupbox_rowType;
  inherited;
end;

function TXMLUd_groupboxType.Get_Ud_groupbox_row(Index: Integer): IXMLUd_groupbox_rowType;
begin
  Result := List[Index] as IXMLUd_groupbox_rowType;
end;

function TXMLUd_groupboxType.Add: IXMLUd_groupbox_rowType;
begin
  Result := AddItem(-1) as IXMLUd_groupbox_rowType;
end;

function TXMLUd_groupboxType.Insert(const Index: Integer): IXMLUd_groupbox_rowType;
begin
  Result := AddItem(Index) as IXMLUd_groupbox_rowType;
end;

{ TXMLUd_groupbox_rowType }

function TXMLUd_groupbox_rowType.Get_Id: Integer;
begin
  Result := ChildNodes['id'].NodeValue;
end;

procedure TXMLUd_groupbox_rowType.Set_Id(Value: Integer);
begin
  ChildNodes['id'].NodeValue := Value;
end;

function TXMLUd_groupbox_rowType.Get_Ud_tabsheet_id: Integer;
begin
  Result := ChildNodes['ud_tabsheet_id'].NodeValue;
end;

procedure TXMLUd_groupbox_rowType.Set_Ud_tabsheet_id(Value: Integer);
begin
  ChildNodes['ud_tabsheet_id'].NodeValue := Value;
end;

function TXMLUd_groupbox_rowType.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLUd_groupbox_rowType.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLUd_groupbox_rowType.Get_Caption: UnicodeString;
begin
  Result := ChildNodes['caption'].Text;
end;

procedure TXMLUd_groupbox_rowType.Set_Caption(Value: UnicodeString);
begin
  ChildNodes['caption'].NodeValue := Value;
end;

function TXMLUd_groupbox_rowType.Get_Row_num: Integer;
begin
  Result := ChildNodes['row_num'].NodeValue;
end;

procedure TXMLUd_groupbox_rowType.Set_Row_num(Value: Integer);
begin
  ChildNodes['row_num'].NodeValue := Value;
end;

function TXMLUd_groupbox_rowType.Get_Col_num: Integer;
begin
  Result := ChildNodes['col_num'].NodeValue;
end;

procedure TXMLUd_groupbox_rowType.Set_Col_num(Value: Integer);
begin
  ChildNodes['col_num'].NodeValue := Value;
end;

function TXMLUd_groupbox_rowType.Get_Next_id: Integer;
begin
  Result := ChildNodes['next_id'].NodeValue;
end;

procedure TXMLUd_groupbox_rowType.Set_Next_id(Value: Integer);
begin
  ChildNodes['next_id'].NodeValue := Value;
end;

end.
