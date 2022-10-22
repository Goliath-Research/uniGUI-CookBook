object FrmInvProprietary: TFrmInvProprietary
  Left = 0
  Top = 0
  ClientHeight = 147
  ClientWidth = 420
  Caption = 'Proprietary'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 106
    Width = 420
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 187
      Top = 1
      Width = 232
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 12
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 122
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 106
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 122
      Top = 1
      Width = 4
      Height = 104
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 121
      Height = 104
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 84
        Height = 13
        Hint = ''
        Caption = 'Default Customer'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 36
        Width = 69
        Height = 13
        Hint = ''
        Caption = 'Effective Date'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 8
        Top = 60
        Width = 65
        Height = 13
        Hint = ''
        Caption = 'Inactive Date'
        TabOrder = 3
      end
    end
    object Panel5: TUniPanel
      Left = 126
      Top = 1
      Width = 293
      Height = 104
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        293
        104)
      object wwDBComboDlg1: TUniEdit
        Left = 0
        Top = 9
        Width = 279
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ReadOnly = True
        OnKeyDown = wwDBComboDlg1KeyDown
      end
      object wwDBDateTimePicker1: TUniDBDateTimePicker
        Left = 0
        Top = 33
        Width = 161
        Height = 21
        Hint = ''
        DataField = 'PROPRIETARY_EFFECT_DATE'
        DataSource = SrcArinvt
        DateTime = 42684.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
      end
      object wwDBDateTimePicker2: TUniDBDateTimePicker
        Left = 0
        Top = 57
        Width = 161
        Height = 21
        Hint = ''
        DataField = 'PROPRIETARY_DEACTIVE_DATE'
        DataSource = SrcArinvt
        DateTime = 42684.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 2
      end
    end
  end
  object PkArcusto: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select custno,'
      '          company,'
      '          city,'
      '          state,'
      '          country,'
      '          id,'
      '          pk_hide'
      'from v_arcusto'
      'order by custno'
      '         '
      '         '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 48
    Top = 75
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArcustoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object PkArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object PkArcustoID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARCUSTO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 8
    Top = 76
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    OnCalcFields = QryArinvtCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    SQL.Strings = (
      'select id,'
      '       arcusto_id,'
      '       proprietary_effect_date,'
      '       proprietary_deactive_date'
      '  from arinvt       '
      ' where id = :arinvt_id'
      '')
    Left = 8
    Top = 108
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryArinvtARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO_ID'
      Precision = 15
      Size = 0
    end
    object QryArinvtPROPRIETARY_EFFECT_DATE: TDateTimeField
      FieldName = 'PROPRIETARY_EFFECT_DATE'
      Origin = 'PROPRIETARY_EFFECT_DATE'
    end
    object QryArinvtPROPRIETARY_DEACTIVE_DATE: TDateTimeField
      FieldName = 'PROPRIETARY_DEACTIVE_DATE'
      Origin = 'PROPRIETARY_DEACTIVE_DATE'
    end
    object QryArinvtCustNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'CustNo'
      Calculated = True
    end
  end
end
