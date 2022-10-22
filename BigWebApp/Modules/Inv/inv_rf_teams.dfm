object FrmInvRFTeams: TFrmInvRFTeams
  Left = 0
  Top = 0
  HelpContext = 25736
  ClientHeight = 454
  ClientWidth = 536
  Caption = 'WMS Teams'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 149
    Width = 536
    Height = 5
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 536
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
    object NavMain: TUniDBNavigator
      Left = 296
      Top = 1
      Width = 240
      Height = 26
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcRFTeam
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 28
    Width = 536
    Height = 121
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object pgctrlMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 534
      Height = 119
      Hint = ''
      ActivePage = tabForm
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tabForm: TUniTabSheet
        Hint = ''
        Caption = 'tabForm'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object pnlForm: TUniPanel
          Left = 0
          Top = 0
          Width = 526
          Height = 91
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter3: TUniSplitter
            Left = 255
            Top = 0
            Width = 6
            Height = 91
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object Panel7: TUniPanel
            Left = 1
            Top = 1
            Width = 255
            Height = 89
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter2: TUniSplitter
              Left = 101
              Top = 0
              Width = 6
              Height = 89
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object Panel8: TUniPanel
              Left = 1
              Top = 1
              Width = 101
              Height = 87
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label1: TUniLabel
                Left = 8
                Top = 7
                Width = 54
                Height = 13
                Hint = ''
                Caption = 'Team Code'
                TabOrder = 1
              end
              object Label2: TUniLabel
                Left = 8
                Top = 31
                Width = 53
                Height = 13
                Hint = ''
                Caption = 'Description'
                TabOrder = 2
              end
              object Label3: TUniLabel
                Left = 8
                Top = 55
                Width = 53
                Height = 13
                Hint = ''
                Caption = 'Team Type'
                TabOrder = 3
              end
            end
            object Panel9: TUniPanel
              Left = 107
              Top = 1
              Width = 148
              Height = 87
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                148
                87)
              object dbeItemNo: TUniDBEdit
                Left = 1
                Top = 4
                Width = 145
                Height = 21
                Hint = ''
                DataField = 'CODE'
                DataSource = SrcRFTeam
                CharCase = ecUpperCase
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
              object dbeDescrip: TUniDBEdit
                Left = 1
                Top = 28
                Width = 145
                Height = 21
                Hint = ''
                DataField = 'DESCRIP'
                DataSource = SrcRFTeam
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
              end
              object wwDBComboBoxFormTeamType: TUniDBComboBox
                Left = 1
                Top = 52
                Width = 145
                Height = 21
                Hint = ''
                Anchors = [akLeft, akTop, akRight]
                DataField = 'TYPE'
                DataSource = SrcRFTeam
                Style = csDropDownList
                Items.Strings = (
                  'Cycle Counting'#9'CC'
                  'RF Directed'#9'DR'
                  'Task Interleaving'#9'TI'
                  'Picking'#9'PK'
                  'Receiving'#9'RC'
                  'Material Staging'#9'ST')
                TabOrder = 2
              end
            end
          end
          object Panel10: TUniPanel
            Left = 261
            Top = 1
            Width = 265
            Height = 89
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitLeft = 258
            ExplicitWidth = 270
            object Splitter4: TUniSplitter
              Left = 81
              Top = 0
              Width = 6
              Height = 89
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object Panel11: TUniPanel
              Left = 1
              Top = 1
              Width = 81
              Height = 87
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label5: TUniLabel
                Left = 8
                Top = 7
                Width = 30
                Height = 13
                Hint = ''
                Caption = 'EPlant'
                TabOrder = 1
              end
              object lblDivision: TUniLabel
                Left = 8
                Top = 31
                Width = 36
                Height = 13
                Hint = ''
                Caption = 'Division'
                TabOrder = 2
              end
            end
            object Panel12: TUniPanel
              Left = 87
              Top = 1
              Width = 178
              Height = 87
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                178
                87)
              object wwDBComboDlgEplant: TUniEdit
                Left = 1
                Top = 4
                Width = 176
                Height = 21
                Hint = ''
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Color = clBtnFace
                ReadOnly = True
              end
              object wwDBLookupComboDiv: TUniDBLookupComboBox
                Left = 1
                Top = 28
                Width = 176
                Height = 21
                Hint = ''
                ListFieldIndex = 0
                DataField = 'DIVISION_ID'
                DataSource = SrcRFTeam
                Anchors = [akLeft, akTop, akRight]
                TabStop = False
                TabOrder = 1
                Color = clBtnFace
                MatchFieldWidth = False
              end
            end
          end
        end
      end
      object tabGrid: TUniTabSheet
        Hint = ''
        TabVisible = False
        ImageIndex = 1
        Caption = 'tabGrid'
        object gridTeam: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 526
          Height = 91
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 309
          IQComponents.Grid.Height = 5
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcRFTeam
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
          IQComponents.Navigator.DataSource = SrcRFTeam
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 309
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 5
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcRFTeam
          Columns = <
            item
              FieldName = 'CODE'
              Title.Caption = 'Team Code'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 252
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'TYPE'
              Title.Caption = 'Team Type'
              Width = 147
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object wwDBComboBoxTeamType: TUniDBComboBox
          Left = 128
          Top = 3
          Width = 121
          Height = 21
          Hint = ''
          Style = csDropDownList
          Items.Strings = (
            'Cycle Counting'#9'CC'
            'Returns Check-in'#9'CI'
            'Dock Confirmation'#9'DC'
            'RF Directed'#9'DR'
            'Task Interleaving'#9'TI'
            'Inventory Management'#9'IM'
            'Picking'#9'PK')
          TabOrder = 1
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 154
    Width = 536
    Height = 300
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 534
      Height = 298
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object pgctrlDetails: TUniPageControl
        Left = 1
        Top = 1
        Width = 532
        Height = 296
        Hint = ''
        ActivePage = TabSheet2
        TabBarVisible = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabSheet1: TUniTabSheet
          Hint = ''
          Caption = 'Assigned Users'
          object Panel4: TUniPanel
            Left = 0
            Top = 0
            Width = 524
            Height = 28
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            object NavUsers: TUniDBNavigator
              Left = 341
              Top = 1
              Width = 183
              Height = 26
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataSource = SrcUsers
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object gridUsers: TIQUniGridControl
            Left = 0
            Top = 28
            Width = 524
            Height = 240
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 307
            IQComponents.Grid.Height = 154
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcUsers
            IQComponents.Grid.LoadMask.Message = 'Loading data...'
            IQComponents.Grid.Align = alClient
            IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
            IQComponents.Grid.TabOrder = 0
            IQComponents.Grid.OnDrawColumnCell = gridUsersDBGridDrawColumnCell
            IQComponents.Navigator.Left = 410
            IQComponents.Navigator.Top = 0
            IQComponents.Navigator.Width = 241
            IQComponents.Navigator.Height = 25
            IQComponents.Navigator.Hint = ''
            IQComponents.Navigator.Visible = False
            IQComponents.Navigator.ShowHint = True
            IQComponents.Navigator.DataSource = SrcUsers
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 307
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 154
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcUsers
            Columns = <
              item
                FieldName = 'USER_NAME'
                Title.Caption = 'User Name'
                Width = 196
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'EPLANT_NAME'
                Title.Caption = 'EPlant'
                Width = 154
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
        end
        object TabSheet2: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'Work Zones'
          object Panel6: TUniPanel
            Left = 0
            Top = 0
            Width = 524
            Height = 28
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            object NavZones: TUniDBNavigator
              Left = 341
              Top = 1
              Width = 183
              Height = 26
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataSource = SrcTeamZone
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object gridTeamZones: TIQUniGridControl
            Left = 0
            Top = 28
            Width = 524
            Height = 240
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 307
            IQComponents.Grid.Height = 154
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcTeamZone
            IQComponents.Grid.LoadMask.Message = 'Loading data...'
            IQComponents.Grid.Align = alClient
            IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
            IQComponents.Grid.TabOrder = 0
            IQComponents.Navigator.Left = 410
            IQComponents.Navigator.Top = 0
            IQComponents.Navigator.Width = 241
            IQComponents.Navigator.Height = 25
            IQComponents.Navigator.Hint = ''
            IQComponents.Navigator.Visible = False
            IQComponents.Navigator.ShowHint = True
            IQComponents.Navigator.DataSource = SrcTeamZone
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 307
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 154
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcTeamZone
            Columns = <
              item
                FieldName = 'ZONE_CODE'
                Title.Caption = 'Zone Code'
                Width = 119
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ZONE_DESCRIP'
                Title.Caption = 'Zone Description'
                Width = 189
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'EPLANT_NAME'
                Title.Caption = 'EPlant'
                Width = 119
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DIVISION_NAME'
                Title.Caption = 'Division'
                Width = 119
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
        end
        object TabSheet3: TUniTabSheet
          Hint = ''
          ImageIndex = 2
          Caption = 'Team Equipment'
          object Panel13: TUniPanel
            Left = 0
            Top = 0
            Width = 524
            Height = 28
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            object NavEqmt: TUniDBNavigator
              Left = 341
              Top = 1
              Width = 183
              Height = 26
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataSource = SrcTeamEqmt
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object gridTeamEqmt: TIQUniGridControl
            Left = 0
            Top = 28
            Width = 524
            Height = 240
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 307
            IQComponents.Grid.Height = 154
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcTeamEqmt
            IQComponents.Grid.LoadMask.Message = 'Loading data...'
            IQComponents.Grid.Align = alClient
            IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
            IQComponents.Grid.TabOrder = 0
            IQComponents.Navigator.Left = 410
            IQComponents.Navigator.Top = 0
            IQComponents.Navigator.Width = 241
            IQComponents.Navigator.Height = 25
            IQComponents.Navigator.Hint = ''
            IQComponents.Navigator.Visible = False
            IQComponents.Navigator.ShowHint = True
            IQComponents.Navigator.DataSource = SrcTeamEqmt
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 307
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 154
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.Enabled = False
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcTeamEqmt
            Columns = <
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Equipment Description'
                Width = 238
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'EPLANT_NAME'
                Title.Caption = 'EPlant'
                Width = 175
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DIVISION_NAME'
                Title.Caption = 'Division'
                Width = 147
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
        end
      end
    end
  end
  object SrcRFTeam: TDataSource
    DataSet = QryRFTeam
    Left = 48
    Top = 312
  end
  object QryRFTeam: TFDQuery
    BeforePost = QryRFTeamBeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    OnCalcFields = QryRFTeamCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'RF_TEAM'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLRFTeam
    SQL.Strings = (
      'select id,'
      '       code,'
      '       descrip,'
      '       type,'
      '       eplant_id,'
      '       division_id'
      '  from rf_team'
      ' order by '
      '       code')
    Left = 48
    Top = 340
    object QryRFTeamCODE: TStringField
      DisplayLabel = 'Team Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'IQ.RF_TEAM.CODE'
      Required = True
      Size = 10
    end
    object QryRFTeamDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'IQ.RF_TEAM.DESCRIP'
      Size = 50
    end
    object QryRFTeamTYPE: TStringField
      DisplayLabel = 'Team Type'
      DisplayWidth = 10
      FieldName = 'TYPE'
      Origin = 'IQ.RF_TEAM.TYPE'
      Size = 10
    end
    object QryRFTeamEplantDisp: TStringField
      FieldKind = fkCalculated
      FieldName = 'EplantDisp'
      Size = 30
      Calculated = True
    end
    object QryRFTeamID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryRFTeamEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object QryRFTeamDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Origin = 'DIVISION_ID'
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQLRFTeam: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into rf_team'
      '  (ID, CODE, DESCRIP, TYPE, EPLANT_ID, DIVISION_ID)'
      'values'
      '  (:ID, :CODE, :DESCRIP, :TYPE, :EPLANT_ID, :DIVISION_ID)')
    ModifySQL.Strings = (
      'update rf_team'
      'set'
      '  ID = :ID,'
      '  CODE = :CODE,'
      '  DESCRIP = :DESCRIP,'
      '  TYPE = :TYPE,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  DIVISION_ID = :DIVISION_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from rf_team'
      'where'
      '  ID = :OLD_ID')
    Left = 48
    Top = 368
  end
  object MainMenu1: TUniMainMenu
    Left = 408
    Top = 256
    object File1: TUniMenuItem
      Caption = 'File'
      object WMSEquipment1: TUniMenuItem
        Caption = 'WMS Equipment'
        OnClick = WMSEquipment1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
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
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmInvRFTeams'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195458 $'
    BuildVersion = '176554'
    Left = 352
    Top = 256
  end
  object PkRFTeam: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select t.id as id, '
      '       t.code as code,'
      '       t.descrip as descrip,'
      '       case t.type '
      '         when '#39'CC'#39' then '#39'Cycle Counting'#39
      '         when '#39'DR'#39' then '#39'RF Directed'#39
      '         when '#39'TI'#39' then '#39'Task Interleaving'#39
      '         when '#39'PK'#39' then '#39'Picking'#39
      '         when '#39'RC'#39' then '#39'Receiving'#39
      '         when '#39'ST'#39' then '#39'Material Staging'#39
      '       end as type,'
      '       eplant.name as eplant_name,'
      '       div.name as division_name'
      '  from rf_team t,'
      '       eplant,'
      '       division div'
      ' where t.eplant_id = eplant.id(+)'
      '   and t.division_id = div.id(+)       '
      '')
    OnIQModify = PkRFTeamIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 236
    Top = 312
    object PkRFTeamID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object PkRFTeamCODE: TStringField
      DisplayLabel = 'Team Code'
      FieldName = 'CODE'
      Size = 10
    end
    object PkRFTeamDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkRFTeamTYPE: TStringField
      DisplayLabel = 'Team Type'
      FieldName = 'TYPE'
    end
    object PkRFTeamEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 20
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object PkRFTeamDIVISION_NAME: TStringField
      DisplayLabel = 'Division Name'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
  end
  object PkInvZone: TIQWebHpick
    BeforeOpen = AssignEplantDivisionFIlter
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id as id, '
      '       a.code as code, '
      '       a.descrip as descrip,'
      '       a.zone_type as zone_type,'
      '       e.name as eplant_name,'
      '       div.name as division_name'
      '  from inv_zone a,'
      '       eplant e,'
      '       division div '
      ' where '
      '       ( :division_id = 0'
      '         or'
      '         :division_id = a.division_id)'
      '   and ( :eplant_id = 0'
      '         or'
      '         :eplant_id = a.eplant_id )'
      '   and a.eplant_id = e.id(+)'
      '   and a.division_id = div.id(+)  '
      '   and a.zone_type = '#39'WK'#39
      '   ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 296
    Top = 312
    ParamData = <
      item
        Name = 'division_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'eplant_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkInvZoneID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkInvZoneCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'a.code'
      Size = 25
    end
    object PkInvZoneDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object PkInvZoneZONE_TYPE: TStringField
      DisplayLabel = 'Zone Type'
      FieldName = 'ZONE_TYPE'
      Origin = 'a.zone_type'
      Size = 2
    end
    object PkInvZoneEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      FieldName = 'EPLANT_NAME'
      Origin = 'e.name'
      Size = 30
    end
    object PkInvZoneDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Origin = 'div.name'
      Size = 25
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryRFTeam'
      'NavMain'
      'NavUsers'
      'WMSEquipment1')
    SecurityCode = 'FRMINVRFTEAMS'
    Left = 380
    Top = 256
  end
  object SrcUsers: TDataSource
    DataSet = QryUsers
    Left = 92
    Top = 312
  end
  object QryUsers: TFDQuery
    CachedUpdates = True
    MasterSource = SrcRFTeam
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select s.user_name, '
      
        '       decode( e.id, null, null, '#39'['#39' ||e.id || '#39'] '#39' || e.name) a' +
        's eplant_name'
      '  from '
      '       s_user_general s,'
      '       eplant e'
      ' where '
      '       s.rf_team_id = :id'
      '   and s.eplant_id = e.id(+)'
      ' order by s.user_name  ')
    Left = 92
    Top = 340
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryUsersUSER_NAME: TStringField
      DisplayLabel = 'User Name'
      DisplayWidth = 36
      FieldName = 'USER_NAME'
      Size = 35
    end
    object QryUsersEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 44
      FieldName = 'EPLANT_NAME'
      Size = 73
    end
  end
  object PkUser: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.username, '
      
        '       decode( e.id, null, null, '#39'['#39' ||e.id || '#39'] '#39' || e.name) a' +
        's eplant_name,'
      '       t.code as team_code,'
      '       s.rf_team_id as rf_team_id'
      '  from v_iqusers_ex  a,'
      '       s_user_general s,'
      '       eplant e,'
      '       dba_users u,      '
      '       (select distinct grantee'
      '          from dba_role_privs '
      '         where granted_role = '#39'DBA'#39' ) x,'
      '       rf_team t  '
      'where RTrim(a.username) = RTrim(s.user_name(+))'
      '   and a.username = u.username'
      '   and u.username = x.grantee(+)'
      '   and not a.username in ( '#39'SYS'#39', '#39'SYSTEM'#39' )'
      '   and s.eplant_id = e.id(+)'
      '       /* current team */'
      '   and s.rf_team_id = t.id(+)    '
      '   '
      '')
    OnIQAfterHPickCreate = PkUserIQAfterHPickCreate
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 266
    Top = 312
    object PkUserUSERNAME: TStringField
      DisplayLabel = 'User Name'
      FieldName = 'USERNAME'
      Origin = 'a.username'
      Size = 30
    end
    object PkUserTEAM_CODE: TStringField
      DisplayLabel = 'WMS Team'
      DisplayWidth = 30
      FieldName = 'TEAM_CODE'
      Origin = 't.code'
      Size = 10
    end
    object PkUserEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 20
      FieldName = 'EPLANT_NAME'
      Origin = 'decode( e.id, null, null, '#39'['#39' ||e.id || '#39'] '#39' || e.name) '
      Size = 73
    end
    object PkUserRF_TEAM_ID: TBCDField
      FieldName = 'RF_TEAM_ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryDivisionLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.id, '
      '       d.name,'
      '       e.name as eplant_name'
      '  from division d,'
      '       eplant e'
      ' where d.eplant_id = e.id(+)'
      ' ')
    Left = 272
    Top = 387
    object wwQryDivisionLookupNAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 15
      FieldName = 'NAME'
      Size = 25
    end
    object wwQryDivisionLookupEPLANT_NAME: TStringField
      DisplayLabel = 'Division EPlant'
      DisplayWidth = 15
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object wwQryDivisionLookupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object QryTeamZone: TFDQuery
    CachedUpdates = True
    MasterSource = SrcRFTeam
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id as id,'
      '       a.rf_team_id as rf_team_id,'
      '       a.inv_zone_id as inv_zone_id,'
      '       b.code as zone_code,'
      '       b.descrip as zone_descrip,'
      
        '       decode( e.id, null, null, '#39'['#39' ||e.id || '#39'] '#39' || e.name) a' +
        's eplant_name,'
      '       d.name as division_name'
      '  from rf_team_zone a,'
      '       inv_zone b,'
      '       eplant e,'
      '       division d'
      ' where a.rf_team_id = :id'
      '   and a.inv_zone_id = b.id'
      '   and b.eplant_id = e.id(+)'
      '   and b.division_id = d.id(+)'
      ' order by  b.code ')
    Left = 132
    Top = 340
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryTeamZoneZONE_CODE: TStringField
      DisplayLabel = 'Zone Code'
      DisplayWidth = 17
      FieldName = 'ZONE_CODE'
      Origin = 'b.code'
      Size = 25
    end
    object QryTeamZoneZONE_DESCRIP: TStringField
      DisplayLabel = 'Zone Description'
      DisplayWidth = 27
      FieldName = 'ZONE_DESCRIP'
      Origin = 'b.descrip'
      Size = 100
    end
    object QryTeamZoneEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 17
      FieldName = 'EPLANT_NAME'
      Origin = 'decode( e.id, null, null, '#39'['#39' ||e.id || '#39'] '#39' || e.name) '
      Size = 73
    end
    object QryTeamZoneDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 17
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object QryTeamZoneID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTeamZoneRF_TEAM_ID: TBCDField
      FieldName = 'RF_TEAM_ID'
      Origin = 'RF_TEAM_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTeamZoneINV_ZONE_ID: TBCDField
      FieldName = 'INV_ZONE_ID'
      Origin = 'INV_ZONE_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcTeamZone: TDataSource
    DataSet = QryTeamZone
    Left = 132
    Top = 312
  end
  object SrcTeamEqmt: TDataSource
    DataSet = QryTeamEqmt
    Left = 172
    Top = 312
  end
  object QryTeamEqmt: TFDQuery
    CachedUpdates = True
    MasterSource = SrcRFTeam
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id,'
      '       a.rf_team_id,'
      '       a.wms_eqmt_id,'
      '       b.descrip,'
      
        '       decode( e.id, null, null, '#39'['#39' ||e.id || '#39'] '#39' || e.name) a' +
        's eplant_name,'
      '       d.name as division_name'
      '  from rf_team_eqmt a,'
      '       wms_eqmt b,'
      '       eplant e,'
      '       division d'
      ' where a.rf_team_id = :id'
      '   and a.wms_eqmt_id = b.id'
      '   and b.eplant_id = e.id(+)'
      '   and b.division_id = d.id(+)'
      'order by b.descrip'
      '')
    Left = 172
    Top = 340
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryTeamEqmtDESCRIP: TStringField
      DisplayLabel = 'Equipment Description'
      DisplayWidth = 34
      FieldName = 'DESCRIP'
      Origin = 'IQ.WMS_EQMT.DESCRIP'
      Size = 50
    end
    object QryTeamEqmtEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 25
      FieldName = 'EPLANT_NAME'
      Size = 73
    end
    object QryTeamEqmtDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 21
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
    object QryTeamEqmtID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTeamEqmtRF_TEAM_ID: TBCDField
      FieldName = 'RF_TEAM_ID'
      Origin = 'RF_TEAM_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTeamEqmtWMS_EQMT_ID: TBCDField
      FieldName = 'WMS_EQMT_ID'
      Origin = 'WMS_EQMT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object PkWmsEquip: TIQWebHpick
    BeforeOpen = AssignEplantDivisionFIlter
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id as id, '
      '       a.descrip as descrip,'
      '       e.name as eplant_name,'
      '       div.name as division_name'
      '       '
      '  from wms_eqmt a,'
      '       eplant e,'
      '       division div '
      ' where '
      '       ( :division_id = 0'
      '         or'
      '         :division_id = a.division_id)'
      '   and ( :eplant_id = 0'
      '         or'
      '         :eplant_id = a.eplant_id )'
      '   and a.eplant_id = e.id(+)'
      '   and a.division_id = div.id(+)      ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 328
    Top = 312
    ParamData = <
      item
        Name = 'division_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'eplant_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkWmsEquipID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object PkWmsEquipDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 50
    end
    object PkWmsEquipEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      FieldName = 'EPLANT_NAME'
      Origin = 'e.name'
      Size = 30
    end
    object PkWmsEquipDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Origin = 'div.name'
      Size = 25
    end
  end
  object SrcQryDivisionLookup: TDataSource
    DataSet = wwQryDivisionLookup
    Left = 276
    Top = 360
  end
end
