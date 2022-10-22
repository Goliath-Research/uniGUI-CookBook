object FrmForecasrGenerateReleaseDlg: TFrmForecasrGenerateReleaseDlg
  Left = 213
  Top = 145
  ClientHeight = 298
  ClientWidth = 459
  Caption = 'Generate Releases'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Height = -14
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Bevel2: TUniPanel
    Left = 0
    Top = 0
    Width = 459
    Height = 4
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object Panel2: TUniPanel
    Tag = 1999
    Left = 0
    Top = 246
    Width = 459
    Height = 52
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 457
      Height = 6
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel3: TUniPanel
      Tag = 1999
      Left = 74
      Top = 6
      Width = 385
      Height = 46
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnAppend: TUniButton
        Left = 1
        Top = 6
        Width = 120
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Append'
        TabOrder = 1
        OnClick = brnOverwriteClick
      end
      object brnOverwrite: TUniButton
        Left = 129
        Top = 6
        Width = 120
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Overwrite'
        TabOrder = 2
        OnClick = brnOverwriteClick
      end
      object btnCancel: TUniButton
        Left = 257
        Top = 6
        Width = 120
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 3
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 4
    Width = 459
    Height = 150
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 182
      Top = 22
      Width = 4
      Height = 128
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Bevel3: TUniPanel
      Left = 1
      Top = 22
      Width = 18
      Height = 128
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 5
      Caption = ''
    end
    object Bevel4: TUniPanel
      Left = 1
      Top = 16
      Width = 457
      Height = 6
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      Caption = ''
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 18
      Top = 22
      Width = 164
      Height = 128
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label3: TUniLabel
        Left = 4
        Top = 10
        Width = 120
        Height = 17
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Number of Releases'
        TabOrder = 1
      end
      object Label4: TUniLabel
        Left = 4
        Top = 39
        Width = 126
        Height = 17
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Quantity per Release'
        TabOrder = 2
      end
      object Label1: TUniLabel
        Left = 4
        Top = 69
        Width = 63
        Height = 17
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Start Date'
        TabOrder = 3
      end
      object Label2: TUniLabel
        Left = 4
        Top = 98
        Width = 103
        Height = 17
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Interval (in days)'
        TabOrder = 4
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 186
      Top = 22
      Width = 273
      Height = 128
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        273
        128)
      object edtCount: TUniEdit
        Left = 1
        Top = 5
        Width = 243
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edtQty: TUniEdit
        Left = 1
        Top = 34
        Width = 243
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edtInterval: TUniEdit
        Left = 1
        Top = 94
        Width = 243
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object dtpStartDate: TUniDBDateTimePicker
        Left = 1
        Top = 64
        Width = 243
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DateTime = 42641.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 1
      Width = 457
      Height = 16
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = ''
      object Label5: TUniLabel
        Left = 1
        Top = 1
        Width = 63
        Height = 18
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' General'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -15
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object PnlClient03: TUniPanel
    Left = 0
    Top = 154
    Width = 459
    Height = 92
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Label6: TUniLabel
      Left = 1
      Top = 1
      Width = 75
      Height = 18
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Customer'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Height = -15
      Font.Style = [fsBold]
      TabOrder = 3
    end
    object Bevel5: TUniPanel
      Left = 1
      Top = 18
      Width = 457
      Height = 6
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Caption = ''
    end
    object Bevel6: TUniPanel
      Left = 1
      Top = 24
      Width = 18
      Height = 68
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 5
      Caption = ''
    end
    object Splitter2: TUniSplitter
      Left = 182
      Top = 24
      Width = 4
      Height = 68
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft02: TUniPanel
      Left = 18
      Top = 24
      Width = 164
      Height = 68
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object chkCustomer: TUniCheckBox
        Left = 7
        Top = 9
        Width = 149
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Specific Customer'
        TabOrder = 0
        OnClick = chkCustomerClick
      end
      object chkShipTo: TUniCheckBox
        Left = 32
        Top = 38
        Width = 127
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Enabled = False
        Caption = 'Specific Ship To'
        TabOrder = 1
        OnClick = chkShipToClick
      end
    end
    object PnlClient04: TUniPanel
      Left = 186
      Top = 24
      Width = 273
      Height = 68
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        273
        68)
      object wwDBComboDlgCustomer: TUniEdit
        Left = 1
        Top = 6
        Width = 243
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Color = clBtnFace
      end
      object wwDBComboDlgShipTo: TUniEdit
        Left = 1
        Top = 36
        Width = 243
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clBtnFace
      end
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
      '       id'
      '  from v_arcusto'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 20
    Top = 219
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
      DisplayLabel = 'State or Region'
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
  end
  object PkShipTo: TIQWebHpick
    BeforeOpen = PkShipToBeforeOpen
    SQL.Strings = (
      'select s.id,'
      '       s.arcusto_id,'
      '       s.attn,'
      '       s.addr1,'
      '       s.addr2,'
      '       s.addr3,'
      '       s.city,'
      '       s.state,'
      '       s.country,'
      '       s.zip,'
      '       s.ship_time,'
      '       s.phone_number,'
      '       s.ext,'
      '       s.fax,'
      '       s.prime_contact,       '
      '       s.freight_id,'
      '       f.descrip,'
      '       s.eplant_id'
      '  from ship_to s,'
      '       freight f'
      ' where s.arcusto_id = :arcusto_id'
      '   and s.freight_id = f.id(+)'
      '   and misc.eplant_filter(s.eplant_id) = 1'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 57
    Top = 219
    ParamData = <
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkShipToID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkShipToARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkShipToATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ATTN'
      FixedChar = True
      Size = 60
    end
    object PkShipToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      FixedChar = True
      Size = 60
    end
    object PkShipToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      FixedChar = True
      Size = 60
    end
    object PkShipToADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      FixedChar = True
      Size = 60
    end
    object PkShipToCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object PkShipToSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      FixedChar = True
    end
    object PkShipToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 30
    end
    object PkShipToZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object PkShipToSHIP_TIME: TBCDField
      DisplayLabel = 'Ship Days'
      FieldName = 'SHIP_TIME'
      Size = 3
    end
    object PkShipToPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object PkShipToEXT: TStringField
      DisplayLabel = 'Extension'
      FieldName = 'EXT'
      FixedChar = True
      Size = 5
    end
    object PkShipToFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Size = 25
    end
    object PkShipToPRIME_CONTACT: TStringField
      DisplayLabel = 'Primary Contact'
      FieldName = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object PkShipToFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Visible = False
      Size = 0
    end
    object PkShipToDESCRIP: TStringField
      DisplayLabel = 'Ship Via'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object PkShipToEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
end
