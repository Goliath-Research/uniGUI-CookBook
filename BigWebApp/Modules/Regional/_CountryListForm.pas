unit _CountryListForm;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  _CountryListDataModule,
  Vcl.Buttons,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.RepDef,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniDBGrid, //TUniDBGridColumn
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TCountryListForm = class(TUniForm)
    PnlCountries: TUniPanel;
    Splitter1: TUniSplitter;
    PnlSubdivisions: TUniPanel;
    PnlToolbar: TUniPanel;
    Panel1: TUniPanel;
    CountryGrid: TIQUniGridControl;
    SubdivisionGrid: TIQUniGridControl;
    SearchCountriesButton: TUniSpeedButton;
    SearchSubdivisionButton: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    SR: TIQWebSecurityRegister;
    IQAbout1: TIQWebAbout;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Search1: TUniMenuItem;
    cmbGridCurrency: TUniEdit;
    PLocaleCountry: TUniPopupMenu;
    SelectCurrency1: TUniMenuItem;
    ClearCurrency1: TUniMenuItem;
    LoadDefaultCountryList1: TUniMenuItem;
    N1: TUniMenuItem;
    Bevel10: TUniPanel;
    sbtnMoveUp: TUniSpeedButton;
    sbtnMoveDown: TUniSpeedButton;
    sbtnMoveToTop: TUniSpeedButton;
    sbtnMoveToBottom: TUniSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Close1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure SearchSubdivisionButtonClick(Sender: TObject);
    procedure SelectCurrency1Click(Sender: TObject);
    procedure ClearCurrency1Click(Sender: TObject);
    procedure LoadDefaultCountryList1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
    procedure sbtnMoveUpClick(Sender: TObject);
    procedure sbtnMoveDownClick(Sender: TObject);
    procedure sbtnMoveToTopClick(Sender: TObject);
    procedure sbtnMoveToBottomClick(Sender: TObject);
    procedure CountryGridDBGridCellContextClick(Column: TUniDBGridColumn; X,
      Y: Integer);
  private
    { Private declarations }
    DM: TCountryListDataModule;
  public
    { Public declarations }
    class procedure DoShow;
    class procedure DoShowModal;
  end;

implementation

{$R *.dfm}


uses
  _LoadCountryListDialog,
  Country_RscStr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs;

class procedure TCountryListForm.DoShow;
var
  frm: TCountryListForm;
begin
  frm := TCountryListForm.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

class procedure TCountryListForm.DoShowModal;
var
  frm: TCountryListForm;
begin
  frm := TCountryListForm.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TCountryListForm.FormCreate(Sender: TObject);
begin
  DM := TCountryListDataModule.Create(Self);
  DM.Name := '';
  // Country_RscStr.cRscStr0004 =
  // 'Accessing country list.  Please wait...';
  IQSetTablesActiveEx(True, DM, Country_RscStr.cRscStr0004);


  { TODO -oLema : Unknown property: TIQUniGridControl.ControlType }
{
  CountryGrid.ControlType.Clear;
  CountryGrid.ControlType.Add('CURR_CODE;CustomEdit;cmbGridCurrency;F');
  CountryGrid.ControlType.Add('DEFAULT_SPELLING;CheckBox;Y;N');
  CountryGrid.ControlType.Add('PK_HIDE;CheckBox;Y;N');
}

end;

procedure TCountryListForm.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, SubdivisionGrid, PnlCountries]);
end;

procedure TCountryListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, SubdivisionGrid, PnlCountries]);
  DM.Free;
end;

procedure TCountryListForm.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TCountryListForm.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TCountryListForm.CountryGridDBGridCellContextClick(
  Column: TUniDBGridColumn; X, Y: Integer);
begin
  PLocaleCountry.Popup(X, Y);
end;

procedure TCountryListForm.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TCountryListForm.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TCountryListForm.Search1Click(Sender: TObject);
begin
  DM.SearchCountry;
end;

procedure TCountryListForm.SearchSubdivisionButtonClick(Sender: TObject);
begin
  DM.SearchSubdivision;
end;

procedure TCountryListForm.SelectCurrency1Click(Sender: TObject);
begin
  DM.SelectCurrency;
end;

procedure TCountryListForm.SRAfterApply(Sender: TObject);
begin
  cmbGridCurrency.Visible := False;

//  AutoSizeNavBar(CountryNavigator);
//  AutoSizeNavBar(SubdivisionNavigator);
end;

procedure TCountryListForm.ClearCurrency1Click(Sender: TObject);
begin
  DM.ClearCurrency;
end;

procedure TCountryListForm.LoadDefaultCountryList1Click(Sender: TObject);
var
  ADefaultSpellingsOnly: Boolean;
begin
  if TLoadCountryListDialog.DoShowModal(ADefaultSpellingsOnly) then
    DM.LoadDefaultCountryList(ADefaultSpellingsOnly);
end;

procedure TCountryListForm.sbtnMoveUpClick(Sender: TObject);
begin
  DM.MoveCountrySequenceUp;
end;

procedure TCountryListForm.sbtnMoveDownClick(Sender: TObject);
begin
  DM.MoveCountrySequenceDown;
end;

procedure TCountryListForm.sbtnMoveToTopClick(Sender: TObject);
begin
  DM.MoveCountrySequenceTop;
end;

procedure TCountryListForm.sbtnMoveToBottomClick(Sender: TObject);
begin
  DM.MoveCountrySequenceBottom;
end;

end.
