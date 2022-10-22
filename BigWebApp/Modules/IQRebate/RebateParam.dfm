object FrmRebateParam: TFrmRebateParam
  Left = 105
  Top = 137
  HelpContext = 16479
  ClientHeight = 455
  ClientWidth = 869
  Caption = 'Rebate Parameters'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 869
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
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
    object SBToggle: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Grid/Form'
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
      OnClick = SBToggleClick
    end
    object IQUserDefLabel1: TIQWebUserDefLabel
      Left = 99
      Top = 6
      Width = 39
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'CUSER1'
      TabOrder = 3
      ParentAppName = 'IQWIN32.EXE'
    end
    object IQUserDefLabel2: TIQWebUserDefLabel
      Left = 147
      Top = 6
      Width = 39
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'CUSER2'
      TabOrder = 4
      ParentAppName = 'IQWIN32.EXE'
    end
    object IQUserDefLabel3: TIQWebUserDefLabel
      Left = 195
      Top = 6
      Width = 39
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'CUSER3'
      TabOrder = 5
      ParentAppName = 'IQWIN32.EXE'
    end
    object IQUserDefLabel4: TIQWebUserDefLabel
      Left = 259
      Top = 6
      Width = 39
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'NUSER1'
      TabOrder = 6
      ParentAppName = 'IQWIN32.EXE'
    end
    object IQUserDefLabel5: TIQWebUserDefLabel
      Left = 307
      Top = 6
      Width = 39
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'NUSER2'
      TabOrder = 7
      ParentAppName = 'IQWIN32.EXE'
    end
    object IQUserDefLabel6: TIQWebUserDefLabel
      Left = 355
      Top = 6
      Width = 39
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'NUSER3'
      TabOrder = 8
      ParentAppName = 'IQWIN32.EXE'
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 27
    Width = 869
    Height = 428
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PC: TUniPageControl
      Left = 1
      Top = 1
      Width = 867
      Height = 426
      Hint = ''
      ActivePage = TabGrid
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabGrid: TUniTabSheet
        Hint = ''
        Caption = 'TabGrid'
        object IQSearch1: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 859
          Height = 398
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 642
          IQComponents.Grid.Height = 312
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcParams
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
          IQComponents.Navigator.DataSource = SrcParams
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 642
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 312
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcParams
          Columns = <
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BASED_ON'
              Title.Caption = 'Based On'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PERCENT'
              Title.Caption = 'Percent'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'FLAT_AMOUNT'
              Title.Caption = 'Flat Amount'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SQL_FORMULA'
              Title.Caption = 'Sql Formula'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EXCLUDE_COMMISSIONS'
              Title.Caption = 'Exclude Commissions'
              Width = 64
              CheckBoxField.FieldValues = 'Y;N'
            end
            item
              FieldName = 'CASH_BACK'
              Title.Caption = 'Cash Back'
              Width = 64
              CheckBoxField.FieldValues = 'Y;N'
            end
            item
              FieldName = 'EFFECT_DATE'
              Title.Caption = 'Effective Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CUSER1'
              Title.Caption = 'CUSER1'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CUSER2'
              Title.Caption = 'CUSER2'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CUSER3'
              Title.Caption = 'CUSER3'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'NUSER1'
              Title.Caption = 'NUSER1'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'NUSER2'
              Title.Caption = 'NUSER2'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'NUSER3'
              Title.Caption = 'NUSER3'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACCT'
              Title.Caption = 'GL Account'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DEACTIVE_DATE'
              Title.Caption = 'Inactive Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
          object wwDBCBGrid: TUniDBComboBox
            Left = 224
            Top = 88
            Width = 121
            Height = 21
            Hint = ''
            Items.Strings = (
              'Items'
              'Total Sales')
            TabOrder = 2
          end
          object wwDBCDFomulaGrid: TUniEdit
            Left = 224
            Top = 120
            Width = 121
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 4
          end
          object wwDBCDAcctGrid: TUniEdit
            Left = 224
            Top = 160
            Width = 121
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 3
          end
        end
      end
      object TabForm: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'TabForm'
        object Splitter1: TUniSplitter
          Left = 110
          Top = 0
          Width = 6
          Height = 398
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Splitter2: TUniSplitter
          Left = 393
          Top = 0
          Width = 6
          Height = 398
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Splitter3: TUniSplitter
          Left = 511
          Top = 0
          Width = 6
          Height = 398
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel3: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 110
          Height = 398
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 6
            Top = 11
            Width = 53
            Height = 13
            Hint = ''
            Caption = 'Description'
            TabOrder = 1
          end
          object Label2: TUniLabel
            Left = 6
            Top = 35
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Based On'
            TabOrder = 2
          end
          object Label3: TUniLabel
            Left = 6
            Top = 59
            Width = 37
            Height = 13
            Hint = ''
            Caption = 'Percent'
            TabOrder = 3
          end
          object Label4: TUniLabel
            Left = 6
            Top = 83
            Width = 58
            Height = 13
            Hint = ''
            Caption = 'Flat Amount'
            TabOrder = 4
          end
          object Label5: TUniLabel
            Left = 6
            Top = 219
            Width = 60
            Height = 13
            Hint = ''
            Caption = 'SQL Formula'
            TabOrder = 5
          end
          object Label8: TUniLabel
            Left = 6
            Top = 171
            Width = 69
            Height = 13
            Hint = ''
            Caption = 'Effective Date'
            TabOrder = 6
          end
          object Label9: TUniLabel
            Left = 6
            Top = 195
            Width = 65
            Height = 13
            Hint = ''
            Caption = 'Inactive Date'
            TabOrder = 7
          end
          object Label10: TUniLabel
            Left = 6
            Top = 107
            Width = 54
            Height = 13
            Hint = ''
            Caption = 'GL Account'
            TabOrder = 8
          end
        end
        object Panel4: TUniPanel
          Tag = 1999
          Left = 116
          Top = 0
          Width = 277
          Height = 398
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            277
            398)
          object wwDBBasedOnForm: TUniDBComboBox
            Left = 0
            Top = 32
            Width = 266
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'BASED_ON'
            DataSource = SrcParams
            Items.Strings = (
              'Items'
              'Total Sales')
            TabOrder = 1
          end
          object wwDBGlAcctForm: TUniEdit
            Left = 0
            Top = 104
            Width = 266
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object DBDescrip: TUniDBEdit
            Left = 0
            Top = 8
            Width = 266
            Height = 21
            Hint = ''
            DataField = 'DESCRIP'
            DataSource = SrcParams
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object DBPrecent: TUniDBEdit
            Left = 0
            Top = 56
            Width = 266
            Height = 21
            Hint = ''
            DataField = 'PERCENT'
            DataSource = SrcParams
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object DBFlatrAmount: TUniDBEdit
            Left = 0
            Top = 80
            Width = 266
            Height = 21
            Hint = ''
            DataField = 'FLAT_AMOUNT'
            DataSource = SrcParams
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object DBMemoSql: TUniDBMemo
            Left = 0
            Top = 216
            Width = 267
            Height = 111
            Hint = ''
            DataField = 'SQL_FORMULA'
            DataSource = SrcParams
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 9
          end
          object DBExclComm: TUniDBCheckBox
            Left = 0
            Top = 128
            Width = 129
            Height = 17
            Hint = ''
            DataField = 'EXCLUDE_COMMISSIONS'
            DataSource = SrcParams
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Exclude Commissions'
            TabOrder = 5
          end
          object DBCashBack: TUniDBCheckBox
            Left = 0
            Top = 144
            Width = 69
            Height = 17
            Hint = ''
            DataField = 'CASH_BACK'
            DataSource = SrcParams
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Cash Back'
            TabOrder = 6
          end
          object wwDBEffDate: TUniDateTimePicker
            Left = 0
            Top = 168
            Width = 266
            Height = 21
            Hint = ''
            DateTime = 42647.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
          end
          object wwDBDeActDate: TUniDateTimePicker
            Left = 0
            Top = 192
            Width = 266
            Height = 21
            Hint = ''
            DateTime = 42647.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
          end
        end
        object Panel5: TUniPanel
          Tag = 1999
          Left = 399
          Top = 0
          Width = 112
          Height = 398
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
          Caption = ''
          object IQUserDefLabel7: TIQWebUserDefLabel
            Left = 6
            Top = 11
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 1'
            TabOrder = 1
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel8: TIQWebUserDefLabel
            Left = 6
            Top = 35
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 2'
            TabOrder = 2
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel9: TIQWebUserDefLabel
            Left = 6
            Top = 59
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 3'
            TabOrder = 3
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel10: TIQWebUserDefLabel
            Left = 6
            Top = 83
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 1'
            TabOrder = 4
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel11: TIQWebUserDefLabel
            Left = 6
            Top = 107
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 2'
            TabOrder = 5
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel12: TIQWebUserDefLabel
            Left = 6
            Top = 131
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 3'
            TabOrder = 6
            ParentAppName = 'IQWIN32.EXE'
          end
        end
        object Panel11: TUniPanel
          Tag = 1999
          Left = 517
          Top = 0
          Width = 342
          Height = 398
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 3
          Caption = ''
          DesignSize = (
            342
            398)
          object DBEdit46: TUniDBEdit
            Left = 0
            Top = 8
            Width = 345
            Height = 21
            Hint = ''
            DataField = 'CUSER1'
            DataSource = SrcParams
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object DBEdit47: TUniDBEdit
            Left = 0
            Top = 32
            Width = 345
            Height = 21
            Hint = ''
            DataField = 'CUSER2'
            DataSource = SrcParams
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object DBEdit48: TUniDBEdit
            Left = 0
            Top = 56
            Width = 345
            Height = 21
            Hint = ''
            DataField = 'CUSER3'
            DataSource = SrcParams
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object DBEdit49: TUniDBEdit
            Left = 0
            Top = 80
            Width = 345
            Height = 21
            Hint = ''
            DataField = 'NUSER1'
            DataSource = SrcParams
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object DBEdit50: TUniDBEdit
            Left = 0
            Top = 104
            Width = 345
            Height = 21
            Hint = ''
            DataField = 'NUSER2'
            DataSource = SrcParams
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object DBEdit4: TUniDBEdit
            Left = 0
            Top = 128
            Width = 345
            Height = 21
            Hint = ''
            DataField = 'NUSER3'
            DataSource = SrcParams
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 152
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
      object New1: TUniMenuItem
        Caption = '&New'
        OnClick = New1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Search1: TUniMenuItem
        Caption = 'Search...'
        OnClick = SBSearchClick
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Rebate Parameters'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 190283 $'
    BuildVersion = '176554'
    Left = 128
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'Nav'
      'SBToggle'
      '')
    SecurityCode = 'FRMREBATEPARAM'
    Left = 184
  end
  object SrcParams: TDataSource
    DataSet = QryParams
    Left = 232
    Top = 8
  end
  object QryParams: TFDQuery
    BeforePost = QryParamsBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'rebate_params'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select p.id,'
      '       p.descrip,'
      '       p.based_on,'
      '       p.percent,'
      '       p.flat_amount,'
      '       p.sql_formula,'
      '       p.exclude_commissions,'
      '       p.cash_back,'
      '       p.effect_date,'
      '       p.DEACTIVE_DATE,'
      '       p.glacct_id,'
      '       p.cuser1,'
      '       p.cuser2,'
      '       p.cuser3,'
      '       p.nuser1,'
      '       p.nuser2,'
      '       p.nuser3,'
      '       g.acct'
      '  from rebate_params p,'
      '       glacct g'
      ' where p.glacct_id = g.id(+)')
    Left = 256
    Top = 16
    object QryParamsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'P.DESCRIP'
      Size = 100
    end
    object QryParamsBASED_ON: TStringField
      DisplayLabel = 'Based On'
      DisplayWidth = 20
      FieldName = 'BASED_ON'
      Origin = 'P.BASED_ON'
      Size = 100
    end
    object QryParamsPERCENT: TFMTBCDField
      DisplayLabel = 'Percent'
      DisplayWidth = 10
      FieldName = 'PERCENT'
      Origin = 'P.PERCENT'
      Size = 6
    end
    object QryParamsFLAT_AMOUNT: TBCDField
      DisplayLabel = 'Flat Amount'
      DisplayWidth = 10
      FieldName = 'FLAT_AMOUNT'
      Origin = 'P.FLAT_AMOUNT'
      Size = 2
    end
    object QryParamsSQL_FORMULA: TStringField
      DisplayLabel = 'Sql Formula'
      DisplayWidth = 10
      FieldName = 'SQL_FORMULA'
      Origin = 'P.SQL_FORMULA'
      Size = 4000
    end
    object QryParamsEXCLUDE_COMMISSIONS: TStringField
      DisplayLabel = 'Exclude Commissions'
      DisplayWidth = 1
      FieldName = 'EXCLUDE_COMMISSIONS'
      Origin = 'P.EXCLUDE_COMMISSIONS'
      Size = 1
    end
    object QryParamsCASH_BACK: TStringField
      DisplayLabel = 'Cash Back'
      DisplayWidth = 1
      FieldName = 'CASH_BACK'
      Origin = 'P.CASH_BACK'
      Size = 1
    end
    object QryParamsEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
      Origin = 'P.EFFECT_DATE'
    end
    object QryParamsCUSER1: TStringField
      DisplayWidth = 10
      FieldName = 'CUSER1'
      Origin = 'P.CUSER1'
      Size = 60
    end
    object QryParamsCUSER2: TStringField
      DisplayWidth = 10
      FieldName = 'CUSER2'
      Origin = 'P.CUSER2'
      Size = 60
    end
    object QryParamsCUSER3: TStringField
      DisplayWidth = 10
      FieldName = 'CUSER3'
      Origin = 'P.CUSER3'
      Size = 60
    end
    object QryParamsNUSER1: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER1'
      Origin = 'P.NUSER1'
      Size = 6
    end
    object QryParamsNUSER2: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER2'
      Origin = 'P.NUSER2'
      Size = 6
    end
    object QryParamsNUSER3: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER3'
      Origin = 'P.NUSER3'
      Size = 6
    end
    object QryParamsACCT: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 50
      FieldName = 'ACCT'
      Origin = 'G.ACCT'
      Size = 50
    end
    object QryParamsDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
      Origin = 'p.DEACTIVE_DATE'
    end
    object QryParamsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'P.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryParamsGLACCT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID'
      Origin = 'P.GLACCT_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into rebate_params'
      '  (ID, DESCRIP, BASED_ON, PERCENT, FLAT_AMOUNT, SQL_FORMULA, '
      'EXCLUDE_COMMISSIONS, '
      '   CASH_BACK, EFFECT_DATE, GLACCT_ID, CUSER1, CUSER2, CUSER3, '
      'NUSER1, NUSER2, '
      '   NUSER3, DEACTIVE_DATE)'
      'values'
      
        '  (:ID, :DESCRIP, :BASED_ON, :PERCENT, :FLAT_AMOUNT, :SQL_FORMUL' +
        'A,'
      ':EXCLUDE_COMMISSIONS,'
      
        '   :CASH_BACK, :EFFECT_DATE, :GLACCT_ID, :CUSER1, :CUSER2, :CUSE' +
        'R3,'
      ':NUSER1,'
      '   :NUSER2, :NUSER3, :DEACTIVE_DATE)')
    ModifySQL.Strings = (
      'update rebate_params'
      'set'
      '  ID = :ID,'
      '  DESCRIP = :DESCRIP,'
      '  BASED_ON = :BASED_ON,'
      '  PERCENT = :PERCENT,'
      '  FLAT_AMOUNT = :FLAT_AMOUNT,'
      '  SQL_FORMULA = :SQL_FORMULA,'
      '  EXCLUDE_COMMISSIONS = :EXCLUDE_COMMISSIONS,'
      '  CASH_BACK = :CASH_BACK,'
      '  EFFECT_DATE = :EFFECT_DATE,'
      '  DEACTIVE_DATE = :DEACTIVE_DATE,'
      '  GLACCT_ID = :GLACCT_ID,'
      '  CUSER1 = :CUSER1,'
      '  CUSER2 = :CUSER2,'
      '  CUSER3 = :CUSER3,'
      '  NUSER1 = :NUSER1,'
      '  NUSER2 = :NUSER2,'
      '  NUSER3 = :NUSER3'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from rebate_params'
      'where'
      '  ID = :OLD_ID')
    Left = 272
    Top = 24
  end
  object PKAcct: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       acct,'
      '       descrip,'
      '       type,'
      '       eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      ' where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      '    and  NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39
      '    and misc.eplant_filter(eplant_id) = 1'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 592
    object PKAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKAcctACCT: TStringField
      DisplayLabel = 'Account'
      FieldName = 'ACCT'
      Size = 50
    end
    object PKAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PKAcctTYPE: TStringField
      DisplayLabel = 'Account Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object PKAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.EPLANT_ID'
      Size = 0
    end
  end
  object popmEditUserLabel: TUniPopupMenu
    Left = 523
    Top = 5
    object DefineLabelText2: TUniMenuItem
      Caption = '&Define Label Text'
      OnClick = DefineLabelText2Click
    end
  end
  object PkParams: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id as id,'
      '       p.descrip as descrip,'
      '       p.based_on as based_on,'
      '       p.percent as percent,'
      '       p.flat_amount as flat_amount,'
      '       p.sql_formula as sql_formula,'
      '       p.exclude_commissions as exclude_commissions,'
      '       p.cash_back as cash_back,'
      '       p.effect_date as effect_date,'
      '       p.DEACTIVE_DATE as DEACTIVE_DATE,'
      '       p.glacct_id as glacct_id,'
      '       g.acct as acct'
      '  from rebate_params p,'
      '       glacct g'
      ' where p.glacct_id = g.id(+)'
      '')
    OnIQModify = PkParamsIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 560
    object PkParamsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkParamsDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkParamsBASED_ON: TStringField
      DisplayLabel = 'Based On'
      FieldName = 'BASED_ON'
      Size = 100
    end
    object PkParamsPERCENT: TFMTBCDField
      DisplayLabel = 'Percent'
      FieldName = 'PERCENT'
      Size = 6
    end
    object PkParamsFLAT_AMOUNT: TBCDField
      DisplayLabel = 'Flat Amount'
      FieldName = 'FLAT_AMOUNT'
      Size = 2
    end
    object PkParamsEXCLUDE_COMMISSIONS: TStringField
      DisplayLabel = 'Exclude Comissions'
      FieldName = 'EXCLUDE_COMMISSIONS'
      Size = 1
    end
    object PkParamsCASH_BACK: TStringField
      DisplayLabel = 'Cash Back'
      FieldName = 'CASH_BACK'
      Size = 1
    end
    object PkParamsEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      FieldName = 'EFFECT_DATE'
    end
    object PkParamsDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'InActive Date'
      FieldName = 'DEACTIVE_DATE'
    end
    object PkParamsGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Visible = False
      Size = 0
    end
    object PkParamsACCT: TStringField
      DisplayLabel = 'GL Account'
      FieldName = 'ACCT'
      Size = 50
    end
  end
end
