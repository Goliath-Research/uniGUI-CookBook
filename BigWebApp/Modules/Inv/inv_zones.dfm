object FrmInvZones: TFrmInvZones
  Left = 0
  Top = 0
  HelpContext = 19754
  ClientHeight = 450
  ClientWidth = 588
  Caption = 'Inventory Zones'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 193
    Width = 588
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 588
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
    object sbtnToggle: TUniSpeedButton
      Left = 25
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Form - Table Toggle'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000A0860100A08601000001000000000000000000001212
        1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
        0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
        0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
        6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
        9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
        B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
        C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
        FB00FFFFFF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001D1D1D1D0505
        050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
        29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
        2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
        2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
        2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
        35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
        1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
        191919191919191919061E3838382120202020202020202020021E3939391A17
        1513110F0D0B090807061E393939211E050403030303030202021E393331392D
        2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
        2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
        19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnToggleClick
    end
    object NavZones: TUniDBNavigator
      Left = 348
      Top = 1
      Width = 240
      Height = 26
      Hint = ''
      DataSource = SrcInvZone
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object pnlHeader: TUniPanel
    Left = 0
    Top = 28
    Width = 588
    Height = 165
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object pgctrlMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 586
      Height = 163
      Hint = ''
      ActivePage = TabForm
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabForm: TUniTabSheet
        Hint = ''
        Caption = 'TabForm'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object Splitter3: TUniSplitter
          Left = 309
          Top = 0
          Width = 4
          Height = 135
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object pnlLeft03: TUniPanel
          Left = 0
          Top = 0
          Width = 309
          Height = 135
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 97
            Top = 0
            Width = 4
            Height = 135
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object pnlLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 97
            Height = 133
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label1: TUniLabel
              Left = 5
              Top = 8
              Width = 25
              Height = 13
              Hint = ''
              Caption = 'Code'
              TabOrder = 1
            end
            object Label2: TUniLabel
              Left = 5
              Top = 32
              Width = 53
              Height = 13
              Hint = ''
              Caption = 'Description'
              TabOrder = 2
            end
            object Label3: TUniLabel
              Left = 5
              Top = 104
              Width = 33
              Height = 13
              Hint = ''
              Caption = 'EPlant '
              TabOrder = 3
            end
            object lblDivision: TUniLabel
              Left = 5
              Top = 80
              Width = 36
              Height = 13
              Hint = ''
              Caption = 'Division'
              TabOrder = 4
            end
            object Label4: TUniLabel
              Left = 5
              Top = 56
              Width = 51
              Height = 13
              Hint = ''
              Caption = 'Zone Type'
              TabOrder = 5
            end
          end
          object Panel6: TUniPanel
            Left = 101
            Top = 1
            Width = 208
            Height = 133
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              208
              133)
            object dbeCode: TUniDBEdit
              Left = 1
              Top = 5
              Width = 201
              Height = 21
              Hint = ''
              DataField = 'CODE'
              DataSource = SrcInvZone
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object dbeDescrip: TUniDBEdit
              Left = 1
              Top = 29
              Width = 201
              Height = 21
              Hint = ''
              DataField = 'DESCRIP'
              DataSource = SrcInvZone
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object wwDBComboDlgEplantOnForm: TUniEdit
              Left = 1
              Top = 101
              Width = 201
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
              ReadOnly = True
            end
            object wwDBComboBoxZoneType: TUniDBComboBox
              Left = 1
              Top = 53
              Width = 201
              Height = 21
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              DataField = 'ZONE_TYPE'
              DataSource = SrcInvZone
              Style = csDropDownList
              Items.Strings = (
                'Locating Zone'#9'LO'
                'Allocating Zone'#9'AL'
                'Drop Zone'#9'DZ'
                'Work Zone'#9'WK')
              TabOrder = 2
            end
            object wwDBLookupComboDivision: TUniDBLookupComboBox
              Left = 1
              Top = 77
              Width = 201
              Height = 21
              Hint = ''
              ListFieldIndex = 0
              DataField = 'DIVISION_ID'
              DataSource = SrcInvZone
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              Color = clWindow
            end
          end
        end
        object Panel7: TUniPanel
          Left = 313
          Top = 0
          Width = 265
          Height = 135
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Splitter4: TUniSplitter
            Left = 97
            Top = 0
            Width = 4
            Height = 135
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object pnlLeft02: TUniPanel
            Left = 1
            Top = 1
            Width = 97
            Height = 133
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label5: TUniLabel
              Left = 5
              Top = 8
              Width = 52
              Height = 13
              Hint = ''
              Caption = 'Allocatable'
              TabOrder = 1
            end
            object Label6: TUniLabel
              Left = 5
              Top = 32
              Width = 73
              Height = 13
              Hint = ''
              Caption = 'Cases per Aisle'
              TabOrder = 2
            end
            object Label7: TUniLabel
              Left = 5
              Top = 56
              Width = 62
              Height = 13
              Hint = ''
              Caption = 'Current Aisle'
              TabOrder = 3
            end
            object Label8: TUniLabel
              Left = 5
              Top = 80
              Width = 69
              Height = 13
              Hint = ''
              Caption = 'Current Count'
              TabOrder = 4
            end
            object Label9: TUniLabel
              Left = 5
              Top = 104
              Width = 75
              Height = 13
              Hint = ''
              Caption = 'Pallets per Aisle'
              TabOrder = 5
            end
          end
          object Panel9: TUniPanel
            Left = 101
            Top = 1
            Width = 164
            Height = 133
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              164
              133)
            object DBCheckBoxAllocatable: TUniDBCheckBox
              Left = 1
              Top = 7
              Width = 20
              Height = 17
              Hint = ''
              DataField = 'ALLOCATABLE'
              DataSource = SrcInvZone
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = ''
              TabOrder = 0
            end
            object dbeCasesAisle: TUniDBEdit
              Left = 1
              Top = 29
              Width = 153
              Height = 21
              Hint = ''
              DataField = 'CASES_AISLE'
              DataSource = SrcInvZone
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object dbeCurrentAisle: TUniDBEdit
              Left = 1
              Top = 53
              Width = 153
              Height = 21
              Hint = ''
              DataField = 'CURRENT_AISLE'
              DataSource = SrcInvZone
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object dbeCurrentCount: TUniDBEdit
              Left = 1
              Top = 77
              Width = 153
              Height = 21
              Hint = ''
              DataField = 'CURRENT_COUNT'
              DataSource = SrcInvZone
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object dbePalletsAisle: TUniDBEdit
              Left = 1
              Top = 101
              Width = 153
              Height = 21
              Hint = ''
              DataField = 'PALLETS_AISLE'
              DataSource = SrcInvZone
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
            end
          end
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'TabGrid'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object Panel2: TUniPanel
          Left = 0
          Top = 0
          Width = 578
          Height = 135
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            578
            135)
          object wwDBGrid1: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 576
            Height = 133
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 359
            IQComponents.Grid.Height = 47
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcInvZone
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
            IQComponents.Navigator.DataSource = SrcInvZone
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 359
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 47
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcInvZone
            Columns = <
              item
                FieldName = 'CODE'
                Title.Caption = 'Code'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ALLOCATABLE'
                Title.Caption = 'Allocatable'
                Width = 64
                CheckBoxField.FieldValues = 'Y;N'
              end
              item
                FieldName = 'CASES_AISLE'
                Title.Caption = 'Cases per Aisle'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CURRENT_AISLE'
                Title.Caption = 'Current Aisle'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CURRENT_COUNT'
                Title.Caption = 'Current Count'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PALLETS_AISLE'
                Title.Caption = 'Pallets per Aisle'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ZONE_TYPE'
                Title.Caption = 'Zone Type'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'EplantDisp'
                Title.Caption = 'EPlant'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DivisionDisp'
                Title.Caption = 'Division'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
          object wwDBComboBoxZoneTypeOnGrid: TUniDBComboBox
            Left = 21
            Top = 29
            Width = 112
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            Style = csDropDownList
            Items.Strings = (
              'Locating'#9'LO'
              'Allocating'#9'AL'
              'Drop Zone'#9'DZ'
              'Work'#9'WK')
            TabOrder = 1
          end
          object wwDBComboDlgEplantOnGrid: TUniEdit
            Left = 21
            Top = 56
            Width = 112
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 2
            ReadOnly = True
          end
          object wwDBLookupComboDivisionOnGrid: TUniDBLookupComboBox
            Left = 21
            Top = 82
            Width = 112
            Height = 21
            Hint = ''
            Visible = False
            ListFieldIndex = 0
            TabOrder = 3
            Color = clWindow
          end
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 196
    Width = 588
    Height = 254
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel10: TUniPanel
      Left = 1
      Top = 1
      Width = 586
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnAddFromOtherZones: TUniSpeedButton
        Left = 4
        Top = 3
        Width = 23
        Height = 22
        Hint = 'Add Locations from other Types of Zones'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          0800000000000002000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
          FDED9292929292929292FDFDFDFDFDFDFDA4A4A4A4A4A4A4A4A4FDFDFDFDFDFD
          FDF5FFFFFFFFFFFFFF92FDFDFDFDFDFDFDA4FFFDFDFDFDFDFDA4FDFDFDFDFDFD
          FDF5FF0709FFF507FF92FDFDFDFDFDFDFDA4FFA4A4FDA4A4FDA4FDFDFDFDFDFD
          FDF5FFFFFFFFFFFFFF92FDFDFDFDFDFDFDA4FFFDFDFDFDFDFDA4FDFDFDFDFDFD
          FDF5FF0707FF0707FF92FDFDFDFDFDFDFDA4FFA4A4FDA4A4FDA4FDFDFDFDFDFD
          FDF5FFFFFFFFFFFFFF92FDFDFDFDFDFDFDA4FFFFFFFFFFFFFFA4FDFDFDFDFDFD
          FD090909ECECE3E3E2DAFDFDFDFDFDFDFDA4A4A4A4A4A4A4A4A4FDFDFDFDFDFD
          FD0909090909090909DAFDFDFDFFFFFFFFA4A4A4A4A4A4A4A4A4FDFD00000000
          FD09090909ECECEBE3E2FDFDA4A4A4A4FFA4A4A4A4A4A4A4A4A4FDFD00FFFF00
          FDFDFDFDFDFDFDFDFDFDFDFDA4FFFDA4FFFFFFFDFDFDFDFDFDFD000000FFFF00
          0000FDFDFDFDFDFDFDFDA4A4A4FFFDA4A4A4FFFDFDFDFDFDFDFD00FFFFFFFFFF
          FF00FDFDFDFDFDFDFDFDA4FFFDFDFDFDFDA4FFFDFDFDFDFDFDFD00FFFFFFFFFF
          FF00FDFDFDFDFDFDFDFDA4FFFFFFFDFDFDA4FFFDFDFDFDFDFDFD000000FFFF00
          0000FDFDFDFDFDFDFDFDA4A4A4FFFDA4A4A4FFFDFDFDFDFDFDFDFDFD00FFFF00
          FDFDFDFDFDFDFDFDFDFDFDFDA4FFFFA4FFFDFDFDFDFDFDFDFDFDFDFD00000000
          FDFDFDFDFDFDFDFDFDFDFDFDA4A4A4A4FFFDFDFDFDFDFDFDFDFD}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnAddFromOtherZonesClick
      end
    end
    object wwDBGridLocations: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 586
      Height = 226
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 369
      IQComponents.Grid.Height = 140
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcLocations
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
      IQComponents.Navigator.DataSource = SrcLocations
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 369
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 140
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcLocations
      Columns = <
        item
          FieldName = 'ID'
          Title.Caption = 'Location ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOCATION'
          Title.Caption = 'Location Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIPTION'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_NAME'
          Title.Caption = 'EPlant'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DIVISION'
          Title.Caption = 'Division'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ACTIVE_TYPE'
          Title.Caption = 'Active'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object SrcInvZone: TDataSource
    DataSet = QryInvZone
    Left = 52
    Top = 284
  end
  object QryInvZone: TFDQuery
    BeforePost = QryInvZoneBeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    OnCalcFields = QryInvZoneCalcFields
    OnNewRecord = QryInvZoneNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'inv_zone'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLInvZone
    SQL.Strings = (
      'select id, '
      '       code, '
      '       descrip,'
      '       eplant_id,'
      '       division_id,'
      '       zone_type,'
      '       allocatable,'
      '       cases_aisle,'
      '       current_count,'
      '       pallets_aisle,'
      '       current_aisle'
      '  from inv_zone'
      ' where misc.eplant_filter( eplant_id ) = 1')
    Left = 51
    Top = 312
    object QryInvZoneCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 17
      FieldName = 'CODE'
      Origin = 'IQ.INV_ZONE.CODE'
      Size = 25
    end
    object QryInvZoneDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 33
      FieldName = 'DESCRIP'
      Origin = 'IQ.INV_ZONE.DESCRIP'
      Size = 100
    end
    object QryInvZoneALLOCATABLE: TStringField
      DisplayLabel = 'Allocatable'
      DisplayWidth = 8
      FieldName = 'ALLOCATABLE'
      Size = 1
    end
    object QryInvZoneCASES_AISLE: TBCDField
      DisplayLabel = 'Cases per Aisle'
      DisplayWidth = 12
      FieldName = 'CASES_AISLE'
      Size = 0
    end
    object QryInvZoneCURRENT_AISLE: TStringField
      DisplayLabel = 'Current Aisle'
      DisplayWidth = 35
      FieldName = 'CURRENT_AISLE'
      Size = 35
    end
    object QryInvZoneCURRENT_COUNT: TBCDField
      DisplayLabel = 'Current Count'
      DisplayWidth = 11
      FieldName = 'CURRENT_COUNT'
      Size = 0
    end
    object QryInvZonePALLETS_AISLE: TBCDField
      DisplayLabel = 'Pallets per Aisle'
      DisplayWidth = 12
      FieldName = 'PALLETS_AISLE'
      Size = 0
    end
    object QryInvZoneZONE_TYPE: TStringField
      DisplayLabel = 'Zone Type'
      DisplayWidth = 12
      FieldName = 'ZONE_TYPE'
      Size = 2
    end
    object QryInvZoneEplantDisp: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 19
      FieldKind = fkCalculated
      FieldName = 'EplantDisp'
      Size = 35
      Calculated = True
    end
    object QryInvZoneDivisionDisp: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 23
      FieldKind = fkCalculated
      FieldName = 'DivisionDisp'
      Size = 30
      Calculated = True
    end
    object QryInvZoneDIVISION_ID: TBCDField
      DisplayLabel = 'Division'
      DisplayWidth = 30
      FieldName = 'DIVISION_ID'
      Visible = False
      OnChange = QryInvZoneDIVISION_IDChange
      Size = 0
    end
    object QryInvZoneID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.INV_ZONE.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryInvZoneEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object PkInvZone: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select z.id as id, '
      '       z.code as code, '
      '       z.descrip as descrip,'
      '       z.eplant_id as eplant_id,'
      '       d.name as division_name'
      '  from inv_zone z,'
      '       division d'
      ' where misc.eplant_filter_include_nulls( z.eplant_id ) = 1'
      '   and z.division_id = d.id(+)'
      '')
    OnIQModify = PkInvZoneIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 56
    Top = 388
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
  object UpdateSQLInvZone: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into inv_zone'
      
        '  (ID, CODE, DESCRIP, EPLANT_ID, DIVISION_ID, ZONE_TYPE, ALLOCAT' +
        'ABLE, CASES_AISLE, '
      '   CURRENT_COUNT, PALLETS_AISLE, CURRENT_AISLE)'
      'values'
      
        '  (:ID, :CODE, :DESCRIP, :EPLANT_ID, :DIVISION_ID, :ZONE_TYPE, :' +
        'ALLOCATABLE, '
      '   :CASES_AISLE, :CURRENT_COUNT, :PALLETS_AISLE, :CURRENT_AISLE)')
    ModifySQL.Strings = (
      'update inv_zone'
      'set'
      '  ID = :ID,'
      '  CODE = :CODE,'
      '  DESCRIP = :DESCRIP,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  DIVISION_ID = :DIVISION_ID,'
      '  ZONE_TYPE = :ZONE_TYPE,'
      '  ALLOCATABLE = :ALLOCATABLE,'
      '  CASES_AISLE = :CASES_AISLE,'
      '  CURRENT_COUNT = :CURRENT_COUNT,'
      '  PALLETS_AISLE = :PALLETS_AISLE,'
      '  CURRENT_AISLE = :CURRENT_AISLE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from inv_zone'
      'where'
      '  ID = :OLD_ID')
    Left = 52
    Top = 340
  end
  object MainMenu1: TUniMainMenu
    Left = 140
    Top = 388
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
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
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryInvZone'
      'sbtnAddFromOtherZones')
    SecurityCode = 'FRMINVZONES'
    Left = 84
    Top = 388
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmInvZones'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193636 $'
    BuildVersion = '176554'
    Left = 112
    Top = 388
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
    Left = 92
    Top = 283
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
  object SrcLocations: TDataSource
    DataSet = QryLocations
    Left = 132
    Top = 284
  end
  object QryLocations: TFDQuery
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    MasterSource = SrcInvZone
    MasterFields = 'ZONE_TYPE;ID'
    OnUpdateRecord = QryLocationsUpdateRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select l.id as id,'
      '       l.location_type_id,'
      '       l.loc_desc as location,'
      '       l.descrip as description,'
      
        '       decode( e.id, null, null, '#39'['#39' || e.ID || '#39']  '#39' || e.name)' +
        ' as eplant_name,'
      '       d.name as division,'
      
        '       decode(NVL(l.pk_hide, '#39'N'#39'), '#39'N'#39', '#39'Active'#39', '#39'InActive'#39') as' +
        ' active_type'
      '  from locations l,'
      '       eplant e,'
      '       division d'
      ' where '
      '       case :zone_type '
      '          when '#39'LO'#39' then l.inv_zone_id'
      '          when '#39'AL'#39' then l.al_inv_zone_id'
      '          when '#39'DZ'#39' then l.dz_inv_zone_id'
      '          when '#39'WK'#39' then l.wk_inv_zone_id'
      '          else -1'
      '       end = :id'
      '       '
      '   and l.eplant_id = e.id(+)'
      '   and l.division_id = d.id(+)'
      '   and misc.eplant_filter(l.eplant_id) = 1'
      ' order by   '
      '       l.loc_desc'
      ''
      ''
      ''
      ''
      ' ')
    Left = 132
    Top = 312
    ParamData = <
      item
        Name = 'ZONE_TYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryLocationsID: TBCDField
      DisplayLabel = 'Location ID'
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object QryLocationsLOCATION: TStringField
      DisplayLabel = 'Location Name'
      DisplayWidth = 27
      FieldName = 'LOCATION'
      FixedChar = True
      Size = 30
    end
    object QryLocationsDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object QryLocationsEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 13
      FieldName = 'EPLANT_NAME'
      Size = 74
    end
    object QryLocationsDIVISION: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 14
      FieldName = 'DIVISION'
      Size = 25
    end
    object QryLocationsACTIVE_TYPE: TStringField
      DisplayLabel = 'Active'
      DisplayWidth = 11
      FieldName = 'ACTIVE_TYPE'
      Size = 8
    end
    object QryLocationsLOCATION_TYPE_ID: TBCDField
      FieldName = 'LOCATION_TYPE_ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 172
    Top = 284
    object JumpToLocation1: TUniMenuItem
      Caption = 'Jump To Location'
      OnClick = JumpToLocation1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object DisassociateSelectedLocations1: TUniMenuItem
      Caption = 'Disassociate Selected Locations'
      OnClick = DisassociateSelectedLocations1Click
    end
  end
  object PkLoc: TIQWebHpick
    BeforeOpen = PkLocBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select l.id as id,'
      '       l.loc_desc as location,'
      '       l.start_row as path,'
      '       l.descrip as description,'
      '       '#39'['#39' || e.ID || '#39']  '#39' || e.name as eplant_name,'
      '       d.name as division,'
      '       a.name as loc_aisle ,'
      '       l.loc_bay as loc_bay,'
      '       l.loc_level as loc_level,'
      
        '       decode(NVL(l.pk_hide, '#39'N'#39'), '#39'N'#39', '#39'Active'#39', '#39'InActive'#39') as' +
        ' active_type,'
      '       l.pk_hide as pk_hide'
      '  from locations l,'
      '       eplant e,'
      '       division d,'
      '       inv_aisles a'
      ' where l.eplant_id = e.id(+)'
      '   and l.division_id = d.id(+)'
      '   and (:eplant_id = 0 '
      '        or'
      '        l.eplant_id = :eplant_id)'
      '   and l.inv_aisles_id = a.id(+)'
      '   and (:division_id = 0'
      '        or'
      '        l.division_id = :division_id)'
      ''
      '   and case :zone_type '
      '          when '#39'LO'#39' then l.inv_zone_id'
      '          when '#39'AL'#39' then l.al_inv_zone_id'
      '          when '#39'DZ'#39' then l.dz_inv_zone_id'
      '          when '#39'WK'#39' then l.wk_inv_zone_id'
      '          else -1'
      '       end is null'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 132
    Top = 340
    ParamData = <
      item
        Name = 'eplant_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'division_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'zone_type'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkLocID: TBCDField
      FieldName = 'ID'
      Origin = 'l.id'
      Visible = False
      Size = 0
    end
    object PkLocLOCATION: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOCATION'
      Origin = 'l.loc_desc'
      FixedChar = True
      Size = 30
    end
    object PkLocDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'l.descrip'
      Size = 50
    end
    object PkLocEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant Name'
      FieldName = 'EPLANT_NAME'
      Origin = #39'['#39' || e.ID || '#39']  '#39' || e.name'
      Size = 74
    end
    object PkLocDIVISION: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION'
      Origin = 'd.name'
      Size = 25
    end
    object PkLocACTIVE_TYPE: TStringField
      DisplayLabel = 'State'
      FieldName = 'ACTIVE_TYPE'
      Origin = 'decode(NVL(l.pk_hide, '#39'N'#39'), '#39'N'#39', '#39'Active'#39', '#39'InActive'#39')'
      Size = 8
    end
    object PkLocLOC_AISLE: TStringField
      DisplayLabel = 'Aisle'
      FieldName = 'LOC_AISLE'
      Origin = 'a.name'
      Size = 9
    end
    object PkLocLOC_BAY: TStringField
      DisplayLabel = 'Bay'
      FieldName = 'LOC_BAY'
      Origin = 'l.loc_bay'
      Size = 9
    end
    object PkLocLOC_LEVEL: TStringField
      DisplayLabel = 'Level'
      FieldName = 'LOC_LEVEL'
      Origin = 'l.loc_level'
      Size = 9
    end
    object PkLocPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
end
