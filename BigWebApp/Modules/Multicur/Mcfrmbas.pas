unit MCFrmBas;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  MCBasic,
  Data.DB,
  Wwtable,
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
  Vcl.Menus,
  Vcl.Controls,
  uniMainMenu,
  uniGUIClasses,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniDBLookupComboBox,
  uniLabel,
  uniGUIBaseClasses,
  uniPanel;

type
  TFrmMCFormBasic = class(TFrmMCBasic)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbCurrencyEnter(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  protected
    procedure ReadForm;virtual;
    procedure WriteForm;virtual;
  private
    procedure SetDataSet(const Value: TDataSet);
    { Private declarations }
  public
    { Public declarations }
    FDataSet: TDataSet;
    property DataSet : TDataSet write SetDataSet;
  end;

procedure DOMCFormDisplay(AID:Real; ADataSet:TDataSet; AClassReference: TFrmMCFormBasic );

implementation
{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  UniGUIApplication,
  IQMS.Common.DataLib;

procedure DOMCFormDisplay(AID:Real; ADataSet:TDataSet; AClassReference: TFrmMCFormBasic);
begin
  AClassReference := TFrmMCFormBasic.Create( UniGUIApplication.UniApplication );
  with AClassReference do
  begin
    ID := AID;
    DataSet := ADataSet;
    Show;
  end;
end;

procedure TFrmMCFormBasic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteForm;
  inherited;
end;

procedure TFrmMCFormBasic.cbCurrencyEnter(Sender: TObject);
begin
//
end;

procedure TFrmMCFormBasic.ReadForm;
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmMCFormBasic.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
end;

procedure TFrmMCFormBasic.UniFormShow(Sender: TObject);
begin
  inherited;
  cbCurrency.Text := SelectValueFmtAsString('select descrip from currency where id = %f', [tblCurrencyID.asFloat]);
  ReadForm;
  Recalculate;
end;

procedure TFrmMCFormBasic.WriteForm;
begin
  IQRegFormWrite( self, [self]);
end;

end.
