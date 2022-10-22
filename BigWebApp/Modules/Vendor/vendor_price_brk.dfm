object FrmVendorPriceBrk: TFrmVendorPriceBrk
  Left = 267
  Top = 140
  HelpContext = 16239
  ClientHeight = 592
  ClientWidth = 915
  Caption = 'Buying Price Breaks'
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
    Left = 401
    Top = 27
    Width = 6
    Height = 337
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Splitter4: TUniSplitter
    Left = 0
    Top = 364
    Width = 915
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 368
    Width = 915
    Height = 224
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlLeft02: TUniPanel
      Left = 1
      Top = 28
      Width = 913
      Height = 195
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object pgctrlMode: TUniPageControl
        Left = 1
        Top = 1
        Width = 911
        Height = 193
        Hint = ''
        ActivePage = tabIncrement
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        OnChange = pgctrlModeChange
        object tabIncrement: TUniTabSheet
          Hint = ''
          Caption = 'Increment'
          object pnlIncrease: TUniPanel
            Left = 0
            Top = 0
            Width = 903
            Height = 165
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter2: TUniSplitter
              Left = 127
              Top = 1
              Width = 6
              Height = 163
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlLeft01: TUniPanel
              Left = 1
              Top = 1
              Width = 126
              Height = 163
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label1: TUniLabel
                Left = 10
                Top = 7
                Width = 64
                Height = 13
                Hint = ''
                Caption = 'Increment By'
                TabOrder = 3
              end
              object Label2: TUniLabel
                Left = 8
                Top = 76
                Width = 68
                Height = 13
                Hint = ''
                Caption = 'Effective date'
                TabOrder = 4
              end
              object Label3: TUniLabel
                Left = 8
                Top = 100
                Width = 42
                Height = 13
                Hint = ''
                Caption = 'Precision'
                TabOrder = 5
              end
              object Label6: TUniLabel
                Left = 8
                Top = 124
                Width = 69
                Height = 13
                Hint = ''
                Caption = 'New Comment'
                TabOrder = 6
              end
              object rbPercent: TUniRadioButton
                Left = 30
                Top = 28
                Width = 113
                Height = 17
                Hint = ''
                Checked = True
                Caption = 'Percentage'
                TabOrder = 0
                OnClick = AdjustDisplay
              end
              object rbFlatAmount: TUniRadioButton
                Left = 30
                Top = 51
                Width = 113
                Height = 17
                Hint = ''
                Caption = 'Flat Amount'
                TabOrder = 1
                OnClick = AdjustDisplay
              end
            end
            object Panel9: TUniPanel
              Left = 133
              Top = 1
              Width = 769
              Height = 163
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                769
                163)
              object EdPr: TUniDBNumberEdit
                Left = 2
                Top = 97
                Width = 107
                Height = 21
                Hint = ''
                TabOrder = 1
                MaxValue = 6.000000000000000000
                DecimalSeparator = ','
              end
              object DTDate: TUniDateTimePicker
                Left = 2
                Top = 73
                Width = 107
                Height = 21
                Hint = ''
                DateTime = 42666.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                TabOrder = 0
              end
              object EdIn: TUniDBNumberEdit
                Left = 2
                Top = 25
                Width = 107
                Height = 21
                Hint = ''
                TabOrder = 2
                MaxValue = 100.000000000000000000
                MinValue = -100.000000000000000000
                DecimalSeparator = ','
              end
              object wwDBSpinEditFlatAmount: TUniDBNumberEdit
                Left = 2
                Top = 49
                Width = 107
                Height = 21
                Hint = ''
                TabOrder = 3
                DecimalSeparator = ','
              end
              object edComment: TUniEdit
                Left = 2
                Top = 121
                Width = 641
                Height = 21
                Hint = ''
                MaxLength = 255
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
              end
              object Panel6: TUniPanel
                Left = 650
                Top = 1
                Width = 118
                Height = 161
                Hint = ''
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 5
                Caption = ''
                object BtnOk: TUniButton
                  Left = 9
                  Top = 6
                  Width = 97
                  Height = 25
                  Hint = ''
                  Caption = '&OK'
                  TabOrder = 1
                  OnClick = BtnOkClick
                end
                object BtnCancel: TUniButton
                  Left = 9
                  Top = 37
                  Width = 97
                  Height = 25
                  Hint = ''
                  Caption = '&Cancel'
                  TabOrder = 2
                  OnClick = BtnCancelClick
                end
              end
            end
          end
        end
        object tabManual: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'Manual Adjustment'
          object Panel11: TUniPanel
            Left = 0
            Top = 0
            Width = 903
            Height = 165
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter3: TUniSplitter
              Left = 127
              Top = 1
              Width = 6
              Height = 163
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object Panel12: TUniPanel
              Left = 1
              Top = 1
              Width = 126
              Height = 163
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label8: TUniLabel
                Left = 10
                Top = 12
                Width = 68
                Height = 13
                Hint = ''
                Caption = 'Effective date'
                TabOrder = 1
              end
            end
            object Panel13: TUniPanel
              Left = 133
              Top = 1
              Width = 769
              Height = 163
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object dtManualAdjDate: TUniDateTimePicker
                Left = 2
                Top = 7
                Width = 159
                Height = 21
                Hint = ''
                DateTime = 42666.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                TabOrder = 0
              end
            end
          end
        end
      end
    end
    object Panel14: TUniPanel
      Left = 1
      Top = 1
      Width = 913
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = '  Update Criteria'
      object Panel15: TUniPanel
        Left = 679
        Top = 1
        Width = 233
        Height = 25
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = ''
        object sbtnSearch: TUniSpeedButton
          Left = 204
          Top = 2
          Width = 25
          Height = 21
          Hint = 'Search Currency'
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
        object Label7: TUniLabel
          Left = 2
          Top = 5
          Width = 44
          Height = 13
          Hint = ''
          Caption = 'Currency'
          TabOrder = 3
        end
        object EdCurrncy: TUniEdit
          Left = 56
          Top = 2
          Width = 145
          Height = 19
          Hint = ''
          Text = ''
          TabOrder = 0
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
  end
  object PnlLeft03: TUniPanel
    Left = 0
    Top = 27
    Width = 401
    Height = 337
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 399
      Height = 335
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 182
      IQComponents.Grid.Height = 249
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcArinvt
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
      IQComponents.Navigator.DataSource = SrcArinvt
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 182
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 249
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcArinvt
      Columns = <
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Revision'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 14
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Extended Description'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CODE'
          Title.Caption = 'Prod Code'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AKA_DESCRIP'
          Title.Caption = 'AKA Description'
          Width = 245
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARINVT_GROUP_DESCRIP'
          Title.Caption = 'Inventory Group'
          Width = 420
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AKA_ITEMNO'
          Title.Caption = 'AKA Item #'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AKA_REV'
          Title.Caption = 'AKA Revision'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PK_HIDE'
          Title.Caption = 'Inactive'
          Width = 7
          CheckBoxField.FieldValues = 'Y;N'
        end>
      Marker = 0
    end
  end
  object Panel4: TUniPanel
    Left = 407
    Top = 27
    Width = 508
    Height = 337
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object pcBreaks: TUniPageControl
      Left = 1
      Top = 1
      Width = 506
      Height = 335
      Hint = ''
      Visible = False
      ActivePage = TabArinvt
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabArinvt: TUniTabSheet
        Hint = ''
        Caption = 'TabArinvt'
        object Bevel2: TUniPanel
          Left = 0
          Top = 47
          Width = 498
          Height = 3
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Caption = ''
        end
        object GridArinvt: TIQUniGridControl
          Left = 0
          Top = 50
          Width = 498
          Height = 257
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 281
          IQComponents.Grid.Height = 171
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcArinvt_Breaks
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
          IQComponents.Navigator.DataSource = SrcArinvt_Breaks
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 281
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 171
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcArinvt_Breaks
          Columns = <
            item
              FieldName = 'QUAN'
              Title.Caption = 'Quantity'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QPRICE'
              Title.Caption = 'Price'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PRICE_DATE'
              Title.Caption = 'Price Date'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EFFECT_DATE'
              Title.Caption = 'Effective Date'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DEACTIVE_DATE'
              Title.Caption = 'Inactive Date'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'COMMENT1'
              Title.Caption = 'Comment'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CURR_CODE'
              Title.Caption = 'Currency'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object Panel16: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 498
          Height = 47
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object Panel17: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 496
            Height = 20
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            Color = clBtnShadow
            object Label4: TUniLabel
              Left = 1
              Top = 1
              Width = 99
              Height = 13
              Hint = ''
              Caption = 'Inventory Breaks'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Style = [fsBold]
              TabOrder = 1
            end
          end
          object Panel3: TUniPanel
            Left = 1
            Top = 21
            Width = 496
            Height = 25
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object sbtnToggleHideArinvtBreaks: TUniSpeedButton
              Tag = 1999
              Left = 1
              Top = 1
              Width = 25
              Height = 23
              Hint = 'Toggle Showing Active/Inactive '
              ShowHint = True
              ParentShowHint = False
              GroupIndex = 1
              AllowAllUp = True
              Down = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFC07040B05830B05830A05020A050209048209048
                20904020804020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7171715C
                5C5C5C5C5C5353535353534A4A4A4A4A4A454545424242FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFC07850F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0
                B0F0D0B0904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979D9
                D9D9D5D5D5D0D0D0CDCDCDCDCDCDCDCDCDCDCDCD454545FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFD08860FFF8F0FFF8F0FFF0E0FFF0E0FFE8E0FFE8
                E0F0D0B0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888F7
                F7F7F7F7F7EEEEEEEEEEEEE9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07040
                B05830B05830A05020A05020904820904820904020804020FFF0F0FFE8E0FFE8
                E0F0D0B0904820FF00FFFF00FF7171715C5C5C5C5C5C5353535353534A4A4A4A
                4A4A454545424242F2F2F2E9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07850
                F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0B0F0D0B0904020FFF8F0FFF0E0FFF0
                E0F0D0C0A04820FF00FFFF00FF797979D9D9D9D5D5D5D0D0D0CDCDCDCDCDCDCD
                CDCDCDCDCD454545F7F7F7EEEEEEEEEEEED0D0D04D4D4DFF00FFFF00FFD08860
                FFF8F0E09060D08050D08050D08050D08050F0D0B0904820FFFFFFFFF0F0FFF0
                F0F0D8D0A05020FF00FFFF00FF888888F7F7F790909080808080808080808080
                8080CDCDCD4A4A4AFFFFFFF2F2F2F2F2F2D9D9D9535353FF00FFFF00FFD09070
                FFFFFFFFFFFFFFF0F0FFF0F0FFE8E0FFE8E0F0D0B0904820FFFFFFFFF8F0FFF8
                F0F0E0E0A05020FF00FFFF00FF909090FFFFFFFFFFFFF2F2F2F2F2F2E9E9E9E9
                E9E9CDCDCD4A4A4AFFFFFFF7F7F7F7F7F7E2E2E2535353FF00FFFF00FFE0A080
                FFFFFFF0A880E09870E09060D08050D08050F0D0C0A04820FFFFFFFFFFFFFFFF
                FFFFFFFFA05020FF00FFFF00FFA0A0A0FFFFFFA8A8A898989890909080808080
                8080D0D0D04D4D4DFFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0A890
                FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0F0F0D8D0A05020FFFFFFFFFFFFFFFF
                FFFFFFFFA05020FF00FFFF00FFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F2
                F2F2D9D9D9535353FFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0B8A0
                FFFFFFFFB090F0B090F0A880F09870E09060F0E0E0A05020E0A080D09070D088
                60C07850C07040FF00FFFF00FFB7B7B7FFFFFFB1B1B1B0B0B0A8A8A89A9A9A90
                9090E2E2E2535353A0A0A0909090888888797979717171FF00FFFF00FFF0C0A0
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
                F0C0B0F0C0B0F0B8A0E0A080D09070D08860C07850C07040FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFC7C7C7C1C1C1C1C1C1B8B8B8A0A0A090909088
                8888797979717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentColor = False
              Color = clWindow
              OnClick = sbtnToggleHideAkaBreaksClick
            end
            object NavArinvt: TUniDBNavigator
              Left = 241
              Top = 1
              Width = 254
              Height = 23
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataSource = SrcArinvt_Breaks
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 2
              BeforeAction = CheckRefresh
            end
          end
        end
      end
      object TabAka: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'TabAka'
        object Bevel1: TUniPanel
          Left = 0
          Top = 47
          Width = 498
          Height = 3
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Caption = ''
        end
        object GridAka: TIQUniGridControl
          Left = 0
          Top = 50
          Width = 498
          Height = 257
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 281
          IQComponents.Grid.Height = 171
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcAka_Breaks
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
          IQComponents.Navigator.DataSource = SrcAka_Breaks
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 281
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 171
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcAka_Breaks
          Columns = <
            item
              FieldName = 'QUAN'
              Title.Caption = 'Quantity'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QPRICE'
              Title.Caption = 'Price'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PRICE_DATE'
              Title.Caption = 'Price Date'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EFFECT_DATE'
              Title.Caption = 'Effective Date'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DEACTIVE_DATE'
              Title.Caption = 'Inactive Date'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'COMMENT1'
              Title.Caption = 'Comment'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object Panel5: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 498
          Height = 47
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object Panel7: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 496
            Height = 20
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            Color = clBtnShadow
            object Label5: TUniLabel
              Left = 1
              Top = 1
              Width = 65
              Height = 13
              Hint = ''
              Caption = 'AKA Breaks'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Style = [fsBold]
              TabOrder = 1
            end
          end
          object Panel8: TUniPanel
            Left = 1
            Top = 21
            Width = 496
            Height = 25
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object sbtnToggleHideAkaBreaks: TUniSpeedButton
              Tag = 1999
              Left = 1
              Top = 1
              Width = 25
              Height = 23
              Hint = 'Toggle Showing Active/Inactive '
              ShowHint = True
              ParentShowHint = False
              GroupIndex = 1
              AllowAllUp = True
              Down = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFC07040B05830B05830A05020A050209048209048
                20904020804020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7171715C
                5C5C5C5C5C5353535353534A4A4A4A4A4A454545424242FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFC07850F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0
                B0F0D0B0904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979D9
                D9D9D5D5D5D0D0D0CDCDCDCDCDCDCDCDCDCDCDCD454545FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFD08860FFF8F0FFF8F0FFF0E0FFF0E0FFE8E0FFE8
                E0F0D0B0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888F7
                F7F7F7F7F7EEEEEEEEEEEEE9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07040
                B05830B05830A05020A05020904820904820904020804020FFF0F0FFE8E0FFE8
                E0F0D0B0904820FF00FFFF00FF7171715C5C5C5C5C5C5353535353534A4A4A4A
                4A4A454545424242F2F2F2E9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07850
                F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0B0F0D0B0904020FFF8F0FFF0E0FFF0
                E0F0D0C0A04820FF00FFFF00FF797979D9D9D9D5D5D5D0D0D0CDCDCDCDCDCDCD
                CDCDCDCDCD454545F7F7F7EEEEEEEEEEEED0D0D04D4D4DFF00FFFF00FFD08860
                FFF8F0E09060D08050D08050D08050D08050F0D0B0904820FFFFFFFFF0F0FFF0
                F0F0D8D0A05020FF00FFFF00FF888888F7F7F790909080808080808080808080
                8080CDCDCD4A4A4AFFFFFFF2F2F2F2F2F2D9D9D9535353FF00FFFF00FFD09070
                FFFFFFFFFFFFFFF0F0FFF0F0FFE8E0FFE8E0F0D0B0904820FFFFFFFFF8F0FFF8
                F0F0E0E0A05020FF00FFFF00FF909090FFFFFFFFFFFFF2F2F2F2F2F2E9E9E9E9
                E9E9CDCDCD4A4A4AFFFFFFF7F7F7F7F7F7E2E2E2535353FF00FFFF00FFE0A080
                FFFFFFF0A880E09870E09060D08050D08050F0D0C0A04820FFFFFFFFFFFFFFFF
                FFFFFFFFA05020FF00FFFF00FFA0A0A0FFFFFFA8A8A898989890909080808080
                8080D0D0D04D4D4DFFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0A890
                FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0F0F0D8D0A05020FFFFFFFFFFFFFFFF
                FFFFFFFFA05020FF00FFFF00FFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F2
                F2F2D9D9D9535353FFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0B8A0
                FFFFFFFFB090F0B090F0A880F09870E09060F0E0E0A05020E0A080D09070D088
                60C07850C07040FF00FFFF00FFB7B7B7FFFFFFB1B1B1B0B0B0A8A8A89A9A9A90
                9090E2E2E2535353A0A0A0909090888888797979717171FF00FFFF00FFF0C0A0
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
                F0C0B0F0C0B0F0B8A0E0A080D09070D08860C07850C07040FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFC7C7C7C1C1C1C1C1C1B8B8B8A0A0A090909088
                8888797979717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentColor = False
              Color = clWindow
              OnClick = sbtnToggleHideAkaBreaksClick
            end
            object NavAka: TUniDBNavigator
              Left = 241
              Top = 1
              Width = 254
              Height = 23
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataSource = SrcAka_Breaks
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
              BeforeAction = CheckRefresh
            end
          end
        end
      end
    end
  end
  object Panel10: TUniPanel
    Left = 0
    Top = 0
    Width = 915
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    object sbtnToggleHide: TUniSpeedButton
      Tag = 1999
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Showing Active/Inactive '
      ShowHint = True
      ParentShowHint = False
      GroupIndex = 1
      AllowAllUp = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC07040B05830B05830A05020A050209048209048
        20904020804020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7171715C
        5C5C5C5C5C5353535353534A4A4A4A4A4A454545424242FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC07850F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0
        B0F0D0B0904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979D9
        D9D9D5D5D5D0D0D0CDCDCDCDCDCDCDCDCDCDCDCD454545FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFD08860FFF8F0FFF8F0FFF0E0FFF0E0FFE8E0FFE8
        E0F0D0B0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888F7
        F7F7F7F7F7EEEEEEEEEEEEE9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07040
        B05830B05830A05020A05020904820904820904020804020FFF0F0FFE8E0FFE8
        E0F0D0B0904820FF00FFFF00FF7171715C5C5C5C5C5C5353535353534A4A4A4A
        4A4A454545424242F2F2F2E9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07850
        F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0B0F0D0B0904020FFF8F0FFF0E0FFF0
        E0F0D0C0A04820FF00FFFF00FF797979D9D9D9D5D5D5D0D0D0CDCDCDCDCDCDCD
        CDCDCDCDCD454545F7F7F7EEEEEEEEEEEED0D0D04D4D4DFF00FFFF00FFD08860
        FFF8F0E09060D08050D08050D08050D08050F0D0B0904820FFFFFFFFF0F0FFF0
        F0F0D8D0A05020FF00FFFF00FF888888F7F7F790909080808080808080808080
        8080CDCDCD4A4A4AFFFFFFF2F2F2F2F2F2D9D9D9535353FF00FFFF00FFD09070
        FFFFFFFFFFFFFFF0F0FFF0F0FFE8E0FFE8E0F0D0B0904820FFFFFFFFF8F0FFF8
        F0F0E0E0A05020FF00FFFF00FF909090FFFFFFFFFFFFF2F2F2F2F2F2E9E9E9E9
        E9E9CDCDCD4A4A4AFFFFFFF7F7F7F7F7F7E2E2E2535353FF00FFFF00FFE0A080
        FFFFFFF0A880E09870E09060D08050D08050F0D0C0A04820FFFFFFFFFFFFFFFF
        FFFFFFFFA05020FF00FFFF00FFA0A0A0FFFFFFA8A8A898989890909080808080
        8080D0D0D04D4D4DFFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0A890
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0F0F0D8D0A05020FFFFFFFFFFFFFFFF
        FFFFFFFFA05020FF00FFFF00FFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F2
        F2F2D9D9D9535353FFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0B8A0
        FFFFFFFFB090F0B090F0A880F09870E09060F0E0E0A05020E0A080D09070D088
        60C07850C07040FF00FFFF00FFB7B7B7FFFFFFB1B1B1B0B0B0A8A8A89A9A9A90
        9090E2E2E2535353A0A0A0909090888888797979717171FF00FFFF00FFF0C0A0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
        F0C0B0F0C0B0F0B8A0E0A080D09070D08860C07850C07040FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFC7C7C7C1C1C1C1C1C1B8B8B8A0A0A090909088
        8888797979717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnToggleHideClick
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 48
    Top = 76
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
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    AfterScroll = QryArinvtAfterScroll
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.id,'
      '       v.type,'
      '       v.aka_id,'
      
        '       decode(v.type, '#39'ARINVT_VENDORS'#39', v.itemno, null) as aka_i' +
        'temno,'
      
        '       decode(v.type, '#39'ARINVT_VENDORS'#39', v.descrip, null) as aka_' +
        'descrip,'
      '       decode(v.type, '#39'ARINVT_VENDORS'#39', v.rev, null) as aka_rev,'
      '       d.itemno,'
      '       d.rev,'
      '       d.descrip,'
      '       d.class,'
      '       d.descrip2,'
      '       g.descrip as arinvt_group_descrip,'
      '       p.code,'
      '       d.eplant_id,'
      '       d.pk_hide'
      ''
      '  from (select a.id,'
      '               '#39'ARINVT'#39' as type,'
      '               a.itemno as itemno,'
      '               a.descrip as descrip,'
      '               a.rev as rev,'
      '               -1 as aka_id'
      '          from arinvt a'
      '         where :AID = 0'
      ''
      '         union'
      ''
      '        select av.arinvt_id as id,'
      '              '#39'ARINVT_VENDORS'#39' as type,'
      '               av.vend_itemno as itemno,'
      '               av.vend_descrip as descrip,'
      '               av.vend_rev as rev,'
      '               av.id as aka_id'
      '         from arinvt_vendors av'
      '        where :AID > 0'
      '          and av.vendor_id = :AID'
      '          and exists (select arinvt_vendors_id '
      '                        from arinvt_vendors_breaks '
      '                       where arinvt_vendors_id = av.id)) v,'
      ''
      '       arinvt d,'
      '       prod_code p,'
      '       arinvt_group g'
      ' where d.id = v.id'
      '   and d.prod_code_id = p.id(+)'
      '   and d.arinvt_group_id = g.id(+)'
      '   and (:pk_hide = 1 and NVL(d.pk_hide, '#39'N'#39') = '#39'N'#39
      '        or'
      '        :pk_hide = 2 and NVL(d.pk_hide, '#39'N'#39') = '#39'Y'#39')'
      '   and misc.eplant_filter( d.eplant_id ) = 1'
      '')
    Left = 40
    Top = 112
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'pk_hide'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'd.itemno'
      FixedChar = True
      Size = 50
    end
    object QryArinvtREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'd.rev'
      FixedChar = True
      Size = 15
    end
    object QryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'd.descrip'
      Size = 100
    end
    object QryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'd.class'
      FixedChar = True
      Size = 2
    end
    object QryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP2'
      Origin = 'd.descrip2'
      Size = 100
    end
    object QryArinvtCODE: TStringField
      DisplayLabel = 'Prod Code'
      DisplayWidth = 25
      FieldName = 'CODE'
      Origin = 'p.code'
      Size = 25
    end
    object QryArinvtAKA_DESCRIP: TStringField
      DisplayLabel = 'AKA Description'
      DisplayWidth = 35
      FieldName = 'AKA_DESCRIP'
      Origin = 'v.descrip'
      Size = 100
    end
    object QryArinvtARINVT_GROUP_DESCRIP: TStringField
      DisplayLabel = 'Inventory Group'
      DisplayWidth = 60
      FieldName = 'ARINVT_GROUP_DESCRIP'
      Origin = 'g.descrip'
      Size = 60
    end
    object QryArinvtAKA_ITEMNO: TStringField
      DisplayLabel = 'AKA Item #'
      DisplayWidth = 25
      FieldName = 'AKA_ITEMNO'
      Origin = 'v.itemno'
      Size = 50
    end
    object QryArinvtAKA_REV: TStringField
      DisplayLabel = 'AKA Revision'
      DisplayWidth = 15
      FieldName = 'AKA_REV'
      Origin = 'v.rev'
      Size = 15
    end
    object QryArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'd.eplant_id'
      Size = 0
    end
    object QryArinvtPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object QryArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'v.id'
      Visible = False
      Size = 0
    end
    object QryArinvtTYPE: TStringField
      DisplayWidth = 6
      FieldName = 'TYPE'
      Origin = 'v.type'
      Visible = False
      Size = 14
    end
    object QryArinvtAKA_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'AKA_ID'
      Visible = False
      Size = 38
    end
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 48
    Top = 140
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Customer Price Breaks'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194029 $'
    BuildVersion = '176554'
    Left = 104
    Top = 112
  end
  object QryArinvtVendorsBreaks: TFDQuery
    BeforeOpen = QryArinvtVendorsBreaksBeforeOpen
    OnNewRecord = QryArinvtVendorsBreaksNewRecord
    MasterSource = SrcArinvt
    MasterFields = 'AKA_ID'
    ConnectionName = 'IQFD'
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'ARINVT_VENDORS_BREAKS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLArinvtVendorsBreaks
    SQL.Strings = (
      'select arinvt_vendors_id,'
      '       quan,'
      '       qprice,'
      '       price_date,'
      '       effect_date,'
      '       deactive_date,'
      '       id,'
      '       comment1'
      ' from arinvt_vendors_breaks'
      '  where arinvt_vendors_id = :AKA_ID'
      '    and (:hide_inactive = 0'
      '         or'
      
        '         sysdate between NVL(effect_date, sysdate - 36500) and N' +
        'VL(deactive_date, sysdate + 36500))'
      ' order by quan'
      ''
      ' ')
    Left = 92
    Top = 188
    ParamData = <
      item
        Name = 'AKA_ID'
        DataType = ftFMTBcd
        NumericScale = 38
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'HIDE_INACTIVE'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryArinvtVendorsBreaksQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QUAN'
      Size = 2
    end
    object QryArinvtVendorsBreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'QPRICE'
      Size = 6
    end
    object QryArinvtVendorsBreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      DisplayWidth = 18
      FieldName = 'PRICE_DATE'
    end
    object QryArinvtVendorsBreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
    end
    object QryArinvtVendorsBreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
    end
    object QryArinvtVendorsBreaksCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 30
      FieldName = 'COMMENT1'
      Size = 255
    end
    object QryArinvtVendorsBreaksID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryArinvtVendorsBreaksARINVT_VENDORS_ID: TBCDField
      FieldName = 'ARINVT_VENDORS_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcAka_Breaks: TDataSource
    DataSet = QryArinvtVendorsBreaks
    Left = 92
    Top = 216
  end
  object QryArinvt_Breaks: TFDQuery
    BeforeOpen = QryArinvt_BreaksBeforeOpen
    BeforePost = QryArinvt_BreaksBeforePost
    OnNewRecord = QryArinvt_BreaksNewRecord
    OnFilterRecord = QryArinvt_BreaksFilterRecord
    MasterSource = SrcArinvt
    MasterFields = 'ID'
    DetailFields = 'ID'
    ConnectionName = 'IQFD'
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'ARINVT_BREAKS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLArinvtBreaks
    SQL.Strings = (
      'select a.arinvt_id,'
      '       a.quan,'
      '       a.qprice,'
      '       a.price_date,'
      '       a.effect_date,'
      '       a.deactive_date,'
      '       a.id,'
      '       a.comment1,'
      '       c.curr_code,'
      '       a.currency_id,'
      '       a.buying'
      ' from arinvt_breaks a,'
      '      currency c'
      '  where a.arinvt_id = :ID'
      '    and a.currency_id = c.id(+)'
      '    and (:hide_inactive = 0'
      '         or'
      
        '         sysdate between NVL(a.effect_date, sysdate - 36500) and' +
        ' NVL(a.deactive_date, sysdate + 36500))'
      '    and NVL(a.buying, '#39'N'#39') = '#39'Y'#39
      ' order by a.quan'
      ''
      '  '
      ' ')
    Left = 49
    Top = 189
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'HIDE_INACTIVE'
        DataType = ftString
        ParamType = ptInput
        Size = 21
      end>
    object QryArinvt_BreaksQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QUAN'
      Size = 2
    end
    object QryArinvt_BreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'QPRICE'
      Size = 6
    end
    object QryArinvt_BreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      DisplayWidth = 18
      FieldName = 'PRICE_DATE'
    end
    object QryArinvt_BreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
    end
    object QryArinvt_BreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
    end
    object QryArinvt_BreaksCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 30
      FieldName = 'COMMENT1'
      Size = 255
    end
    object QryArinvt_BreaksCURR_CODE: TStringField
      DisplayLabel = 'Currency'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Size = 10
    end
    object QryArinvt_BreaksARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryArinvt_BreaksID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryArinvt_BreaksCURRENCY_ID: TBCDField
      FieldName = 'CURRENCY_ID'
      Visible = False
      Size = 0
    end
    object QryArinvt_BreaksBUYING: TStringField
      FieldName = 'BUYING'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object SrcArinvt_Breaks: TDataSource
    DataSet = QryArinvt_Breaks
    Left = 49
    Top = 217
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ID'
    DataSource = SrcArinvt
    JumpTo = jtInventory
    Left = 100
    Top = 76
  end
  object PopupMenu1: TUniPopupMenu
    Left = 136
    Top = 112
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to &Inventory'
      OnClick = JumptoInventory1Click
    end
  end
  object UpdateSQLArinvtBreaks: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into arinvt_breaks'
      
        '  (ARINVT_ID, QUAN, QPRICE, PRICE_DATE, EFFECT_DATE, DEACTIVE_DA' +
        'TE, ID, '
      '   COMMENT1, CURRENCY_ID, BUYING)'
      'values'
      
        '  (:ARINVT_ID, :QUAN, :QPRICE, :PRICE_DATE, :EFFECT_DATE, :DEACT' +
        'IVE_DATE, '
      '   :ID, :COMMENT1, :CURRENCY_ID, :BUYING)')
    ModifySQL.Strings = (
      'update arinvt_breaks'
      'set'
      '  ARINVT_ID = :ARINVT_ID,'
      '  QUAN = :QUAN,'
      '  QPRICE = :QPRICE,'
      '  PRICE_DATE = :PRICE_DATE,'
      '  EFFECT_DATE = :EFFECT_DATE,'
      '  DEACTIVE_DATE = :DEACTIVE_DATE,'
      '  ID = :ID,'
      '  COMMENT1 = :COMMENT1,'
      '  CURRENCY_ID = :CURRENCY_ID,'
      '  BUYING = :BUYING'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from arinvt_breaks'
      'where'
      '  ID = :OLD_ID')
    Left = 48
    Top = 248
  end
  object UpdateSQLArinvtVendorsBreaks: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into arinvt_vendors_breaks'
      
        '  (ARINVT_VENDORS_ID, QUAN, QPRICE, PRICE_DATE, EFFECT_DATE, DEA' +
        'CTIVE_DATE, '
      '   ID, COMMENT1)'
      'values'
      
        '  (:ARINVT_VENDORS_ID, :QUAN, :QPRICE, :PRICE_DATE, :EFFECT_DATE' +
        ', :DEACTIVE_DATE, '
      '   :ID, :COMMENT1)')
    ModifySQL.Strings = (
      'update arinvt_vendors_breaks'
      'set'
      '  ARINVT_VENDORS_ID = :ARINVT_VENDORS_ID,'
      '  QUAN = :QUAN,'
      '  QPRICE = :QPRICE,'
      '  PRICE_DATE = :PRICE_DATE,'
      '  EFFECT_DATE = :EFFECT_DATE,'
      '  DEACTIVE_DATE = :DEACTIVE_DATE,'
      '  ID = :ID,'
      '  COMMENT1 = :COMMENT1'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from arinvt_vendors_breaks'
      'where'
      '  ID = :OLD_ID')
    Left = 91
    Top = 246
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'IQSearch1'
      'GridArinvt'
      'GridAka'
      'dtManualAdjDate'
      'EdIn'
      'wwDBSpinEditFlatAmount'
      'DTDate'
      'EdPr'
      'edComment'
      'rbPercent'
      'rbFlatAmount'
      'BtnOk'
      'NavArinvt'
      'NavAka'
      'QryArinvt_Breaks'
      'QryArinvtVendorsBreaks')
    SecurityCode = 'FRMVENDORPRICEBRK'
    AfterApply = SRAfterApply
    Left = 224
    Top = 196
  end
  object PKCurrency: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select distinct curr_code as curr_code'
      '  from currency'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 192
    Top = 248
    object PKCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CURR_CODE'
      Origin = 'CURRENCY.CURR_CODE'
      Size = 10
    end
  end
end
