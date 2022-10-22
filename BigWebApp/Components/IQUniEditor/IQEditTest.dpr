{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module'

{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
  IQEditTest;

uses
  uniGUIISAPI,
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  IQDlgSample in 'Source\IQDlgSample.pas' {IQUniDialogA: TUniForm},
  IQEditor in 'Source\IQEditor.pas',
  IQEditorDlg in 'Source\IQEditorDlg.pas',
  IQEditorDlgGridSample in 'Source\IQEditorDlgGridSample.pas',
  IQEditorDlgSample in 'Source\IQEditorDlgSample.pas';

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
{$endif}
end.
