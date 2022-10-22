unit Q_Labor;

interface

uses
  Winapi.Windows,
  System.Classes,
  BOM_Labor,
  Data.DB,
  Vcl.Wwdatsrc,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  uniGUIBaseClasses, uniGUIClasses, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, IQUniGrid, Vcl.Controls, Vcl.Forms, uniGUIFrame, uniGUIApplication;

type
  TFrmQuote_Labor = class(TFrmBOM_Labor)
    wwQryBom_LaborQUOTE_ID: TBCDField;
    wwQryBom_LaborLAST_USED_LABOR_RATE: TFMTBCDField;
    procedure wwQryBom_LaborNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FMasterDataSource: TDataSource;
    procedure SetMasterDataSource(const AMasterDataSource: TDataSource);
  protected
    procedure RefreshOwner(DataSet: TDataSet); override;
  public
    { Public declarations }
    property MasterDataSource: TDataSource read FMasterDataSource write SetMasterDataSource;
    class procedure DoShowModal( AMasterSource: TDataSource );
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib;

class procedure TFrmQuote_Labor.DoShowModal( AMasterSource: TDataSource );
var
  frm: TFrmQuote_Labor;
begin
  frm:= TFrmQuote_Labor.Create(uniGUIApplication.UniApplication);
  frm.MasterDataSource:= AMasterSource;
  frm.ShowModal;
end;

procedure TFrmQuote_Labor.RefreshOwner;
begin
  {eventhough we maintain operator count in QUOTE using trigger on quote_labor we have to override it becasue of the compatability}
  ExecuteCommandFmt('update quote set operator = (select sum(operator) from quote_labor where quote_id = %f) where id = %f',
            [ wwQryBom_Labor.DataSource.DataSet.FieldByName('ID').asFloat,
              wwQryBom_Labor.DataSource.DataSet.FieldByName('ID').asFloat ]);
  {refresh owner}
  inherited;
end;

procedure TFrmQuote_Labor.SetMasterDataSource(const AMasterDataSource: TDataSource);
begin
  FMasterDataSource := AMasterDataSource;
end;

procedure TFrmQuote_Labor.wwQryBom_LaborNewRecord(DataSet: TDataSet);
begin
  // inherited;
  wwQryBom_LaborID.asFloat:= GetNextID('QUOTE_LABOR');
  wwQryBom_LaborQUOTE_ID.asFloat:= wwQryBom_Labor.DataSource.DataSet.FieldByName('ID').asFloat;
end;

end.
