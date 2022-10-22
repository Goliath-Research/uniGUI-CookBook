inherited AcctTreeViewPk: TAcctTreeViewPk
  Top = 130
  ClientHeight = 222
  ClientWidth = 364
  Caption = 'Accounts PickList'
  ExplicitWidth = 382
  ExplicitHeight = 267
  PixelsPerInch = 96
  TextHeight = 17
  inherited Bevel1: TUniPanel
    Width = 364
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitWidth = 460
  end
  inherited Panel1: TUniPanel
    Top = 161
    Width = 364
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 161
    ExplicitWidth = 364
    inherited Panel2: TUniPanel
      Left = 109
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 109
      inherited btnOK: TUniButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
      inherited btnCancel: TUniButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
    end
  end
  inherited TreeView1: TUniTreeView
    Width = 364
    Height = 124
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Items.FontData = {0100000000}
    OnMouseDown = TreeView1MouseDown
    ExplicitWidth = 364
    ExplicitHeight = 124
  end
  inherited PnlToolbarMain: TUniPanel
    Width = 364
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitWidth = 364
    inherited sbtnExpand: TUniSpeedButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited sbtnCollapse: TUniSpeedButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    object sbtnOnTop: TUniSpeedButton
      Left = 70
      Top = 1
      Width = 31
      Height = 31
      Hint = 'Toggle Stay On Top'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      GroupIndex = 1
      AllowAllUp = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0A09060483060483060
        4830604830604830604830604830604830604830604830FF00FFFF00FFFF00FF
        FF00FFFF00FFB0A090FFF8F0E0E0E0E0D8D0E0D8D0E0D0C0E0C8C0D0C0B0D0C0
        B0D0B8A0604830FF00FFFF00FFFF00FFFF00FFFF00FFB0A090FFF4F1FFF2EFFF
        EFECFFEDE9FFEBE78C89876D6A68302E2CD0B8B0604830FF00FFFF00FFB0A090
        604830604830B0A090FFF6F492908F716F6E302E2CFFEDE9BAB7B49B98965F5C
        5AD0C0B0604830FF00FFFF00FFB0A090FFF8F0E0E0E0C0A8A0FFF8F7FFF6F4FF
        F4F1FFF2EFFFEFECFFEDE9FFEBE7FFE5DFE0D0C0604830FF00FFFF00FFB0A090
        FFFFFFD0B8B0C0B0A0FFFAF9FFF8F7FFF6F4FFF4F1FFF2EF8C89876D6A68302E
        2CE0D8D0604830FF00FFFF00FFB0A090FFFFFFFFFFFFD0B0A0FFFCFC92908F71
        6F6E302E2CFFF4F1BAB7B498959255524FE0E0E0604830FF00FFFF00FFC0A8A0
        FFFFFFE0C8C0D0B8A0FFFFFFFFFCFCFFFAF9FFF8F7FFF6F4FFF4F1FFF2EFFFEF
        ECFFF8F0604830FF00FFFF00FFC0B0A0FFFFFFFFFFFFF0A890F0A880F0A080F0
        A070E09870E09060E08860E08050E07840E07840D06030FF00FFFF00FFD0B0A0
        FFFFFFE0C8C0F0A890FFC0A0FFC0A0FFB890FFB890FFB090FFA880F0A070F0A0
        70F09870D06830FF00FFFF00FFD0B8A0FFFFFFFFFFFFF0A890F0A880F0A080F0
        A080E09870E09060E08860E08850E08050E07840E07840FF00FFFF00FFF0A890
        F0A880F0A080F0A070E09870E09060E08860E08050E07840E07840D06030FF00
        FFFF00FFFF00FFFF00FFFF00FFF0A890FFC0A0FFC0A0FFB890FFB890FFB090FF
        A880F0A070F0A070F09870D06830FF00FFFF00FFFF00FFFF00FFFF00FFF0A890
        F0A880F0A080F0A080E09870E09060E08860E08850E08050E07840E07840FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnOnTopClick
    end
    object Bevel2: TUniPanel
      Left = 65
      Top = 4
      Width = 3
      Height = 26
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      TabOrder = 4
      Caption = ''
    end
  end
  inherited StatusBar1: TUniStatusBar
    Top = 203
    Width = 364
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 203
    ExplicitWidth = 364
  end
end
