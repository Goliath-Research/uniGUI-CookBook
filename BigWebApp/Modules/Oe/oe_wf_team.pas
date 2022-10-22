unit oe_wf_team;

interface

uses
  Winapi.Windows,
  System.Classes,
  wf_specific_team_base,
  Data.DB,
  vcl.wwdatsrc,
  FireDAC.Comp.DataSet,
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
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  Vcl.Buttons, uniMainMenu, uniGUIBaseClasses, uniGUIClasses, uniEdit,
  IQUniGrid, Vcl.Forms, uniGUIFrame;

type
  TFrmOEWorkflowTeam = class(TFrmWorkflowSpecificTeamBase)
    TblTeamUSED_OE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow( ATeam_Member_ID: Real = 0 );
  end;


implementation

{$R *.dfm}

{ TFrmWorkflowSpecificTeamBase1 }

class procedure TFrmOEWorkflowTeam.DoShow(ATeam_Member_ID: Real);
begin
  inherited DoShow( 'USED_OE', ATeam_Member_ID );
end;

end.
