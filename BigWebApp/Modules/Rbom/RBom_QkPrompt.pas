unit RBom_QkPrompt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, System.Classes;

type
  TFrmRBomQuickPrompt = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    edMfgNo: TUniEdit;
    edItemNo: TUniEdit;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal( var AMfgNo, AItemNo: string ): Boolean;
  end;

implementation

{$R *.DFM}

class function TFrmRBomQuickPrompt.DoShowModal(var AMfgNo, AItemNo: string): Boolean;
var
  frm : TFrmRBomQuickPrompt;
begin
  frm := TFrmRBomQuickPrompt.Create(uniGUIApplication.UniApplication);
  Result:= (frm.ShowModal = mrOK);
  if Result then
  begin
    AMfgNo := UpperCase( Trim(frm.edMfgNo.Text  ));
    AItemNo:= UpperCase( Trim(frm.edItemNo.Text ));
  end;

end;

procedure TFrmRBomQuickPrompt.btnOKClick(Sender: TObject);
begin
  if (Trim(edMfgNo.Text) = '') and (edItemNo.Text = '') then
     ModalResult:= mrCancel
  else
     ModalResult:= mrOK;
end;

end.
