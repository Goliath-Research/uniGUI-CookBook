unit TranAssoc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  TranOffs,
  Data.DB, uniGUIApplication,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.HPick, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniLabel, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniButton, uniDBNavigator, uniBitBtn, uniSpeedButton, uniPanel,
  uniGUIBaseClasses, uniSplitter;

type
  TFrmTransAssociate = class(TFrmTransOffset)
    procedure AssignParamBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FMfgNo: string;
    procedure SetStandard_ID(AStandard_ID: Real);
  public
    { Public declarations }
    property  Standard_ID: Real write SetStandard_ID;
  end;

function GetTransLogAssociatedID( var ATransLog_ID: Real; AStandard_ID: Real ): Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib;

function GetTransLogAssociatedID( var ATransLog_ID: Real; AStandard_ID: Real ): Boolean;
var
  FrmTransAssociate: TFrmTransAssociate;
begin
  FrmTransAssociate:=TFrmTransAssociate.Create(uniGUIApplication.UniApplication);
  with FrmTransAssociate do
  begin
    Standard_ID:=AStandard_ID;
    Result:= (ShowModal = mrOK) and not (QryTransLogDtl.Bof and QryTransLogDtl.Eof);
    if Result then
       ATransLog_ID:= QryTransLogDtl.FieldByName('ID').asFloat;
  end;
end;

procedure TFrmTransAssociate.SetStandard_ID(AStandard_ID: Real);
begin
  FMfgNo:= SelectValueByID('mfgno', 'standard', AStandard_ID );
end;

procedure TFrmTransAssociate.AssignParamBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  AssignQueryParamValue(DataSet, 'mfgno', FMfgNo);
end;

end.
