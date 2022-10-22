unit inv_alternate_items_pk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  inv_alternate_items,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Jump,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  uniGUIApplication,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, Vcl.ExtCtrls, uniMainMenu, IQUniGrid, Vcl.Forms, uniGUIFrame;

type
  TFrmInvAlternateItemsPk = class(TFrmInvAlternateItems)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure btnOKClick(Sender: TObject);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FAlternate_Item_Code_ID: Real;
    procedure SetAlternate_Item_Code_ID(const Value: real);
  public
    { Public declarations }
    //constructor Create(AOwner: TComponent; AArinvt_ID, AAlternate_Item_Code_ID: Real);
    class function DoShowModal(AArinvt_ID: Real; var AArinvt_Alternate_ID: Real; AAlternate_Item_Code_ID: Real = 0): Boolean;
    property Alternate_Item_Code_ID: real write SetAlternate_Item_Code_ID;

  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.Miscellaneous,IQMS.Common.DataLib;

{
constructor TFrmInvAlternateItemsPk.Create(AOwner: TComponent; AArinvt_ID, AAlternate_Item_Code_ID: Real);
begin
  FAlternate_Item_Code_ID:= AAlternate_Item_Code_ID;
  inherited Create(AOwner, AArinvt_ID);
end;
}
class function TFrmInvAlternateItemsPk.DoShowModal(AArinvt_ID: Real; var AArinvt_Alternate_ID: Real; AAlternate_Item_Code_ID: Real = 0): Boolean;
var
   lFrmInvAlternateItemsPk : TFrmInvAlternateItemsPk;
begin
  lFrmInvAlternateItemsPk := TFrmInvAlternateItemsPk.Create(uniGUIApplication.UniApplication);
  lFrmInvAlternateItemsPk.Alternate_Item_Code_ID:= AAlternate_Item_Code_ID;
  lFrmInvAlternateItemsPk.Arinvt_ID:=AArinvt_ID;
  Result:= lFrmInvAlternateItemsPk.ShowModal = mrOK;
  if Result then
     AArinvt_Alternate_ID:= lFrmInvAlternateItemsPk.wwQuery1ID.asFloat;

end;


procedure TFrmInvAlternateItemsPk.SetAlternate_Item_Code_ID(const Value: real);
begin
  FAlternate_Item_Code_ID := Value;
end;

procedure TFrmInvAlternateItemsPk.UniFormShow(Sender: TObject);
begin
  inherited;
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmInvAlternateItemsPk.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
   AssignQueryParamValue(DataSet, 'alternate_item_code_id', FAlternate_Item_Code_ID);
   AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID);
end;

procedure TFrmInvAlternateItemsPk.btnOKClick(Sender: TObject);
begin
  IQAssert( not (wwQuery1.Eof and wwQuery1.Bof), 'Nothing is selected - operation aborted.' );
  ModalResult:= mrOK;
end;

end.
