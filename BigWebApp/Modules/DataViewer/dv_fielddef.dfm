object FrmDvFieldDef: TFrmDvFieldDef
  Left = 0
  Top = 0
  ClientHeight = 310
  ClientWidth = 608
  Caption = 'Field Definition'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TUniStringGrid
    Left = 0
    Top = 0
    Width = 608
    Height = 310
    Hint = ''
    FixedCols = 0
    FixedRows = 0
    RowCount = 2
    ColCount = 6
    DefaultColWidth = 100
    DefaultRowHeight = 17
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goTabs, goThumbTracking]
    Columns = <
      item
        Title.Caption = 'Field Name'
        Width = 100
      end
      item
        Title.Caption = 'Data Type'
        Width = 100
      end
      item
        Title.Caption = 'Data Length'
        Width = 90
      end
      item
        Title.Caption = 'Data Precision'
        Width = 90
      end
      item
        Title.Caption = 'Scale'
        Width = 90
      end
      item
        Title.Caption = 'Text Length'
        Width = 90
      end>
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
end
