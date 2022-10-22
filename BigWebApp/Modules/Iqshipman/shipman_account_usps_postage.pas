unit shipman_account_usps_postage;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton,
  uniBitBtn, uniSpinEdit;

type
  TFrmShipManAccountUSPSPostage = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    PnlClient02: TUniPanel;
    edtPostage: TUniSpinEdit;
  private
    function GetPostageAmount: Real;
    { Private declarations }
  public
    { Public declarations }
    property PostageAmount: Real read GetPostageAmount;
  end;

  function GetPostageAmount(var APostage: Real): Boolean;


implementation

{$R *.dfm}

function GetPostageAmount(var APostage: Real): Boolean;
var
  FrmShipManAccountUSPSPostage : TFrmShipManAccountUSPSPostage;
begin
  FrmShipManAccountUSPSPostage := TFrmShipManAccountUSPSPostage.Create(UniApplication);
  with FrmShipManAccountUSPSPostage do
  begin
     Result := ShowModal = mrOk;
     if Result then
        begin
          APostage := PostageAmount;
        end;
  end;
end;

{ TFrmShipManAccountUSPSPostage }

function TFrmShipManAccountUSPSPostage.GetPostageAmount: Real;
begin
  Result := edtPostage.Value;
end;

end.
