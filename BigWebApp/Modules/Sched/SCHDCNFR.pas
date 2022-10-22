unit SchdCnfR;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit, MainModule,
  uniButton;

type
  TConfirmRecalc = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnCurrent: TUniButton;
    btnALL: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    Label1: TUniLabel;
    Edit1: TUniEdit;
    procedure btnALLClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetsEQNO(sEQNO:string);
  public
    property EQNO:string write SetsEQNO;
    { Public declarations }
  end;

function ConfirmRecalc( const sEQNO:string ):TModalResult;

implementation

{$R *.DFM}

function ConfirmRecalc( const sEQNO:string ):TModalResult;
var
  FrmConfirmRecalc : TConfirmRecalc;
begin
  FrmConfirmRecalc := TConfirmRecalc.Create(UniApplication);
  with FrmConfirmRecalc do
  begin
    EQNO:=sEQNO;
    Result:= ShowModal;
  end;
end;

procedure TConfirmRecalc.btnALLClick(Sender: TObject);
begin
  ModalResult:= mrAll;
end;

procedure TConfirmRecalc.SetsEQNO(sEQNO: string);
begin
    Edit1.Text:= sEQNO;
    btnCurrent.Enabled:= sEQNO <> '';
end;


end.

