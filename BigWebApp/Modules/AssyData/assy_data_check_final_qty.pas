unit assy_data_check_final_qty;

interface

uses
  Winapi.Windows,
  AssyTrack_CheckFinalAssyQty,
  Mask,
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
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Controls,
  System.Classes, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, Vcl.Forms, uniGUIBaseClasses,UniGUIApplication;

type
  TFrmAssyDataFinalAssembyQtyCheck = class(TFrmAssyTrackFinalAssembyQtyCheck)
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

end.
