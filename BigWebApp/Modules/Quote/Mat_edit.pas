unit Mat_Edit;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Add_edit,
  DB,
  StdCtrls,
  DBCtrls,
  Buttons,
  Mask,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  uniButton, uniBitBtn, uniDBCheckBox, uniCheckBox, uniDBComboBox, uniMultiItem,
  uniComboBox, uniDBLookupComboBox, uniSplitter, uniPanel;

type
  TMatEdit = class(TAddEdit)
    Label6: TUniLabel;
    dbePtsPer: TUniDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.

