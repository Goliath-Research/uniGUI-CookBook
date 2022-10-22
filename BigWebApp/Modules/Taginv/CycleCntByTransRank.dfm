object FrmAssignInvCycleCodeByTransRank: TFrmAssignInvCycleCodeByTransRank
  Left = 0
  Top = 0
  ClientHeight = 520
  ClientWidth = 552
  Caption = 'Calculate Transactions Rank'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 105
    Width = 552
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = 16250871
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 552
    Height = 105
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Splitter3: TUniSplitter
      Left = 90
      Top = 29
      Width = 6
      Height = 75
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = 16250871
    end
    object Panel7: TUniPanel
      Left = 1
      Top = 29
      Width = 89
      Height = 75
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 16
        Top = 6
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'From Date'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 16
        Top = 30
        Width = 38
        Height = 13
        Hint = ''
        Caption = 'To Date'
        TabOrder = 2
      end
    end
    object Panel10: TUniPanel
      Left = 1
      Top = 1
      Width = 550
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Style = [fsBold]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = ' Date Range'
    end
    object Panel11: TUniPanel
      Left = 96
      Top = 29
      Width = 455
      Height = 75
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object dateFrom: TUniDBDateTimePicker
        Left = 0
        Top = 3
        Width = 188
        Height = 21
        Hint = ''
        DateTime = 42690.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 0
      end
      object dateTo: TUniDBDateTimePicker
        Left = 0
        Top = 27
        Width = 188
        Height = 21
        Hint = ''
        DateTime = 42690.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 137
    Width = 552
    Height = 335
    Hint = ''
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 266
      Top = 1
      Width = 4
      Height = 333
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 15
      Height = 333
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 5
      Caption = ''
    end
    object pnlLeftListBox: TUniPanel
      Left = 16
      Top = 1
      Width = 250
      Height = 333
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel5: TUniPanel
        Left = 1
        Top = 1
        Width = 248
        Height = 24
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = 'Available'
      end
      object lboxAvailable: TUniListBox
        Left = 1
        Top = 25
        Width = 248
        Height = 307
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Sorted = True
        MultiSelect = True
      end
    end
    object Panel6: TUniPanel
      Left = 270
      Top = 1
      Width = 29
      Height = 333
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      object sbtnLeftAll: TUniSpeedButton
        Left = 0
        Top = 96
        Width = 25
        Height = 25
        Hint = 'Add all to Selected'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          46010000424D460100000000000076000000280000001C0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDD0000DDDDD0DD0DDDDDDDDD7FD7FDDDDD0000DDDDD00D00DD
          DDDDDD77F77FDDDD0000DDDDD060060DDDDDDD787787FDDD0000D00000660660
          DD77777F87F87FDD0000D066666660660D78FFF8F87F87FD0000D06666666606
          607888888F87F87D0000D066666660660D788888887887DD0000D00000660660
          DD77777887887DDD0000DDDDD060060DDDDDDD787787DDDD0000DDDDD00D00DD
          DDDDDD77D77DDDDD0000DDDDD0DD0DDDDDDDDD7DD7DDDDDD0000DDDDDDDDDDDD
          DDDDDDDDDDDDDDDD0000}
        Caption = ''
        ParentFont = False
        Font.Color = clBlack
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWindow
        OnClick = sbtnLeftAllClick
      end
      object sbtnRightAll: TUniSpeedButton
        Left = 0
        Top = 121
        Width = 25
        Height = 25
        Hint = 'Remove all from Selected'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          56010000424D560100000000000076000000280000001C0000000E0000000100
          040000000000E000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDD0000DDDDD0DD0DDD
          DDDDDDD7FD7FDDDD0000DDDD00D00DDDDDDDDD77F77FDDDD0000DDD060060DDD
          DDDDD787787FFFFF0000DD06606600000DDD78878877777F0000D06606666666
          0DD788788888887F00000660666666660D78F78F8888887F0000D06606666666
          0DD78F78F88FFF7F0000DD06606600000DDD78F78F77777D0000DDD060060DDD
          DDDDD787787FDDDD0000DDDD00D00DDDDDDDDD77F77FDDDD0000DDDDD0DD0DDD
          DDDDDDD7DD7DDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDD0000}
        Caption = ''
        ParentFont = False
        Font.Color = clBlack
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWindow
        OnClick = sbtnRightAllClick
      end
      object sbtLeft: TUniSpeedButton
        Left = 0
        Top = 58
        Width = 25
        Height = 25
        Hint = 'Remove from Selected'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          46010000424D460100000000000076000000280000001A0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888800000088888808888888888887F88888000000888880088888
          88888877F8888800000088880608888888888787FFFFF8000000888066000008
          888878877777F8000000880666666608888788888887F8000000806666666608
          8878F8888887F800000088066666660888878F88FFF7F8000000888066000008
          888878F777778800000088880608888888888787F88888000000888880088888
          88888877F8888800000088888808888888888887888888000000888888888888
          88888888888888000000}
        Caption = ''
        ParentFont = False
        Font.Color = clBlack
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWindow
        OnClick = sbtLeftClick
      end
      object sbtnRight: TUniSpeedButton
        Left = 0
        Top = 33
        Width = 25
        Height = 25
        Hint = 'Add to Selected'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          46010000424D460100000000000076000000280000001A0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888F8888800000088888808888888888887FF8888000000888888008888
          8888888778F8880000008888880608888888FFF7F78F88000000880000066088
          888777778878F80000008806666666088887F88888878F000000880666666660
          8887F8888888780000008806666666088887FFFFF88788000000880000066088
          88877777F8788800000088888806088888888887F78888000000888888008888
          8888888778888800000088888808888888888887888888000000888888888888
          88888888888888000000}
        Caption = ''
        ParentFont = False
        Font.Color = clBlack
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWindow
        OnClick = sbtnRightClick
      end
    end
    object pnlRightListBox: TUniPanel
      Left = 299
      Top = 1
      Width = 252
      Height = 333
      Hint = ''
      Margins.Left = 0
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object Panel9: TUniPanel
        Left = 1
        Top = 1
        Width = 250
        Height = 24
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = 'Selected'
      end
      object lboxSelected: TUniListBox
        AlignWithMargins = True
        Left = 1
        Top = 25
        Width = 246
        Height = 307
        Hint = ''
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 0
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Sorted = True
        MultiSelect = True
      end
    end
  end
  object Panel3: TUniPanel
    AlignWithMargins = True
    Left = 0
    Top = 478
    Width = 552
    Height = 42
    Hint = ''
    Margins.Left = 0
    Margins.Top = 6
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel4: TUniPanel
      Left = 324
      Top = 1
      Width = 227
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 6
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 118
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel8: TUniPanel
    Left = 0
    Top = 109
    Width = 552
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    ParentFont = False
    Font.Style = [fsBold]
    TabOrder = 3
    Alignment = taLeftJustify
    Caption = ''
    object Label3: TUniLabel
      Left = 27
      Top = 6
      Width = 104
      Height = 13
      Hint = ''
      Caption = 'Transaction Types'
      TabOrder = 2
    end
    object Panel12: TUniPanel
      Left = 1
      Top = 1
      Width = 25
      Height = 26
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object sbtnDefaultTransType: TUniSpeedButton
        Left = 0
        Top = 1
        Width = 23
        Height = 22
        Hint = 'Assign Default Trans Type'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDD70000
          0000DDDDDDD788888880DDDDDDD7BFBBBB80DDDDDDD7F8888B80DDDDDDD7BFBF
          BB80DDDDDDD7F8888B80DDDDDDD7FFBFBF80DDDDDDD7FFFBFB80DD0000D77777
          7777DD0FF0DDDDDDDDDD000FF000DDDDDDDD0FFFFFF0DDDDDDDD0FFFFFF0DDDD
          DDDD000FF000DDDDDDDDDD0FF0DDDDDDDDDDDD0000DDDDDDDDDD}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnDefaultTransTypeClick
      end
    end
  end
end
