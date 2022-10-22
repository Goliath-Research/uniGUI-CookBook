unit InvFltr2;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  InvtFltr,
  InvtClas,
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
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton, uniSplitter, uniGroupBox, uniButton, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniLabel, uniPanel,UniGUIApplication;

type
  TFrmInvClassFilter2 = class(TFrmInvClassFilter)
    rbtnThisItem: TUniRadioButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetInventoryClassFilter2( var AInvClassFilter: TInvClassFilter ):Boolean;

implementation

{$R *.DFM}

uses
  inv_rscstr;

function GetInventoryClassFilter2( var AInvClassFilter: TInvClassFilter ):Boolean;
var
  LFrmInvClassFilter2 : TFrmInvClassFilter2;
begin
  LFrmInvClassFilter2 := TFrmInvClassFilter2.Create( UniGUIApplication.UniApplication );
  Result:= LFrmInvClassFilter2.ShowModal = mrOK;

  if Result then with AInvClassFilter do
  begin
    Kind    := LFrmInvClassFilter2.InvClassFilter.Kind;
    InvClass:= LFrmInvClassFilter2.InvClassFilter.InvClass;
  end;
end;

procedure TFrmInvClassFilter2.btnOKClick(Sender: TObject);
begin
  if rbtnThisItem.Checked then
  begin
{ TODO -oGPatil -cWebconvert : Undeclared Identifier
    FInvClassFilter.Kind:= ifThisItem;  }
    ModalResult:= mrOK;
  end
  else
    inherited;
end;

end.
