object FrmPRW2Custom: TFrmPRW2Custom
  Left = 54
  Top = 177
  ClientHeight = 461
  ClientWidth = 438
  Caption = 'FrmPRW2Custom'
  OnResize = FormResize
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 438
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbExport: TUniSpeedButton
      Left = 77
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Export'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = Export1Click
    end
    object sbSave: TUniSpeedButton
      Left = 52
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Save SQL to file'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SaveSql1Click
    end
    object SbLoad: TUniSpeedButton
      Left = 27
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Load SQL from file'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = LoadSql1Click
    end
    object SbClear: TUniSpeedButton
      Left = 2
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Clear SQL'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = Clear1Click
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 402
    Width = 438
    Height = 59
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      438
      59)
    object Label1: TUniLabel
      Left = 4
      Top = 8
      Width = 58
      Height = 13
      Hint = ''
      Caption = 'Output file: '
      TabOrder = 2
    end
    object sbout: TUniSpeedButton
      Left = 417
      Top = 4
      Width = 24
      Height = 20
      Hint = 'Assign output file'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      Caption = ''
      Anchors = []
      ParentColor = False
      Color = clWindow
      OnClick = sboutClick
    end
    object edOut: TUniEdit
      Left = 58
      Top = 5
      Width = 355
      Height = 19
      Hint = ''
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Color = clBtnFace
      ReadOnly = True
    end
    object btnOK: TUniButton
      Left = 290
      Top = 30
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Export'
      ModalResult = 1
      Anchors = [akRight, akBottom]
      TabOrder = 4
      OnClick = Export1Click
    end
    object btnCancel: TUniButton
      Left = 368
      Top = 30
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      ModalResult = 2
      Anchors = [akRight, akBottom]
      TabOrder = 5
      OnClick = Exit1Click
    end
  end
  object RE: TRichEdit
    Left = 0
    Top = 27
    Width = 438
    Height = 375
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    WordWrap = False
    Zoom = 100
  end
  object MainMenu1: TUniMainMenu
    Left = 232
    Top = 40
    object File1: TUniMenuItem
      Caption = '&File'
      object Clear1: TUniMenuItem
        Caption = '&Clear'
        OnClick = Clear1Click
      end
      object LoadSql1: TUniMenuItem
        Caption = '&Load SQL'
        OnClick = LoadSql1Click
      end
      object SaveSql1: TUniMenuItem
        Caption = '&Save SQL'
        OnClick = SaveSql1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Export1: TUniMenuItem
        Caption = '&Export'
        OnClick = Export1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About...'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Export PRW2'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192283 $'
    BuildVersion = '176554'
    Left = 136
    Top = 40
  end
  object SaveDialogLogFile: TSaveDialog
    DefaultExt = '*.SQL'
    FileName = 'CD_Output.sql'
    Filter = 'SQL|*.sql|any file|*.*'
    Title = 'Save Sql Script'
    Left = 172
    Top = 41
  end
  object OpenDialogScript: TOpenDialog
    DefaultExt = 'sql'
    FileName = 'W2_Output.sql'
    Filter = 'SQL|*.sql|any file|*.*'
    Title = 'Load Sql Script'
    Left = 204
    Top = 41
  end
  object Qry: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 280
    Top = 40
  end
  object SD: TSaveDialog
    Filter = 'Dat|*.txt|any file|*.*'
    Left = 280
    Top = 72
  end
  object Table1: TFDTable
    Left = 240
    Top = 72
  end
  object BatchMove1: TFDDataMove
    TextDataDef.Fields = <>
    TextFileName = 'Data.txt'
    Mappings = <>
    LogFileName = 'Data.log'
    Source = Qry
    Left = 200
    Top = 73
  end
  object SaveDialog1: TSaveDialog
    Title = 'Export to'
    Left = 168
    Top = 72
  end
  object Database1: TFDConnection
    Params.Strings = (
      'user name=IQMS'
      '')
    LoginPrompt = False
    Left = 136
    Top = 72
  end
end
