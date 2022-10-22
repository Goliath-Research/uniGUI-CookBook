object FrmM_Viewer: TFrmM_Viewer
  Left = 49
  Top = 282
  HelpContext = 1111778
  ClientHeight = 447
  ClientWidth = 874
  Caption = 'RealTime Plant Efficiency Viewer'
  OnResize = FormResize
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 874
    Height = 27
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Select View'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
        90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
        40905030773818FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
        00FFFF00FFB08060F0E8E0E0C8C0D0A890B07850804820FF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
        00FFFF00FFB08060F0E8E0F0E0E0E0C0B0C08870804830FF00FFC09880FFFFFF
        F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FFC3A494B08870A068509050308048308048208038108F
        4C26B08870A06850905830904830804020703810905830FF00FFDEC4B4B08870
        FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
        50803820CFA98AFF00FFFF00FFC09080F0F0F0FFF8F0F0D8C0B0806080482096
        5732B09070FFFFFFFFF8F0F0D0C0B07850804820FF00FFFF00FFFF00FFF8E2D2
        C09880B08060A068509050309058409D6842B07860B08870A070508048308048
        20ECC4A7FF00FFFF00FFFF00FFFF00FFC09880FFF8FFE0C0B0C09070804820FF
        00FFC09880FFF8FFE0C8B0D0A080804820FF00FFFF00FFFF00FFFF00FFFF00FF
        CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
        37FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1836DFFF8F0814527FF00FFFF
        00FFFF00FFB08068FFF8F0804324FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSearchClick
    end
  end
  object CaptionPanel1: TIQWebCaptionPanel
    Left = 0
    Top = 27
    Width = 874
    Height = 54
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = 'Current View'
    ParentColor = True
    Text = 'Undefined'
    PictureLayout = plImageRight
    LayoutStyle = lsWindowsXP
    DesignSize = (
      874
      54)
  end
  object ScrollBoxDisplay: TUniScrollBox
    Left = 0
    Top = 81
    Width = 874
    Height = 347
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clGray
    TabOrder = 2
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 428
    Width = 874
    Height = 19
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object MainMenu1: TUniMainMenu
    Left = 116
    Top = 2
    object File1: TUniMenuItem
      Caption = 'File'
      object SetupViewer1: TUniMenuItem
        Caption = 'Setup Viewer'
        OnClick = SetupViewer1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmM_Viewer'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197410 $'
    BuildVersion = '176554'
    Left = 145
    Top = 3
  end
  object PkView: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, name, descrip from m_view')
    OnIQModify = PkViewIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 115
    Top = 35
    object PkViewID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.M_VIEW.ID'
      Visible = False
      Size = 0
    end
    object PkViewNAME: TStringField
      DisplayLabel = 'View Name'
      FieldName = 'NAME'
      Origin = 'IQ.M_VIEW.NAME'
      Size = 30
    end
    object PkViewDESCRIP: TStringField
      DisplayLabel = 'View Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.M_VIEW.DESCRIP'
      Size = 250
    end
  end
end
