object FrmHeijunkaConfirmMove: TFrmHeijunkaConfirmMove
  Left = 402
  Top = 250
  ClientHeight = 250
  ClientWidth = 307
  Caption = 'Confirm Move'
  OnShow = FormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  DesignSize = (
    307
    250)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 16
    Top = 8
    Width = 33
    Height = 13
    Hint = ''
    Caption = 'Source'
    TabOrder = 2
  end
  object Bevel1: TUniPanel
    Left = 16
    Top = 24
    Width = 259
    Height = 3
    Hint = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object Label2: TUniLabel
    Left = 16
    Top = 78
    Width = 32
    Height = 13
    Hint = ''
    Caption = 'Target'
    TabOrder = 4
  end
  object Bevel2: TUniPanel
    Left = 16
    Top = 94
    Width = 259
    Height = 3
    Hint = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    Caption = ''
  end
  object Label3: TUniLabel
    Left = 16
    Top = 152
    Width = 81
    Height = 13
    Hint = ''
    Caption = 'Number of Cards'
    TabOrder = 6
  end
  object Bevel3: TUniPanel
    Left = 16
    Top = 168
    Width = 259
    Height = 3
    Hint = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
    Caption = ''
  end
  object lblSource: TUniLabel
    Left = 31
    Top = 32
    Width = 201
    Height = 38
    Hint = ''
    AutoSize = False
    Caption = '1'
    TabOrder = 8
  end
  object lblTarget: TUniLabel
    Left = 31
    Top = 102
    Width = 201
    Height = 38
    Hint = ''
    AutoSize = False
    Caption = '1'
    TabOrder = 9
  end
  object edCount: TUniEdit
    Left = 16
    Top = 175
    Width = 73
    Height = 21
    Hint = ''
    Text = '1'
    TabOrder = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 209
    Width = 307
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Bevel4: TUniPanel
      Left = 1
      Top = 1
      Width = 305
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel2: TUniPanel
      Left = 129
      Top = 4
      Width = 177
      Height = 36
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        Default = True
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 92
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMHEIJUNKACONFIRMMOVE'
    Left = 8
    Top = 220
  end
end
