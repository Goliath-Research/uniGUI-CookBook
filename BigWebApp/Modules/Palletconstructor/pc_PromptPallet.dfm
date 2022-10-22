object FrmPromptPallet: TFrmPromptPallet
  Left = 488
  Top = 476
  ClientHeight = 126
  ClientWidth = 288
  Caption = 'Enter Pallet #'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object sbtnShowKeyPad: TUniSpeedButton
    Left = 214
    Top = 29
    Width = 60
    Height = 50
    Hint = 'Show Keypad'
    ShowHint = True
    ParentShowHint = False
    AllowAllUp = True
    Glyph.Data = {
      7E010000424D7E01000000000000760000002800000016000000160000000100
      0400000000000801000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
      66666666660067777777777777777766660067FFF8FFF8FFF8FFF766660067F0
      F8F0F8F0F8F0F766660067FFF8FFF8FFF8FFF766660067888888888888888766
      660067FFF8FFF8FFF8FFF766660067F0F8F0F8F0F8F0F766660067FFF8FFF8FF
      F8FFF766660067888111118888888766660067FFF1FFF1FFF8FFF766660067F0
      F1F0F1F0F8F0F766660067FFF1FFF1FFFFFFF766660067888111118880888766
      660067FFF8F00FFF080FF766660067F0F8F080F080800000000067FFF8FF0808
      080F8F0CC00067777777708080F8F8FCC0006666666666080F8F8F8CC0006666
      66666660F8F8F80CC00066666666666600000060000066666666666666666666
      6600}
    Caption = ''
    ParentColor = False
    Color = clWindow
    OnClick = sbtnShowKeyPadClick
  end
  object pnlInstructions: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 288
    Height = 25
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akBottom]
    ParentFont = False
    Font.Color = clWhite
    Font.Style = [fsBold]
    TabOrder = 0
    Alignment = taLeftJustify
    Caption = 'Enter Pallet Serial #'
    Color = clMedGray
    ExplicitWidth = 296
  end
  object edSerialno: TUniEdit
    Left = 10
    Top = 38
    Width = 191
    Height = 32
    Hint = ''
    Text = ''
    ParentFont = False
    Font.Height = -19
    Font.Style = [fsBold]
    TabOrder = 1
    OnKeyPress = edSerialnoKeyPress
  end
  object bbtnOK: TUniBitBtn
    Left = 75
    Top = 84
    Width = 100
    Height = 40
    Hint = ''
    Glyph.Data = {
      BE060000424DBE06000000000000360400002800000024000000120000000100
      0800000000008802000000000000000000000001000000010000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030313030303030303030303
      030303030303030404030303030303030303030303030303030C0C1303030303
      030303030303030303030402020403030303030303030303030303030C03030C
      130303030303030303030303030402020202040303030303030303030303030C
      030303030C130303030303030303030304020202020202040303030303030303
      03030C0303030303030C130303030303030303040202020E0202020204030303
      03030303030C1303030C130303030C13030303030303030202020E030E020202
      0403030303030303030C13030C030C1303030C13030303030303030E020E0303
      030E02020204030303030303030C130C0303030C1303030C1303030303030303
      0E03030303030E02020204030303030303030C03030303030C1303030C130303
      03030303030303030303030E02020204030303030303030303030303030C1303
      030C13030303030303030303030303030E020202040303030303030303030303
      03030C1303030C13030303030303030303030303030E02020204030303030303
      030303030303030C1303030C13030303030303030303030303030E0202020403
      0303030303030303030303030C1303030C13030303030303030303030303030E
      02020403030303030303030303030303030C13030C1303030303030303030303
      030303030E02020303030303030303030303030303030C130C03030303030303
      0303030303030303030E03030303030303030303030303030303030C03030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303}
    Caption = 'OK'
    TabOrder = 2
    Default = True
    OnClick = bbtnOKClick
  end
  object bbtnCancel: TUniBitBtn
    Left = 187
    Top = 84
    Width = 100
    Height = 40
    Hint = ''
    Glyph.Data = {
      BE060000424DBE06000000000000360400002800000024000000120000000100
      0800000000008802000000000000000000000001000000010000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      03030C0C03030303030303030303030303030303031303030303030303030303
      03030303030D01010C03030303030D0C03030303030303030C0C130303030303
      0313030303030303030D0101010C0303030D01010C0303030303030C13030C13
      030303130C0C130303030303030D010101010C030D010101010C03030303030C
      1303030C1303130C03030C130303030303030D010101010C01010101010C0303
      0303030C130303030C130C030303030C130303030303030D0101010101010101
      0C030303030303030C130303030C03030303130C03030303030303030D010101
      0101010C0303030303030303030C13030303030303130C030303030303030303
      0301010101010C03030303030303030303030C1303030303030C030303030303
      03030303030D010101010C0303030303030303030303030C130303030C030303
      03030303030303030D01010101010C0303030303030303030303030C03030303
      0C130303030303030303030D0101010C0101010C030303030303030303030C03
      030303030C1303030303030303030D0101010C030D0101010C03030303030303
      030C0303030C1303030C13030303030303030D01010C0303030D0101010C0303
      030303030C1303030C030C1303030C13030303030303030D0103030303030D01
      01010303030303030C13130C0303030C1303030C130303030303030303030303
      0303030D010D030303030303030C0C03030303030C1313130C03030303030303
      030303030303030303030303030303030303030303030303030C0C0C03030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303}
    Caption = 'Cancel'
    Cancel = True
    TabOrder = 3
    OnClick = bbtnCancelClick
  end
end