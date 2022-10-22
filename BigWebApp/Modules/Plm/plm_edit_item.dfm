object FrmEditPlmItem: TFrmEditPlmItem
  Left = 344
  Top = 191
  ClientHeight = 265
  ClientWidth = 500
  Caption = 'New Item'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  DesignSize = (
    500
    265)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 200
    Width = 500
    Height = 9
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 500
    Height = 215
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 120
      Top = 1
      Width = 4
      Height = 213
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 119
      Height = 213
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 10
        Top = 15
        Width = 33
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Item #'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 10
        Top = 40
        Width = 53
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Description'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 10
        Top = 66
        Width = 40
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Revision'
        TabOrder = 3
      end
      object Label4: TUniLabel
        Left = 10
        Top = 142
        Width = 48
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'MFG Type'
        TabOrder = 4
      end
      object Label6: TUniLabel
        Left = 10
        Top = 117
        Width = 20
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Kind'
        TabOrder = 5
      end
      object Label5: TUniLabel
        Left = 10
        Top = 91
        Width = 25
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Class'
        TabOrder = 6
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 124
      Top = 1
      Width = 375
      Height = 213
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        375
        213)
      object edItemNo: TUniEdit
        Left = 0
        Top = 10
        Width = 357
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edDescrip: TUniEdit
        Left = 0
        Top = 35
        Width = 357
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edRev: TUniEdit
        Left = 0
        Top = 61
        Width = 212
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 2
      end
      object wwDBLookupComboMfgType: TUniDBLookupComboBox
        Left = 0
        Top = 138
        Width = 212
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ListOnlyMode = lmFollowSource
        ListField = 'MFGTYPE'
        ListSource = SrcMfgTypeLookup
        KeyField = 'MFGTYPE'
        ListFieldIndex = 0
        TabOrder = 5
        Color = clWindow
      end
      object wwDBComboBoxKind: TUniDBComboBox
        Left = 0
        Top = 112
        Width = 212
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Style = csDropDownList
        Items.Strings = (
          'RFQ'#9'0'
          'Sourced'#9'1')
        TabOrder = 4
        OnChange = wwDBComboBoxKindChange
      end
      object wwDBLookupComboClass: TUniDBLookupComboBox
        Left = 0
        Top = 86
        Width = 79
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ListOnlyMode = lmFollowSource
        ListField = 'CLASS'
        ListSource = SrcClassLookup
        KeyField = 'CLASS'
        ListFieldIndex = 0
        TabOrder = 3
        Color = clWindow
      end
      object CheckBoxPrimMat: TUniCheckBox
        Left = 0
        Top = 163
        Width = 156
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Primary Material'
        TabOrder = 6
      end
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 215
    Width = 500
    Height = 50
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 241
      Top = 1
      Width = 258
      Height = 48
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 0
        Top = 10
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 128
        Top = 10
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object QryMfgTypeLookup: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select mfgtype,'
      '       descrip'
      '  from mfgtype'
      ' order by mfgtype'
      '')
    Left = 13
    Top = 189
    object QryMfgTypeLookupMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Origin = 'IQ.MFGTYPE.MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object QryMfgTypeLookupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'IQ.MFGTYPE.DESCRIP'
      FixedChar = True
    end
  end
  object QryClassLookup: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(class) as class,'
      '       descrip,'
      '       primary_material'
      '  from arinvt_class'
      ' where NVL( RTrim(type), '#39'*'#39') <> '#39'ROUTING'#39
      ' order by class'
      ' '
      ' ')
    Left = 46
    Top = 189
    object QryClassLookupCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Size = 2
    end
    object QryClassLookupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 50
    end
    object QryClassLookupPRIMARY_MATERIAL: TStringField
      DisplayLabel = 'Primary Material'
      DisplayWidth = 1
      FieldName = 'PRIMARY_MATERIAL'
      FixedChar = True
      Size = 1
    end
  end
  object SrcClassLookup: TDataSource
    DataSet = QryClassLookup
    Left = 112
    Top = 192
  end
  object SrcMfgTypeLookup: TDataSource
    DataSet = QryMfgTypeLookup
    Left = 176
    Top = 184
  end
end
