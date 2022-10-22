unit Jpostall;

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
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmGJPostAll = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Panel3: TUniPanel;
    PnlCtrls: TUniPanel;
    SBPeriod: TUniSpeedButton;
    ComboBox1: TUniComboBox;
    DateTimePicker1: TUniDateTimePicker;
    EdPeriod: TUniEdit;
    procedure SBPeriodClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    FPeriodsId:Real;
    FGroupType:String;
    FDate:TDateTime;
    { Private declarations }
  public
    { Public declarations }
  end;

function GetGJPostAll(var AGroupType:String; var APeriodsId:Real; var ADate:TDateTime ):Boolean;

implementation

uses
  IQMS.Common.Period,
  IQMS.Common.AccountingShare,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;


{$R *.dfm}

function GetGJPostAll(var AGroupType:String; var APeriodsId:Real; var ADate:TDateTime ):Boolean;
var
  frm: TFrmGJPostAll;
begin
  frm := TFrmGJPostAll.Create(uniGUIApplication.UniApplication);
  with frm do
  begin
    Result := (ShowModal = mrOk);
    aPeriodsId := FPeriodsId;
    aGroupType := FGroupType;
    aDate      := Trunc(FDate);
  end;

end;

procedure TFrmGJPostAll.UniFormCreate(Sender: TObject);
begin
//  CenterForm(Self); // IQMS.Common.Controls.pas
  IQRegFormRead( self, [self]);
  DateTimePicker1.DateTime := Date;
  FPeriodsId := 0;
  FGroupType := ComboBox1.Text;
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCtrls);
end;

procedure TFrmGJPostAll.SBPeriodClick(Sender: TObject);
begin
  FPeriodsId := DoFindPeriod;
  CheckForOpenPeriod('gl_status', FPeriodsId);  {in IqAcct.pas}

  EdPeriod.Text := SelectValueFmtAsString('select period from glperiods where id = %f', [FPeriodsId]);
end;

procedure TFrmGJPostAll.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmGJPostAll.BtnOkClick(Sender: TObject);
begin
  FDate := DateTimePicker1.DateTime;
  FGroupType := ComboBox1.Text;
  if FGroupType = '' then
    raise exception.create('No Group Type specified');

  if FPeriodsId = 0 then
    raise exception.create('No GL Period specified');

  CheckForOpenPeriod('gl_status', FPeriodsId);  {in IqAcct.pas}


  ModalResult := mrOk;
end;

end.
