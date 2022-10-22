unit InvtClasEx;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  InvtClas,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniLabel, System.Classes,
  uniPanel;

type
  TFrmInvClassEx = class(TFrmInvClass)
    chkNonMaterial: TUniCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetInventoryClassEx( var AClass, ANonMaterial: string ):Boolean;

implementation

{$R *.DFM}

uses
  UniGUIApplication,
  IQMS.Common.Numbers;

function GetInventoryClassEx( var AClass, ANonMaterial: string ):Boolean;
var
  LFrmInvClassEx :  TFrmInvClassEx;
begin
  LFrmInvClassEx := TFrmInvClassEx.Create(UniGUIApplication.UniApplication);
  with LFrmInvClassEx do
  begin
    Result:= ShowModal = mrOK;
    if Result then
    begin
      AClass:= wwLookupClass.Text;             // wwQuery1CLASS.asString;
      ANonMaterial:= IIf( chkNonMaterial.Checked, 'Y', 'N' );
    end;
  end;
end;


end.
