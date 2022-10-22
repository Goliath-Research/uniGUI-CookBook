unit MCQte_b1;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  MCQte_br,
  Data.DB,
  Wwtable,
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
  UniGUIApplication,
  Vcl.Menus,
  Vcl.DBGrids,
  Vcl.Controls, uniMainMenu, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniGUIClasses, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  uniLabel, uniGUIBaseClasses, uniPanel;

type
  TFrmMCQuotePriceBreaks = class(TFrmMCGridBasic)
    QryQUAN: TBCDField;
    QryQPRICE: TFMTBCDField;
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FTableName:String;
    FIDField:String;
    FParentTable:TDataSet;
    FTag: Integer;
    procedure Recalculate;override;
    procedure SetIDField(const Value: String);
    procedure SetParentTable(const Value: TDataSet);
    procedure SetTableName(const Value: String);
    procedure SetTag(const Value: Integer);
  public
    { Public declarations }
    property TableName : String write SetTableName;
    property IDField : String write SetIDField;
    property ParentTable : TDataSet write SetParentTable;
    property Tag : Integer write SetTag;
  end;

procedure DoMCQUOTE_QTY_BREAKS(AID:Real; ATableName, AIDField:String; AParentTable:TDataset);
procedure DoMCQUOTE_QTY_BREAKS_QINVT(AID:Real; ATableName, AIDField:String; AParentTable:TDataset);
procedure DoMCQUOTE_QTY_BREAKS_ARINVT(AID:Real; ATableName, AIDField:String; AParentTable:TDataset);
procedure DoMCQUOTE_QTY_BREAKS_ATT(AID:Real; ATableName, AIDField:String; AParentTable:TDataset);
procedure DoMCQUOTE_QTY_BREAKS_PL(AID:Real; ATableName, AIDField:String; AParentTable:TDataset);

implementation
{$R *.DFM}
uses
  IQMS.Common.MCShare,
  IQMS.Common.NLS;

procedure DoMCQUOTE_QTY_BREAKS(AID:Real; ATableName, AIDField:String; AParentTable:TDataset);
var
  LFrmMCQuotePriceBreaks : TFrmMCQuotePriceBreaks;
begin
  LFrmMCQuotePriceBreaks := TFrmMCQuotePriceBreaks.Create(UniGUIApplication.UniApplication);
  with LFrmMCQuotePriceBreaks do
  begin
    ID := AID;
    TableName := ATableName;
    IDField := AIDField;
    ParentTable := AParentTable;
    Tag := iq_MC_Quote_All_Tag;
    Show;
  end;
end;

procedure DoMCQUOTE_QTY_BREAKS_QINVT(AID:Real; ATableName, AIDField:String; AParentTable:TDataset);
var
  LFrmMCQuotePriceBreaks : TFrmMCQuotePriceBreaks;
begin
  LFrmMCQuotePriceBreaks := TFrmMCQuotePriceBreaks.Create(UniGUIApplication.UniApplication);
  with LFrmMCQuotePriceBreaks do
  begin
    ID := AID;
    TableName := ATableName;
    IDField := AIDField;
    ParentTable := AParentTable;
    Tag := iq_MC_Quote_Qinvt_Tag;
    Show;
  end;
end;

procedure DoMCQUOTE_QTY_BREAKS_ARINVT(AID:Real; ATableName, AIDField:String; AParentTable:TDataset);
var
  LFrmMCQuotePriceBreaks : TFrmMCQuotePriceBreaks;
begin
  LFrmMCQuotePriceBreaks := TFrmMCQuotePriceBreaks.Create(UniGUIApplication.UniApplication);
  with LFrmMCQuotePriceBreaks do
  begin
    ID := AID;
    TableName := ATableName;
    IDField := AIDField;
    ParentTable := AParentTable;
    Tag := iq_MC_Quote_Arinvt_Tag;
    Show;
  end;
end;

procedure DoMCQUOTE_QTY_BREAKS_ATT(AID:Real; ATableName, AIDField:String; AParentTable:TDataset);
var
  LFrmMCQuotePriceBreaks : TFrmMCQuotePriceBreaks;
begin
  LFrmMCQuotePriceBreaks := TFrmMCQuotePriceBreaks.Create(UniGUIApplication.UniApplication);
  with LFrmMCQuotePriceBreaks do
  begin
    ID := AID;
    TableName := ATableName;
    IDField := AIDField;
    ParentTable := AParentTable;
    Tag := iq_MC_Quote_Att_Tag;
    Show;
  end;
end;

procedure DoMCQUOTE_QTY_BREAKS_PL(AID:Real; ATableName, AIDField:String; AParentTable:TDataSet);
var
  LFrmMCQuotePriceBreaks : TFrmMCQuotePriceBreaks;
begin
  LFrmMCQuotePriceBreaks := TFrmMCQuotePriceBreaks.Create(UniGUIApplication.UniApplication);
  with LFrmMCQuotePriceBreaks do
  begin
    ID := AID;
    TableName := ATableName;
    IDField := AIDField;
    ParentTable := AParentTable;
    Tag := iq_MC_Quote_PL_Tag;
    Show;
  end;
end;

procedure TFrmMCQuotePriceBreaks.Recalculate;
begin
  with Qry do
  begin
    Close;
    Sql[2] := Format('from %s', [FTableName]);
    Sql[3] := IQFormat('where %s = %f', [FIDField, FParentTable.FieldByName('ID').asFloat]);
    ParamByName('nFactor').Value := Factor;
    Open;
  end;
end;


procedure TFrmMCQuotePriceBreaks.SetIDField(const Value: String);
begin
  FIDField := Value;
end;

procedure TFrmMCQuotePriceBreaks.SetParentTable(const Value: TDataSet);
begin
  FParentTable := Value;
end;

procedure TFrmMCQuotePriceBreaks.SetTableName(const Value: String);
begin
  FTableName := Value;
end;

procedure TFrmMCQuotePriceBreaks.SetTag(const Value: Integer);
begin
  FTag := Value;
end;

procedure TFrmMCQuotePriceBreaks.UniFormShow(Sender: TObject);
begin
  inherited;
  Recalculate;
end;

end.
