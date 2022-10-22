unit qk_add_cntr_type;

interface

uses
  Winapi.Windows,
  IQMS.Common.QuickAddBase,
  Data.DB,
//  Mask,
  Vcl.Buttons,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniPageControl, System.Classes, Vcl.Controls, Vcl.Forms;

type
  TQuickAddCntrType = class(TQuickAddBase)
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    Label1: TUniLabel;
    Table1ID: TBCDField;
    Table1NAME: TStringField;
    Table1EPLANT_ID: TBCDField;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    Label2: TUniLabel;
    sbtnEPlant: TUniSpeedButton;
    procedure sbtnEPlantClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}


uses
  IQMS.COmmon.SetPlant;

procedure TQuickAddCntrType.sbtnEPlantClick(Sender: TObject);
begin
  inherited;
{ TODO -oLema : Incompatible parameters in function DoChangePlantIDEx }
//  DoChangePlantID(self, Table1); { IQMS.COmmon.SetPlant.pas }
end;

end.
