unit IQMS.WebComponents.RegisterComponents;

interface

uses
  System.Classes, DesignIntf;

procedure Register;

implementation

uses
  IQMS.WebComponents.DataControllerList,
  IQMS.WebComponents.MenuToActionList,
  IQMS.WebComponents.MenuToActionListEditor;

procedure Register;
begin
  RegisterClass(TIQDataControllerLinks);
  RegisterClass(TIQDataControllerLink);

  RegisterComponents('IQMS Web Contoller', [TIQDataControllerLinkList]);

  RegisterComponents('IQMS Web Contoller', [TIQMenuToActionList]);

  RegisterComponentEditor(TIQMenuToActionList, TIQMenuToActionListEditor);
end;

end.
