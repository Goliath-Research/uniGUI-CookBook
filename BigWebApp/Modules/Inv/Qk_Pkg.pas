unit Qk_Pkg;

interface

uses
  Winapi.Windows,
  Qk_Inv,
  Data.DB,
  Vcl.Wwdatsrc,
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
  uniCheckBox,
  uniDBCheckBox, uniDBLookupComboBox, uniDBNavigator, uniEdit, IQUniGrid,
  Vcl.Forms, uniGUIFrame, uniDBEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniLabel, uniSplitter, uniPageControl, uniButton, uniPanel;

type
  TQuickAddPackaging = class(TQuickAddRawArinvt)
    chkIsPallet: TUniDBCheckBox;
    Table1IS_PALLET: TStringField;
    procedure Table1NewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

procedure TQuickAddPackaging.FormCreate(Sender: TObject);
begin
  inherited;
  chkBlend.Visible:= FALSE;
end;

procedure TQuickAddPackaging.Table1NewRecord(DataSet: TDataSet);
begin
  inherited;
  Table1.FieldByName('CLASS').asString:= 'PK';
end;

end.

