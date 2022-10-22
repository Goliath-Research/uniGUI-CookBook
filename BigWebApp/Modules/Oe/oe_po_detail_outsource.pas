unit oe_po_detail_outsource;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmOE_PO_Detail_Outsource = class(TUniForm)
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    wwDBGrid1: TIQUniGridControl;
    FDQuery1ID: TBCDField;
    FDQuery1PO_DETAIL_ID: TBCDField;
    FDQuery1SOURCE: TStringField;
    FDQuery1ARCUSTO_ID: TBCDField;
    FDQuery1VENDOR_ID: TBCDField;
    FDQuery1ARINVT_ID: TBCDField;
    FDQuery1PARTNO_ID: TBCDField;
    FDQuery1QUAN: TFMTBCDField;
    FDQuery1IN_TRANSIT_QUAN: TFMTBCDField;
    FDQuery1PROMISE_DATE: TDateTimeField;
    FDQuery1PONO: TStringField;
    FDQuery1PO_ID: TBCDField;
    FDQuery1PARENT_ARINVT_ID: TBCDField;
    FDQuery1ITEMNO: TStringField;
    FDQuery1DESCRIP: TStringField;
    FDQuery1DESCRIP2: TStringField;
    FDQuery1REV: TStringField;
    FDQuery1CLASS: TStringField;
    PopupMenu1: TUniPopupMenu;
    JumpToParentItem1: TUniMenuItem;
    JumpToPO1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    IQJumpPO: TIQWebJump;
    FDQueryByArinvt: TFDQuery;
    FDQueryByArinvtPONO: TStringField;
    FDQueryByArinvtSOURCE: TStringField;
    FDQueryByArinvtQUAN: TFMTBCDField;
    FDQueryByArinvtIN_TRANSIT_QUAN: TFMTBCDField;
    FDQueryByArinvtPROMISE_DATE: TDateTimeField;
    FDQueryByArinvtITEMNO: TStringField;
    FDQueryByArinvtDESCRIP: TStringField;
    FDQueryByArinvtREV: TStringField;
    FDQueryByArinvtCLASS: TStringField;
    FDQueryByArinvtDESCRIP2: TStringField;
    FDQueryByArinvtID: TBCDField;
    FDQueryByArinvtPO_DETAIL_ID: TBCDField;
    FDQueryByArinvtARCUSTO_ID: TBCDField;
    FDQueryByArinvtVENDOR_ID: TBCDField;
    FDQueryByArinvtARINVT_ID: TBCDField;
    FDQueryByArinvtPARTNO_ID: TBCDField;
    FDQueryByArinvtPO_ID: TBCDField;
    FDQueryByArinvtPARENT_ARINVT_ID: TBCDField;
    FDQuery1ORDERNO: TStringField;
    FDQueryByArinvtORDERNO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDQuery1BeforeOpen(DataSet: TDataSet);
    procedure JumpToParentItem1Click(Sender: TObject);
    procedure JumpToPO1Click(Sender: TObject);
    procedure FDQueryByArinvtBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FSource: string;
    FSource_ID: integer;
    procedure SetFSource(const Value: string);
  public
    { Public declarations }
    property Source : string read FSource write SetFSource;
    property Source_ID : integer read FSource_ID write FSource_ID;
    class procedure DoShow(  AOrd_Detail_ID: Integer );  overload;
    class procedure DoShow(   ASource: string; ASource_ID: Integer ); overload;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  oe_rscstr;

{ TFrmOE_PO_Detail_Outsource }


class procedure TFrmOE_PO_Detail_Outsource.DoShow(  AOrd_Detail_ID: Integer);
begin
  with TFrmOE_PO_Detail_Outsource.Create(uniGUIApplication.UniApplication) do
    begin
      Source_ID := AOrd_Detail_ID;
      Source := 'ORD_DETAIL';
      ShowModal;
    end;
end;

class procedure TFrmOE_PO_Detail_Outsource.DoShow(   ASource: string; ASource_ID: Integer );
begin
  with TFrmOE_PO_Detail_Outsource.Create(uniGUIApplication.UniApplication) do
    begin
      Source_ID := ASource_ID;
      Source := ASource;
      ShowModal;
    end;
end;

procedure TFrmOE_PO_Detail_Outsource.FDQuery1BeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('ord_detail_id').asInteger:= FSource_ID;
end;

procedure TFrmOE_PO_Detail_Outsource.FDQueryByArinvtBeforeOpen(
  DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('arinvt_id').asInteger:= FSource_ID;
end;

procedure TFrmOE_PO_Detail_Outsource.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
  Action:= caFree;
end;

procedure TFrmOE_PO_Detail_Outsource.JumpToParentItem1Click(Sender: TObject);
begin
  IQJumpInv.Execute
end;

procedure TFrmOE_PO_Detail_Outsource.JumpToPO1Click(Sender: TObject);
begin
  IQJumpPO.Execute
end;

procedure TFrmOE_PO_Detail_Outsource.SetFSource(const Value: string);
var
  A: Variant;
begin
  FSource:=value;

  if FSource = 'ORD_DETAIL' then
     DataSource1.DataSet:= FDQuery1
  else
     DataSource1.DataSet:= FDQueryByArinvt;

  IQSetTablesActive( TRUE, self );

  if FSource = 'ORD_DETAIL' then
  begin
    A:= SelectValueArrayFmt('select o.orderno, a.itemno from ord_detail d, orders o, arinvt a where d.id = %d and d.arinvt_id = a.id and d.orders_id = o.id',
        [ FSource_ID ]);
    // cTXT0000160 = 'Outsource details for OE# %s, Item# %s';
    if VarArrayDimCount( A ) > 0 then
       Caption:= Format(cTXT0000160, [A[ 0 ], A[ 1 ]]);
  end;
end;

end.
