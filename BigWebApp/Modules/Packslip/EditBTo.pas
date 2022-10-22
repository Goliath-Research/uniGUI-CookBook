unit EditBTo;

interface

uses
  Winapi.Windows,
  Editbill,
  Data.DB,
  Mask,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  Vcl.Buttons,
  Vcl.DBGrids,
  Vcl.Controls,
  Vcl.Forms,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniLabel, uniButton, uniDBNavigator, uniBitBtn, uniSpeedButton, uniBasicGrid,
  uniDBGrid, uniComboBox, uniDBComboBox, uniEdit, uniDBEdit, uniSplitter,
  uniScrollBox, uniPageControl, uniPanel;

type
  TFrmEditBillto = class(TFrmEditBilltoCustom)
    TblComp: TFDTable;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    lblRemitTo: TUniLabel;
    TableCOMPANY_ID: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
