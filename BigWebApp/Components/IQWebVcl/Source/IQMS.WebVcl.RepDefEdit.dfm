object RepDefEdit: TRepDefEdit
  Left = 211
  Top = 155
  ClientHeight = 396
  ClientWidth = 549
  Caption = 'Edit Report Definition'
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 3
    Width = 549
    Height = 356
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = 'Panel1'
    object PageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 547
      Height = 354
      Hint = ''
      ActivePage = TabSheet1
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'General'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object PnlClient01: TUniPanel
          Left = 0
          Top = 0
          Width = 539
          Height = 326
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 138
            Top = 0
            Width = 6
            Height = 326
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 138
            Height = 324
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label7: TUniLabel
              Left = 8
              Top = 20
              Width = 63
              Height = 13
              Hint = ''
              Caption = 'Report Name'
              TabOrder = 1
            end
            object Label1: TUniLabel
              Left = 8
              Top = 44
              Width = 89
              Height = 13
              Hint = ''
              Caption = 'Report Description'
              TabOrder = 2
            end
            object Label5: TUniLabel
              Left = 8
              Top = 92
              Width = 99
              Height = 13
              Hint = ''
              Caption = 'Execute Before Print'
              TabOrder = 3
            end
            object lblLanguageCode: TUniLabel
              Left = 8
              Top = 116
              Width = 47
              Height = 13
              Hint = ''
              Caption = 'Language'
              TabOrder = 4
            end
            object Label8: TUniLabel
              Left = 8
              Top = 140
              Width = 99
              Height = 13
              Hint = ''
              Caption = 'Designated MfgType'
              TabOrder = 5
            end
            object lblOwnerName: TUniLabel
              Left = 8
              Top = 68
              Width = 68
              Height = 13
              Hint = ''
              Caption = 'Report Owner'
              TabOrder = 6
            end
          end
          object PnlClient02: TUniPanel
            Left = 144
            Top = 1
            Width = 395
            Height = 324
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitLeft = 141
            ExplicitWidth = 400
            ExplicitHeight = 326
            object Panel10: TUniPanel
              Left = 367
              Top = 1
              Width = 28
              Height = 322
              Hint = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object sbtnClearExecBeforePrint: TUniSpeedButton
                Left = 3
                Top = 88
                Width = 22
                Height = 22
                Hint = 'Clear'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000C21E0000C21E00000001000000000000473E7D005050
                  500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
                  5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
                  650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
                  7B0070707000717171007272720076767600473C800049388200533D8F004B40
                  84004C448500534F83005655810059568D005B568D0054449700554598005D54
                  93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
                  B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
                  A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
                  8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
                  910093939300959595009696960097979700949C9B0098989800999999009B9B
                  9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
                  B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
                  B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
                  A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
                  B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
                  BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
                  CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
                  D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
                  E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
                  E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
                  F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
                  C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
                  D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
                  D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
                  E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
                  F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
                  FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
                  FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
                  E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
                  EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
                  FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
                  F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
                  4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
                  343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
                  9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
                  9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
                  C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
                  E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
                  F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
                  9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
                  9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
                  CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
                  DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
                  0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
                  3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
                  3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
                  3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnClearExecBeforePrintClick
              end
            end
            object PnlGenCtrls: TUniPanel
              Left = 1
              Top = 1
              Width = 367
              Height = 322
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                367
                322)
              object DBText1: TUniDBText
                Left = 1
                Top = 20
                Width = 41
                Height = 13
                Hint = ''
                DataField = 'REPNAME'
              end
              object DBEdit1: TUniDBEdit
                Left = 1
                Top = 41
                Width = 365
                Height = 21
                Hint = ''
                DataField = 'DESCRIP'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
              object DBLookupComboBox1: TUniDBLookupComboBox
                Left = 1
                Top = 89
                Width = 365
                Height = 21
                Hint = ''
                ListSource = SrcAllProcs
                KeyField = 'OBJECT_NAME'
                ListFieldIndex = 0
                DataField = 'BEFORE_PRINT'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                Color = clWindow
              end
              object wwDBComboBoxLanguageCode: TUniDBComboBox
                Left = 1
                Top = 113
                Width = 365
                Height = 21
                Hint = ''
                Anchors = [akLeft, akTop, akRight]
                DataField = 'LANGUAGE_CODE'
                Style = csDropDownList
                Items.Strings = (
                  'English US'#9'0'
                  'German'#9'1'
                  'English Canadian'#9'2'
                  'English Great Britain'#9'3'
                  'Spanish'#9'4'
                  'Japanese'#9'5'
                  'Dutch'#9'6'
                  'Swedish'#9'7'
                  'Chinese Simplified'#9'8'
                  'Chinese Traditional'#9'9'
                  'Korean'#9'10'
                  'French'#9'11')
                TabOrder = 3
              end
              object wwDBComboBoxMfgtype: TUniDBComboBox
                Left = 1
                Top = 137
                Width = 365
                Height = 21
                Hint = ''
                Anchors = [akLeft, akTop, akRight]
                DataField = 'MFGTYPE'
                Style = csDropDownList
                TabOrder = 4
              end
              object wwDBComboDlgOwner: TUniEdit
                Left = 1
                Top = 65
                Width = 366
                Height = 21
                Hint = ''
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                ReadOnly = True
                OnKeyDown = wwDBComboDlgOwnerKeyDown
              end
            end
          end
        end
      end
      object TabSheet2: TUniTabSheet
        Hint = ''
        Caption = 'Define Current Rec'
        object Splitter1: TUniSplitter
          Left = 212
          Top = 0
          Width = 6
          Height = 300
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft02: TUniPanel
          Left = 0
          Top = 0
          Width = 212
          Height = 300
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            212
            300)
          object Label2: TUniLabel
            Left = 3
            Top = 8
            Width = 189
            Height = 13
            Hint = ''
            Caption = 'Current Record Table.Column Identifier'
            TabOrder = 3
          end
          object Label3: TUniLabel
            Left = 3
            Top = 64
            Width = 108
            Height = 13
            Hint = ''
            Caption = 'Currently Open Tables'
            TabOrder = 4
          end
          object dbeditCurrent: TUniDBEdit
            Left = 3
            Top = 25
            Width = 206
            Height = 21
            Hint = ''
            DataField = 'CURR_REC_COL_NAME'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object treeCurrent: TUniTreeView
            Left = 3
            Top = 80
            Width = 204
            Height = 217
            Hint = ''
            Items.NodeData = {
              0301000000260000000000000000000000FFFFFFFFFFFFFFFF00000000000000
              00000000000104490051004D005300}
            Items.FontData = {0101000000FFFFFFFF00000000}
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Color = clWindow
            OnDblClick = treeCurrentDblClick
            OnMouseDown = treeCurrentMouseDown
          end
        end
        object Panel9: TUniPanel
          Left = 218
          Top = 0
          Width = 321
          Height = 300
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            321
            300)
          object Label4: TUniLabel
            Left = 8
            Top = 8
            Width = 165
            Height = 13
            Hint = ''
            Caption = 'Corresponding CRW Table.Column'
            TabOrder = 3
          end
          object Label6: TUniLabel
            Left = 8
            Top = 64
            Width = 131
            Height = 13
            Hint = ''
            Caption = 'Database Tables and Views'
            TabOrder = 4
          end
          object dbeditCorrespond: TUniDBEdit
            Left = 8
            Top = 25
            Width = 313
            Height = 21
            Hint = ''
            DataField = 'CRW_MATCH_COL_NAME'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object TreeAllTables: TUniTreeView
            Left = 8
            Top = 80
            Width = 314
            Height = 217
            Hint = ''
            Items.NodeData = {
              0301000000260000000000000000000000FFFFFFFFFFFFFFFF00000000000000
              00000000000104490051004D005300}
            Items.FontData = {0101000000FFFFFFFF00000000}
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Color = clWindow
            OnDblClick = treeCurrentDblClick
            OnMouseDown = treeCurrentMouseDown
          end
        end
        object pnlBottom1: TUniPanel
          Left = 0
          Top = 300
          Width = 539
          Height = 26
          Hint = ''
          Align = alBottom
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 2
          Caption = ''
          object dbchkDisablePrintBtn: TUniDBCheckBox
            Left = 4
            Top = 1
            Width = 126
            Height = 17
            Hint = 'Disable '#39'Print'#39' button when '#39'Current Record'#39' is defined'
            ShowHint = True
            ParentShowHint = False
            DataField = 'DISABLE_PRINT'
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Disable '#39'Print'#39' button'
            TabOrder = 0
          end
        end
      end
      object TabSheet3: TUniTabSheet
        Hint = ''
        Caption = 'Selection Criteria'
        object Panel2: TUniPanel
          Left = 0
          Top = 0
          Width = 539
          Height = 326
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = 'Panel2'
          object Bevel2: TUniPanel
            Left = 1
            Top = 27
            Width = 537
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = ''
          end
          object DBGrid1: TUniDBGrid
            Left = 1
            Top = 30
            Width = 537
            Height = 296
            Hint = ''
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgTabs, dgCancelOnExit]
            LoadMask.Message = 'Loading data...'
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Columns = <
              item
                FieldName = 'SEQ'
                Title.Caption = '#'
                Width = 17
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Param Label'
                Width = 86
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CRW_COL_NAME'
                Title.Caption = 'CRW Table.Column'
                Width = 150
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'UNARY_OPERATOR'
                Title.Caption = '= ?'
                Width = 64
                PickList.Strings = (
                  '='
                  'NOT')
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'RANGE_START'
                Title.Caption = 'From'
                Width = 48
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'RANGE_END'
                Title.Caption = 'To'
                Width = 48
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'BINARY_OPERATOR'
                Title.Caption = 'And/Or'
                Width = 41
                PickList.Strings = (
                  'AND'
                  'OR')
                CheckBoxField.FieldValues = 'true;false'
              end>
          end
          object Panel3: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 537
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Caption = ''
            object DBNavigator1: TUniDBNavigator
              Left = 412
              Top = 1
              Width = 125
              Height = 25
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
        end
      end
      object TabSheet4: TUniTabSheet
        Hint = ''
        Caption = 'Formulas'
        object Panel4: TUniPanel
          Left = 0
          Top = 0
          Width = 539
          Height = 326
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = 'Panel4'
          object Bevel3: TUniPanel
            Left = 1
            Top = 27
            Width = 537
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = ''
          end
          object DBGrid2: TUniDBGrid
            Left = 1
            Top = 30
            Width = 537
            Height = 296
            Hint = ''
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgTabs, dgCancelOnExit]
            LoadMask.Message = 'Loading data...'
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Columns = <
              item
                FieldName = 'SEQ'
                Title.Caption = '# '
                Width = 17
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'LABEL_TEXT'
                Title.Caption = 'LABEL_TEXT'
                Width = 112
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'FORM_NAME'
                Title.Caption = 'FORM_NAME'
                Width = 134
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'FORM_TYPE'
                Title.Caption = 'Var Type'
                Width = 75
                PickList.Strings = (
                  'NUMBER'
                  'CHAR'
                  'DATE')
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'FORM_VALUE'
                Title.Caption = 'Init Value'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'FUNC_NAME'
                Title.Caption = 'Function Name'
                Width = 230
                PickList.Strings = (
                  'REP_DEF_GET_GLPERIOD'
                  'REP_DEF_GET_PR_EMP_EARNINGS_DATE'
                  'REP_DEF_USER_NAME'
                  'REP_DEF_PROJECT_SECURITY')
                CheckBoxField.FieldValues = 'true;false'
              end>
          end
          object Panel5: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 537
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Caption = ''
            object DBNavigator3: TUniDBNavigator
              Left = 412
              Top = 1
              Width = 125
              Height = 25
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object Panel6: TUniPanel
    Left = 0
    Top = 359
    Width = 549
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel7: TUniPanel
      Left = 341
      Top = 1
      Width = 208
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 103
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object QryAllTables: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select object_name'
      ' from all_objects'
      'where owner = '#39'IQMS'#39
      'and object_type in ('#39'TABLE'#39', '#39'VIEW'#39')'
      'order by object_name')
    Left = 42
    Top = 196
  end
  object QryAllProcs: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct object_name'
      '  from all_arguments'
      ' where '
      '       owner = '#39'IQMS'#39
      '   and package_name = '#39'CRW_BEFORE_EXEC'#39
      ' order by '
      '       object_name'
      ''
      '--select object_name'
      '-- from all_objects'
      '--where owner = '#39'IQMS'#39
      '--and object_type = '#39'PROCEDURE'#39
      '--order by object_name'
      ''
      ''
      '')
    Left = 12
    Top = 196
  end
  object SrcAllProcs: TDataSource
    DataSet = QryAllProcs
    Left = 101
    Top = 249
  end
  object QryFields: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select column_name'
      'from all_tab_columns'
      'where owner = '#39'IQMS'#39
      'and table_name = :name'
      'order by column_name')
    Left = 73
    Top = 196
    ParamData = <
      item
        Name = 'name'
      end>
  end
  object QryMfgType: TFDQuery
    Tag = 1
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select rtrim(mfgtype) as mfgtype from mfgtype order by mfgtype')
    Left = 14
    Top = 240
    object QryMfgTypeMFGTYPE: TStringField
      DisplayLabel = 'MfgType'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Origin = 'IQ.MFGTYPE.MFGTYPE'
      FixedChar = True
      Size = 10
    end
  end
  object popmSelectCriteria: TUniPopupMenu
    OnPopup = popmSelectCriteriaPopup
    Left = 12
    Top = 275
    object DefinePickistOptionalColumns1: TUniMenuItem
      Caption = 'Define Pickist Optional Columns'
      OnClick = DefinePickistOptionalColumns1Click
    end
  end
  object PkUser: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select a.username  as username,'
      '       s.eplant_id as eplant_id'
      '  from all_users a,'
      '       s_user_general s'
      ' where not a.username in ('#39'SYS'#39', '#39'SYSTEM'#39', '#39'IQMS'#39', '#39'RTBOX'#39')'
      '   and RTrim(a.username) = RTrim(s.user_name(+))'
      'order by a.username')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 12
    Top = 308
    object PkUserUSERNAME: TStringField
      DisplayLabel = 'User Name'
      FieldName = 'USERNAME'
      Size = 128
    end
  end
end
