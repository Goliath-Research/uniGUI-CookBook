object FrmNewRelease: TFrmNewRelease
  Left = 306
  Top = 183
  ClientHeight = 269
  ClientWidth = 291
  Caption = 'Add New Release'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 9
    Top = 10
    Width = 274
    Height = 13
    Hint = ''
    Caption = 'The new release will be created under the following folder:'
    TabOrder = 2
  end
  object lblPath: TUniLabel
    Left = 9
    Top = 31
    Width = 32
    Height = 13
    Hint = ''
    Caption = 'lblPath'
    TabOrder = 3
  end
  object Label3: TUniLabel
    Left = 9
    Top = 52
    Width = 201
    Height = 13
    Hint = ''
    Caption = 'Please enter a name for the '#39'New'#39' Release'
    TabOrder = 4
  end
  object Label2: TUniLabel
    Left = 9
    Top = 100
    Width = 184
    Height = 13
    Hint = ''
    Caption = 'Please enter name(s) for '#39'Old'#39' Releases'
    TabOrder = 5
  end
  object edName: TUniEdit
    Left = 9
    Top = 67
    Width = 274
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object btnOK: TUniButton
    Left = 126
    Top = 239
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&OK'
    TabOrder = 6
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 209
    Top = 239
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 7
  end
  object StringGrid1: TUniStringGrid
    Left = 9
    Top = 115
    Width = 274
    Height = 118
    Hint = ''
    FixedCols = 0
    FixedRows = 0
    RowCount = 20
    ColCount = 1
    DefaultColWidth = 254
    DefaultRowHeight = 18
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    Columns = <>
    TabOrder = 1
  end
end
