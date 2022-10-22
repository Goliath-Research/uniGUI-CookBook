inherited FrmInvClassFilterEx: TFrmInvClassFilterEx
  ClientHeight = 238
  ClientWidth = 570
  Caption = 'Material Exception Filter'
  ExplicitWidth = 576
  ExplicitHeight = 267
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMainInvParams: TUniPanel
    Width = 337
    Height = 184
    TabOrder = 3
    ExplicitWidth = 337
    ExplicitHeight = 184
    inherited Label1: TUniLabel
      TabOrder = 8
    end
    inherited rbtnAllItems: TUniRadioButton
      Width = 320
      ExplicitWidth = 320
    end
    inherited rbtnManu: TUniRadioButton
      Width = 320
      ExplicitWidth = 320
    end
    inherited rbtnPurch: TUniRadioButton
      Width = 320
      ExplicitWidth = 320
    end
    object pnlMainInvParamBottom: TUniPanel
      Left = 1
      Top = 143
      Width = 335
      Height = 41
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 5
      Caption = ''
      object DBCheckBox1: TUniDBCheckBox
        Left = 15
        Top = 8
        Width = 193
        Height = 17
        Hint = ''
        DataField = 'CAPACITY_CONSOLIDATE_DIV_REQ'
        DataSource = SrcParams
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Consolidate Division Requirements'
        TabOrder = 0
      end
    end
    object Panel1: TUniPanel
      Left = 160
      Top = 1
      Width = 177
      Height = 143
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 6
      Caption = ''
      object Label4: TUniLabel
        Left = 7
        Top = 16
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Mfg Type'
        TabOrder = 2
      end
      object wwDBLookupComboMfgtype: TUniDBLookupComboBox
        Left = 7
        Top = 36
        Width = 160
        Height = 21
        Hint = ''
        ListField = 'MFGTYPE'
        ListSource = MfgtypeSrc
        KeyField = 'MFGTYPE'
        ListFieldIndex = 0
        TabOrder = 0
        Color = clWindow
      end
    end
  end
  inherited PnlButtons: TUniPanel
    Top = 192
    Width = 570
    TabOrder = 2
    ExplicitTop = 192
    ExplicitWidth = 570
    inherited btnOK: TUniButton
      Left = 363
      ExplicitLeft = 363
    end
    inherited btnCancel: TUniButton
      Left = 466
      ExplicitLeft = 466
    end
  end
  inherited GroupBox1: TUniGroupBox
    Left = 347
    Top = 8
    Width = 216
    Height = 75
    ExplicitLeft = 347
    ExplicitTop = 8
    ExplicitWidth = 216
    ExplicitHeight = 75
    inherited PnlClient02: TUniPanel
      Width = 212
      Height = 58
      ExplicitWidth = 212
      ExplicitHeight = 58
      inherited Splitter1: TUniSplitter
        Height = 58
        ExplicitHeight = 58
      end
      inherited PnlLeft01: TUniPanel
        Height = 56
        ExplicitHeight = 56
      end
      inherited PnlClient01: TUniPanel
        Width = 125
        Height = 56
        ExplicitWidth = 128
        ExplicitHeight = 58
        inherited wwLookupDivision: TUniDBLookupComboBox
          Width = 124
          ExplicitWidth = 124
        end
        inherited wwLookupBuyerCode: TUniDBLookupComboBox
          Width = 124
          ExplicitWidth = 124
        end
      end
    end
  end
  object GroupBox2: TUniGroupBox [3]
    Left = 347
    Top = 89
    Width = 217
    Height = 103
    Hint = ''
    Caption = ' Must Order By '
    TabOrder = 1
    object Label3: TUniLabel
      Left = 97
      Top = 72
      Width = 23
      Height = 13
      Hint = ''
      Caption = 'days'
      TabOrder = 3
    end
    object rbtnIncludeAll: TUniRadioButton
      Left = 10
      Top = 20
      Width = 113
      Height = 17
      Hint = ''
      Caption = 'Include all'
      TabOrder = 0
      OnClick = EnableMustOrderByControls
    end
    object rbtnScope: TUniRadioButton
      Left = 10
      Top = 46
      Width = 106
      Height = 17
      Hint = ''
      Caption = 'Exception Scope'
      TabOrder = 1
      OnClick = EnableMustOrderByControls
    end
    object edExcepScope: TUniEdit
      Left = 49
      Top = 67
      Width = 44
      Height = 21
      Hint = ''
      Text = '0'
      TabOrder = 2
    end
  end
  inherited wwQuery1: TFDQuery
    Left = 6
    Top = 195
  end
  inherited wwQryDivision: TFDQuery
    Left = 36
    Top = 195
  end
  inherited wwQryBuyerCode: TFDQuery
    Left = 70
    Top = 195
  end
  object TblParams: TFDTable [10]
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 112
    Top = 202
    object TblParamsCAPACITY_CONSOLIDATE_DIV_REQ: TStringField
      FieldName = 'CAPACITY_CONSOLIDATE_DIV_REQ'
      Size = 1
    end
  end
  object SrcParams: TDataSource [11]
    DataSet = TblParams
    Left = 112
    Top = 184
  end
  object SQLQuery1: TSQLQuery [12]
    Params = <>
    Left = 280
    Top = 200
  end
  object QryMfgtype: TFDQuery [13]
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select mfgtype from mfgtype'
      'order by mfgtype')
    Left = 172
    Top = 196
    object QryMfgtypeMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Origin = 'MFGTYPE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 10
    end
  end
  object MfgtypeSrc: TDataSource [14]
    DataSet = QryMfgtype
    Left = 272
    Top = 120
  end
end
