unit RMAStatusException2;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.DataSet,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, Data.DB,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses;

type
  TFrmRMAStatusException2 = class(TFrmStatusException)
    procedure FormShow(Sender: TObject);
  private
    procedure SetStatus(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property Status: Integer write SetStatus;
  end;

procedure CheckRMAStatusException2( RMA_ID:Real; AStatus:Integer );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  UniGuiApplication;

procedure CheckRMAStatusException2(RMA_ID:Real; AStatus:Integer);
var
  LFrm: TFrmRMAStatusException2;
begin
   LFrm:= TFrmRMAStatusException2.Create( UniGuiApplication.UniApplication );
   LFrm.rcusto_ID:= RMA_ID;
   LFrm.Status:= AStatus;
   if not (LFrm.ShowModal = mrOK) then
      raise TIQNotAuthorizedException.Create;
end;

procedure TFrmRMAStatusException2.FormShow(Sender: TObject);
begin
  inherited;
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmRMAStatusException2.SetStatus(const Value: Integer);
begin
  if Value = 1 then
    DBEdit3.dataField := 'STATUS'
  else if Value = 2 then
    DBEdit3.dataField := 'STATUS2'
  else
    DBEdit3.dataField := 'STATUS3';
end;

end.
