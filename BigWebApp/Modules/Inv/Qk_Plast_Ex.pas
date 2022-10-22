unit Qk_Plast_Ex;

interface

uses
  Winapi.Windows,
  Qk_Plast,
  Vcl.Wwdatsrc,
  Data.DB,
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
  FireDAC.Comp.Client,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel, uniDBLookupComboBox, uniDBNavigator, IQUniGrid, Vcl.Forms,
  uniGUIFrame, uniCheckBox, uniMultiItem, uniComboBox, uniDBComboBox,
  uniSplitter, uniDBCheckBox, uniPageControl, uniButton, uniPanel;

type
  TQuickAddPlasticEx = class(TQuickAddPlastic)
    Label6: TUniLabel;
    Table1SPG: TFMTBCDField;
    Table1GAUGE: TFMTBCDField;
    dbeSPG: TUniDBEdit;
    Label7: TUniLabel;
    dbeGauge: TUniDBEdit;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QuickAddPlasticEx: TQuickAddPlasticEx;

implementation

{$R *.dfm}

procedure TQuickAddPlasticEx.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  Label6.Visible  := Table1.FieldByName('CLASS').asString = 'PL';
  dbeSPG.Visible  := Table1.FieldByName('CLASS').asString = 'PL';
  Label7.Visible  := Table1.FieldByName('CLASS').asString = 'PL';
  dbeGauge.Visible:= Table1.FieldByName('CLASS').asString = 'PL';
end;

end.
