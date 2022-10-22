object FrmConfigTrace: TFrmConfigTrace
  Left = 394
  Top = 141
  HelpContext = 1067235
  ClientHeight = 446
  ClientWidth = 429
  Caption = 'IQTrace'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 149
    Width = 429
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 411
    Width = 429
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel4: TUniPanel
      Left = 317
      Top = 1
      Width = 111
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnApply: TUniButton
        Left = 4
        Top = 5
        Width = 97
        Height = 25
        Hint = 'Update Trace Instructions'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Apply'
        Cancel = True
        TabOrder = 1
        OnClick = btnApplyClick
      end
    end
  end
  object PnlTracedTables: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 429
    Height = 149
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 48
      Width = 427
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object Panel5: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 427
      Height = 47
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Panel6: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 425
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label3: TUniLabel
          Left = 1
          Top = 1
          Width = 79
          Height = 13
          Hint = ''
          Caption = 'Traced Tables'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel15: TUniPanel
        Tag = 1999
        Left = 1
        Top = 21
        Width = 425
        Height = 25
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object sbtnSearch: TUniSpeedButton
          Left = 1
          Top = 1
          Width = 25
          Height = 23
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            1800000000000006000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
            90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
            40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
            00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
            E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
            90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
            00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
            E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
            B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
            00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
            E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
            B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
            00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
            F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
            B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
            00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
            A068509050308048308048208038108F4C26B08870A068509058309048308040
            20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
            4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
            FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
            50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
            B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
            F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
            50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
            57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
            C09880B08060A068509050309058409D6842B07860B08870A070508048308048
            20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
            67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
            C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
            20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
            00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
            CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
            37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
            00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
            00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
            00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnSearchClick
        end
      end
    end
    object wwgridTab: TIQUniGridControl
      Left = 1
      Top = 51
      Width = 427
      Height = 97
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 210
      IQComponents.Grid.Height = 11
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcTables
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
      IQComponents.Navigator.DataSource = SrcTables
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 210
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 11
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcTables
      Columns = <
        item
          FieldName = 'TABLE_NAME'
          Title.Caption = 'Table Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Trigger_Status'
          Title.Caption = 'Tracing Status'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object PnlTracedColumns: TUniPanel
    Tag = 1999
    Left = 0
    Top = 152
    Width = 429
    Height = 259
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Bevel2: TUniPanel
      Left = 1
      Top = 48
      Width = 427
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      Caption = ''
    end
    object Panel7: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 427
      Height = 47
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Panel8: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 425
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label1: TUniLabel
          Left = 1
          Top = 1
          Width = 90
          Height = 13
          Hint = ''
          Caption = 'Traced Columns'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 91
          Top = 1
          Width = 10
          Height = 13
          Hint = ''
          Caption = ' - '
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
        end
        object DBText1: TUniDBText
          Left = 101
          Top = 1
          Width = 41
          Height = 13
          Hint = ''
          DataField = 'TABLE_NAME'
          DataSource = SrcTables
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
        end
      end
    end
    object wwgridCol: TIQUniGridControl
      Left = 1
      Top = 51
      Width = 427
      Height = 207
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 210
      IQComponents.Grid.Height = 121
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcColumns
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
      IQComponents.Navigator.DataSource = SrcColumns
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 210
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 121
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcColumns
      Columns = <
        item
          FieldName = 'COL_NAME'
          Title.Caption = 'Column Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AFTER_INSERT'
          Title.Caption = 'Insert'
          Width = 64
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'AFTER_UPDATE'
          Title.Caption = 'Update'
          Width = 64
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'AFTER_DELETE'
          Title.Caption = 'Delete'
          Width = 64
          CheckBoxField.FieldValues = 'Y;N'
        end>
      Marker = 0
    end
    object wwDBLookupCombo2: TUniDBLookupComboBox
      Left = 120
      Top = 111
      Width = 121
      Height = 21
      Hint = ''
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
    object wwDBLookupCombo1: TUniDBLookupComboBox
      Left = 120
      Top = 87
      Width = 121
      Height = 21
      Hint = ''
      ListFieldIndex = 0
      TabOrder = 3
      Color = clWindow
    end
  end
  object SrcTables: TDataSource
    DataSet = wwTblTR_Tab
    Left = 16
    Top = 224
  end
  object SrcColumns: TDataSource
    DataSet = wwTblTR_Col
    Left = 56
    Top = 224
  end
  object wwTblTR_Tab: TFDTable
    BeforePost = AssignIDBeforePost
    AfterPost = DisableTrigger
    BeforeDelete = wwTblTR_TabBeforeDelete
    OnCalcFields = wwTblTR_TabCalcFields
    IndexFieldNames = 'TABLE_NAME'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'TR_TAB'
    TableName = 'TR_TAB'
    Left = 16
    Top = 240
    object wwTblTR_TabTABLE_NAME: TStringField
      DisplayLabel = 'Table Name'
      DisplayWidth = 31
      FieldName = 'TABLE_NAME'
      Size = 30
    end
    object wwTblTR_TabTrigger_Status: TStringField
      DisplayLabel = 'Tracing Status'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'Trigger_Status'
      Calculated = True
    end
    object wwTblTR_TabID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object wwTblTR_Col: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = AssignIDBeforePost
    AfterPost = DisableTrigger
    AfterDelete = DisableTrigger
    OnNewRecord = wwTblTR_ColNewRecord
    IndexFieldNames = 'TR_TAB_ID;COL_NAME'
    MasterSource = SrcTables
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'TR_COL'
    TableName = 'TR_COL'
    Left = 56
    Top = 240
    object wwTblTR_ColCOL_NAME: TStringField
      DisplayLabel = 'Column Name'
      DisplayWidth = 44
      FieldName = 'COL_NAME'
      Required = True
      Size = 30
    end
    object wwTblTR_ColAFTER_INSERT: TStringField
      DisplayLabel = 'Insert'
      DisplayWidth = 6
      FieldName = 'AFTER_INSERT'
      Size = 1
    end
    object wwTblTR_ColAFTER_UPDATE: TStringField
      DisplayLabel = 'Update'
      DisplayWidth = 6
      FieldName = 'AFTER_UPDATE'
      Size = 1
    end
    object wwTblTR_ColAFTER_DELETE: TStringField
      DisplayLabel = 'Delete'
      DisplayWidth = 6
      FieldName = 'AFTER_DELETE'
      Size = 1
    end
    object wwTblTR_ColID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object wwTblTR_ColTR_TAB_ID: TBCDField
      FieldName = 'TR_TAB_ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryCols: TFDQuery
    MasterSource = SrcTables
    MasterFields = 'TABLE_NAME'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select column_name'
      '  from all_tab_columns'
      ' where table_name =  :table_name'
      '   and owner = '#39'IQMS'#39
      
        '   and data_length <= 4000  -- condition is changed from 60 to 4' +
        '000 May-04-2004'
      ' order by column_name'
      ' '
      ' '
      ' ')
    Left = 224
    Top = 240
    ParamData = <
      item
        Name = 'TABLE_NAME'
        DataType = ftString
        ParamType = ptInput
      end>
    object wwQryColsCOLUMN_NAME: TStringField
      DisplayLabel = 'Column Name'
      DisplayWidth = 30
      FieldName = 'COLUMN_NAME'
      Origin = 'ALL_TAB_COLUMNS.COLUMN_NAME'
      Size = 128
    end
  end
  object wwQryTabs: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.table_name'
      '  from all_constraints a, all_cons_columns b'
      ' where a.owner = '#39'IQMS'#39
      '   and a.constraint_type = '#39'P'#39
      '   and a.constraint_name = b.constraint_name'
      '   and b.column_name = '#39'ID'#39
      '   and not (a.table_name like '#39'TR_%'#39')'
      ' order by a.table_name')
    Left = 224
    Top = 208
    object wwQryTabsTABLE_NAME: TStringField
      DisplayLabel = 'Table Name'
      FieldName = 'TABLE_NAME'
      Origin = 'ALL_TABLES.TABLE_NAME'
      Size = 128
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 128
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Report1: TUniMenuItem
      Caption = '&Report'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Content1: TUniMenuItem
        Caption = 'Content'
        OnClick = Content1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmConfigTrace'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195196 $'
    BuildVersion = '176554'
    Left = 64
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmConfigTrace'
    WebUse = False
    TouchScreen = False
    Left = 96
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 128
    Top = 32
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'Apply1'
      'Print1'
      'NavTab'
      'NavCol'
      'wwTblTR_Tab'
      'wwTblTR_Col'
      'btnApply')
    SecurityCode = 'FRMCONFIGTRACE'
    Left = 96
    Top = 32
  end
  object PTable: TUniPopupMenu
    Left = 157
    object Apply1: TUniMenuItem
      Caption = 'Apply'
      OnClick = btnApplyClick
    end
  end
  object PkTraceTable: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id as id,'
      '       a.table_name as table_name, '
      '       nvl(b.status, '#39'Unavailable'#39') as status'
      '  from tr_tab a,'
      '       user_triggers b'
      ' where '#39'T2_'#39' || a.table_name = b.trigger_name(+)')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 96
    Top = 72
    object PkTraceTableID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkTraceTableTABLE_NAME: TStringField
      DisplayLabel = 'Table Name'
      FieldName = 'TABLE_NAME'
      Size = 30
    end
    object PkTraceTableSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 11
    end
  end
end
