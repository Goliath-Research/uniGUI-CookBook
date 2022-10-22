object FrmSchdDefineWOCaption: TFrmSchdDefineWOCaption
  Left = 240
  Top = 174
  ClientHeight = 234
  ClientWidth = 378
  Caption = 'Define GVS Work Order Caption'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 196
    Width = 378
    Height = 38
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 162
      Top = 1
      Width = 215
      Height = 36
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 111
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
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 378
    Height = 196
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 171
      Top = 1
      Width = 6
      Height = 194
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object pnlAvail: TUniPanel
      Left = 1
      Top = 1
      Width = 170
      Height = 194
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = 'pnlAvail'
      object lstboxAvail: TUniListBox
        Left = 1
        Top = 21
        Width = 168
        Height = 172
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        OnMouseDown = lstboxAvailMouseDown
      end
      object Panel4: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 168
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object Label3: TUniLabel
          Left = 1
          Top = 1
          Width = 107
          Height = 13
          Hint = ''
          Caption = ' Available Captions'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object pnlSelect: TUniPanel
      Left = 208
      Top = 1
      Width = 169
      Height = 194
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = 'Panel3'
      object lstboxSelect: TUniListBox
        Left = 1
        Top = 21
        Width = 167
        Height = 172
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        OnMouseDown = lstboxSelectMouseDown
      end
      object Panel3: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 167
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object Label4: TUniLabel
          Left = 1
          Top = 1
          Width = 98
          Height = 13
          Hint = ''
          Caption = ' Selected Caption'
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
      Left = 177
      Top = 1
      Width = 31
      Height = 194
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      Caption = ''
      object sbtnRight: TUniSpeedButton
        Left = 4
        Top = 69
        Width = 22
        Height = 22
        Hint = 'Add caption'
        ShowHint = True
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
        Font.Charset = ANSI_CHARSET
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWindow
        OnClick = sbtnRightClick
      end
      object sbtnLeft: TUniSpeedButton
        Left = 4
        Top = 94
        Width = 22
        Height = 22
        Hint = 'Remove caption'
        ShowHint = True
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
        Font.Charset = ANSI_CHARSET
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWindow
        OnClick = sbtnLeftClick
      end
    end
  end
end
