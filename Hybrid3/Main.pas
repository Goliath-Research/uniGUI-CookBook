unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniLabel,
  uniButton, uniToolBar, uniBitBtn, Vcl.Menus, uniMainMenu;

type
  TMainForm = class(TUniForm)
    UniToolBar1: TUniToolBar;
    btnEditUsers: TUniToolButton;
    btnEditOrders: TUniToolButton;
    btnReportSales: TUniToolButton;
    UniMainMenu1: TUniMainMenu;
    Main1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Administration1: TUniMenuItem;
    EditUsers1: TUniMenuItem;
    Operations1: TUniMenuItem;
    EditOrders1: TUniMenuItem;
    Reports1: TUniMenuItem;
    ReportSales1: TUniMenuItem;
    Logoff1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TMainForm.Logoff1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
