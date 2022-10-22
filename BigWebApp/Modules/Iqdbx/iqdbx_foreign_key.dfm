object FrmIQDBXFKFields: TFrmIQDBXFKFields
  Left = 130
  Top = 205
  ClientHeight = 205
  ClientWidth = 797
  Caption = 'Foreign Keys'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 123
    Top = 0
    Width = 6
    Height = 205
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object PnlLeft: TUniPanel
    Left = 0
    Top = 0
    Width = 123
    Height = 205
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object lstTables: TUniListBox
      Left = 1
      Top = 1
      Width = 121
      Height = 203
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnClick = lstTablesClick
    end
  end
  object Panel2: TUniPanel
    Left = 129
    Top = 0
    Width = 668
    Height = 205
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object lstFields: TUniStringGrid
      Left = 1
      Top = 1
      Width = 666
      Height = 203
      Hint = ''
      FixedCols = 0
      FixedRows = 0
      RowCount = 1
      ColCount = 4
      Options = [goVertLine, goHorzLine]
      ShowColumnTitles = True
      Columns = <
        item
          Title.Caption = 'Field Name'
          Width = 160
        end
        item
          Title.Caption = 'Constraint Name'
          Width = 160
        end
        item
          Title.Caption = 'Referenced Constraint'
          Width = 160
        end
        item
          Title.Caption = 'Referenced Table'
          Width = 160
        end>
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 150
    Top = 104
    object File1: TUniMenuItem
      Caption = '&File'
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      OnClick = Options1Click
      object StayOnTop1: TUniMenuItem
        Caption = '&Stay on Top'
        OnClick = StayOnTop1Click
      end
    end
  end
end
