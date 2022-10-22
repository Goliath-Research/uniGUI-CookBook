unit PoRel_Dlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Paste_Rel_OE,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.Rep_Releases,
//  Rep_Releases,
  Vcl.Buttons,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TRelInputCargo = record
    Count     : Integer;
    Qty_Per   : Real;
    Start_Date: TDateTime;
    LeadDays  : integer;
    Interval  : Real;
    Overwrite : Boolean;
    UseBlanket: Boolean;
    AllItems  : Boolean;
    Forecast  : Boolean;
    Date_Type : string;
    RepInterval: TRepeatingReleases;
  end;

  TFrmNewPoReleasesDialog = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    PnlRight1: TUniPanel;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    edtCount: TUniEdit;
    edtQty: TUniEdit;
    dtpStartDate: TUniDateTimePicker;
    chkBlanket: TUniCheckBox;
    PnlBtm1: TUniPanel;
    chkAllItems: TUniCheckBox;
    btnAppend: TUniButton;
    brnOverwrite: TUniButton;
    btnCancel: TUniButton;
    Splitter2: TUniSplitter;
    chkForecast: TUniCheckBox;
    Bevel1: TUniPanel;
    SR: TIQWebSecurityRegister;
    edInterval: TUniEdit;
    btnedtInterval: TUniSpeedButton;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure chkBlanketClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnedtIntervalRightButtonClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FPasteMode: TPasteMode;
    FRelInputCargo: TRelInputCargo;
    procedure SetRelInputCargo(const Value: TRelInputCargo);
    function GetRelInputCargo: TRelInputCargo;
    procedure LoadFrom( var ARelInputCargo: TRelInputCargo );
    procedure SaveTo( var ARelInputCargo: TRelInputCargo );
  public
    { Public declarations }
    property RelInputCargo :TRelInputCargo read getRelInputCargo write SetRelInputCargo;
  end;

function DoReleasesDialog(var ARelInputCargo: TRelInputCargo ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  { TODO -oLema : Dependent on IQSecIns }
//  IQSecIns,
  po_rscstr;

function DoReleasesDialog( var ARelInputCargo: TRelInputCargo ): Boolean;
var
  frm: TFrmNewPoReleasesDialog;
begin
  frm := TFrmNewPoReleasesDialog.Create(uniGUIApplication.UniApplication);
  frm.RelInputCargo := ARelInputCargo;
  frm.LoadFrom( frm.FRelInputCargo );
  Result:= (frm.ShowModal = mrOK);
  if Result then
    frm.SaveTo( ARelInputCargo );

end;

procedure TFrmNewPoReleasesDialog.UniFormCreate(Sender: TObject);
begin
  FPasteMode:= pmCancel;
end;

procedure TFrmNewPoReleasesDialog.FormShow(Sender: TObject);
var
  AScalarValue: Boolean;
begin
  IQRegFormRead( self, [ self, PnlLeft01, PnlRight1 ]);
  if IQRegBooleanScalarRead( self, 'UseBlanket', AScalarValue ) then
     chkBlanket.Checked:= AScalarValue;

  if IQRegBooleanScalarRead( self, 'Forecast', AScalarValue ) then
     chkForecast.Checked:= AScalarValue;

  if IQRegBooleanScalarRead( self, 'AllItems', AScalarValue ) then
     chkAllItems.Checked:= AScalarValue;

  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlBtm1);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlRight1);

  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf( self );
end;


procedure TFrmNewPoReleasesDialog.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
//  Action := caFree;
  IQRegFormWrite( self, [ self, PnlLeft01, PnlRight1 ]);
  IQRegBooleanScalarWrite( self, 'UseBlanket', chkBlanket.Checked );
  IQRegBooleanScalarWrite( self, 'AllItems', chkAllItems.Checked );
  IQRegBooleanScalarWrite( self, 'Forecast', chkForecast.Checked );
end;

procedure TFrmNewPoReleasesDialog.LoadFrom( var ARelInputCargo: TRelInputCargo );
begin
  with ARelInputCargo do
  begin
    edtCount.Text            := IntToStr( IIf( Count = 0, 1, Count ));
    dtpStartDate.DateTime    := IIf( Start_Date = 0, Date, Start_Date + LeadDays);

    if RepInterval.recType = rtOld then
      begin
        RepInterval.recType         := rtDaily;
        RepInterval.dailyOption     := doEverySomeDays;
        RepInterval.dailyEveryDays  := 7;
      end;

    edInterval.Text := RepInterval.GetReleaseType;

    edtQty.Text     := FloatToStr( Qty_Per );
  end;
end;

procedure TFrmNewPoReleasesDialog.SaveTo( var ARelInputCargo: TRelInputCargo );
begin
  with ARelInputCargo do
  begin
    Count     := StrToInt(edtCount.Text);
    Start_Date:= dtpStartDate.DateTime;

    RepInterval := FRelInputCargo.RepInterval;

    if chkBlanket.Checked then
       Qty_Per:= 0
    else
       Qty_Per:= StrToFloat(edtQty.Text);
    Overwrite := (FPasteMode = pmOverwrite);
    UseBlanket:= chkBlanket.Checked;
    Forecast  := chkForecast.Checked;
    AllItems  := chkAllItems.Checked;
  end;
end;

function TFrmNewPoReleasesDialog.GetRelInputCargo: TRelInputCargo;
begin
  Result := FRelInputCargo;
end;

procedure TFrmNewPoReleasesDialog.SetRelInputCargo(const Value: TRelInputCargo);
begin
  FRelInputCargo := Value;
end;

procedure TFrmNewPoReleasesDialog.btnOKClick(Sender: TObject);
var
  interval: integer;
begin
  {Validate}
  IQAssert( StrToInt(edtCount.Text) > 0,      'Number of releases must be greater than 0');
  IQAssert( chkBlanket.Checked or (StrToFloat(edtQty.Text) > 0), 'Qty must be greater than 0');
  if IsStringValidInteger(edInterval.Text, interval) then
  begin
    IQAssert( interval > 0, 'Number of intervals must be greater than 0');

    with FRelInputCargo.RepInterval do
    begin
      recType        := rtDaily;
      dailyOption    := doEverySomeDays;
      dailyEveryDays := interval;
    end;
  end;

  if (FRelInputCargo.LeadDays > 0) and
     (Date() + FRelInputCargo.LeadDays > dtpStartDate.DateTime) and
     not IQConfirmYNWithSecurity(po_rscstr.cTXT0000127, 'FrmPoBaseGenerateReleases', true)
    then
      dtpStartDate.DateTime := Date() + FRelInputCargo.LeadDays;

  if Sender = btnAppend then
     FPasteMode:= pmAppend
  else if Sender = brnOverwrite then
     FPasteMode:= pmOverwrite;

  ModalResult:= mrOK;
end;

procedure TFrmNewPoReleasesDialog.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmPO{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmNewPoReleasesDialog.btnedtIntervalRightButtonClick(Sender: TObject);
begin
  if TFrmRepeatingReleases.DoShowModal(FRelInputCargo.RepInterval) then
    edInterval.Text :=  FRelInputCargo.RepInterval.GetReleaseType;
end;

procedure TFrmNewPoReleasesDialog.chkBlanketClick(Sender: TObject);
begin
  IQEnableControl( edtQty, not chkBlanket.Checked );
  if chkBlanket.Checked then
     edtQty.Clear;
end;

end.
