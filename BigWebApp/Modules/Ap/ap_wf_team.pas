unit ap_wf_team;

interface

uses
  Winapi.Windows,
  System.Classes,
  wf_specific_team_base,
  Data.DB,
  vcl.wwdatsrc,
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
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  FireDAC.Comp.DataSet,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  Vcl.Buttons, uniMainMenu, uniGUIBaseClasses, uniGUIClasses, uniEdit,
  IQUniGrid, Vcl.Forms, uniGUIFrame;

type
  TFrmAPWorkflowTeam = class(TFrmWorkflowSpecificTeamBase)
    TblTeamUSED_AP: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow(ATeam_Member_ID: Real = 0 );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.HelpHook;

{ TFrmAPWorkflowTeam }

class procedure TFrmAPWorkflowTeam.DoShow(ATeam_Member_ID: Real);
begin
  inherited DoShow('USED_AP', ATeam_Member_ID );
end;

end.
