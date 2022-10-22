unit precisiondlg;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, Vcl.ComCtrls;

type
  TFrmPrecisionDlg = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlMain: TUniPanel;
    Label1: TUniLabel;
    edtPrecision: TUniEdit;
    Label2: TUniLabel;
    Panel1: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    udPrecision: TUpDown;
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FLastValue: Real;
  public
    { Public declarations }
    //constructor Create(AOwner: TComponent; APrecision: Integer);
  end;

function PromptPrecision(AOwner: TComponent; var APrecision: Integer): Boolean;


implementation

{$R *.DFM}


uses
  IQMS.Common.Controls;

function PromptPrecision(AOwner: TComponent; var APrecision: Integer): Boolean;
begin
  with TFrmPrecisionDlg.Create(UniGuiApplication.UniApplication) do
    begin
      Result := (ShowModal = mrOk);
      if Result then
        //APrecision := udPrecision.Position;
    end;
end;

{ TFrmPrecisionDlg }

procedure TFrmPrecisionDlg.UniFormCreate(Sender: TObject);
begin
  FLastValue := 0;
  inherited;
  //udPrecision.Position := Precision;
  //IQMS.Common.Controls.CenterForm(Self, True);
end;

end.
