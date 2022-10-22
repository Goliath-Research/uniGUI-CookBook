{ The only reason we inherited from TFrmOrdOnPkTktException is to provide another
  SR.SecurityCode so we can check & grant execution from places other than
  delete/archive sales order }

unit PkTktChkEx;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  PkTktChk,
  DB,
  StdCtrls,
  ExtCtrls,
  Mask,
  DBCtrls,
  ComCtrls,
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
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmOrdOnPkTktExceptionEx = class(TFrmOrdOnPkTktException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
