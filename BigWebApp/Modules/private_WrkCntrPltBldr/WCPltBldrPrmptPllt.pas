unit WCPltBldrPrmptPllt;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  WCPltBldr_share,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmPromptPallet = class(TUniForm)
    sbtnShowKeyPad: TUniSpeedButton;
    pnlInstructions: TUniPanel;
    edSerialno: TUniEdit;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    bbtnOK: TUniBitBtn;
    bbtnCancel: TUniBitBtn;
    procedure edSerialnoKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnShowKeyPadClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
    private
      { Private declarations }
      FMasterLabelRec: TMasterLabelRec;
    public
      { Public declarations }
      property MasterLabelRec: TMasterLabelRec read FMasterLabelRec
        write FMasterLabelRec;
  end;

function PromptPallet(var AMasterLabelRec: TMasterLabelRec): Boolean;

var
  FrmPromptPallet: TFrmPromptPallet;

implementation

{$R *.dfm}


uses
  IQMS.Common.Miscellaneous,
  iqrf.conslib_share,
  Touchscrn,
  WCPltBldr_rscstr;

function PromptPallet(var AMasterLabelRec: TMasterLabelRec): Boolean;
begin
  with TFrmPromptPallet.Create(Application) do
    try
      Result := ShowModal = mrOK;
      if Result then
        AMasterLabelRec := FMasterLabelRec;
    finally
      FREE;
    end;
end;

procedure TFrmPromptPallet.edSerialnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#13] then
    bbtnOK.Click;
end;

procedure TFrmPromptPallet.sbtnShowKeyPadClick(Sender: TObject);
var
  ANewValue: string;
begin
  ANewValue := edSerialno.Text;
  if TouchScreen_KeyPad(self, ANewValue, FALSE { CheckThousandSeparator } ,
    FALSE { ShowDecimalSeparator } ) then // touchscrn.pas
    edSerialno.Text := ANewValue;
end;

procedure TFrmPromptPallet.bbtnCancelClick(Sender: TObject);
begin
  self.ModalResult := mrCancel;
end;

procedure TFrmPromptPallet.bbtnOKClick(Sender: TObject);
var
  ASerial: string;
begin
  try
    ASerial := iqrf.conslib_share.StripPrefix(edSerialno.Text, ['S', 'M', '2S', '3S']);

    IQMS.Common.Miscellaneous.IQAssert(WCPltBldr_share.GetSerialInfo(ASerial, FMasterLabelRec),
      // WCPltBldr_rscstr.cTXT000028 = 'Invalid serial # %s';
      Format(WCPltBldr_rscstr.cTXT000028, [ASerial]));

    if FMasterLabelRec.ParentID > 0 then
      // WCPltBldr_rscstr.cTXT000029 = 'Unable to locate pallet ID %.0f';
      IQMS.Common.Miscellaneous.IQAssert(WCPltBldr_share.GetSerialInfo('', FMasterLabelRec,
        FMasterLabelRec.ParentID), Format(WCPltBldr_rscstr.cTXT000029,
        [FMasterLabelRec.ParentID]));

    // WCPltBldr_rscstr.cTXT000030 = 'Unable to proceed - Scanned serial is
    // either not a pallet label or has not been scanned to a pallet.'
    if (not FMasterLabelRec.Is_Pallet ) and ( FMasterLabelRec.ParentID = 0 ) then
      raise Exception.Create(WCPltBldr_rscstr.cTXT000030);

    ModalResult := mrOK;

  except
    on E: Exception do
      begin
        if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
          Touchscrn.TouchScreen_Msg_Error(E.Message);
        System.SysUtils.Abort;
      end;
  end;
end;

end.
