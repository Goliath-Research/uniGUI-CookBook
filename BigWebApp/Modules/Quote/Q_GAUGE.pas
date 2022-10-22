unit Q_gauge;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
//  Vcl.Buttons,
  FireDAC.Comp.Client,
  uniLabel, uniButton,
  uniBitBtn,
  System.Classes,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  Vcl.Forms;
  //,db_dm;

type
  TQ_CalcGauge = class(TUniForm)
    PnlButtons: TUniPanel;
    btnCancel: TUniBitBtn;
    PnlDisplay: TUniPanel;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    CalcQty: TUniLabel;
    Bevel1: TUniPanel;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Active:boolean ;
  end;

//var
//  Q_CalcGauge: TQ_CalcGauge;

function Q_CalcGauge:TQ_CalcGauge;
implementation

{$R *.DFM}

uses MainModule;
 //   iqmesg;
 //   quote_rscstr;

function  Q_CalcGauge:TQ_CalcGauge;
begin
  Result:=TQ_CalcGauge(UniMainModule.GetFormInstance(TQ_CalcGauge));
end;
procedure TQ_CalcGauge.FormCreate(Sender: TObject);
begin
   Active:= True;
end;

procedure TQ_CalcGauge.btnCancelClick(Sender: TObject);
begin
  try
    Application.NormalizeTopMosts;
    self.SendToBack;
 //  if IQConfirmYN(quote_rscstr.cTXT000000049 {'Cancel processing?'}) then
 // if MessageDlg('Are you sure?', mtWarning, [mbYes, mbNo], 0) = mrYes then
       Active:= False;
  finally
    Application.RestoreTopMosts;
  end;

end;

procedure TQ_CalcGauge.FormShow(Sender: TObject);
begin
  btnCancel.Left := (PnlButtons.ClientWidth - btnCancel.Width) div 2;
end;

end.

