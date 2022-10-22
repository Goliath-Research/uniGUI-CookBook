unit assy_data_confirm_delete_wo;

interface

uses
  Winapi.Windows,
  AssyTrack_ConfirmDeleteWO,
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
  uniDBEdit, uniLabel, uniPageControl, Vcl.Forms, uniGUIBaseClasses;

type
  TFrmAssyDataConfirmDeleteWO = class(TFrmAssyTrackConfirmDeleteWO)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
