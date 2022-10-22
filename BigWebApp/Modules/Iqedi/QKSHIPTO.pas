unit QkShipTo;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.QuickAddBase,
  Data.DB,
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
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniPageControl, uniButton;

type
  TFrmQkShipTo = class(TQuickAddBase)
    Table1ID: TBCDField;
    Table1ARCUSTO_ID: TBCDField;
    Table1ATTN: TStringField;
    Table1ADDR1: TStringField;
    Table1ADDR2: TStringField;
    Table1ADDR3: TStringField;
    Table1CITY: TStringField;
    Table1STATE: TStringField;
    Table1COUNTRY: TStringField;
    Table1ZIP: TStringField;
    Table1SHIP_TIME: TBCDField;
    Table1TAX_CODE_ID: TBCDField;
    Table1PHONE_NUMBER: TStringField;
    Table1EXT: TStringField;
    Table1FAX: TStringField;
    Table1PRIME_CONTACT: TStringField;
    Table1FREIGHT_ID: TBCDField;
    Table1NOTES: TStringField;
    IQScrollBox1: TUniScrollBox;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label10: TUniLabel;
    Label13: TUniLabel;
    Label9: TUniLabel;
    Label11: TUniLabel;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    DBEdit6: TUniDBEdit;
    dbcState: TUniDBComboBox;
    DBEdit9: TUniDBEdit;
    DBEdit8: TUniDBEdit;
    DBEdit10: TUniDBEdit;
    DBEdit11: TUniDBEdit;
    DBEdit13: TUniDBEdit;
    procedure FormShow(Sender: TObject);
  private
    FID: Real;
    procedure SetID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property ID : Real write SetID;
  end;

function DoQuickAppendShipTo( var AResultValue : Variant; AID:Real ): TModalResult;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls, uniGUIApplication;

function DoQuickAppendShipTo( var AResultValue : Variant; AID:Real ): TModalResult;
var
  LFrmQkShipTo : TFrmQkShipTo;
begin
  LFrmQkShipTo := TFrmQkShipTo.Create(UniGUIApplication.UniApplication);
  with LFrmQkShipTo do
  begin
    ID := AID;
    Result:= ShowModal;
    if Result = mrOK then
      AResultValue:= ResultValue;
  end;
end;

procedure TFrmQkShipTo.FormShow(Sender: TObject);
begin
  inherited;
  Table1.FieldByName('ARCUSTO_ID').asFloat := FID;
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
  IQScrollBox1.VertScrollBar.Position := 0;
end;

procedure TFrmQkShipTo.SetID(const Value: Real);
begin
  FID := Value;
end;

end.
