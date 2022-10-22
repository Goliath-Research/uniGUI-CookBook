object FrmConvertUOM: TFrmConvertUOM
  Left = 101
  Top = 219
  ClientHeight = 114
  ClientWidth = 346
  Caption = 'Custom UOM'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 81
    Width = 346
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 185
      Top = 1
      Width = 161
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 80
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 346
    Height = 81
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      346
      81)
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 344
      Height = 79
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 5
      Caption = ''
      ExplicitLeft = 5
      ExplicitTop = 5
      ExplicitWidth = 336
      ExplicitHeight = 71
    end
    object Label1: TUniLabel
      Left = 14
      Top = 18
      Width = 70
      Height = 13
      Hint = ''
      Caption = 'Convert From:'
      TabOrder = 6
    end
    object Label2: TUniLabel
      Left = 14
      Top = 47
      Width = 58
      Height = 13
      Hint = ''
      Caption = 'Convert To:'
      TabOrder = 7
    end
    object edFrom: TUniEdit
      Left = 150
      Top = 14
      Width = 91
      Height = 21
      Hint = ''
      Text = ''
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnChange = edFromChange
    end
    object edTo: TUniEdit
      Left = 150
      Top = 44
      Width = 91
      Height = 19
      Hint = ''
      Text = ''
      Anchors = [akTop, akRight]
      TabOrder = 1
      Color = clBtnFace
    end
    object EdConvFrom: TUniEdit
      Left = 249
      Top = 44
      Width = 80
      Height = 19
      Hint = ''
      Text = ''
      Anchors = [akTop, akRight]
      TabOrder = 2
      Color = clBtnFace
    end
    object cbTarget: TUniDBComboBox
      Left = 249
      Top = 14
      Width = 80
      Height = 21
      Hint = ''
      Anchors = [akTop, akRight]
      TabOrder = 3
      OnChange = cbTargetChange
    end
  end
end
