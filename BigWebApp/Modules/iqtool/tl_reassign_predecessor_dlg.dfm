inherited FrmTLReassignPredecessorDlg: TFrmTLReassignPredecessorDlg
  Position = poOwnerFormCenter
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlButtons: TUniPanel
    ExplicitTop = 114
    ExplicitWidth = 336
    inherited PnlButtonsInner: TUniPanel
      Left = 126
      ExplicitLeft = 126
    end
  end
  inherited Panel1: TUniPanel
    ExplicitWidth = 336
    ExplicitHeight = 114
    inherited lblPrompt: TUniLabel
      Width = 706
      Caption = 
        ' Continuing with this action will re-assign all default predeces' +
        'sors according to the current task structure for this project.  ' +
        'Do you want to continue?'
      ExplicitWidth = 706
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmTLSecureDlgBase'
      'FrmTLReassignPredecessorDlg')
    SecurityCode = 'FRMTLREASSIGNPREDECESSORDLG'
  end
end
