unit LaunchCS;

interface

uses
  System.SysUtils,
  Vcl.Forms,
  System.Classes,
  Vcl.Controls,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniGUIBaseClasses,
  uniEdit,
  uniButton;

type
  TFrmLaunchCustStatus = class(TUniForm)
    Button1: TUniButton;
    Edit1: TUniEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation
 //  CStat;
{$R *.DFM}

procedure TFrmLaunchCustStatus.Button1Click(Sender: TObject);
begin
//   DoCustStat(self, StrToFloat(Edit1.Text));
end;

end.
