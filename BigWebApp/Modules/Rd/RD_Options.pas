unit RD_Options;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  RD_Share,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmRD_Options = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnCancel: TUniButton;
    btnOK: TUniButton;
    PnlMain: TUniPanel;
    GroupBox1: TUniGroupBox;
    chkOnHand: TUniCheckBox;
    chkNonComitted: TUniCheckBox;
    chkStdCost: TUniCheckBox;
    chkExtCost: TUniCheckBox;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FRDDispOptions : TRDDispOptions;
    procedure SetRDDispOptions(const Value: TRDDispOptions);
    function GetRDDispOptions:TRDDispOptions;

  public
    { Public declarations }
    property RDDispOptions:TRDDispOptions read GetRDDispOptions write SetRDDispOptions;
  end;

function SetRoutingDiagramOptions(var ARDDispOptions: TRDDispOptions): Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.Controls;

function SetRoutingDiagramOptions(var ARDDispOptions: TRDDispOptions): Boolean;
var
 frm: TFrmRD_Options;
begin
  frm := TFrmRD_Options.Create(uniGUIApplication.UniApplication);
  frm.FRDDispOptions := ARDDispOptions;

  Result:= (frm.ShowModal = mrOK);
  if Result then
  begin
    ARDDispOptions.ShowOnHand     := frm.chkOnHand.Checked;
    ARDDispOptions.ShowNonComitted:= frm.chkNonComitted.Checked;
    ARDDispOptions.ShowStdCost    := frm.chkStdCost.Checked;
    ARDDispOptions.ShowExtCost    := frm.chkExtCost.Checked;
  end;

end;

procedure TFrmRD_Options.UniFormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.ResizeCheckBoxes(Self, GroupBox1);
end;

procedure TFrmRD_Options.UniFormShow(Sender: TObject);
begin
  chkOnHand.Checked     := FRDDispOptions.ShowOnHand;
  chkNonComitted.Checked:= FRDDispOptions.ShowNonComitted;
  chkStdCost.Checked    := FRDDispOptions.ShowStdCost;
  chkExtCost.Checked    := FRDDispOptions.ShowExtCost;
end;

function TFrmRD_Options.GetRDDispOptions: TRDDispOptions;
begin
  result := FRDDispOptions;
end;

procedure TFrmRD_Options.SetRDDispOptions(const Value: TRDDispOptions);
begin
  FRDDispOptions := Value;
end;


end.
