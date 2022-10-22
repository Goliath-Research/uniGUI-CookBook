{NOT COMPLETE VER - JUST WAS ABLE TO OBTAIN MAC ADDRESS!!!}
unit Mon_Params;

interface

uses
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
  uniButton,
  uniCheckBox,
  uniDBCheckBox;

type
  TFrmMon_Params = class(TUniForm)
    CheckBox1: TUniCheckBox;
    DBCheckBox1: TUniDBCheckBox;
    Button1: TUniButton;
    Edit1: TUniEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;

  end;

implementation

{$R *.DFM}

class procedure TFrmMon_Params.DoShowModal;
var
  frm : TFrmMon_Params;
begin

  frm := TFrmMon_Params.Create(uniGUIApplication.UniApplication);

end;

(* this IS working!
function CoCreateGuid(var guid: TGUID): HResult; stdcall; far external 'ole32.dll';

function Get_NICAddress: string;
var
  g: TGUID;
  i: Byte;
begin
  Result := '';
  CoCreateGUID(g);
  for i := 2 to 7 do
    Result := Result + IntToHex(g.D4[i], 2);
end;

*)

procedure TFrmMon_Params.Button1Click(Sender: TObject);
begin
  // Edit1.Text:= Get_NICAddress;
end;


end.
