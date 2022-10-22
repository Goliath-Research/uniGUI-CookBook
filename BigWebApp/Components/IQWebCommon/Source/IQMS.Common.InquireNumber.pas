unit IQMS.Common.InquireNumber;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  //IQMS.WebVcl.FloatSpinner,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniSpinEdit, Vcl.ComCtrls, System.Classes;

type
  TFrmIQInputNumber = class(TUniForm)
    lblPrompt: TUniLabel;
    edtValueFloat: TUniNumberEdit;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    edtValueInt: TUniSpinEdit;
    //udValueInt: TUpDown;
    //procedure edtValueIntChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure edtValueIntChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

  function IQInputFloat(const ACaption, APrompt: string; var Value: Real): Boolean;
  function IQInputDouble(const ACaption, APrompt: string; var Value: Double): Boolean;
  function IQInputExtended(const ACaption, APrompt: string; var Value: Extended): Boolean;
  function IQInputFloatEx(const ACaption, APrompt: string; AMin, AMax: Real; var Value: Real): Boolean;
  function IQInputInteger(const ACaption, APrompt: string; var Value: Integer): Boolean;
  function IQInputIntegerEx(const ACaption, APrompt: string; AMin, AMax: Integer; var Value: Integer): Boolean;

var
  FrmIQInputNumber: TFrmIQInputNumber;

implementation

{$R *.dfm}

uses
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm;

function IQInputFloat(const ACaption, APrompt: string; var Value: Real): Boolean;
begin
  with TFrmIQInputNumber.Create(uniGUIApplication.UniApplication) do
  begin
     // Show/hide controls
     edtValueFloat.Visible := TRUE;
     edtValueInt.Visible := FALSE;
     edtValueFloat.Value := Value;
     // Captions
     Caption := ACaption;
     lblPrompt.Caption := APrompt;
     // Get result
     Result := ShowModal = mrOk;
     if Result then
        Value := edtValueFloat.Value;
  end;
end;

function IQInputDouble(const ACaption, APrompt: string; var Value: Double): Boolean;
begin
  with TFrmIQInputNumber.Create(uniGUIApplication.UniApplication) do
  begin
     // Show/hide controls
     edtValueFloat.Visible := TRUE;
     edtValueInt.Visible := FALSE;
     edtValueFloat.Value := Value;
     // Captions
     Caption := ACaption;
     lblPrompt.Caption := APrompt;
     // Get result
     Result := ShowModal = mrOk;
     if Result then
        Value := edtValueFloat.Value;
  end;
end;

function IQInputExtended(const ACaption, APrompt: string; var Value: Extended): Boolean;
begin
  with TFrmIQInputNumber.Create(uniGUIApplication.UniApplication) do
  begin
     // Show/hide controls
     edtValueFloat.Visible := TRUE;
     edtValueInt.Visible := FALSE;
     edtValueFloat.Value := Value;
     // Captions
     Caption := ACaption;
     lblPrompt.Caption := APrompt;
     // Get result
     Result := ShowModal = mrOk;
     if Result then Value := edtValueFloat.Value;
  end;
end;

function IQInputFloatEx(const ACaption, APrompt: string; AMin, AMax: Real; var Value: Real): Boolean;
begin
  with TFrmIQInputNumber.Create(uniGUIApplication.UniApplication) do
  begin
     // Show/hide controls
     edtValueFloat.Visible := TRUE;
     edtValueInt.Visible := FALSE;
     edtValueFloat.Value := Value;

     // Min/Max
     edtValueFloat.MinValue := AMin;
     edtValueFloat.MaxValue := AMax;

     // Captions
     Caption := ACaption;
     lblPrompt.Caption := APrompt;
     // Get result
     Result := ShowModal = mrOk;
     if Result then Value := edtValueFloat.Value;
  end;
end;

function IQInputInteger(const ACaption, APrompt: string; var Value: Integer): Boolean;
begin
  with TFrmIQInputNumber.Create(uniGUIApplication.UniApplication) do
  begin
     // Show/hide controls
     edtValueFloat.Visible := FALSE;
     edtValueInt.Visible := TRUE;
     // Captions
     Caption := ACaption;
     lblPrompt.Caption := APrompt;
     // Get result
     Result := ShowModal = mrOk;
     if Result then Value := Trunc(edtValueInt.Value);
  end;
end;

function IQInputIntegerEx(const ACaption, APrompt: string; AMin, AMax: Integer;
  var Value: Integer): Boolean;
begin
  with TFrmIQInputNumber.Create(uniGUIApplication.UniApplication) do
  begin
     // Show/hide controls
     edtValueFloat.Visible := FALSE;
     edtValueInt.Visible   := TRUE;
     edtValueInt.Value     := Value;
     edtValueInt.MinValue  := AMin;
     edtValueInt.MaxValue  := AMax;
     // Captions
     Caption := ACaption;
     lblPrompt.Caption := APrompt;
     // Get result
     Result := ShowModal = mrOk;
     if Result then Value := Trunc(edtValueInt.Value);
  end;
end;

procedure TFrmIQInputNumber.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmIQInputNumber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

end.
