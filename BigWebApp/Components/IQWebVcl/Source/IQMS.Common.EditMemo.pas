unit IQMS.Common.EditMemo;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, Vcl.Controls;

type
  TFrmEditMemo = class(TUniForm)
    DBMemo: TUniDBMemo;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SetDBDemo(ADBMemo: TUniDBMemo);
  public
    { Public declarations }
    property xDBMemo: TUniDBMemo write SetDBDemo;
  end;

procedure EditMemoFieldAsAscii( ADBMemo: TUniDBMemo );


implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm;

procedure EditMemoFieldAsAscii( ADBMemo: TUniDBMemo );
var
  FrmEditMemo: TFrmEditMemo;
begin
  FrmEditMemo:= TFrmEditMemo.Create(uniGUIApplication.UniApplication);
  with FrmEditMemo do
  begin
    xDBMemo:=ADBMemo;
    ShowModal;
  end;
end;

procedure TFrmEditMemo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
  DBMemo.DataSource:= NIL;
end;

procedure TFrmEditMemo.SetDBDemo(ADBMemo: TUniDBMemo);
begin
  DBMemo.DataField := ADBMemo.DataField;
  DBMemo.DataSource:= ADBMemo.DataSource;
end;

procedure TFrmEditMemo.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

end.
