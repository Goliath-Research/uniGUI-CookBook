object FrmDefPeriods: TFrmDefPeriods
  Left = 320
  Top = 142
  ClientHeight = 564
  ClientWidth = 569
  Caption = 'Define GL Year Periods'
  OnShow = FormShow
  OldCreateOrder = True
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
    Width = 569
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBSearchPurch: TUniSpeedButton
      Left = 2
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
      OnClick = SBSearchPurchClick
    end
    object Panel5: TUniPanel
      Left = 343
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object NavYear: TUniDBNavigator
        Left = -1
        Top = 1
        Width = 225
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = GL_DM.SrcGlYear
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 530
    Width = 569
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 460
      Top = 1
      Width = 108
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BitBtnOk: TUniBitBtn
        Left = 3
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 0
        OnClick = BitBtnOkClick
      end
    end
  end
  object Panel6: TUniPanel
    Left = 0
    Top = 27
    Width = 569
    Height = 133
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 123
      Top = 1
      Width = 6
      Height = 131
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 122
      Height = 131
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label8: TUniLabel
        Left = 8
        Top = 12
        Width = 103
        Height = 13
        Hint = ''
        Caption = 'Start Date of GL Year'
        TabOrder = 1
      end
      object Label9: TUniLabel
        Left = 8
        Top = 36
        Width = 97
        Height = 13
        Hint = ''
        Caption = 'End Date of GL Year'
        TabOrder = 2
      end
      object Label6: TUniLabel
        Left = 8
        Top = 60
        Width = 93
        Height = 13
        Hint = ''
        Caption = 'GL Year Description'
        TabOrder = 3
      end
      object Label1: TUniLabel
        Left = 8
        Top = 84
        Width = 72
        Height = 13
        Hint = ''
        Caption = 'FRL Fiscal Year'
        TabOrder = 4
      end
      object lblEPlant: TUniLabel
        Left = 8
        Top = 108
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'EPlant'
        TabOrder = 5
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 129
      Top = 1
      Width = 439
      Height = 131
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        439
        131)
      object sbtnEPlant: TUniSpeedButton
        Left = 411
        Top = 104
        Width = 22
        Height = 22
        Hint = 'Assign EPlant'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333300000003333333330FFFFF
          03333333330FFFFF03333333330F00FF033333333300B0FF03333333330B0FFF
          0333333330B0FFFF033333330B0FF00F03333330B00FFFFF0333330B03000000
          0333339033333333333333333333333333333333333333333333}
        Caption = ''
        Anchors = [akTop, akRight]
        ParentColor = False
        Color = clWindow
        OnClick = sbtnEPlantClick
      end
      object DBEditDescrip: TUniDBEdit
        Left = 0
        Top = 56
        Width = 433
        Height = 21
        Hint = ''
        DataField = 'DESCRIP'
        DataSource = GL_DM.SrcGlYear
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object DBFiscalYear: TUniDBEdit
        Left = 0
        Top = 80
        Width = 281
        Height = 21
        Hint = ''
        DataField = 'FRL_FISCAL_YEAR'
        DataSource = GL_DM.SrcGlYear
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object dbePlant: TUniDBEdit
        Left = 0
        Top = 104
        Width = 412
        Height = 21
        Hint = ''
        DataField = 'EPLANT_ID'
        DataSource = GL_DM.SrcGlYear
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        TabStop = False
        Color = clBtnFace
      end
      object BtnCreatePeriods: TUniButton
        Left = 354
        Top = 7
        Width = 79
        Height = 25
        Hint = ''
        Caption = 'Create Periods'
        Anchors = [akTop, akRight]
        TabOrder = 7
        OnClick = BtnCreatePeriodsClick
      end
      object DBEditYStartDate: TUniDBDateTimePicker
        Left = 0
        Top = 8
        Width = 277
        Height = 21
        Hint = ''
        DataField = 'START_DATE'
        DataSource = GL_DM.SrcGlYear
        DateTime = 42689.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object DBEditYEndDate: TUniDBDateTimePicker
        Left = 0
        Top = 32
        Width = 277
        Height = 21
        Hint = ''
        DataField = 'END_DATE'
        DataSource = GL_DM.SrcGlYear
        DateTime = 42689.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
  end
  object Panel8: TUniPanel
    Tag = 1999
    Left = 0
    Top = 160
    Width = 569
    Height = 370
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object Panel9: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 567
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object SBGridView: TUniSpeedButton
        Left = 3
        Top = 2
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
        OnClick = SBGridViewClick
      end
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 28
      Width = 567
      Height = 341
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object PageControlPeriod: TUniPageControl
        Left = 1
        Top = 1
        Width = 565
        Height = 339
        Hint = ''
        ActivePage = TabSheetGrid
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabSheetGrid: TUniTabSheet
          Hint = ''
          Caption = 'TabSheetGrid'
          object DBGridPeriods: TIQUniGridControl
            Left = 0
            Top = 0
            Width = 557
            Height = 311
            HelpContext = 1056572
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 340
            IQComponents.Grid.Height = 225
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = GL_DM.SrcGLPeriods
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
            IQComponents.Navigator.DataSource = GL_DM.SrcGLPeriods
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 340
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 225
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = GL_DM.SrcGLPeriods
            Columns = <
              item
                FieldName = 'PERIOD'
                Title.Caption = 'Period'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'START_DATE'
                Title.Caption = 'Start Date'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'END_DATE'
                Title.Caption = 'End Date'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'AP_STATUS'
                Title.Caption = 'AP Status'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'AR_STATUS'
                Title.Caption = 'AR Status'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'GL_STATUS'
                Title.Caption = 'GL Status'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'INV_STATUS'
                Title.Caption = 'INV Status'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            TabsVisible = True
            Marker = 0
          end
          object wwDBAP: TUniDBComboBox
            Left = 25
            Top = 32
            Width = 121
            Height = 21
            Hint = ''
            Style = csDropDownList
            Items.Strings = (
              'kuku'#9'CLOSED'
              'FINAL'#9'FINAL'
              'N/O'#9'N/O'
              'OPEN'#9'OPEN')
            TabOrder = 1
          end
          object wwDBAR: TUniDBComboBox
            Left = 25
            Top = 59
            Width = 121
            Height = 21
            Hint = ''
            Style = csDropDownList
            Items.Strings = (
              'CLOSED'#9'CLOSED'
              'FINAL'#9'FINAL'
              'N/O'#9'N/O'
              'OPEN'#9'OPEN')
            TabOrder = 2
          end
          object wwDBGL: TUniDBComboBox
            Left = 25
            Top = 86
            Width = 121
            Height = 21
            Hint = ''
            Style = csDropDownList
            Items.Strings = (
              'CLOSED'#9'CLOSED'
              'FINAL'#9'FINAL'
              'N/O'#9'N/O'
              'OPEN'#9'OPEN')
            TabOrder = 3
          end
          object wwDBINV: TUniDBComboBox
            Left = 25
            Top = 113
            Width = 121
            Height = 21
            Hint = ''
            Style = csDropDownList
            Items.Strings = (
              'CLOSED'#9'CLOSED')
            TabOrder = 4
          end
        end
        object TabSheetEdit: TUniTabSheet
          Hint = ''
          Caption = 'TabSheetEdit'
          object PnlClient01: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 557
            Height = 311
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter2: TUniSplitter
              Left = 119
              Top = 1
              Width = 6
              Height = 309
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object Panel10: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 118
              Height = 309
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object lblPeriod: TUniLabel
                Left = 8
                Top = 12
                Width = 30
                Height = 13
                Hint = ''
                Caption = 'Period'
                TabOrder = 1
              end
              object lblStartDate: TUniLabel
                Left = 8
                Top = 35
                Width = 50
                Height = 13
                Hint = ''
                Caption = 'Start Date'
                TabOrder = 2
              end
              object lblEndDate: TUniLabel
                Left = 8
                Top = 58
                Width = 44
                Height = 13
                Hint = ''
                Caption = 'End Date'
                TabOrder = 3
              end
              object lblStatus: TUniLabel
                Left = 8
                Top = 82
                Width = 46
                Height = 13
                Hint = ''
                Caption = 'GL Status'
                TabOrder = 4
              end
              object Label2: TUniLabel
                Left = 8
                Top = 105
                Width = 47
                Height = 13
                Hint = ''
                Caption = 'AP Status'
                TabOrder = 5
              end
              object Label3: TUniLabel
                Left = 8
                Top = 128
                Width = 48
                Height = 13
                Hint = ''
                Caption = 'AR Status'
                TabOrder = 6
              end
              object Label4: TUniLabel
                Left = 8
                Top = 152
                Width = 50
                Height = 13
                Hint = ''
                Caption = 'Inv Status'
                TabOrder = 7
              end
            end
            object Panel11: TUniPanel
              Tag = 1999
              Left = 125
              Top = 1
              Width = 431
              Height = 309
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                431
                309)
              object DBEditPeriod: TUniDBEdit
                Left = 0
                Top = 8
                Width = 279
                Height = 21
                Hint = ''
                DataField = 'PERIOD'
                DataSource = GL_DM.SrcGLPeriods
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
              object DBEditStartDate: TUniDBDateTimePicker
                Left = 0
                Top = 32
                Width = 279
                Height = 21
                Hint = ''
                DataField = 'START_DATE'
                DataSource = GL_DM.SrcGLPeriods
                DateTime = 42689.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
              end
              object DBEditEndDate: TUniDBDateTimePicker
                Left = 0
                Top = 56
                Width = 279
                Height = 21
                Hint = ''
                DataField = 'END_DATE'
                DataSource = GL_DM.SrcGLPeriods
                DateTime = 42689.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
              object wwCBAPClosed: TUniCheckBox
                Left = 0
                Top = 103
                Width = 55
                Height = 17
                Hint = ''
                Caption = 'Closed'
                TabOrder = 3
                OnClick = wwCBAPClosedClick
              end
              object wwCBAPFinal: TUniCheckBox
                Left = 75
                Top = 103
                Width = 45
                Height = 17
                Hint = ''
                Caption = 'Final'
                TabOrder = 4
                OnClick = wwCBAPFinalClick
              end
              object wwCBAPNO: TUniCheckBox
                Left = 151
                Top = 103
                Width = 44
                Height = 17
                Hint = ''
                Caption = 'N/O'
                TabOrder = 5
                OnClick = wwCBAPNOClick
              end
              object wwCBAPOpen: TUniCheckBox
                Left = 227
                Top = 103
                Width = 52
                Height = 17
                Hint = ''
                Caption = 'Open'
                TabOrder = 6
                OnClick = wwCBAPOpenClick
              end
              object wwCBGLClosed: TUniCheckBox
                Left = 0
                Top = 80
                Width = 55
                Height = 17
                Hint = ''
                Caption = 'Closed'
                TabOrder = 7
                OnClick = wwCBGLClosedClick
              end
              object wwCBGLFinal: TUniCheckBox
                Left = 75
                Top = 80
                Width = 45
                Height = 17
                Hint = ''
                Caption = 'Final'
                TabOrder = 8
                OnClick = wwCBGLFinalClick
              end
              object wwCBGLNO: TUniCheckBox
                Left = 151
                Top = 80
                Width = 44
                Height = 17
                Hint = ''
                Caption = 'N/O'
                TabOrder = 9
                OnClick = wwCBGLNOClick
              end
              object wwCBGLOpen: TUniCheckBox
                Left = 227
                Top = 80
                Width = 52
                Height = 17
                Hint = ''
                Caption = 'Open'
                TabOrder = 10
                OnClick = wwCBGLOpenClick
              end
              object wwCBARClosed: TUniCheckBox
                Left = 0
                Top = 126
                Width = 55
                Height = 17
                Hint = ''
                Caption = 'Closed'
                TabOrder = 11
                OnClick = wwCBARClosedClick
              end
              object wwCBARFinal: TUniCheckBox
                Left = 76
                Top = 126
                Width = 45
                Height = 17
                Hint = ''
                Caption = 'Final'
                TabOrder = 12
                OnClick = wwCBARFinalClick
              end
              object wwCBARNO: TUniCheckBox
                Left = 152
                Top = 126
                Width = 44
                Height = 17
                Hint = ''
                Caption = 'N/O'
                TabOrder = 13
                OnClick = wwCBARNOClick
              end
              object wwCBAROpen: TUniCheckBox
                Left = 228
                Top = 126
                Width = 52
                Height = 17
                Hint = ''
                Caption = 'Open'
                TabOrder = 14
                OnClick = wwCBAROpenClick
              end
              object wwCBInvClosed: TUniCheckBox
                Left = 0
                Top = 149
                Width = 55
                Height = 17
                Hint = ''
                Caption = 'Closed'
                TabOrder = 15
                OnClick = wwCBInvClosedClick
              end
            end
          end
        end
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Define Periods'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197116 $'
    BuildVersion = '176554'
    Left = 128
    Top = 65528
  end
  object MainMenu1: TUniMainMenu
    Left = 280
    Top = 64
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = 'New'
        OnClick = New1Click
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object HelpContents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = HelpContents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'SBGridView'
      'NavYear'
      'BitBtnOk'
      'NavPeriod'
      'DBEditPeriod'
      'DBEditStartDate'
      'DBEditEndDate'
      'DBEditYStartDate'
      'DBEditYEndDate'
      'DBEditDescrip'
      'BtnCreatePeriods'
      'DBFiscalYear'
      'sbtnEPlant'
      'wwCBAPClosed'
      'wwCBAPFinal'
      'wwCBAPNO'
      'wwCBAPOpen'
      'wwCBARClosed'
      'wwCBARFinal'
      'wwCBARNO'
      'wwCBAROpen'
      'wwCBGLClosed'
      'wwCBGLFinal'
      'wwCBGLNO'
      'wwCBGLOpen'
      'wwCBINVClosed')
    SecurityCode = 'FRMDEFPERIODS'
    Left = 45
    Top = 195
  end
end
