unit IQMS.WebVcl.AboutAlter;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Vcl.Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TIQAboutAlterSession = class(TUniForm)
    Label1: TUniLabel;
    edMaxDumpFileSize: TUniEdit;
    chkbTrace: TUniCheckBox;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.Numbers,
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.WebVcl.ResourceStrings;

{ TIQAboutAlterSession }

class procedure TIQAboutAlterSession.DoShowModal;
begin
  // IQAssert( SecurityManager <> nil,          'Security Manager is undefined - unable to proceed');
  // IQAssert( SecurityManager.UserName = 'IQMS',  'You must be logged in as IQMS in order to alter session settings');
                                                                     
  with TIQAboutAlterSession.Create( uniGUIApplication.UniApplication ) do
  begin
    ShowModal;
  end;
end;

procedure TIQAboutAlterSession.btnOKClick(Sender: TObject);
begin
  ExecuteCommandFmt('ALTER SESSION SET MAX_DUMP_FILE_SIZE = %s', [ edMaxDumpFileSize.Text ]);
  ExecuteCommandFmt('ALTER SESSION SET SQL_TRACE = %s',          [ IIf(chkbTrace.Checked, 'TRUE', 'FALSE')]);

  IQInformation( IQMS.WebVcl.ResourceStrings.cTXT0000052 {'Session has been altered.'} );
  
  ModalResult:= mrOK;
end;

end.
