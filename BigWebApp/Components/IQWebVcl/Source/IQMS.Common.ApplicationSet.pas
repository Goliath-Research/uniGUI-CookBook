{ Common Application Settings }
unit IQMS.Common.ApplicationSet;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, IQMS.Common.HelpHook, IQMS.Common.Citrix;

type
  TAppType = (atExe, atCom, atCGI);

procedure AssignApplicationSettings(AApplication: TApplication);
procedure AssignApplicationSettingsA(AApplication: TApplication);
procedure LoadEPlantApplicationIcon;
function IsCGI: Boolean;
function IsDCOM: Boolean;

var
  AppType: TAppType = atExe;
  IsTouchScreen: Boolean = FALSE;
  { Used in IQShare\IQTranEr.pas to avoid popping up the transaction error
    form in case of the DISPO_SERVER. Normally if false allowing the form to
    be displayed }
  NoModalTransactionMessages: Boolean;
  // IQWin32MessageID: Integer; // obsolete

  // Normally, the value is False.  If True, then the current database
  // is not the standard, IQMS database, owned by the IQMS user.
  IsNonIQMSSchema: Boolean;

  // 04-11-2016 EIQ-11597: Security Inspector - “Auto Shut Off” causing access violations and not terminating process for external modules
  // This flag is controled in AutoShut.pas for DCOM objects to address shutting down modal forms issue.
  // The solution is to turn ON this flag that is going to be checked every time a form is getting activated until they are all gone
  // See IQCitrix.pas DoActiveFormChange method
  IsAutoShutInProgress: Boolean;

implementation

uses
  IQMS.Common.COMServer, Winapi.ShellAPI, Vcl.Graphics, IQMS.WebVcl.Blob,IQMS.WebVcl.SecurityManager;
//  IQMS.Common.AutoShut;

procedure AssignApplicationSettings(AApplication: TApplication);
begin
  AssignApplicationSettingsA(AApplication);
//  CreateAutoShutDownManager;
  AApplication.OnActivate := IQComSrvList.InvokeGarbageCollector;
end;

procedure AssignApplicationSettingsA(AApplication: TApplication);
begin
  with AApplication do
    begin
      HintPause := 100; { Def  800 }
      HintShortPause := 25; { Def   50 }
      HintHidePause := 6000; { Def 2500 }
      if not Assigned(IQHelp) then
        IQHelp := THookHelpSystem.Create('' { FileName.chm } ,
          '' { FileName.htm } , '', htHHAPI);
      { IQHelp declared in IQHelpHk.pas }
    end;

  { 12-11-2007 On top of processing Citrix registration add XPMan skin
    adjustment inside the same OnActiveFormChange }
  CheckIQCitrixObjectCreated(AApplication); { IQCitrix.pas }

  { 08-20-2010 }
  LoadEPlantApplicationIcon;
end;

procedure LoadEPlantApplicationIcon;
label
  finish;
var
  AIcon: TIcon;
  AStream: TMemoryStream;
  AIconIndex: Word;
begin
//  if not Assigned(Application.MainForm) then
//    EXIT;
  if not (SecurityManager <> nil) then
    EXIT;

  AIconIndex := 0;
  AStream := TMemoryStream.Create;
  AIcon := TIcon.Create;
  try
    // eplant not assigned
    if (SecurityManager.EPlant_ID_AsFloat = 0) then
      begin
        AIcon.Handle := ExtractAssociatedIcon(HInstance,
          PChar(Application.ExeName), AIconIndex);
        { ShellAPI.pas retrieve the associated icon from the file }
        goto finish;
      end;

    // eplant assigned but not icon
    if not TIQWebBlob.GetBlob('APP_ICON', // column name
      'EPLANT', // table name
      SecurityManager.EPlant_ID_AsFloat, AStream) then
      begin
        AIcon.Handle := ExtractAssociatedIcon(HInstance,
          PChar(Application.ExeName), AIconIndex);
        { ShellAPI.pas retrieve the associated icon from the file }
        goto finish;
      end;

    // icon assigned - get it
    AIcon.LoadFromStream(AStream);

    // finally!
  finish:
    Application.Icon.Assign(AIcon);
//    Application.MainForm.Icon.Assign(AIcon);

  finally
    FreeAndNil(AStream);
    FreeAndNil(AIcon);
  end;
end;

function IsCGI: Boolean;
begin
  Result := AppType = atCGI;
end;

function IsDCOM: Boolean;
begin
  Result := AppType = atCom;
end;

end.
