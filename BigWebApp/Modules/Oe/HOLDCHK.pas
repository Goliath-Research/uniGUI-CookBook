unit HoldChk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.DataSet,
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
  Data.DB,
  UniGUIApplication,
  FireDAC.Comp.Client,
  System.Classes, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses;

type
  TFrmOrdOnHoldException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckOrdDetailForHold( OrdDetail_ID:Real );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib;

procedure CheckOrdDetailForHold( OrdDetail_ID:Real );
var
  LFrmOrdOnHoldException : TFrmOrdOnHoldException;
begin
  if (Trim(SelectValueFmtAsString('select onhold from ord_detail where id = %f',
    [OrdDetail_ID])) = 'Y') or
    (Trim(SelectValueFmtAsString('select shiphold from ord_detail where id = %f',
    [OrdDetail_ID])) = 'Y') then
    begin
     LFrmOrdOnHoldException := TFrmOrdOnHoldException.Create(UniGUIApplication.UniApplication);
     with LFrmOrdOnHoldException do
     begin
       rcusto_ID := OrdDetail_ID;
       if not (ShowModal = mrOK) then
          //raise Exception.Create('Status exception has not been authorized - unable to proceed');
          raise TIQNotAuthorizedException.Create;
     end;
    end;
end;

end.
