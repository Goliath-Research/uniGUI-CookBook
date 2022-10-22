object FrmInvAisleLocationGenerator: TFrmInvAisleLocationGenerator
  Left = 0
  Top = 0
  HelpContext = 25741
  ClientHeight = 566
  ClientWidth = 857
  Caption = 'Aisle Location Generator'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 28
    Width = 857
    Height = 493
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 367
      Top = 0
      Width = 5
      Height = 493
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = 16250871
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 367
      Height = 491
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel5: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 361
        Height = 483
        Hint = ''
        Margins.Top = 5
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitHeight = 485
        object Splitter2: TUniSplitter
          Left = 94
          Top = 0
          Width = 5
          Height = 483
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = 16250871
        end
        object Panel6: TUniPanel
          Left = 1
          Top = 1
          Width = 94
          Height = 481
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Panel11: TUniPanel
            Left = 1
            Top = 1
            Width = 92
            Height = 79
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            object Label10: TUniLabel
              Left = 8
              Top = 4
              Width = 52
              Height = 13
              Hint = ''
              Caption = 'Aisle Name'
              TabOrder = 1
            end
            object lblDivision: TUniLabel
              Left = 8
              Top = 52
              Width = 36
              Height = 13
              Hint = ''
              Caption = 'Division'
              TabOrder = 2
            end
            object Label5: TUniLabel
              Left = 8
              Top = 28
              Width = 30
              Height = 13
              Hint = ''
              Caption = 'EPlant'
              TabOrder = 3
            end
          end
          object Panel13: TUniPanel
            Left = 1
            Top = 79
            Width = 92
            Height = 204
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Caption = ''
            object Label11: TUniLabel
              Left = 8
              Top = 9
              Width = 49
              Height = 13
              Hint = ''
              Caption = 'Bay Prefix'
              TabOrder = 1
            end
            object Label12: TUniLabel
              Left = 8
              Top = 105
              Width = 56
              Height = 13
              Hint = ''
              Caption = 'Level Prefix'
              TabOrder = 2
            end
            object Label13: TUniLabel
              Left = 26
              Top = 129
              Width = 24
              Height = 13
              Hint = ''
              Caption = 'Start'
              TabOrder = 3
            end
            object Label14: TUniLabel
              Left = 26
              Top = 153
              Width = 18
              Height = 13
              Hint = ''
              Caption = 'End'
              TabOrder = 4
            end
            object Label15: TUniLabel
              Left = 26
              Top = 177
              Width = 38
              Height = 13
              Hint = ''
              Caption = 'Interval'
              TabOrder = 5
            end
            object Label16: TUniLabel
              Left = 26
              Top = 33
              Width = 24
              Height = 13
              Hint = ''
              Caption = 'Start'
              TabOrder = 6
            end
            object Label17: TUniLabel
              Left = 26
              Top = 57
              Width = 18
              Height = 13
              Hint = ''
              Caption = 'End'
              TabOrder = 7
            end
            object Label18: TUniLabel
              Left = 26
              Top = 81
              Width = 38
              Height = 13
              Hint = ''
              Caption = 'Interval'
              TabOrder = 8
            end
          end
          object Panel16: TUniPanel
            Left = 1
            Top = 283
            Width = 92
            Height = 198
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
            Caption = ''
            object Label4: TUniLabel
              Left = 8
              Top = 101
              Width = 67
              Height = 13
              Hint = ''
              Caption = 'Locating Zone'
              TabOrder = 2
            end
            object Label20: TUniLabel
              Left = 8
              Top = 173
              Width = 52
              Height = 13
              Hint = ''
              Caption = 'Work Zone'
              TabOrder = 3
            end
            object Label21: TUniLabel
              Left = 8
              Top = 125
              Width = 73
              Height = 13
              Hint = ''
              Caption = 'Allocating Zone'
              TabOrder = 4
            end
            object Label22: TUniLabel
              Left = 8
              Top = 149
              Width = 50
              Height = 13
              Hint = ''
              Caption = 'Drop Zone'
              TabOrder = 5
            end
            object Label6: TUniLabel
              Left = 8
              Top = 77
              Width = 36
              Height = 13
              Hint = ''
              Caption = 'Building'
              TabOrder = 6
            end
            object Label2: TUniLabel
              Left = 8
              Top = 53
              Width = 67
              Height = 13
              Hint = ''
              Caption = 'Location Type'
              TabOrder = 7
            end
            object Panel17: TUniPanel
              Left = 1
              Top = 1
              Width = 90
              Height = 40
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Caption = ''
            end
          end
        end
        object Panel12: TUniPanel
          Left = 99
          Top = 1
          Width = 262
          Height = 481
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Panel10: TUniPanel
            Left = 1
            Top = 1
            Width = 260
            Height = 79
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              260
              79)
            object edAisle: TUniDBEdit
              Left = 1
              Top = 1
              Width = 255
              Height = 21
              Hint = ''
              DataField = 'NAME'
              DataSource = SrcAisles
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              OnChange = FlagNotReadyToPost
            end
            object wwDBLookupComboDivision: TUniDBLookupComboBox
              Left = 1
              Top = 49
              Width = 255
              Height = 21
              Hint = ''
              ListFieldIndex = 0
              DataField = 'DIVISION_ID'
              DataSource = SrcAisles
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clWindow
            end
            object wwDBComboDlgEplant: TUniEdit
              Left = 1
              Top = 25
              Width = 255
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              ReadOnly = True
              OnKeyDown = wwDBComboDlgZoneLOKeyDown
            end
          end
          object Panel15: TUniPanel
            Left = 1
            Top = 79
            Width = 260
            Height = 204
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              260
              204)
            object edBayPrefix: TUniDBEdit
              Left = 1
              Top = 6
              Width = 255
              Height = 21
              Hint = ''
              DataField = 'BAY_PREFIX'
              DataSource = SrcAisles
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              OnChange = FlagNotReadyToPost
            end
            object edBayStart: TUniDBEdit
              Left = 1
              Top = 30
              Width = 80
              Height = 21
              Hint = ''
              DataField = 'BAY_START'
              DataSource = SrcAisles
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              OnChange = FlagNotReadyToPost
            end
            object edBayEnd: TUniDBEdit
              Left = 1
              Top = 54
              Width = 80
              Height = 21
              Hint = ''
              DataField = 'BAY_END'
              DataSource = SrcAisles
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              OnChange = FlagNotReadyToPost
            end
            object edBayInterval: TUniDBEdit
              Left = 1
              Top = 78
              Width = 80
              Height = 21
              Hint = ''
              DataField = 'BAY_INTERVAL'
              DataSource = SrcAisles
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              OnChange = FlagNotReadyToPost
            end
            object edLevelPrefix: TUniDBEdit
              Left = 1
              Top = 102
              Width = 255
              Height = 21
              Hint = ''
              DataField = 'LEVEL_PREFIX'
              DataSource = SrcAisles
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
              OnChange = FlagNotReadyToPost
            end
            object edLevelStart: TUniDBEdit
              Left = 1
              Top = 126
              Width = 80
              Height = 21
              Hint = ''
              DataField = 'LEVEL_START'
              DataSource = SrcAisles
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 5
              OnChange = FlagNotReadyToPost
            end
            object edLevelEnd: TUniDBEdit
              Left = 1
              Top = 150
              Width = 80
              Height = 21
              Hint = ''
              DataField = 'LEVEL_END'
              DataSource = SrcAisles
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 6
              OnChange = FlagNotReadyToPost
            end
            object edLevelInterval: TUniDBEdit
              Left = 1
              Top = 174
              Width = 80
              Height = 21
              Hint = ''
              DataField = 'LEVEL_INTERVAL'
              DataSource = SrcAisles
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 7
              OnChange = FlagNotReadyToPost
            end
          end
          object Panel18: TUniPanel
            Left = 1
            Top = 283
            Width = 260
            Height = 40
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Caption = ''
            object Panel21: TUniPanel
              Left = 207
              Top = 1
              Width = 53
              Height = 38
              Hint = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Label3: TUniLabel
                Left = 4
                Top = 6
                Width = 75
                Height = 13
                Hint = ''
                Caption = 'Update Current'
                TabOrder = 1
              end
            end
            object Panel22: TUniPanel
              Left = 1
              Top = 1
              Width = 209
              Height = 38
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Alignment = taLeftJustify
              Caption = ' Parameters Value'
            end
          end
          object Panel19: TUniPanel
            Left = 209
            Top = 323
            Width = 53
            Height = 158
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 4
            Caption = ''
            object chkUpdateLocType: TUniCheckBox
              Left = 4
              Top = 8
              Width = 18
              Height = 17
              Hint = ''
              Caption = ''
              TabOrder = 0
            end
            object chkUpdateBuilding: TUniCheckBox
              Left = 4
              Top = 32
              Width = 18
              Height = 17
              Hint = ''
              Caption = ''
              TabOrder = 1
            end
            object chkUpdateAllocatingZone: TUniCheckBox
              Left = 4
              Top = 80
              Width = 18
              Height = 17
              Hint = ''
              Caption = ''
              TabOrder = 3
            end
            object chkUpdateLocatingZone: TUniCheckBox
              Left = 4
              Top = 56
              Width = 18
              Height = 17
              Hint = ''
              Caption = ''
              TabOrder = 2
            end
            object chkUpdateDropZone: TUniCheckBox
              Left = 4
              Top = 104
              Width = 18
              Height = 17
              Hint = ''
              Caption = ''
              TabOrder = 4
            end
            object chkUpdateWorkZone: TUniCheckBox
              Left = 4
              Top = 128
              Width = 18
              Height = 17
              Hint = ''
              Caption = ''
              TabOrder = 5
            end
          end
          object Panel20: TUniPanel
            Left = 1
            Top = 323
            Width = 209
            Height = 158
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 3
            Caption = ''
            DesignSize = (
              209
              158)
            object wwDBComboDlgZoneLO: TUniEdit
              Left = 1
              Top = 54
              Width = 203
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              ReadOnly = True
              OnKeyDown = wwDBComboDlgZoneLOKeyDown
            end
            object wwDBComboDlgZoneAL: TUniEdit
              Left = 1
              Top = 78
              Width = 202
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              ReadOnly = True
              OnKeyDown = wwDBComboDlgZoneLOKeyDown
            end
            object wwDBComboDlgZoneDZ: TUniEdit
              Left = 1
              Top = 102
              Width = 202
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
              ReadOnly = True
              OnKeyDown = wwDBComboDlgZoneLOKeyDown
            end
            object wwDBComboDlgZoneWK: TUniEdit
              Left = 1
              Top = 126
              Width = 202
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 5
              ReadOnly = True
              OnKeyDown = wwDBComboDlgZoneLOKeyDown
            end
            object IQUDComboBoxBuilding: TIQWebUDComboBox
              Left = 1
              Top = 30
              Width = 202
              Height = 21
              Hint = 'Right click to edit the list'
              ShowHint = True
              ParentShowHint = False
              Anchors = [akLeft, akTop, akRight]
              DataField = 'BUILDING'
              DataSource = SrcAisles
              TabOrder = 1
              KeyTableName = 'LOCATIONS'
              KeyFieldName = 'BUILDING'
            end
            object wwDBComboDlgLocType: TUniEdit
              Left = 1
              Top = 6
              Width = 202
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              ReadOnly = True
              OnKeyDown = wwDBComboDlgZoneLOKeyDown
            end
          end
        end
      end
    end
    object Panel2: TUniPanel
      Left = 372
      Top = 1
      Width = 485
      Height = 491
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel3: TUniPanel
        Left = 1
        Top = 1
        Width = 483
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object Label1: TUniLabel
          Left = 8
          Top = 10
          Width = 38
          Height = 13
          Hint = ''
          Caption = 'Preview'
          TabOrder = 2
        end
        object Panel23: TUniPanel
          Left = 456
          Top = 1
          Width = 27
          Height = 26
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Shape8: TShape
            Left = 2
            Top = 10
            Width = 10
            Height = 11
            Hint = 'Future Locations'
            Brush.Color = 16744448
            ParentShowHint = False
            Shape = stSquare
            ShowHint = True
          end
        end
      end
      object Panel7: TUniPanel
        AlignWithMargins = True
        Left = 8
        Top = 33
        Width = 472
        Height = 453
        Hint = ''
        Margins.Left = 8
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        Color = clWindow
        object lvLocs: TListView
          Left = 0
          Top = 0
          Width = 472
          Height = 453
          Align = alClient
          BorderStyle = bsNone
          Columns = <
            item
              Caption = 'Bay'
              Width = 120
            end
            item
              Caption = 'Location Description'
              Width = 220
            end
            item
              Caption = 'Location'
              Width = 240
            end>
          ColumnClick = False
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
          OnAdvancedCustomDrawItem = lvLocsAdvancedCustomDrawItem
        end
      end
    end
  end
  object Panel8: TUniPanel
    Left = 0
    Top = 521
    Width = 857
    Height = 45
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel9: TUniPanel
      Left = 745
      Top = 1
      Width = 112
      Height = 43
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnPreviewPost: TUniButton
        Left = 3
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Preview'
        TabOrder = 1
        OnClick = btnPreviewPostClick
      end
    end
  end
  object Panel14: TUniPanel
    Left = 0
    Top = 0
    Width = 857
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search Aisle'
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
      Left = 617
      Top = 1
      Width = 240
      Height = 26
      Hint = ''
      DataSource = SrcAisles
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 444
    Top = 102
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
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmInvAisleLocationGenerator'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 187812 $'
    Left = 476
    Top = 102
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
      '   and misc.eplant_filter( d.eplant_id ) = 1'
      ' ')
    Left = 484
    Top = 142
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
  object PkInvZone: TIQWebHpick
    BeforeOpen = PkInvZoneBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select z.id as id, '
      '       z.code as code, '
      '       z.descrip as descrip,'
      '       z.eplant_id as eplant_id,'
      '       d.name as division_name'
      '  from inv_zone z, '
      '       division d'
      ' where z.zone_type = :zone_type '
      '   and misc.eplant_filter_include_nulls( z.eplant_id ) = 1'
      '   and z.division_id = d.id(+)'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 540
    Top = 102
    ParamData = <
      item
        Name = 'zone_type'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkInvZoneID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.INV_ZONE.ID'
      Visible = False
      Size = 0
    end
    object PkInvZoneCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'IQ.INV_ZONE.CODE'
      Size = 25
    end
    object PkInvZoneDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'IQ.INV_ZONE.DESCRIP'
      Size = 100
    end
    object PkInvZoneEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkInvZoneDIVISION_NAME: TStringField
      DisplayLabel = 'Division Name'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
  end
  object PKEplant: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       name'
      '  from eplant'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 572
    Top = 102
    object PKEplantID: TBCDField
      DisplayLabel = 'Eplant ID'
      FieldName = 'ID'
      Origin = 'IQ.EPLANT.ID'
      Size = 0
    end
    object PKEplantNAME: TStringField
      DisplayLabel = 'Descrip'
      FieldName = 'NAME'
      Origin = 'IQ.EPLANT.NAME'
      Size = 30
    end
  end
  object PkAisle: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id as id,'
      '       a.name as name,'
      '       a.eplant_id as eplant_id,'
      '       d.name as division_name'
      '  from inv_aisles a,'
      '       division d'
      ' where a.division_id = d.id(+)'
      '   and misc.eplant_filter( a.eplant_id ) = 1')
    OnIQModify = PkAisleIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 508
    Top = 103
    object PkAisleID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAisleNAME: TStringField
      DisplayLabel = 'Aisle'
      FieldName = 'NAME'
      Size = 9
    end
    object PkAisleEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkAisleDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
  end
  object SrcAisles: TDataSource
    DataSet = QryAisles
    Left = 449
    Top = 144
  end
  object QryAisles: TFDQuery
    BeforePost = QryAislesBeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    AfterScroll = QryAislesAfterScroll
    OnCalcFields = QryAislesCalcFields
    OnNewRecord = QryAislesNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'inv_aisles'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLAisles
    SQL.Strings = (
      'select id,'
      '       name,'
      '       eplant_id,'
      '       division_id,'
      '       bay_prefix,'
      '       bay_start,'
      '       bay_end,'
      '       bay_interval,'
      '       level_prefix,'
      '       level_start,'
      '       level_end,'
      '       level_interval,'
      '       location_type_id,'
      '       building,'
      '       inv_zone_id,'
      '       al_inv_zone_id,'
      '       dz_inv_zone_id,'
      '       wk_inv_zone_id'
      '  from inv_aisles'
      ' where misc.eplant_filter( eplant_id ) = 1'
      ' order by name ')
    Left = 448
    Top = 172
    object QryAislesNAME: TStringField
      DisplayLabel = 'Aisle'
      DisplayWidth = 11
      FieldName = 'NAME'
      Origin = 'IQ.INV_AISLES.NAME'
      Size = 9
    end
    object QryAislesBAY_PREFIX: TStringField
      FieldName = 'BAY_PREFIX'
      Size = 10
    end
    object QryAislesLEVEL_PREFIX: TStringField
      FieldName = 'LEVEL_PREFIX'
      Size = 10
    end
    object QryAislesBUILDING: TStringField
      FieldName = 'BUILDING'
      Size = 60
    end
    object QryAislesLocationType: TStringField
      FieldKind = fkCalculated
      FieldName = 'LocationType'
      Size = 50
      Calculated = True
    end
    object QryAislesEplantDisp: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'EplantDisp'
      Size = 40
      Calculated = True
    end
    object QryAislesLocatingZone: TStringField
      FieldKind = fkCalculated
      FieldName = 'LocatingZone'
      Size = 25
      Calculated = True
    end
    object QryAislesAllocatingZone: TStringField
      FieldKind = fkCalculated
      FieldName = 'AllocatingZone'
      Size = 25
      Calculated = True
    end
    object QryAislesWorkZone: TStringField
      FieldKind = fkCalculated
      FieldName = 'WorkZone'
      Size = 25
      Calculated = True
    end
    object QryAislesDropZone: TStringField
      FieldKind = fkCalculated
      FieldName = 'DropZone'
      Size = 25
      Calculated = True
    end
    object QryAislesDIVISION_ID: TBCDField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_ID'
      Origin = 'DIVISION_ID'
      Precision = 15
      Size = 0
    end
    object QryAislesID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryAislesEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object QryAislesBAY_START: TBCDField
      FieldName = 'BAY_START'
      Origin = 'BAY_START'
      Precision = 5
      Size = 0
    end
    object QryAislesBAY_END: TBCDField
      FieldName = 'BAY_END'
      Origin = 'BAY_END'
      Precision = 5
      Size = 0
    end
    object QryAislesBAY_INTERVAL: TBCDField
      FieldName = 'BAY_INTERVAL'
      Origin = 'BAY_INTERVAL'
      Precision = 3
      Size = 0
    end
    object QryAislesLEVEL_START: TBCDField
      FieldName = 'LEVEL_START'
      Origin = 'LEVEL_START'
      Precision = 5
      Size = 0
    end
    object QryAislesLEVEL_END: TBCDField
      FieldName = 'LEVEL_END'
      Origin = 'LEVEL_END'
      Precision = 5
      Size = 0
    end
    object QryAislesLEVEL_INTERVAL: TBCDField
      FieldName = 'LEVEL_INTERVAL'
      Origin = 'LEVEL_INTERVAL'
      Precision = 3
      Size = 0
    end
    object QryAislesLOCATION_TYPE_ID: TBCDField
      FieldName = 'LOCATION_TYPE_ID'
      Origin = 'LOCATION_TYPE_ID'
      Precision = 15
      Size = 0
    end
    object QryAislesINV_ZONE_ID: TBCDField
      FieldName = 'INV_ZONE_ID'
      Origin = 'INV_ZONE_ID'
      Precision = 15
      Size = 0
    end
    object QryAislesAL_INV_ZONE_ID: TBCDField
      FieldName = 'AL_INV_ZONE_ID'
      Origin = 'AL_INV_ZONE_ID'
      Precision = 15
      Size = 0
    end
    object QryAislesDZ_INV_ZONE_ID: TBCDField
      FieldName = 'DZ_INV_ZONE_ID'
      Origin = 'DZ_INV_ZONE_ID'
      Precision = 15
      Size = 0
    end
    object QryAislesWK_INV_ZONE_ID: TBCDField
      FieldName = 'WK_INV_ZONE_ID'
      Origin = 'WK_INV_ZONE_ID'
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQLAisles: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into inv_aisles'
      
        '  (ID, NAME, EPLANT_ID, DIVISION_ID, BAY_PREFIX, BAY_START, BAY_' +
        'END, BAY_INTERVAL, '
      
        '   LEVEL_PREFIX, LEVEL_START, LEVEL_END, LEVEL_INTERVAL, LOCATIO' +
        'N_TYPE_ID, '
      
        '   BUILDING, INV_ZONE_ID, AL_INV_ZONE_ID, DZ_INV_ZONE_ID, WK_INV' +
        '_ZONE_ID)'
      'values'
      
        '  (:ID, :NAME, :EPLANT_ID, :DIVISION_ID, :BAY_PREFIX, :BAY_START' +
        ', :BAY_END, '
      
        '   :BAY_INTERVAL, :LEVEL_PREFIX, :LEVEL_START, :LEVEL_END, :LEVE' +
        'L_INTERVAL, '
      
        '   :LOCATION_TYPE_ID, :BUILDING, :INV_ZONE_ID, :AL_INV_ZONE_ID, ' +
        ':DZ_INV_ZONE_ID, '
      '   :WK_INV_ZONE_ID)')
    ModifySQL.Strings = (
      'update inv_aisles'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  DIVISION_ID = :DIVISION_ID,'
      '  BAY_PREFIX = :BAY_PREFIX,'
      '  BAY_START = :BAY_START,'
      '  BAY_END = :BAY_END,'
      '  BAY_INTERVAL = :BAY_INTERVAL,'
      '  LEVEL_PREFIX = :LEVEL_PREFIX,'
      '  LEVEL_START = :LEVEL_START,'
      '  LEVEL_END = :LEVEL_END,'
      '  LEVEL_INTERVAL = :LEVEL_INTERVAL,'
      '  LOCATION_TYPE_ID = :LOCATION_TYPE_ID,'
      '  BUILDING = :BUILDING,'
      '  INV_ZONE_ID = :INV_ZONE_ID,'
      '  AL_INV_ZONE_ID = :AL_INV_ZONE_ID,'
      '  DZ_INV_ZONE_ID = :DZ_INV_ZONE_ID,'
      '  WK_INV_ZONE_ID = :WK_INV_ZONE_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from inv_aisles'
      'where'
      '  ID = :OLD_ID')
    Left = 448
    Top = 200
  end
  object PkLocationType: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       length,'
      '       width,'
      '       height,'
      '       weight'
      '  from location_type       '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 604
    Top = 102
    object PkLocationTypeID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkLocationTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkLocationTypeLENGTH: TBCDField
      DisplayLabel = 'Length'
      FieldName = 'LENGTH'
      Size = 2
    end
    object PkLocationTypeWIDTH: TBCDField
      DisplayLabel = 'Width'
      FieldName = 'WIDTH'
      Size = 2
    end
    object PkLocationTypeHEIGHT: TBCDField
      DisplayLabel = 'Height'
      FieldName = 'HEIGHT'
      Size = 2
    end
    object PkLocationTypeWEIGHT: TBCDField
      DisplayLabel = 'Weight'
      FieldName = 'WEIGHT'
      Size = 2
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMINVAISLELOCATIONGENERATOR'
    Left = 636
    Top = 101
  end
end
