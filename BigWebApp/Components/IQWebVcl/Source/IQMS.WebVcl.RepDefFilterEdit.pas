unit IQMS.WebVcl.RepDefFilterEdit;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  ExtCtrls,
  Menus,
  DB,
  IQMS.WebVcl.ActionBox,
  IQMS.WebVcl.RepDef,
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
  uniMainMenu,
  uniLabel;

type
  TfrmRepDefFilterEdit = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    PnlMain: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlCaption: TUniPanel;
    lblDescription: TUniLabel;
    PnlControls: TUniPanel;
    PRangeStart: TUniPopupMenu;
    RangeStartText1: TUniMenuItem;
    RangeStartDate1: TUniMenuItem;
    RangeStartDateTime1: TUniMenuItem;
    RangeStartNumber1: TUniMenuItem;
    PRangeEnd: TUniPopupMenu;
    RangeEndText1: TUniMenuItem;
    RangeEndNumber1: TUniMenuItem;
    RangeEndDate1: TUniMenuItem;
    RangeEndDateTime1: TUniMenuItem;
    actbxRangeStart: TIQWebActionBox;
    actbxRangeEnd: TIQWebActionBox;
    Panel4: TUniPanel;
    Panel3: TUniPanel;
    Panel5: TUniPanel;
    Panel1: TUniPanel;
    sbtnEditRangeStart: TUniSpeedButton;
    sbtnClearRangeStart: TUniSpeedButton;
    Panel2: TUniPanel;
    sbtnEditRangeEnd: TUniSpeedButton;
    sbtnClearRangeEnd: TUniSpeedButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    lblRangeStart: TUniLabel;
    lblRangeEnd: TUniLabel;
    edtRangeStart: TUniEdit;
    edtRangeEnd: TUniEdit;
    Panel6: TUniPanel;
    PnlIncludeNulls: TUniPanel;
    sbtnIncludeNullsYes: TUniSpeedButton;
    sbtnIncludeNullsNo: TUniSpeedButton;
    lblIncludeNulls: TUniLabel;
    Bevel1: TUniPanel;
    btnClear: TUniBitBtn;
    sbtnCopyToRangeEnd: TUniSpeedButton;
    sbtnCopyToRangeStart: TUniSpeedButton;
    Bevel2: TUniPanel;
    Shape1: TUniPanel;
    procedure sbtnEditRangeStartClick(Sender: TObject);
    procedure RangeStartText1Click(Sender: TObject);
    procedure RangeStartNumber1Click(Sender: TObject);
    procedure RangeStartDate1Click(Sender: TObject);
    procedure RangeStartDateTime1Click(Sender: TObject);
    procedure sbtnClearRangeStartClick(Sender: TObject);
    procedure sbtnEditRangeEndClick(Sender: TObject);
    procedure sbtnClearRangeEndClick(Sender: TObject);
    procedure RangeEndText1Click(Sender: TObject);
    procedure RangeEndNumber1Click(Sender: TObject);
    procedure RangeEndDate1Click(Sender: TObject);
    procedure RangeEndDateTime1Click(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure edtRangeStartChange(Sender: TObject);
    procedure sbtnCopyToRangeEndClick(Sender: TObject);
    procedure sbtnCopyToRangeStartClick(Sender: TObject);
    procedure edtRangeEndChange(Sender: TObject);
  private
    { Private declarations }
    FDescription: String;
    FDataType: TDataType;
    procedure UpdateSummary;
    procedure SetButtons;
    function GetRangeStart: String;
    procedure SetRangeStart(const Value: String);
    function GetRangeEnd: String;
    procedure SetRangeEnd(const Value: String);
    function GetIncludeNulls: Boolean;
    procedure SetIncludeNulls(const Value: Boolean);
    procedure EditAsDate(AEdit: TUniEdit);
    procedure EditAsDateTime(AEdit: TUniEdit);
    procedure EditAsNumber(AEdit: TUniEdit);
    procedure EditAsText(AEdit: TUniEdit);
  public
    { Public declarations }
    constructor Create( const ADescription: String;
      const ADataType: TDataType; var ARangeStart, ARangeEnd: String;
      var AIncludeNulls: Boolean);
  published
    { Published declarations }
    property RangeStart: String read GetRangeStart write SetRangeStart;
    property RangeEnd: String read GetRangeEnd write SetRangeEnd;
    property IncludeNulls: Boolean read GetIncludeNulls write SetIncludeNulls;
  end;

  // Note:  To keep things simple, we do not set the unary or binary operators.
  function IQRepDef_Touchscreen_EditFilter(
   const ADescription: String; const ADataType: TDataType; var ARangeStart,
   ARangeEnd: String; var AIncludeNulls: Boolean): Boolean;

var
  frmRepDefFilterEdit: TfrmRepDefFilterEdit;

implementation

{$R *.dfm}

uses
  IQMS.Common.Dates,
  IQMS.Common.Numbers;
//  touchscrn,
//  tchscrn_const;

function IQRepDef_Touchscreen_EditFilter(
 const ADescription: String; const ADataType: TDataType;
 var ARangeStart, ARangeEnd: String;
 var AIncludeNulls: Boolean): Boolean;
begin
  with TfrmRepDefFilterEdit.Create( ADescription, ADataType,
   ARangeStart, ARangeEnd, AIncludeNulls) do
  begin
     Result := ShowModal = mrOk;
     if Result then
        begin
          ARangeStart := RangeStart;
          ARangeEnd := RangeEnd;
          AIncludeNulls := IncludeNulls;
        end;
  end;
end;

{ TfrmRepDefFilterEdit }

constructor TfrmRepDefFilterEdit.Create(
  const ADescription: String; const ADataType: TDataType; var ARangeStart,
  ARangeEnd: String; var AIncludeNulls: Boolean);
begin
  inherited Create(uniGUIApplication.UniApplication);
  FDescription := Trim(ADescription);
  FDataType := ADataType;
  lblDescription.Caption := ADescription;

  RangeStart := ARangeStart;
  RangeEnd := ARangeEnd;
  IncludeNulls := AIncludeNulls;

  UpdateSummary;
  SetButtons;
end;

procedure TfrmRepDefFilterEdit.UpdateSummary;
var
   S, ANulls: String;
begin
{  lblSummary.Caption := '';
  if FDescription = '' then Exit;

  ANulls := IQMS.Common.Numbers.sIIf(IncludeNulls,
     'Include empty field values.',
     'Exclude empty field values.');

  if (RangeStart + RangeEnd) = '' then
     lblSummary.Caption :=  'Do not filter by this field.'

  else if ((RangeStart > '') and (RangeEnd = '')) or
          ((RangeStart = '') and (RangeEnd > '')) then
     lblSummary.Caption := '(Incomplete filter values)'

  else if (RangeStart = RangeEnd) then
     // 'Display records where %s is equal to %s.  %s'
     lblSummary.Caption := Format('Display records where %s is equal to %s.  %s',
      [FDescription, RangeStart, ANulls])

  else if (RangeStart > '') and (RangeEnd > '') then
     //'Filter records where values for, %s, are between %s and %s.';
     //'Display records where %s ranges from %s through %s.  %s.'
     lblSummary.Caption := Format('Display records where %s ranges from %s through %s.  %s.',
      [FDescription, RangeStart, RangeEnd, ANulls]);
}      
end;

function TfrmRepDefFilterEdit.GetRangeStart: String;
begin
  Result := edtRangeStart.Text;
end;

procedure TfrmRepDefFilterEdit.SetRangeStart(const Value: String);
begin
  edtRangeStart.Text := Value;
  UpdateSummary;
  SetButtons;
end;

function TfrmRepDefFilterEdit.GetRangeEnd: String;
begin
  Result := edtRangeEnd.Text;
end;

procedure TfrmRepDefFilterEdit.SetRangeEnd(const Value: String);
begin
  edtRangeEnd.Text := Value;
  UpdateSummary;
  SetButtons;
end;

function TfrmRepDefFilterEdit.GetIncludeNulls: Boolean;
begin
  Result := sbtnIncludeNullsYes.Down;
end;

procedure TfrmRepDefFilterEdit.SetIncludeNulls(const Value: Boolean);
begin
  if Value then sbtnIncludeNullsYes.Down := True
  else sbtnIncludeNullsNo.Down := True;
  UpdateSummary;
  SetButtons;
end;

procedure TfrmRepDefFilterEdit.sbtnEditRangeStartClick(Sender: TObject);
var
   APt: TPoint;
begin
  Application.ProcessMessages;

  case FDataType of
    dtChar, dtVarchar2: EditAsText(edtRangeStart);
    dtNumber: EditAsNumber(edtRangeStart);
    dtDate: EditAsDate(edtRangeStart);
    else
      begin
        APt.X := (ClientWidth div 2) - 140;
        APt.Y := (ClientHeight div 2) - 105;
        APt   := ClientToScreen(APt);
        actbxRangeStart.ExecutePos(APt.X,APt.Y);
      end;
  end;
end;

procedure TfrmRepDefFilterEdit.RangeStartText1Click(Sender: TObject);
begin
  EditAsText(edtRangeStart);
end;

procedure TfrmRepDefFilterEdit.RangeStartNumber1Click(Sender: TObject);
begin
  EditAsNumber(edtRangeStart);
end;

procedure TfrmRepDefFilterEdit.RangeStartDate1Click(Sender: TObject);
begin
  EditAsDate(edtRangeStart);
end;

procedure TfrmRepDefFilterEdit.RangeStartDateTime1Click(Sender: TObject);
begin
  EditAsDateTime(edtRangeStart);
end;

procedure TfrmRepDefFilterEdit.sbtnClearRangeStartClick(Sender: TObject);
begin
  RangeStart := '';
  SetButtons;
end;

procedure TfrmRepDefFilterEdit.sbtnEditRangeEndClick(Sender: TObject);
var
   APt: TPoint;
begin
  Application.ProcessMessages;

  case FDataType of
    dtChar, dtVarchar2: EditAsText(edtRangeEnd);
    dtNumber: EditAsNumber(edtRangeEnd);
    dtDate: EditAsDate(edtRangeEnd);
    else
      begin
        APt.X := (ClientWidth div 2) - 140;
        APt.Y := (ClientHeight div 2) - 105;
        APt   := ClientToScreen(APt);
        actbxRangeEnd.ExecutePos(APt.X,APt.Y);
      end;
  end;
end;

procedure TfrmRepDefFilterEdit.sbtnClearRangeEndClick(Sender: TObject);
begin
  RangeEnd := '';
  SetButtons;
end;

procedure TfrmRepDefFilterEdit.btnClearClick(Sender: TObject);
begin
  RangeStart := '';
  RangeEnd := '';
  IncludeNulls := True;
  UpdateSummary;
  SetButtons;
end;

procedure TfrmRepDefFilterEdit.edtRangeStartChange(Sender: TObject);
begin
  if RangeEnd = '' then
     RangeEnd := RangeStart;
  SetButtons;
end;

procedure TfrmRepDefFilterEdit.edtRangeEndChange(Sender: TObject);
begin
  SetButtons;
end;

procedure TfrmRepDefFilterEdit.RangeEndText1Click(Sender: TObject);
begin
  EditAsText(edtRangeEnd);
end;

procedure TfrmRepDefFilterEdit.RangeEndNumber1Click(Sender: TObject);
begin
  EditAsNumber(edtRangeEnd);
end;

procedure TfrmRepDefFilterEdit.RangeEndDate1Click(Sender: TObject);
begin
  EditAsDate(edtRangeEnd);
end;

procedure TfrmRepDefFilterEdit.RangeEndDateTime1Click(Sender: TObject);
begin
  EditAsDateTime(edtRangeEnd);
end;

{ ---------------------------------------------------------------------------- }
procedure TfrmRepDefFilterEdit.EditAsText(AEdit: TUniEdit);
var
   AText: String;
begin
  if not Assigned(AEdit) then Exit;
  AText := AEdit.Text;
//  if touchscrn.TouchScreen_Keyboard(Self,AText, 60) then
//     begin
//       AEdit.Text := AText;
//       UpdateSummary;
//       SetButtons;
//     end;
end;

procedure TfrmRepDefFilterEdit.EditAsNumber(AEdit: TUniEdit);
var
   AResult: Real;
begin
  if not Assigned(AEdit) then Exit;
  AResult := 0;
  if not IQMS.Common.Numbers.IsStringValidFloat(AEdit.Text, AResult) then
     AResult := 0;
//  if touchscrn.TouchScreen_KeyPad(Self, AResult) then
//     begin
//       AEdit.Text := FloatToStr(AResult);
//       UpdateSummary;
//       SetButtons;
//     end;
end;

procedure TfrmRepDefFilterEdit.EditAsDate(AEdit: TUniEdit);
var
   ADate: TDateTime;
begin
  if not Assigned(AEdit) then Exit;
  if not IQMS.Common.Dates.IsStringValidDate(AEdit.Text, ADate) or
     (Trunc(ADate) < 18264 {1950}) then
     ADate := Date;
//  if touchscrn.TouchScreen_Calendar(Self, ADate) then
//     begin
//       AEdit.Text := FormatDateTime('ddddd',ADate);
//       UpdateSummary;
//       SetButtons;
//     end;
end;

procedure TfrmRepDefFilterEdit.EditAsDateTime(AEdit: TUniEdit);
var
   ADateTime: TDateTime;
begin
  if not Assigned(AEdit) then Exit;
  if not IQMS.Common.Dates.IsStringValidDate(AEdit.Text, ADateTime) or
    (Trunc(ADateTime) < 18264 {1950}) then
     ADateTime := Trunc(Date) + IQMS.Common.Dates.TIME_800;
//  if touchscrn.TouchScreen_DateTime( Self, tchscrn_const.dtsDateTime, ADateTime) then
//     begin
//       AEdit.Text := FormatDateTime('ddddd tt',ADateTime);
//       UpdateSummary;
//       SetButtons;
//     end;
end;

{ ---------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------- }


procedure TfrmRepDefFilterEdit.sbtnCopyToRangeEndClick(Sender: TObject);
begin
  RangeEnd := RangeStart;
  UpdateSummary;
  SetButtons;
end;

procedure TfrmRepDefFilterEdit.sbtnCopyToRangeStartClick(Sender: TObject);
begin
  RangeStart := RangeEnd;
  UpdateSummary;
  SetButtons;
end;

procedure TfrmRepDefFilterEdit.SetButtons;
begin
 sbtnCopyToRangeEnd.Enabled := RangeStart > '';
 sbtnCopyToRangeStart.Enabled := RangeEnd > '';
 sbtnClearRangeStart.Enabled := RangeStart > '';
 sbtnClearRangeEnd.Enabled := RangeEnd > '';
end;

end.
