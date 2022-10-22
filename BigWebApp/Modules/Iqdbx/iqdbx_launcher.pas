unit iqdbx_launcher;

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
  Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmIQDBTransLauncher = class(TUniForm)
    sbtnImport: TUniSpeedButton;
    sbtnCreateDMP: TUniSpeedButton;
    sbtnImportDMP: TUniSpeedButton;
    procedure DoImport(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

//uses
//  iqdbx_import;
procedure TFrmIQDBTransLauncher.DoImport(Sender: TObject);
var
  ATableName: String;
begin
//  CheckDBModuleCreated; // db_dm.pas
//  DoImportWizard(Self, ATableName); // iqdbx_import
end;

end.
