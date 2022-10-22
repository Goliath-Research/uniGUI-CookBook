object FrmBudgInfo: TFrmBudgInfo
  Left = 65
  Top = 183
  ClientHeight = 211
  ClientWidth = 255
  Caption = 'Budget Information'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 255
    Height = 211
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 38
    IQComponents.Grid.Height = 125
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = Src
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = Src
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 38
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 125
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = Src
    Columns = <
      item
        FieldName = 'BUDAMOUNT'
        Title.Caption = 'Budgeted'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Budget'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Src: TDataSource
    DataSet = Qry
    Left = 16
    Top = 80
  end
  object Qry: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select b.glacct_fy_id,'
      '       b.glperiods_id,'
      '       b.budamount,'
      '       b.budpercent,'
      '       b.bud_calc_amount,'
      '       b.id,'
      '       b.budgets_fy_id,'
      '       t.descrip'
      '  from glbudget b,'
      '       budgets_fy f,'
      '       budgets t'
      ' where f.id = b.budgets_fy_id'
      '   and f.budgets_id = t.id'
      '   and b.glperiods_id = :Aperiod_id'
      
        '   and f.glacct_fy_id = GL_GLACCT_FY_ID(:Aglacct_id, :Aglyear_id' +
        ')'
      ''
      ' ')
    Left = 16
    Top = 96
    ParamData = <
      item
        Name = 'Aperiod_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'Aglacct_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'Aglyear_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryBUDAMOUNT: TBCDField
      DisplayLabel = 'Budgeted'
      DisplayWidth = 10
      FieldName = 'BUDAMOUNT'
      Origin = 'b.budamount'
      currency = True
      Size = 2
    end
    object QryDESCRIP: TStringField
      DisplayLabel = 'Budget'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 't.descrip'
      Size = 50
    end
    object QryGLACCT_FY_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_FY_ID'
      Visible = False
      Size = 0
    end
    object QryGLPERIODS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLPERIODS_ID'
      Visible = False
      Size = 0
    end
    object QryBUDPERCENT: TBCDField
      DisplayWidth = 10
      FieldName = 'BUDPERCENT'
      Visible = False
      Size = 2
    end
    object QryBUD_CALC_AMOUNT: TBCDField
      DisplayWidth = 10
      FieldName = 'BUD_CALC_AMOUNT'
      Visible = False
      Size = 2
    end
    object QryID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryBUDGETS_FY_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'BUDGETS_FY_ID'
      Visible = False
      Size = 0
    end
  end
end
