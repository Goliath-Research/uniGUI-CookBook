unit spc_gage_stability;

interface

uses
  spc_gage_child_base,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel, System.Classes, Vcl.Controls, Vcl.Forms, uniPanel;

type
  TFrmSPCGageStability = class(TFrmSPCGageChildBase)
    Label1: TUniLabel;
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrmSPCGageStability }

procedure TFrmSPCGageStability.RefreshData;
begin
  inherited;

end;

end.
