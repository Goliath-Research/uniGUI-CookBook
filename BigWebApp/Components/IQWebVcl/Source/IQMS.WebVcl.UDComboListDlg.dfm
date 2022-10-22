object FrmIQUDComboListDlg: TFrmIQUDComboListDlg
  Left = 240
  Top = 148
  ClientHeight = 463
  ClientWidth = 449
  Caption = 'User Defined List'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 444
    Width = 449
    Height = 19
    Hint = ''
    Panels = <
      item
        Text = 'Table: '
        Width = 130
      end
      item
        Text = 'Field:'
        Width = 200
      end
      item
        Width = 50
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 69
    Hint = ''
    Margins.Right = 9
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Label2: TUniLabel
      Left = 8
      Top = 16
      Width = 77
      Height = 13
      Hint = ''
      Caption = 'DropDown Style'
      TabOrder = 3
    end
    object wwDBComboBoxStyle: TUniDBComboBox
      Left = 114
      Top = 12
      Width = 138
      Height = 21
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataField = 'IS_DROP_DOWN_LIST'
      DataSource = SrcUserDefList
      Items.Strings = (
        'DropDown'#9'N'
        'DropDown List'#9'Y'
        'System Default'#9'S')
      TabOrder = 0
    end
    object dbchkPickListBased: TUniDBCheckBox
      Left = 8
      Top = 40
      Width = 97
      Height = 17
      Hint = ''
      DataField = 'PKLIST_BASED'
      DataSource = SrcUserDefList
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = 'Pick List Based'
      TabOrder = 1
      OnClick = dbchkPickListBasedClick
    end
  end
  object pnlMain: TUniPanel
    Left = 0
    Top = 69
    Width = 449
    Height = 375
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object pmlBottom: TUniPanel
      Left = 1
      Top = 334
      Width = 447
      Height = 41
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel7: TUniPanel
        Left = 223
        Top = 1
        Width = 224
        Height = 39
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnOK: TUniButton
          Left = 4
          Top = 7
          Width = 97
          Height = 25
          Hint = ''
          Caption = 'OK'
          TabOrder = 1
          OnClick = btnOKClick
        end
        object btnCancel: TUniButton
          Left = 114
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
    object pnlSettings: TUniPanel
      Left = 1
      Top = 1
      Width = 447
      Height = 334
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object PageControl1: TUniPageControl
        Left = 1
        Top = 1
        Width = 445
        Height = 332
        Hint = ''
        ActivePage = TabPkList
        TabBarVisible = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabStrings: TUniTabSheet
          Hint = ''
          Caption = 'TabStrings'
          object Panel3: TUniPanel
            Left = 0
            Top = 0
            Width = 437
            Height = 304
            Hint = ''
            Margins.Left = 5
            Margins.Right = 9
            Margins.Bottom = 0
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Bevel1: TUniPanel
              Left = 1
              Top = 28
              Width = 435
              Height = 3
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              Caption = ''
            end
            object Panel10: TUniPanel
              Left = 1
              Top = 1
              Width = 435
              Height = 28
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Caption = ''
              object sbtnSort: TUniSpeedButton
                Tag = 1999
                Left = 1
                Top = 1
                Width = 25
                Height = 25
                Hint = 'Resequence Alpha Numerically'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FF89B794FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADADADFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF86B69141A85986B691FF00FFFF00FFFF00FFFF00FF78B286379D4F78B2
                  86FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACACAC969696ACACACFF00FFFF
                  00FFFF00FFFF00FFA6A6A68B8B8BA6A6A6FF00FFFF00FFFF00FFFF00FFFF00FF
                  90B99A38A25195ECAD38A25190B99AFF00FFFF00FFFF00FF379D4F23953D379D
                  4FFF00FFFF00FFFF00FFFF00FFFF00FFB0B0B0909090DCDCDC909090B0B0B0FF
                  00FFFF00FFFF00FF8B8B8B8383838B8B8BFF00FFFF00FFFF00FFFF00FF9FBDA6
                  329D4B7FE39B95F7B27FE39B329D4B9FBDA6FF00FFFF00FF379D4F16A72F379D
                  4FFF00FFFF00FFFF00FFFF00FFB7B7B78B8B8BD1D1D1E5E5E5D1D1D18B8B8BB7
                  B7B7FF00FFFF00FF8B8B8B9191918B8B8BFF00FFFF00FFFF00FFCBCCCB2F9B48
                  68DA8883F6A682F6A583F5A568DA892F9B48CBCCCBFF00FF379D4F14B72E379D
                  4FFF00FFFF00FFFF00FFCCCCCC898989C6C6C6E2E2E2E2E2E2E1E1E1C6C6C689
                  8989CCCCCCFF00FF8B8B8B9F9F9F8B8B8BFF00FFFF00FFFF00FFFF00FF9FBDA6
                  5EA96F2E9A476BEE922E9A475EA96F9FBDA6FF00FFFF00FF379D4F19C236379D
                  4FFF00FFFF00FFFF00FFFF00FFB7B7B79B9B9B888888D8D8D88888889B9B9BB7
                  B7B7FF00FFFF00FF8B8B8BA9A9A98B8B8BFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF379D4F4BE578379D4FFF00FFFF00FFFF00FFFF00FF379D4F23CB44379D
                  4FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B8B8BCDCDCD8B8B8BFF00FFFF
                  00FFFF00FFFF00FF8B8B8BB2B2B28B8B8BFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF379D4F3DDE68379D4FFF00FFFF00FFFF00FFFF00FF379D4F2FD456379D
                  4FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B8B8BC5C5C58B8B8BFF00FFFF
                  00FFFF00FFFF00FF8B8B8BBBBBBB8B8B8BFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF379D4F2FD555379D4FFF00FFFF00FFFF00FFFF00FF379D4F3DDE68379D
                  4FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B8B8BBBBBBB8B8B8BFF00FFFF
                  00FFFF00FFFF00FF8B8B8BC5C5C58B8B8BFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF379D4F23CB44379D4FFF00FFFF00FFFF00FFFF00FF379D4F4BE478379D
                  4FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B8B8BB2B2B28B8B8BFF00FFFF
                  00FFFF00FFFF00FF8B8B8BCCCCCC8B8B8BFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF379D4F19C136379D4FFF00FFFF00FF9FBDA65EA96F2E9A476BEE922E9A
                  475EA96F9FBDA6FF00FFFF00FFFF00FFFF00FF8B8B8BA8A8A88B8B8BFF00FFFF
                  00FFB7B7B79B9B9B888888D8D8D88888889B9B9BB7B7B7FF00FFFF00FFFF00FF
                  FF00FF379D4F14B82E379D4FFF00FFCBCCCB2F9B4868D98882F6A582F5A582F5
                  A568D9892F9B48CBCCCBFF00FFFF00FFFF00FF8B8B8B9F9F9F8B8B8BFF00FFCC
                  CCCC898989C5C5C5E2E2E2E1E1E1E1E1E1C5C5C5898989CCCCCCFF00FFFF00FF
                  FF00FF379D4F17A62F379D4FFF00FFFF00FF9FBDA6329D4B7FE39B95F7B27FE3
                  9B329D4B9FBDA6FF00FFFF00FFFF00FFFF00FF8B8B8B9090908B8B8BFF00FFFF
                  00FFB7B7B78B8B8BD1D1D1E5E5E5D1D1D18B8B8BB7B7B7FF00FFFF00FFFF00FF
                  FF00FF379D4F24963D379D4FFF00FFFF00FFFF00FF90B99A38A25195ECAC38A2
                  5190B99AFF00FFFF00FFFF00FFFF00FFFF00FF8B8B8B8484848B8B8BFF00FFFF
                  00FFFF00FFB0B0B0909090DCDCDC909090B0B0B0FF00FFFF00FFFF00FFFF00FF
                  FF00FF78B286379D4F78B286FF00FFFF00FFFF00FFFF00FF86B69141A85986B6
                  91FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A6A68B8B8BA6A6A6FF00FFFF
                  00FFFF00FFFF00FFACACAC969696ACACACFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF89B794FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFADADADFF00FFFF00FFFF00FFFF00FF}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnSortClick
              end
              object DBNavigator1: TUniDBNavigator
                Left = 210
                Top = 1
                Width = 225
                Height = 26
                Hint = ''
                DataSource = SrcUser_Def_List_Detail
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 0
              end
            end
            object Panel11: TUniPanel
              Left = 1
              Top = 31
              Width = 435
              Height = 273
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object wwDBGrid1: TIQUniGridControl
                Left = 1
                Top = 1
                Width = 433
                Height = 271
                Layout = 'border'
                ParentAlignmentControl = False
                AlignmentControl = uniAlignmentClient
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                IQComponents.Grid.Left = 0
                IQComponents.Grid.Top = 29
                IQComponents.Grid.Width = 216
                IQComponents.Grid.Height = 185
                IQComponents.Grid.Hint = ''
                IQComponents.Grid.DataSource = SrcUser_Def_List_Detail
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
                IQComponents.Navigator.DataSource = SrcUser_Def_List_Detail
                IQComponents.Navigator.LayoutConfig.Region = 'east'
                IQComponents.Navigator.TabOrder = 3
                IQComponents.HiddenPanel.Left = 216
                IQComponents.HiddenPanel.Top = 29
                IQComponents.HiddenPanel.Width = 209
                IQComponents.HiddenPanel.Height = 185
                IQComponents.HiddenPanel.Hint = ''
                IQComponents.HiddenPanel.Visible = True
                IQComponents.HiddenPanel.Align = alRight
                IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                IQComponents.FormTab.Hint = ''
                IQComponents.FormTab.ImageIndex = 1
                IQComponents.FormTab.Caption = 'Form'
                IQComponents.FormTab.Layout = 'border'
                DataSource = SrcUser_Def_List_Detail
                Columns = <
                  item
                    FieldName = 'SEQ'
                    Title.Caption = '#'
                    Width = 35
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'TEXT'
                    Title.Caption = 'Text'
                    Width = 413
                    CheckBoxField.FieldValues = 'true;false'
                  end>
                Marker = 0
              end
            end
          end
        end
        object TabPkList: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'TabPkList'
          object Panel4: TUniPanel
            Left = 0
            Top = 0
            Width = 437
            Height = 304
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Panel5: TUniPanel
              Left = 1
              Top = 1
              Width = 435
              Height = 269
              Hint = ''
              Margins.Left = 5
              Margins.Right = 9
              Margins.Bottom = 0
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Panel6: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 433
                Height = 28
                Hint = ''
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Alignment = taLeftJustify
                Caption = ''
                object Label3: TUniLabel
                  Left = 4
                  Top = 7
                  Width = 25
                  Height = 13
                  Hint = ''
                  Caption = ' SQL '
                  TabOrder = 2
                end
                object Panel9: TUniPanel
                  Left = 405
                  Top = 1
                  Width = 28
                  Height = 26
                  Hint = ''
                  Align = alRight
                  Anchors = [akTop, akRight, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object sbtnVerifySQL: TUniSpeedButton
                    Left = 1
                    Top = 1
                    Width = 25
                    Height = 25
                    Hint = 'Verify SQL'
                    ShowHint = True
                    ParentShowHint = False
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFBFC7C1A4BDAA89B39389B393A4BDAABFC7C1FF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB9C5BC6DA97C469A5C4B9B6054
                      9F6957A16C529F674A9C5F6DA97CB9C5BCFF00FFFF00FFFF00FFFF00FFFF00FF
                      ABC0B04F9E64489D5E55A46965AD7872B38374B48572B38369AE7B56A46A519F
                      64ACC0B1FF00FFFF00FFFF00FFBBC6BE4D9E6241A45655B36857AB6B58A56B52
                      A66664B5756DBD7D6DBD7D68BB7955AE69519F64BBC6BEFF00FFFF00FF6DA97C
                      39A84F46BB5955B16867AD79F0F7F1BDDBC5489C5E63C27366C77667C67662C5
                      724BB05E6FAA7EFF00FFB7C5BB3FA15632C1484EB66258A56BEBF4EEFFFFFFFF
                      FFFFA5CEAF52B06665D07665D07665D0764FCA6343A159B9C5BC95B89E3AAF54
                      3BC35553A268E2F0E6FFFFFFFFFFFFFFFFFFFFFFFF91C49E53B56966DA7B5DD8
                      734CD4653FB15895B89E87B3933EBB5C43B25EBBDAC3FFFFFFFFFFFFA7CFB1D5
                      E8DAFFFFFFFFFFFF86BE9450B96A58E1794EDF7042BD6087B39387B39350C470
                      57D87B5CA76FE9F3ECB2D5BB52BC6F4FA064DCECE0FFFFFFFBFDFB7DB98C50BF
                      6F5CEA854EC36F87B39397B9A05CC17880F4A364C9814D9F625BBE7771E39364
                      CF8353A268E5F1E8FFFFFFF6FAF7489C5E77F19B53BD7197B9A0BDC6C0479B5D
                      91F6B097F7B494F3B098F7B598F7B598F7B572CD8C58A56BE0EEE482BB906CC5
                      8591F6AF459A5BBFC7C1FF00FF74AC8279CC90ABF9C2ABF9C2ACF9C1ACF8C3AD
                      F9C3ADF9C380D19755AA6B7ED094A9F9C07ACD9175AC83FF00FFFF00FFBFC7C1
                      529F6591D8A5BDFBCFBDFACEBDFBCEBDFBCEBCFBCEBBFACDB9FACBB9F9CC90D7
                      A354A167BFC7C1FF00FFFF00FFFF00FFB3C3B759A16B85C897CAF9D8CFFBDCCE
                      FBDCCEFBDBCDFBDBCEFBDB8FCFA0529F65B1C2B5FF00FFFF00FFFF00FFFF00FF
                      FF00FFC7CAC881B08D51A2667CBE8E8FCA9F8FCB9F7EBF9054A46979AD86BFC7
                      C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C8C29CBAA48D
                      B5978DB5979CBAA4C1C8C2FF00FFFF00FFFF00FFFF00FFFF00FF}
                    Caption = ''
                    ParentColor = False
                    Color = clWindow
                    OnClick = sbtnVerifySQLClick
                  end
                end
              end
              object Panel8: TUniPanel
                Left = 1
                Top = 28
                Width = 433
                Height = 241
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object DBRichEdit1: TUniDBMemo
                  Left = 1
                  Top = 1
                  Width = 431
                  Height = 239
                  Hint = ''
                  DataField = 'PKLIST_SQL'
                  DataSource = SrcUserDefList
                  ScrollBars = ssBoth
                  ParentFont = False
                  Font.Charset = ANSI_CHARSET
                  Font.Height = -12
                  Font.Name = 'Segoe UI'
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  WordWrap = False
                end
              end
            end
            object Panel1: TUniPanel
              Left = 1
              Top = 269
              Width = 435
              Height = 35
              Hint = ''
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                435
                35)
              object Label1: TUniLabel
                Left = 4
                Top = 10
                Width = 55
                Height = 13
                Hint = ''
                Caption = 'Result Field'
                TabOrder = 2
              end
              object wwDBComboBoxResultField: TUniDBComboBox
                Left = 110
                Top = 6
                Width = 322
                Height = 21
                Hint = ''
                Anchors = [akLeft, akTop, akRight]
                DataField = 'PKLIST_FIELD_NAME'
                DataSource = SrcUserDefList
                TabOrder = 0
                OnDropDown = wwDBComboBoxResultFieldDropDown
              end
            end
          end
        end
      end
    end
  end
  object SrcUser_Def_List_Detail: TDataSource
    DataSet = QryUser_Def_List_Detail
    Left = 72
    Top = 160
  end
  object QryUser_Def_List_Detail: TFDQuery
    BeforeOpen = QryUser_Def_List_DetailBeforeOpen
    BeforePost = QryUser_Def_List_DetailBeforePost
    OnNewRecord = QryUser_Def_List_DetailNewRecord
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'USER_DEF_LIST_DETAIL'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       user_def_list_id,'
      '       text,'
      '       seq'
      '  from user_def_list_detail'
      ' where user_def_list_id = :id'
      ' order by seq ')
    Left = 72
    Top = 181
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryUser_Def_List_DetailSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 5
      FieldName = 'SEQ'
      Origin = 'IQ.USER_DEF_LIST_DETAIL.SEQ'
      Size = 0
    end
    object QryUser_Def_List_DetailTEXT: TStringField
      DisplayLabel = 'Text'
      DisplayWidth = 59
      FieldName = 'TEXT'
      Origin = 'IQ.USER_DEF_LIST_DETAIL.TEXT'
      Size = 250
    end
    object QryUser_Def_List_DetailID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.USER_DEF_LIST_DETAIL.ID'
      Visible = False
      Size = 0
    end
    object QryUser_Def_List_DetailUSER_DEF_LIST_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'USER_DEF_LIST_ID'
      Origin = 'IQ.USER_DEF_LIST_DETAIL.USER_DEF_LIST_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into user_def_list_detail'
      '  (ID, USER_DEF_LIST_ID, TEXT, SEQ)'
      'values'
      '  (:ID, :USER_DEF_LIST_ID, :TEXT, :SEQ)')
    ModifySQL.Strings = (
      'update user_def_list_detail'
      'set'
      '  ID = :ID,'
      '  USER_DEF_LIST_ID = :USER_DEF_LIST_ID,'
      '  TEXT = :TEXT,'
      '  SEQ = :SEQ'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from user_def_list_detail'
      'where'
      '  ID = :OLD_ID')
    Left = 72
    Top = 208
  end
  object SrcUserDefList: TDataSource
    DataSet = QryUserDefList
    OnDataChange = SrcUserDefListDataChange
    Left = 36
    Top = 160
  end
  object QryUserDefList: TFDQuery
    Tag = 1
    BeforeOpen = QryUserDefListBeforeOpen
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'USER_DEF_LIST'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLUserDefList
    SQL.Strings = (
      'select id, '
      '       is_drop_down_list,'
      '       pklist_based,'
      '       pklist_sql,'
      '       pklist_field_name'
      '  from user_def_list '
      ' where id = :id')
    Left = 36
    Top = 180
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryUserDefListID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.USER_DEF_LIST.ID'
      Size = 0
    end
    object QryUserDefListIS_DROP_DOWN_LIST: TStringField
      FieldName = 'IS_DROP_DOWN_LIST'
      Origin = 'IQ.USER_DEF_LIST.IS_DROP_DOWN_LIST'
      Size = 1
    end
    object QryUserDefListPKLIST_BASED: TStringField
      FieldName = 'PKLIST_BASED'
      Origin = 'IQ.USER_DEF_LIST.PKLIST_BASED'
      Size = 1
    end
    object QryUserDefListPKLIST_SQL: TStringField
      FieldName = 'PKLIST_SQL'
      Origin = 'IQ.USER_DEF_LIST.PKLIST_SQL'
      Size = 4000
    end
    object QryUserDefListPKLIST_FIELD_NAME: TStringField
      FieldName = 'PKLIST_FIELD_NAME'
      Origin = 'IQ.USER_DEF_LIST.PKLIST_FIELD_NAME'
      Size = 30
    end
  end
  object UpdateSQLUserDefList: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into user_def_list'
      
        '  (IS_DROP_DOWN_LIST, PKLIST_BASED, PKLIST_SQL, PKLIST_FIELD_NAM' +
        'E)'
      'values'
      
        '  (:IS_DROP_DOWN_LIST, :PKLIST_BASED, :PKLIST_SQL, :PKLIST_FIELD' +
        '_NAME)')
    ModifySQL.Strings = (
      'update user_def_list'
      'set'
      '  IS_DROP_DOWN_LIST = :IS_DROP_DOWN_LIST,'
      '  PKLIST_BASED = :PKLIST_BASED,'
      '  PKLIST_SQL = :PKLIST_SQL,'
      '  PKLIST_FIELD_NAME = :PKLIST_FIELD_NAME'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from user_def_list'
      'where'
      '  ID = :OLD_ID')
    Left = 36
    Top = 208
  end
  object popmSQLExample: TUniPopupMenu
    Left = 40
    Top = 256
    object SeeExample1: TUniMenuItem
      Caption = 'See Example'
      OnClick = SeeExample1Click
    end
  end
end
