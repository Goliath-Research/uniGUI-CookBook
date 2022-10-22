unit spc_select_sd;

interface

uses
  spc_select, uniRadioGroup, uniButton, uniBitBtn, uniGUIClasses, uniMultiItem,
  uniListBox, uniGroupBox, System.Classes, Vcl.Controls, Vcl.Forms,
  uniGUIBaseClasses, uniPanel;

type
  TFrmSPCSelect_ShopData = class(TFrmSPCSelect)
  private
    { Private declarations }
  protected
    { Protected declarations }
    function GetStandardFormWidth: Integer; override;
  public
    { Public declarations }
  end;

var
  FrmSPCSelect_ShopData: TFrmSPCSelect_ShopData;

implementation

{$R *.DFM}


function TFrmSPCSelect_ShopData.GetStandardFormWidth: Integer;
begin
  // Width of the touch-screen form
  Result := 420;
end;

end.
