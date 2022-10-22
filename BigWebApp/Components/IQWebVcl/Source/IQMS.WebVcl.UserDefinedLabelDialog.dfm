object FrmUserDefLabel: TFrmUserDefLabel
  Left = 282
  Top = 200
  ClientHeight = 149
  ClientWidth = 338
  Caption = 'User-Defined Caption'
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  OnMouseDown = UniFormMouseDown
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 108
    Width = 338
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Left = 131
      Top = 1
      Width = 207
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
      object btnOK: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 2
        OnClick = btnOKClick
      end
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 338
    Height = 108
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 8
      Top = 8
      Width = 313
      Height = 81
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '  Customize Caption  '
      TabOrder = 0
      object Label1: TUniLabel
        Left = 12
        Top = 24
        Width = 64
        Height = 13
        Hint = ''
        ShowHint = True
        Caption = 'Default Value'
        TabOrder = 3
      end
      object Label2: TUniLabel
        Left = 12
        Top = 52
        Width = 50
        Height = 13
        Hint = ''
        ShowHint = True
        Caption = 'New Value'
        TabOrder = 4
      end
      object sbtnAsDefault: TUniSpeedButton
        Left = 280
        Top = 48
        Width = 22
        Height = 22
        Hint = 'Reset caption to default value'
        ShowHint = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0B28DDF9F74EBC0A1FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFEDB697F08850D07850DDA787FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF3C8ACE6AC8AF08850D27D56FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFCA7C57F08850E5B08DFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEB69AE07840F090
          60FF00FFFF00FFFF00FFFF00FFFF00FFE07840D07040C06840B06030B0583090
          5030FF00FFFF00FFF1CFB7C06840F08850EFC0A3FF00FFFF00FFFF00FFFF00FF
          E08050E07030F08050F09870E09060F8D0B8FF00FFFF00FFFF00FFC06840E185
          57F3B997FF00FFFF00FFFF00FFFF00FFE09060F08050F09060F0A070B17760E8
          C1A4FF00FFFF00FFFF00FFC06840E17E48F2B692FF00FFFF00FFFF00FFFF00FF
          E09870F09870F0A070F09466B06040B06040DAA988FF00FFF2D6BEA56039E17E
          48F2B693FF00FFFF00FFFF00FFFF00FFF0A880F2C6A8F5C5A7F0B090E09060C0
          7040C06840C28057B97E51A06040F08850F1C4A5FF00FFFF00FFFF00FFFF00FF
          F0A890F9DFC7FF00FFF4C3A8F0B090F09566D07040B06840B46739E17E48F0BA
          A2F1C4B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF3BDA0F0
          B090F1B698F1AF8AF1AF8AF1BDA6F0C2B2FBE1CEFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFF8D5BBF3BDA1F1BDA6F3C9ADF5D0C0FBE2
          D0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -16
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWindow
        TabOrder = 5
        OnClick = sbtnAsDefaultClick
      end
      object edDefault: TUniEdit
        Left = 92
        Top = 21
        Width = 185
        Height = 21
        Hint = ''
        ShowHint = True
        Text = ''
        TabOrder = 0
        Color = clBtnFace
        ReadOnly = True
      end
      object edNewCaption: TUniEdit
        Left = 92
        Top = 48
        Width = 185
        Height = 21
        Hint = ''
        ShowHint = True
        Text = ''
        TabOrder = 1
      end
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 56
    Top = 80
    object Details1: TUniMenuItem
      Caption = '&Details'
      OnClick = Details1Click
    end
  end
end
