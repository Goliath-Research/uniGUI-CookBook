unit OverDispoChk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Data.DB,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, uniButton,
  uniCheckBox, uniPanel, uniGUIClasses, uniEdit, uniDBEdit, uniLabel,
  uniPageControl, uniGUIBaseClasses;

type
  TFrmOverDispoException = class(TFrmStatusException)
    Query1DispoQty: TFloatField;
    Query1LeftDispo: TFloatField;
    Query1STATUS_ID: TStringField;
    procedure Query1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FDispoQty   : Real;
    FLeftToDispo: Real;
    procedure SetDispoQty(const Value: Real);
    procedure SetLeftToDispo(const Value: Real);
  protected
    procedure PrepareQuery( AID: Real ); override;
  public
    { Public declarations }
    property DispoQty : Real write SetDispoQty;
    property LeftToDispo : Real write SetLeftToDispo;
  end;

procedure CheckOverDispo( ADispoQty, ALeftToDispo: Real );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  UniGUIApplication,
  IQMS.Common.StringUtils;

procedure CheckOverDispo( ADispoQty, ALeftToDispo: Real );
var
  LFrmOverDispoException : TFrmOverDispoException;
begin
  if {greater than 0}
     (ADispoQty - ALeftToDispo > 0.000001)
     {not IQRF}
     and not IsConsole
     {not ScanLine}
     and (CompareText( StrBeforeDot( ExtractFileName( Application.ExeName )), 'ScanLine' ) <> 0)
     {not DispoServer}
     and (CompareText( StrBeforeDot( ExtractFileName( Application.ExeName )), 'DispoSvr' ) <> 0) then
  begin
    LFrmOverDispoException := TFrmOverDispoException.Create( UniGUIApplication.UniApplication);
    with LFrmOverDispoException do
    begin
      DispoQty := ADispoQty;
      LeftToDispo := ALeftToDispo;
      if not (ShowModal = mrOK) then
         raise TIQNotAuthorizedException.Create;
    end;
  end;
end;

procedure TFrmOverDispoException.PrepareQuery( AID: Real );
begin
  Query1.Close;
  AssignQueryParamValue(Query1, 'ID', 1);
end;

procedure TFrmOverDispoException.Query1CalcFields(DataSet: TDataSet);
begin
  inherited;  {nothing}
  Query1DispoQty.asFloat := FDispoQty;
  Query1LeftDispo.asFloat:= FLeftToDispo;
end;

procedure TFrmOverDispoException.SetDispoQty(const Value: Real);
begin
  FDispoQty := Value;
end;

procedure TFrmOverDispoException.SetLeftToDispo(const Value: Real);
begin
  FLeftToDispo := Value;
end;

end.
