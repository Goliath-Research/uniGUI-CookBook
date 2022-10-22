unit RmaCkArh;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Data.DB,
  Mask,
  FireDAC.Comp.DataSet,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, System.Classes, uniGUIBaseClasses;

type
  TFrmRmaCheckArcive = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckRMABeforeArcive( ARMAId:Real; ATblDtl, AQryRec, AQryCred: TDataSet );

implementation

uses
  UniGUIApplication;

{$R *.DFM}

procedure CheckRMABeforeArcive( ARMAId:Real; ATblDtl, AQryRec, AQryCred:TDataSet );
var
  LFrm: TFrmRmaCheckArcive;
  ADescrepancyExists:Boolean;
begin
  ATblDtl.First;
  ADescrepancyExists := false;

  while not ATblDtl.Eof do
  begin
    if not (  (AQryRec.FieldByName('QTY_RECEIVED').Value = AQryCred.FieldBYName('QTY_INVOICED').asFloat) and
              (ATblDtl.FieldByName('QTYRETURNED').Value = AQryCred.FieldBYName('QTY_INVOICED').asFloat) ) then
    begin
      ADescrepancyExists := True;
      Break;
    end;
    ATblDtl.Next;
  end;

  if ADescrepancyExists then
  LFrm:= TFrmRmaCheckArcive.Create( UniGUIApplication.UniApplication );
  if not (LFrm.ShowModal = mrOK) then
     raise TIQNotAuthorizedException.Create;
end;

end.
