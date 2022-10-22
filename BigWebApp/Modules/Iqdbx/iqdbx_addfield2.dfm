object FrmIQDBXAddField2: TFrmIQDBXAddField2
  Left = 388
  Top = 196
  ClientHeight = 189
  ClientWidth = 364
  Caption = 'Add Column'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 155
    Width = 364
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object sbtnSQL: TUniSpeedButton
      Left = 5
      Top = 3
      Width = 25
      Height = 25
      Hint = 'View SQL used for update'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00DDDDDDD00DDD000DD
        0000D0D00D00D00D00DDDDD00D00D00D00DDDD000D00D00D00DDD000DD00D00D
        00DDD00DDD00D00D00DDD00D0D00D00D00DDDD00DDD000DD00DDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSQLClick
    end
    object Panel1: TUniPanel
      Left = 150
      Top = 1
      Width = 214
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 5
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 0
        Default = True
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 109
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlClient01: TUniPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 155
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 121
      Top = 0
      Width = 6
      Height = 155
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 121
      Height = 153
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 52
        Height = 13
        Hint = ''
        Caption = 'Field Name'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 36
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'Type'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 8
        Top = 60
        Width = 62
        Height = 13
        Hint = ''
        Caption = 'Length/Scale'
        TabOrder = 3
      end
      object Label4: TUniLabel
        Left = 8
        Top = 84
        Width = 42
        Height = 13
        Hint = ''
        Caption = 'Precision'
        TabOrder = 4
      end
      object Label5: TUniLabel
        Left = 8
        Top = 108
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Comment'
        TabOrder = 5
      end
    end
    object PnlClient02: TUniPanel
      Left = 127
      Top = 1
      Width = 237
      Height = 153
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        237
        153)
      object edtFieldName: TUniEdit
        Left = 1
        Top = 8
        Width = 241
        Height = 21
        Hint = ''
        CharCase = ecUpperCase
        MaxLength = 30
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = DoEditCtrlChange
      end
      object edtComment: TUniEdit
        Left = 1
        Top = 104
        Width = 241
        Height = 21
        Hint = ''
        MaxLength = 150
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object cmbType: TUniComboBox
        Left = 1
        Top = 32
        Width = 201
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'CHAR'
          'CHAR VARYING(%n)'
          'CHAR(%n)'
          'CHARACTER'
          'CHARACTER VARYING(%n)'
          'CHARACTER(%n)'
          'DATE'
          'DEC'
          'DEC(%n)'
          'DEC(%s,%p)'
          'DECIMAL'
          'DECIMAL(%n)'
          'DECIMAL(%s,%p)'
          'DOUBLE PRECISION'
          'FLOAT'
          'FLOAT(%n)'
          'INT'
          'INTEGER'
          'LONG'
          'LONG RAW'
          'LONG VARCHAR'
          'NUMBER'
          'NUMBER(%n)'
          'NUMBER(%s,%p)'
          'RAW(%n)'
          'REAL'
          'SMALLINT'
          'VARCHAR(%n)'
          'VARCHAR2(%n)')
        TabOrder = 3
        OnChange = DoEditCtrlChange
      end
      object udLength: TUniSpinEdit
        Left = 1
        Top = 56
        Width = 137
        Height = 22
        Hint = ''
        TabOrder = 4
      end
      object udPrecision: TUniSpinEdit
        Left = 1
        Top = 80
        Width = 137
        Height = 22
        Hint = ''
        TabOrder = 5
      end
    end
  end
end
