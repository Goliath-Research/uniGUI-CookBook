unit TrLogItm;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  TransLog,
  Data.DB,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.HPick, IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister, Vcl.Menus, uniMainMenu, FireDAC.Comp.DataSet,
  uniStatusBar, uniGUIClasses, uniEdit, uniDBNavigator, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, IQMS.WebVcl.UserDefinedLabel, IQUniGrid, Vcl.Forms,
  uniGUIFrame, System.Classes, Vcl.Controls, uniGUIBaseClasses, uniPanel;

type
  TFrmTransLogSingle = class(TFrmTransLog)
    procedure FormShow(Sender: TObject);
    procedure QryTransLogBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS;


procedure TFrmTransLogSingle.FormShow(Sender: TObject);
begin
  inherited;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add( IQFormat('select class, itemno from arinvt where ID = %f', [ Arinvt_ID ]));
    Open;
    Caption:= Format( '%s / %s - Transaction Log', [ FieldByName('class').asString,
                                                     FieldByName('itemno').asString ]);
  finally
    Free;
  end;
end;

procedure TFrmTransLogSingle.QryTransLogBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', Arinvt_ID);
  inherited;
end;

end.

