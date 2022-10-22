unit PK_Edit;

interface

uses
  Winapi.Windows,
  Mat_Edit,
  Mask,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, uniButton, uniBitBtn, uniDBCheckBox, uniCheckBox,
  uniDBComboBox, uniMultiItem, uniComboBox, uniDBLookupComboBox, uniSplitter,
  System.Classes, Vcl.Controls, Vcl.Forms, uniPanel;

type
  TPackEdit = class(TMatEdit)
    Label8: TUniLabel;
    dbePacLbs: TUniDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.

