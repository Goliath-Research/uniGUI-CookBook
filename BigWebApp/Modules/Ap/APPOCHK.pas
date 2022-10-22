unit APPOChk;

interface

uses
  Winapi.Windows,
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
  FireDAC.Comp.Client,
  uniGUIApplication,
  System.Classes;

type
  TFrmAP_PODetailCheck = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckAPPODetail( PO_DETAIL_ID:Real );


var
  FrmAP_PODetailCheck: TFrmAP_PODetailCheck;

implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib;


procedure CheckAPPODetail( PO_DETAIL_ID:Real );
begin
FrmAP_PODetailCheck := TFrmAP_PODetailCheck.Create(UniGUIApplication.UniApplication );
   with FrmAP_PODetailCheck do
   try
     if not (ShowModal = mrOK) then
        raise TIQNotAuthorizedException.Create;
   finally
     Release;
   end;
end;


end.
