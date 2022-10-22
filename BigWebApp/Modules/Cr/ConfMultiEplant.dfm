inherited FrmConfMultiEplant: TFrmConfMultiEplant
  Caption = 'Warning'
  ExplicitWidth = 395
  ExplicitHeight = 205
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    object Panel3: TUniPanel
      Left = 166
      Top = 5
      Width = 213
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        213
        33)
      object BtnYes: TUniButton
        Tag = 1
        Left = 7
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
      end
      object BtnNo: TUniButton
        Left = 111
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 2
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmConfMultiEplant')
    SecurityItems.Strings = (
      'CheckBox'
      'BtnYes')
    SecurityCode = 'FRMCONFMULTIEPLANT'
  end
end
