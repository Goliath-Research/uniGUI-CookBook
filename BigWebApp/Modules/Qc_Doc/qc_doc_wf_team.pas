unit qc_doc_wf_team;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  wf_specific_team_base,
  Menus,
  DB,
  Wwdatsrc,
  StdCtrls,
  Mask,
  wwdbedit,
  Wwdotdot,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  DBCtrls,
  Buttons,
  ExtCtrls,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.About, FireDAC.Comp.Client,
  IQMS.WebVcl.HPick, uniMainMenu, FireDAC.Comp.DataSet, uniGUIBaseClasses,
  uniGUIClasses, uniEdit, IQUniGrid, uniGUIFrame;

type
  TFrmDOCWorkflowTeam = class(TFrmWorkflowSpecificTeamBase)
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow( ATeam_Member_ID: Real = 0 );
  end;

{var
  FrmDOCWorkflowTeam: TFrmDOCWorkflowTeam;}

implementation

{$R *.dfm}

{ TFrmDOCWorkflowTeam }

class procedure TFrmDOCWorkflowTeam.DoShow(ATeam_Member_ID: Real);
begin
   inherited DoShow('USED_DOC', ATeam_Member_ID );
end;

end.
