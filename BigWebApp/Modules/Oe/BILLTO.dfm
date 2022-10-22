object FrmBillTo: TFrmBillTo
  Left = 267
  Top = 207
  ClientHeight = 309
  ClientWidth = 739
  Caption = 'Customer Billing Address'
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  DesignSize = (
    739
    309)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 739
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 274
    Width = 739
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 633
      Top = 1
      Width = 106
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnClose: TUniButton
        Left = 2
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Close'
        TabOrder = 1
        OnClick = BtnCloseClick
      end
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 633
      Height = 33
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object sbtnSeachOrdDetail: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search ...'
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
      OnClick = sbtnSeachOrdDetailClick
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 30
    Width = 739
    Height = 244
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 522
    IQComponents.Grid.Height = 158
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = DataSource1
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
    IQComponents.Navigator.DataSource = DataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 522
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 158
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'PRIME_CONTACT'
        Title.Caption = 'Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ATTN'
        Title.Caption = 'Company'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR1'
        Title.Caption = 'Address1'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR2'
        Title.Caption = 'Address2'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR3'
        Title.Caption = 'Address3'
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
        FieldName = 'COUNTRY'
        Title.Caption = 'Country'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STATE'
        Title.Caption = 'State/Region'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ZIP'
        Title.Caption = 'Zip'
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
        FieldName = 'FAX'
        Title.Caption = 'Fax'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EXT'
        Title.Caption = 'Ext'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDBComboBoxCountry: TUniDBLookupComboBox
    Left = 88
    Top = 144
    Width = 271
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    DataField = 'COUNTRY_ID'
    DataSource = DataSource1
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Color = clWindow
  end
  object wwDBComboBoxState: TUniDBLookupComboBox
    Left = 88
    Top = 192
    Width = 271
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    DataField = 'STATE_ID'
    DataSource = DataSource1
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Color = clWindow
  end
  object DataSource1: TDataSource
    DataSet = tBillTo
    OnDataChange = DataSource1DataChange
    Left = 40
    Top = 72
  end
  object tBillTo: TFDTable
    AfterPost = tBillToAfterPost
    OnNewRecord = tBillToNewRecord
    IndexFieldNames = 'ARCUSTO_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'BILL_TO'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'BILL_TO'
    Left = 40
    Top = 96
    object tBillToPRIME_CONTACT: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 30
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object tBillToATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ATTN'
      Size = 60
    end
    object tBillToADDR1: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Size = 60
    end
    object tBillToADDR2: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Size = 60
    end
    object tBillToADDR3: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Size = 60
    end
    object tBillToCITY: TStringField
      DisplayWidth = 30
      FieldName = 'CITY'
      Size = 30
    end
    object tBillToSTATE: TStringField
      DisplayWidth = 2
      FieldName = 'STATE'
    end
    object tBillToCOUNTRY: TStringField
      DisplayWidth = 30
      FieldName = 'COUNTRY'
      Size = 100
    end
    object tBillToZIP: TStringField
      DisplayWidth = 10
      FieldName = 'ZIP'
      Size = 10
    end
    object tBillToPHONE_NUMBER: TStringField
      DisplayWidth = 25
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object tBillToEXT: TStringField
      DisplayWidth = 5
      FieldName = 'EXT'
      Size = 5
    end
    object tBillToFAX: TStringField
      DisplayWidth = 25
      FieldName = 'FAX'
      Size = 25
    end
    object tBillToID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object tBillToARCUSTO_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object tBillToCOUNTRY_ID: TBCDField
      Tag = 1
      FieldName = 'COUNTRY_ID'
      Origin = 'COUNTRY_ID'
      Precision = 15
      Size = 0
    end
    object tBillToSTATE_ID: TBCDField
      Tag = 1
      FieldName = 'STATE_ID'
      Origin = 'STATE_ID'
      Precision = 15
      Size = 0
    end
  end
  object PkAddress: TIQWebHpick
    BeforeOpen = PkAddressBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       addr3,'
      '       city,'
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       ext,'
      '       fax,'
      '       prime_contact'
      ' from bill_to'
      'where arcusto_id = :arcusto_id')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 78
    Top = 73
    ParamData = <
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object FloatField7: TBCDField
      FieldName = 'ID'
      Origin = 'SHIP_TO.ID'
      Visible = False
      Size = 0
    end
    object StringField9: TStringField
      DisplayLabel = 'Primary Contact'
      DisplayWidth = 20
      FieldName = 'PRIME_CONTACT'
      Origin = 'SHIP_TO.PRIME_CONTACT'
      Size = 30
    end
    object StringField10: TStringField
      DisplayLabel = 'Attention'
      DisplayWidth = 15
      FieldName = 'ATTN'
      Origin = 'SHIP_TO.ATTN'
      Size = 60
    end
    object StringField11: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'SHIP_TO.ADDR1'
      Size = 60
    end
    object StringField12: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'SHIP_TO.ADDR2'
      Size = 60
    end
    object StringField13: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Origin = 'SHIP_TO.ADDR3'
      Size = 60
    end
    object StringField14: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'SHIP_TO.CITY'
      Size = 30
    end
    object StringField15: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
      Origin = 'SHIP_TO.STATE'
    end
    object StringField16: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      Origin = 'SHIP_TO.COUNTRY'
      Size = 100
    end
    object StringField17: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Origin = 'SHIP_TO.ZIP'
      Size = 10
    end
    object StringField18: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Origin = 'SHIP_TO.PHONE_NUMBER'
      Size = 25
    end
    object StringField19: TStringField
      DisplayLabel = 'Telephone Ext'
      DisplayWidth = 3
      FieldName = 'EXT'
      Origin = 'SHIP_TO.EXT'
      Size = 5
    end
    object StringField20: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = 'SHIP_TO.FAX'
      Size = 25
    end
  end
end
