object FrmUD_QueryBase: TFrmUD_QueryBase
  Left = 171
  Top = 187
  ClientHeight = 549
  ClientWidth = 660
  Caption = 'User Defined Query'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 300
    Width = 660
    Height = 0
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 660
    Height = 300
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 658
      Height = 298
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 441
      IQComponents.Grid.Height = 212
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcUDQuery
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
      IQComponents.Navigator.DataSource = SrcUDQuery
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.Navigator.BeforeAction = CheckRefresh
      IQComponents.HiddenPanel.Left = 441
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 212
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitLeft = 0
      IQComponents.FormTab.ExplicitTop = 0
      IQComponents.FormTab.ExplicitWidth = 256
      IQComponents.FormTab.ExplicitHeight = 128
      DataSource = SrcUDQuery
      Columns = <
        item
          FieldName = 'NAME'
          Title.Caption = 'Name'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 315
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 300
    Width = 660
    Height = 249
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 658
      Height = 247
      Hint = ''
      ActivePage = TabSheet1
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'SQL'
        object Panel4: TUniPanel
          Left = 0
          Top = 0
          Width = 650
          Height = 28
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object sbtnEditSQLBlock: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Edit SQL Block'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD0D0D0D0D0DDDDDDDDDDDDDDD00D
              DDDDDDDDDDDDD000DDDDDDDDDDDDD0B80DDDDDDDDDDDD0B80DDDDDDDDDDDDD0B
              80DDDDDDDDDDDD0B80DDDDDDDDDDDDD0B80DDDDDDDDDDDD0B80DDDDDDDDDDDDD
              0999DDDDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnEditSQLBlockClick
          end
        end
        object rchedSQL: TUniMemo
          Left = 0
          Top = 28
          Width = 650
          Height = 191
          Hint = ''
          ScrollBars = ssBoth
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  object SrcUDQuery: TDataSource
    DataSet = QryUDQuery
    Left = 72
    Top = 76
  end
  object QryUDQuery: TFDQuery
    BeforeOpen = QryUDQueryBeforeOpen
    BeforePost = QryUDQueryBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    AfterScroll = QryUDQueryAfterScroll
    OnNewRecord = QryUDQueryNewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLUDQuery
    SQL.Strings = (
      'select id,'
      '       name,'
      '       descrip,'
      '       kind '
      '  from ud_query'
      ' where kind = :kind'
      ' order by name        '
      '')
    Left = 72
    Top = 92
    ParamData = <
      item
        Name = 'kind'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryUDQueryNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 30
      FieldName = 'NAME'
      Origin = 'IQ.KB_FORMULA.NAME'
      Size = 30
    end
    object QryUDQueryDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 45
      FieldName = 'DESCRIP'
      Origin = 'IQ.KB_FORMULA.DESCRIP'
      Size = 60
    end
    object QryUDQueryID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.KB_FORMULA.ID'
      Visible = False
      Size = 0
    end
    object QryUDQueryKIND: TStringField
      FieldName = 'KIND'
      Origin = 'IQ.KB_FORMULA.KIND'
      Visible = False
    end
  end
  object UpdateSQLUDQuery: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ud_query'
      '  (ID, NAME, DESCRIP, KIND)'
      'values'
      '  (:ID, :NAME, :DESCRIP, :KIND)')
    ModifySQL.Strings = (
      'update ud_query'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  DESCRIP = :DESCRIP,'
      '  KIND = :KIND'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ud_query'
      'where'
      '  ID = :OLD_ID')
    Left = 72
    Top = 108
  end
end
