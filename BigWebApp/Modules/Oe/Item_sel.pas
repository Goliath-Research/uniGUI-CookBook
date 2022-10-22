unit Item_Sel;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  //DM_OR,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniComboBox, uniDBComboBox;

type
  TFrmItemSelect = class(TUniForm)
    wwQuery1: TFDQuery;
    wwQuery1CLASS: TStringField;
    wwQuery1DESCRIP: TStringField;
    Panel1: TUniPanel;
    Bevel1: TUniPanel;
    RadioButton1: TUniRadioButton;
    wwClass: TUniDBLookupComboBox;
    RadioButton2: TUniRadioButton;
    EditMisc_Item: TUniEdit;
    RadioButton3: TUniRadioButton;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    ButtonCancel: TUniButton;
    ButtonOk: TUniButton;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);virtual;
    procedure RadioButton1Click(Sender: TObject);
    procedure EditMisc_ItemChange(Sender: TObject);virtual;
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  protected
    function GetTable: TDataSet;virtual;
    function GetArCustoId:Real;virtual;
    function GetPKAiInvt:TIQWebHPick;virtual;
    function GetPKAkA:TIQWebHPick;virtual;
    function GetSql(nId:Real):String;virtual;
  private
    FMenuItem: string;
    { Private declarations }
    //function DM:TOE_DM;
    procedure SetMenuItem(const Value: string);
  public
    cOldMisc_Item:String;
    nArInv_Id:Real;
    cSender:String;
    cItemKind:String;
    lOk:Boolean;
    //constructor Create( AOwner : TComponent; const cMenuItem : string );virtual;
    procedure SetGridFocus;virtual;
    property Table: TDataSet read GetTable;
    property PkArInvt:TIQWebHPick read GetPKAiInvt;
    property PkAkA:TIQWebHPick read GetPKAkA;
    property MenuItem :string read FMenuItem write SetMenuItem;
    { Public declarations }
  end;

function ChooseItem(cMenuItem:String; MainForm:TComponent):Boolean;


implementation

uses
  IQMS.Common.DataLib,
  //Oe_main,
  IQMS.Common.NLS;

{$R *.DFM}

function ChooseItem(cMenuItem:String; MainForm:TComponent):Boolean;
begin
  with TFrmItemSelect.Create(UniGUIApplication.UniApplication) do
  try
    lOk := False;
    ShowModal;
    SetGridFocus;
  finally
    Free;
    Screen.Cursor:= crDefault;
  end;
end;


procedure TFrmItemSelect.SetGridFocus;
begin
  if lOk then
  begin
    //TFrmMainOrder(Owner).iqdbgOrders.SetFocus;
    //TFrmMainOrder(Owner).iqdbgOrders.SelectedIndex := 3;
  end
  //else TFrmMainOrder(Owner).iqdbgOrders.SelectedIndex := 3;
end;

procedure TFrmItemSelect.SetMenuItem(const Value: string);
begin
  FMenuItem := Value;
end;

procedure TFrmItemSelect.UniFormCreate(Sender: TObject);
begin
 inherited;
  wwQuery1.Open;
  wwClass.Text := wwQuery1.FieldByName('CLASS').asString;
//  RadioGroup1.ItemIndex := 0;
  cOldMisc_Item      := Self.Table.FieldByName('MiSc_Item').asString;
  nArInv_Id          := Self.Table.FieldByName('Arinvt_Id').asFloat;
  EditMisc_Item.Text := cOldMisc_Item;
  //cItemKind := ;
end;

//constructor TFrmItemSelect.Create(AOwner : TComponent; const cMenuItem : string);
//begin
//  inherited Create(AOwner);
//  wwQuery1.Open;
//  wwClass.Text := wwQuery1.FieldByName('CLASS').asString;
////  RadioGroup1.ItemIndex := 0;
//  cOldMisc_Item      := Self.Table.FieldByName('MiSc_Item').asString;
//  nArInv_Id          := Self.Table.FieldByName('Arinvt_Id').asFloat;
//  EditMisc_Item.Text := cOldMisc_Item;
//  cItemKind := cMenuItem;
//end;

