unit BomInputQry;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  { TODO -oathite -cWebConvert : Unit 'IQMS.Common.UserMessages' not found.
  IQMS.Common.UserMessages,                                                 }
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniDateTimePicker, uniDBDateTimePicker;

type
  TFrmBomInputQry = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Button1: TUniButton;
    Button2: TUniButton;
    Bevel1: TUniPanel;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    CheckBox1: TUniCheckBox;
    Edit1: TUniEdit;
    Edit2: TUniEdit;
    wwDBDateTimePicker1: TUniDBDateTimePicker;
    CheckBox2: TUniCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    { TODO -oathite -cWebConvert : Dpends on IQMS.Common.UserMessages
    procedure IQAfterShowMessage(var Msg: TMessage); message iq_AfterShowMessage; }
  public
    { Public declarations }
  end;

function GetRFQNumber(var S: string; var ARev: Real; var PriceUpdate: Boolean; var StdCostUpdate: Boolean; var DueDate:TDateTime):Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  bom_share;

function GetRFQNumber(var S: string; var ARev: Real; var PriceUpdate: Boolean;  var StdCostUpdate: Boolean; var DueDate:TDateTime):Boolean;
var
  LFrmBomInputQry : TFrmBomInputQry;
begin
  LFrmBomInputQry := TFrmBomInputQry.Create( uniGUIApplication.UniApplication );
  if SelectValueAsString('select NVL(IS_QUOTE_DUE_DATE_MANDATORY, ''N'') from qparams where rownum < 2') = 'N' then
    begin
    LFrmBomInputQry.Label3.Visible := false;
    LFrmBomInputQry.wwDBDateTimePicker1.Visible := false;
    LFrmBomInputQry.Height := 169;
    LFrmBomInputQry.Constraints.MaxHeight := 169;
  end;
  LFrmBomInputQry.Edit1.Text := GetNextRFQ(LFrmBomInputQry.Edit1.Text);
  { bom_share.pas }
  { TODO : windows message
    PostMessage(Handle, iq_AfterShowMessage, 0, 0); }

  LFrmBomInputQry.ShowModal;

  Result := LFrmBomInputQry.ModalResult = mrOk;
  if Result then
  begin
    S := Trim(UpperCase(LFrmBomInputQry.Edit1.Text));
    ARev := StrToFloat(LFrmBomInputQry.Edit2.Text);
    PriceUpdate := LFrmBomInputQry.CheckBox1.Checked;
    StdCostUpdate := LFrmBomInputQry.CheckBox2.Checked;
    DueDate := LFrmBomInputQry.wwDBDateTimePicker1.DateTime;
  end;
end;


procedure TFrmBomInputQry.FormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [PnlLeft01]);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlClient02);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
end;

procedure TFrmBomInputQry.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [PnlLeft01]);
end;

procedure TFrmBomInputQry.Button1Click(Sender: TObject);
begin
  if (wwDBDateTimePicker1.Visible) and (wwDBDateTimePicker1.DateTime = 0) then
    raise exception.create('Quote Due Date must be entered.');
  IQAssert( Edit1.Text > '', 'RFQ # must be entered' );
  try
    IQAssert( (StrToInt(Edit2.Text) >= 0 ) and (StrToFloat(Edit2.Text) <= 999), 'Quote Rev is a number between 0 - 999.' );
  except on E: Exception do
    raise Exception.CreateFmt('Invalid Rev. %s', [ E.Message ]);
  end;

  ModalResult:= mrOK;
end;
{
procedure TFrmBomInputQry.IQAfterShowMessage(var Msg: TMessage);
begin
  Application.ProcessMessages;
  ForceForegroundWindowB(Application.Handle);
  Self.BringToFront;
end;   }

end.
