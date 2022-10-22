object FrmTemplate: TFrmTemplate
  Left = 245
  Top = 135
  ClientHeight = 358
  ClientWidth = 599
  Caption = 'Template Maintenance'
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 129
    Width = 599
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object PnlToolbarMain: TUniPanel
    Left = 0
    Top = 0
    Width = 599
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBToggle: TUniSpeedButton
      Left = 28
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
    object Bevel2: TUniPanel
      Left = 55
      Top = 3
      Width = 2
      Height = 21
      Hint = ''
      TabOrder = 3
      Caption = ''
    end
    object sbtnRepeatDescription: TUniSpeedButton
      Left = 60
      Top = 1
      Width = 25
      Height = 25
      Hint = 
        'Click to repeat the current description when adding a new record' +
        '.'
      ShowHint = True
      ParentShowHint = False
      GroupIndex = 1
      AllowAllUp = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFB0A090
        6048306048306048306048306048306048306048306048306048306048306048
        30604830FF00FFFF00FFFF00FF9E9E9E46464646464646464646464646464646
        4646464646464646464646464646464646464646FF00FFFF00FFFF00FFB0A090
        F0C0B0F0C0B0F0C0B0F0C0B0F0C0B0F0C0B0F0C0B0F0C0B0F0C0B0F0C0B0F0C0
        B0604830FF00FFFF00FFFF00FF9E9E9EC1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1
        C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1464646FF00FFFF00FFFF00FFB0A090
        F0C8B0F0C8B0F0C8B0F0C8B0E0B8A0B05830E0B0A0F0C8B0F0C8B0F0C8B0F0C8
        B0604830FF00FFFF00FFFF00FF9E9E9EC7C7C7C7C7C7C7C7C7C7C7C7B7B7B75C
        5C5CB1B1B1C7C7C7C7C7C7C7C7C7C7C7C7464646FF00FFFF00FFFF00FFB0A090
        F0D0C0F0D0C0F0D0C0F0C0B0B05830C06840A05830E0B8A0F0D0C0F0D0C0F0D0
        C0604830FF00FFFF00FFFF00FF9E9E9ED0D0D0D0D0D0D0D0D0C1C1C15C5C5C6B
        6B6B5A5A5AB7B7B7D0D0D0D0D0D0D0D0D0464646FF00FFFF00FFFF00FFB0A090
        F0D8D0F0D8D0F0C8B0B05830E08050E07850C06840A05030E0B8B0F0D8D0F0D8
        D0604830FF00FFFF00FFFF00FF9E9E9ED9D9D9D9D9D9C7C7C75C5C5C8282827D
        7D7D6B6B6B545454BABABAD9D9D9D9D9D9464646FF00FFFF00FFFF00FFB0A090
        F0E0D0F0D8C0C07850F09870FFA070E08850D07850C06840A05030E0C0B0F0E0
        D0604830FF00FFFF00FFFF00FF9E9E9EDEDEDED5D5D57979799A9A9AA1A1A188
        88887A7A7A6B6B6B545454C0C0C0DEDEDE464646FF00FFFF00FFFF00FFB0A090
        FFE8E0F0A070E09870E09070FFA880F09060E08050A05030B06040B06840FFE8
        E0604830FF00FFFF00FFFF00FF9E9E9EE9E9E9A0A0A0989898929292A9A9A992
        9292828282545454646464696969E9E9E9464646FF00FFFF00FFFF00FFC0A890
        FFF0F0FFF0F0FFF0F0D08860FFB080FF9060F08850B06040FFF0F0FFF0F0FFF0
        F0604830FF00FFFF00FFFF00FFA5A5A5F2F2F2F2F2F2F2F2F2888888AFAFAF94
        94948B8B8B646464F2F2F2F2F2F2F2F2F2464646FF00FFFF00FFFF00FFC0A8A0
        FFF8FFFFF8FFFFF8FFE09070FFC0A0FFA880F09060B06840FFF8FFFFF8FFFFF8
        FF604830FF00FFFF00FFFF00FFA8A8A8FAFAFAFAFAFAFAFAFA929292C0C0C0A9
        A9A9929292696969FAFAFAFAFAFAFAFAFA464646FF00FFFF00FFFF00FFC0B0A0
        FFFFFFFFFFFFFFFFFFE09870FFC0A0FFB890FFB090C07050FFFFFFFFFFFFFFFF
        FF604830FF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFF989898C0C0C0B8
        B8B8B1B1B1737373FFFFFFFFFFFFFFFFFF464646FF00FFFF00FFFF00FFD0B0A0
        FFFFFFFFFFFFFFFFFFF0A070E09870E09070D08860D08860FFFFFFFFFFFFFFFF
        FF604830FF00FFFF00FFFF00FFAFAFAFFFFFFFFFFFFFFFFFFFA0A0A098989892
        9292888888888888FFFFFFFFFFFFFFFFFF464646FF00FFFF00FFFF00FFD0B8A0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF604830FF00FFFF00FFFF00FFB5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF464646FF00FFFF00FFFF00FFD0B8A0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF604830FF00FFFF00FFFF00FFB5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF464646FF00FFFF00FFFF00FFF0A890
        F0A890F0A880F0A080E09870E09060E08850E08050E07840E07040E07040E070
        40D06030FF00FFFF00FFFF00FFAAAAAAAAAAAAA8A8A8A2A2A298989890909088
        88888282827B7B7B767676767676767676676767FF00FFFF00FFFF00FFF0A890
        FFC0A0FFC0A0FFB890FFB890FFB090FFA880FFA880F0A070F0A070F09860F098
        60D06830FF00FFFF00FFFF00FFAAAAAAC0C0C0C0C0C0B8B8B8B8B8B8B1B1B1A9
        A9A9A9A9A9A0A0A0A0A0A09898989898986C6C6CFF00FFFF00FFFF00FFF0A890
        F0A890F0A890F0A880F0A080F09870E09870E09060E08860E08050E07840E078
        40E07040FF00FFFF00FFFF00FFAAAAAAAAAAAAAAAAAAA8A8A8A2A2A29A9A9A98
        98989090908A8A8A8282827B7B7B7B7B7B767676FF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
    end
    object SBSearch: TUniSpeedButton
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
      OnClick = SBSearchClick
    end
    object NavMain: TUniDBNavigator
      Left = 373
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcGlTemplate
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 339
    Width = 599
    Height = 19
    Hint = ''
    Panels = <
      item
        Text = 'Total Debit:   0.00'
        Width = 170
      end
      item
        Text = 'Total Credit:   0.00'
        Width = 170
      end
      item
        Text = 'Balance to Distribute:   0.00'
        Width = 50
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object PnlHeader: TUniPanel
    Left = 0
    Top = 27
    Width = 599
    Height = 102
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 597
      Height = 100
      Hint = ''
      ActivePage = TabGrid
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabGrid: TUniTabSheet
        Hint = ''
        Caption = 'TabGrid'
        object GridHeader: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 589
          Height = 72
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 372
          IQComponents.Grid.Height = 434
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcGlTemplate
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
          IQComponents.Navigator.DataSource = SrcGlTemplate
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 372
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 434
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcGlTemplate
          Columns = <
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Template Description'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'FX_MOVE'
              Title.Caption = 'FX Move'
              Width = 64
              CheckBoxField.FieldValues = 'Y;N'
            end
            item
              FieldName = 'EPLANT_ID'
              Title.Caption = 'EPlant'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object wwDBComboDlg1: TUniEdit
          Left = 160
          Top = 40
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 1
        end
      end
      object TabForm: TUniTabSheet
        Hint = ''
        Caption = 'TabForm'
        object PnlClient01: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 589
          Height = 72
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 124
            Top = 1
            Width = 6
            Height = 70
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft01: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 123
            Height = 70
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label1: TUniLabel
              Left = 8
              Top = 12
              Width = 100
              Height = 13
              Hint = ''
              Caption = 'Template Description'
              TabOrder = 1
            end
            object Label113: TUniLabel
              Left = 8
              Top = 54
              Width = 30
              Height = 13
              Hint = ''
              Caption = 'EPlant'
              TabOrder = 2
            end
          end
          object PnlClient02: TUniPanel
            Tag = 1999
            Left = 130
            Top = 1
            Width = 458
            Height = 70
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object sbtnAssignEplant: TUniSpeedButton
              Left = 126
              Top = 50
              Width = 22
              Height = 22
              Hint = 'Assign EPlant'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFDDDDD00000000
                00DDDDDD7777777777FDDDDD0FFFFFFFF0DDDDDD7FDDDDDDD7FDDDDD0FFFFFFF
                F0DDDDDD7FDDDDDDD7FDDDDD0FF80FFFF0DDDDDD7FD87FDDD7FDDDDD0F800FFF
                F0DDDDDD7F877FDDD7FDDDDD080B0FFFF0DDDDDD787F7DDDD7FDDDDD00B0FFFF
                F0DDDDDD77F7DDDDD7FDDDDD0B0FFFFFF0DDDDDD7F7DDDDDD7FDDDD0B0FFFFFF
                F0DDDDD7F7DDDDDDD7FDDD0B0FFFFFFFF0DDDD7F7FDDDDDDD7FDD0B07FFFFFFF
                F0DDD7F77FFFFFFFF7FDD90D0000000000DDD77D7777777777DDDDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = sbtnAssignEplantClick
            end
            object DBEdit1: TUniDBEdit
              Left = 1
              Top = 8
              Width = 265
              Height = 21
              Hint = ''
              DataField = 'DESCRIP'
              DataSource = SrcGlTemplate
              TabOrder = 0
              OnEnter = DBEdit1Enter
            end
            object DBFxMove: TUniDBCheckBox
              Left = 1
              Top = 32
              Width = 120
              Height = 17
              Hint = ''
              DataField = 'FX_MOVE'
              DataSource = SrcGlTemplate
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'FX Move'
              TabOrder = 1
            end
            object dbeEPlant: TUniDBEdit
              Left = 1
              Top = 51
              Width = 121
              Height = 21
              Hint = ''
              DataField = 'EPLANT_ID'
              DataSource = SrcGlTemplate
              TabOrder = 2
              Color = clBtnFace
              ReadOnly = True
            end
          end
        end
      end
    end
  end
  object wwDBLookupCombo1: TUniDBLookupComboBox
    Left = 48
    Top = 160
    Width = 121
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    TabOrder = 3
    Color = clWindow
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 132
    Width = 599
    Height = 207
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    Caption = ''
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 597
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object NavDtl: TUniDBNavigator
        Left = 371
        Top = 1
        Width = 225
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcGlTemplateDetail
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object GridTemplate: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 597
      Height = 178
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 380
      IQComponents.Grid.Height = 92
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcGlTemplateDetail
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
      IQComponents.Navigator.DataSource = SrcGlTemplateDetail
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 380
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 92
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcGlTemplateDetail
      Columns = <
        item
          FieldName = 'SEQ'
          Title.Caption = 'Sequence #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'GlAcct'
          Title.Caption = 'GL Account'
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
          FieldName = 'DEBIT'
          Title.Caption = 'Debit'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CREDIT'
          Title.Caption = 'Credit'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PERCENTAGE'
          Title.Caption = 'Percentage'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 328
    Top = 200
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = 'Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object SrcGlTemplate: TDataSource
    DataSet = TblGlTemplate
    OnDataChange = SrcGlTemplateDataChange
    Left = 212
    Top = 139
  end
  object TblGlTemplate: TFDTable
    BeforePost = TblGlTemplateBeforePost
    BeforeScroll = TblGlTemplateBeforeScroll
    Filtered = True
    OnFilterRecord = TblGlTemplateFilterRecord
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLTEMPLATE'
    TableName = 'GLTEMPLATE'
    Left = 260
    Top = 131
    object TblGlTemplateDESCRIP: TStringField
      DisplayLabel = 'Template Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Size = 100
    end
    object TblGlTemplateFX_MOVE: TStringField
      DisplayLabel = 'FX Move'
      DisplayWidth = 1
      FieldName = 'FX_MOVE'
      FixedChar = True
      Size = 1
    end
    object TblGlTemplateEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object TblGlTemplateID: TBCDField
      DisplayLabel = 'Template #'
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblGlTemplateTEMPLATE_TYPE: TStringField
      DisplayWidth = 10
      FieldName = 'TEMPLATE_TYPE'
      Visible = False
      Size = 10
    end
  end
  object SrcGlTemplateDetail: TDataSource
    DataSet = TblGlTemplateDetail
    Left = 88
    Top = 224
  end
  object TblGlTemplateDetail: TFDTable
    BeforeInsert = TblGlTemplateDetailBeforeInsert
    AfterInsert = TblGlTemplateDetailAfterInsert
    BeforeEdit = TblGlTemplateDetailBeforeEdit
    BeforePost = TblGlTemplateDetailBeforePost
    AfterPost = TblGlTemplateDetailAfterPost
    AfterDelete = TblGlTemplateDetailAfterDelete
    IndexFieldNames = 'GLTEMPLATE_ID;SEQ'
    MasterSource = SrcGlTemplate
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLTEMPLATE_DETAIL'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'GLTEMPLATE_DETAIL'
    Left = 104
    Top = 224
    object TblGlTemplateDetailSEQ: TBCDField
      DisplayLabel = 'Sequence #'
      DisplayWidth = 10
      FieldName = 'SEQ'
      Size = 0
    end
    object TblGlTemplateDetailGlAcct: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'GlAcct'
      LookupDataSet = QryGlAcct
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'GLACCT_ID'
      Size = 50
      Lookup = True
    end
    object TblGlTemplateDetailDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 100
    end
    object TblGlTemplateDetailDEBIT: TBCDField
      DisplayLabel = 'Debit'
      DisplayWidth = 10
      FieldName = 'DEBIT'
      currency = True
      Size = 2
    end
    object TblGlTemplateDetailCREDIT: TBCDField
      DisplayLabel = 'Credit'
      DisplayWidth = 10
      FieldName = 'CREDIT'
      currency = True
      Size = 2
    end
    object TblGlTemplateDetailPERCENTAGE: TFMTBCDField
      DisplayLabel = 'Percentage'
      DisplayWidth = 10
      FieldName = 'PERCENTAGE'
      Size = 6
    end
    object TblGlTemplateDetailVendor: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Vendor'
      LookupDataSet = TblVendor
      LookupKeyFields = 'ID'
      LookupResultField = 'COMPANY'
      KeyFields = 'VENDOR_ID'
      Visible = False
      Lookup = True
    end
    object TblGlTemplateDetailGLTEMPLATE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLTEMPLATE_ID'
      Visible = False
      Size = 0
    end
    object TblGlTemplateDetailGLACCT_ID: TBCDField
      DisplayLabel = 'G/L Account'
      DisplayWidth = 10
      FieldName = 'GLACCT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblGlTemplateDetailVENDOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object TblGlTemplateDetailID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmGLMain'
    WebUse = False
    TouchScreen = False
    Left = 384
    Top = 200
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 364
    Top = 160
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Template Maintenance'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194564 $'
    BuildVersion = '176554'
    Left = 412
    Top = 200
  end
  object TblVendor: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'VENDOR'
    TableName = 'VENDOR'
    Left = 152
    Top = 224
  end
  object QryGlAcct: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select acct, descrip, id, eplant_id from glacct '
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and NVL(GL_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct')
    Left = 216
    Top = 264
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMTEMPLATE')
    SecurityCode = 'FRMTEMPLATE'
    Left = 524
    Top = 203
  end
  object PKTempAP: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select g.id,'
      '       g.descrip,'
      '       g.eplant_id'
      ' from GLTEMPLATE g'
      'where template_type = '#39'AP'#39
      '  and misc.eplant_filter_include_nulls(g.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 264
    Top = 191
    object PKTempAPID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.GLTEMPLATE.ID'
      Visible = False
      Size = 0
    end
    object PKTempAPDESCRIP: TStringField
      DisplayLabel = 'Template Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.GLTEMPLATE.DESCRIP'
      Size = 100
    end
    object PKTempAPEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkTempGJ: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select g.id,'
      '       g.descrip,'
      '       g.eplant_id'
      ' from GLTEMPLATE g'
      'where NVL(template_type, '#39'**'#39') <>  '#39'AP'#39
      '  and misc.eplant_filter_include_nulls(g.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 320
    Top = 263
    object PkTempGJID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkTempGJDESCRIP: TStringField
      DisplayLabel = 'Template Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkTempGJEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
end
