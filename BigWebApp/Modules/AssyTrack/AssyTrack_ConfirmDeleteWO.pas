unit AssyTrack_ConfirmDeleteWO;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.DataSet,
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
  FireDAC.Comp.Client,
  uniGUIClasses,
  uniButton, uniCheckBox, uniPanel, uniEdit, uniDBEdit, uniLabel,
  uniPageControl, Vcl.Forms, uniGUIBaseClasses,UniGUIApplication;

type
  TFrmAssyTrackConfirmDeleteWO = class(TFrmStatusException)
    btnNo: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal(AWorkorder_ID: Real ): TModalResult;
  end;

implementation

{$R *.dfm}

{ TFrmAssyTrackConfirmDeleteWO }

class function TFrmAssyTrackConfirmDeleteWO.DoShowModal(AWorkorder_ID: Real): TModalResult;
var
  LFrmAssyTrackConfirmDeleteWO : TFrmAssyTrackConfirmDeleteWO;
begin
  LFrmAssyTrackConfirmDeleteWO := TFrmAssyTrackConfirmDeleteWO.Create(UniGUIApplication.UniApplication);
  Result:= LFrmAssyTrackConfirmDeleteWO.ShowModal;
end;

end.
