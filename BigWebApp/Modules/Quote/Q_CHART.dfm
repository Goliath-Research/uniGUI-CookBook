object FrmQChart: TFrmQChart
  Left = 91
  Top = 182
  HelpContext = 1171349
  ClientHeight = 331
  ClientWidth = 594
  Caption = 'Chart'
  OnResize = FormResize
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 594
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
  end
  object ToolPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnRotate: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Rotate'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF811E00811E00811E00811E00FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2C2C2C2C
        2C2C2C2C2C2C2C2CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF811E008722009A3000AA3C009A3000811E00811E00811E00FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2C2C2C2F2F2F3B3B3B46
        46463B3B3B2C2C2C2C2C2C2C2C2CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF811E008F2800B64500A63900872200811E00FF00FF811E00811E00FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2C2C2C3434344E4E4E4343432F
        2F2F2C2C2CFF00FF2C2C2C2C2C2CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF902800C45000B64500811E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3535355757574E4E4E2C2C2CFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        811E00BB4A00D15B00A33600811E00FF00FFFF00FFFF00FFFF00FF811E00811E
        00FF00FFFF00FFFF00FFFF00FFFF00FF2C2C2C5252526262624141412C2C2CFF
        00FFFF00FFFF00FFFF00FF2C2C2C2C2C2CFF00FFFF00FFFF00FFFF00FFFF00FF
        811E00E26900D75F00A43700FF00FFFF00FFFF00FFFF00FFFF00FF8621008C26
        00811E00FF00FFFF00FFFF00FFFF00FF2C2C2C6E6E6E656565414141FF00FFFF
        00FFFF00FFFF00FFFF00FF2F2F2F3232322C2C2CFF00FFFF00FF8C2600A3481C
        A3481CF37700DC6400A437008C26008C2600FF00FFFF00FF811E008C2600BD4B
        008C2600811E00FF00FF3232324D4D4D4D4D4D7B7B7B69696941414132323232
        3232FF00FFFF00FF2C2C2C3232325353533232322C2C2CFF00FFFF00FF8C2600
        EE8318F77A00E26A00CE58008C2600811E00FF00FF811E008C2600BD4B00BD4B
        00BD4B008C2600811E00FF00FF3232328383837D7D7D6F6F6F5F5F5F3232322C
        2C2CFF00FF2C2C2C3232325353535353535353533232322C2C2CFF00FF811E00
        8C2600F47800E76E00C55100872200FF00FF811E008C2600AD3F00BD4B00BD4B
        00BA4800AD3F008C2600FF00FF2C2C2C3232327C7C7C7272725858582F2F2FFF
        00FF2C2C2C323232484848535353535353505050484848323232FF00FFFF00FF
        811E008C2600E66D008F2800811E00FF00FFFF00FFFF00FF811E00AD3F00BD4B
        00A43700FF00FFFF00FFFF00FFFF00FF2C2C2C3232327171713434342C2C2CFF
        00FFFF00FFFF00FF2C2C2C484848535353414141FF00FFFF00FFFF00FFFF00FF
        FF00FF811E00882300811E00FF00FFFF00FFFF00FFFF00FF811E00AD3F00BD4B
        00A43700FF00FFFF00FFFF00FFFF00FFFF00FF2C2C2C3030302C2C2CFF00FFFF
        00FFFF00FFFF00FF2C2C2C484848535353414141FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF811E00BA4800BA48
        008B2500FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF2C2C2C505050505050323232FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF811E009D3200BD4B00982E
        00811E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF2C2C2C3D3D3D5353533A3A3A2C2C2CFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF811E00811E009F3502A63900C95500BB49008E2700811E
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2C2C2C2C2C2C3F
        3F3F4343435C5C5C5151513333332C2C2CFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF811E00811E00A03500811E00811E00FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2C2C2C2C
        2C2C3F3F3F2C2C2C2C2C2CFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnRotateClick
    end
  end
  object Timer1: TUniTimer
    Interval = 20
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = Timer1Timer
    Left = 40
    Top = 3
  end
  object MainMenu1: TUniMainMenu
    Left = 216
    Top = 64
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Quote Chart'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195734 $'
    BuildVersion = '176554'
    Left = 184
    Top = 64
  end
end