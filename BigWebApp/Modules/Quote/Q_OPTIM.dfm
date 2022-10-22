object FrmOptimize: TFrmOptimize
  Left = 200
  Top = 108
  HelpContext = 1086264
  ClientHeight = 376
  ClientWidth = 815
  Caption = 'Optimization'
  OnResize = FormResize
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OptimGrid: TUniStringGrid
    Left = 0
    Top = 31
    Width = 815
    Height = 304
    Hint = ''
    FixedRows = 0
    RowCount = 8
    ColCount = 2
    DefaultColWidth = 98
    DefaultRowHeight = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing]
    Columns = <>
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitWidth = 211
    ExplicitHeight = 155
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 815
    Height = 31
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 211
    object lblOptimizeBy: TUniLabel
      Left = 5
      Top = 8
      Width = 56
      Height = 13
      Hint = ''
      Caption = 'Optimize By'
      TabOrder = 1
    end
    object ComboBox1: TUniComboBox
      Left = 93
      Top = 4
      Width = 94
      Height = 21
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Price'
        'Percent'
        'Margin'
        'Yield/Hour')
      TabOrder = 2
      OnChange = ComboBox1Change
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 335
    Width = 815
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitTop = 186
    ExplicitWidth = 211
    object Panel3: TUniPanel
      Tag = 1999
      Left = 596
      Top = 1
      Width = 218
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = -8
      object btnOK: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 112
        Top = 8
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
end