//function TFrmItemSelect.DM:TOE_DM;
//begin
//  Result := TFrmMainOrder(Owner).DM;
//end;

function TFrmItemSelect.GetTable: TDataSet;
begin
  //Result := TFrmMainOrder(Owner).DM.TblORD_DETAIL;
end;

function TFrmItemSelect.GetPKAiInvt:TIQWebHPick;
begin
  //Result := TFrmMainOrder(Owner).DM.PkArInvt;
end;

function TFrmItemSelect.GetPKAkA:TIQWebHPick;
begin
  //Result := TFrmMainOrder(Owner).DM.PkAkA;
end;



procedure TFrmItemSelect.ButtonCancelClick(Sender: TObject);
begin
  if not Self.Table.FieldByName('ArInvt_ID').ReadOnly then
  begin
    Self.Table.FieldByName('MiSc_Item').asString := cOldMisc_Item;
    if nArInv_Id = 0 then
      Self.Table.FieldByName('ArInvt_ID').AsString := ''
    else
      Self.Table.FieldByName('Arinvt_Id').asFloat := nArInv_Id;
  end;
  Close;
end;

procedure TFrmItemSelect.ButtonOkClick(Sender: TObject);
var
  cValue, cSql:String;
  nArcustoId:Real;
  AOrderCurrId   : Real;
begin
  if Self.Table.FieldByName('ArInvt_ID').ReadOnly then
    raise Exception.Create('Cannot change item, probably since the item has shipments against it.');
  if RadioButton1.Checked then
  begin
    cSql := Format('Select ITEMNO, DESCRIP, DESCRIP2, REV, CLASS, ID, ECODE, EPlant_ID, Pk_Hide ' +
                   'from Arinvt where CLASS = ''%s''', [wwClass.Text]);


