unit AssyTrack_CheckFinalAssyQtyZero;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
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
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses,UniGUIApplication;

type
  TFrmAssyTrackChkFinalAssyZero = class(TFrmStatusException)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal( AWorkorder_ID, AThisTransGoodParts: Real );
  end;

implementation

{$R *.dfm}

class procedure TFrmAssyTrackChkFinalAssyZero.DoShowModal(AWorkorder_ID, AThisTransGoodParts: Real);
var
  LFrmAssyTrackChkFinalAssyZero : TFrmAssyTrackChkFinalAssyZero;
begin
  if AThisTransGoodParts <> 0 then
     EXIT;
  LFrmAssyTrackChkFinalAssyZero := TFrmAssyTrackChkFinalAssyZero.Create(UniGUIApplication.UniApplication);
  if not (LFrmAssyTrackChkFinalAssyZero.ShowModal = mrOK) then
     //raise Exception.Create('Status exception has not been authorized - unable to proceed');
     raise TIQNotAuthorizedException.Create;
end;

procedure TFrmAssyTrackChkFinalAssyZero.FormCreate(Sender: TObject);
begin
  inherited;
  Label3.Visible:= False;
  DBEdit2.Visible:= False;
end;

end.
