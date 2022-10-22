unit rmng_About;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Graphics,
  Forms,
  Controls,
  StdCtrls,
  Buttons,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniLabel,
  uniImage,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  MainModule,
  uniButton;

type
  TFrmAbout = class(TUniForm)
    Panel1: TUniPanel;
    ProgramIcon: TUniImage;
    lblProductName: TUniLabel;
    lblVersion: TUniLabel;
    lblCopyright: TUniLabel;
    lblComments: TUniLabel;
    btnOK: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ShowAboutForm ( AProductName, AVersion, ACopyright, AComments: string ): Boolean; 
  

implementation

{$R *.DFM}


function ShowAboutForm ( AProductName, AVersion, ACopyright, AComments: string ): Boolean;
var
  FrmAbout : TFrmAbout;
begin
  FrmAbout := TFrmAbout.Create(UniApplication);
  with FrmAbout do
  begin
    lblProductName.Caption:= AProductName;
    lblVersion.Caption:= AVersion;
    lblCopyright.Caption:= ACopyright;
    lblComments.Caption:= AComments;
    
    Result:= ShowModal = mrOK;
  end;
end;

end.
 
