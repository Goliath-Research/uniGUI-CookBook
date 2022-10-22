unit cc_options;

interface

uses
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniPanel,
  uniLabel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton,
  uniBitBtn, uniSpinEdit;

type
  TFrmCCOptions = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlMain: TUniPanel;
    PnlPurgeOptions: TUniPanel;
    gbPurgeOptions: TUniGroupBox;
    PnlPurgeOptionsControls: TUniPanel;
    Splitter1: TUniSplitter;
    PnlPurgeOptionsLeft: TUniPanel;
    lblPurgePromptDays: TUniLabel;
    lblDaysToKeep: TUniLabel;
    PnlPurgeOptionsClient: TUniPanel;
    lblDaysToKeepUOM: TUniLabel;
    lblPurgePromptDaysUOM: TUniLabel;
    edtPurgePromptDays: TUniSpinEdit;
    edtDaysToKeep: TUniSpinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
