object FrmSecurityGroups: TFrmSecurityGroups
  Left = 304
  Top = 195
  HelpContext = 1039305
  ClientHeight = 442
  ClientWidth = 698
  Caption = 'Groups'
  OnShow = FormShow
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 461
    Top = 0
    Width = 4
    Height = 442
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object pnlLeftMain: TUniPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 442
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 0
      Top = 229
      Width = 461
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object pnlGroupsTop: TUniPanel
      Left = 1
      Top = 1
      Width = 459
      Height = 229
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Panel5: TUniPanel
        Left = 1
        Top = 1
        Width = 457
        Height = 27
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
          Hint = 'Search Group'
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
        object NavGroup: TUniDBNavigator
          Left = 217
          Top = 1
          Width = 240
          Height = 25
          Hint = ''
          DataSource = SrcGroup
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object wwDBGridGroups: TIQUniGridControl
        Left = 1
        Top = 49
        Width = 457
        Height = 180
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 240
        IQComponents.Grid.Height = 94
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcGroup
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
        IQComponents.Navigator.DataSource = SrcGroup
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 240
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 94
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcGroup
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
            Width = 238
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object Panel11: TUniPanel
        Tag = 1999
        Left = 1
        Top = 27
        Width = 457
        Height = 22
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = 'Security Groups'
        Color = clGray
      end
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 232
      Width = 459
      Height = 210
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter3: TUniSplitter
        Left = 224
        Top = 0
        Width = 5
        Height = 210
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object pnlAssignedRoles: TUniPanel
        Left = 1
        Top = 1
        Width = 224
        Height = 208
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Panel14: TUniPanel
          Tag = 1999
          Left = 1
          Top = 27
          Width = 222
          Height = 22
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 0
          Caption = 'Assigned Roles'
          Color = clGray
        end
        object Panel9: TUniPanel
          Left = 1
          Top = 1
          Width = 222
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object NavGroupRoles: TUniDBNavigator
            Left = 72
            Top = 1
            Width = 150
            Height = 25
            Hint = ''
            DataSource = SrcGroupRoles
            VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
        object wwDBGridRoles: TIQUniGridControl
          Left = 1
          Top = 49
          Width = 222
          Height = 159
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 2
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 5
          IQComponents.Grid.Height = 73
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcGroupRoles
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
          IQComponents.Navigator.DataSource = SrcGroupRoles
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 5
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 73
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcGroupRoles
          Columns = <
            item
              FieldName = 'GRANTED_ROLE_NAME'
              Title.Caption = 'Role Name'
              Width = 217
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object wwDBComboDlgRoleName: TUniEdit
          Left = 16
          Top = 86
          Width = 185
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 3
        end
      end
      object Panel7: TUniPanel
        Left = 229
        Top = 1
        Width = 230
        Height = 208
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Panel8: TUniPanel
          Tag = 1999
          Left = 1
          Top = 27
          Width = 228
          Height = 22
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 0
          Caption = 'Assigned Subgroups'
          Color = clGray
        end
        object Panel10: TUniPanel
          Left = 1
          Top = 1
          Width = 228
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object NavSubGroup: TUniDBNavigator
            Left = 103
            Top = 1
            Width = 125
            Height = 25
            Hint = ''
            DataSource = SrcSubGroup
            VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
        object wwDBGridSubGroups: TIQUniGridControl
          Left = 1
          Top = 49
          Width = 228
          Height = 159
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 2
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 11
          IQComponents.Grid.Height = 73
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcSubGroup
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
          IQComponents.Navigator.DataSource = SrcSubGroup
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 11
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 73
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcSubGroup
          Columns = <
            item
              FieldName = 'GrantedGroupName'
              Title.Caption = 'Group Name'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'GrantedGroupDescrip'
              Title.Caption = 'Description'
              Width = 217
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object wwDBComboDlgGroupName: TUniEdit
          Left = 14
          Top = 84
          Width = 183
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 3
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 465
    Top = 0
    Width = 233
    Height = 442
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter4: TUniSplitter
      Left = 0
      Top = 229
      Width = 233
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Panel12: TUniPanel
      Tag = 1999
      Left = 1
      Top = 28
      Width = 231
      Height = 22
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Style = [fsBold]
      TabOrder = 0
      Caption = 'Groups / Roles Overview'
      Color = clGray
    end
    object Panel13: TUniPanel
      Left = 1
      Top = 1
      Width = 231
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
    end
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 232
      Width = 231
      Height = 210
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 14
      IQComponents.Grid.Height = 124
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcOverviewGroups
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
      IQComponents.Navigator.DataSource = SrcOverviewGroups
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 14
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 124
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcOverviewGroups
      Columns = <
        item
          FieldName = 'GROUP_NAME'
          Title.Caption = ' Group Hierarchy'
          Width = 1785
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object pnlGroupOverview: TUniPanel
      Left = 1
      Top = 50
      Width = 231
      Height = 179
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
      object wwDBGrid2: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 229
        Height = 177
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 12
        IQComponents.Grid.Height = 91
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcOverviewRoles
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
        IQComponents.Navigator.DataSource = SrcOverviewRoles
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 12
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 91
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcOverviewRoles
        Columns = <
          item
            FieldName = 'GRANTED_ROLE_NAME'
            Title.Caption = ' Roles Overview'
            Width = 308
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object SrcGroup: TDataSource
    DataSet = QryGroup
    Left = 88
    Top = 85
  end
  object QryGroup: TFDQuery
    BeforePost = QryGroupBeforePost
    AfterPost = ApplyUpdates
    BeforeDelete = QryGroupBeforeDelete
    AfterDelete = ApplyUpdates
    BeforeRefresh = QryGroupBeforeRefresh
    CachedUpdates = True
    ConnectionName = 'IQFD'
    UpdateObject = UpdateSQLGroup
    SQL.Strings = (
      'select id,'
      '       group_name,'
      '       descrip'
      '  from s_group'
      ' order by group_name')
    Left = 87
    Top = 96
    object QryGroupGROUP_NAME: TStringField
      DisplayLabel = 'Group Name'
      DisplayWidth = 35
      FieldName = 'GROUP_NAME'
      Origin = 'IQ.S_GROUP.GROUP_NAME'
      Required = True
      Size = 35
    end
    object QryGroupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 34
      FieldName = 'DESCRIP'
      Origin = 'IQ.S_GROUP.DESCRIP'
      Size = 100
    end
    object QryGroupID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.S_GROUP.ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLGroup: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into s_group'
      '  (ID, GROUP_NAME, DESCRIP)'
      'values'
      '  (:ID, :GROUP_NAME, :DESCRIP)')
    ModifySQL.Strings = (
      'update s_group'
      'set'
      '  ID = :ID,'
      '  GROUP_NAME = :GROUP_NAME,'
      '  DESCRIP = :DESCRIP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from s_group'
      'where'
      '  ID = :OLD_ID')
    Left = 95
    Top = 152
  end
  object MainMenu1: TUniMainMenu
    Left = 300
    Top = 56
    object File1: TUniMenuItem
      Caption = 'File'
      object Close1: TUniMenuItem
        Caption = 'Close'
        OnClick = Close1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmSecurityGroups'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193247 $'
    BuildVersion = '176554'
    Left = 333
    Top = 56
  end
  object PkGroup: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '       group_name,'
      '       descrip'
      '  from s_group')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 315
    Top = 89
    object PkGroupID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.S_GROUP.ID'
      Visible = False
      Size = 0
    end
    object PkGroupGROUP_NAME: TStringField
      DisplayLabel = 'Group Name'
      FieldName = 'GROUP_NAME'
      Origin = 'IQ.S_GROUP.GROUP_NAME'
      Size = 35
    end
    object PkGroupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'IQ.S_GROUP.DESCRIP'
      Size = 100
    end
  end
  object SrcGroupRoles: TDataSource
    DataSet = QryGroupRoles
    Left = 141
    Top = 85
  end
  object QryGroupRoles: TFDQuery
    BeforePost = QryGroupRolesBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnNewRecord = QryGroupRolesNewRecord
    MasterSource = SrcGroup
    MasterFields = 'ID'
    ConnectionName = 'IQFD'
    UpdateObject = UpdateSQLGroupRole
    SQL.Strings = (
      'select id,'
      '       s_group_id,'
      '       granted_role_name'
      '  from s_group_roles'
      ' where s_group_id = :id'
      '   and granted_role_name is not null'
      ' order by granted_role_name'
      '')
    Left = 167
    Top = 356
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryGroupRolesGRANTED_ROLE_NAME: TStringField
      DisplayLabel = 'Role Name'
      DisplayWidth = 31
      FieldName = 'GRANTED_ROLE_NAME'
      Origin = 'IQ.S_GROUP_ROLES.GRANTED_ROLE_NAME'
      Required = True
      Size = 35
    end
    object QryGroupRolesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.S_GROUP_ROLES.ID'
      Visible = False
      Size = 0
    end
    object QryGroupRolesS_GROUP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'S_GROUP_ID'
      Origin = 'IQ.S_GROUP_ROLES.S_GROUP_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLGroupRole: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into s_group_roles'
      '  (ID, S_GROUP_ID, GRANTED_ROLE_NAME)'
      'values'
      '  (:ID, :S_GROUP_ID, :GRANTED_ROLE_NAME)')
    ModifySQL.Strings = (
      'update s_group_roles'
      'set'
      '  ID = :ID,'
      '  S_GROUP_ID = :S_GROUP_ID,'
      '  GRANTED_ROLE_NAME = :GRANTED_ROLE_NAME'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from s_group_roles'
      'where'
      '  ID = :OLD_ID')
    Left = 86
    Top = 369
  end
  object PkRole: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select role_name'
      '  from s_roles')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 347
    Top = 88
    object PkRoleROLE_NAME: TStringField
      DisplayLabel = 'Role Name'
      FieldName = 'ROLE_NAME'
      Origin = 'IQ.S_ROLES.ROLE_NAME'
      Size = 35
    end
  end
  object SrcSubGroup: TDataSource
    DataSet = QrySubGroup
    Left = 190
    Top = 86
  end
  object QrySubGroup: TFDQuery
    BeforePost = QrySubGroupBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnCalcFields = QrySubGroupCalcFields
    OnNewRecord = QryGroupRolesNewRecord
    CachedUpdates = True
    MasterSource = SrcGroup
    MasterFields = 'ID'
    ConnectionName = 'IQFD'
    UpdateObject = UpdateSQLSubGroup
    SQL.Strings = (
      'select id,'
      '       s_group_id,'
      '       granted_s_group_id'
      '  from s_group_roles'
      ' where s_group_id = :id'
      '   and granted_s_group_id is not null'
      ' order by id')
    Left = 188
    Top = 102
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QrySubGroupGrantedGroupName: TStringField
      DisplayLabel = 'Group Name'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'GrantedGroupName'
      Size = 35
      Calculated = True
    end
    object QrySubGroupGrantedGroupDescrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 31
      FieldKind = fkCalculated
      FieldName = 'GrantedGroupDescrip'
      ReadOnly = True
      Size = 100
      Calculated = True
    end
    object QrySubGroupID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.S_GROUP_ROLES.ID'
      Visible = False
      Size = 0
    end
    object QrySubGroupS_GROUP_ID: TBCDField
      FieldName = 'S_GROUP_ID'
      Origin = 'IQ.S_GROUP_ROLES.S_GROUP_ID'
      Visible = False
      Size = 0
    end
    object QrySubGroupGRANTED_S_GROUP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GRANTED_S_GROUP_ID'
      Origin = 'IQ.S_GROUP_ROLES.GRANTED_S_GROUP_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLSubGroup: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into s_group_roles'
      '  (ID, S_GROUP_ID, GRANTED_S_GROUP_ID)'
      'values'
      '  (:ID, :S_GROUP_ID, :GRANTED_S_GROUP_ID)')
    ModifySQL.Strings = (
      'update s_group_roles'
      'set'
      '  ID = :ID,'
      '  S_GROUP_ID = :S_GROUP_ID,'
      '  GRANTED_S_GROUP_ID = :GRANTED_S_GROUP_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from s_group_roles'
      'where'
      '  ID = :OLD_ID')
    Left = 189
    Top = 115
  end
  object SrcOverviewGroups: TDataSource
    DataSet = QryOverviewGroups
    Left = 234
    Top = 87
  end
  object QryOverviewGroups: TFDQuery
    MasterSource = SrcGroup
    MasterFields = 'ID'
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      
        '       substrB(iqeval.substrW63Max( group_name, 1, 255), 1, 255)' +
        ' as group_name'
      '  from'
      '       ( select id,'
      '                group_name'
      '           from s_group '
      '          where id = :id'
      '          '
      '       UNION ALL'
      '       '
      '         select x.granted_s_group_id as id,'
      
        '                substr(lpad('#39' '#39', level * 5) || g.group_name, 1, ' +
        '255) as granted_group_disp'
      '           from '
      '                s_group_roles x, '
      '                s_group g'
      '          where '
      '                x.granted_s_group_id = g.id'
      '          start '
      '                with s_group_id = :id'
      '         connect by '
      '                x.s_group_id = prior x.granted_s_group_id )'
      '')
    Left = 234
    Top = 105
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryOverviewGroupsGROUP_NAME: TStringField
      DisplayLabel = ' Group Hierarchy'
      DisplayWidth = 60
      FieldName = 'GROUP_NAME'
      Size = 255
    end
    object QryOverviewGroupsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcOverviewRoles: TDataSource
    DataSet = QryOverviewRoles
    Left = 275
    Top = 88
  end
  object QryOverviewRoles: TFDQuery
    MasterSource = SrcGroup
    MasterFields = 'ID'
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct s_group_roles.granted_role_name'
      '  from '
      '       s_group_roles,'
      ''
      '       ( select :id as granted_s_group_id from dual'
      '          UNION '
      '         select granted_s_group_id'
      '           from s_group_roles'
      '          where granted_s_group_id is not null'
      '          start with s_group_id = :id'
      '        connect by s_group_id = prior granted_s_group_id ) x'
      '    '
      ' where x.granted_s_group_id = s_group_roles.s_group_id'
      '   and granted_role_name is not null'
      ''
      'order by s_group_roles.granted_role_name   '
      '')
    Left = 276
    Top = 105
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryOverviewRolesGRANTED_ROLE_NAME: TStringField
      DisplayLabel = ' Roles Overview'
      DisplayWidth = 44
      FieldName = 'GRANTED_ROLE_NAME'
      Size = 35
    end
  end
  object popmGroupOverview: TUniPopupMenu
    Left = 367
    Top = 57
    object GotoGroup1: TUniMenuItem
      Caption = 'Go to Group'
      OnClick = GotoGroup1Click
    end
  end
  object popmGroups: TUniPopupMenu
    OnPopup = popmGroupsPopup
    Left = 400
    Top = 56
    object AssignedUser1: TUniMenuItem
      Caption = 'Assigned User'
      OnClick = AssignedUser1Click
    end
    object CloneGroup1: TUniMenuItem
      Caption = 'Clone Group'
      OnClick = CloneGroup1Click
    end
  end
end
