unit Tlmakewo;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniCheckBox,
  uniButton,
  uniBitBtn;

type
  TFrmToolingWOOptions = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel1: TUniPanel;
    GroupBox1: TUniGroupBox;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    chkPM: TUniCheckBox;
    chkSO: TUniCheckBox;
    Label1: TUniLabel;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FString : TStrings;

  public
    { Public declarations }

    property OptionStrings : TStrings read FString;
  end;

function  GetToolingWOOptions : TStrings;

implementation

{$R *.DFM}

function GetToolingWOOptions : TStrings;
var
  frm : TFrmToolingWOOptions;
begin
  frm := TFrmToolingWOOptions.Create( UniApplication );
  frm.ShowModal;

  Result := frm.OptionStrings;
end;

procedure TFrmToolingWOOptions.btnOKClick(Sender: TObject);
begin
  if chkPM.Checked then
    FString.Add( 'PM ' ); {Link to PM}
  if chkSO.Checked then
    FString.Add( 'OE ' ); {Generate a Sales Order}
  if FString.Count = 0 then
    FString.Add( 'WO' ); {Initial string value}
end;

procedure TFrmToolingWOOptions.btnCancelClick(Sender: TObject);
begin
  FString.Add('ZZ ');
end;

procedure TFrmToolingWOOptions.UniFormCreate(Sender: TObject);
begin
  FString := TStringList.Create;
end;

end.
