unit edbadord;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMultiItem,
  uniListBox,
  MainModule,
  uniButton, UniMainMenu;

type
  TFrmBadEdiOrds = class(TUniForm)
    ListBox1: TUniListBox;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    SavetoFile1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    procedure Exit1Click(Sender: TObject);
    procedure SavetoFile1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowCDErrors  ( AStringList: TStringList; ACaption:String );
procedure DoShowBadEdiOrds( AStringList: TStringList );
function  DoShowErrors    ( AStringList: TStringList; ACaption:String ):boolean;

implementation
{$R *.DFM}

function DoShowErrors( AStringList: TStringList; ACaption:String ):boolean;
var
 FrmBadEdiOrds : TFrmBadEdiOrds;
begin
  FrmBadEdiOrds := TFrmBadEdiOrds.Create(UniApplication);
  with FrmBadEdiOrds do
  begin
    ListBox1.Items.Assign(AStringList);
    Caption := ACaption;
    Panel1.Visible := true;
    Result := ShowModal = mrOk;
  end;
end;

procedure DoShowCDErrors( AStringList: TStringList; ACaption:String );
var
 FrmBadEdiOrds : TFrmBadEdiOrds;
begin
  FrmBadEdiOrds := TFrmBadEdiOrds.Create(UniApplication);
  with FrmBadEdiOrds do
  begin
    ListBox1.Items.Assign(AStringList);
    Caption := ACaption;
    ShowModal;
  end;
end;

procedure DoShowBadEdiOrds( AStringList: TStringList );
var
 FrmBadEdiOrds : TFrmBadEdiOrds;
begin
  FrmBadEdiOrds := TFrmBadEdiOrds.Create(UniApplication);
  with FrmBadEdiOrds do
  begin
    ListBox1.Items.Assign(AStringList);
    ShowModal;
  end;
end;

procedure TFrmBadEdiOrds.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBadEdiOrds.SavetoFile1Click(Sender: TObject);
var
  S : TStringStream;
begin
  S := TStringStream.Create(ListBox1.Items.Text);
  try
    UniSession.SendStream(S, 'Bad EDI Orders.txt');
  finally
    S.Free;
  end;
end;

end.
