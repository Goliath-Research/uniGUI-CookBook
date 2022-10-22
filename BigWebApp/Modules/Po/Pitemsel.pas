unit PItemSel;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  System.Variants,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  PO_DM,
  Item_sel,
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
  uniGUIApplication,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniButton, uniEdit, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniGUIClasses, uniRadioButton,
  uniGUIBaseClasses, uniPanel;

type
  TFrmItemChoose = class(TFrmItemSelect)
    procedure EditMisc_ItemChange(Sender: TObject);override;
    procedure ButtonOkClick(Sender: TObject);override;
  private
    { Private declarations }
    function DM:TDM_PO;
    function GetTable: TDataSet; override;
    function GetPKAiInvt:TIQWebHPick;override;
    function GetPKAkA:TIQWebHPick;override;
    function GetArCustoId:Real;override;
    function GetSql(nId:Real):String;override;
  public
    { Public declarations }
  end;

procedure SelectPOItem(cMenuItem:String; MainForm:TComponent);

implementation
{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS;
  { TODO -oMugdha -cWEBIQ : Dependency on PoMain
  PoMain;}

procedure SelectPOItem(cMenuItem:String; MainForm:TComponent);
 var
  LFrmItemChoose : TFrmItemChoose;
begin
  //with TFrmItemChoose.Create(MainForm, cMenuItem) do
  LFrmItemChoose := TFrmItemChoose.Create(uniGUIApplication.UniApplication);
  with LFrmItemChoose do
  begin
    ShowModal;
  end;
end;

function TFrmItemChoose.DM:TDM_PO;
begin
{ TODO -oMugdha -cWEBIQ : Dependency on PoMain
  Result := TFrmPo(Owner).DM;}
end;

function TFrmItemChoose.GetTable: TDataSet;
begin
{ TODO -oMugdha -cWEBIQ : Dependency on PoMain
  Result := TFrmPo(Owner).DM.TblPoDetail; }
end;

function TFrmItemChoose.GetPKAiInvt:TIQWebHPick;
begin
{ TODO -oMugdha -cWEBIQ : Dependency on PoMain
  Result := TFrmPo(Owner).DM.PkArInvt;}
end;

function TFrmItemChoose.GetPKAkA:TIQWebHPick;
begin
{ TODO -oMugdha -cWEBIQ : Dependency on PoMain
  Result := TFrmPo(Owner).DM.PkAkA; }
end;


procedure TFrmItemChoose.EditMisc_ItemChange(Sender: TObject);
begin
  ButtonOk.Enabled := True;
end;

function TFrmItemChoose.GetArCustoId:Real;
begin
{ TODO -oMugdha -cWEBIQ : Dependency on PoMain
    Result := TFrmPo(Owner).DM.QryPOVENDOR_ID.asFloat; }
end;

function TFrmItemChoose.GetSql(nId:Real):String;
begin
  Result := IQFormat('select v.vend_itemno, v.vend_descrip, v.arinvt_id, a.eplant_id ' +
                    ' from arinvt_vendors v, arinvt a where a.id = v.arinvt_id and v.vendor_id = %f', [nId]);
end;

procedure TFrmItemChoose.ButtonOkClick(Sender: TObject);
var
  ID: Real;
  A : Variant;
  AUom:  String;
begin
  inherited;

  with Table do
    if FieldByName('ARINVT_ID').asFloat <> 0 then
    begin
      //ID:= SelectValueAsFloat(Format('select acct_id_inv from arinvt where id = %f', [Table.FieldByName('ARINVT_ID').asFloat]));
      //if ID > 0 then
      //  Table.FieldByName('GLACCT_ID_INV').asFloat := ID;
      A:= SelectValueArrayFmt( 'select NVL(acct_id_inv,0), NVL(unit, ''EACH''), eplant_id from arinvt where id = %f',
                         [ FieldByName('ARINVT_ID').asFloat ]);
      if VarArrayDimCount( A ) > 0 then
      begin
        if A[ 0 ] > 0 then
           FieldByName('GLACCT_ID_INV').asFloat:= A[ 0 ];

        FieldByName('UNIT').asString:= A[ 1 ];
        if A[ 2 ] > 0 then
           FieldByName('EPLANT_ID').asFloat:= A[ 2 ];
      end;

      AUom := SelectValueFmtAsString('select uom from arinvt_uom_conv where arinvt_id = %f and NVL(default_po, ''N'') = ''Y''',
                       [FieldByName('ARINVT_ID').asFloat]);

      if AUom <> '' then
        FieldByName('UNIT').asString:= AUom;

    end;
end;

end.

