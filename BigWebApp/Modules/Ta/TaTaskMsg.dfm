object FrmTaskMsg: TFrmTaskMsg
  Left = 193
  Top = 222
  ClientHeight = 331
  ClientWidth = 384
  Caption = 'Task messages'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Height = -13
  Font.Style = [fsBold]
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel3: TUniPanel
    Left = 0
    Top = 261
    Width = 384
    Height = 70
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object btnYes: TUniBitBtn
      Left = 137
      Top = 20
      Width = 120
      Height = 40
      Hint = ''
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      Caption = '&OK'
      TabOrder = 0
      OnClick = btnYesClick
    end
  end
  object Memo1: TUniMemo
    Left = 0
    Top = 0
    Width = 384
    Height = 261
    Hint = ''
    Lines.Strings = (
      '')
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  object Timer1: TUniTimer
    Interval = 20000
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = Timer1Timer
    Left = 48
    Top = 92
  end
end
