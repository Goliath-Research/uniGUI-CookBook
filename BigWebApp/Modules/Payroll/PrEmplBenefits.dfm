object FrmEmplBenefits: TFrmEmplBenefits
  Left = 114
  Top = 203
  ClientHeight = 455
  ClientWidth = 706
  Caption = 'Quick Add/Edit Benefit'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 153
    Width = 706
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
    Width = 706
    Height = 153
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object PC: TUniPageControl
      Left = 1
      Top = 27
      Width = 704
      Height = 126
      Hint = ''
      ActivePage = TabForm
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabForm: TUniTabSheet
        Hint = ''
        TabVisible = False
        Caption = 'TabForm'
        object Splitter2: TUniSplitter
          Left = 115
          Top = 0
          Width = 6
          Height = 98
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel5: TUniPanel
          Left = 0
          Top = 0
          Width = 115
          Height = 98
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            115
            98)
          object Label1: TUniLabel
            Left = 7
            Top = 64
            Width = 57
            Height = 13
            Hint = ''
            Caption = 'Description:'
            TabOrder = 1
          end
          object Label4: TUniLabel
            Left = 7
            Top = 35
            Width = 68
            Height = 13
            Hint = ''
            Caption = 'Benefit Name:'
            TabOrder = 2
          end
          object Label7: TUniLabel
            Left = 7
            Top = 117
            Width = 89
            Height = 13
            Hint = ''
            Caption = 'Use GL Plug Value:'
            TabOrder = 3
          end
          object Label2: TUniLabel
            Left = 7
            Top = 148
            Width = 62
            Height = 13
            Hint = ''
            Caption = 'Report Value'
            TabOrder = 4
          end
          object IQUserDefLabel1: TIQWebUserDefLabel
            Left = 7
            Top = 170
            Width = 32
            Height = 13
            Hint = ''
            Caption = 'Note 1'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel2: TIQWebUserDefLabel
            Left = 7
            Top = 192
            Width = 32
            Height = 13
            Hint = ''
            Caption = 'Note 2'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel3: TIQWebUserDefLabel
            Left = 7
            Top = 214
            Width = 32
            Height = 13
            Hint = ''
            Caption = 'Note 3'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
            ParentAppName = 'IQWIN32.EXE'
          end
          object LblW2: TUniLabel
            Left = 7
            Top = 93
            Width = 44
            Height = 13
            Hint = ''
            Caption = 'W2 Code'
            TabOrder = 8
          end
          object Label3: TUniLabel
            Left = 7
            Top = 7
            Width = 11
            Height = 13
            Hint = ''
            Caption = 'ID'
            TabOrder = 9
          end
        end
        object Panel6: TUniPanel
          Left = 121
          Top = 0
          Width = 575
          Height = 98
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Splitter3: TUniSplitter
            Left = 217
            Top = 0
            Width = 6
            Height = 98
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object Panel7: TUniPanel
            Left = 1
            Top = 1
            Width = 217
            Height = 96
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              217
              96)
            object edAccount: TUniDBEdit
              Left = 2
              Top = 4
              Width = 210
              Height = 19
              Cursor = crArrow
              Hint = ''
              DataField = 'ID'
              DataSource = SrcHdr
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
            end
            object edName: TUniDBEdit
              Left = 2
              Top = 32
              Width = 210
              Height = 21
              Hint = ''
              DataField = 'NAME'
              DataSource = SrcHdr
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object DBDescrip: TUniDBEdit
              Left = 2
              Top = 60
              Width = 210
              Height = 21
              Hint = ''
              DataField = 'DESCRIP'
              DataSource = SrcHdr
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object DBW2: TUniDBEdit
              Left = 2
              Top = 88
              Width = 210
              Height = 21
              Hint = ''
              DataField = 'W2_CODE'
              DataSource = SrcHdr
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
          end
          object Panel8: TUniPanel
            Left = 223
            Top = 1
            Width = 352
            Height = 96
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object Splitter4: TUniSplitter
              Left = 137
              Top = 0
              Width = 6
              Height = 96
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object Panel9: TUniPanel
              Left = 1
              Top = 1
              Width = 137
              Height = 94
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label5: TUniLabel
                Left = 7
                Top = 7
                Width = 65
                Height = 13
                Hint = ''
                Caption = 'Benefit Type:'
                TabOrder = 1
              end
              object Label6: TUniLabel
                Left = 8
                Top = 35
                Width = 73
                Height = 13
                Hint = ''
                Caption = 'Effective Date:'
                TabOrder = 2
              end
              object Label8: TUniLabel
                Left = 8
                Top = 64
                Width = 69
                Height = 13
                Hint = ''
                Caption = 'Inactive Date:'
                TabOrder = 3
              end
              object Label9: TUniLabel
                Left = 8
                Top = 93
                Width = 21
                Height = 13
                Hint = ''
                Caption = 'Hide'
                TabOrder = 4
              end
            end
            object Panel10: TUniPanel
              Left = 143
              Top = 1
              Width = 209
              Height = 94
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                209
                94)
              object wwDBDateTimePicker1: TUniDBDateTimePicker
                Left = 2
                Top = 29
                Width = 210
                Height = 21
                Hint = ''
                DataField = 'EFFECTIVE_DATE'
                DataSource = SrcHdr
                DateTime = 42657.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
              end
              object wwDBDateTimePicker2: TUniDBDateTimePicker
                Left = 2
                Top = 57
                Width = 210
                Height = 21
                Hint = ''
                DataField = 'INACTIVE_DATE'
                DataSource = SrcHdr
                DateTime = 42657.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
              object DBCheckBox1: TUniDBCheckBox
                Left = 2
                Top = 90
                Width = 17
                Height = 17
                Hint = ''
                DataField = 'PK_HIDE'
                DataSource = SrcHdr
                ValueChecked = 'Y'
                ValueUnchecked = 'N'
                Caption = ''
                TabOrder = 3
              end
              object dbeBenefitType: TIQWebUDComboBox
                Left = 2
                Top = 3
                Width = 211
                Height = 21
                Hint = 'Right click to edit the list'
                HelpContext = -57
                ShowHint = True
                ParentShowHint = False
                Anchors = [akLeft, akTop, akRight]
                DataField = 'BENEFIT_TYPE'
                DataSource = SrcHdr
                TabOrder = 0
                KeyTableName = 'PR_EMPL_BENEFIT'
                KeyFieldName = 'BENEFIT_TYPE'
              end
            end
          end
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        TabVisible = False
        ImageIndex = 1
        Caption = 'TabGrid'
        DesignSize = (
          696
          98)
        object GridHdr: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 696
          Height = 98
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 479
          IQComponents.Grid.Height = 12
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcHdr
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
          IQComponents.Navigator.DataSource = SrcHdr
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 479
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 12
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcHdr
          Columns = <
            item
              FieldName = 'ID'
              Title.Caption = 'ID'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'NAME'
              Title.Caption = 'Benefit Name'
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
              FieldName = 'W2_CODE'
              Title.Caption = 'W2 Code'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BENEFIT_TYPE'
              Title.Caption = 'Benefit Type'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EFFECTIVE_DATE'
              Title.Caption = 'Effective Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'INACTIVE_DATE'
              Title.Caption = 'Inactive Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PK_HIDE'
              Title.Caption = 'Hide'
              Width = 64
              CheckBoxField.FieldValues = 'Y;N'
            end>
          Marker = 0
        end
        object wwDBDateTimePicker3: TUniDBDateTimePicker
          Left = 2
          Top = 29
          Width = 210
          Height = 21
          Hint = ''
          DateTime = 42657.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 1
        end
        object wwDBDateTimePicker4: TUniDBDateTimePicker
          Left = 2
          Top = 57
          Width = 210
          Height = 21
          Hint = ''
          DateTime = 42657.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
        end
        object dbeBenefitType2: TIQWebUDComboBox
          Left = 354
          Top = 51
          Width = 211
          Height = 21
          Hint = 'Right click to edit the list'
          HelpContext = -57
          ShowHint = True
          ParentShowHint = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          KeyTableName = 'PR_EMPL_BENEFIT'
          KeyFieldName = 'BENEFIT_TYPE'
        end
      end
    end
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 704
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object SBSearch: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Search...'
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
        OnClick = SBSearchClick
      end
      object sbtnTableForm: TUniSpeedButton
        Left = 24
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
        OnClick = sbtnTableFormClick
      end
      object Nav: TUniDBNavigator
        Left = 479
        Top = 1
        Width = 225
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcHdr
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 156
    Width = 706
    Height = 299
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 704
      Height = 297
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 487
      IQComponents.Grid.Height = 211
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcDtl
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
      IQComponents.Navigator.DataSource = SrcDtl
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 487
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 211
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 186
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 215
      DataSource = SrcDtl
      Columns = <
        item
          FieldName = 'Empno'
          Title.Caption = 'Emp#'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FirstName'
          Title.Caption = 'First Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MiddleName'
          Title.Caption = 'Middle Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LastName'
          Title.Caption = 'Last Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'W2_CODE'
          Title.Caption = 'W2 Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'THIS_YEAR'
          Title.Caption = 'This Year'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AMOUNT'
          Title.Caption = 'Amount'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CHECK_DATE'
          Title.Caption = 'Check Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MANUAL'
          Title.Caption = 'Manual'
          Width = 64
          CheckBoxField.FieldValues = 'Y;N'
        end>
      ExplicitTop = 27
      ExplicitHeight = 272
      DesignSize = (
        704
        297)
      Marker = 0
      object wwDBDateTimePicker5: TUniDBDateTimePicker
        Left = 2
        Top = 57
        Width = 210
        Height = 46
        Hint = ''
        DateTime = 42657.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 4
        ExplicitHeight = 21
      end
      object wwDBComboDlg1: TUniEdit
        Left = 56
        Top = 88
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
      end
      object wwDBComboDlg2: TUniEdit
        Left = 56
        Top = 144
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 3
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 264
    Top = 80
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = '&New'
        OnClick = New1Click
      end
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
  object SrcHdr: TDataSource
    DataSet = QryHdr
    Left = 104
    Top = 280
  end
  object SrcDtl: TDataSource
    DataSet = QryDtl
    Left = 168
    Top = 280
  end
  object QryHdr: TFDQuery
    BeforePost = QryHdrBeforePost
    AfterPost = QryHdrAfterPost
    AfterDelete = QryHdrAfterPost
    AfterScroll = QryHdrAfterScroll
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PR_EMPL_BENEFIT'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       name,'
      '       descrip,'
      '       w2_code,'
      '       benefit_type,'
      '       effective_date,'
      '       inactive_date,'
      '       pk_hide'
      '  from PR_EMPL_BENEFIT'
      '')
    Left = 104
    Top = 312
    object QryHdrNAME: TStringField
      DisplayLabel = 'Benefit Name'
      DisplayWidth = 50
      FieldName = 'NAME'
      Origin = 'IQ.PR_EMPL_BENEFIT.NAME'
      Size = 250
    end
    object QryHdrDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'IQ.PR_EMPL_BENEFIT.DESCRIP'
      Size = 250
    end
    object QryHdrW2_CODE: TStringField
      DisplayLabel = 'W2 Code'
      DisplayWidth = 2
      FieldName = 'W2_CODE'
      Origin = 'IQ.PR_EMPL_BENEFIT.W2_CODE'
      Size = 2
    end
    object QryHdrBENEFIT_TYPE: TStringField
      DisplayLabel = 'Benefit Type'
      DisplayWidth = 50
      FieldName = 'BENEFIT_TYPE'
      Origin = 'IQ.PR_EMPL_BENEFIT.BENEFIT_TYPE'
      Size = 250
    end
    object QryHdrEFFECTIVE_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECTIVE_DATE'
      Origin = 'IQ.PR_EMPL_BENEFIT.EFFECTIVE_DATE'
    end
    object QryHdrINACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'INACTIVE_DATE'
      Origin = 'IQ.PR_EMPL_BENEFIT.INACTIVE_DATE'
    end
    object QryHdrPK_HIDE: TStringField
      DisplayLabel = 'Hide'
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'IQ.PR_EMPL_BENEFIT.PK_HIDE'
      Size = 1
    end
    object QryHdrID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.PR_EMPL_BENEFIT.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object QryDtl: TFDQuery
    BeforeInsert = QryDtlBeforeEdit
    AfterInsert = QryDtlAfterInsert
    BeforeEdit = QryDtlBeforeEdit
    BeforePost = QryDtlBeforePost
    AfterPost = QryDtlAfterPost
    OnCalcFields = QryDtlCalcFields
    OnNewRecord = QryDtlNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'C_PR_EMPL_BENEFITS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL2
    SQL.Strings = (
      'select c.id,'
      '       c.pr_empl_benefit_id,'
      '       c.pr_emp_id,'
      '       c.w2_code,'
      '       c.this_year,'
      '       c.amount,'
      '       c.check_date,'
      '       c.manual,'
      '       p.empno,'
      '       p.first_name,'
      '       p.middle_name,'
      '       p.last_name'
      '  from C_PR_EMPL_BENEFITS c,'
      '       pr_emp p'
      ' where c.PR_EMPL_BENEFIT_ID = :AID'
      '   and c.pr_emp_id = p.id'
      '   ')
    Left = 168
    Top = 312
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDtlEmpno: TStringField
      DisplayLabel = 'Emp#'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Empno'
      Origin = 'p.empno'
      Size = 25
      Calculated = True
    end
    object QryDtlFirstName: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'FirstName'
      Origin = 'p.first_name'
      Calculated = True
    end
    object QryDtlMiddleName: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'MiddleName'
      Origin = 'p.middle_name'
      Calculated = True
    end
    object QryDtlLastName: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'LastName'
      Origin = 'p.last_name'
      Calculated = True
    end
    object QryDtlW2_CODE: TStringField
      DisplayLabel = 'W2 Code'
      DisplayWidth = 2
      FieldName = 'W2_CODE'
      Origin = 'c.W2_CODE'
      Size = 2
    end
    object QryDtlTHIS_YEAR: TStringField
      DisplayLabel = 'This Year'
      DisplayWidth = 4
      FieldName = 'THIS_YEAR'
      Origin = 'c.THIS_YEAR'
      Size = 4
    end
    object QryDtlAMOUNT: TBCDField
      DisplayLabel = 'Amount'
      DisplayWidth = 10
      FieldName = 'AMOUNT'
      Origin = 'c.AMOUNT'
      Size = 2
    end
    object QryDtlCHECK_DATE: TDateTimeField
      DisplayLabel = 'Check Date'
      DisplayWidth = 18
      FieldName = 'CHECK_DATE'
      Origin = 'c.CHECK_DATE'
    end
    object QryDtlMANUAL: TStringField
      DisplayLabel = 'Manual'
      DisplayWidth = 1
      FieldName = 'MANUAL'
      Origin = 'c.MANUAL'
      Size = 1
    end
    object QryDtlID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object QryDtlPR_EMPL_BENEFIT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMPL_BENEFIT_ID'
      Origin = 'PR_EMPL_BENEFIT_ID'
      Visible = False
      Size = 0
    end
    object QryDtlPR_EMP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into PR_EMPL_BENEFIT'
      '  (ID, NAME, DESCRIP, W2_CODE, BENEFIT_TYPE, EFFECTIVE_DATE, '
      'INACTIVE_DATE, '
      '   PK_HIDE)'
      'values'
      
        '  (:ID, :NAME, :DESCRIP, :W2_CODE, :BENEFIT_TYPE, :EFFECTIVE_DAT' +
        'E, '
      ':INACTIVE_DATE, '
      '   :PK_HIDE)')
    ModifySQL.Strings = (
      'update PR_EMPL_BENEFIT'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  DESCRIP = :DESCRIP,'
      '  W2_CODE = :W2_CODE,'
      '  BENEFIT_TYPE = :BENEFIT_TYPE,'
      '  EFFECTIVE_DATE = :EFFECTIVE_DATE,'
      '  INACTIVE_DATE = :INACTIVE_DATE,'
      '  PK_HIDE = :PK_HIDE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from PR_EMPL_BENEFIT'
      'where'
      '  ID = :OLD_ID')
    Left = 104
    Top = 359
  end
  object UpdateSQL2: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into C_PR_EMPL_BENEFITS'
      
        '  (ID, PR_EMPL_BENEFIT_ID, PR_EMP_ID, W2_CODE, THIS_YEAR, AMOUNT' +
        ', '
      'CHECK_DATE, '
      '   MANUAL)'
      'values'
      
        '  (:ID, :PR_EMPL_BENEFIT_ID, :PR_EMP_ID, :W2_CODE, :THIS_YEAR, :' +
        'AMOUNT, '
      '   :CHECK_DATE, :MANUAL)')
    ModifySQL.Strings = (
      'update C_PR_EMPL_BENEFITS'
      'set'
      '  ID = :ID,'
      '  PR_EMPL_BENEFIT_ID = :PR_EMPL_BENEFIT_ID,'
      '  PR_EMP_ID = :PR_EMP_ID,'
      '  W2_CODE = :W2_CODE,'
      '  THIS_YEAR = :THIS_YEAR,'
      '  AMOUNT = :AMOUNT,'
      '  CHECK_DATE = :CHECK_DATE,'
      '  MANUAL = :MANUAL'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from C_PR_EMPL_BENEFITS'
      'where'
      '  ID = :OLD_ID')
    Left = 168
    Top = 359
  end
  object PkSearch: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       name,'
      '       descrip,'
      '       w2_code,'
      '       benefit_type,'
      '       effective_date,'
      '       inactive_date,'
      '       pk_hide'
      '  from PR_EMPL_BENEFIT'
      ''
      ''
      ''
      ' '
      ' ')
    OnIQModify = PkSearchIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 233
    Top = 282
    object PkSearchID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.PR_EMPL_BENEFIT.ID'
      Visible = False
      Size = 0
    end
    object PkSearchNAME: TStringField
      DisplayLabel = 'Benefit Name'
      FieldName = 'NAME'
      Origin = 'IQ.PR_EMPL_BENEFIT.NAME'
      Size = 250
    end
    object PkSearchDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.PR_EMPL_BENEFIT.DESCRIP'
      Size = 250
    end
    object PkSearchW2_CODE: TStringField
      DisplayLabel = 'W2 Code'
      FieldName = 'W2_CODE'
      Origin = 'IQ.PR_EMPL_BENEFIT.W2_CODE'
      Size = 2
    end
    object PkSearchBENEFIT_TYPE: TStringField
      DisplayLabel = 'Benefit Type'
      FieldName = 'BENEFIT_TYPE'
      Origin = 'IQ.PR_EMPL_BENEFIT.BENEFIT_TYPE'
      Size = 250
    end
    object PkSearchEFFECTIVE_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      FieldName = 'EFFECTIVE_DATE'
      Origin = 'IQ.PR_EMPL_BENEFIT.EFFECTIVE_DATE'
    end
    object PkSearchINACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      FieldName = 'INACTIVE_DATE'
      Origin = 'IQ.PR_EMPL_BENEFIT.INACTIVE_DATE'
    end
    object PkSearchPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.PR_EMPL_BENEFIT.PK_HIDE'
      Size = 1
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmEmplBenefits'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 192070 $'
    Left = 288
    Top = 292
  end
  object PkEmp: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select e.id as id,'
      '       e.pk_hide as pk_hide,'
      '       e.empno as empno,'
      
        '       substrB( iqstring.Concat3W( e.First_Name, e.Middle_Name, ' +
        'e.Last_Name), 1, 255) as employee'
      '  from pr_emp e,'
      '       pr_paygroup g'
      ' where misc.eplant_filter(g.eplant_id) = 1'
      '   and e.pr_paygroup_id = g.id(+)'
      '   and (e.pr_paygroup_id is null'
      '        or e.pr_paygroup_id in (select pr_paygroup_id'
      '                                  from s_user_paygroup'
      
        '                                 where misc.GetUserName = user_n' +
        'ame))'
      ''
      ''
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 201
    Top = 242
    object PkEmpID: TBCDField
      FieldName = 'ID'
      Origin = 'PR_EMP.ID'
      Visible = False
      Size = 0
    end
    object PkEmpEMPNO: TStringField
      DisplayLabel = 'Emp#'
      FieldName = 'EMPNO'
      Origin = 'PR_EMP.EMPNO'
      Size = 25
    end
    object PkEmpEMPLOYEE: TStringField
      DisplayLabel = 'Employee'
      FieldName = 'EMPLOYEE'
      Size = 255
    end
    object PkEmpPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.PR_EMP.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
