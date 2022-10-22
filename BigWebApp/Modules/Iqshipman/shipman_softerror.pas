unit shipman_softerror;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
//  shipman_common,
  Vcl.Buttons,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniBitBtn, Uniimage,
  uniSpeedButton, Vcl.Graphics, Vcl.Controls;

  type
  TSoftErrorType = (seWarning,
                    seInformation,
                    seShippingWarning,
                    seShippingInformation,
                    seURSAWarning,
                    seURSAInformation);

 // Soft Error methods
 procedure CheckSoftErrorListCreated; // ensure the list is created
 procedure ClearSoftErrorList;        // clear the soft error list
 procedure AddSoftError(const AErrorType: TSoftErrorType;
  const ACode, ADescription: String); // add an error
 procedure ShowSoftErrorList;         // show the error form

type

  TFrmShipManSoftError = class(TUniForm)
    PnlPrompt: TUniPanel;
    PnlDisplay: TUniPanel;
    PnlBtns: TUniPanel;
    PnlBtnsInner: TUniPanel;
    btnOk: TUniBitBtn;
    memMsg: TUniMemo;
    PnlNav: TUniPanel;
    NavBtnsInner: TUniPanel;
    sbtnPrevious: TUniSpeedButton;
    sbtnNext: TUniSpeedButton;
    Panel1: TUniPanel;
    Image1: TUniImage;
    procedure FormCreate(Sender: TObject);
    procedure DoPriorClick(Sender: TObject);
    procedure DoNextClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FIndex: Integer;
//    SoftErrorList: TSoftErrorList;
    procedure ShowMsg(AIndex: Integer);
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure CheckSoftErrorListCreated;
begin
//  if not Assigned(SoftErrorList) then
//     SoftErrorList := TSoftErrorList.Create;
end;

procedure ClearSoftErrorList;
begin
  CheckSoftErrorListCreated;
//  if Assigned(SoftErrorList) then
//     SoftErrorList.Clear;
end;

procedure AddSoftError(const AErrorType: TSoftErrorType;
 const ACode, ADescription: String);
begin
  CheckSoftErrorListCreated;
//  if Assigned(SoftErrorList) then
//     SoftErrorList.Add(AErrorType,ACode,ADescription);
end;

procedure ShowSoftErrorList;
var
  FrmShipManSoftError : TFrmShipManSoftError;
begin
//  if not Assigned(SoftErrorList) or (SoftErrorList.Count = 0) then Exit;

  FrmShipManSoftError := TFrmShipManSoftError.Create(UniApplication);
  FrmShipManSoftError.showmodal;
end;

procedure TFrmShipManSoftError.FormCreate(Sender: TObject);
begin
  FIndex := 0;
  ShowMsg(0);
//  PnlNav.Visible :=  SoftErrorList.Count > 1;
end;

procedure TFrmShipManSoftError.FormShow(Sender: TObject);
begin
//  Beep;
end;

procedure TFrmShipManSoftError.ShowMsg(AIndex: Integer);
var
   AType: TSoftErrorType;
   ACode,
   ADescription: String;
begin
//  if (AIndex >= 0) and (AIndex <= SoftErrorList.Count - 1) then
//     begin
//       AType := TSoftErrorItem(SoftErrorList.Items[AIndex]).ErrorType;
//       ACode := TSoftErrorItem(SoftErrorList.Items[AIndex]).Code;
//       ADescription := TSoftErrorItem(SoftErrorList.Items[AIndex]).Description;
//
//       memMsg.Text := ADescription;
//     end;
end;

procedure TFrmShipManSoftError.DoPriorClick(Sender: TObject);
begin
  // Show the previous (prior) message
  FIndex := FIndex - 1; // subtract
  if FIndex < 0 then FIndex := 0;
  ShowMsg(FIndex);
end;

procedure TFrmShipManSoftError.DoNextClick(Sender: TObject);
begin
  // Show the next message
  FIndex := FIndex + 1; // add
//  if (FIndex > SoftErrorList.Count - 1) then FIndex := SoftErrorList.Count - 1;
  ShowMsg(FIndex);
end;

end.
