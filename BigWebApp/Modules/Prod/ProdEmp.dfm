inherited FrmProdEmpHours: TFrmProdEmpHours
  Left = 95
  Top = 183
  HelpContext = 1067783
  ClientHeight = 177
  ClientWidth = 449
  Caption = 'FrmProdEmpHours'
  OnShow = FormShow
  ExplicitWidth = 465
  ExplicitHeight = 216
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 142
    Width = 449
    Height = 35
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitTop = 142
    ExplicitWidth = 449
    ExplicitHeight = 35
    inherited Panel2: TUniPanel
      Left = 263
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 263
      ExplicitHeight = 33
      inherited btnClose: TUniButton
        Left = 102
        Top = 6
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitLeft = 102
        ExplicitTop = 6
      end
    end
  end
  inherited gridEmp: TIQUniGridControl
    Width = 449
    Height = 142
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    IQComponents.Grid.Width = 232
    IQComponents.Grid.Height = 56
    IQComponents.HiddenPanel.Left = 232
    IQComponents.HiddenPanel.Height = 56
    Columns = <
      item
        FieldName = 'EmpNo'
        Title.Caption = 'Emp#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROD_HRS'
        Title.Caption = 'Prod.Hours'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'First'
        Title.Caption = 'First Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Middle'
        Title.Caption = 'Middle Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Last'
        Title.Caption = 'Last Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Labor_Code'
        Title.Caption = 'Labor Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Labor_Description'
        Title.Caption = 'Labor Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitWidth = 449
    ExplicitHeight = 142
    Marker = 0
  end
  inherited wwDBLookupCombo1: TUniDBLookupComboBox
    Left = 16
    Top = 62
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 16
    ExplicitTop = 62
  end
  object wwDBLookupComboLaborCode: TUniDBLookupComboBox [3]
    Left = 16
    Top = 90
    Width = 62
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    TabOrder = 3
    Color = clWindow
  end
  inherited tblRtEmpHrs: TwwTable
    BeforeEdit = CheckAbortOnSourceIsTA
    TableName = 'DAY_EMP'
    Left = 191
    Top = 89
    inherited tblRtEmpHrsFirst: TStringField
      ReadOnly = True
    end
    inherited tblRtEmpHrsLast: TStringField
      ReadOnly = True
    end
    object tblRtEmpHrsLabor_Code: TStringField
      FieldKind = fkLookup
      FieldName = 'Labor_Code'
      LookupDataSet = wwQryMasterLaborLookup
      LookupKeyFields = 'ID'
      LookupResultField = 'CODE'
      KeyFields = 'MASTER_LABOR_ID'
      Size = 25
      Lookup = True
    end
    object tblRtEmpHrsLabor_Description: TStringField
      FieldKind = fkLookup
      FieldName = 'Labor_Description'
      LookupDataSet = wwQryMasterLaborLookup
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'MASTER_LABOR_ID'
      ReadOnly = True
      Visible = False
      Size = 50
      Lookup = True
    end
    object tblRtEmpHrsMASTER_LABOR_ID: TBCDField
      FieldName = 'MASTER_LABOR_ID'
      Visible = False
      Size = 0
    end
    object tblRtEmpHrsTA_LABOR_ID: TBCDField
      FieldName = 'TA_LABOR_ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryMasterLaborLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, code, descrip'
      '  from master_labor'
      ' where nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39
      ' order by code')
    Left = 296
    Top = 89
    object wwQryMasterLaborLookupCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 25
      FieldName = 'CODE'
      Origin = 'IQ.MASTER_LABOR.CODE'
      Size = 25
    end
    object wwQryMasterLaborLookupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'IQ.MASTER_LABOR.DESCRIP'
      Size = 50
    end
    object wwQryMasterLaborLookupID2: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.MASTER_LABOR.ID'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmProdEmpHours')
    SecurityItems.Strings = (
      'TblRtEmpHrs'
      'NavEmp')
    SecurityCode = 'FRMPRODEMPHOURS'
    Left = 333
    Top = 87
  end
end
