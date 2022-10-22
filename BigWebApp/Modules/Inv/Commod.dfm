object FrmCommodities: TFrmCommodities
  Left = 305
  Top = 131
  HelpContext = 1389047
  ClientHeight = 361
  ClientWidth = 414
  Caption = 'Commodities'
  OnShow = FormShow
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
    Top = 0
    Width = 414
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnSearchPackages: TUniSpeedButton
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
      OnClick = Search1Click
    end
    object sbtnToggleView: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Table / Form view'
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
      OnClick = sbtnToggleViewClick
    end
    object Nav: TUniDBNavigator
      Left = 188
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      DataSource = SrcCommod
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      BeforeAction = NavBeforeAction
    end
  end
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 27
    Width = 414
    Height = 334
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 412
      Height = 332
      Hint = ''
      ActivePage = TabForm
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabForm: TUniTabSheet
        Hint = ''
        Caption = 'TabForm'
        object PnlFormViewScrollCarrier: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 404
          Height = 304
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object sbFormView: TUniScrollBox
            Tag = 1999
            Left = 1
            Top = 1
            Width = 402
            Height = 302
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            ScrollHeight = 300
            object PnlClient01: TUniPanel
              Tag = 1999
              Left = 0
              Top = 0
              Width = 400
              Height = 300
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Caption = ''
              object Splitter1: TUniSplitter
                Left = 138
                Top = 1
                Width = 6
                Height = 298
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlLeft01: TUniPanel
                Left = 1
                Top = 1
                Width = 137
                Height = 298
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object lblDescription: TUniLabel
                  Left = 8
                  Top = 12
                  Width = 53
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  Caption = 'Description'
                  TabOrder = 1
                end
                object lblSurRate: TUniLabel
                  Left = 8
                  Top = 60
                  Width = 75
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  Caption = 'Surcharge Rate'
                  TabOrder = 2
                end
                object lblActualRate: TUniLabel
                  Left = 8
                  Top = 84
                  Width = 56
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  Caption = 'Actual Rate'
                  TabOrder = 3
                end
                object lblGLAcct: TUniLabel
                  Left = 8
                  Top = 108
                  Width = 54
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  Caption = 'GL Account'
                  TabOrder = 4
                end
                object lblStoredProcedure: TUniLabel
                  Left = 8
                  Top = 132
                  Width = 49
                  Height = 13
                  Hint = 'Stored Procedure Used for Calculation'
                  ShowHint = True
                  ParentShowHint = False
                  Caption = 'Procedure'
                  TabOrder = 5
                end
                object lblUnitWt: TUniLabel
                  Left = 8
                  Top = 180
                  Width = 56
                  Height = 13
                  Hint = 'Default unit weight of the commodity item.'
                  ShowHint = True
                  ParentShowHint = False
                  Caption = 'Unit Weight'
                  TabOrder = 6
                end
                object lblCode: TUniLabel
                  Left = 8
                  Top = 36
                  Width = 25
                  Height = 13
                  Hint = 'Harmonized commodity code'
                  ShowHint = True
                  ParentShowHint = False
                  Caption = 'Code'
                  TabOrder = 7
                end
                object lblMFGCountry: TUniLabel
                  Left = 8
                  Top = 252
                  Width = 116
                  Height = 13
                  Hint = 
                    'Country where commodity is manufactured.  Select "Multiple" for ' +
                    'multiple countries of manufacture.'
                  ShowHint = True
                  ParentShowHint = False
                  Caption = 'Country of Manufacture'
                  TabOrder = 8
                end
                object lblUOM: TUniLabel
                  Left = 8
                  Top = 228
                  Width = 23
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  Caption = 'UOM'
                  TabOrder = 9
                end
                object lblUnitValue: TUniLabel
                  Left = 8
                  Top = 204
                  Width = 48
                  Height = 13
                  Hint = 'Default unit value of the commodity item.'
                  ShowHint = True
                  ParentShowHint = False
                  Caption = 'Unit Value'
                  TabOrder = 10
                end
                object Label1: TUniLabel
                  Left = 8
                  Top = 276
                  Width = 67
                  Height = 13
                  Hint = 'Country code of the country of manufacture.'
                  ShowHint = True
                  ParentShowHint = False
                  Caption = 'Country Code'
                  TabOrder = 11
                end
              end
              object PnlClient02: TUniPanel
                Left = 144
                Top = 1
                Width = 255
                Height = 298
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                DesignSize = (
                  255
                  298)
                object lblWeightUOM: TUniLabel
                  Left = 144
                  Top = 180
                  Width = 21
                  Height = 13
                  Hint = ''
                  Caption = '(lbs)'
                  TabOrder = 13
                end
                object dbeDescrip: TUniDBEdit
                  Left = 1
                  Top = 8
                  Width = 252
                  Height = 21
                  Hint = ''
                  DataField = 'DESCRIP'
                  DataSource = SrcCommod
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                end
                object dbeSurRate: TUniDBEdit
                  Left = 1
                  Top = 56
                  Width = 134
                  Height = 21
                  Hint = ''
                  DataField = 'SUR_RATE'
                  DataSource = SrcCommod
                  TabOrder = 2
                end
                object dbeActualRate: TUniDBEdit
                  Left = 1
                  Top = 80
                  Width = 134
                  Height = 21
                  Hint = ''
                  DataField = 'ACT_RATE'
                  DataSource = SrcCommod
                  TabOrder = 3
                end
                object dbeUnitWeight: TUniDBEdit
                  Left = 1
                  Top = 176
                  Width = 134
                  Height = 21
                  Hint = ''
                  DataField = 'UNIT_WEIGHT'
                  DataSource = SrcCommod
                  TabOrder = 7
                end
                object dbeCode: TUniDBEdit
                  Left = 1
                  Top = 32
                  Width = 134
                  Height = 21
                  Hint = ''
                  DataField = 'CODE'
                  DataSource = SrcCommod
                  TabOrder = 1
                end
                object dbeUnitPrice: TUniDBEdit
                  Left = 1
                  Top = 200
                  Width = 134
                  Height = 21
                  Hint = ''
                  DataField = 'UNIT_PRICE'
                  DataSource = SrcCommod
                  TabOrder = 8
                end
                object cmbGLAccount: TUniEdit
                  Left = 1
                  Top = 104
                  Width = 252
                  Height = 21
                  Hint = ''
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 4
                  OnKeyDown = cmbGridGLAccountKeyDown
                end
                object cbmOraclProc: TUniEdit
                  Left = 1
                  Top = 128
                  Width = 252
                  Height = 21
                  Hint = ''
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 5
                  OnKeyDown = cmbGridOracleProcKeyDown
                end
                object chkPropagateComm: TUniDBCheckBox
                  Left = 1
                  Top = 153
                  Width = 193
                  Height = 17
                  Hint = ''
                  DataField = 'PROPAGATE_COMM'
                  DataSource = SrcCommod
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'Propagate Commission'
                  TabOrder = 6
                end
                object cmbUOM: TIQWebUDComboBox
                  Left = 1
                  Top = 224
                  Width = 137
                  Height = 21
                  Hint = 'Right click to edit the list'
                  ShowHint = True
                  ParentShowHint = False
                  DataField = 'UOM'
                  DataSource = SrcCommod
                  TabOrder = 9
                  KeyTableName = 'COMMOD'
                  KeyFieldName = 'UOM'
                end
                object cmbCountry: TUniDBComboBox
                  Left = 1
                  Top = 246
                  Width = 256
                  Height = 21
                  Hint = ''
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'MFG_COUNTRY'
                  DataSource = SrcCommod
                  Style = csDropDownList
                  TabOrder = 10
                end
                object dbeMFGCountryCode: TUniDBEdit
                  Left = 1
                  Top = 272
                  Width = 41
                  Height = 21
                  Hint = ''
                  DataField = 'MFG_COUNTRY'
                  DataSource = SrcCommod
                  TabOrder = 11
                  Color = clBtnFace
                  ReadOnly = True
                end
              end
            end
          end
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'TabGrid'
        object IQSearch1: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 404
          Height = 304
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 187
          IQComponents.Grid.Height = 218
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcCommod
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
          IQComponents.Navigator.DataSource = SrcCommod
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 187
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 218
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcCommod
          Columns = <
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 140
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SUR_RATE'
              Title.Caption = 'Surcharge Rate'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACT_RATE'
              Title.Caption = 'Actual Rate'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACCT'
              Title.Caption = 'GL Account'
              Width = 140
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PROCEDURE_TO_RUN'
              Title.Caption = 'Stored Procedure Used for Calculation'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PROPAGATE_COMM'
              Title.Caption = 'Propagate Commission'
              Width = 7
              CheckBoxField.FieldValues = 'Y;N'
            end
            item
              FieldName = 'CODE'
              Title.Caption = 'Code'
              Width = 105
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'UNIT_PRICE'
              Title.Caption = 'Unit Price'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'UOM'
              Title.Caption = 'UOM'
              Width = 21
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'UNIT_WEIGHT'
              Title.Caption = 'Unit Weight'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MFG_COUNTRY'
              Title.Caption = 'Country of Manufacture'
              Width = 14
              CheckBoxField.FieldValues = 'true;false'
            end>
          DesignSize = (
            404
            304)
          Marker = 0
          object cmbGridGLAccount: TUniEdit
            Left = 56
            Top = 40
            Width = 121
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 2
            OnKeyDown = cmbGridGLAccountKeyDown
          end
          object cmbGridOracleProc: TUniEdit
            Left = 56
            Top = 64
            Width = 121
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 3
            OnKeyDown = cmbGridOracleProcKeyDown
          end
          object cmbGridUOM: TIQWebUDComboBox
            Left = 56
            Top = 88
            Width = 121
            Height = 21
            Hint = 'Right click to edit the list'
            ShowHint = True
            ParentShowHint = False
            DataField = 'UOM'
            DataSource = SrcCommod
            TabOrder = 5
            KeyTableName = 'COMMOD'
            KeyFieldName = 'UOM'
          end
          object cmbGridCountry: TUniDBComboBox
            Left = 56
            Top = 112
            Width = 123
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MFG_COUNTRY'
            DataSource = SrcCommod
            Style = csDropDownList
            TabOrder = 4
          end
        end
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Commodities'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 168
  end
  object MainMenu1: TUniMainMenu
    Left = 84
    object File1: TUniMenuItem
      Caption = '&File'
      object Search1: TUniMenuItem
        Caption = 'Search'
        OnClick = Search1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'nav')
    SecurityCode = 'FRMCOMMODITIES'
    Left = 196
  end
  object SrcCommod: TDataSource
    DataSet = QryCommod
    Left = 320
  end
  object QryCommod: TFDQuery
    BeforePost = QryCommodBeforePost
    AfterPost = DoApplyUpdates
    AfterDelete = DoApplyUpdates
    OnNewRecord = QryCommodNewRecord
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'commodities'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select c.id as id,'
      '       c.descrip as descrip,'
      '       c.sur_rate as sur_rate,'
      '       c.act_rate as act_rate,'
      '       c.glacct_id as glacct_id,'
      '       c.procedure_to_run as Procedure_to_run,'
      '       c.propagate_comm as propagate_comm,'
      '       a.acct as acct,'
      '       c.unit_weight as unit_weight,'
      '       c.code as code,'
      '       c.mfg_country as mfg_country,'
      '       c.uom as uom,'
      '       c.unit_price as unit_price,'
      '       c.uom_weight'
      '  from commodities c,'
      '       glacct a'
      ' where c.glacct_id = a.id(+)'
      '')
    Left = 272
    Top = 160
    object QryCommodDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'c.descrip'
      Size = 50
    end
    object QryCommodSUR_RATE: TFMTBCDField
      DisplayLabel = 'Surcharge Rate'
      DisplayWidth = 10
      FieldName = 'SUR_RATE'
      Origin = 'c.sur_rate'
      Size = 6
    end
    object QryCommodACT_RATE: TFMTBCDField
      DisplayLabel = 'Actual Rate'
      DisplayWidth = 10
      FieldName = 'ACT_RATE'
      Origin = 'c.act_rate'
      Size = 6
    end
    object QryCommodACCT: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'A.ACCT'
      Size = 50
    end
    object QryCommodPROCEDURE_TO_RUN: TStringField
      DisplayLabel = 'Stored Procedure Used for Calculation'
      DisplayWidth = 30
      FieldName = 'PROCEDURE_TO_RUN'
      Origin = 'c.procedure_to_run'
      Size = 30
    end
    object QryCommodPROPAGATE_COMM: TStringField
      DisplayLabel = 'Propagate Commission'
      DisplayWidth = 1
      FieldName = 'PROPAGATE_COMM'
      Origin = 'c.propagate_comm'
      FixedChar = True
      Size = 1
    end
    object QryCommodCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 15
      FieldName = 'CODE'
      Origin = 'c.code'
      Size = 15
    end
    object QryCommodUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Origin = 'c.unit_price'
      currency = True
      Size = 6
    end
    object QryCommodUOM: TStringField
      DisplayWidth = 3
      FieldName = 'UOM'
      Origin = 'c.uom'
      Size = 3
    end
    object QryCommodUNIT_WEIGHT: TBCDField
      DisplayLabel = 'Unit Weight'
      DisplayWidth = 10
      FieldName = 'UNIT_WEIGHT'
      Origin = 'c.unit_weight'
      Size = 2
    end
    object QryCommodMFG_COUNTRY: TStringField
      DisplayLabel = 'Country of Manufacture'
      DisplayWidth = 2
      FieldName = 'MFG_COUNTRY'
      Origin = 'c.mfg_country'
      Size = 2
    end
    object QryCommodID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'c.id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryCommodGLACCT_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'GLACCT_ID'
      Origin = 'c.glacct_ID'
      Visible = False
      Size = 0
    end
    object QryCommodUOM_WEIGHT: TStringField
      DisplayWidth = 3
      FieldName = 'UOM_WEIGHT'
      Origin = 'c.uom_weight'
      Visible = False
      Size = 3
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into commodities'
      
        '  (ID, DESCRIP, SUR_RATE, ACT_RATE, GLACCT_ID, PROCEDURE_TO_RUN,' +
        ' '
      '   PROPAGATE_COMM, UNIT_WEIGHT, CODE, MFG_COUNTRY, UOM, '
      '   UNIT_PRICE, UOM_WEIGHT)'
      'values'
      
        '  (:ID, :DESCRIP, :SUR_RATE, :ACT_RATE, :GLACCT_ID, :PROCEDURE_T' +
        'O_RUN, '
      '   :PROPAGATE_COMM, :UNIT_WEIGHT, :CODE, :MFG_COUNTRY, :UOM, '
      '   :UNIT_PRICE, :UOM_WEIGHT)')
    ModifySQL.Strings = (
      'update commodities'
      'set'
      '  DESCRIP = :DESCRIP,'
      '  SUR_RATE = :SUR_RATE,'
      '  ACT_RATE = :ACT_RATE,'
      '  GLACCT_ID = :GLACCT_ID,'
      '  PROCEDURE_TO_RUN = :PROCEDURE_TO_RUN,'
      '  PROPAGATE_COMM = :PROPAGATE_COMM,'
      '  UNIT_WEIGHT = :UNIT_WEIGHT,'
      '  CODE = :CODE,'
      '  MFG_COUNTRY = :MFG_COUNTRY,'
      '  UOM = :UOM,'
      '  UNIT_PRICE = :UNIT_PRICE,'
      '  UOM_WEIGHT = :UOM_WEIGHT'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from commodities'
      'where'
      '  ID = :OLD_ID')
    Left = 336
    Top = 160
  end
  object PkGlacct: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          eplant_id,'
      '          descrip'
      '  from glacct'
      'where misc.eplant_filter(eplant_id)  = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 208
    Top = 160
    object PkGlacctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkGlacctACCT: TStringField
      DisplayLabel = 'GL Account'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkGlacctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkGlacctEPLANT_ID: TBCDField
      DisplayLabel = 'Eplant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkProc: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select distinct object_name as object_name'
      '  from all_arguments'
      ' where'
      '       owner = '#39'IQMS'#39
      '   and package_name = '#39'IQ_COMMODITY'#39
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 164
    Top = 160
    object PkProcOBJECT_NAME: TStringField
      DisplayLabel = 'Procedure'
      FieldName = 'OBJECT_NAME'
      Origin = 'IQ.ALL_ARGUMENTS.OBJECT_NAME'
      Size = 30
    end
  end
  object PkCommod: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select'
      '   a.id as id,'
      '   a.descrip as descrip,'
      '   a.sur_rate as sur_rate,'
      '   a.act_rate as act_rate,'
      '   a.glacct_id as glacct_id,'
      '   a.procedure_to_run as procedure_to_run,'
      '   a.propagate_comm as propagate_comm,'
      '   a.unit_weight as unit_weight,'
      '   a.code as code,'
      '   a.mfg_country as mfg_country,'
      '   a.uom as uom,'
      '   a.unit_price as unit_price'
      'from'
      '   commodities a'
      '')
    OnIQModify = PkCommodIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 96
    Top = 160
    object PkCommodID: TBCDField
      FieldName = 'ID'
      Origin = 'A.ID'
      Visible = False
      Size = 0
    end
    object PkCommodDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 50
    end
    object PkCommodSUR_RATE: TFMTBCDField
      DisplayLabel = 'Surcharge Rate'
      FieldName = 'SUR_RATE'
      Origin = 'A.SUR_RATE'
      Size = 6
    end
    object PkCommodACT_RATE: TFMTBCDField
      DisplayLabel = 'Actual Rate'
      FieldName = 'ACT_RATE'
      Origin = 'A.ACT_RATE'
      Size = 6
    end
    object PkCommodGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Origin = 'A.GLACCT_ID'
      Visible = False
      Size = 0
    end
    object PkCommodPROCEDURE_TO_RUN: TStringField
      DisplayLabel = 'Stored Procedure for Calculation'
      FieldName = 'PROCEDURE_TO_RUN'
      Origin = 'A.PROCEDURE_TO_RUN'
      Size = 30
    end
    object PkCommodPROPAGATE_COMM: TStringField
      DisplayLabel = 'Propagate Commission'
      FieldName = 'PROPAGATE_COMM'
      Origin = 'A.PROPAGATE_COMM'
      FixedChar = True
      Size = 1
    end
    object PkCommodUNIT_WEIGHT: TBCDField
      DisplayLabel = 'Weight'
      FieldName = 'UNIT_WEIGHT'
      Origin = 'A.UNIT_WEIGHT'
      Size = 2
    end
    object PkCommodCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'A.CODE'
      Size = 15
    end
    object PkCommodMFG_COUNTRY: TStringField
      DisplayLabel = 'Country of Manufacture'
      FieldName = 'MFG_COUNTRY'
      Origin = 'A.MFG_COUNTRY'
      Size = 2
    end
    object PkCommodUOM: TStringField
      FieldName = 'UOM'
      Origin = 'A.UOM'
      Size = 3
    end
    object PkCommodUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      FieldName = 'UNIT_PRICE'
      Origin = 'A.UNIT_PRICE'
      Size = 6
    end
  end
  object PGLAccount: TUniPopupMenu
    Left = 112
    object Select1: TUniMenuItem
      Caption = 'Select'
      Default = True
      OnClick = DoSelectGLAccount
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object Clear1: TUniMenuItem
      Caption = 'Clear'
      OnClick = DoClearGLAccount
    end
  end
  object POraclProc: TUniPopupMenu
    Left = 140
    object Select2: TUniMenuItem
      Caption = 'Select'
      Default = True
      OnClick = DoSelectOracleProcedure
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object Clear2: TUniMenuItem
      Caption = 'Clear'
      OnClick = DoClearOracleProcedure
    end
  end
end
