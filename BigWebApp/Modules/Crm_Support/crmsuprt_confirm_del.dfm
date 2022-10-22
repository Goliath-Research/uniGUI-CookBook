object FrmSupportConfirmDel: TFrmSupportConfirmDel
  Left = 0
  Top = 0
  Caption = 'Confirmation'
  ClientHeight = 152
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 111
    Width = 372
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 162
      Top = 0
      Width = 210
      Height = 41
      Align = alRight
      ParentBackground = False
      TabOrder = 0
      object AcceptButton: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Caption = '&OK'
        Default = True
        ModalResult = 1
      end
      object CancelButton: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Cancel = True
        Caption = '&Cancel'
        ModalResult = 2
      end
    end
  end
  object PnlCarrier: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 372
    Height = 111
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    object lblPrompt: TUniLabel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 356
      Height = 13
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alTop
      Caption = 
        'Would you like to close or delete the selected CRM Support Issue' +
        's?'
      ExplicitWidth = 322
    end
    object CloseOption: TUniRadioButton
      Left = 16
      Top = 48
      Width = 113
      Height = 17
      Caption = 'Close'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object DeleteOption: TUniRadioButton
      Left = 16
      Top = 72
      Width = 113
      Height = 17
      Caption = 'Delete'
      TabOrder = 1
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'AcceptButton'
      'CancelButton'
      'CloseOption'
      'DeleteOption')
    SecurityCode = 'FRMSUPPORTCONFIRMDEL'
    AfterApply = SRAfterApply
    Left = 184
    Top = 80
  end
end
