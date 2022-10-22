object FrmCloneAKA: TFrmCloneAKA
  Left = 108
  Top = 183
  ClientHeight = 503
  ClientWidth = 842
  Caption = 'Clone AKA'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 462
    Width = 842
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 669
      Top = 1
      Width = 173
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnExit: TUniButton
        Left = 87
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 1
        OnClick = Exit1Click
      end
      object BtnClone: TUniButton
        Left = 6
        Top = 11
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Clone'
        TabOrder = 2
        OnClick = BtnCloneClick
      end
    end
  end
  object GroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 842
    Height = 137
    Hint = ''
    Caption = ' AKA to Clone '
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    object Splitter2: TUniSplitter
      Left = 239
      Top = 0
      Width = 6
      Height = 137
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 121
    end
    object Splitter4: TUniSplitter
      Left = 530
      Top = 0
      Width = 6
      Height = 137
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 121
    end
    object Splitter5: TUniSplitter
      Left = 645
      Top = 0
      Width = 6
      Height = 137
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 121
    end
    object Panel3: TUniPanel
      Left = 2
      Top = 15
      Width = 239
      Height = 120
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 104
      object Splitter1: TUniSplitter
        Left = 73
        Top = 0
        Width = 6
        Height = 120
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
        ExplicitHeight = 104
      end
      object Panel4: TUniPanel
        Left = 1
        Top = 1
        Width = 73
        Height = 118
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitHeight = 102
        object Label1: TUniLabel
          Left = 8
          Top = 4
          Width = 30
          Height = 13
          Hint = ''
          Caption = 'Item#'
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 8
          Top = 24
          Width = 25
          Height = 13
          Hint = ''
          Caption = 'Class'
          TabOrder = 2
        end
        object Label3: TUniLabel
          Left = 8
          Top = 44
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'Rev.'
          TabOrder = 3
        end
        object Label4: TUniLabel
          Left = 8
          Top = 64
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Description'
          TabOrder = 4
        end
        object Label5: TUniLabel
          Left = 8
          Top = 84
          Width = 45
          Height = 13
          Hint = ''
          Caption = 'Descrip.2'
          TabOrder = 5
        end
      end
      object Panel5: TUniPanel
        Left = 79
        Top = 1
        Width = 160
        Height = 118
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitHeight = 102
        DesignSize = (
          160
          118)
        object dbeUserId: TUniDBEdit
          Left = 4
          Top = 1
          Width = 156
          Height = 19
          Hint = ''
          DataField = 'ITEMNO'
          DataSource = SrcAKA
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          TabStop = False
          Color = clBtnFace
        end
        object DBEdit1: TUniDBEdit
          Left = 4
          Top = 21
          Width = 156
          Height = 19
          Hint = ''
          DataField = 'CLASS'
          DataSource = SrcAKA
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          TabStop = False
          Color = clBtnFace
        end
        object DBEdit2: TUniDBEdit
          Left = 4
          Top = 41
          Width = 156
          Height = 19
          Hint = ''
          DataField = 'REV'
          DataSource = SrcAKA
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          TabStop = False
          Color = clBtnFace
        end
        object DBEdit3: TUniDBEdit
          Left = 4
          Top = 61
          Width = 156
          Height = 19
          Hint = ''
          DataField = 'DESCRIP'
          DataSource = SrcAKA
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          TabStop = False
          Color = clBtnFace
        end
        object DBEdit4: TUniDBEdit
          Left = 4
          Top = 81
          Width = 156
          Height = 19
          Hint = ''
          DataField = 'DESCRIP2'
          DataSource = SrcAKA
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          TabStop = False
          Color = clBtnFace
        end
      end
    end
    object Panel6: TUniPanel
      Left = 245
      Top = 15
      Width = 285
      Height = 120
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitHeight = 104
      object Splitter3: TUniSplitter
        Left = 105
        Top = 0
        Width = 6
        Height = 120
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
        ExplicitHeight = 104
      end
      object Panel7: TUniPanel
        Left = 1
        Top = 1
        Width = 105
        Height = 118
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitHeight = 102
        object Label6: TUniLabel
          Left = 8
          Top = 4
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'AKA Item#'
          TabOrder = 1
        end
        object Label9: TUniLabel
          Left = 8
          Top = 24
          Width = 76
          Height = 13
          Hint = ''
          Caption = 'AKA Description'
          TabOrder = 2
        end
        object Label7: TUniLabel
          Left = 8
          Top = 44
          Width = 63
          Height = 13
          Hint = ''
          Caption = 'Ship To Attn.'
          TabOrder = 3
        end
        object Label8: TUniLabel
          Left = 8
          Top = 64
          Width = 57
          Height = 13
          Hint = ''
          Caption = 'Ship To City'
          TabOrder = 4
        end
        object Label10: TUniLabel
          Left = 8
          Top = 84
          Width = 49
          Height = 13
          Hint = ''
          Caption = 'Ship To ID'
          TabOrder = 5
        end
      end
      object Panel8: TUniPanel
        Left = 111
        Top = 1
        Width = 174
        Height = 118
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitHeight = 102
        DesignSize = (
          174
          118)
        object DBEdit5: TUniDBEdit
          Left = 4
          Top = 1
          Width = 167
          Height = 19
          Hint = ''
          DataField = 'CUST_ITEMNO'
          DataSource = SrcAKA
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          TabStop = False
          Color = clBtnFace
        end
        object DBEdit6: TUniDBEdit
          Left = 4
          Top = 21
          Width = 167
          Height = 19
          Hint = ''
          DataField = 'CUST_DESCRIP'
          DataSource = SrcAKA
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          TabStop = False
          Color = clBtnFace
        end
        object DBEdit7: TUniDBEdit
          Left = 4
          Top = 41
          Width = 167
          Height = 19
          Hint = ''
          DataField = 'SHIP_TO_ATTN'
          DataSource = SrcAKA
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          TabStop = False
          Color = clBtnFace
        end
        object DBEdit8: TUniDBEdit
          Left = 4
          Top = 61
          Width = 167
          Height = 19
          Hint = ''
          DataField = 'SHIP_TO_CITY'
          DataSource = SrcAKA
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          TabStop = False
          Color = clBtnFace
        end
        object DBEdit9: TUniDBEdit
          Left = 4
          Top = 81
          Width = 167
          Height = 19
          Hint = ''
          DataField = 'SHIP_TO_ID'
          DataSource = SrcAKA
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          TabStop = False
          Color = clBtnFace
        end
      end
    end
    object Panel9: TUniPanel
      Left = 536
      Top = 15
      Width = 109
      Height = 120
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      Caption = ''
      ExplicitHeight = 104
      object Label11: TUniLabel
        Left = 8
        Top = 4
        Width = 76
        Height = 13
        Hint = ''
        Caption = 'Customer Name'
        TabOrder = 1
      end
      object Label12: TUniLabel
        Left = 8
        Top = 24
        Width = 57
        Height = 13
        Hint = ''
        Caption = 'Customer #'
        TabOrder = 2
      end
      object Label13: TUniLabel
        Left = 10
        Top = 83
        Width = 69
        Height = 13
        Hint = ''
        Caption = 'Item EPlant ID'
        TabOrder = 3
      end
    end
    object Panel10: TUniPanel
      Left = 651
      Top = 15
      Width = 191
      Height = 120
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      Caption = ''
      ExplicitHeight = 104
      DesignSize = (
        191
        120)
      object DBEdit10: TUniDBEdit
        Left = 4
        Top = 1
        Width = 188
        Height = 19
        Hint = ''
        DataField = 'CUSTOMER'
        DataSource = SrcAKA
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
      end
      object DBEdit11: TUniDBEdit
        Left = 4
        Top = 21
        Width = 188
        Height = 19
        Hint = ''
        DataField = 'CUSTNO'
        DataSource = SrcAKA
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
      end
      object DBEdit12: TUniDBEdit
        Left = 4
        Top = 79
        Width = 188
        Height = 19
        Hint = ''
        DataField = 'EPLANT_ID'
        DataSource = SrcAKA
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
      end
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 159
    Width = 842
    Height = 303
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 625
    IQComponents.Grid.Height = 217
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcShipTo
    IQComponents.Grid.Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
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
    IQComponents.Navigator.DataSource = SrcShipTo
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 625
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 217
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 233
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 262
    DataSource = SrcShipTo
    Columns = <
      item
        FieldName = 'ATTN'
        Title.Caption = 'Ship To Attn.'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR1'
        Title.Caption = 'Address1'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR2'
        Title.Caption = 'Address2'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR3'
        Title.Caption = 'Address3'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CITY'
        Title.Caption = 'City'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STATE'
        Title.Caption = 'State'
        Width = 140
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
        Title.Caption = 'Zip.'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PRIME_CONTACT'
        Title.Caption = 'Contact'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'Eplant ID'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    ExplicitTop = 143
    ExplicitHeight = 319
    Marker = 0
  end
  object Panel11: TUniPanel
    Left = 0
    Top = 137
    Width = 842
    Height = 22
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Alignment = taLeftJustify
    Caption = '  Available Ship To'#39's'
    ExplicitTop = 121
  end
  object QryAka: TFDQuery
    Filtered = True
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id,'
      '       a.arinvt_id,'
      '       a.cust_itemno,'
      '       a.cust_descrip,'
      '       a.arcusto_id,'
      '       a.price_per_1000,'
      '       a.comis_prcnt,'
      '       a.currency_id,'
      '       a.ecode,'
      '       a.info_so,'
      '       a.ship_to_id,'
      '       c.company as customer,'
      '       c.custno,'
      '       s.SUPPLIER_CODE as Supplier_Code,'
      '       s.attn as ship_to_attn,'
      '       s.city as ship_to_city,'
      '       r.itemno,'
      '       r.rev,'
      '       r.descrip,'
      '       r.descrip2,'
      '       r.class,'
      '       r.eplant_id'
      '  from aka a,'
      '       arcusto c,'
      '       ship_to s,'
      '       arinvt r'
      ' where a.arcusto_id = c.id(+)'
      '   and a.ship_to_id = s.id(+)'
      '   and a.arinvt_id = r.id'
      '   and a.id = :AID'
      '')
    Left = 584
    Top = 64
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryAkaID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryAkaARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object QryAkaCUST_ITEMNO: TStringField
      FieldName = 'CUST_ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryAkaCUST_DESCRIP: TStringField
      FieldName = 'CUST_DESCRIP'
      Size = 35
    end
    object QryAkaARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object QryAkaPRICE_PER_1000: TStringField
      FieldName = 'PRICE_PER_1000'
      FixedChar = True
      Size = 1
    end
    object QryAkaCOMIS_PRCNT: TFMTBCDField
      FieldName = 'COMIS_PRCNT'
      Size = 6
    end
    object QryAkaCURRENCY_ID: TBCDField
      FieldName = 'CURRENCY_ID'
      Size = 0
    end
    object QryAkaECODE: TStringField
      FieldName = 'ECODE'
      Size = 10
    end
    object QryAkaINFO_SO: TStringField
      FieldName = 'INFO_SO'
      Size = 2000
    end
    object QryAkaSHIP_TO_ID: TBCDField
      FieldName = 'SHIP_TO_ID'
      Size = 0
    end
    object QryAkaCUSTOMER: TStringField
      FieldName = 'CUSTOMER'
      Size = 60
    end
    object QryAkaCUSTNO: TStringField
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryAkaSUPPLIER_CODE: TStringField
      FieldName = 'SUPPLIER_CODE'
      Size = 30
    end
    object QryAkaSHIP_TO_ATTN: TStringField
      FieldName = 'SHIP_TO_ATTN'
      Size = 60
    end
    object QryAkaSHIP_TO_CITY: TStringField
      FieldName = 'SHIP_TO_CITY'
      FixedChar = True
      Size = 30
    end
    object QryAkaITEMNO: TStringField
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryAkaDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryAkaDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryAkaCLASS: TStringField
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object QryAkaEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryAkaREV: TStringField
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 632
    Top = 64
    object File1: TUniMenuItem
      Caption = '&File'
      object Clone1: TUniMenuItem
        Caption = '&Clone'
        OnClick = BtnCloneClick
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
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Clone AKA'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196228 $'
    BuildVersion = '176554'
    Left = 552
    Top = 64
  end
  object SrcAKA: TDataSource
    DataSet = QryAka
    Left = 600
    Top = 72
  end
  object QryShipTo: TFDQuery
    Filtered = True
    CachedUpdates = True
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
      '       prime_contact,'
      '       eplant_id'
      ' from ship_to'
      'where NVL(pk_hide, '#39'N'#39') = '#39'N'#39
      '  and arcusto_id = :ARCUSTO_ID1'
      '  and (eplant_id = :AEplantID or :ADummy = 1)'
      
        '  and id not in (select NVL(ship_to_id, 0) from aka where arcust' +
        'o_id = :ARCUSTO_ID2 and arinvt_id = :ARINVT_ID1)'
      '')
    Left = 680
    Top = 72
    ParamData = <
      item
        Name = 'ARCUSTO_ID1'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'AEplantID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ADummy'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ARCUSTO_ID2'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ARINVT_ID1'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryShipToATTN: TStringField
      DisplayLabel = 'Ship To Attn.'
      DisplayWidth = 20
      FieldName = 'ATTN'
      Origin = 'ATTN'
      Size = 60
    end
    object QryShipToADDR1: TStringField
      DisplayLabel = 'Address1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 60
    end
    object QryShipToADDR2: TStringField
      DisplayLabel = 'Address2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 60
    end
    object QryShipToADDR3: TStringField
      DisplayLabel = 'Address3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Origin = 'ADDR3'
      Size = 60
    end
    object QryShipToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 20
      FieldName = 'CITY'
      Origin = 'CITY'
      FixedChar = True
      Size = 30
    end
    object QryShipToSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 20
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object QryShipToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 30
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      FixedChar = True
      Size = 30
    end
    object QryShipToZIP: TStringField
      DisplayLabel = 'Zip.'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object QryShipToPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      DisplayWidth = 30
      FieldName = 'PRIME_CONTACT'
      Origin = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object QryShipToEPLANT_ID: TBCDField
      DisplayLabel = 'Eplant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Size = 0
    end
    object QryShipToID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcShipTo: TDataSource
    DataSet = QryShipTo
    Left = 696
    Top = 80
  end
end
