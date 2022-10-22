object FrmTADefaults: TFrmTADefaults
  Left = 407
  Top = 169
  ClientHeight = 158
  ClientWidth = 303
  Caption = 'Time & Attendance Defaults'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 117
    Width = 303
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 90
      Top = 1
      Width = 213
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 8
        Top = 8
        Width = 95
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 110
        Top = 8
        Width = 96
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 303
    Height = 117
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 158
      Top = 0
      Width = 4
      Height = 117
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 158
      Height = 115
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 68
        Height = 13
        Hint = ''
        Caption = 'Regular Hours'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 35
        Width = 134
        Height = 13
        Hint = ''
        Caption = 'One and One-Half Overtime'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 8
        Top = 59
        Width = 80
        Height = 13
        Hint = ''
        Caption = 'Double Overtime'
        TabOrder = 3
      end
      object Label5: TUniLabel
        Left = 8
        Top = 82
        Width = 73
        Height = 13
        Hint = ''
        Caption = 'Triple Overtime'
        TabOrder = 4
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 162
      Top = 1
      Width = 141
      Height = 115
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        141
        115)
      object dbReg: TUniDBLookupComboBox
        Left = 1
        Top = 8
        Width = 131
        Height = 24
        Hint = ''
        ListField = 'ID'
        ListSource = SrcQryPaytypeReg
        KeyField = 'DESCRIPTION'
        ListFieldIndex = 0
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Color = clWindow
      end
      object dbOt: TUniDBLookupComboBox
        Left = 1
        Top = 31
        Width = 131
        Height = 24
        Hint = ''
        ListField = 'ID'
        ListSource = SrcQryPaytypeOT
        KeyField = 'DESCRIPTION'
        ListFieldIndex = 0
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clWindow
      end
      object dbOt2: TUniDBLookupComboBox
        Left = 1
        Top = 55
        Width = 131
        Height = 24
        Hint = ''
        ListField = 'ID'
        ListSource = SrcQryPaytypeOT2
        KeyField = 'DESCRIPTION'
        ListFieldIndex = 0
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clWindow
      end
      object dbOt3: TUniDBLookupComboBox
        Left = 1
        Top = 78
        Width = 131
        Height = 24
        Hint = ''
        ListField = 'ID'
        ListSource = SrcQryPaytypeOT3
        KeyField = 'DESCRIPTION'
        ListFieldIndex = 0
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Color = clWindow
      end
    end
  end
  object QryPaytypeReg: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from pr_paytype'
      'where NVL(pk_hide, '#39'N'#39') = '#39'N'#39)
    Left = 40
    Top = 71
    object QryPaytypeRegDESCRIPTION: TStringField
      DisplayLabel = 'PayType'
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Origin = 'PR_PAYTYPE.DESCRIPTION'
      Size = 50
    end
    object QryPaytypeRegID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'PR_PAYTYPE.ID'
      Visible = False
      Size = 0
    end
  end
  object QryPaytypeOT: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from pr_paytype'
      'where NVL(pk_hide, '#39'N'#39') = '#39'N'#39)
    Left = 72
    Top = 71
    object QryPaytypeOTDESCRIPTION: TStringField
      DisplayLabel = 'PayType'
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Origin = 'PR_PAYTYPE.DESCRIPTION'
      Size = 50
    end
    object QryPaytypeOTID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'PR_PAYTYPE.ID'
      Visible = False
      Size = 0
    end
  end
  object QryPaytypeNPB: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from pr_paytype'
      'where NVL(pk_hide, '#39'N'#39') = '#39'N'#39)
    Left = 184
    Top = 71
    object StringField2: TStringField
      DisplayLabel = 'PayType'
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Origin = 'PR_PAYTYPE.DESCRIPTION'
      Size = 50
    end
    object FloatField2: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'PR_PAYTYPE.ID'
      Visible = False
      Size = 0
    end
  end
  object QryPaytypeOT2: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from pr_paytype'
      'where NVL(pk_hide, '#39'N'#39') = '#39'N'#39)
    Left = 104
    Top = 71
    object StringField1: TStringField
      DisplayLabel = 'PayType'
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Origin = 'PR_PAYTYPE.DESCRIPTION'
      Size = 50
    end
    object FloatField1: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'PR_PAYTYPE.ID'
      Visible = False
      Size = 0
    end
  end
  object QryPaytypeOT3: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from pr_paytype'
      'where NVL(pk_hide, '#39'N'#39') = '#39'N'#39)
    Left = 144
    Top = 71
    object StringField3: TStringField
      DisplayLabel = 'PayType'
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Origin = 'PR_PAYTYPE.DESCRIPTION'
      Size = 50
    end
    object FloatField3: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'PR_PAYTYPE.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcQryPaytypeReg: TDataSource
    DataSet = QryPaytypeReg
    Left = 16
    Top = 8
  end
  object SrcQryPaytypeOT: TDataSource
    DataSet = QryPaytypeOT
    Left = 40
    Top = 8
  end
  object SrcQryPaytypeOT2: TDataSource
    DataSet = QryPaytypeOT2
    Left = 64
    Top = 8
  end
  object SrcQryPaytypeOT3: TDataSource
    DataSet = QryPaytypeOT3
    Left = 88
    Top = 8
  end
end
