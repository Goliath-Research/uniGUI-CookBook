unit ShowOpen;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmShowOpenForms = class(TUniForm)
    ListBox1: TUniListBox;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowOpenForms;  { ShowOpen.pas }

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm;

procedure DoShowOpenForms;  { ShowOpen.pas }
begin
  with TFrmShowOpenForms.Create(uniGUIApplication.UniApplication ) do
  begin
    ShowModal;
  end;
end;

procedure TFrmShowOpenForms.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  IQRegFormRead( self, [ self ]);
  for I:= UniSession.FormsList.count - 1 downto 0 do
    if (UniSession.FormsList[ I ] <> self) and (TUniForm(UniSession.FormsList.Items[I]).visible)and (TUniForm(UniSession.FormsList.Items[I]).name<>'MainForm') then                      //and UniSession.FormsList[ I ].Visible
      ListBox1.Items.AddObject(TUniForm(UniSession.FormsList.Items[I]).caption, UniSession.FormsList[ I ]  );
end;

procedure TFrmShowOpenForms.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmShowOpenForms.btnOKClick(Sender: TObject);
var
  i : integer;
begin
  with ListBox1 do
    if ItemIndex > -1 then
    begin
      TUniForm( Items.Objects[ ItemIndex ] ).BringToFront;
      Close;
    end;
end;

procedure TFrmShowOpenForms.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

end.
