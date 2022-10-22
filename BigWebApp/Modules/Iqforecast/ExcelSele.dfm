inherited FrmExcelFilter: TFrmExcelFilter
  ClientHeight = 430
  ClientWidth = 343
  Caption = 'Excel Filter'
  OldCreateOrder = True
  OnCreate = UniFormCreate
  ExplicitWidth = 349
  ExplicitHeight = 459
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox1: TUniGroupBox
    Width = 343
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitWidth = 415
    inherited Label1: TUniLabel
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited Label2: TUniLabel
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited edFuture: TUniEdit
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited edPast: TUniEdit
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
  end
  inherited GroupBox2: TUniGroupBox
    Width = 343
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitWidth = 415
    inherited Label6: TUniLabel
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited sbtnSearchCustomer: TUniSpeedButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited rbtnAllCust: TUniRadioButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited rbtnOneCust: TUniRadioButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited wwcombCustomer: TUniDBLookupComboBox
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ListOnlyMode = lmFollowSource
    end
  end
  inherited GroupBox3: TUniGroupBox
    Top = 273
    Width = 343
    Height = 107
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 272
    ExplicitWidth = 415
    ExplicitHeight = 144
    inherited Label3: TUniLabel
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited rbtnAnyGroup: TUniRadioButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited rbtnOneGroup: TUniRadioButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited wwcombGroup: TUniDBLookupComboBox
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ListOnlyMode = lmFollowSource
    end
  end
  inherited Panel1: TUniPanel
    Top = 380
    Width = 343
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 380
    ExplicitWidth = 343
    inherited Panel2: TUniPanel
      Left = 88
      Width = 255
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 88
      ExplicitWidth = 255
      inherited btnOK: TUniButton
        Left = 50
        Top = 15
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitLeft = 50
        ExplicitTop = 15
      end
      inherited btnCancel: TUniButton
        Left = 157
        Top = 15
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitLeft = 157
        ExplicitTop = 15
      end
    end
  end
  object GroupBox4: TUniGroupBox [4]
    Left = 0
    Top = 164
    Width = 343
    Height = 109
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '  Ship To '
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    ExplicitWidth = 415
    object Label4: TUniLabel
      Left = 36
      Top = 74
      Width = 35
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Ship To'
      TabOrder = 4
    end
    object sbtnSearchShipTo: TUniSpeedButton
      Left = 313
      Top = 70
      Width = 22
      Height = 22
      Hint = 'Search Ship To'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
      OnClick = sbtnSearchShipToClick
    end
    object rbtnAllShipTo: TUniRadioButton
      Left = 10
      Top = 21
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Checked = True
      Caption = 'All Ship To'
      TabOrder = 0
      OnClick = rbtnAllShipToClick
    end
    object rbtnOneShipTo: TUniRadioButton
      Left = 10
      Top = 47
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Select Ship To'
      TabOrder = 1
      OnClick = rbtnAllShipToClick
    end
    object wwcombShipTo: TUniDBLookupComboBox
      Left = 100
      Top = 69
      Width = 210
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListOnlyMode = lmFollowSource
      ListField = 'ATTN'
      ListSource = SrcShip_To_Id
      KeyField = 'ID'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
  end
  inherited wwQryCustomer: TFDQuery
    Top = 296
  end
  inherited PkArcusto: TIQWebHpick
    Left = 2
    Top = 385
  end
  inherited wwQryGroup: TFDQuery
    Left = 112
    Top = 376
  end
  object wwQryShip_To_Id: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select attn,'
      '       id'
      '  from ship_to'
      ' where NVL(pk_hide, '#39'N'#39') = '#39'N'#39
      '  and arcusto_ID = :AId'
      ''
      ' ')
    Left = 65
    Top = 384
    ParamData = <
      item
        Name = 'AId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryShip_To_IdATTN: TStringField
      DisplayLabel = 'Ship To Attn.'
      DisplayWidth = 20
      FieldName = 'ATTN'
      Size = 60
    end
    object wwQryShip_To_IdID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object PkShipTo: TIQWebHpick
    BeforeOpen = PkShipToBeforeOpen
    SQL.Strings = (
      'select attn,'
      '       addr1,'
      '       city, '
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       prime_contact,'
      '       id,'
      '       pk_hide'
      '  from ship_to'
      '  where arcusto_id = :Aid'
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 34
    Top = 389
    ParamData = <
      item
        Name = 'Aid'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkShipToATTN: TStringField
      DisplayLabel = 'Attn.'
      FieldName = 'ATTN'
      Origin = 'IQ.SHIP_TO.ATTN'
      Size = 60
    end
    object PkShipToADDR1: TStringField
      DisplayLabel = 'Address'
      FieldName = 'ADDR1'
      Origin = 'IQ.SHIP_TO.ADDR1'
      Size = 60
    end
    object PkShipToCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'IQ.SHIP_TO.CITY'
      FixedChar = True
      Size = 30
    end
    object PkShipToSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
      Origin = 'IQ.SHIP_TO.STATE'
    end
    object PkShipToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Origin = 'IQ.SHIP_TO.COUNTRY'
      FixedChar = True
      Size = 30
    end
    object PkShipToZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'IQ.SHIP_TO.ZIP'
      FixedChar = True
      Size = 10
    end
    object PkShipToPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone#'
      FieldName = 'PHONE_NUMBER'
      Origin = 'IQ.SHIP_TO.PHONE_NUMBER'
      Size = 25
    end
    object PkShipToPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      FieldName = 'PRIME_CONTACT'
      Origin = 'IQ.SHIP_TO.PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object PkShipToID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.SHIP_TO.ID'
      Size = 0
    end
    object PkShipToPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.SHIP_TO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object SrcShip_To_Id: TDataSource
    DataSet = wwQryShip_To_Id
    Left = 136
    Top = 72
  end
end
