object FrmBomConfReplaceRG: TFrmBomConfReplaceRG
  Left = 327
  Top = 180
  ClientHeight = 172
  ClientWidth = 416
  Caption = 'Available Regrind % Exceeded'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 131
    Width = 416
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 209
      Top = 1
      Width = 207
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnReplace: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Replace'
        ModalResult = 1
        TabOrder = 1
      end
      object btnIgnore: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Ignore'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 416
    Height = 131
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 415
    object Label3: TUniLabel
      Left = 8
      Top = 16
      Width = 253
      Height = 13
      Hint = ''
      Caption = 'Replace Regrind % Entered with maximum available?'
      TabOrder = 3
    end
    object chkFutureChk: TUniCheckBox
      Left = 8
      Top = 120
      Width = 289
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Continue checking available Regrind % in the future'
      TabOrder = 0
    end
    object GroupBox1: TUniGroupBox
      Left = 32
      Top = 40
      Width = 265
      Height = 73
      Hint = ''
      Caption = ' Details '
      TabOrder = 1
      object Label1: TUniLabel
        Left = 16
        Top = 19
        Width = 97
        Height = 13
        Hint = ''
        Caption = 'Available Regrind %'
        TabOrder = 3
      end
      object Label2: TUniLabel
        Left = 16
        Top = 43
        Width = 92
        Height = 13
        Hint = ''
        Caption = 'Regrind % Entered'
        TabOrder = 4
      end
      object Edit1: TUniEdit
        Left = 160
        Top = 16
        Width = 88
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object Edit2: TUniEdit
        Left = 160
        Top = 40
        Width = 88
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmBomConfReplaceRG')
    SecurityItems.Strings = (
      'btnReplace')
    SecurityCode = 'FRMBOMCONFREPLACERG'
    Left = 288
    Top = 88
  end
end
