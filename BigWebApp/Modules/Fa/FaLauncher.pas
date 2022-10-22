unit FaLauncher;

interface

uses
  Vcl.Forms,
  Vcl.Buttons,
  System.Classes,
  Vcl.Controls,
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
  TFrmFaLauncher = class(TUniForm)
    sbtnFaMain: TUniSpeedButton;
    SBFaBook: TUniSpeedButton;
    SbFaClass: TUniSpeedButton;
    sbFagl: TUniSpeedButton;
    SBFaImport: TUniSpeedButton;
    procedure sbtnFaMainClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBFaBookClick(Sender: TObject);
    procedure SbFaClassClick(Sender: TObject);
    procedure sbFaglClick(Sender: TObject);
    procedure SBFaImportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses
{ TODO -omugdha -cWEBIQ : Dependancy on fashare module }
  FAShare,
  FAConst,
  IQMS.Common.ApplicationSet,
  IQMS.Common.RegFrm;
{$R *.DFM}

procedure TFrmFaLauncher.sbtnFaMainClick(Sender: TObject);
begin
  //CheckDBModuleCreated;

  DoIqFA( self, SHOW_FA_MAIN, '', 0, 0, 0); {in FAShare.pas}
end;

procedure TFrmFaLauncher.FormCreate(Sender: TObject);
begin
  AssignApplicationSettings(Application);      { IQMS.Common.ApplicationSet.pas }
  IQRegFormRead( Self, [ Self ]);
end;

procedure TFrmFaLauncher.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self ]);
  Action := caFree;
end;

procedure TFrmFaLauncher.SBFaBookClick(Sender: TObject);
begin
  //CheckDBModuleCreated;
  DoIqFA( self, SHOW_FA_BOOKS, '', 0, 0, 0);  {in FAShare.pas}
end;

procedure TFrmFaLauncher.SbFaClassClick(Sender: TObject);
begin
  //CheckDBModuleCreated;
  DoIqFA( self, SHOW_FA_CLASS, '', 0, 0, 0);  {in FAShare.pas}
end;

procedure TFrmFaLauncher.sbFaglClick(Sender: TObject);
begin
 // CheckDBModuleCreated;
  DoIqFA( self, SHOW_FA_GL, '', 0, 0, 0);  {in FAShare.pas}
end;

procedure TFrmFaLauncher.SBFaImportClick(Sender: TObject);
begin
  //CheckDBModuleCreated;
  DoIqFA( self, SHOW_IMP_FA, '', 0, 0, 0);  {in FAShare.pas}
end;

end.
