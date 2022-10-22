unit wo_alloc_filter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  wo_misc,
  IQMS.WebVcl.SecurityRegister,
  Mask,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmWOHardAllocFilter = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SR: TIQWebSecurityRegister;
    rbtnNone: TUniRadioButton;
    rbtnDivision: TUniRadioButton;
    rbtnWorkZone: TUniRadioButton;
    wwDBComboDlgDivision: TUniEdit;
    PkDivision: TIQWebHPick;
    PkDivisionID: TBCDField;
    PkDivisionNAME: TStringField;
    PkDivisionDESCRIP: TStringField;
    PkDivisionEPLANT_ID: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBComboDlgDivisionCustomDlg(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FDivision_ID: Real;
    FCargo: TWOHardAllocCargo;
    procedure SetDivision_ID(const Value: Real);
    procedure Validate;
    procedure LoadFrom(ACargo: TWOHardAllocCargo);
    procedure SetCargo(const Value: TWOHardAllocCargo);
    property Division_ID: Real read FDivision_ID write SetDivision_ID;
  public
    { Public declarations }
    class function DoShowModal(var ACargo: TWOHardAllocCargo): Boolean;
    procedure SaveTo(var ACargo: TWOHardAllocCargo);
    property Cargo: TWOHardAllocCargo write SetCargo;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  { TODO -oSanketG -cWC : Need to revisit }
  //IQSecIns,
  IQMS.Common.SysShare,
  wo_rscstr;

{ TFrmWOHardAllocFilter }

class function TFrmWOHardAllocFilter.DoShowModal
  (var ACargo: TWOHardAllocCargo): Boolean;
var
  FrmWOHardAllocFilter: TFrmWOHardAllocFilter;
begin
  FrmWOHardAllocFilter := self.Create(uniGUIApplication.UniApplication);
  with FrmWOHardAllocFilter do
  begin
    try
      Cargo := ACargo;
      Result := ShowModal = mrOK;
      if Result then
        SaveTo(ACargo);
    finally
      Release;
    end;
  end;
end;

procedure TFrmWOHardAllocFilter.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);

  rbtnDivision.Caption := IQMS.Common.SysShare.CheckReplaceDivisionCaption
    (rbtnDivision.Caption);
end;

procedure TFrmWOHardAllocFilter.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(self, [self]);
  { TODO -oSanketG -cWC : Need to revisit, dependent on IQSecIns }
  //EnsureSecurityInspectorOnTopOf(self);
  LoadFrom(FCargo);
end;

procedure TFrmWOHardAllocFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmWOHardAllocFilter.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult := mrOK;
end;

procedure TFrmWOHardAllocFilter.SetCargo(const Value: TWOHardAllocCargo);
begin
  FCargo := Value;
end;

procedure TFrmWOHardAllocFilter.SetDivision_ID(const Value: Real);
begin
  FDivision_ID := Value;
  wwDBComboDlgDivision.Text := SelectValueByID('name', 'division',
    FDivision_ID);
end;

procedure TFrmWOHardAllocFilter.wwDBComboDlgDivisionCustomDlg(Sender: TObject);
begin
  if not rbtnDivision.Checked then
    EXIT;

  with PkDivision do
    if Execute then
      Division_ID := GetValue('ID');
end;

procedure TFrmWOHardAllocFilter.SaveTo(var ACargo: TWOHardAllocCargo);
begin
  ACargo.Division_ID := 0;

  if rbtnDivision.Checked then
  begin
    ACargo.FilterType := aftDivision;
    ACargo.Division_ID := Division_ID;
  end

  else if rbtnWorkZone.Checked then
    ACargo.FilterType := aftWorkZoneLoc

  else
    ACargo.FilterType := aftNone;
end;

procedure TFrmWOHardAllocFilter.LoadFrom(ACargo: TWOHardAllocCargo);
begin
  if ACargo.FilterType = aftDivision then
  begin
    rbtnDivision.Checked := True;
    Division_ID := ACargo.Division_ID;
  end

  else if ACargo.FilterType = aftWorkZoneLoc then
    rbtnWorkZone.Checked := True

  else
    rbtnNone.Checked := True;
end;

procedure TFrmWOHardAllocFilter.Validate;
begin
  if rbtnDivision.Checked then
    // wo_rscstr.cTXT0000014 = 'Please select a Division.';
    IQAssert(Division_ID > 0, wo_rscstr.cTXT0000014);
end;

end.
