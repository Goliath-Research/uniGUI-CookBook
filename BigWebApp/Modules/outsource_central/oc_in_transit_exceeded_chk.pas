unit oc_in_transit_exceeded_chk;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Data.DB,
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
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel, uniButton, uniCheckBox, uniPanel, uniPageControl, UniGUIApplication;

type
  TFrmInTransitExceededException = class(TFrmStatusException)
    Query1TransQty: TFloatField;
    Query1RejectQty: TFloatField;
    Query1InTransitQty: TFloatField;
    Label4: TUniLabel;
    DBEdit4: TUniDBEdit;
    Query1STATUS_ID: TStringField;
    procedure Query1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FTransQty: Real;
    FRejectQty: Real;
    FIn_TransitQty: Real;
    procedure SetTransQty(const Value: Real);
    procedure SetRejectQty(const Value: Real);
    procedure SetIn_TransitQty(const Value: Real);
  protected
    procedure PrepareQuery( AID: Real ); override;
  public
    { Public declarations }
    property TransQty : Real write SetTransQty;
    property RejectQty : Real write SetRejectQty;
    property In_TransitQty : Real write SetIn_TransitQty;
  end;

procedure CheckInTransitQtyExceeded(ATransQty, ARejectQty, AIn_TransitQty: Real );


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

{ TFrmInTransitExceededException }

procedure CheckInTransitQtyExceeded(ATransQty, ARejectQty, AIn_TransitQty: Real );
var
  frm: TFrmInTransitExceededException;
begin

  if ATransQty + ARejectQty <= AIn_TransitQty then
     EXIT;

  frm := TFrmInTransitExceededException.Create(UniGUIApplication.UniApplication);
  frm.TransQty := ATransQty;
  frm.RejectQty := ARejectQty;
  frm.In_TransitQty  := AIn_TransitQty ;
  if not (frm.ShowModal = mrOK) then
     raise TIQNotAuthorizedException.Create;
end;

procedure TFrmInTransitExceededException.PrepareQuery(AID: Real);
begin
  Query1.Close;
  AssignQueryParamValue(Query1, 'ID', 1);
end;

procedure TFrmInTransitExceededException.Query1CalcFields(
  DataSet: TDataSet);
begin
  inherited; {n}
  Query1TransQty.asFloat    := FTransQty;
  Query1RejectQty.asFloat   := FRejectQty;
  Query1InTransitQty.asFloat:= FIn_TransitQty;
end;

procedure TFrmInTransitExceededException.SetIn_TransitQty(const Value: Real);
begin
  FIn_TransitQty := Value;
end;


procedure TFrmInTransitExceededException.SetRejectQty(const Value: Real);
begin
  FRejectQty := Value;
end;

procedure TFrmInTransitExceededException.SetTransQty(const Value: Real);
begin
  FTransQty := Value;
end;


end.
