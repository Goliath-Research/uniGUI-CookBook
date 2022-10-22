unit FaPostDispo;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniDateTimePicker,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmFaPostDispo = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    Label2: TUniLabel;
    Label3: TUniLabel;
    SBPeriod: TUniSpeedButton;
    DateTimePicker1: TUniDateTimePicker;
    EdPeriod: TUniEdit;
    procedure SBPeriodClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
    FPeriodsId:Real;
    FDate:TDateTime;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
  end;

function GetFaPostDispo(AOwner:TComponent; var APeriodsId:Real; var ADate:TDateTime ):Boolean;


var
  FrmFaPostDispo: TFrmFaPostDispo;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Period,
  IQMS.Common.AccountingShare;
{$R *.dfm}

function GetFaPostDispo(AOwner:TComponent; var APeriodsId:Real; var ADate:TDateTime ):Boolean;
begin
  with TFrmFaPostDispo.Create(AOwner) do
  try
    ShowModal;
    aPeriodsId := FPeriodsId;
    aDate      := Trunc(FDate);
    Result := ModalResult = mrOk;
  finally
    Free;
  end;
end;

constructor TFrmFaPostDispo.Create(AOwner:TComponent);
begin
  inherited;
  IQRegFormRead( self, [self]);
  DateTimePicker1.Date := Date;
  FPeriodsId := 0;
end;

procedure TFrmFaPostDispo.SBPeriodClick(Sender: TObject);
begin
  FPeriodsId := DoFindPeriod(self);
  CheckForOpenPeriod('gl_status', FPeriodsId);  {in IqAcct.pas}

  EdPeriod.Text := SelectValueFmtAsString('select period from glperiods where id = %f', [FPeriodsId]);
end;

procedure TFrmFaPostDispo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmFaPostDispo.BtnOkClick(Sender: TObject);
begin
  FDate := DateTimePicker1.Date;

  if FPeriodsId = 0 then
    raise exception.create('No GlPeriod specified');

  CheckForOpenPeriod('gl_status', FPeriodsId);  {in IqAcct.pas}


  ModalResult := mrOk;
end;

end.
