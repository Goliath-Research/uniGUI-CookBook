object FrmIQChoice: TFrmIQChoice
  Left = 345
  Top = 240
  ClientHeight = 193
  ClientWidth = 311
  Caption = ''
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlOptions: TUniPanel
    Left = 0
    Top = 41
    Width = 311
    Height = 119
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object rgOptions: TUniRadioGroup
      Left = 1
      Top = 1
      Width = 309
      Height = 117
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Options '
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 160
    Width = 311
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtons: TUniPanel
      Left = 103
      Top = 1
      Width = 207
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
      end
      object btnCancel: TUniBitBtn
        Left = 102
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlPrompt: TUniPanel
    Left = 0
    Top = 0
    Width = 311
    Height = 41
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 7
      Width = 8
      Height = 33
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      Caption = ''
    end
    object Bevel2: TUniPanel
      Left = 1
      Top = 1
      Width = 309
      Height = 6
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object Bevel3: TUniPanel
      Left = 304
      Top = 7
      Width = 6
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 4
      Caption = ''
    end
    object Panel3: TUniPanel
      Left = 9
      Top = 7
      Width = 295
      Height = 33
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object lblPrompt: TUniLabel
        Left = 1
        Top = 1
        Width = 110
        Height = 13
        Hint = ''
        Caption = 'Please select an option'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMIQCHOICE'
    AfterApply = SRAfterApply
    BeforeApply = SRBeforeApply
    Left = 56
    Top = 88
  end
end
