unit Pmdate01;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniDateTimePicker,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniRadioGroup;

type
  TFrmPMDatesDialog = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlMain: TUniPanel;
    PnlDates: TUniPanel;
    gbDates: TUniGroupBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    dtpFromDate: TUniDateTimePicker;
    dtpToDate: TUniDateTimePicker;
    PnlOption: TUniPanel;
    rgOption: TUniRadioGroup;
    PnlButtonsRight: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure btnOKClick(Sender: TObject);
    procedure rgOptionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

function DoPMDatesDialog(var AByDateRange: Boolean;
  var AFrom, ATo: TDateTime): Boolean;

var
  FrmPMDatesDialog: TFrmPMDatesDialog;

implementation

{$R *.DFM}


uses
  IQMS.Common.Dates,
  IQMS.Common.RegFrm,
  pm_rscstr;

function DoPMDatesDialog(var AByDateRange: Boolean;
  var AFrom, ATo: TDateTime): Boolean;
begin
FrmPMDatesDialog := TFrmPMDatesDialog.Create(UniGUIApplication.UniApplication);

  with FrmPMDatesDialog do
    try
       if AFrom > 1 then
        dtpFromDate.DateTime := AFrom
      else
        dtpFromDate.DateTime := IQOracleAdjustedDate;
      { To Date }
      if ATo > 1 then
        dtpToDate.DateTime := ATo
      else
        dtpToDate.DateTime := dtpFromDate.DateTime;
      { Group Option }
      if AByDateRange = TRUE then
        rgOption.ItemIndex := 1
      else
        rgOption.ItemIndex := 0;

      Result := ShowModal = mrOK;
      if Result then
        begin
          AByDateRange := (rgOption.ItemIndex = 1);
          AFrom := Trunc(dtpFromDate.DateTime );
          ATo := Trunc(dtpToDate.DateTime );
        end;
    finally
      Release;
    end
end;


procedure TFrmPMDatesDialog.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]);
  rgOptionClick(NIL);
end;

procedure TFrmPMDatesDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite(Self, [Self]);
end;

procedure TFrmPMDatesDialog.btnOKClick(Sender: TObject);
begin
  if dtpFromDate.DateTime > dtpToDate.DateTime then
    { 'The "From Date" is greater than the "To Date."  Please select
      different values.' }
    raise Exception.Create(pm_rscstr.cTXT0000273);
  ModalResult := mrOK;
end;

procedure TFrmPMDatesDialog.rgOptionClick(Sender: TObject);
begin
  Application.ProcessMessages;
  case rgOption.ItemIndex of
    0:
      begin
        dtpFromDate.Enabled := FALSE;
        dtpToDate.Enabled := FALSE;
        dtpFromDate.Color := clBtnFace;
        dtpToDate.Color := clBtnFace;
      end;
    1:
      begin
        dtpFromDate.Enabled := TRUE;
        dtpToDate.Enabled := TRUE;
        dtpFromDate.Color := clWindow;
        dtpToDate.Color := clWindow;
      end;
  end;
end;

end.
