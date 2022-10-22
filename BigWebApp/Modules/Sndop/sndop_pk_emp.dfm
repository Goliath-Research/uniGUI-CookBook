object FrmSndOpPkEmp: TFrmSndOpPkEmp
  Left = 268
  Top = 231
  ClientHeight = 186
  ClientWidth = 556
  Caption = 'Employee Picklist'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 556
    Height = 146
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 339
    IQComponents.Grid.Height = 60
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwDataSource1
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
    IQComponents.Navigator.DataSource = wwDataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 339
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 60
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'EMPNO'
        Title.Caption = 'Employee #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FIRST_NAME'
        Title.Caption = 'First Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MIDDLE_NAME'
        Title.Caption = 'Middle Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LAST_NAME'
        Title.Caption = 'Last Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 146
    Width = 556
    Height = 40
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 372
      Top = 1
      Width = 184
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 7
        Top = 7
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 97
        Top = 7
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 118
    Top = 65
  end
  object wwQuery1: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       empno,'
      '       first_name,'
      '       middle_name,'
      '       last_name'
      ' from pr_emp'
      'where nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39)
    Left = 118
    Top = 79
    object wwQuery1EMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 18
      FieldName = 'EMPNO'
      Origin = 'EMPNO'
      Size = 25
    end
    object wwQuery1FIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 22
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Size = 30
    end
    object wwQuery1MIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 15
      FieldName = 'MIDDLE_NAME'
      Origin = 'MIDDLE_NAME'
      Size = 30
    end
    object wwQuery1ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object wwQuery1LAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 30
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Size = 30
    end
  end
end
