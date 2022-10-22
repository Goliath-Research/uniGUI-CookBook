unit ItemType;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  CustType,
  MainModule,
  Data.DB,
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
  FireDAC.Comp.Client,
  Vcl.DBGrids,
  Vcl.Controls,
  System.Classes, uniGUIClasses, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniGUIBaseClasses, uniPanel, uniGUIApplication;

type
  TFrmItem_Type = class(TFrmCust_Type)
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoItemTiersType;

implementation
{$R *.DFM}
uses
  IQMS.Common.HelpHook;

procedure DoItemTiersType;
var
  LFrmItem_Type : TFrmItem_Type;
begin
  LFrmItem_Type := TFrmItem_Type.Create( uniGUIApplication.UniApplication );
  LFrmItem_Type.ShowModal;
end;

procedure TFrmItem_Type.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
