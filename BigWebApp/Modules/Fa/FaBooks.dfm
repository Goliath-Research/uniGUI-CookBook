object FrmFaBooks: TFrmFaBooks
  Left = 70
  Top = 163
  HelpContext = 5000249
  ClientHeight = 300
  ClientWidth = 856
  Caption = 'Fixed Assets Books'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PC: TUniPageControl
    Left = 0
    Top = 30
    Width = 856
    Height = 270
    Hint = ''
    ActivePage = TabForm
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabForm: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'TabForm'
      object Splitter2: TUniSplitter
        Left = 433
        Top = 0
        Width = 6
        Height = 242
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel2: TUniPanel
        Left = 0
        Top = 0
        Width = 433
        Height = 242
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 258
          Top = 1
          Width = 6
          Height = 240
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel3: TUniPanel
          Left = 1
          Top = 1
          Width = 257
          Height = 240
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 6
            Top = 8
            Width = 53
            Height = 13
            Hint = ''
            Caption = 'Description'
            TabOrder = 1
          end
          object Label2: TUniLabel
            Left = 6
            Top = 33
            Width = 24
            Height = 13
            Hint = ''
            Caption = 'Type'
            TabOrder = 2
          end
          object Label3: TUniLabel
            Left = 6
            Top = 58
            Width = 99
            Height = 13
            Hint = ''
            Caption = 'Depreciation Method'
            TabOrder = 3
          end
          object Label4: TUniLabel
            Left = 6
            Top = 83
            Width = 74
            Height = 13
            Hint = ''
            Caption = 'Declining Bal.%'
            TabOrder = 4
          end
          object Label5: TUniLabel
            Left = 6
            Top = 109
            Width = 55
            Height = 13
            Hint = ''
            Caption = 'Convention'
            TabOrder = 5
          end
          object Label6: TUniLabel
            Left = 6
            Top = 134
            Width = 70
            Height = 13
            Hint = ''
            Caption = 'Property Class'
            TabOrder = 6
          end
          object Label7: TUniLabel
            Left = 6
            Top = 159
            Width = 55
            Height = 13
            Hint = ''
            Caption = 'Asset Class'
            TabOrder = 7
          end
          object Label11: TUniLabel
            Left = 6
            Top = 210
            Width = 112
            Height = 13
            Hint = ''
            Caption = 'Depreciation Procedure'
            TabOrder = 8
          end
          object Label29: TUniLabel
            Left = 6
            Top = 184
            Width = 62
            Height = 13
            Hint = ''
            Caption = 'Posting Basis'
            TabOrder = 9
          end
        end
        object Panel7: TUniPanel
          Left = 264
          Top = 1
          Width = 168
          Height = 240
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            168
            240)
          object dbDescrip: TUniDBEdit
            Left = 6
            Top = 4
            Width = 160
            Height = 21
            Hint = ''
            DataField = 'DESCRIP'
            DataSource = SrcBooks
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object wwDBDeprForm: TUniDBComboBox
            Left = 6
            Top = 54
            Width = 160
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'DEPRECIATION_METHOD'
            DataSource = SrcBooks
            Style = csDropDownList
            Items.Strings = (
              'Straight Line'#9'SL'
              'Units of Production Method'#9'UOP'
              'Fixed Declining Balance'#9'FDB'
              'General Declining Balance'#9'GDB'
              'Sum of Years Digits'#9'SYD'
              'MACRS_GDS'#9'MACRS_GDS'
              'MACRS_ADS'#9'MACRS_ADS'
              'ACRS'#9'ACRS'
              'ACE'#9'ACE'
              'AMT'#9'ANT'
              'Variable / Double Declining Balance'#9'VDB')
            TabOrder = 2
          end
          object dbBookTypeForm: TUniDBComboBox
            Left = 6
            Top = 29
            Width = 160
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'BOOK_TYPE'
            DataSource = SrcBooks
            Items.Strings = (
              'Financial'
              'Tax'
              'AMT'
              'ACE'
              'State')
            ItemIndex = 0
            TabOrder = 1
          end
          object dbDeclBal: TUniDBEdit
            Left = 6
            Top = 80
            Width = 160
            Height = 21
            Hint = ''
            DataField = 'DECLINING_BAL_PERCENT'
            DataSource = SrcBooks
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object dbConvForm: TUniDBComboBox
            Left = 6
            Top = 105
            Width = 160
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'CONVENTION'
            DataSource = SrcBooks
            Style = csDropDownList
            Items.Strings = (
              'Half Year'#9'HY'
              'Mid Month'#9'MM'
              'Mid Quarter'#9'MQ')
            TabOrder = 4
          end
          object dbPropClassForm: TUniDBComboBox
            Left = 6
            Top = 130
            Width = 160
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'PROPERTY_CLASS'
            DataSource = SrcBooks
            Style = csDropDownList
            Items.Strings = (
              '3yr Property'#9'3'
              '5yr Property'#9'5'
              '7yr Property'#9'7'
              '10yr Property'#9'10'
              '15yr Property'#9'15'
              '20yr Property'#9'20'
              '25yr Property'#9'25'
              'Residential Rental'#9'27.5'
              'Non-Residential Real'#9'39')
            TabOrder = 5
          end
          object dbPostingBasisform: TUniDBComboBox
            Left = 6
            Top = 181
            Width = 160
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'POSTING_BASIS'
            DataSource = SrcBooks
            Style = csDropDownList
            Items.Strings = (
              'Yearly'#9'YY'
              'Quarterly'#9'QT'
              'Monthly'#9'MM')
            TabOrder = 7
          end
          object dbAssetClassForm: TUniEdit
            Left = 6
            Top = 156
            Width = 160
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            OnKeyDown = dbAssetClassFormKeyDown
          end
          object dbProc: TUniEdit
            Left = 6
            Top = 207
            Width = 160
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
          end
        end
      end
      object Panel4: TUniPanel
        Left = 439
        Top = 0
        Width = 409
        Height = 242
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter3: TUniSplitter
          Left = 122
          Top = 1
          Width = 6
          Height = 240
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel6: TUniPanel
          Left = 128
          Top = 1
          Width = 280
          Height = 240
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            280
            240)
          object dbBusinessUse: TUniDBEdit
            Left = 6
            Top = 4
            Width = 260
            Height = 21
            Hint = ''
            DataField = 'BUSINESS_USE_PRCNT'
            DataSource = SrcBooks
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object dbITCAmount: TUniDBEdit
            Left = 6
            Top = 31
            Width = 260
            Height = 21
            Hint = ''
            DataField = 'ITC_AMOUNT'
            DataSource = SrcBooks
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object dbSec179: TUniDBEdit
            Left = 6
            Top = 58
            Width = 260
            Height = 21
            Hint = ''
            DataField = 'SECTION_179_DED'
            DataSource = SrcBooks
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object dbSec1250: TUniDBCheckBox
            Tag = 1999
            Left = 6
            Top = 105
            Width = 138
            Height = 17
            Hint = ''
            DataField = 'SEC_1250_REAL_PROPERTY'
            DataSource = SrcBooks
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Sec. 1250 Real Property'
            TabOrder = 3
          end
          object dbSec1245: TUniDBCheckBox
            Tag = 1999
            Left = 6
            Top = 125
            Width = 138
            Height = 17
            Hint = ''
            DataField = 'SEC_1245_PROPERTY'
            DataSource = SrcBooks
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Sec. 1245 Property'
            TabOrder = 4
          end
          object dbListedProp: TUniDBCheckBox
            Tag = 1999
            Left = 6
            Top = 145
            Width = 138
            Height = 17
            Hint = ''
            DataField = 'LISTED_PROPERTY'
            DataSource = SrcBooks
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Listed Property'
            TabOrder = 5
          end
          object dbNyLiberty: TUniDBCheckBox
            Tag = 1999
            Left = 6
            Top = 165
            Width = 138
            Height = 17
            Hint = ''
            DataField = 'NY_LIBERTY_ZONE'
            DataSource = SrcBooks
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'NY Liberty Zone'
            TabOrder = 6
          end
          object dbAmortized: TUniDBCheckBox
            Tag = 1999
            Left = 6
            Top = 185
            Width = 138
            Height = 17
            Hint = ''
            DataField = 'AMORTIZED'
            DataSource = SrcBooks
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Amortized'
            TabOrder = 7
          end
        end
        object Panel5: TUniPanel
          Left = 1
          Top = 1
          Width = 121
          Height = 240
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 1
          Caption = ''
          object Label8: TUniLabel
            Left = 3
            Top = 8
            Width = 76
            Height = 13
            Hint = ''
            Caption = 'Business Use %'
            TabOrder = 1
          end
          object Label9: TUniLabel
            Left = 3
            Top = 33
            Width = 57
            Height = 13
            Hint = ''
            Caption = 'ITC Amount'
            TabOrder = 2
          end
          object Label10: TUniLabel
            Left = 3
            Top = 57
            Width = 93
            Height = 13
            Hint = ''
            Caption = 'Sec. 179 Deduction'
            TabOrder = 3
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
        848
        242)
      object GridBooks: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 848
        Height = 242
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 631
        IQComponents.Grid.Height = 156
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcBooks
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
        IQComponents.Navigator.DataSource = SrcBooks
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 631
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 156
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcBooks
        Columns = <
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DEPRECIATION_METHOD'
            Title.Caption = 'Depreciation Method'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BOOK_TYPE'
            Title.Caption = 'Book Type'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DECLINING_BAL_PERCENT'
            Title.Caption = 'Declining Bal. %'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CONVENTION'
            Title.Caption = 'Convention'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PROPERTY_CLASS'
            Title.Caption = 'Property Class'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SEC_1250_REAL_PROPERTY'
            Title.Caption = 'Sec. 1250'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end
          item
            FieldName = 'SEC_1245_PROPERTY'
            Title.Caption = 'Sec. 1245'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end
          item
            FieldName = 'LISTED_PROPERTY'
            Title.Caption = 'Listed Property'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end
          item
            FieldName = 'AMORTIZED'
            Title.Caption = 'Amortized'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end
          item
            FieldName = 'BUSINESS_USE_PRCNT'
            Title.Caption = 'Business Use %'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ITC_AMOUNT'
            Title.Caption = 'ITC Amount'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SECTION_179_DED'
            Title.Caption = 'Sec. 179 Deduction'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NY_LIBERTY_ZONE'
            Title.Caption = 'NY Liberty Zone'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end
          item
            FieldName = 'PROCEDURE_TO_RUN'
            Title.Caption = 'Procedure to execute to calculate depreciati'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'on'
            Title.Caption = 'Update this Blank Field'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'POSTING_BASIS'
            Title.Caption = 'Posting basis'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'AssetClass'
            Title.Caption = 'Asset Class'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
      object dbBookTypeGrid: TUniDBComboBox
        Left = 104
        Top = 29
        Width = 506
        Height = 21
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_TYPE'
        DataSource = SrcBooks
        Items.Strings = (
          'Financial'
          'Tax'
          'AMT'
          'ACE'
          'State')
        ItemIndex = 0
        TabOrder = 1
      end
      object dbDeprGrid: TUniDBComboBox
        Left = 104
        Top = 55
        Width = 506
        Height = 21
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DEPRECIATION_METHOD'
        DataSource = SrcBooks
        Style = csDropDownList
        Items.Strings = (
          'Straight Line'#9'SL'
          'Units of Production Method'#9'UOP'
          'Fixed Declining Balance'#9'FDB'
          'General Declining Balance'#9'GDB'
          'Sum of Years Digits'#9'SYD'
          'MACRS_GDS'#9'MACRS_GDS'
          'MACRS_ADS'#9'MACRS_ADS'
          'ACRS'#9'ACRS'
          'ACE'#9'ACE'
          'AMT'#9'ANT')
        TabOrder = 2
      end
      object dbConvGrid: TUniDBComboBox
        Left = 104
        Top = 106
        Width = 506
        Height = 21
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        DataField = 'CONVENTION'
        DataSource = SrcBooks
        Style = csDropDownList
        Items.Strings = (
          'Half Year'#9'HY'
          'Mid Month'#9'MM'
          'Mid Quarter'#9'MQ')
        TabOrder = 3
      end
      object dbPropClassGrid: TUniDBComboBox
        Left = 104
        Top = 132
        Width = 506
        Height = 21
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        DataField = 'PROPERTY_CLASS'
        DataSource = SrcBooks
        Style = csDropDownList
        Items.Strings = (
          '3yr Property'#9'3'
          '5yr Property'#9'5'
          '7yr Property'#9'7'
          '10yr Property'#9'10'
          '15yr Property'#9'15'
          '20yr Property'#9'20'
          '25yr Property'#9'25'
          'Residetial Rental'#9'27.5'
          'Non-Residential Real'#9'39')
        TabOrder = 4
      end
      object dbprocGrid: TUniEdit
        Left = 104
        Top = 160
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 5
      end
      object dbPostingBasisGrid: TUniDBComboBox
        Left = 128
        Top = 192
        Width = 525
        Height = 21
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        Style = csDropDownList
        Items.Strings = (
          'Yearly'#9'YY'
          'Quarterly'#9'QT'
          'Monthly'#9'MM')
        TabOrder = 6
      end
      object dbAssetClasGrid: TUniEdit
        Left = 266
        Top = 166
        Width = 506
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        OnKeyDown = dbAssetClassFormKeyDown
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 856
    Height = 30
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object SBSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 28
      Height = 27
      Hint = 'Search...'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
        90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
        40905030773818FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
        00FFFF00FFB08060F0E8E0E0C8C0D0A890B07850804820FF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
        00FFFF00FFB08060F0E8E0F0E0E0E0C0B0C08870804830FF00FFC09880FFFFFF
        F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FFC3A494B08870A068509050308048308048208038108F
        4C26B08870A06850905830904830804020703810905830FF00FFDEC4B4B08870
        FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
        50803820CFA98AFF00FFFF00FFC09080F0F0F0FFF8F0F0D8C0B0806080482096
        5732B09070FFFFFFFFF8F0F0D0C0B07850804820FF00FFFF00FFFF00FFF8E2D2
        C09880B08060A068509050309058409D6842B07860B08870A070508048308048
        20ECC4A7FF00FFFF00FFFF00FFFF00FFC09880FFF8FFE0C0B0C09070804820FF
        00FFC09880FFF8FFE0C8B0D0A080804820FF00FFFF00FFFF00FFFF00FFFF00FF
        CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
        37FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1836DFFF8F0814527FF00FFFF
        00FFFF00FFB08068FFF8F0804324FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SBSearchClick
    end
    object SBToggle: TUniSpeedButton
      Left = 29
      Top = 1
      Width = 28
      Height = 27
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
    object Nav: TUniDBNavigator
      Left = 615
      Top = 1
      Width = 240
      Height = 28
      Hint = ''
      DataSource = SrcBooks
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 64
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = '&New'
        OnClick = New1Click
      end
      object Search1: TUniMenuItem
        Caption = '&Search'
        OnClick = SBSearchClick
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
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
    ModuleName = 'Fixed Assets Books'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195776 $'
    BuildVersion = '176554'
    Left = 96
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'dbDescrip'
      'wwDBDeprForm'
      'dbBookTypeForm'
      'dbDeclBal'
      'dbConvForm'
      'dbPropClassForm'
      'dbAssetClass'
      'dbBusinessUse'
      'dbITCAmount'
      'dbSec179'
      'dbSec1250'
      'dbSec1245'
      'dbListedProp'
      'dbNyLiberty'
      'dbAmortized'
      'dbBookTypeGrid'
      'dbDeprGrid'
      'dbConvGrid'
      'dbPropClassGrid'
      'SBSearch'
      'SBToggle'
      'Nav'
      'MainMenu1'
      'File1'
      'New1'
      'Search1')
    SecurityCode = 'FRMFABOOKS'
    Left = 128
  end
  object SrcBooks: TDataSource
    DataSet = TblBooks
    Left = 156
    Top = 65534
  end
  object TblBooks: TFDTable
    BeforePost = TblBooksBeforePost
    OnCalcFields = TblBooksCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'FA_BOOK_TEMPLATE'
    TableName = 'FA_BOOK_TEMPLATE'
    Left = 164
    Top = 65534
    object TblBooksDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Required = True
      Size = 60
    end
    object TblBooksDEPRECIATION_METHOD: TStringField
      DisplayLabel = 'Depreciation Method '
      DisplayWidth = 15
      FieldName = 'DEPRECIATION_METHOD'
      Size = 15
    end
    object TblBooksBOOK_TYPE: TStringField
      DisplayLabel = 'Book Type'
      DisplayWidth = 15
      FieldName = 'BOOK_TYPE'
      Required = True
      Size = 15
    end
    object TblBooksDECLINING_BAL_PERCENT: TBCDField
      DisplayLabel = 'Declining Bal. %'
      DisplayWidth = 10
      FieldName = 'DECLINING_BAL_PERCENT'
    end
    object TblBooksCONVENTION: TStringField
      DisplayLabel = 'Convention'
      DisplayWidth = 2
      FieldName = 'CONVENTION'
      Size = 2
    end
    object TblBooksPROPERTY_CLASS: TStringField
      DisplayLabel = 'Property Class'
      DisplayWidth = 25
      FieldName = 'PROPERTY_CLASS'
      Size = 25
    end
    object TblBooksSEC_1250_REAL_PROPERTY: TStringField
      DisplayLabel = 'Sec. 1250'
      DisplayWidth = 1
      FieldName = 'SEC_1250_REAL_PROPERTY'
      FixedChar = True
      Size = 1
    end
    object TblBooksSEC_1245_PROPERTY: TStringField
      DisplayLabel = 'Sec. 1245'
      DisplayWidth = 1
      FieldName = 'SEC_1245_PROPERTY'
      FixedChar = True
      Size = 1
    end
    object TblBooksLISTED_PROPERTY: TStringField
      DisplayLabel = 'Listed Property'
      DisplayWidth = 1
      FieldName = 'LISTED_PROPERTY'
      FixedChar = True
      Size = 1
    end
    object TblBooksAMORTIZED: TStringField
      DisplayLabel = 'Amortized'
      DisplayWidth = 1
      FieldName = 'AMORTIZED'
      FixedChar = True
      Size = 1
    end
    object TblBooksBUSINESS_USE_PRCNT: TBCDField
      DisplayLabel = 'Business Use %'
      DisplayWidth = 10
      FieldName = 'BUSINESS_USE_PRCNT'
    end
    object TblBooksITC_AMOUNT: TBCDField
      DisplayLabel = 'ITC Amount'
      DisplayWidth = 10
      FieldName = 'ITC_AMOUNT'
      Size = 2
    end
    object TblBooksSECTION_179_DED: TBCDField
      DisplayLabel = 'Sec. 179 Deduction'
      DisplayWidth = 10
      FieldName = 'SECTION_179_DED'
      Size = 2
    end
    object TblBooksNY_LIBERTY_ZONE: TStringField
      DisplayLabel = 'NY Liberty Zone'
      DisplayWidth = 1
      FieldName = 'NY_LIBERTY_ZONE'
      FixedChar = True
      Size = 1
    end
    object TblBooksPROCEDURE_TO_RUN: TStringField
      DisplayLabel = 'Procedure to execute to calculate depreciation'
      DisplayWidth = 20
      FieldName = 'PROCEDURE_TO_RUN'
      Size = 50
    end
    object TblBooksPOSTING_BASIS: TStringField
      DisplayLabel = 'Posting basis'
      DisplayWidth = 2
      FieldName = 'POSTING_BASIS'
      Size = 2
    end
    object TblBooksAssetClass: TStringField
      DisplayLabel = 'Asset Class'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'AssetClass'
      Calculated = True
    end
    object TblBooksID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblBooksFA_MACRS_CLASS_LIFE_ID: TBCDField
      FieldName = 'FA_MACRS_CLASS_LIFE_ID'
      Visible = False
      Size = 0
    end
  end
  object PkFaBooks: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, descrip, book_type from fa_book_template')
    OnIQModify = PkFaBooksIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 196
    Top = 65534
    object PkFaBooksID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FA_BOOK.ID'
      Visible = False
      Size = 0
    end
    object PkFaBooksDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.FA_BOOK.DESCRIP'
      Size = 60
    end
    object PkFaBooksBOOK_TYPE: TStringField
      DisplayLabel = 'Book Type'
      FieldName = 'BOOK_TYPE'
      Origin = 'IQ.FA_BOOK.BOOK_TYPE'
      Size = 15
    end
  end
  object PkProc: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct object_name as object_name'
      '  from all_arguments'
      ' where'
      '       owner = '#39'IQMS'#39
      '   and package_name = '#39'FA'#39
      '   and SubStr(object_name, 1, 5) <> '#39'FA_CV'#39
      '   and Upper(object_name) <> '#39'FA_CONVENTION_CORRECTION'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 232
    object PkProcOBJECT_NAME: TStringField
      DisplayLabel = 'Procedure'
      FieldName = 'OBJECT_NAME'
      Origin = 'IQ.ALL_ARGUMENTS.OBJECT_NAME'
      Size = 30
    end
  end
  object PkAssetClass: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       asset_class as asset_class,'
      '       substr(descrip, 1, 500) as descrip,'
      '       gds as gds,'
      '       ads as ads,'
      '       class_life as class_life'
      '  from FA_MACRS_CLASS_LIFE'
      '           ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 388
    Top = 132
    object PkAssetClassID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAssetClassASSET_CLASS: TStringField
      DisplayLabel = 'Asset Class'
      FieldName = 'ASSET_CLASS'
      Size = 10
    end
    object PkAssetClassDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 500
    end
    object PkAssetClassGDS: TBCDField
      FieldName = 'GDS'
      Size = 2
    end
    object PkAssetClassADS: TBCDField
      FieldName = 'ADS'
      Size = 2
    end
    object PkAssetClassCLASS_LIFE: TBCDField
      DisplayLabel = 'Class Life'
      FieldName = 'CLASS_LIFE'
      Size = 2
    end
  end
end
