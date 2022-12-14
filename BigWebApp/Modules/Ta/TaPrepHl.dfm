object FrmTaPrepHoliday: TFrmTaPrepHoliday
  Left = 285
  Top = 409
  ClientHeight = 187
  ClientWidth = 294
  Caption = 'Prepare Holiday Pay'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 8
    Top = 40
    Width = 77
    Height = 13
    Hint = ''
    Caption = 'Production Date'
    TabOrder = 3
  end
  object Label2: TUniLabel
    Left = 8
    Top = 66
    Width = 80
    Height = 13
    Hint = ''
    Caption = 'Holiday PayType'
    TabOrder = 7
  end
  object Label3: TUniLabel
    Left = 9
    Top = 92
    Width = 66
    Height = 13
    Hint = ''
    Caption = 'Holiday Hours'
    TabOrder = 8
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 0
    Width = 294
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SbEmp: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 26
      Height = 25
      Hint = 'Select by Employee'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00808700797000
        007907F700797000007907F700797000007907F780797990997907F780797990
        997907F780791990991907F880791990991907F888099900099980FF80007110
        1170880788080078700888800787808B8088888808B807BBB70888808BBB07BB
        B70888808BBB808B8088888808B8080008888888800088888888}
      Caption = ''
      ParentColor = False
      Color = clWindow
    end
    object SbShift: TUniSpeedButton
      Left = 27
      Top = 1
      Width = 26
      Height = 25
      Hint = 'Select by Shift'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0080CCCCCCCCCC
        CC08000CCCCCCCCCC000000CCCCCCCCCC000888888888888888888888880AAAA
        AA08888888000AAAA000888888000AAAA00088888888888888888880BBBBBBBB
        B08888000BBBBBBB000888000BBBBBBB00088888888888888888809999999999
        0888000999999990008800099999999000888888888888888888}
      Caption = ''
      ParentColor = False
      Color = clWindow
    end
    object SbDept: TUniSpeedButton
      Left = 53
      Top = 1
      Width = 26
      Height = 25
      Hint = 'Select by Department'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
        07070707070707070707070707070000000000000000000707070707070700FE
        FEFE00FEFE00FB00070707070700FE00FE00FEFEFE00FB000707070700FEFEFE
        000000FE00FBFBFB00070700FEFEFE00FEFEFE000000FB000007070000000000
        000000FBFBFB00FBFB000700F9F9F900F9F900FBFB0000FBFB00070700F9F900
        F9F9F90000FBFB000007070700F9F9F900F9000000FBFBFB0007070707000000
        0000F9F900FBFB00000707070700F9F9F9F900F9F900FB0007070707070700F9
        F9F900F9F9F90007070707070707000000000000F9F900070707070707070707
        0707070700000707070707070707070707070707070707070707}
      Caption = ''
      ParentColor = False
      Color = clWindow
    end
    object sbAll: TUniSpeedButton
      Left = 105
      Top = 1
      Width = 26
      Height = 25
      Hint = 'Select All'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888898898899988999889999889888898888999988988889888898898898888
        9888889988898888988807F8807F8FF0FF8F07F8880FFF000FFF80FF80007880
        8870880788080078700888800787808B8088888808B807BBB70888808BBB07BB
        B70888808BBB808B8088888808B8080008888888800088888888}
      Caption = ''
      ParentColor = False
      Color = clWindow
    end
    object sbPT: TUniSpeedButton
      Left = 79
      Top = 1
      Width = 26
      Height = 25
      Hint = 'Select by PayType'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008BBBBBBBBBBB
        BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB1BBBBBBBBBBBBBBBB1
        BBBBBBBBBBBBBBB1BBBBEEEEEEEEEEEE1EEEEEEEEEEEEEEE1EEEEEECCCCEE2E1
        E2EEEECCCCCCEE212EEEECCC4FCCEE2E22EEEFFF4FFFEEEEEEEEEEFF4FFEEEEE
        EEEEEEEF4FEEEEEEEEEEEEEE499EEEEEEEEEEEEEEEEEEEEEEEEE}
      Caption = ''
      ParentColor = False
      Color = clWindow
    end
    object sbPayGrp: TUniSpeedButton
      Left = 131
      Top = 1
      Width = 26
      Height = 25
      Hint = 'Select by PayGroup'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008087007F7000
        007F07F7007F7000007F07F7007F7000007F07F7807F7FF0FF7F07F7807F7FF0
        FF7F07F7807F8FF0FF8F07F8807F8FF0FF8F07F8880FFF000FFF80FF80007880
        8870880788080078700888800787808B8088888808B807BBB70888808BBB07BB
        B70888808BBB808B8088888808B8080008888888800088888888}
      Caption = ''
      ParentColor = False
      Color = clWindow
    end
  end
  object dtFrom: TUniDateTimePicker
    Left = 96
    Top = 36
    Width = 85
    Height = 21
    Hint = ''
    DateTime = 42620.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 1
  end
  object wwDBLookupCombo1: TUniDBLookupComboBox
    Left = 95
    Top = 62
    Width = 121
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    TabOrder = 2
    Color = clWindow
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 168
    Width = 294
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 148
    Width = 294
    Height = 20
    Hint = ''
    Visible = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
    Caption = 'Panel2'
    object ProgressBar1: TUniProgressBar
      Left = 1
      Top = 1
      Width = 292
      Height = 18
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object DBEdit10: TUniDBNumberEdit
    Left = 94
    Top = 88
    Width = 50
    Height = 21
    Hint = ''
    DataField = 'DAILY_ONE_AFTER'
    TabOrder = 5
    DecimalSeparator = '.'
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 115
    Width = 294
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 6
    Caption = ''
    DesignSize = (
      294
      33)
    object BtnCancel: TUniButton
      Left = 143
      Top = 4
      Width = 75
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      Anchors = [akRight, akBottom]
      TabOrder = 1
    end
    object BtnOk: TUniButton
      Left = 223
      Top = 4
      Width = 75
      Height = 25
      Hint = ''
      Caption = '&Ok'
      Anchors = [akRight, akBottom]
      TabOrder = 2
    end
  end
end