//    case RadioGroup1.ItemIndex of
//      0: cSql := 'Select ITEMNO, DESCRIP, DESCRIP2, REV, CLASS, ID, ECODE, EPlant_ID from Arinvt where CLASS = ''FG''';
//      1: cSql := 'Select ITEMNO, DESCRIP, DESCRIP2, REV, CLASS, ID, ECODE, EPlant_ID from Arinvt where CLASS = ''PK''';
//      2: cSql := 'Select ITEMNO, DESCRIP, DESCRIP2, REV, CLASS, ID, ECODE, EPlant_ID from Arinvt where CLASS = ''IN''';
//      3: cSql := 'Select ITEMNO, DESCRIP, DESCRIP2, REV, CLASS, ID, ECODE, EPlant_ID from Arinvt where CLASS = ''PL''';
//      4: cSql := 'Select ITEMNO, DESCRIP, DESCRIP2, REV, CLASS, ID, ECODE, EPlant_ID from Arinvt';
//    end;
    with PkArInvt do
    begin
      Sql.Clear;
      Sql.Add(cSql);
      if Execute then
      begin
        AOrderCurrId := 0;
        if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
          AOrderCurrId := SelectValueFmtAsFloat('select currency_id from orders where id = %f', [Self.Table.FieldByName('orders_id').asFloat]);


        Self.Table.FieldByName('MiSc_Item').asString := '';
        Self.Table.FieldByName('ArInvt_ID').asFloat := GetValue('ID');
        Self.Table.FieldByName('Unit_Price').asFloat :=
          GetPriceBreak( Self.Table.FieldByName('Total_Qty_Ord').AsFloat,
                         Self.Table.FieldByName('Arinvt_ID').AsFloat,
                         'ARINVT_ID',
                         'ARINVT_BREAKS', 'N', AOrderCurrId);
        if Self.Table.FieldByName('Unit_Price').asFloat = 0 then
           Self.Table.FieldByName('Unit_Price').asFloat:=
             SelectValueAsFloat( IQFormat('select std_price from arinvt where id = %f',
               [ Self.Table.FieldByName('Arinvt_ID').asFloat ]));

        lOk := True;
        Self.Close;
      end;
    end;
  end;
  if RadioButton2.Checked then
  begin
    Self.Table.FieldByName('ArInvt_ID').AsString := '';
    Self.Table.FieldByName('MiSc_Item').asString := EditMisc_Item.Text;
    if not (EditMisc_Item.Text = cOldMisc_Item) then
      Self.Table.FieldByName('Unit_Price').asFloat := 0;
    lOk := True;
    Self.Close;
  end;

  if RadioButton3.Checked then
  begin
    nArCustoId := GetArCustoId;
    cSql := GetSql(nArCustoId);
    with PkAka do
    begin
      Sql.Clear;
      Sql.Add(cSql);
      if Execute then
      begin
        AOrderCurrId := 0;
        if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
          AOrderCurrId := SelectValueFmtAsFloat('select currency_id from orders where id = %f', [Self.Table.FieldByName('orders_id').asFloat]);

        Self.Table.FieldByName('MiSc_Item').asString := '';
        Self.Table.FieldByName('ArInvt_ID').asFloat := GetValue('ARINVT_ID');
        Self.Table.FieldByName('Unit_Price').asFloat :=
          GetPriceBreak( Self.Table.FieldByName('Total_Qty_Ord').asFloat,
                         Self.Table.FieldByName('Arinvt_ID').asFloat,
                         'ARINVT_ID',
                         'ARINVT_BREAKS', 'N', AOrderCurrId);
        if Self.Table.FieldByName('Unit_Price').asFloat = 0 then
           Self.Table.FieldByName('Unit_Price').asFloat:=
             SelectValueAsFloat( IQFormat('select std_price from arinvt where id = %f',
               [ Self.Table.FieldByName('Arinvt_ID').asFloat ]));

        lOk := True;
        Self.Close;
      end;
    end;
  end;
end;


function TFrmItemSelect.GetArCustoId:Real;
begin
    //Result := TFrmMainOrder(Owner).DM.TblOrdersARCUSTO_ID.AsFloat;
end;

function TFrmItemSelect.GetSql(nId:Real):String;
begin
  Result := IQFormat('select k.cust_itemno, k.cust_descrip, k.arinvt_id, a.eplant_id from aka k, arinvt a '+
                   ' where a.id = k.arinvt_id and k.arcusto_id = %f', [ nId ]);
end;


procedure TFrmItemSelect.RadioButton1Click(Sender: TObject);
begin
  with EditMisc_Item do
  begin
    Enabled         := Sender = RadioButton2;
    wwClass.Enabled := RadioButton1.Checked;
//    RadioGroup1.Enabled := RadioButton1.Checked;
    if Enabled then
    begin
     Color:= clWindow;
     EditMisc_Item.SetFocus;
    end
    else
     Color:= clBtnFace;
  end;
  EditMisc_ItemChange(Sender);
end;

procedure TFrmItemSelect.EditMisc_ItemChange(Sender: TObject);
begin
  ButtonOk.Enabled:= RadioButton3.Checked or RadioButton1.Checked or
                    RadioButton2.Checked and (Trim(EditMISC_ITEM.Text) <> '');
end;

procedure TFrmItemSelect.FormShow(Sender: TObject);
begin
  If cItemKind = 'NEW' then
  begin
    RadioButton1Click(self);
    exit;
  end;
  If cItemKind = 'AKA' then
  begin
    RadioButton3.Checked := True;
    exit;
  end;
  If cItemKind = 'MISC' then
  begin
    RadioButton2.Checked  := True;
    EditMisc_Item.SetFocus;
    exit;
  end;


end;

end.
