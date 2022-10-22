unit Qk_FG;

interface

uses
  Winapi.Windows,
  Qk_Inv,
  Vcl.Wwdatsrc,
  Data.DB,
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
  System.Classes, uniDBLookupComboBox, uniEdit, IQUniGrid, Vcl.Forms,
  uniGUIFrame, uniCheckBox, uniDBEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniLabel, uniSplitter, uniGUIClasses, uniDBCheckBox, uniPageControl,
  uniButton, uniGUIBaseClasses, uniPanel;

type
  TQuickAddFGArinvt = class(TQuickAddRawArinvt)
    procedure Table1NewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls;

procedure TQuickAddFGArinvt.Table1NewRecord(DataSet: TDataSet);
begin
  inherited;
  Table1.FieldByName('CLASS').asString:= 'FG';
end;

procedure TQuickAddFGArinvt.FormShow(Sender: TObject);
begin
  inherited;
  //AdjustControlsWidthBasedOnParent( PnlClient02, [ EditITEMNO, EditREV, EditDESCRIP, dbcUNIT, dbeLeadTime, ediDescrip2 ], 6 );
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
end;

end.
