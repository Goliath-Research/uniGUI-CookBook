inherited FrmMCQuoteStringGrid: TFrmMCQuoteStringGrid
  Caption = 'Quote Calculations'
  ExplicitWidth = 397
  ExplicitHeight = 379
  PixelsPerInch = 96
  TextHeight = 13
  object SG: TUniStringGrid [1]
    Left = 0
    Top = 27
    Width = 381
    Height = 293
    Hint = ''
    DefaultColWidth = 80
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    Columns = <>
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  inherited tblCurrency: TFDTable
    Active = True
  end
end
