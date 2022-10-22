unit TrLogEle;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Forms,
  Trlogall,
  Data.DB,
  Mask,
  MainModule;

type
  TFrmTransLogElemBetweenDates = class(TFrmTransLogItems)
    procedure FormShow(Sender: TObject);
    procedure QryTransLogBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FDateStart: TDateTime;
    FDateEnd  : TDateTime;
    FArinvt_ID: Real;
    FElement  : string;
    procedure SetArinvt_ID(const Value: Real);
    procedure SetDateEnd(const Value: TDateTime);
    procedure SetDateStart(const Value: TDateTime);
    procedure SetElement(const Value: string);
  protected
  public
    { Public declarations }
    //constructor Create( AArinvt_ID:Real; ADateStart, ADateEnd: TDateTime; const AElement: string );
    property Arinvt_ID:Real write SetArinvt_ID;
    property DateStart: TDateTime write SetDateStart;
    property DateEnd: TDateTime write SetDateEnd;
    property Element: string write SetElement;
  end;

procedure DoTransLogByElementBetweenDates( AArinvt_ID:Real; ADateStart, ADateEnd: TDateTime; const AElement: string );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils;

procedure DoTransLogByElementBetweenDates( AArinvt_ID:Real; ADateStart, ADateEnd: TDateTime; const AElement: string );
var
  FrmTransLogElemBetweenDates: TFrmTransLogElemBetweenDates;
begin
  FrmTransLogElemBetweenDates := TFrmTransLogElemBetweenDates.Create( AArinvt_ID );
  with FrmTransLogElemBetweenDates do
  begin
    FDateStart:= ADateStart;
    FDateEnd  := ADateEnd  ;
    FArinvt_ID:= AArinvt_ID;
    FElement  := AElement;   // PadR(AElement, 30);
  end;
  FrmTransLogElemBetweenDates.Show;
end;

procedure TFrmTransLogElemBetweenDates.FormShow(Sender: TObject);
begin
  inherited;
  Caption:= Format('OUT Transactions by %s between %s and %s', [Trim(FElement), DateToStr( FDateStart ), DateToStr( FDateEnd )]);
end;

procedure TFrmTransLogElemBetweenDates.QryTransLogBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arinvt_ID', FArinvt_ID);
  AssignQueryParamValue(DataSet, 'date_start', FDateStart);
  AssignQueryParamValue(DataSet, 'date_end', FDateEnd);
  AssignQueryParamValue(DataSet, 'cost_element', FElement);

  inherited;
end;

procedure TFrmTransLogElemBetweenDates.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmTransLogElemBetweenDates.SetDateEnd(const Value: TDateTime);
begin
  FDateEnd := Value;
end;

procedure TFrmTransLogElemBetweenDates.SetDateStart(const Value: TDateTime);
begin
  FDateStart := Value;
end;

procedure TFrmTransLogElemBetweenDates.SetElement(const Value: string);
begin
  FElement := Value;
end;

end.
