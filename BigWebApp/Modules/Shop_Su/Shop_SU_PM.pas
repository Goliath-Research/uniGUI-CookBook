unit Shop_SU_PM;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Forms,
  Shop_SU,
  Data.DB,
  Mask,
  FireDAC.Comp.Client,
  vcl.wwdatsrc, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.HPick, Vcl.Menus, uniMainMenu,
  Vcl.Dialogs, IQMS.WebVcl.RepDef, IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister, FireDAC.Comp.DataSet, uniScrollBox,
  uniBasicGrid, uniDBGrid, uniDBNavigator, uniButton, uniBitBtn, uniSpeedButton,
  uniEdit, uniDBEdit, uniLabel, uniGroupBox, uniGUIClasses, uniCheckBox,
  uniDBCheckBox, IQUniGrid, uniGUIFrame, uniSplitter, uniPanel, uniPageControl,
  System.Classes, Vcl.Controls, uniGUIBaseClasses, uniStatusBar;

type
  TShop_SetUp_PM = class(TShop_SetUp)
    procedure FormCreate(Sender: TObject);
    procedure QryMfgCellFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShopSetUp_PM( DataBase1:TFDConnection );


implementation

{$R *.dfm}

uses
  IQMS.Common.MfgShare,
  uniGUIApplication;


procedure ShopSetUp_PM( DataBase1:TFDConnection );
begin
  with TShop_SetUp_PM.Create(UniApplication) do
  begin
    FConnection:= DataBase1;
    ShowModal;
  end;
end;

procedure TShop_SetUp_PM.FormCreate(Sender: TObject);
begin
  inherited;

  PageControl1.ActivePage:= tabMfgCell;

  STDLabourCapacity1.Visible:= FALSE;
  N1.Visible:= FALSE;
  Calendar1.Visible:= FALSE;
end;

procedure TShop_SetUp_PM.QryMfgCellFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;

  Accept:= Accept and IQMS.Common.MfgShare.IsMfgTypePM( QryMfgCellMFGTYPE.asString );
end;

end.
