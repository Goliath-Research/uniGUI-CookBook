// Home =
unit umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, pngimage,
  uniImage, jpeg, uniLabel;

type
  TFrameMain = class(TUniFrame)
    UniLabel2: TUniLabel;
    UniImage1: TUniImage;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  ServerModule;

procedure TFrameMain.UniFrameCreate(Sender: TObject);
begin
  UniLabel2.Caption := 'Copyright © 1989-'+FormatDateTime('yyyy', Date)+' IQMS. All rights reserved.<br>'+
  '<b>IQMS</b> applications are protected under United States and international copyright laws.';
  UniImage1.Picture.LoadFromFile(UniServerModule.StartPath + 'images\IQMS.jpg');
end;

end.

