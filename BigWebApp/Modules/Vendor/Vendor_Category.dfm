object FrmVendorCategory: TFrmVendorCategory
  Left = 0
  Top = 0
  HelpContext = 22616
  ClientHeight = 470
  ClientWidth = 722
  Caption = 'Vendor Category'
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
    Top = 185
    Width = 722
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 28
    Width = 722
    Height = 157
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Splitter3: TUniSplitter
      Left = 346
      Top = 1
      Width = 4
      Height = 155
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 345
      Height = 155
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter2: TUniSplitter
        Left = 97
        Top = 1
        Width = 4
        Height = 153
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel6: TUniPanel
        Left = 1
        Top = 1
        Width = 96
        Height = 153
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label1: TUniLabel
          Left = 8
          Top = 12
          Width = 73
          Height = 13
          Hint = ''
          Caption = 'Category Code'
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 8
          Top = 36
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Description'
          TabOrder = 2
        end
        object Label3: TUniLabel
          Left = 8
          Top = 60
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'Note'
          TabOrder = 3
        end
      end
      object Panel7: TUniPanel
        Left = 101
        Top = 1
        Width = 243
        Height = 153
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          243
          153)
        object DBEdit1: TUniDBEdit
          Left = 1
          Top = 9
          Width = 239
          Height = 21
          Hint = ''
          DataField = 'CODE'
          DataSource = SrcCategory
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object DBEdit2: TUniDBEdit
          Left = 1
          Top = 33
          Width = 239
          Height = 21
          Hint = ''
          DataField = 'DESCRIP'
          DataSource = SrcCategory
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object DBMemo1: TUniDBMemo
          Left = 1
          Top = 57
          Width = 239
          Height = 88
          Hint = ''
          DataField = 'NOTE1'
          DataSource = SrcCategory
          ScrollBars = ssVertical
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 2
        end
      end
    end
    object Panel8: TUniPanel
      Left = 350
      Top = 1
      Width = 371
      Height = 155
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter4: TUniSplitter
        Left = 102
        Top = 1
        Width = 4
        Height = 153
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel9: TUniPanel
        Left = 1
        Top = 1
        Width = 101
        Height = 153
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object IQUserDefLabel1: TIQWebUserDefLabel
          Left = 8
          Top = 12
          Width = 56
          Height = 13
          Hint = ''
          Caption = 'User Text 1'
          TabOrder = 1
          ParentAppName = 'IQWIN32.EXE'
        end
        object IQUserDefLabel2: TIQWebUserDefLabel
          Left = 8
          Top = 36
          Width = 56
          Height = 13
          Hint = ''
          Caption = 'User Text 2'
          TabOrder = 2
          ParentAppName = 'IQWIN32.EXE'
        end
        object IQUserDefLabel3: TIQWebUserDefLabel
          Left = 8
          Top = 60
          Width = 56
          Height = 13
          Hint = ''
          Caption = 'User Text 3'
          TabOrder = 3
          ParentAppName = 'IQWIN32.EXE'
        end
        object IQUserDefLabel4: TIQWebUserDefLabel
          Left = 8
          Top = 84
          Width = 72
          Height = 13
          Hint = ''
          Caption = 'User Numeric 1'
          TabOrder = 4
          ParentAppName = 'IQWIN32.EXE'
        end
        object IQUserDefLabel5: TIQWebUserDefLabel
          Left = 8
          Top = 108
          Width = 72
          Height = 13
          Hint = ''
          Caption = 'User Numeric 2'
          TabOrder = 5
          ParentAppName = 'IQWIN32.EXE'
        end
        object IQUserDefLabel6: TIQWebUserDefLabel
          Left = 8
          Top = 132
          Width = 72
          Height = 13
          Hint = ''
          Caption = 'User Numeric 3'
          TabOrder = 6
          ParentAppName = 'IQWIN32.EXE'
        end
      end
      object Panel10: TUniPanel
        Left = 106
        Top = 1
        Width = 264
        Height = 153
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          264
          153)
        object DBEdit46: TIQWebUDComboBox
          Left = 1
          Top = 9
          Width = 261
          Height = 21
          Hint = 'Right click to edit the list'
          ShowHint = True
          ParentShowHint = False
          Anchors = [akLeft, akTop, akRight]
          DataField = 'CUSER1'
          DataSource = SrcCategory
          TabOrder = 0
          KeyTableName = 'VENDOR_CATEGORY'
          KeyFieldName = 'CUSER1'
        end
        object DBEdit47: TIQWebUDComboBox
          Left = 1
          Top = 33
          Width = 261
          Height = 21
          Hint = 'Right click to edit the list'
          ShowHint = True
          ParentShowHint = False
          Anchors = [akLeft, akTop, akRight]
          DataField = 'CUSER2'
          DataSource = SrcCategory
          TabOrder = 1
          KeyTableName = 'VENDOR_CATEGORY'
          KeyFieldName = 'CUSER2'
        end
        object DBEdit48: TIQWebUDComboBox
          Left = 1
          Top = 57
          Width = 261
          Height = 21
          Hint = 'Right click to edit the list'
          ShowHint = True
          ParentShowHint = False
          Anchors = [akLeft, akTop, akRight]
          DataField = 'CUSER3'
          DataSource = SrcCategory
          TabOrder = 2
          KeyTableName = 'VENDOR_CATEGORY'
          KeyFieldName = 'CUSER3'
        end
        object DBEdit49: TUniDBEdit
          Left = 1
          Top = 81
          Width = 93
          Height = 21
          Hint = ''
          DataField = 'NUSER1'
          DataSource = SrcCategory
          TabOrder = 3
        end
        object DBEdit50: TUniDBEdit
          Left = 1
          Top = 105
          Width = 93
          Height = 21
          Hint = ''
          DataField = 'NUSER2'
          DataSource = SrcCategory
          TabOrder = 4
        end
        object DBEdit4: TUniDBEdit
          Left = 1
          Top = 129
          Width = 93
          Height = 21
          Hint = ''
          DataField = 'NUSER3'
          DataSource = SrcCategory
          TabOrder = 5
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 189
    Width = 722
    Height = 281
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 720
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object SpeedButton1: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 26
        Hint = 'Search '
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
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentColor = False
        Color = clWindow
        OnClick = SpeedButton1Click
      end
    end
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 29
      Width = 720
      Height = 251
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 503
      IQComponents.Grid.Height = 165
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcVendors
      IQComponents.Grid.Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgTabs, dgCancelOnExit]
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
      IQComponents.Navigator.DataSource = SrcVendors
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.Navigator.BeforeAction = NavDetailsBeforeAction
      IQComponents.HiddenPanel.Left = 503
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 165
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcVendors
      Columns = <
        item
          FieldName = 'VENDORNO'
          Title.Caption = 'Vendor #'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMPANY'
          Title.Caption = 'Company Name'
          Width = 266
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR1'
          Title.Caption = 'Address 1'
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
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ZIP'
          Title.Caption = 'Postal Code'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR2'
          Title.Caption = 'Address 2'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR3'
          Title.Caption = 'Address 3'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 26
      Hint = 'Search '
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
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSearchClick
    end
    object navMain: TUniDBNavigator
      Left = 481
      Top = 1
      Width = 240
      Height = 26
      Hint = ''
      DataSource = SrcCategory
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 88
    Top = 292
    object File1: TUniMenuItem
      Caption = 'File'
      object Close1: TUniMenuItem
        Caption = 'Close'
        OnClick = Close1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = 'Reports'
      object Print1: TUniMenuItem
        Caption = 'Print'
        OnClick = Print1Click
      end
      object PrintSetup1: TUniMenuItem
        Caption = 'Print Setup'
        OnClick = PrintSetup1Click
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
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 89
    Top = 324
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmVendorCategory'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194023 $'
    BuildVersion = '176554'
    Left = 120
    Top = 292
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMCUSTCATEGORY'
    AfterApply = SRAfterApply
    Left = 120
    Top = 324
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmCustCategory'
    WebUse = False
    TouchScreen = False
    Left = 152
    Top = 292
  end
  object PopupUserDefLabel: TUniPopupMenu
    Left = 155
    Top = 324
    object DefineLabelText1: TUniMenuItem
      Caption = '&Define Label Text'
      OnClick = DefineLabelText1Click
    end
  end
  object QryCategory: TFDQuery
    BeforePost = QryCategoryBeforePost
    OnNewRecord = QryCategoryNewRecord
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.UpdateTableName = 'VENDOR_CATEGORY'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_Category
    SQL.Strings = (
      'select id,'
      '       code,'
      '       descrip,'
      '       cuser1,'
      '       cuser2,'
      '       cuser3,'
      '       nuser1,'
      '       nuser2,'
      '       nuser3,'
      '       note1'
      '  from vendor_category'
      ' order by code'
      '')
    Left = 244
    Top = 285
    object QryCategoryID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryCategoryCODE: TStringField
      FieldName = 'CODE'
      Origin = 'CODE'
    end
    object QryCategoryDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object QryCategoryCUSER1: TStringField
      FieldName = 'CUSER1'
      Origin = 'CUSER1'
      Size = 60
    end
    object QryCategoryCUSER2: TStringField
      FieldName = 'CUSER2'
      Origin = 'CUSER2'
      Size = 60
    end
    object QryCategoryCUSER3: TStringField
      FieldName = 'CUSER3'
      Origin = 'CUSER3'
      Size = 60
    end
    object QryCategoryNUSER1: TFMTBCDField
      FieldName = 'NUSER1'
      Origin = 'NUSER1'
      Precision = 15
      Size = 6
    end
    object QryCategoryNUSER2: TFMTBCDField
      FieldName = 'NUSER2'
      Origin = 'NUSER2'
      Precision = 15
      Size = 6
    end
    object QryCategoryNUSER3: TFMTBCDField
      FieldName = 'NUSER3'
      Origin = 'NUSER3'
      Precision = 15
      Size = 6
    end
    object QryCategoryNOTE1: TStringField
      FieldName = 'NOTE1'
      Origin = 'NOTE1'
      Size = 4000
    end
  end
  object SrcCategory: TDataSource
    DataSet = QryCategory
    Left = 236
    Top = 245
  end
  object QryVendors: TFDQuery
    MasterSource = SrcCategory
    MasterFields = 'ID'
    DetailFields = 'ID'
    ConnectionName = 'IQFD'
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEUpdate]
    UpdateOptions.UpdateTableName = 'VENDOR_CAT_LINK'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_Vendors
    SQL.Strings = (
      'select lnk.id as id,'
      '       lnk.vendor_id as vendor_id,'
      '       lnk.vendor_category_id as vendor_category_id,'
      '       v.vendorno as vendorno,'
      '       v.company as company,'
      '       v.city as city,  '
      '       v.state as state,'
      '       v.zip as zip,'
      '       v.addr1 as addr1, '
      '       v.addr2 as addr2, '
      '       v.addr3 as addr3'
      '  from vendor_cat_link lnk,'
      '       vendor v'
      ' where lnk.vendor_category_id = :id'
      '   and lnk.vendor_id = v.id'
      '       '
      '           '
      ' '
      '')
    Left = 280
    Top = 285
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryVendorsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryVendorsVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'VENDOR_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryVendorsVENDOR_CATEGORY_ID: TBCDField
      FieldName = 'VENDOR_CATEGORY_ID'
      Origin = 'VENDOR_CATEGORY_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryVendorsVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Origin = 'VENDORNO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object QryVendorsCOMPANY: TStringField
      DisplayLabel = 'Company Name'
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 60
    end
    object QryVendorsCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'CITY'
      FixedChar = True
      Size = 30
    end
    object QryVendorsSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object QryVendorsZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object QryVendorsADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 60
    end
    object QryVendorsADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 60
    end
    object QryVendorsADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Origin = 'ADDR3'
      Size = 60
    end
  end
  object SrcVendors: TDataSource
    DataSet = QryVendors
    Left = 280
    Top = 245
  end
  object PkCategory: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '       code,'
      '       descrip'
      '  from vendor_category'
      '')
    OnIQModify = PkCategoryIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 265
    Top = 389
    object PkCategoryID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARCUSTO_CATEGORY.ID'
      Visible = False
      Size = 0
    end
    object PkCategoryCODE: TStringField
      DisplayLabel = 'Category Code'
      FieldName = 'CODE'
      Origin = 'IQ.ARCUSTO_CATEGORY.CODE'
    end
    object PkCategoryDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARCUSTO_CATEGORY.DESCRIP'
      Size = 100
    end
  end
  object PkLinkedVendor: TIQWebHpick
    BeforeOpen = PkLinkedVendorBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select lnk.id as id,'
      '       v.vendorno as vendorno,'
      '       v.company as company,'
      '       v.city as city,  '
      '       v.state as state,'
      '       v.zip as zip,'
      '       v.addr1 as addr1, '
      '       v.addr2 as addr2, '
      '       v.addr3 as addr3,'
      '       v.ID as vendor_id'
      '  from vendor v,'
      '       vendor_cat_link lnk'
      ' where lnk.vendor_category_id = :id'
      '   and lnk.vendor_id = v.id'
      '       '
      '           '
      ' '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 358
    Top = 389
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkLinkedVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Size = 10
    end
    object PkLinkedVendorCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkLinkedVendorCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkLinkedVendorSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object PkLinkedVendorZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkLinkedVendorID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkLinkedVendorADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'VENDOR.ADDR1'
      Size = 60
    end
    object PkLinkedVendorADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'VENDOR.ADDR2'
      Size = 60
    end
    object PkLinkedVendorADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Origin = 'IQ.VENDOR.ADDR3'
      FixedChar = True
      Size = 60
    end
    object PkLinkedVendorVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'IQ.V_VENDOR.ID'
      Visible = False
      Size = 0
    end
  end
  object PkVendor: TIQWebHpick
    BeforeOpen = PkLinkedVendorBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select '
      '       v.vendorno as vendorno,'
      '       v.company as company,'
      '       v.city as city,  '
      '       v.state as state,'
      '       v.zip as zip,'
      '       v.addr1 as addr1, '
      '       v.addr2 as addr2, '
      '       v.addr3 as addr3,'
      '       v.ID as id,'
      '       v.pk_hide as pk_hide,'
      '       lnk.id as vendor_cat_link_id'
      '  from v_vendor v,'
      '       vendor_cat_link lnk'
      '  where misc.eplant_filter_include_nulls( v.eplant_id ) = 1'
      '   and v.id = lnk.vendor_id(+)'
      '   and lnk.vendor_category_id(+) = :id'
      '           '
      ' '
      ' '
      ' ')
    OnIQAfterHPickCreate = PkVendorIQAfterHPickCreate
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 448
    Top = 388
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Origin = 'v.VENDORNO'
      Size = 10
    end
    object PkVendorCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      Origin = 'v.COMPANY'
      Size = 60
    end
    object PkVendorCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'v.city'
      Size = 30
    end
    object PkVendorSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Origin = 'v.state'
    end
    object PkVendorZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 'v.zip'
      Size = 10
    end
    object PkVendorID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkVendorADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'v.ADDR1'
      Size = 60
    end
    object PkVendorADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'v.ADDR2'
      Size = 60
    end
    object PkVendorADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Origin = 'v.ADDR3'
      FixedChar = True
      Size = 60
    end
    object PkVendorPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkVendorVENDOR_CAT_LINK_ID: TBCDField
      FieldName = 'VENDOR_CAT_LINK_ID'
      Visible = False
      Size = 0
    end
  end
  object popmVendors: TUniPopupMenu
    Left = 88
    Top = 373
    object JumpToVendor1: TUniMenuItem
      Caption = 'Jump To Vendor'
      OnClick = JumpToVendor1Click
    end
  end
  object IQJumpVendor: TIQWebJump
    DataField = 'VENDOR_ID'
    DataSource = SrcVendors
    JumpTo = jtVendor
    Left = 424
    Top = 317
  end
  object FDUpdateSQL_Category: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO VENDOR_CATEGORY'
      '(ID, CODE, DESCRIP, CUSER1, CUSER2, '
      '  CUSER3, NUSER1, NUSER2, NUSER3, NOTE1)'
      
        'VALUES (:NEW_ID, :NEW_CODE, :NEW_DESCRIP, :NEW_CUSER1, :NEW_CUSE' +
        'R2, '
      
        '  :NEW_CUSER3, :NEW_NUSER1, :NEW_NUSER2, :NEW_NUSER3, :NEW_NOTE1' +
        ')')
    ModifySQL.Strings = (
      'UPDATE VENDOR_CATEGORY'
      
        'SET ID = :NEW_ID, CODE = :NEW_CODE, DESCRIP = :NEW_DESCRIP, CUSE' +
        'R1 = :NEW_CUSER1, '
      
        '  CUSER2 = :NEW_CUSER2, CUSER3 = :NEW_CUSER3, NUSER1 = :NEW_NUSE' +
        'R1, '
      '  NUSER2 = :NEW_NUSER2, NUSER3 = :NEW_NUSER3, NOTE1 = :NEW_NOTE1'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM VENDOR_CATEGORY'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, CODE, DESCRIP, CUSER1, CUSER2, CUSER3, NUSER1, NUSER2' +
        ', NUSER3, '
      '  NOTE1'
      'FROM VENDOR_CATEGORY'
      'WHERE ID = :ID')
    Left = 240
    Top = 328
  end
  object FDUpdateSQL_Vendors: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO VENDOR_CAT_LINK'
      '(ID, VENDOR_ID, VENDOR_CATEGORY_ID)'
      'VALUES (:NEW_ID, :NEW_VENDOR_ID, :NEW_VENDOR_CATEGORY_ID)')
    ModifySQL.Strings = (
      'UPDATE VENDOR_CAT_LINK'
      
        'SET ID = :NEW_ID, VENDOR_ID = :NEW_VENDOR_ID, VENDOR_CATEGORY_ID' +
        ' = :NEW_VENDOR_CATEGORY_ID'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM VENDOR_CAT_LINK'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, VENDOR_ID, VENDOR_CATEGORY_ID'
      'FROM VENDOR_CAT_LINK'
      'WHERE ID = :ID')
    Left = 280
    Top = 328
  end
end
