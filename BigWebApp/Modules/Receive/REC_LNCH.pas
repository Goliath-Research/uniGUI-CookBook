unit rec_lnch;

interface

uses
  Vcl.Forms,
  Vcl.StdCtrls,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, System.Classes, Vcl.Controls, uniGUIBaseClasses,
  uniGUIClasses, uniButton;

type
  TFrmRecLaunch = class(TUniForm)
    Button1: TUniButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
  end;

//var
//  FrmRecLaunch: TFrmRecLaunch;

implementation
{$R *.DFM}

//uses
 // RecMain;

procedure TFrmRecLaunch.Button1Click(Sender: TObject);
begin
//  DoPoReceiving;
end;

end.
