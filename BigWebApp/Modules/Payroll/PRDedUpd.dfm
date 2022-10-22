object FrmPrDeductUpdate: TFrmPrDeductUpdate
  Left = 424
  Top = 173
  HelpContext = 1005629
  ClientHeight = 203
  ClientWidth = 245
  Caption = 'Deductions defaults update'
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 173
    Width = 245
    Height = 30
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 76
      Top = 1
      Width = 169
      Height = 28
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 92
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 1
        OnClick = btnCancelClick
      end
      object btnApply: TUniButton
        Left = 13
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Apply'
        TabOrder = 2
        OnClick = btnApplyClick
      end
    end
  end
  object cbCeiling: TUniCheckBox
    Left = 12
    Top = 8
    Width = 153
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Ceiling'
    TabOrder = 1
  end
  object cbAmount: TUniCheckBox
    Left = 12
    Top = 31
    Width = 153
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Amount'
    TabOrder = 2
  end
  object cbPercentage: TUniCheckBox
    Left = 12
    Top = 53
    Width = 153
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Percentage'
    TabOrder = 3
  end
  object cbBack: TUniCheckBox
    Left = 12
    Top = 76
    Width = 153
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Back Deduction Multiplier'
    TabOrder = 4
  end
  object cbSeq: TUniCheckBox
    Left = 12
    Top = 99
    Width = 153
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Sequence'
    TabOrder = 5
  end
  object cbBasedOn: TUniCheckBox
    Left = 12
    Top = 121
    Width = 153
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Based On'
    TabOrder = 6
  end
  object cbNottoexceed: TUniCheckBox
    Left = 12
    Top = 144
    Width = 153
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Not to exceed'
    TabOrder = 7
  end
end
