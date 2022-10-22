object FrmTouchScreenSetFormPos: TFrmTouchScreenSetFormPos
  Left = 393
  Top = 228
  ClientHeight = 168
  ClientWidth = 128
  Caption = ''
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 128
    Height = 168
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    Color = clBtnShadow
    object sbtnClose: TUniSpeedButton
      Tag = 4
      Left = 62
      Top = 62
      Width = 60
      Height = 60
      Hint = 'Close Toolbox'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDD000000000000000000000000000000DD00000000000
        0000000000000000000DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFF000000000000FF00DD00FFFFFFFFF
        FFF000000000000FF00DD00FFFFFFFFFFFF000000000000FF00DD00FFFFFFFFF
        FFF000000000000FF00DD00FFFFFFFFFFFF000000000000FF00DD00FFFFFFFFF
        FFF000000000000FF00DD00FFFFFFFFFFFF000000000000FF00DD00FFFFFFFFF
        FFF000000000000FF00DD00FFFFFFFFFFFF000000000000FF00DD00FFFFFFFFF
        FFF000000000000FF00DD00FFFFFFFFFFFF000000000000FF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD000000000000000000000000000000DD00000000000
        0000000000000000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = DoBtnClick
    end
    object sbtnKeypad: TUniSpeedButton
      Tag = 1
      Left = 1
      Top = 1
      Width = 60
      Height = 60
      Hint = 'Number Pad'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDD000000000000000000000000000000DD00000000000
        0000000000000000000DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FF0000000
        00000FFFFFFFFFFFF00DD00FF000000000000FFFFFFFFFFFF00DD00FF0000000
        00000FFFFFFFFFFFF00DD00FF000000000000FFFFFFFFFFFF00DD00FF0000000
        00000FFFFFFFFFFFF00DD00FF000000000000FFFFFFFFFFFF00DD00FF0000000
        00000FFFFFFFFFFFF00DD00FF000000000000FFFFFFFFFFFF00DD00FF0000000
        00000FFFFFFFFFFFF00DD00FF000000000000FFFFFFFFFFFF00DD00FF0000000
        00000FFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD000000000000000000000000000000DD00000000000
        0000000000000000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = DoBtnClick
    end
    object sbtnKeyboard: TUniSpeedButton
      Tag = 3
      Left = 62
      Top = 1
      Width = 60
      Height = 60
      Hint = 'Keyboard'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDD000000000000000000000000000000DD00000000000
        0000000000000000000DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFF000000000000FF00DD00FFFFFFFFFFFF000000000000FF00DD00FFFFFFFFF
        FFF000000000000FF00DD00FFFFFFFFFFFF000000000000FF00DD00FFFFFFFFF
        FFF000000000000FF00DD00FFFFFFFFFFFF000000000000FF00DD00FFFFFFFFF
        FFF000000000000FF00DD00FFFFFFFFFFFF000000000000FF00DD00FFFFFFFFF
        FFF000000000000FF00DD00FFFFFFFFFFFF000000000000FF00DD00FFFFFFFFF
        FFF000000000000FF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD000000000000000000000000000000DD00000000000
        0000000000000000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = DoBtnClick
    end
    object sbtnDateTime: TUniSpeedButton
      Tag = 2
      Left = 1
      Top = 62
      Width = 60
      Height = 60
      Hint = 'Date and Time'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDD000000000000000000000000000000DD00000000000
        0000000000000000000DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FF000000000000FFFFFFFFFFFF00DD00FF0000000
        00000FFFFFFFFFFFF00DD00FF000000000000FFFFFFFFFFFF00DD00FF0000000
        00000FFFFFFFFFFFF00DD00FF000000000000FFFFFFFFFFFF00DD00FF0000000
        00000FFFFFFFFFFFF00DD00FF000000000000FFFFFFFFFFFF00DD00FF0000000
        00000FFFFFFFFFFFF00DD00FF000000000000FFFFFFFFFFFF00DD00FF0000000
        00000FFFFFFFFFFFF00DD00FF000000000000FFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD00FFFFFFFFFFFFFFFFFFFFFFFFFF00DD00FFFFFFFFF
        FFFFFFFFFFFFFFFFF00DD000000000000000000000000000000DD00000000000
        0000000000000000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = DoBtnClick
    end
    object SpeedButton1: TUniSpeedButton
      Left = 2
      Top = 123
      Width = 120
      Height = 40
      Hint = 'Date and Time'
      ShowHint = True
      ParentShowHint = False
      Caption = 'Cancel'
      ParentColor = False
      Color = clWindow
    end
  end
end