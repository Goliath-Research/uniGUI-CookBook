unit Germany_Form;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls;

type
  TFrmGermany = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    EdCustomer: TUniEdit;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    EdGL: TUniEdit;
    Label3: TUniLabel;
    EditGlYear: TUniEdit;
    PkYear: TIQWebHPick;
    PkYearID: TBCDField;
    PkYearDESCRIPTION: TStringField;
    PkYearEPLANT_ID: TBCDField;
    Panel1: TUniPanel;
    RbCustomer: TUniCheckBox;
    RBGL: TUniCheckBox;
    SBSearchPurch: TUniSpeedButton;
    EdVendor: TUniEdit;
    RbVendor: TUniCheckBox;
    EdAcct: TUniEdit;
    EdVat: TUniEdit;
    lblEPlant: TUniLabel;
    sbtnEPlant: TUniSpeedButton;
    PkEplant: TIQWebHPick;
    PkEplantECODE: TStringField;
    PkEplantCOMPANY_NAME: TStringField;
    PkEplantPLANT_ID: TBCDField;
    PkEplantPLANT_NAME: TStringField;
    edEplant: TUniEdit;
    PopupMenu1: TUniPopupMenu;
    UnAssignEplant1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure SBSearchPurchClick(Sender: TObject);
    procedure sbtnEPlantClick(Sender: TObject);
    procedure UnAssignEplant1Click(Sender: TObject);
    procedure PkYearBeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FCustomerFile, FGLFile, FVendorFile, FGLAcctFile, FVatFile: String;
    FGlYearId: Real;
    FResult: boolean;
    FEplantId: Real;
  public
    { Public declarations }
  //  constructor Create(aOwner: TComponent); override;
  end;

function GetGermanyInfo(var aCustomerFile: String;
  var aVendorFile: String; var aGLFile: String; var aGLAcctFile: String;
  var aVatFile: String; var aGlYearId: Real; var aEplantId: Real): boolean;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{$R *.dfm}

function GetGermanyInfo(var aCustomerFile: String;
  var aVendorFile: String; var aGLFile: String; var aGLAcctFile: String;
  var aVatFile: String; var aGlYearId: Real; var aEplantId: Real): boolean;
var
  LFrmGermany: TFrmGermany;
begin
  // with TFrmGermany.Create(aOwner) do
  LFrmGermany := TFrmGermany.Create(uniGUIApplication.UniApplication);
  with LFrmGermany do
  begin
    ShowModal;
    aCustomerFile := FCustomerFile;
    aVendorFile := FVendorFile;
    aGLFile := FGLFile;
    aGLAcctFile := FGLAcctFile;
    aVatFile := FVatFile;
    aGlYearId := FGlYearId;
    aEplantId := FEplantId;
    Result := FResult;
  end;
end;

procedure TFrmGermany.UniFormCreate(Sender: TObject);
var
  AType: Integer;
  ATypeStr: String;
begin
  FResult := false;
  FCustomerFile := '';
  FGlYearId := 0;
  FEplantId := 0;
  IQRegFormRead(Self, [Self]);
end;

procedure TFrmGermany.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmGermany.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmGermany.BtnOkClick(Sender: TObject);
begin
  FCustomerFile := '';
  FGLFile := '';
  FGLAcctFile := '';
  {
    if RbCustomer.Checked and (EdCustomer.Text = '') then
    raise exception.create('No Customer File Name Specified.');

    if RbVendor.Checked and (EdVendor.Text = '') then
    raise exception.create('No Vendor File Name Specified.');


    if RbGL.Checked and (EdGL.Text = '') then
    raise exception.create('No FG File Name Specified.');
  }
  if (EdCustomer.Text = '') then
    raise exception.Create('No Customer File Name Specified.');

  if (EdVendor.Text = '') then
    raise exception.Create('No Vendor File Name Specified.');

  if (EdGL.Text = '') then
    raise exception.Create('No GL File Name Specified.');

  if (EdAcct.Text = '') then
    raise exception.Create('No GL Account File Name Specified.');

  if (EdVat.Text = '') then
    raise exception.Create('No VAT File Name Specified.');

  if FGlYearId = 0 then
    raise exception.Create('No GL Year Specified.');

  // if RbCustomer.Checked and (EdCustomer.Text <> '') then
  FCustomerFile := EdCustomer.Text;

  // if RbVendor.Checked and (EdVendor.Text <> '') then
  FVendorFile := EdVendor.Text;

  FVatFile := EdVat.Text;

  // if RbGL.Checked and (EdGL.Text <> '') then
  FGLFile := EdGL.Text;
  FGLAcctFile := EdAcct.Text;

  FResult := true;
  Close;
end;

procedure TFrmGermany.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmGermany.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

procedure TFrmGermany.SBSearchPurchClick(Sender: TObject);
var
  aYear: String;
begin
  with PkYear do
    if Execute then
    begin
      FGlYearId := GetValue('ID');
      EditGlYear.ReadOnly := false;
      EditGlYear.Text := GetValue('DESCRIPTION');
      EditGlYear.ReadOnly := true;

      aYear := SelectValueFmtAsString
        ('select to_char(start_date, ''RRRR'') from glyear where id = %f',
        [FGlYearId]);

      EdGL.Text := 'General_Journal.csv';

    end;

end;

procedure TFrmGermany.sbtnEPlantClick(Sender: TObject);
begin
  with PkEplant do
    if Execute then
    begin
      FEplantId := GetValue('PLANT_ID');
      edEplant.ReadOnly := false;
      edEplant.Text := Format('%s (%d)', [GetValue('PLANT_NAME'),
        Trunc(FEplantId)]);
      edEplant.ReadOnly := true;

      EditGlYear.ReadOnly := false;
      EditGlYear.Text := '';
      EditGlYear.ReadOnly := true;

    end;
end;

procedure TFrmGermany.UnAssignEplant1Click(Sender: TObject);
begin
  FEplantId := 0;
  edEplant.ReadOnly := false;
  edEplant.Text := '';
  edEplant.ReadOnly := true;

  EditGlYear.ReadOnly := false;
  EditGlYear.Text := '';
  EditGlYear.ReadOnly := true;
end;

procedure TFrmGermany.PkYearBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('aEplantId').asFloat := FEplantId;
end;

end.
