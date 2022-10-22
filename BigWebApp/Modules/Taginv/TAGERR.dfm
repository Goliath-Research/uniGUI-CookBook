object FrmTagErrorHandler: TFrmTagErrorHandler
  Left = 420
  Top = 202
  ClientHeight = 265
  ClientWidth = 395
  Caption = ''
  OnResize = FormResize
  Position = poDefaultPosOnly
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 0
    Width = 395
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 227
    Width = 395
    Height = 38
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 187
      Top = 1
      Width = 208
      Height = 36
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnAbort: TUniButton
        Left = 1
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Abort'
        ModalResult = 3
        TabOrder = 1
        Default = True
      end
      object btnIgnore: TUniButton
        Left = 105
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Ignore'
        ModalResult = 5
        TabOrder = 2
      end
    end
  end
  object UniMemo1: TUniMemo
    Left = 0
    Top = 3
    Width = 395
    Height = 63
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 2
  end
  object UniStringGrid1: TUniStringGrid
    Left = 0
    Top = 66
    Width = 395
    Height = 161
    Hint = ''
    RowCount = 1
    ColCount = 2
    Options = [goVertLine, goHorzLine]
    Columns = <
      item
        Title.Caption = 'Field'
      end
      item
        Title.Caption = 'Value'
      end>
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
  end
end
