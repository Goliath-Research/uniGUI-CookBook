object FrmTaPattern: TFrmTaPattern
  Left = 433
  Top = 214
  ClientHeight = 211
  ClientWidth = 393
  Caption = 'Group Time Blocks'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  Font.Height = -14
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object grid: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 393
    Height = 211
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Height = -14
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 176
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
    IQComponents.HiddenPanel.Left = 176
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 125
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 92
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 121
    DataSource = Src
    Columns = <
      item
        FieldName = 'S_DAY'
        Title.Caption = 'Day'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'S_TIME'
        Title.Caption = 'Start Time'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'E_TIME'
        Title.Caption = 'End Time'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROD_DAY_GROUP'
        Title.Caption = 'Prod. Day Group'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 33
    ExplicitHeight = 178
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 136
    Top = 16
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object Src: TDataSource
    DataSet = Qry
    Left = 48
    Top = 72
  end
  object Qry: TFDQuery
    BeforeInsert = QryBeforeInsert
    AfterPost = QryAfterPost
    BeforeDelete = QryBeforeDelete
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       ta_shift_id,'
      '       descrip,'
      '       seq,'
      '       To_Char(start_time, '#39'D'#39') as s_day,'
      '       To_Char(start_time, '#39'HH:MI PM'#39') as s_time,'
      '       To_Char(end_time, '#39'D'#39') as end_day,'
      '       To_Char(end_time, '#39'HH:MI PM'#39') as e_time,'
      '       prod_day_group'
      '  from ta_pattern'
      ' where ta_shift_id = :AID'
      ' order by start_time')
    Left = 56
    Top = 80
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryS_DAY: TStringField
      DisplayLabel = 'Day'
      DisplayWidth = 1
      FieldName = 'S_DAY'
      ReadOnly = True
      Size = 1
    end
    object QryS_TIME: TStringField
      DisplayLabel = 'Start Time'
      DisplayWidth = 8
      FieldName = 'S_TIME'
      ReadOnly = True
      Size = 8
    end
    object QryE_TIME: TStringField
      DisplayLabel = 'End Time'
      DisplayWidth = 8
      FieldName = 'E_TIME'
      ReadOnly = True
      Size = 8
    end
    object QryPROD_DAY_GROUP: TBCDField
      DisplayLabel = 'Prod. Day Group'
      DisplayWidth = 10
      FieldName = 'PROD_DAY_GROUP'
      Size = 0
    end
    object QryID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryTA_SHIFT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TA_SHIFT_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryDESCRIP: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRIP'
      ReadOnly = True
      Visible = False
      Size = 100
    end
    object QrySEQ: TBCDField
      DisplayWidth = 10
      FieldName = 'SEQ'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryEND_DAY: TStringField
      DisplayWidth = 1
      FieldName = 'END_DAY'
      ReadOnly = True
      Visible = False
      Size = 1
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ta_pattern'
      '  (PROD_DAY_GROUP)'
      'values'
      '  (:PROD_DAY_GROUP)')
    ModifySQL.Strings = (
      'update ta_pattern'
      'set'
      '  PROD_DAY_GROUP = :PROD_DAY_GROUP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ta_pattern'
      'where'
      '  ID = :OLD_ID')
    Left = 72
    Top = 88
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Group Time Blocks'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 120
    Top = 88
  end
end
