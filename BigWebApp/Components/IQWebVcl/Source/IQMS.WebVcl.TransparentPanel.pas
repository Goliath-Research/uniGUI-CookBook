unit IQMS.WebVcl.TransparentPanel;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, uniGUIBaseClasses,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniPanel, uniCommonClasses;

type
  TIQWebTransparentPanel = class(TUniPanel)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  published
    { Published declarations }
  end;
implementation



{ TIQWebTransparentPanel }

constructor TIQWebTransparentPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ClientEvents.ExtEvents.Values['afterrender']:=
    ' function afterrender(sender, eOpts) '+
    ' { '+
    ' sender.setBodyStyle("background","transparent"); '+
    ' sender.setBodyStyle("frame",false); '+
    ' sender.setBodyStyle("border","none"); '+
    ' }';
end;

end.
