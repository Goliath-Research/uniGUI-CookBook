unit Paste_Rel_PO;

interface

uses
  Winapi.Windows,
  System.Classes,
  Paste_Rel_OE,
  FireDAC.Comp.DataSet,
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
  FireDAC.Comp.Client,
  Vcl.DBGrids,
  Vcl.Controls, uniGUIClasses, uniBasicGrid, uniDBGrid, uniButton, Vcl.Forms,
  uniGUIBaseClasses, uniPanel, uniGUIApplication;

type
  TFrmPasteReleases_PO = class(TFrmPasteReleases_OE)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoGetPasteReleasesMode_PO( ADetail_ID: Real ):TPasteMode;

implementation

{$R *.DFM}

{Just the Query is changed}
function DoGetPasteReleasesMode_PO( ADetail_ID: Real ):TPasteMode;
var
  LFrmPasteReleases_PO : TFrmPasteReleases_PO;
begin
  LFrmPasteReleases_PO := TFrmPasteReleases_PO.Create( uniGUIApplication.UniApplication );
  LFrmPasteReleases_PO.Detail_ID := ADetail_ID;
  LFrmPasteReleases_PO.ShowModal;
  Result:= LFrmPasteReleases_PO.PasteMode;
end;

end.
