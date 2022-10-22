object SortColumns: TSortColumns
  Left = 343
  Top = 188
  ClientHeight = 235
  ClientWidth = 351
  Caption = 'Select Criteria'
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 182
    Top = 0
    Width = 6
    Height = 201
    Hint = ''
    Align = alRight
    ParentColor = False
    Color = clBtnFace
    ExplicitLeft = 187
    ExplicitHeight = 200
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 201
    Width = 351
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 200
    ExplicitWidth = 353
    object Panel2: TUniPanel
      Left = 43
      Top = 1
      Width = 310
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 2
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnClear: TUniButton
        Left = 105
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Clear'
        TabOrder = 2
        OnClick = BtnClearClick
      end
      object BtnCancel: TUniButton
        Left = 208
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 3
        OnClick = BtnCancelClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 188
    Top = 0
    Width = 163
    Height = 201
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitLeft = 190
    ExplicitHeight = 200
    object LBSortFields: TUniListBox
      Left = 1
      Top = 18
      Width = 161
      Height = 182
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnMouseDown = LBSortFieldsMouseDown
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 161
      Height = 18
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = 'Selected'
    end
  end
  object Panel5: TUniPanel
    Left = 0
    Top = 0
    Width = 182
    Height = 201
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = 'Panel5'
    ExplicitWidth = 187
    ExplicitHeight = 200
    object Panel7: TUniPanel
      Left = 155
      Top = 1
      Width = 32
      Height = 198
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object SBRight: TUniSpeedButton
        Left = 5
        Top = 69
        Width = 25
        Height = 25
        Hint = 'Add'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          46010000424D460100000000000076000000280000001A0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDFDDDDD000000DDDDDD0DDDDDDDDDDDD7FFDDDD000000DDDDDD00DDDD
          DDDDDDD778FDDD000000DDDDDD060DDDDDDDFFF7F78FDD000000DD00000660DD
          DDD77777DD78FD000000DD066666660DDDD7FDDDDDD78F000000DD0666666660
          DDD7FDDDDDDD7D000000DD066666660DDDD7FFFFFDD7DD000000DD00000660DD
          DDD77777FD7DDD000000DDDDDD060DDDDDDDDDD7F7DDDD000000DDDDDD00DDDD
          DDDDDDD77DDDDD000000DDDDDD0DDDDDDDDDDDD7DDDDDD000000DDDDDDDDDDDD
          DDDDDDDDDDDDDD000000}
        Caption = ''
        ParentFont = False
        Font.Color = clBlack
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWindow
        OnClick = SBRightClick
      end
      object SBLeft: TUniSpeedButton
        Left = 5
        Top = 96
        Width = 25
        Height = 25
        Hint = 'Remove'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          46010000424D460100000000000076000000280000001A0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDD000000DDDDDD0DDDDDDDDDDDD7FDDDDD000000DDDDD00DDDDD
          DDDDDD77FDDDDD000000DDDD060DDDDDDDDDD7D7FFFFFD000000DDD06600000D
          DDDD7DD77777FD000000DD066666660DDDD7DDDDDDD7FD000000D0666666660D
          DD78FDDDDDD7FD000000DD066666660DDDD78FDDFFF7FD000000DDD06600000D
          DDDD78F77777DD000000DDDD060DDDDDDDDDD787FDDDDD000000DDDDD00DDDDD
          DDDDDD77FDDDDD000000DDDDDD0DDDDDDDDDDDD7DDDDDD000000DDDDDDDDDDDD
          DDDDDDDDDDDDDD000000}
        Caption = ''
        ParentFont = False
        Font.Color = clBlack
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWindow
        OnClick = Remove1Click
      end
    end
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 155
      Height = 198
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object LBFields: TUniListBox
        Left = 1
        Top = 18
        Width = 153
        Height = 182
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        OnMouseDown = LBFieldsMouseDown
      end
      object Panel8: TUniPanel
        Left = 1
        Top = 1
        Width = 153
        Height = 18
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = 'Available'
      end
    end
  end
  object PMFields: TUniPopupMenu
    Left = 80
    Top = 48
    object Add1: TUniMenuItem
      Caption = '&Add'
      OnClick = SBRightClick
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
