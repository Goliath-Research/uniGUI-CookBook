unit NonConfChk;

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
  FireDAC.Comp.Client,
  System.Classes, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses;

type
  TFrmNonConformException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckLocationForNonConform(AFGMulti_ID: Real);
function CheckLocationForNonConform2(AFGMulti_ID: Real): boolean;


implementation

{$R *.DFM}


uses
  IQMS.Common.DataLib,
  uniGUIApplication;

procedure CheckLocationForNonConform(AFGMulti_ID: Real);
var
  LFrmNonConformException : TFrmNonConformException;
begin
  if SelectValueFmtAsInteger(
    'select 1 from fgmulti f where id = %f and non_conform_id is not null',
    [AFGMulti_ID]) = 1 then
    begin
      LFrmNonConformException := TFrmNonConformException.Create(uniGUIApplication.UniApplication);
      with LFrmNonConformException do
      begin
        rcusto_ID := AFGMulti_ID;
        if not (ShowModal = mrOK) then
          raise TIQNotAuthorizedException.Create;
      end;
    end;
end;

function CheckLocationForNonConform2(AFGMulti_ID: Real): boolean;
var
  LFrmNonConformException : TFrmNonConformException;
begin
  Result := true;
  if SelectValueFmtAsInteger(
    'select 1 from fgmulti f where id = %f and non_conform_id is not null',
    [AFGMulti_ID]) = 1 then
    begin
      LFrmNonConformException := TFrmNonConformException.Create(uniGUIApplication.UniApplication);
      with LFrmNonConformException do
      begin
        rcusto_ID := AFGMulti_ID;
        if not (ShowModal = mrOK) then
          Result := false
      end;
    end;

end;

end.
