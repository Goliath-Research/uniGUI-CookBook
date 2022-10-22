inherited CheckPoReceipts: TCheckPoReceipts
  Caption = 'Warning'
  OldCreateOrder = True
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Caption = 'Receipt has not been posted.  Continue?'
  end
  inherited Panel2: TUniPanel
    object Panel3: TUniPanel
      Left = 174
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
        Caption = '&Yes'
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        OnClick = BtnYesClick
      end
      object BtnNo: TUniButton
        Left = 111
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&No'
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 2
        OnClick = BtnYesClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'CheckPoReceipts')
    SecurityItems.Strings = (
      'BtnNo'
      'btnYes'
      'CheckBox')
    SecurityCode = 'CHECKPORECEIPTS'
    Left = 173
  end
end
