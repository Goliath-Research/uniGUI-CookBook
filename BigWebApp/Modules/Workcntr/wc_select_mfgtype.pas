unit wc_select_mfgtype;

interface

uses
  Winapi.Windows,
  RTSelect,
  vcl.Wwkeycb, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, uniCheckBox, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniSplitter, uniGroupBox, uniButton, System.Classes, Vcl.Controls,
  Vcl.Forms, uniGUIBaseClasses, uniPanel;

type
  TFrmWorkCenterSelectMfgType = class(TFrmSelection)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
