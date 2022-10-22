object FrmSortFields: TFrmSortFields
  Left = 267
  Top = 203
  ClientHeight = 376
  ClientWidth = 449
  Caption = 'Select Sorting Criteria'
  OnResize = FormResize
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 230
    Top = 0
    Width = 6
    Height = 340
    Hint = ''
    Align = alRight
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 340
    Width = 449
    Height = 36
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 241
      Top = 1
      Width = 208
      Height = 34
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 1
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 104
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object pnlSelected: TUniPanel
    Left = 236
    Top = 0
    Width = 213
    Height = 340
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object lstbSortFields: TUniListBox
      Left = 1
      Top = 20
      Width = 211
      Height = 320
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnDblClick = lstbSortFieldsDblClick
      OnMouseDown = lstbSortFieldsMouseDown
    end
    object Panel7: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 211
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object lblSelected: TUniLabel
        Left = 1
        Top = 1
        Width = 49
        Height = 13
        Hint = ''
        Caption = 'Selected'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object Panel5: TUniPanel
    Left = 0
    Top = 0
    Width = 230
    Height = 340
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = 'Panel5'
    object pnlLeftRightBtns: TUniPanel
      Left = 203
      Top = 1
      Width = 27
      Height = 338
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        27
        338)
      object Panel2: TUniPanel
        Left = 1
        Top = 132
        Width = 25
        Height = 88
        Hint = ''
        Anchors = [akLeft]
        TabOrder = 0
        Caption = ''
        object SBRight: TUniSpeedButton
          Left = 2
          Top = 3
          Width = 23
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
          OnClick = Add1Click
        end
        object SBLeft: TUniSpeedButton
          Left = 2
          Top = 33
          Width = 23
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
          OnClick = Remove1Click
        end
        object SpeedButton1: TUniSpeedButton
          Left = 2
          Top = 58
          Width = 23
          Height = 25
          Hint = 'Clear Selected'
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
          OnClick = BtnClearClick
        end
      end
    end
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 203
      Height = 338
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object lstbFields: TUniListBox
        Left = 1
        Top = 20
        Width = 201
        Height = 318
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        OnDblClick = lstbFieldsDblClick
        OnMouseDown = lstbFieldsMouseDown
      end
      object PnlAvailable: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 201
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object lblAvailable: TUniLabel
          Left = 1
          Top = 1
          Width = 52
          Height = 13
          Hint = ''
          Caption = 'Available'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
  end
  object PMFields: TUniPopupMenu
    Left = 80
    Top = 48
    object Add1: TUniMenuItem
      Caption = '&Add to Selected'
      OnClick = Add1Click
    end
  end
  object PMSortFields: TUniPopupMenu
    Left = 252
    Top = 48
    object Remove1: TUniMenuItem
      Caption = '&Remove'
      OnClick = Remove1Click
    end
  end
end
