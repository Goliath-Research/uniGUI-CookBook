object FrmInfoBox: TFrmInfoBox
  Left = 243
  Top = 150
  ClientHeight = 141
  ClientWidth = 464
  Caption = 'Info Box'
  OnResize = FormResize
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TUniStringGrid
    Left = 0
    Top = 0
    Width = 464
    Height = 141
    Hint = ''
    FixedCols = 0
    RowCount = 2
    ColCount = 2
    DefaultColWidth = 220
    DefaultRowHeight = 17
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goThumbTracking]
    Columns = <>
    OnMouseDown = GridMouseDown
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object PMain: TUniPopupMenu
    OnPopup = PMainPopup
    Left = 120
    Top = 48
    object CopyListtoClipboard1: TUniMenuItem
      Caption = 'Copy List to Clipboard'
      OnClick = CopyListtoClipboard1Click
    end
    object CopyCelltoClipboard1: TUniMenuItem
      Caption = 'Copy Cell to Clipboard'
      OnClick = CopyCelltoClipboard1Click
    end
    object SaveListtoFile1: TUniMenuItem
      Caption = 'Save List to File'
      OnClick = SaveListtoFile1Click
    end
    object PrintList1: TUniMenuItem
      Caption = 'Print'
      OnClick = PrintList1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object StayOnTop1: TUniMenuItem
      Caption = 'Stay on Top'
      OnClick = StayOnTop1Click
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.txt'
    FileName = 'data.txt'
    Filter = 'Text File (*.txt)|*.txt|Any File (*.*)|*.*'
    Left = 164
    Top = 48
  end
  object PrintDialog1: TPrintDialog
    Left = 200
    Top = 48
  end
end
