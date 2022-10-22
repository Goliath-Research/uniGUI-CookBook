object FrmProdBucketEnd: TFrmProdBucketEnd
  Left = 200
  Top = 108
  Width = 413
  Height = 157
  Caption = 'Set Bucket End Date'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Style = []
  OldCreateOrder = True
  Position = poDefaultPosOnly
  OnClose = FormClose
  OnShow = FormShow
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 82
    Width = 405
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 176
      Top = 0
      Width = 229
      Height = 41
      Align = alRight
      ParentBackground = False
      TabOrder = 0
      object btnOK: TUniButton
        Left = 16
        Top = 8
        Width = 97
        Height = 25
        Caption = 'OK'
        Default = True
        ModalResult = 1
      end
      object btnCancel: TUniButton
        Left = 120
        Top = 8
        Width = 97
        Height = 25
        Cancel = True
        Caption = 'Cancel'
        ModalResult = 2
      end
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 405
    Height = 82
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    object Label1: TUniLabel
      Left = 8
      Top = 18
      Width = 110
      Height = 13
      Caption = 'Production Bucket End'
    end
    object DateTimePicker1: TUniDateTimePicker
      Left = 129
      Top = 14
      Width = 97
      Height = 21
      TabOrder = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMPRODBUCKETEND'
    Left = 5
    Top = 48
  end
end
