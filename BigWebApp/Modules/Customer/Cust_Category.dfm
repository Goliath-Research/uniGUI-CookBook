object FrmCustCategory: TFrmCustCategory
  Left = 0
  Top = 0
  HelpContext = 22612
  ClientHeight = 470
  ClientWidth = 722
  Caption = 'Customer Category'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
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
      Left = 345
      Top = 0
      Width = 4
      Height = 157
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
        Left = 96
        Top = 0
        Width = 4
        Height = 155
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
        Left = 100
        Top = 1
        Width = 245
        Height = 153
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          245
          153)
        object DBEdit1: TUniDBEdit
          Left = 1
          Top = 9
          Width = 241
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
          Width = 241
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
          Width = 241
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
      Left = 349
      Top = 1
      Width = 373
      Height = 155
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter4: TUniSplitter
        Left = 101
        Top = 0
        Width = 4
        Height = 155
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
        Left = 105
        Top = 1
        Width = 268
        Height = 153
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          268
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
          KeyTableName = 'ARCUSTO_CATEGORY'
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
          KeyTableName = 'ARCUSTO_CATEGORY'
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
          KeyTableName = 'ARCUSTO_CATEGORY'
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
        Left = 3
        Top = 3
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
        OnClick = SpeedButton1Click
      end
    end
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 720
      Height = 253
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 503
      IQComponents.Grid.Height = 167
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcCustomers
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
      IQComponents.Navigator.DataSource = SrcCustomers
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 503
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 167
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcCustomers
      Columns = <
        item
          FieldName = 'CUSTNO'
          Title.Caption = 'Customer #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMPANY'
          Title.Caption = 'Company'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR1'
          Title.Caption = 'Address 1'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR2'
          Title.Caption = 'Address 2'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR3'
          Title.Caption = 'Address 3'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CITY'
          Title.Caption = 'City'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STATE'
          Title.Caption = 'State'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COUNTRY'
          Title.Caption = 'Country'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ZIP'
          Title.Caption = 'Zip/Postal Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PHONE_NUMBER'
          Title.Caption = 'Phone'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRIME_CONTACT'
          Title.Caption = 'Contact Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
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
      Left = 3
      Top = 3
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
      OnClick = sbtnSearchClick
    end
    object navMain: TUniDBNavigator
      Left = 482
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
    ModuleName = 'FrmCustCategory'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196395 $'
    BuildVersion = '176554'
    Left = 120
    Top = 292
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMCUSTCATEGORY'
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
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
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
      '  from arcusto_category'
      ' order by code')
    Left = 260
    Top = 293
    object QryCategoryID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    Left = 260
    Top = 329
  end
  object QryCustomers: TFDQuery
    MasterSource = SrcCategory
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select lnk.id as id,'
      '       lnk.arcusto_category_id,'
      '       lnk.arcusto_id,'
      '       a.custno as custno,'
      '       a.company as company,'
      '       a.addr1 as addr1,'
      '       a.addr2 as addr2,'
      '       a.addr3 as addr3,'
      '       a.city as city,'
      '       a.state as state,'
      '       a.country as country,'
      '       a.zip as zip,'
      '       a.phone_number as phone_number,'
      '       a.prime_contact as prime_contact,'
      '       a.eplant_id as eplant_id'
      '  from arcusto_cat_link lnk,'
      '       arcusto a'
      ' where lnk.arcusto_category_id = :id'
      '   and lnk.arcusto_id = a.id'
      '       '
      '  '
      ' ')
    Left = 296
    Top = 293
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryCustomersCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Origin = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryCustomersCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 60
    end
    object QryCustomersADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 60
    end
    object QryCustomersADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 60
    end
    object QryCustomersADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Origin = 'ADDR3'
      Size = 60
    end
    object QryCustomersCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 20
      FieldName = 'CITY'
      Origin = 'CITY'
      FixedChar = True
      Size = 30
    end
    object QryCustomersSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 10
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object QryCustomersCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      FixedChar = True
      Size = 100
    end
    object QryCustomersZIP: TStringField
      DisplayLabel = 'Zip/Postal Code'
      FieldName = 'ZIP'
      Origin = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object QryCustomersPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE_NUMBER'
      Origin = 'PHONE_NUMBER'
      Size = 25
    end
    object QryCustomersPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact Name'
      FieldName = 'PRIME_CONTACT'
      Origin = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object QryCustomersEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object QryCustomersID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryCustomersARCUSTO_CATEGORY_ID: TBCDField
      FieldName = 'ARCUSTO_CATEGORY_ID'
      Origin = 'ARCUSTO_CATEGORY_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryCustomersARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcCustomers: TDataSource
    DataSet = QryCustomers
    Left = 296
    Top = 329
  end
  object PkLinkedArcusto: TIQWebHpick
    BeforeOpen = PkLinkedArcustoBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      ' select lnk.id as id,'
      '        a.custno as custno,'
      '        a.company as company,'
      '        a.addr1 as addr1,'
      '        a.addr2 as addr2,'
      '        a.addr3 as addr3,'
      '        a.city as city,'
      '        a.state as state,'
      '        a.country as country,'
      '        a.zip as zip,'
      '        a.phone_number as phone_number,'
      '        a.prime_contact as prime_contact,'
      '        a.id as arcusto_id,'
      '        a.eplant_id as eplant_id'
      '   from arcusto a,'
      '        arcusto_cat_link lnk'
      '  where lnk.arcusto_category_id = :id'
      '    and lnk.arcusto_id = a.id'
      '        '
      '   '
      ' '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 295
    Top = 365
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkLinkedArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkLinkedArcustoCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkLinkedArcustoADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkLinkedArcustoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkLinkedArcustoSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object PkLinkedArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 100
    end
    object PkLinkedArcustoZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkLinkedArcustoPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object PkLinkedArcustoPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object PkLinkedArcustoID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object PkLinkedArcustoADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 'ARCUSTO.ADDR2'
      Size = 60
    end
    object PkLinkedArcustoADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Origin = 'ARCUSTO.ADDR3'
      Size = 60
    end
    object PkLinkedArcustoEPLANT_ID: TFloatField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
    end
    object PkLinkedArcustoARCUSTO_ID: TFloatField
      FieldName = 'ARCUSTO_ID'
      Origin = 'IQ.ARCUSTO.ID'
      Visible = False
    end
  end
  object PkCategory: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       code,'
      '       descrip'
      '  from arcusto_category'
      '')
    OnIQModify = PkCategoryIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 261
    Top = 365
    object PkCategoryID: TFloatField
      FieldName = 'ID'
      Origin = 'IQ.ARCUSTO_CATEGORY.ID'
      Visible = False
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
  object popmCustomers: TUniPopupMenu
    Left = 340
    Top = 293
    object JumpToCustomer1: TUniMenuItem
      Caption = 'Jump To Customer'
      OnClick = JumpToCustomer1Click
    end
  end
  object IQJumpCust: TIQWebJump
    DataField = 'ARCUSTO_ID'
    DataSource = SrcCustomers
    JumpTo = jtCustomer
    Left = 340
    Top = 321
  end
  object PkArcusto: TIQWebHpick
    BeforeOpen = PkLinkedArcustoBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.custno as custno,'
      '       a.company as company,'
      '       a.addr1 as addr1,'
      '       a.addr2 as addr2,'
      '       a.addr3 as addr3,'
      '       a.city as city,'
      '       a.state as state,'
      '       a.country as country,'
      '       a.zip as zip,'
      '       a.phone_number as phone_number,'
      '       a.prime_contact as prime_contact,'
      '       a.id as id,'
      '       a.eplant_id as eplant_id,'
      '       a.pk_hide as pk_hide,'
      '       lnk.id as arcusto_cat_link_id'
      '  from IQMS.v_arcusto a,'
      '       arcusto_cat_link lnk'
      ' where misc.eplant_filter_include_nulls( a.eplant_id ) = 1'
      '   and a.id = lnk.arcusto_id(+)'
      '   and lnk.arcusto_category_id(+) = :id'
      ' ')
    OnIQAfterHPickCreate = PkArcustoIQAfterHPickCreate
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 339
    Top = 364
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Origin = 'custno'
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'company'
      Size = 60
    end
    object PkArcustoADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Origin = 'addr1'
      Size = 60
    end
    object PkArcustoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'city'
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Origin = 'state'
    end
    object PkArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Origin = 'country'
      Size = 100
    end
    object PkArcustoZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 'zip'
      Size = 10
    end
    object PkArcustoPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Origin = 'PHONE_NUMBER'
      Size = 25
    end
    object PkArcustoPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      FieldName = 'PRIME_CONTACT'
      Origin = 'PRIME_CONTACT'
      Size = 30
    end
    object PkArcustoID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object PkArcustoADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 60
    end
    object PkArcustoADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Origin = 'ADDR3'
      Size = 60
    end
    object PkArcustoEPLANT_ID: TFloatField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'eplant_id'
    end
    object PkArcustoARCUSTO_CAT_LINK_ID: TFloatField
      FieldName = 'ARCUSTO_CAT_LINK_ID'
      Visible = False
    end
  end
end
