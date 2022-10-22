unit RebateStatusException;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  StatChk,
  Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  IQMS.WebVcl.SecurityRegister, FireDAC.Comp.Client, uniButton, uniCheckBox,
  uniPanel, uniGUIClasses, uniEdit, uniDBEdit, uniLabel, uniPageControl,
  uniGUIBaseClasses;

type
  TFrmRebateStatusException = class(TFrmStatusException)
    Query1REBATENO: TStringField;
    Query1USERID: TStringField;
    Query1ID: TBCDField;
    Query1STATUS: TStringField;
    procedure FormShow(Sender: TObject);
  private
    FID: Real;
    procedure SetID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property ID: Real write SetID;
  end;                                              

procedure CheckRebateStatusException( Rebate_ID:Real);


implementation

{$R *.dfm}
uses
  IQMS.Common.DataLib,
  UniGUIApplication;


procedure CheckRebateStatusException( Rebate_ID:Real);
var
  LFrm: TFrmRebateStatusException;
begin
   LFrm:= TFrmRebateStatusException.Create( UniGUIApplication.UniApplication);
   LFrm.ID:= Rebate_ID;
   if not (LFrm.ShowModal = mrOK) then
      raise TIQNotAuthorizedException.Create;
end;

procedure TFrmRebateStatusException.FormShow(Sender: TObject);
begin
  inherited;
  IQSetTablesActive(false, self);
  PrepareQuery( FID );
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmRebateStatusException.SetID(const Value: Real);
begin
  FID:= value;
end;

end.
