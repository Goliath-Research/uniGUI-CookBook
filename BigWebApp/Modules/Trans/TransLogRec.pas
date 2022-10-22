unit TransLogRec;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Translog,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.HPick, IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister, Vcl.Menus, uniMainMenu, FireDAC.Comp.DataSet,
  uniStatusBar, uniGUIClasses, uniEdit, uniDBNavigator, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, IQMS.WebVcl.UserDefinedLabel, IQUniGrid,
  uniGUIFrame, Vcl.Controls, uniGUIBaseClasses, uniPanel;

type
  TFrmTransLogReceive = class(TFrmTransLog)
    procedure QryTransLogBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FId:Real;
  public
    { Public declarations }
    constructor Create(aId:Real);

  end;

procedure DoShowPOReceiptsTransactions( aId:Real);


implementation
uses
  IQMS.Common.NLS,
  IQMS.Common.DataLib;
{$R *.dfm}


procedure DoShowPOReceiptsTransactions( aId:Real);
begin
  with TFrmTransLogReceive.Create( aId) do
  try
    ShowModal;
  finally
    Free;
  end;

end;

constructor TFrmTransLogReceive.Create( aId:Real);
var
  ArinvtID:Real;
begin
  ArinvtID := SelectValueFmtAsFloat('select arinvt_id from po_detail where id = %f', [aId]);
  inherited Create( ArinvtID);
  FId := AId;
  QryTransLog.Close;
  QryTransLog.Open;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add( IQFormat('select class, itemno from arinvt where ID = %f', [ ArinvtID ]));
    Open;
    Caption:= Format( '%s / %s - PO Receiving Transaction Log', [ FieldByName('class').asString,
                                                     FieldByName('itemno').asString ]);
  finally
    Free;
  end;


end;



procedure TFrmTransLogReceive.QryTransLogBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AID', FID);
  inherited;
end;

end.
