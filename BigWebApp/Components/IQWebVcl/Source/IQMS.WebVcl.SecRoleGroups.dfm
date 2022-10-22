object FrmSecRoleGroups: TFrmSecRoleGroups
  Left = 0
  Top = 0
  ClientHeight = 340
  ClientWidth = 556
  Caption = 'Assigned Groups'
  OnShow = FormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 556
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 394
      Top = 1
      Width = 162
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 556
    Height = 313
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 339
    IQComponents.Grid.Height = 227
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = DataSource1
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
    IQComponents.Navigator.DataSource = DataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 339
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 227
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'GROUP_NAME'
        Title.Caption = 'Group Name'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 40
    Top = 80
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    CachedUpdates = True
    OnUpdateRecord = Query1UpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       group_name,'
      '       descrip'
      '  from s_group'
      ' where id in '
      '     ( select distinct x.s_group_id '
      '         from  s_group_roles x'
      '         start with granted_role_name = :role_name'
      '       connect by prior s_group_id =  granted_s_group_id )'
      ' order by       '
      '       group_name'
      ' ')
    Left = 40
    Top = 108
    ParamData = <
      item
        Name = 'role_name'
        DataType = ftString
      end>
  end
end
