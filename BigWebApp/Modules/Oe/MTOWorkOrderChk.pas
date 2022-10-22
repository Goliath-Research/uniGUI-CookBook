unit MTOWorkOrderChk;

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
  System.Classes, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses,UniGUIApplication;

type
  TFrmMTOOnWorkorderException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckMTOOrdDetailOnWorkorder( OrdDetail_ID:Real );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckMTOOrdDetailOnWorkorder( OrdDetail_ID:Real );
var
  LFrmMTOOnWorkorderException : TFrmMTOOnWorkorderException;
begin
  if SelectValueFmtAsFloat('select 1 from workorder where make_to_order_detail_id = %f and rownum < 2', [ OrdDetail_ID ]) = 1 then
    LFrmMTOOnWorkorderException := TFrmMTOOnWorkorderException.Create(UniGUIApplication.UniApplication);
   if not (LFrmMTOOnWorkorderException.ShowModal = mrOK) then
      //raise Exception.Create('Status exception has not been authorized - unable to proceed');
      raise TIQNotAuthorizedException.Create;
end;

end.
