unit RBom_MfgType;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  Rtselect,
  RtTypes,
  uniGUIApplication,
  vcl.Wwkeycb, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, uniCheckBox, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniSplitter, uniGroupBox, uniButton, System.Classes,
  uniGUIBaseClasses, uniPanel;

type
  TFrmSelectMfgTypeRBom = class(TFrmSelection)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function RBom_PickMfgTypeCell(var MfgCellRecord:TCellMfgType):Boolean;

implementation

{$R *.DFM}

function RBom_PickMfgTypeCell(var MfgCellRecord:TCellMfgType):Boolean;
var
  LFrmSelectMfgTypeRBom : TFrmSelectMfgTypeRBom;
begin
  LFrmSelectMfgTypeRBom := TFrmSelectMfgTypeRBom.Create(uniGUIApplication.UniApplication);
  Result:= (LFrmSelectMfgTypeRBom.ShowModal = mrOK);
  if Result then
     MfgCellRecord:= LFrmSelectMfgTypeRBom.MfgCell;
end;


end.
