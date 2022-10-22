unit oe_rel_on_wave_chk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
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
  System.Classes, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses;

type
  TFrmReleaseOnWaveException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function IsReleaseOnWave( AReleases_ID: Real ): Boolean;
procedure CheckConfirmReleaseOnWave( AReleases_ID: Real );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.WebVcl.Jump, uniGUIApplication;

function IsReleaseOnWave( AReleases_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 from wave_pick_dtl where releases_id = %f', [ AReleases_ID ]) = 1;
end;


procedure CheckConfirmReleaseOnWave( AReleases_ID: Real );
var
  LFrmReleaseOnWaveException : TFrmReleaseOnWaveException;
begin
  if IsReleaseOnWave( AReleases_ID ) then
  begin
     LFrmReleaseOnWaveException := TFrmReleaseOnWaveException.Create(UniGUIApplication.UniApplication);
     LFrmReleaseOnWaveException.rcusto_ID := AReleases_ID;
     if not (LFrmReleaseOnWaveException.ShowModal = mrOK) then
       raise TIQNotAuthorizedException.Create;
  end;
end;



end.
