unit BadRepl;

interface

uses
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.Controls,
  Mainmodule,
  uniMainMenu,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmBadReplicat = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    SavetoFile1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    ListBox1: TUniListBox;
    procedure Exit1Click(Sender: TObject);
    procedure SavetoFile1Click(Sender: TObject);
  private
    { Private declarations }

    procedure SetNonReplicatedAccounts(aValue : TStrings);
  public
    { Public declarations }

    property NonReplicatedAccounts : TStrings write SetNonReplicatedAccounts;
  end;

procedure DoShowNonReplicatedAccounts( AStringList: TStringList );

implementation

{$R *.DFM}

procedure DoShowNonReplicatedAccounts( AStringList: TStringList );
var
  FrmBadReplicat : TFrmBadReplicat;
begin
  FrmBadReplicat := TFrmBadReplicat.Create(uniGUIApplication.UniApplication);
   with FrmBadReplicat do
    begin
     NonReplicatedAccounts := AStringList;
     ShowModal;
    end;
end;

procedure TFrmBadReplicat.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBadReplicat.SavetoFile1Click(Sender: TObject);
var
  S : TStringStream;
begin
  S := TStringStream.Create(ListBox1.Items.Text);
  try
    UniSession.SendStream(S, 'Non Replicated Accounts.txt');
  finally
    S.Free;
  end;
end;

procedure TFrmBadReplicat.SetNonReplicatedAccounts(aValue: TStrings);
begin
  ListBox1.Items.Assign(aValue);
end;

end.
