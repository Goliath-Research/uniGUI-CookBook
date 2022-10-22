object FrmConsolidator: TFrmConsolidator
  Left = 298
  Top = 158
  HelpContext = 1198359
  ClientHeight = 265
  ClientWidth = 563
  Caption = 'Consolidators'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 27
    Width = 563
    Height = 238
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitHeight = 231
    object PC: TUniPageControl
      Left = 1
      Top = 1
      Width = 561
      Height = 236
      Hint = ''
      ActivePage = TabForm
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitHeight = 229
      object TabForm: TUniTabSheet
        Hint = ''
        Caption = 'TabForm'
        ExplicitHeight = 201
        object PnlFormView: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 553
          Height = 208
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          ExplicitHeight = 201
          object Splitter2: TUniSplitter
            Left = 274
            Top = 1
            Width = 6
            Height = 206
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
            ExplicitHeight = 199
          end
          object PnlClient01: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 273
            Height = 206
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitHeight = 199
            object Splitter1: TUniSplitter
              Left = 90
              Top = 1
              Width = 6
              Height = 204
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
              ExplicitHeight = 197
            end
            object PnlLeft01: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 89
              Height = 204
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              ExplicitHeight = 197
              object Label36: TUniLabel
                Left = 7
                Top = 12
                Width = 45
                Height = 13
                Hint = ''
                Caption = 'Company'
                TabOrder = 1
              end
              object Label37: TUniLabel
                Left = 7
                Top = 36
                Width = 48
                Height = 13
                Hint = ''
                Caption = 'Address 1'
                TabOrder = 2
              end
              object Label38: TUniLabel
                Left = 7
                Top = 60
                Width = 48
                Height = 13
                Hint = ''
                Caption = 'Address 2'
                TabOrder = 3
              end
              object Label39: TUniLabel
                Left = 7
                Top = 84
                Width = 48
                Height = 13
                Hint = ''
                Caption = 'Address 3'
                TabOrder = 4
              end
              object Label40: TUniLabel
                Left = 7
                Top = 108
                Width = 19
                Height = 13
                Hint = ''
                Caption = 'City'
                TabOrder = 5
              end
              object Label41: TUniLabel
                Left = 7
                Top = 155
                Width = 75
                Height = 13
                Hint = ''
                Caption = 'State or Region'
                TabOrder = 6
              end
              object Label56: TUniLabel
                Left = 7
                Top = 131
                Width = 39
                Height = 13
                Hint = ''
                Caption = 'Country'
                TabOrder = 7
              end
              object Label42: TUniLabel
                Left = 8
                Top = 180
                Width = 57
                Height = 13
                Hint = ''
                Caption = 'Postal Code'
                TabOrder = 8
              end
            end
            object PnlClient02: TUniPanel
              Tag = 1999
              Left = 96
              Top = 1
              Width = 176
              Height = 204
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              ExplicitHeight = 197
              DesignSize = (
                176
                204)
              object dbeShipCompany: TUniDBEdit
                Left = 0
                Top = 8
                Width = 172
                Height = 22
                Hint = ''
                DataField = 'ATTN'
                DataSource = SrcConsolidator
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 0
              end
              object dbeShipAddr1: TUniDBEdit
                Left = 0
                Top = 32
                Width = 172
                Height = 22
                Hint = ''
                DataField = 'ADDR1'
                DataSource = SrcConsolidator
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 1
              end
              object dbeShipAddr2: TUniDBEdit
                Left = 0
                Top = 56
                Width = 172
                Height = 22
                Hint = ''
                DataField = 'ADDR2'
                DataSource = SrcConsolidator
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 2
              end
              object dbeShipAddr3: TUniDBEdit
                Left = 0
                Top = 80
                Width = 172
                Height = 22
                Hint = ''
                DataField = 'ADDR3'
                DataSource = SrcConsolidator
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 3
              end
              object dbeShipCity: TUniDBEdit
                Left = 0
                Top = 104
                Width = 172
                Height = 22
                Hint = ''
                DataField = 'CITY'
                DataSource = SrcConsolidator
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 4
              end
              object dbcShipState: TUniDBComboBox
                Left = 0
                Top = 152
                Width = 73
                Hint = ''
                DataField = 'STATE'
                DataSource = SrcConsolidator
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 6
              end
              object dbeShipCountry: TUniDBComboBox
                Left = 0
                Top = 128
                Width = 172
                Height = 21
                Hint = ''
                Anchors = [akLeft, akTop, akRight]
                DataField = 'COUNTRY'
                DataSource = SrcConsolidator
                TabOrder = 5
                OnChange = dbeShipCountryChange
              end
              object dbeShipZIP: TUniDBEdit
                Left = 0
                Top = 176
                Width = 113
                Height = 22
                Hint = ''
                DataField = 'ZIP'
                DataSource = SrcConsolidator
                ParentFont = False
                Font.Color = clBlack
                TabOrder = 7
              end
            end
          end
          object PnlClient03: TUniPanel
            Tag = 1999
            Left = 280
            Top = 1
            Width = 272
            Height = 206
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitHeight = 199
            object Splitter3: TUniSplitter
              Left = 98
              Top = 1
              Width = 6
              Height = 204
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
              ExplicitHeight = 197
            end
            object PnlLeft02: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 97
              Height = 204
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              ExplicitHeight = 197
              object Label57: TUniLabel
                Left = 8
                Top = 12
                Width = 38
                Height = 13
                Hint = ''
                Caption = 'Contact'
                TabOrder = 1
              end
              object Label58: TUniLabel
                Left = 8
                Top = 60
                Width = 50
                Height = 13
                Hint = ''
                Caption = 'Telephone'
                TabOrder = 2
              end
              object Label59: TUniLabel
                Left = 8
                Top = 108
                Width = 18
                Height = 13
                Hint = ''
                Caption = 'Fax'
                TabOrder = 3
              end
              object lblEPlantName: TUniLabel
                Left = 8
                Top = 132
                Width = 30
                Height = 13
                Hint = ''
                Caption = 'EPlant'
                TabOrder = 4
              end
              object Label65: TUniLabel
                Left = 8
                Top = 84
                Width = 47
                Height = 13
                Hint = ''
                Caption = 'Extension'
                TabOrder = 5
              end
            end
            object PnlClient04: TUniPanel
              Tag = 1999
              Left = 104
              Top = 1
              Width = 167
              Height = 204
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              ExplicitHeight = 197
              DesignSize = (
                167
                204)
              object sbtnEPlant: TUniSpeedButton
                Left = 121
                Top = 128
                Width = 21
                Height = 21
                Hint = 'Assign Plant'
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
                OnClick = sbtnEPlantClick
              end
              object dbchkUSAmaskShipTo: TUniDBCheckBox
                Left = 0
                Top = 32
                Width = 97
                Height = 22
                Hint = 'Use USA data mask for phone and fax numbers'
                DataField = 'USE_USA_MASK'
                DataSource = SrcConsolidator
                ValueChecked = 'Y'
                ValueUnchecked = 'N'
                Caption = 'Use USA mask'
                TabOrder = 1
              end
              object dbeShipPhone: TUniDBEdit
                Left = 0
                Top = 56
                Width = 116
                Height = 21
                Hint = ''
                DataField = 'PHONE_NUMBER'
                DataSource = SrcConsolidator
                TabOrder = 2
              end
              object dbeShipFax: TUniDBEdit
                Left = 0
                Top = 104
                Width = 116
                Height = 21
                Hint = ''
                DataField = 'FAX'
                DataSource = SrcConsolidator
                TabOrder = 4
              end
              object dbePlantName: TUniDBEdit
                Left = 0
                Top = 128
                Width = 118
                Height = 21
                Hint = ''
                DataField = 'EPlant_Name'
                DataSource = SrcConsolidator
                TabOrder = 5
                TabStop = False
                Color = clBtnFace
              end
              object dbeShipToExtension: TUniDBEdit
                Left = 0
                Top = 80
                Width = 38
                Height = 21
                Hint = ''
                DataField = 'EXT'
                DataSource = SrcConsolidator
                TabOrder = 3
              end
              object dbeShipContact: TUniDBEdit
                Left = 0
                Top = 8
                Width = 162
                Height = 21
                Hint = ''
                DataField = 'PRIME_CONTACT'
                DataSource = SrcConsolidator
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
            end
          end
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'TabGrid'
        ExplicitHeight = 201
        object Grid: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 553
          Height = 208
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = ANSI_CHARSET
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 336
          IQComponents.Grid.Height = 122
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcConsolidator
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
          IQComponents.Navigator.DataSource = SrcConsolidator
          IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 336
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 122
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.HiddenPanel.ExplicitHeight = 115
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          IQComponents.FormTab.ExplicitHeight = 144
          DataSource = SrcConsolidator
          Columns = <
            item
              FieldName = 'ATTN'
              Title.Caption = 'Company'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ADDR1'
              Title.Caption = 'Address1'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ADDR2'
              Title.Caption = 'Address2'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ADDR3'
              Title.Caption = 'Address3'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CITY'
              Title.Caption = 'City'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STATE'
              Title.Caption = 'State'
              Width = 14
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'COUNTRY'
              Title.Caption = 'Country'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ZIP'
              Title.Caption = 'ZIP'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PHONE_NUMBER'
              Title.Caption = 'Phone'
              Width = 175
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EXT'
              Title.Caption = 'Ext.'
              Width = 35
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'FAX'
              Title.Caption = 'Fax'
              Width = 175
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PRIME_CONTACT'
              Title.Caption = 'Contact'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'USE_USA_MASK'
              Title.Caption = 'USA Mask'
              Width = 7
              CheckBoxField.FieldValues = 'Y;N'
            end
            item
              FieldName = 'EPlant_Name'
              Title.Caption = 'EPlant Name'
              Width = 140
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          ExplicitHeight = 201
          Marker = 0
        end
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 563
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnTableForm: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Table / Form View'
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
    object Nav: TUniDBNavigator
      Left = 337
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcConsolidator
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 112
    object File1: TUniMenuItem
      Caption = '&File'
      object Search1: TUniMenuItem
        Caption = '&Search'
        OnClick = sbtnSearchClick
      end
      object ToggleGridForm1: TUniMenuItem
        Caption = 'Toggle Table/Form View'
        OnClick = sbtnTableFormClick
      end
      object N1: TUniMenuItem
        Caption = '-'
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
      object N2: TUniMenuItem
        Caption = '-'
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object PkSearch: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id              as id            ,'
      '       attn            as attn          ,'
      '       addr1           as addr1         ,'
      '       addr2           as addr2         ,'
      '       addr3           as addr3         ,'
      '       city            as city          ,'
      '       state           as state         ,'
      '       country         as country       ,'
      '       zip             as zip           ,'
      '       phone_number    as phone_number  ,'
      '       ext             as ext           ,'
      '       fax             as fax           ,'
      '       prime_contact   as prime_contact ,'
      '       eplant_id       as eplant_id'
      '  from consolidator'
      ' where misc.eplant_filter(eplant_id) = 1'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 140
    object PkSearchID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.DIST_CENTER.ID'
      Visible = False
      Size = 0
    end
    object PkSearchATTN: TStringField
      DisplayLabel = 'Company'
      FieldName = 'ATTN'
      Origin = 'IQ.DIST_CENTER.ATTN'
      FixedChar = True
      Size = 60
    end
    object PkSearchADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Origin = 'IQ.DIST_CENTER.ADDR1'
      FixedChar = True
      Size = 60
    end
    object PkSearchADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Origin = 'IQ.DIST_CENTER.ADDR2'
      FixedChar = True
      Size = 60
    end
    object PkSearchADDR3: TStringField
      DisplayLabel = 'Address 3'
      FieldName = 'ADDR3'
      Origin = 'IQ.DIST_CENTER.ADDR3'
      FixedChar = True
      Size = 60
    end
    object PkSearchCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'IQ.DIST_CENTER.CITY'
      FixedChar = True
      Size = 30
    end
    object PkSearchSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Origin = 'IQ.DIST_CENTER.STATE'
      FixedChar = True
    end
    object PkSearchCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Origin = 'IQ.DIST_CENTER.COUNTRY'
      FixedChar = True
      Size = 30
    end
    object PkSearchZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 'IQ.DIST_CENTER.ZIP'
      FixedChar = True
      Size = 10
    end
    object PkSearchPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone #'
      FieldName = 'PHONE_NUMBER'
      Origin = 'IQ.DIST_CENTER.PHONE_NUMBER'
      Size = 25
    end
    object PkSearchEXT: TStringField
      DisplayLabel = 'Extension'
      FieldName = 'EXT'
      Origin = 'IQ.DIST_CENTER.EXT'
      FixedChar = True
      Size = 5
    end
    object PkSearchFAX: TStringField
      DisplayLabel = 'Fax #'
      FieldName = 'FAX'
      Origin = 'IQ.DIST_CENTER.FAX'
      Size = 25
    end
    object PkSearchPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      FieldName = 'PRIME_CONTACT'
      Origin = 'IQ.DIST_CENTER.PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object PkSearchEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.DIST_CENTER.EPLANT_ID'
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Consolidator'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196867 $'
    BuildVersion = '176554'
    Left = 168
  end
  object SrcConsolidator: TDataSource
    DataSet = TblConsolidator
    OnDataChange = SrcConsolidatorDataChange
    Left = 199
  end
  object TblConsolidator: TFDTable
    BeforeOpen = TblConsolidatorBeforeOpen
    BeforePost = TblConsolidatorBeforePost
    BeforeDelete = TblConsolidatorBeforeDelete
    OnNewRecord = TblConsolidatorNewRecord
    Filtered = True
    IndexFieldNames = 'ID'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'CONSOLIDATOR'
    TableName = 'CONSOLIDATOR'
    Left = 243
    object TblConsolidatorATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ATTN'
      FixedChar = True
      Size = 60
    end
    object TblConsolidatorADDR1: TStringField
      DisplayLabel = 'Address1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      FixedChar = True
      Size = 60
    end
    object TblConsolidatorADDR2: TStringField
      DisplayLabel = 'Address2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      FixedChar = True
      Size = 60
    end
    object TblConsolidatorADDR3: TStringField
      DisplayLabel = 'Address3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      FixedChar = True
      Size = 60
    end
    object TblConsolidatorCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 30
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object TblConsolidatorSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
      FixedChar = True
    end
    object TblConsolidatorCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 30
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 30
    end
    object TblConsolidatorZIP: TStringField
      DisplayWidth = 10
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object TblConsolidatorPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      DisplayWidth = 25
      FieldName = 'PHONE_NUMBER'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object TblConsolidatorEXT: TStringField
      DisplayLabel = 'Ext.'
      DisplayWidth = 5
      FieldName = 'EXT'
      FixedChar = True
      Size = 5
    end
    object TblConsolidatorFAX: TStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 25
      FieldName = 'FAX'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object TblConsolidatorPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      DisplayWidth = 30
      FieldName = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object TblConsolidatorUSE_USA_MASK: TStringField
      DisplayLabel = 'USA Mask'
      DisplayWidth = 1
      FieldName = 'USE_USA_MASK'
      FixedChar = True
      Size = 1
    end
    object TblConsolidatorEPlant_Name: TStringField
      DisplayLabel = 'EPlant Name'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'EPlant_Name'
      LookupDataSet = QryEPlant
      LookupKeyFields = 'ID'
      LookupResultField = 'PLANT_NAME'
      KeyFields = 'EPLANT_ID'
      Lookup = True
    end
    object TblConsolidatorNOTES: TStringField
      DisplayWidth = 10
      FieldName = 'NOTES'
      Visible = False
      Size = 2000
    end
    object TblConsolidatorEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object TblConsolidatorID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblConsolidatorSHIP_TIME: TBCDField
      FieldName = 'SHIP_TIME'
      Visible = False
      Size = 3
    end
  end
  object QryEPlant: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, name as plant_name '
      '  from eplant'
      ' order by id')
    Left = 300
    object QryEPlantID: TBCDField
      FieldName = 'ID'
      Origin = 'EPLANT.ID'
      Size = 0
    end
    object QryEPlantPLANT_NAME: TStringField
      FieldName = 'PLANT_NAME'
      Origin = 'EPLANT.NAME'
      Size = 30
    end
  end
end
