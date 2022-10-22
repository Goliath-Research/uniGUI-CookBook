unit Q_SelectMfgType;

interface

uses
  Winapi.Windows,
  RTSelect,
  vcl.Wwkeycb,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, uniCheckBox, uniBasicGrid, uniDBGrid,
  uniSplitter, uniGroupBox, uniButton, System.Classes, Vcl.Controls, Vcl.Forms;

type
  TFrmSelectionQuoteMfgType = class(TFrmSelection)
    pnlNote: TUniPanel;
    lblNote: TUniLabel;
    Bevel1: TUniPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
