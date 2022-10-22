object FrmDbTransField: TFrmDbTransField
  Left = 295
  Top = 203
  ClientHeight = 194
  ClientWidth = 343
  Caption = 'Field'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 153
    Width = 343
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 119
      Top = 1
      Width = 223
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 343
    Height = 38
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object lblFieldName: TUniLabel
      Left = 8
      Top = 12
      Width = 52
      Height = 13
      Hint = ''
      Caption = 'Field Name'
      TabOrder = 2
    end
    object edtFieldName: TUniEdit
      Left = 72
      Top = 8
      Width = 225
      Height = 21
      Hint = ''
      CharCase = ecUpperCase
      MaxLength = 30
      Text = ''
      TabOrder = 0
      Color = clBtnFace
      ReadOnly = True
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 38
    Width = 343
    Height = 115
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 82
      Top = 1
      Width = 6
      Height = 113
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 81
      Height = 113
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblDataType: TUniLabel
        Left = 8
        Top = 4
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Data Type'
        TabOrder = 1
      end
      object lblLength: TUniLabel
        Left = 8
        Top = 28
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Length'
        TabOrder = 2
      end
      object lblPrecision: TUniLabel
        Left = 8
        Top = 28
        Width = 42
        Height = 13
        Hint = ''
        Caption = 'Precision'
        TabOrder = 3
      end
      object lblScale: TUniLabel
        Left = 8
        Top = 48
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'Scale'
        TabOrder = 4
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 88
      Top = 1
      Width = 254
      Height = 113
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      Caption = ''
      ExplicitTop = 5
      object cmbDataType: TUniComboBox
        Left = 0
        Top = 0
        Width = 177
        Hint = ''
        Style = csOwnerDrawFixed
        Text = ''
        Items.Strings = (
          'CHAR'
          'CHAR VARYING(%N)'
          'CHAR(%N)'
          'CHARACTER'
          'CHARACTER VARYING(%N)'
          'CHARACTER(%N)'
          'DATE'
          'DEC'
          'DEC(%N)'
          'DEC(%P,%S)'
          'DECIMAL'
          'DECIMAL(%N)'
          'DECIMAL(%P,%S)'
          'DOUBLE PRECISION'
          'FLOAT'
          'FLOAT(%N)'
          'INT'
          'INTEGER'
          'LONG'
          'LONG RAW'
          'LONG VARCHAR'
          'NUMBER'
          'NUMBER(%N)'
          'NUMBER(%P,%S)'
          'RAW(%N)'
          'REAL'
          'SMALLINT'
          'VARCHAR(%N)'
          'VARCHAR2(%N)')
        TabOrder = 4
        CharCase = ecUpperCase
        OnChange = cmbDataTypeChange
      end
      object edtLength: TUniEdit
        Left = 0
        Top = 24
        Width = 65
        Height = 21
        Hint = ''
        Text = '0'
        TabOrder = 1
      end
      object edtPrecision: TUniEdit
        Left = 0
        Top = 24
        Width = 65
        Height = 21
        Hint = ''
        Text = '0'
        TabOrder = 2
      end
      object edtScale: TUniEdit
        Left = 0
        Top = 48
        Width = 65
        Height = 21
        Hint = ''
        Text = '0'
        TabOrder = 3
      end
    end
  end
  object udPrecision: TUpDown
    Left = 159
    Top = 60
    Width = 17
    Height = 21
    TabOrder = 3
    Thousands = False
  end
  object udScale: TUpDown
    Left = 159
    Top = 87
    Width = 17
    Height = 21
    TabOrder = 4
    Thousands = False
  end
end
