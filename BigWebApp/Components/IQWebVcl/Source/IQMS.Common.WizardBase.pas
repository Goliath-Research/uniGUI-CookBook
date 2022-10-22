// ***  Wizard Base - Ancestor unit for wizards.  ***
// *
// *  Purpose:      Provide a basic wizard ancestor form, with just
// *                essential functionality.
// *
// *  Development:  Build a descendent form based on this unit.  You can override
// *                the virtual methods, as needed.

unit IQMS.Common.WizardBase;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Menus,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniPageControl, uniMainMenu, Vcl.Controls;

type
  { TWizardBtn }
  TWizardBtn = (wbPrior, wbNext, wbFinish);

  { TFrmWizardBase }
  TFrmWizardBase = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlMain: TUniPanel;
    pcMain: TUniPageControl;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    PnlWizardBtnsRight: TUniPanel;
    btnClose: TUniBitBtn;
    btnBack: TUniBitBtn;
    btnNext: TUniBitBtn;
    btnFinish: TUniBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure DoClickNextClick(Sender: TObject);
    procedure DoWizardBtnClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    // method for wizard buttons
    procedure DoButtonClick(AWizardButton: TWizardBtn); virtual;
    // contains basics for wizard buttons
    procedure SetButtons; virtual;
    // whatever happens when Finish is pressed
    procedure DoFinishAction; virtual; abstract;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm;

{ TFrmWizardBase }

procedure TFrmWizardBase.FormCreate(Sender: TObject);
begin
  AdjustPageControlToParent(pcMain, 1); // IQMS.Common.Controls.pas
end;

procedure TFrmWizardBase.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  SetButtons;
end;

procedure TFrmWizardBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmWizardBase.DoButtonClick(AWizardButton: TWizardBtn);
var
  i: Integer;
begin
  // Each wizard button calls this, pass the appropriate TWizardBtn value
  Application.ProcessMessages; // let the button click finish
  case AWizardButton of
    wbPrior: // Prior
      begin
        i := pcMain.ActivePageIndex - 1;
        if i >= 0 then
          pcMain.ActivePageIndex := i;
      end;
    wbNext: // Next
      begin
        i := pcMain.ActivePageIndex + 1; // next index
        if i < pcMain.PageCount then
          pcMain.ActivePageIndex := i;
      end;
    wbFinish: // Finish
      DoFinishAction; // see virtual method below
  end;
  SetButtons;
end;

procedure TFrmWizardBase.DoClickNextClick(Sender: TObject);
begin
  DoButtonClick(wbNext);
end;

procedure TFrmWizardBase.SetButtons;
begin
  // Basic wizard Vcl.Buttons
  btnBack.Enabled := (pcMain.ActivePageIndex > 0);
  btnNext.Enabled := (pcMain.ActivePageIndex >= 0) and
    (pcMain.ActivePageIndex < (pcMain.PageCount - 1));
  btnFinish.Enabled := (pcMain.ActivePageIndex = (pcMain.PageCount - 1));
end;

procedure TFrmWizardBase.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmWizardBase.DoWizardBtnClick(Sender: TObject);
var
  ATag: Integer;
begin
  // The tag should correspond to the ordinal value of the TWizardBtn type
  if Sender = nil then
    Exit;
  ATag := TComponent(Sender).Tag;
  if (ATag in [Ord(low(TWizardBtn)) .. Ord(high(TWizardBtn))]) then
    DoButtonClick(TWizardBtn(ATag));
end;

procedure TFrmWizardBase.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.
