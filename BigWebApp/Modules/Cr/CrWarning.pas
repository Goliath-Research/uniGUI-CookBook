unit CrWarning;

interface

uses
  System.Classes,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniImage;

type
  TFrmCRWarning = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Button1: TUniButton;
    Panel3: TUniPanel;
    Image1: TUniImage;
    Panel4: TUniPanel;
    Memo1: TUniMemo;
    Panel5: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SetWarning(Value : string);
  public
    property Warning : string write SetWarning;
    { Public declarations }
  end;

procedure DoCrWarning(AWarning : String);

implementation

uses
  MainModule,
  IQMS.Common.RegFrm;

{$R *.dfm}

procedure DoCrWarning(AWarning : String);
var
  FrmCRWarning: TFrmCRWarning;
begin
  FrmCRWarning := TFrmCRWarning.Create(uniGUIApplication.UniApplication);
  FrmCRWarning.Warning := AWarning;
  FrmCRWarning.ShowModal;
end;

procedure TFrmCRWarning.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmCRWarning.SetWarning(Value : string);
begin
  Memo1.Text := Value;
  Memo1.Readonly := true;
end;

procedure TFrmCRWarning.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

end.
