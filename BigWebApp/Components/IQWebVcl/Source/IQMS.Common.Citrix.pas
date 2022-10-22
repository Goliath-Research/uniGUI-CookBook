unit IQMS.Common.Citrix;

// 7/18/06 - matt Kilbride -- Added logic to remove Citrix keys if using Citrix 4 or higher

interface

uses
  Winapi.Windows, Winapi.Messages, UniGuiForm,System.SysUtils, System.Classes, Vcl.Forms, IQMS.Common.Registry;

procedure CheckIQCitrixObjectCreated(AOwner: TComponent);

type
  TIQWebCitrix = class(TComponent)
    private
      FIsOldCitrixInstalled: Boolean;
      procedure AssignIsOldCitrixInstalled;
      procedure DoActiveFormChange(Sender: TObject);
    public
      constructor Create(AOwner: TComponent); override;
      // No need to Free the object explicitly:
      // since we inherited from TComponent and provided AOwner the system will
      // free our object automatically when Owner is Destroyed
      // destructor Destroy; override;
      procedure RegisterCitrixForm(AForm: TUniForm);
      property IsOldCitrixInstalled: Boolean read FIsOldCitrixInstalled;
  end;

const
  cCitrixRegPath = '\SYSTEM\CurrentControlSet\Control\Citrix\License';
  // On HKEY_LOCAL_MACHINE
  cCitrixTWIPath = '\SYSTEM\CurrentControlSet\Control\Citrix\wfshell\TWI';
  // On HKEY_LOCAL_MACHINE
  cCitrixConsolePath = '\Software\Citrix\Citrix Management Console';
  // On HKEY_LOCAL_MACHINE

var
  IQCitrixObject: TIQWebCitrix;

implementation

{*UG_rem_AE*} //  IqXpMan,
uses
  IQMS.Common.Screen,  IQMS.Common.ApplicationSet;

procedure CheckIQCitrixObjectCreated(AOwner: TComponent);
begin
  if not Assigned(IQCitrixObject) then
    IQCitrixObject := TIQWebCitrix.Create(AOwner);
end;

constructor TIQWebCitrix.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  AssignIsOldCitrixInstalled;
  Screen.OnActiveFormChange := DoActiveFormChange;
//  RegisterCitrixForm(Application.MainForm);
end;

// destructor TIQCitrix.Destroy;
// begin
// if Assigned( IQCitrixObject ) then
// FreeAndNil( IQCitrixObject );
// inherited Destroy;
// end;

procedure TIQWebCitrix.DoActiveFormChange(Sender: TObject);
begin
  // 04-11-2016 EIQ-11597 Security Inspector - “Auto Shut Off” causing access violations and not terminating process for external modules
  {*UG_rem_AE*}
   if IsAutoShutInProgress and Assigned(Screen.ActiveForm) then   //
  begin
    PostMessage(Screen.ActiveForm.Handle, WM_CLOSE, 0, 0);
    EXIT;
  end;

//  RegisterCitrixForm(Screen.ActiveForm);

  // 07/17/2012 Apply System font
  {*UG_rem_AE*}
  //IQScreen.ApplySystemFont(Screen.ActiveForm);

  { 12-11-2007 adjust XP skin }
  {*UG_rem_AE*}
  //IQXPMan_SetParentBackground(Screen.ActiveForm);
end;

procedure TIQWebCitrix.AssignIsOldCitrixInstalled;
var
  ctxLocated: Boolean;
  ctxVersion: string;
  ctxVersionInt: Integer;
begin
  FIsOldCitrixInstalled := False;
  with TIQWebRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      Access := KEY_READ; // or KEY_WRITE;
      ctxLocated := OpenKey(cCitrixRegPath, False);
    finally
      Free;
    end;

  if ctxLocated then
    begin
      ctxVersion := LoadStrFromLocalMachineRegistry(cCitrixConsolePath,
        'Version');
      ctxVersionInt := 0;

      if ctxVersion <> '' then
        begin
          ctxVersion := Copy(ctxVersion, 1, 1);
          ctxVersionInt := StrToInt(ctxVersion);
        end;

      if ctxVersionInt < 4 then
        FIsOldCitrixInstalled := TRUE;
    end;
end;

procedure TIQWebCitrix.RegisterCitrixForm(AForm: TUniForm);
var
  AFormPath: string;
begin
  if (AForm = nil) or (AForm.Name = '') then
    Exit;
  AFormPath := Format('%s\%s', [cCitrixTWIPath, AForm.ClassName]);
  if IsOldCitrixInstalled and (AForm <> nil) and (AForm.Name > '') then
    begin
      with TIQWebRegistry.Create do
        try
          RootKey := HKEY_LOCAL_MACHINE;
          Access := KEY_READ or KEY_WRITE;
          if OpenKey(AFormPath, TRUE) then
            begin
              WriteString('ClassName', AForm.ClassName);
              WriteInteger('Type', 128); // will be 80 in Hex
            end;
        finally
          Free;
        end;
    end
  else
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        Access := KEY_WRITE; // or KEY_WRITE;
        if OpenKey(AFormPath, False) then
          begin
            CloseKey;
            DeleteKey(AFormPath);
          end;
      finally
        Free;
      end;
end;

end.
