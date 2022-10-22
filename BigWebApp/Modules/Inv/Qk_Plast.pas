unit Qk_Plast;

interface

uses
  Winapi.Windows,
  Qk_inv,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
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
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  System.Classes, uniDBLookupComboBox, uniDBNavigator, uniEdit, IQUniGrid,
  Vcl.Forms, uniGUIFrame, uniCheckBox, uniDBEdit, uniMultiItem, uniComboBox,
  uniDBComboBox, uniLabel, uniSplitter, uniGUIClasses, uniDBCheckBox,
  uniPageControl, uniButton, uniGUIBaseClasses, uniPanel;

type
  TQuickAddPlastic = class(TQuickAddRawArinvt)
    procedure Table1NewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TQuickAddPlastic.Table1NewRecord(DataSet: TDataSet);
begin
  inherited;
  Table1.FieldByName('CLASS').asString:= 'PL';
end;

end.

