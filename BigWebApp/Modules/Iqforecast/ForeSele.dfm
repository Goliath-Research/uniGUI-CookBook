object FrmForecastFilter: TFrmForecastFilter
  Left = 352
  Top = 190
  HelpContext = 1000052
  ClientHeight = 318
  ClientWidth = 346
  Caption = 'Forecast Filter'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 346
    Height = 62
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '  Forecast Window in Months  '
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    ExplicitWidth = 359
    object Label1: TUniLabel
      Left = 181
      Top = 31
      Width = 32
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Future'
      TabOrder = 3
    end
    object Label2: TUniLabel
      Left = 17
      Top = 31
      Width = 21
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Past'
      TabOrder = 4
    end
    object edFuture: TUniEdit
      Left = 218
      Top = 26
      Width = 70
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = '0'
      TabOrder = 1
    end
    object edPast: TUniEdit
      Left = 44
      Top = 26
      Width = 71
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = '0'
      TabOrder = 0
    end
  end
  object GroupBox2: TUniGroupBox
    Left = 0
    Top = 62
    Width = 346
    Height = 102
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '  Customers  '
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    ExplicitWidth = 359
    object Label6: TUniLabel
      Left = 36
      Top = 74
      Width = 46
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Customer'
      TabOrder = 4
    end
    object sbtnSearchCustomer: TUniSpeedButton
      Left = 313
      Top = 69
      Width = 22
      Height = 22
      Hint = 'Search Customer'
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
      OnClick = sbtnSearchCustomerClick
    end
    object rbtnAllCust: TUniRadioButton
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
      Caption = 'All Customers'
      TabOrder = 0
      OnClick = rbtnAllCustClick
    end
    object rbtnOneCust: TUniRadioButton
      Left = 10
      Top = 45
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Select Customer'
      TabOrder = 1
      OnClick = rbtnAllCustClick
    end
    object wwcombCustomer: TUniDBLookupComboBox
      Left = 100
      Top = 69
      Width = 210
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListField = 'COMPANY'
      ListSource = SrcCustomer
      KeyField = 'CUSTNO'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
  end
  object GroupBox3: TUniGroupBox
    Left = 0
    Top = 164
    Width = 346
    Height = 104
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '  Forecast Group  '
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    ExplicitWidth = 359
    object Label3: TUniLabel
      Left = 36
      Top = 74
      Width = 29
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Group'
      TabOrder = 4
    end
    object rbtnAnyGroup: TUniRadioButton
      Left = 10
      Top = 21
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Any Group'
      TabOrder = 0
      OnClick = rbtnAnyGroupClick
    end
    object rbtnOneGroup: TUniRadioButton
      Left = 10
      Top = 45
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Select Group'
      TabOrder = 1
      OnClick = rbtnAnyGroupClick
    end
    object wwcombGroup: TUniDBLookupComboBox
      Left = 100
      Top = 69
      Width = 210
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListField = 'DESCRIP'
      ListSource = SrcGroup
      KeyField = 'CODE'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 268
    Width = 346
    Height = 50
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object Panel2: TUniPanel
      Left = 90
      Top = 1
      Width = 256
      Height = 48
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 48
        Top = 12
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 151
        Top = 12
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object wwQryCustomer: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(custno) as custno,'
      '       company,'
      '       id as arcusto_id'
      '  from v_arcusto'
      ' where NVL(pk_hide, '#39'N'#39') = '#39'N'#39
      ' order by custno'
      ' '
      ' ')
    Left = 261
    Top = 189
    object wwQryCustomerCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      Size = 10
    end
    object wwQryCustomerCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
    object wwQryCustomerARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO.ID'
      Visible = False
      Size = 0
    end
  end
  object PkArcusto: TIQWebHpick
    SQL.Strings = (
      'select custno,'
      '       company,'
      '       addr1,'
      '       city, '
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       prime_contact,'
      '       id,'
      '       pk_hide'
      '  from v_arcusto'
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 322
    Top = 190
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArcustoADDR1: TStringField
      DisplayLabel = 'Address'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkArcustoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PkArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 100
    end
    object PkArcustoZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkArcustoPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object PkArcustoPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object PkArcustoID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARCUSTO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object wwQryGroup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       code,'
      '       descrip'
      '  from fr_group'
      ' order by code')
    Left = 292
    Top = 189
    object wwQryGroupCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'IQ.FR_GROUP.CODE'
      Size = 10
    end
    object wwQryGroupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'IQ.FR_GROUP.DESCRIP'
      Size = 35
    end
    object wwQryGroupID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FR_GROUP.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcCustomer: TDataSource
    DataSet = wwQryCustomer
    Left = 216
    Top = 64
  end
  object SrcGroup: TDataSource
    DataSet = wwQryGroup
    Left = 280
    Top = 72
  end
end
