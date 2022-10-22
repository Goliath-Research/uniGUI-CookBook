unit prod_del_reported_chk;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, Data.DB,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniPageControl,
  System.Classes;

type
  TFrmDeleteReportedProdDispoException = class(TFrmStatusException)
    Label4: TUniLabel;
    DBEdit4: TUniDBEdit;
    Label5: TUniLabel;
    DBEdit5: TUniDBEdit;
    Label6: TUniLabel;
    DBEdit6: TUniDBEdit;
    Label7: TUniLabel;
    DBEdit7: TUniDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


procedure CheckDeletingReportedProdDispo( ADayprod_ID: Real );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  uniGUIApplication;

procedure CheckDeletingReportedProdDispo( ADayprod_ID: Real );
var
  LFrmDeleteReportedProdDispoException : TFrmDeleteReportedProdDispoException;
begin
  if SelectValueFmtAsFloat('select 1 from day_part where dayprod_id = %f and NVL(dispo,''N'') = ''Y'' and rownum < 2', [ ADayprod_ID ]) = 0 then
     EXIT;
  LFrmDeleteReportedProdDispoException := TFrmDeleteReportedProdDispoException.Create( UniApplication );
  with LFrmDeleteReportedProdDispoException do
  begin
    rcusto_ID := ADayprod_ID;
    if not (ShowModal = mrOK) then
       //raise Exception.Create('Status exception has not been authorized - unable to proceed');
       raise TIQNotAuthorizedException.Create;
  end;
end;

end.
