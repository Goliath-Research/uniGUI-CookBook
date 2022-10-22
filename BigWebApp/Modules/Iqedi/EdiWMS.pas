unit EdiWMS;

interface

uses
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton;

type
  TFrmWMS = class(TUniForm)
    Edit1: TUniEdit;
    Label1: TUniLabel;
    Button1: TUniButton;
    Button2: TUniButton;
    Button3: TUniButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoWMS;

implementation

uses
 MainModule;
//  Edi856;

{$R *.dfm}

procedure DoWMS;
var
  FrmWMS : TFrmWMS;
begin
  FrmWMS := TFrmWMS.Create(UniApplication);
  FrmWMS.ShowModal;
end;

procedure TFrmWMS.Button2Click(Sender: TObject);
begin
//  FTempTsID := Do856EdiRF_Create(self, Edit1.Text);
end;

procedure TFrmWMS.Button1Click(Sender: TObject);
begin
//  Do856EdiRF_Process(Edit1.Text, FTempTsID);
end;

end.
