unit spc_gage_linearity;

interface

uses
  spc_gage_child_base,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel, Vcl.Forms, System.Classes, Vcl.Controls, Vcl.ExtCtrls, uniPanel;

type
  TFrmSPCGageLinearity = class(TFrmSPCGageChildBase)
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

{ TFrmSPCGageLinearity }

procedure TFrmSPCGageLinearity.RefreshData;
begin
  inherited;

end;

end.
