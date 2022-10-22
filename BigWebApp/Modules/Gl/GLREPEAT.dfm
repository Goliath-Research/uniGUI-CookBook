object FrmRepeat: TFrmRepeat
  Left = 309
  Top = 211
  ClientHeight = 257
  ClientWidth = 354
  Caption = 'Repeating Entry Options'
  BorderStyle = bsDialog
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 217
    Width = 354
    Height = 40
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 145
      Top = 1
      Width = 208
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BitBtn1: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Ok'
        ModalResult = 1
        TabOrder = 0
      end
      object BitBtn2: TUniBitBtn
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 354
    Height = 41
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 8
      Top = 12
      Width = 120
      Height = 13
      Hint = ''
      Caption = 'Repeat how many times?'
      TabOrder = 2
    end
    object Edit1: TUniEdit
      Left = 184
      Top = 8
      Width = 41
      Height = 21
      Hint = ''
      Text = '1'
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Tag = 1999
    Left = 0
    Top = 41
    Width = 354
    Height = 176
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object RadioGroup1: TUniRadioGroup
      Left = 16
      Top = 1
      Width = 169
      Height = 153
      Hint = ''
      Items.Strings = (
        'Weekly'
        'Bi-Weekly'
        'Monthly'
        'By Period'
        'Quarterly'
        'Yearly')
      Caption = ' How Often ? '
      TabOrder = 0
    end
  end
end
