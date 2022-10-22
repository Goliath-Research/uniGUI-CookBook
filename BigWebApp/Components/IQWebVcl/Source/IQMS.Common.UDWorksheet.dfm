object FrmUDWorksheet: TFrmUDWorksheet
  Left = 0
  Top = 0
  ClientHeight = 437
  ClientWidth = 592
  Caption = 'UD Worksheet'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 93
    Width = 592
    Height = 7
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search'
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
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSearchClick
    end
    object navMain: TUniDBNavigator
      Left = 352
      Top = 1
      Width = 240
      Height = 26
      Hint = ''
      DataSource = SrcWorksheet
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 28
    Width = 592
    Height = 65
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 317
      Top = 0
      Width = 4
      Height = 65
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 321
      Top = 1
      Width = 271
      Height = 63
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter3: TUniSplitter
        Left = 97
        Top = 0
        Width = 4
        Height = 63
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel7: TUniPanel
        Left = 1
        Top = 1
        Width = 97
        Height = 61
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label1: TUniLabel
          Left = 8
          Top = 10
          Width = 56
          Height = 13
          Hint = ''
          Caption = 'Table Name'
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 8
          Top = 34
          Width = 65
          Height = 13
          Hint = ''
          Caption = 'Column Name'
          TabOrder = 2
        end
      end
      object Panel8: TUniPanel
        Left = 101
        Top = 1
        Width = 170
        Height = 61
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          170
          61)
        object wwDBComboDlgTableName: TUniEdit
          Left = 1
          Top = 7
          Width = 157
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ReadOnly = True
        end
        object wwDBComboDlgColumnName: TUniEdit
          Left = 1
          Top = 31
          Width = 157
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
      end
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 317
      Height = 63
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter4: TUniSplitter
        Left = 97
        Top = 0
        Width = 4
        Height = 63
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel9: TUniPanel
        Left = 1
        Top = 1
        Width = 97
        Height = 61
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label3: TUniLabel
          Left = 8
          Top = 10
          Width = 25
          Height = 13
          Hint = ''
          Caption = 'Code'
          TabOrder = 1
        end
        object Label4: TUniLabel
          Left = 8
          Top = 34
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Description'
          TabOrder = 2
        end
      end
      object Panel10: TUniPanel
        Left = 101
        Top = 1
        Width = 216
        Height = 61
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          216
          61)
        object dbeCode: TUniDBEdit
          Left = 1
          Top = 7
          Width = 213
          Height = 21
          Hint = ''
          DataField = 'CODE'
          DataSource = SrcWorksheet
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object dbeDescrip: TUniDBEdit
          Left = 1
          Top = 31
          Width = 213
          Height = 21
          Hint = ''
          DataField = 'DESCRIP'
          DataSource = SrcWorksheet
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 100
    Width = 592
    Height = 337
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel6: TUniPanel
      Left = 1
      Top = 289
      Width = 590
      Height = 48
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel11: TUniPanel
        Left = 1
        Top = 1
        Width = 588
        Height = 46
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter5: TUniSplitter
          Left = 97
          Top = 0
          Width = 4
          Height = 46
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel12: TUniPanel
          Left = 1
          Top = 1
          Width = 97
          Height = 44
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label5: TUniLabel
            Left = 8
            Top = 14
            Width = 68
            Height = 13
            Hint = ''
            Caption = 'Result Column'
            TabOrder = 1
          end
        end
        object Panel14: TUniPanel
          Left = 101
          Top = 1
          Width = 216
          Height = 44
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 1
          Caption = ''
          object wwDBComboDlgResult: TUniEdit
            Left = 1
            Top = 11
            Width = 213
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 0
            ReadOnly = True
          end
        end
      end
    end
    object IQUDEmbeddedForm1: TIQWebUDEmbeddedForm
      Left = 1
      Top = 1
      Width = 590
      Height = 289
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      Active = False
      DataField = 'FakeID'
      DataSource = SrcWorksheet
      Source = 'WORKSHEET'
      SourceAttributeField = 'CODE'
      TableName = 'worksheet'
      AfterStructureChange = IQUDEmbeddedForm1AfterStructureChange
      BevelOuter = bvNone
      BevelInner = bvNone
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 52
    Top = 240
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmUDWorksheet'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191536 $'
    BuildVersion = '176554'
    Left = 52
    Top = 272
  end
  object PkWorksheet: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id as id,'
      '       code as code,'
      '       descrip as descrip,'
      '       table_name as table_name,'
      '       column_name as column_name,'
      '       result_column_name as result_column_name'
      '  from ud_worksheet       ')
    OnIQModify = PkWorksheetIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 84
    Top = 240
    object PkWorksheetID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.UD_WORKSHEET.ID'
      Visible = False
      Size = 0
    end
    object PkWorksheetCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'IQ.UD_WORKSHEET.CODE'
      Size = 15
    end
    object PkWorksheetDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.UD_WORKSHEET.DESCRIP'
      Size = 60
    end
    object PkWorksheetTABLE_NAME: TStringField
      DisplayLabel = 'Table Name'
      FieldName = 'TABLE_NAME'
      Origin = 'IQ.UD_WORKSHEET.TABLE_NAME'
      Size = 30
    end
    object PkWorksheetCOLUMN_NAME: TStringField
      DisplayLabel = 'Column Name'
      FieldName = 'COLUMN_NAME'
      Origin = 'IQ.UD_WORKSHEET.COLUMN_NAME'
      Size = 30
    end
    object PkWorksheetRESULT_COLUMN_NAME: TStringField
      DisplayLabel = 'Result Column Name'
      FieldName = 'RESULT_COLUMN_NAME'
      Origin = 'IQ.UD_WORKSHEET.RESULT_COLUMN_NAME'
      Size = 30
    end
  end
  object QryWorksheet: TFDQuery
    BeforeInsert = QryWorksheetBeforeEdit
    BeforeEdit = QryWorksheetBeforeEdit
    BeforePost = QryWorksheetBeforePost
    BeforeDelete = QryWorksheetBeforeDelete
    OnCalcFields = QryWorksheetCalcFields
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       code,'
      '       descrip,'
      '       table_name,'
      '       column_name,'
      '       result_column_name'
      '  from ud_worksheet'
      ' order by id        ')
    Left = 176
    Top = 192
    object QryWorksheetID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 15
      Size = 0
    end
    object QryWorksheetCODE: TStringField
      FieldName = 'CODE'
      Origin = 'CODE'
      Required = True
      Size = 15
    end
    object QryWorksheetDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 60
    end
    object QryWorksheetTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Origin = 'TABLE_NAME'
      Required = True
      Size = 30
    end
    object QryWorksheetCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Origin = 'COLUMN_NAME'
      Required = True
      Size = 30
    end
    object QryWorksheetRESULT_COLUMN_NAME: TStringField
      FieldName = 'RESULT_COLUMN_NAME'
      Origin = 'RESULT_COLUMN_NAME'
      Size = 30
    end
    object QryWorksheetFakeID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FakeID'
      Visible = False
      Calculated = True
    end
  end
  object SrcWorksheet: TDataSource
    DataSet = QryWorksheet
    OnStateChange = SrcWorksheetStateChange
    OnDataChange = SrcWorksheetDataChange
    Left = 184
    Top = 248
  end
  object PkTableName: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select table_name as table_name'
      '  from user_tables')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 236
    Top = 196
    object PkTableNameTABLE_NAME: TStringField
      DisplayLabel = 'Table Name'
      FieldName = 'TABLE_NAME'
      Origin = 'IQ.USER_TABLES.TABLE_NAME'
      Size = 128
    end
  end
  object PkColumnName: TIQWebHpick
    BeforeOpen = PkColumnNameBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select column_name'
      '  from user_tab_columns'
      'where table_name = :table_name')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 266
    Top = 196
    ParamData = <
      item
        Name = 'table_name'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkColumnNameCOLUMN_NAME: TStringField
      DisplayLabel = 'Column Name'
      FieldName = 'COLUMN_NAME'
      Origin = 'IQ.USER_TAB_COLUMNS.COLUMN_NAME'
      Size = 128
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'IQUDEmbeddedForm1'
      'dbeCode'
      'dbeDescrip'
      'wwDBComboDlgTableName'
      'wwDBComboDlgColumnName'
      'wwDBComboDlgResult'
      'navMain')
    SecurityCode = 'FRMUDWORKSHEET'
    Left = 84
    Top = 272
  end
  object PkUDColumn: TIQWebHpick
    BeforeOpen = PkUDColumnBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '       col_name,'
      '       col_label,'
      '       col_type,'
      '       col_kind'
      '  from ud_cols '
      ' where ud_tables_id = :ud_tables_id     '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 296
    Top = 196
    ParamData = <
      item
        Name = 'ud_tables_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkUDColumnID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.UD_COLS.ID'
      Visible = False
      Size = 0
    end
    object PkUDColumnCOL_NAME: TStringField
      DisplayLabel = 'Column Name'
      FieldName = 'COL_NAME'
      Origin = 'IQ.UD_COLS.COL_NAME'
      Size = 50
    end
    object PkUDColumnCOL_LABEL: TStringField
      DisplayLabel = 'Caption'
      DisplayWidth = 30
      FieldName = 'COL_LABEL'
      Origin = 'IQ.UD_COLS.COL_LABEL'
      Size = 50
    end
    object PkUDColumnCOL_TYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'COL_TYPE'
      Origin = 'IQ.UD_COLS.COL_TYPE'
      FixedChar = True
      Size = 1
    end
  end
end
