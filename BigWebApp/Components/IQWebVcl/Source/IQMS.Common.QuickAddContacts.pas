unit IQMS.Common.QuickAddContacts;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Data.DB,
  IQMS.Common.QuickAddBase,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel, uniPageControl, uniButton, Vcl.Forms, uniPanel;

type
  TQuickAddContacts = class(TQuickAddBase)
    Label1: TUniLabel;
    dbFirst: TUniDBEdit;
    Label2: TUniLabel;
    dbLast: TUniDBEdit;
    Label5: TUniLabel;
    dbSalut: TUniDBEdit;
    Label6: TUniLabel;
    dbTitle: TUniDBEdit;
    Label7: TUniLabel;
    dbPhone: TUniDBEdit;
    Label8: TUniLabel;
    dbFax: TUniDBEdit;
    Label10: TUniLabel;
    dbPager: TUniDBEdit;
    Label11: TUniLabel;
    dbEmail: TUniDBEdit;
    Label12: TUniLabel;
    dbExt: TUniDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

end.
