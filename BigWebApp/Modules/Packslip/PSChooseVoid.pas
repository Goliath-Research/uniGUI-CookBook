unit PSChooseVoid;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  pngimage,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniImage;

type
  TFrmPSChooseVoid = class(TUniForm)
    pnlBtm: TUniPanel;
    pnlMsg: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SR: TIQWebSecurityRegister;
    Image1: TUniImage;
    lblMessage: TUniLabel;
    lblMessage2: TUniLabel;
    GroupBox1: TUniGroupBox;
    rbtLocbyItem: TUniRadioButton;
    rbtAllItemsOneLoc: TUniRadioButton;
    edtLoc: TUniEdit;
    sbtPickLoc: TUniSpeedButton;
    PkLoc: TIQWebHPick;
    PkLocID: TBCDField;
    PkLocLOCATION: TStringField;
    PkLocDESCRIPTION: TStringField;
    PkLocPATH: TBCDField;
    PkLocEPLANT_NAME: TStringField;
    PkLocDIVISION: TStringField;
    PkLocPK_HIDE: TStringField;
    PkLocBUILDING: TStringField;
    PkLocDIVISION_ID: TBCDField;
    PnlButtonsInner: TUniPanel;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbtAllItemsOneLocClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure PkLocBeforeOpen(DataSet: TDataSet);
    procedure sbtPickLocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FLocations_ID: Real;
    FDivision_ID: Real;
    procedure SetDivision_ID(const Value: Real);
    procedure SetLocations_ID(const Value: Real);
  public
    { Public declarations }
    class function DoShowModal(var ALocations_ID: Real;
      ADivision_ID: Real): TModalResult;
    property Locations_ID : Real write SetLocations_ID;
    property Division_ID : Real write SetDivision_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebConvert : Dependency on Files
  IQSecIns, }
  packslip_rscstr,
  IQMS.WebVcl.ResourceStrings;

{ TFrmPSChooseVoid }

class function TFrmPSChooseVoid.DoShowModal(var ALocations_ID: Real; ADivision_ID: Real): TModalResult;
var
  LFrmPSChooseVoid : TFrmPSChooseVoid;
begin
  LFrmPSChooseVoid := TFrmPSChooseVoid.Create(UniGUIApplication.UniApplication);
  LFrmPSChooseVoid.Division_ID := ADivision_ID;
  LFrmPSChooseVoid.sbtPickLoc.Visible := LFrmPSChooseVoid.rbtAllItemsOneLoc.Checked;
  LFrmPSChooseVoid.edtLoc.Visible := LFrmPSChooseVoid.sbtPickLoc.Visible;
  Result := LFrmPSChooseVoid.ShowModal;
  if Result = mrOK then
  begin
    ALocations_ID := LFrmPSChooseVoid.FLocations_ID;
  end;
end;

procedure TFrmPSChooseVoid.FormCreate(Sender: TObject);
begin
  //You are about to void a packing slip.
  lblMessage.Caption := IQMS.WebVcl.ResourceStrings.cTXT0000418;

  //Please select a voiding method before continuing.
  lblMessage2.Caption := IQMS.WebVcl.ResourceStrings.cTXT0000419;
end;

procedure TFrmPSChooseVoid.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
{ TODO -oGPatil -cWebConvert : Dependency on Files
  EnsureSecurityInspectorOnTopOf(self);  }
end;

procedure TFrmPSChooseVoid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmPSChooseVoid.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmPSChooseVoid.btnOKClick(Sender: TObject);
begin
  if rbtAllItemsOneLoc.Checked then
    //packslip_rscstr.cTXT0000078 = 'Please select a location.';
    IQAssert(FLocations_ID > 0, packslip_rscstr.cTXT0000078);

  if rbtLocbyItem.Checked then
    FLocations_ID := - 1;

  ModalResult := mrOK;

end;

procedure TFrmPSChooseVoid.PkLocBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'division_id', FDivision_ID);
end;

procedure TFrmPSChooseVoid.rbtAllItemsOneLocClick(Sender: TObject);
begin
  edtLoc.Visible := rbtAllItemsOneLoc.Checked;
  sbtPickLoc.Visible := edtLoc.Visible;
  if rbtLocbyItem.Checked then
  begin
    FLocations_ID := - 1;
    edtLoc.Text := '';
  end;
end;

procedure TFrmPSChooseVoid.sbtPickLocClick(Sender: TObject);
begin
  with PkLoc do
    if Execute then
    begin
      FLocations_ID := GetValue('id');
      edtLoc.Text := GetValue('location');
    end;
end;

procedure TFrmPSChooseVoid.SetDivision_ID(const Value: Real);
begin
  FDivision_ID := Value;
end;

procedure TFrmPSChooseVoid.SetLocations_ID(const Value: Real);
begin
  FLocations_ID := Value;
end;

end.
