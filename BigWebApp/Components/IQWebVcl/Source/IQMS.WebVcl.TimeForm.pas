unit IQMS.WebVcl.TimeForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Vcl.Menus, uniMainMenu, uniGUIBaseClasses,
  uniMultiItem, uniListBox;

type
  TTimeForm = class(TUniForm)
    MMainMenu: TUniMainMenu;
    File1: TUniMenuItem;
    SaveToTextFile1: TUniMenuItem;
    Alist: TUniListBox;
    SaveToBitmapFile1: TUniMenuItem;
    procedure SaveToTextFile1Click(Sender: TObject);
    procedure SaveToBitmapFile1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uniGUIApplication;

{$R *.dfm}


procedure TTimeForm.SaveToBitmapFile1Click(Sender: TObject);
var
  s:string;
begin
   s:=' var element = $("#'+Alist.JSName+'_id-containerEl");  '+
  ' html2canvas(element, { '+
  '   onrendered: function (canvas) {  '+
  '     var imgageData = canvas.toDataURL("image/png"); '+
  '     var newData = imgageData.replace("data:image/png", "data:application/octet-stream"); '+
  '     var link = document.createElement("a"); '+
	'		    link.download = "List.png";    '+
	'		    link.href = newData; '+
	'		    link.click();'+
  '   } '+
  ' });';
//
UniSession.AddJS(s);

end;

procedure TTimeForm.SaveToTextFile1Click(Sender: TObject);
var
  s : TStringStream;
begin
   S := TStringStream.Create(Alist.Text);
    try
      UniSession.SendStream(S, 'List.txt');
    finally
      S.Free;
    end;
end;

initialization
  UniAddJSLibrary('/files/html2canvas.js', True, [upoPlatformDesktop]);

end.
