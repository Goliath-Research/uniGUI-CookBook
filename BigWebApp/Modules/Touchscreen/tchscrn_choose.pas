unit tchscrn_choose;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmTouchScreenChoose = class(TUniForm)
    PnlMain: TUniPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnCancel: TUniBitBtn;
    sbList: TUniScrollBox;
    btnOk: TUniBitBtn;
    procedure DoButtonClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FTop: Integer;
    FSelectedIndex: Integer;
    FOptions: TStringList;
    procedure LoadButtonList(const AList: TStringList);
    function AddButton(const ACaption: string; const ATag: Integer)
      : TUniSpeedButton;
    procedure SetOptions(const Value: TStringList);
  public
    { Public declarations }

    class function DoShowModal(ACaption: string; AOptions: TStringList;
      var ASelectedIndex: Integer): Boolean;
    function SelectedIndex: Integer;

  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls;

const
  button_buffer: Integer = 2;
  button_height: Integer = 40;

  { TFrmTouchScreenChoose }


class function TFrmTouchScreenChoose.DoShowModal(ACaption: string;
  AOptions: TStringList; var ASelectedIndex: Integer): Boolean;
begin
  ASelectedIndex := -1;
  with TFrmTouchScreenChoose.Create(uniGUIApplication.UniApplication) do
  Begin
    Caption := ACaption;
    LoadButtonList(AOptions);
    Result := ShowModal = mrOK;
    if Result then
      ASelectedIndex := SelectedIndex;
    // finally
    // Free;
  end;
end;

procedure TFrmTouchScreenChoose.DoButtonClick(Sender: TObject);
begin
  //IQMS.Common.Controls.FrameButton(TUniSpeedButton(Sender), TUniSpeedButton(Sender).Down);
  FSelectedIndex := TUniSpeedButton(Sender).Tag;
end;

procedure TFrmTouchScreenChoose.LoadButtonList(const AList: TStringList);
var
  i: Integer;
begin
  if Assigned(AList) then
    for i := 0 to AList.Count - 1 do
      AddButton(AList.Strings[i], i);
end;

function TFrmTouchScreenChoose.SelectedIndex: Integer;
begin
  Result := FSelectedIndex;
end;

procedure TFrmTouchScreenChoose.SetOptions(const Value: TStringList);
begin
  FOptions := Value;
end;

procedure TFrmTouchScreenChoose.UniFormCreate(Sender: TObject);
begin
  inherited;
  FSelectedIndex := -1;
  //IQMS.Common.Controls.CenterForm(Self, True);
end;

function TFrmTouchScreenChoose.AddButton(const ACaption: string;
  const ATag: Integer): TUniSpeedButton;
begin
  Result := TUniSpeedButton.Create(Self);
  with Result do
  begin
    Parent := sbList;
    Anchors := [akLeft, akTop, akRight];
    Caption := ACaption;
    Left := 1;
    Top := FTop;
    Height := button_height;
    Width := sbList.ClientWidth - 2;
    FTop := Top + Height + button_buffer;
    Tag := ATag;
    AllowAllUp := False;
    GroupIndex := 1;
    OnClick := DoButtonClick;
  end;
  //IQMS.Common.Controls.PrepareButtonFrame(Result);
end;

end.
