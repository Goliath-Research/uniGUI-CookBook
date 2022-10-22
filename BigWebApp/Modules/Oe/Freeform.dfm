object FrmFreeForm: TFrmFreeForm
  Left = 232
  Top = 223
  HelpContext = 17724
  ClientHeight = 336
  ClientWidth = 631
  Caption = 'Miscellaneous Item Entry'
  OnShow = FormShow
  Constraints.MinHeight = 247
  OldCreateOrder = True
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 631
    Height = 336
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlPageControl: TUniPanel
      Left = 1
      Top = 27
      Width = 629
      Height = 272
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object pcMain: TUniPageControl
        Left = 1
        Top = 1
        Width = 627
        Height = 270
        Hint = ''
        ActivePage = TabForm
        TabBarVisible = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabForm: TUniTabSheet
          Hint = ''
          Caption = 'TabForm'
          object PnlMiscItem: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 619
            Height = 242
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter2: TUniSplitter
              Left = 153
              Top = 0
              Width = 6
              Height = 242
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlLeft01: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 153
              Height = 240
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object lblMiscellaneousItem: TUniLabel
                Left = 8
                Top = 11
                Width = 101
                Height = 13
                Hint = ''
                Caption = 'Miscellaneous Item #'
                TabOrder = 1
              end
              object lblDescription: TUniLabel
                Left = 8
                Top = 35
                Width = 53
                Height = 13
                Hint = ''
                Caption = 'Description'
                TabOrder = 2
              end
              object lblUnitPrice: TUniLabel
                Left = 8
                Top = 83
                Width = 45
                Height = 13
                Hint = ''
                Caption = 'Unit Price'
                TabOrder = 3
              end
              object lblGLAccount: TUniLabel
                Left = 8
                Top = 131
                Width = 54
                Height = 13
                Hint = ''
                Caption = 'GL Account'
                TabOrder = 4
              end
              object lblUnit: TUniLabel
                Left = 8
                Top = 107
                Width = 19
                Height = 13
                Hint = ''
                Caption = 'Unit'
                TabOrder = 5
              end
              object lblQuantity: TUniLabel
                Left = 8
                Top = 59
                Width = 42
                Height = 13
                Hint = ''
                Caption = 'Quantity'
                TabOrder = 6
              end
              object lblEPlant: TUniLabel
                Left = 8
                Top = 155
                Width = 30
                Height = 13
                Hint = ''
                Caption = 'EPlant'
                TabOrder = 7
              end
              object lblNote: TUniLabel
                Left = 8
                Top = 179
                Width = 23
                Height = 13
                Hint = ''
                Caption = 'Note'
                TabOrder = 8
              end
            end
            object Panel9: TUniPanel
              Tag = 1999
              Left = 159
              Top = 1
              Width = 460
              Height = 240
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object Panel10: TUniPanel
                Tag = 1999
                Left = 430
                Top = 1
                Width = 30
                Height = 238
                Hint = ''
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
                object sbtnSearchAcct: TUniSpeedButton
                  Left = 4
                  Top = 128
                  Width = 22
                  Height = 22
                  Hint = 'Assign GL Account'
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
                  OnClick = SelectGLAccount1Click
                end
                object sbtnEPlant: TUniSpeedButton
                  Left = 4
                  Top = 152
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
                  OnClick = SelectEPlant1Click
                end
              end
              object PnlClient01: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 430
                Height = 238
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                DesignSize = (
                  430
                  238)
                object dbeUnitPrice: TUniDBEdit
                  Left = 1
                  Top = 80
                  Width = 114
                  Height = 21
                  Hint = ''
                  DataField = 'UNIT_PRICE'
                  DataSource = SrcMisc
                  TabOrder = 3
                end
                object dbeGLAccount: TUniDBEdit
                  Left = 1
                  Top = 128
                  Width = 436
                  Height = 21
                  Hint = ''
                  DataField = 'Acct'
                  DataSource = SrcMisc
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 5
                  Color = clBtnFace
                  ReadOnly = True
                end
                object cmbUOM: TUniDBComboBox
                  Left = 1
                  Top = 104
                  Width = 114
                  Height = 21
                  Hint = ''
                  DataField = 'UNIT'
                  DataSource = SrcMisc
                  Style = csDropDownList
                  Items.Strings = (
                    'EACH'
                    'LBS'
                    'KG'
                    'OZ'
                    'FT'
                    'YD')
                  TabOrder = 4
                end
                object dbeItemno: TUniDBEdit
                  Left = 1
                  Top = 8
                  Width = 436
                  Height = 21
                  Hint = ''
                  DataField = 'MISC_ITEMNO'
                  DataSource = SrcMisc
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                end
                object dbeDescrip: TUniDBEdit
                  Left = 1
                  Top = 32
                  Width = 436
                  Height = 21
                  Hint = ''
                  DataField = 'MISC_ITEM'
                  DataSource = SrcMisc
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object dbeQuantity: TUniDBEdit
                  Left = 1
                  Top = 56
                  Width = 114
                  Height = 21
                  Hint = ''
                  DataField = 'QUAN'
                  DataSource = SrcMisc
                  TabOrder = 2
                end
                object dbeEPlant: TUniDBEdit
                  Left = 1
                  Top = 152
                  Width = 436
                  Height = 21
                  Hint = ''
                  DataField = 'Eplant_name'
                  DataSource = SrcMisc
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 6
                  TabStop = False
                  Color = clBtnFace
                end
                object cmbNote: TUniEdit
                  Left = 1
                  Top = 176
                  Width = 436
                  Height = 21
                  Hint = ''
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 7
                end
              end
            end
          end
        end
        object TabGrid: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'TabGrid'
          object GridMisc: TIQUniGridControl
            Left = 0
            Top = 0
            Width = 619
            Height = 242
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 402
            IQComponents.Grid.Height = 156
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcMisc
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
            IQComponents.Navigator.DataSource = SrcMisc
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 402
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
            DataSource = SrcMisc
            Columns = <
              item
                FieldName = 'MISC_ITEMNO'
                Title.Caption = 'Miscellaneous Item #'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'MISC_ITEM'
                Title.Caption = 'Description'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'QUAN'
                Title.Caption = 'Quantity'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'UNIT_PRICE'
                Title.Caption = 'Unit Price'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'UNIT'
                Title.Caption = 'Unit'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'Acct'
                Title.Caption = 'GL Account'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'Eplant_name'
                Title.Caption = 'Eplant'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'NOTE'
                Title.Caption = 'Note'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
          object cmbGridGLAccount: TUniEdit
            Left = 184
            Top = 80
            Width = 121
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 1
          end
          object cmbGridEPlant: TUniEdit
            Left = 184
            Top = 120
            Width = 121
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object cmbGridNote: TUniEdit
            Left = 184
            Top = 160
            Width = 121
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 3
          end
        end
        object TabEdit: TUniTabSheet
          Hint = ''
          ImageIndex = 2
          Caption = 'TabEdit'
          object Panel1: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 619
            Height = 242
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter1: TUniSplitter
              Left = 153
              Top = 0
              Width = 6
              Height = 242
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlLeft02: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 153
              Height = 240
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object lblMiscellaneousItem_FreeForm: TUniLabel
                Left = 8
                Top = 11
                Width = 101
                Height = 13
                Hint = ''
                Caption = 'Miscellaneous Item #'
                TabOrder = 1
              end
              object lblDescription_FreeForm: TUniLabel
                Left = 8
                Top = 35
                Width = 53
                Height = 13
                Hint = ''
                Caption = 'Description'
                TabOrder = 2
              end
              object lblUnitPrice_FreeForm: TUniLabel
                Left = 8
                Top = 83
                Width = 45
                Height = 13
                Hint = ''
                Caption = 'Unit Price'
                TabOrder = 3
              end
              object lblGLAccount_FreeForm: TUniLabel
                Left = 8
                Top = 131
                Width = 54
                Height = 13
                Hint = ''
                Caption = 'GL Account'
                TabOrder = 4
              end
              object lblUnit_FreeForm: TUniLabel
                Left = 8
                Top = 107
                Width = 19
                Height = 13
                Hint = ''
                Caption = 'Unit'
                TabOrder = 5
              end
              object lblQuantity_FreeForm: TUniLabel
                Left = 8
                Top = 59
                Width = 42
                Height = 13
                Hint = ''
                Caption = 'Quantity'
                TabOrder = 6
              end
              object lblNote_FreeForm: TUniLabel
                Left = 8
                Top = 155
                Width = 23
                Height = 13
                Hint = ''
                Caption = 'Note'
                TabOrder = 7
              end
            end
            object Panel3: TUniPanel
              Tag = 1999
              Left = 159
              Top = 1
              Width = 460
              Height = 240
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object Panel4: TUniPanel
                Tag = 1999
                Left = 430
                Top = 1
                Width = 30
                Height = 238
                Hint = ''
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
                object sbtnSearchAcct_FreeForm: TUniSpeedButton
                  Left = 4
                  Top = 128
                  Width = 22
                  Height = 22
                  Hint = 'Assign GL Account'
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
                  OnClick = sbtnSearchAcct_FreeFormClick
                end
              end
              object PnlClient02: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 430
                Height = 238
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                DesignSize = (
                  430
                  238)
                object edtUnitPrice: TUniEdit
                  Left = 1
                  Top = 80
                  Width = 114
                  Height = 21
                  Hint = ''
                  Text = ''
                  TabOrder = 3
                end
                object edtGLAccount: TUniEdit
                  Left = 1
                  Top = 128
                  Width = 436
                  Height = 21
                  Hint = ''
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 5
                  Color = clBtnFace
                  ReadOnly = True
                end
                object cmbUOMEdit: TUniDBComboBox
                  Left = 1
                  Top = 104
                  Width = 114
                  Height = 21
                  Hint = ''
                  Style = csDropDownList
                  Items.Strings = (
                    'EACH'
                    'LBS'
                    'KG'
                    'OZ'
                    'FT'
                    'YD')
                  TabOrder = 4
                end
                object edtItemno: TUniEdit
                  Left = 1
                  Top = 8
                  Width = 436
                  Height = 21
                  Hint = ''
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                end
                object edtDescrip: TUniEdit
                  Left = 1
                  Top = 32
                  Width = 436
                  Height = 21
                  Hint = ''
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object edtQuantity: TUniEdit
                  Left = 1
                  Top = 56
                  Width = 114
                  Height = 21
                  Hint = ''
                  Text = ''
                  TabOrder = 2
                end
                object cmbNote_FreeForm: TUniEdit
                  Left = 1
                  Top = 152
                  Width = 436
                  Height = 21
                  Hint = ''
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 6
                end
                object cbEdit: TUniCheckBox
                  Left = 3
                  Top = 186
                  Width = 227
                  Height = 17
                  Hint = ''
                  Visible = False
                  Caption = 'Include edit on Miscellaneous Item record'
                  TabOrder = 7
                end
              end
            end
          end
        end
      end
    end
    object PnlToolbar: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 629
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
      object sbtnToggleTableFormView: TUniSpeedButton
        Left = 26
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Toggle Table/Form View'
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
        OnClick = sbtnToggleTableFormViewClick
      end
      object Nav: TUniDBNavigator
        Left = 404
        Top = 1
        Width = 225
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcMisc
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object PnlModalButtons_General: TUniPanel
      Tag = 1999
      Left = 1
      Top = 299
      Width = 629
      Height = 37
      Hint = ''
      Visible = False
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object PnlModalButtonsInner_General: TUniPanel
        Left = 420
        Top = 1
        Width = 209
        Height = 35
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnOK: TUniButton
          Left = 4
          Top = 6
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&OK'
          TabOrder = 1
          OnClick = btnOKClick
        end
        object btnCancel: TUniButton
          Left = 107
          Top = 5
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&Cancel'
          Cancel = True
          ModalResult = 2
          TabOrder = 2
          OnClick = btnCancelClick
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 432
    Top = 8
    object File1: TUniMenuItem
      Caption = '&File'
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
    object Hidden1: TUniMenuItem
      Caption = 'Hidden'
      Visible = False
      object New1: TUniMenuItem
        Caption = 'New'
        OnClick = New1Click
      end
      object Ok1: TUniMenuItem
        Caption = 'OK'
      end
      object EditNote1: TUniMenuItem
        Caption = 'Edit Note'
        OnClick = EditNote1Click
      end
      object EditNoteFreeForm1: TUniMenuItem
        Caption = 'Edit Note (Free Form)'
        OnClick = EditNoteFreeForm1Click
      end
    end
  end
  object SrcMisc: TDataSource
    DataSet = QryMisc
    Left = 120
  end
  object QryMisc: TFDQuery
    BeforeOpen = DoBeforeOpen
    BeforePost = QryMiscBeforePost
    OnCalcFields = QryMiscCalcFields
    OnNewRecord = QryMiscNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'C_PO_MISC'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      '  SELECT c.id,'
      '         c.misc_item,'
      '         c.misc_itemno,'
      '         c.unit_price,'
      '         c.glacct_id_inv,'
      '         c.unit,'
      '         c.quan,'
      '         c.eplant_id,'
      '         c.kind,'
      '         c.note'
      '    FROM c_po_misc c, eplant e, glacct a'
      '   WHERE misc.eplant_filter_include_nulls (c.eplant_id) = 1 AND'
      '         c.eplant_id = e.id(+) AND'
      '         c.glacct_id_inv = a.id(+) AND'
      '         kind = :KIND'
      'ORDER BY c.id')
    Left = 136
    Top = 8
    ParamData = <
      item
        Name = 'KIND'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryMiscMISC_ITEMNO: TStringField
      DisplayLabel = 'Miscellaneous Item #'
      DisplayWidth = 18
      FieldName = 'MISC_ITEMNO'
      Origin = 'C.MISC_ITEMNO'
      Size = 50
    end
    object QryMiscMISC_ITEM: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 29
      FieldName = 'MISC_ITEM'
      Origin = 'C.MISC_ITEM'
      Size = 100
    end
    object QryMiscQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QUAN'
      Origin = 'C.QUAN'
      Size = 2
    end
    object QryMiscUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Origin = 'C.UNIT_PRICE'
      Size = 6
    end
    object QryMiscUNIT: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Origin = 'C.UNIT'
      Size = 10
    end
    object QryMiscAcct: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Acct'
      Origin = 'a.acct'
      Calculated = True
    end
    object QryMiscEplant_name: TStringField
      DisplayLabel = 'Eplant'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Eplant_name'
      Origin = 'e.name'
      Calculated = True
    end
    object QryMiscNOTE: TStringField
      DisplayLabel = 'Note'
      DisplayWidth = 255
      FieldName = 'NOTE'
      Size = 255
    end
    object QryMiscGLACCT_ID_INV: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_INV'
      Origin = 'IQ.C_PO_MISC.GLACCT_ID_INV'
      Visible = False
      Size = 0
    end
    object QryMiscID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.C_PO_MISC.ID'
      Visible = False
      Size = 0
    end
    object QryMiscEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'C.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryMiscKIND: TStringField
      FieldName = 'KIND'
      Origin = 'C_PO_MISC.KIND'
      Visible = False
      Size = 30
    end
  end
  object PkAcct: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '          type,'
      '          eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      '  and NVL(AP_HIDE, '#39'N'#39') = '#39'N'#39
      ' and misc.eplant_filter(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 237
    Top = 8
    object PkAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAcctACCT: TStringField
      DisplayLabel = 'Acct#'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkAcctTYPE: TStringField
      DisplayLabel = 'Acct. Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object PkAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.EPLANT_ID'
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into c_po_misc'
      
        '  (ID, MISC_ITEM, MISC_ITEMNO, UNIT_PRICE, GLACCT_ID_INV, UNIT, ' +
        'QUAN,'
      '  EPLANT_ID, KIND, NOTE)'
      'values'
      
        '  (:ID, :MISC_ITEM, :MISC_ITEMNO, :UNIT_PRICE, :GLACCT_ID_INV, :' +
        'UNIT, :QUAN,'
      '  :EPLANT_ID, :KIND, :NOTE)')
    ModifySQL.Strings = (
      'update c_po_misc'
      'set'
      '  ID = :ID,'
      '  MISC_ITEM = :MISC_ITEM,'
      '  MISC_ITEMNO = :MISC_ITEMNO,'
      '  UNIT_PRICE = :UNIT_PRICE,'
      '  GLACCT_ID_INV = :GLACCT_ID_INV,'
      '  UNIT = :UNIT,'
      '  QUAN = :QUAN,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  KIND = :KIND,'
      '  NOTE = :NOTE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from c_po_misc'
      'where'
      '  ID = :OLD_ID')
    Left = 151
    Top = 23
  end
  object PkMisc: TIQWebHpick
    BeforeOpen = DoBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT c.id AS id,'
      '       c.misc_item AS misc_item,'
      '       c.misc_itemno AS misc_itemno,'
      '       c.unit_price AS unit_price,'
      '       c.glacct_id_inv AS glacct_id_inv,'
      '       c.unit AS unit,'
      '       c.quan AS quan,'
      '       a.acct AS acct,'
      '       c.eplant_id AS eplant_id,'
      '       c.note AS note'
      '  FROM c_po_misc c, glacct a'
      ' WHERE c.glacct_id_inv = a.id(+) AND'
      '       misc.eplant_filter_include_nulls (c.eplant_id) = 1 AND'
      '       c.kind = :KIND')
    OnIQModify = PkMiscIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 349
    Top = 8
    ParamData = <
      item
        Name = 'KIND'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkMiscID: TBCDField
      DisplayWidth = 18
      FieldName = 'ID'
      Origin = 'c.id'
      Visible = False
      Size = 0
    end
    object PkMiscMISC_ITEM: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'MISC_ITEM'
      Origin = 'c.misc_item'
      Size = 100
    end
    object PkMiscMISC_ITEMNO: TStringField
      DisplayLabel = 'Miscellaneous Item #'
      DisplayWidth = 18
      FieldName = 'MISC_ITEMNO'
      Origin = 'c.misc_itemno'
      Size = 50
    end
    object PkMiscUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 18
      FieldName = 'UNIT_PRICE'
      Origin = 'c.unit_price'
      Size = 6
    end
    object PkMiscGLACCT_ID_INV: TBCDField
      DisplayWidth = 18
      FieldName = 'GLACCT_ID_INV'
      Origin = 'c.glacct_id_inv'
      Visible = False
      Size = 0
    end
    object PkMiscUNIT: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 18
      FieldName = 'UNIT'
      Origin = 'c.unit'
      Size = 10
    end
    object PkMiscACCT: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 18
      FieldName = 'ACCT'
      Origin = 'a.acct'
      Size = 50
    end
    object PkMiscQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 18
      FieldName = 'QUAN'
      Origin = 'c.quan'
      Size = 2
    end
    object PkMiscEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 18
      FieldName = 'EPLANT_ID'
      Origin = 'c.eplant_id'
      Size = 0
    end
    object PkMiscNOTE: TStringField
      DisplayLabel = 'Note'
      DisplayWidth = 25
      FieldName = 'NOTE'
      Origin = 'c.note'
      Size = 255
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Miscellaneous Item Entry'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 191660 $'
    Left = 528
    Top = 8
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'SelectGLAccount1'
      'SelectEPlant1'
      'dbeItemno'
      'dbeDescrip'
      'dbeQuantity'
      'dbeUnitPrice'
      'cmbUOM')
    SecurityCode = 'FRMFREEFORM'
    Left = 556
    Top = 8
  end
  object PGLAccount: TUniPopupMenu
    Left = 460
    Top = 8
    object SelectGLAccount1: TUniMenuItem
      Caption = 'Select GL Account'
      OnClick = SelectGLAccount1Click
    end
  end
  object PEPlant: TUniPopupMenu
    Left = 488
    Top = 8
    object SelectEPlant1: TUniMenuItem
      Caption = 'Select EPlant'
      OnClick = SelectEPlant1Click
    end
  end
  object PkAcctSO: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '          type,'
      '          eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      '  and NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39
      ' and misc.eplant_filter(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 285
    Top = 8
    object FloatField1: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object StringField1: TStringField
      DisplayLabel = 'Acct#'
      FieldName = 'ACCT'
      Size = 50
    end
    object StringField2: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object StringField3: TStringField
      DisplayLabel = 'Acct. Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object FloatField2: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.EPLANT_ID'
      Size = 0
    end
  end
end
