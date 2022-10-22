unit Shop_Dlg;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniBitBtn, Vcl.StdCtrls, uniSpinEdit, uniEdit;

type
  TShopDlg = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    bbtnOK: TUniBitBtn;
    bbtnCancel: TUniBitBtn;
    PnlMain: TUniPanel;
    lblPrompt: TUniLabel;
    lblYear: TUniLabel;
    eYear: TUniSpinEdit;
    procedure FormCreate(Sender: TObject);
  private
    procedure SetPromptText(const Value: string);
    function GetYear: integer;
    { Private declarations }
  public
    { Public declarations }
    property PromptText : string  write SetPromptText;
    property Year       : integer read GetYear;
  end;

function AskYearToSetup( var AYear: Integer; ACaption: string = '';
  APrompt: string = '' ): Boolean;

implementation

{$R *.DFM}

function AskYearToSetup( var AYear: Integer; ACaption, APrompt: string): Boolean;
var
  frm : TShopDlg;
begin
  frm := TShopDlg.Create(uniGUIApplication.UniApplication);

  if ACaption <> '' then
    frm.Caption := ACaption;
  if APrompt  <> '' then
    frm.PromptText := APrompt;

  Result:= frm.ShowModal = mrOK;

  if Result then
    AYear:= frm.Year;
end;

procedure TShopDlg.FormCreate(Sender: TObject);
var
  Year,dummy:word;
begin
  DecodeDate( Date, Year, dummy, dummy );
  eYear.Text:= IntToStr( Year );

  // position for localization
  eYear.Left := lblYear.Left + lblYear.Width + 8;
end;

function TShopDlg.GetYear: integer;
begin
  Result := eYear.Value;
end;

procedure TShopDlg.SetPromptText(const Value: string);
begin
  lblPrompt.Caption := Value;
end;

end.

