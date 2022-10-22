object FrmBOLPkShip: TFrmBOLPkShip
  Left = 117
  Top = 243
  ClientHeight = 284
  ClientWidth = 553
  Caption = 'BOL Packing Slips'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 272
    Top = 61
    Width = 6
    Height = 185
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Bevel1: TUniPanel
    Left = 0
    Top = 57
    Width = 553
    Height = 4
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    Caption = ''
  end
  object pnlLeft01: TUniPanel
    Left = 0
    Top = 61
    Width = 272
    Height = 185
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Caption = 'pnlLeft01'
    object PageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 270
      Height = 183
      Hint = ''
      ActivePage = TabShipTo
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnChange = PageControl1Change
      object TabShipTo: TUniTabSheet
        Hint = ''
        Caption = 'By Ship To'
        object IQSearch1: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 262
          Height = 155
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 45
          IQComponents.Grid.Height = 69
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcShipTo
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
          IQComponents.HiddenPanel.Left = 45
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 69
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcShipTo
          Columns = <
            item
              FieldName = 'SHIP_TO_ATTN'
              Title.Caption = 'Company'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIP_TO_ADDR1'
              Title.Caption = 'Address'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIP_TO_CITY'
              Title.Caption = 'City'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIP_TO_STATE'
              Title.Caption = 'State/Prov'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIP_TO_COUNTRY'
              Title.Caption = 'Country'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIP_TO_ZIP'
              Title.Caption = 'Zip / Post Code'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
      object TabCustomer: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'By Customer'
        object IQSearch2: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 262
          Height = 155
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 45
          IQComponents.Grid.Height = 69
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcArcusto
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
          IQComponents.Navigator.DataSource = SrcArcusto
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 45
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 69
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcArcusto
          Columns = <
            item
              FieldName = 'CUSTNO'
              Title.Caption = 'Cust #'
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
              Title.Caption = 'Address'
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
              Title.Caption = 'State/Prov'
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
              Title.Caption = 'Zip/Post Code'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 246
    Width = 553
    Height = 38
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel2: TUniPanel
      Tag = 1999
      Left = 342
      Top = 1
      Width = 211
      Height = 36
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 2
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 105
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel4: TUniPanel
    Left = 278
    Top = 61
    Width = 275
    Height = 185
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = 'Panel4'
    object srchPS: TIQUniGridControl
      Left = 1
      Top = 19
      Width = 273
      Height = 166
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 56
      IQComponents.Grid.Height = 80
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcShipments
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
      IQComponents.Navigator.DataSource = SrcShipments
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 56
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 80
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcShipments
      Columns = <
        item
          FieldName = 'PACKSLIPNO'
          Title.Caption = 'PS #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIPDATE'
          Title.Caption = 'Ship Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIP_TO_ATTN'
          Title.Caption = 'Ship To'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARCUSTO_COMPANY'
          Title.Caption = 'Customer'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARCUSTO_ADDR1'
          Title.Caption = 'Address'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARCUSTO_CITY'
          Title.Caption = 'City'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARCUSTO_STATE'
          Title.Caption = 'State'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARCUSTO_ZIP'
          Title.Caption = 'Zip'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PS_DATE'
          Title.Caption = 'PS Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STATUS'
          Title.Caption = 'Status'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARCHIVED'
          Title.Caption = 'Archived'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PS_TICKET_ID'
          Title.Caption = 'Pick Ticket #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIP_VIA'
          Title.Caption = 'Ship Via'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PS_TICKET_BATCH'
          Title.Caption = 'Pick Ticket Batch'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 1
      Width = 273
      Height = 19
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Label2: TUniLabel
        Left = 1
        Top = 3
        Width = 63
        Height = 13
        Hint = ''
        Caption = ' Packing Slips'
        TabOrder = 2
      end
      object Panel5: TUniPanel
        Left = 178
        Top = 1
        Width = 95
        Height = 17
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object chkMultiSelect: TUniCheckBox
          Left = 1
          Top = 2
          Width = 87
          Height = 15
          Hint = 'Select individual packing slip(s). '
          ShowHint = True
          ParentShowHint = False
          Caption = 'Tag manually'
          TabOrder = 0
          OnClick = chkMultiSelectClick
        end
      end
    end
  end
  object GroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 553
    Height = 57
    Hint = ''
    Caption = '  Selection Criteria  '
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    object Label4: TUniLabel
      Left = 13
      Top = 26
      Width = 24
      Height = 13
      Hint = ''
      Caption = 'From'
      TabOrder = 3
    end
    object Label5: TUniLabel
      Left = 212
      Top = 26
      Width = 12
      Height = 13
      Hint = ''
      Caption = 'To'
      TabOrder = 4
    end
    object sbtnApplyDate: TUniSpeedButton
      Left = 386
      Top = 21
      Width = 22
      Height = 22
      Hint = 'Apply selected date and time'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034464034464FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0344640ED1FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A14D3FF03
        4464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0099CC1BD5FF1BD5FF034464FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A22
        D7FF22D7FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00669A00669A00669A29DAFF034464034464034464FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A30DCFF30
        DCFF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF00669A37DEFF37DEFF034464FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A3D
        E0FF3DE0FF3DE0FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00669A00669A00669A00669A44E3FF034464034464034464034464FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A4BE5FF4BE5FF4B
        E5FF4BE5FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00669A5CEBFE5CEBFE5CEBFE5CEBFE034464FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0099CC00669A70
        F1FE70F1FE70F1FE70F1FE034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0099CC0344640344640344640344640344640344
        64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnApplyDateClick
    end
    object wwDate1: TUniDBDateTimePicker
      Left = 45
      Top = 22
      Width = 148
      Height = 21
      Hint = ''
      DateTime = 42671.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 0
    end
    object wwDate2: TUniDBDateTimePicker
      Left = 233
      Top = 22
      Width = 148
      Height = 21
      Hint = ''
      DateTime = 42671.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
  end
  object SrcShipTo: TDataSource
    DataSet = QryShipTo
    Left = 37
    Top = 149
  end
  object QryShipTo: TFDQuery
    BeforeOpen = QryShipToBeforeOpen
    OnCalcFields = QryShipToCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct'
      
        '       decode( d.id, NULL, ps.ship_to_id,      d.id     ) as shi' +
        'p_to_id     ,       '
      
        '       decode( d.id, NULL, ps.ship_to_attn,    d.attn   ) as shi' +
        'p_to_attn   ,'
      
        '       decode( d.id, NULL, ps.ship_to_addr1,   d.addr1  ) as shi' +
        'p_to_addr1  ,'
      
        '       decode( d.id, NULL, ps.ship_to_city,    d.city   ) as shi' +
        'p_to_city   ,'
      
        '       decode( d.id, NULL, ps.ship_to_state,   d.state  ) as shi' +
        'p_to_state  ,'
      
        '       decode( d.id, NULL, ps.ship_to_country, d.country) as shi' +
        'p_to_country,'
      
        '       decode( d.id, NULL, ps.ship_to_zip,     d.zip    ) as shi' +
        'p_to_zip'
      '  from shipments ps,'
      '       ship_to s,'
      '       dist_center d'
      ' where '
      '       ps.shipdate between :date1 and :date2'
      '       '
      '   and (:ship_to_id = 0'
      
        '        or decode(s.dist_center_id, NULL, ps.ship_to_id, s.dist_' +
        'center_id ) = :ship_to_id )'
      '   '
      '   and ps.bol_id is NULL'
      '   and NVL(ps.shipment_type, '#39' '#39') <> '#39'CUM SHIP ADJUSTMENT'#39
      '   and misc.eplant_filter( ps.eplant_id ) = 1'
      '   and ps.ship_to_id = s.id(+)'
      '   and s.dist_center_id = d.id(+)'
      ''
      '   and (s.division_id is null'
      '        or'
      '        :Filter_Division_ID = 0'
      '        or'
      '        s.division_id = :Filter_Division_ID)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 37
    Top = 166
    ParamData = <
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'ship_to_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'Filter_Division_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryShipToSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 14
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'decode( d.id, NULL, ps.ship_to_attn,    d.attn   )'
      Size = 60
    end
    object QryShipToSHIP_TO_ADDR1: TStringField
      DisplayLabel = 'Address'
      DisplayWidth = 16
      FieldName = 'SHIP_TO_ADDR1'
      Origin = 'decode( d.id, NULL, ps.ship_to_addr1,   d.addr1  )'
      Size = 60
    end
    object QryShipToSHIP_TO_CITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 11
      FieldName = 'SHIP_TO_CITY'
      Origin = 'decode( d.id, NULL, ps.ship_to_city,    d.city   )'
      Size = 30
    end
    object QryShipToSHIP_TO_STATE: TStringField
      DisplayLabel = 'State/Prov'
      DisplayWidth = 10
      FieldName = 'SHIP_TO_STATE'
      Origin = 'decode( d.id, NULL, ps.ship_to_state,   d.state  )'
    end
    object QryShipToSHIP_TO_COUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 11
      FieldName = 'SHIP_TO_COUNTRY'
      Origin = 'decode( d.id, NULL, ps.ship_to_country, d.country)'
      Size = 100
    end
    object QryShipToSHIP_TO_ZIP: TStringField
      DisplayLabel = 'Zip / Post Code'
      DisplayWidth = 13
      FieldName = 'SHIP_TO_ZIP'
      Origin = 'decode( d.id, NULL, ps.ship_to_zip,     d.zip    )'
    end
    object QryShipToSHIP_TO_ID: TFMTBCDField
      FieldName = 'SHIP_TO_ID'
      Visible = False
      Size = 38
    end
    object QryShipTodate1: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'date1'
      Visible = False
      Calculated = True
    end
    object QryShipTodate2: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'date2'
      Visible = False
      Calculated = True
    end
    object QryShipToPicked_By_Arcusto_ID: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Picked_By_Arcusto_ID'
      Visible = False
      Calculated = True
    end
  end
  object SrcShipments: TDataSource
    DataSet = QryShipments
    Left = 86
    Top = 150
  end
  object QryShipments: TFDQuery
    MasterSource = SrcShipTo
    MasterFields = 'date1;date2;SHIP_TO_ID;Picked_By_Arcusto_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select ps.id                    as id,'
      '       ps.packslipno            as packslipno,'
      '       ps.ship_to_attn          as ship_to_attn,'
      '       ps.arcusto_company       as arcusto_company,'
      '       ps.arcusto_addr1         as arcusto_addr1,'
      '       ps.arcusto_city          as arcusto_city,'
      '       ps.arcusto_state         as arcusto_state,'
      '       ps.arcusto_zip           as arcusto_zip,'
      '       ps.shipdate              as shipdate,'
      '       ps.ps_date               as ps_date,'
      '       a.status_id              as status,'
      '       ps.eplant_id             as eplant_id,'
      '       NVL(ps.archived, '#39'N'#39')    as archived,'
      '       ps.ps_ticket_id          as ps_ticket_id,'
      '       ps.freight_id            as freight_id,'
      '       f.descrip                as ship_via,'
      '       ps.ps_ticket_batch       as ps_ticket_batch'
      '  from shipments ps, '
      '       arcusto a,'
      '       ship_to s,'
      '       freight f'
      ' where '
      '       -- date, eplant and type filter'
      '       ps.shipdate between :date1 and :date2'
      '   and ps.bol_id is NULL'
      '   and misc.eplant_filter( ps.eplant_id ) = 1'
      '   and NVL(ps.shipment_type, '#39' '#39') <> '#39'CUM SHIP ADJUSTMENT'#39
      ''
      '       -- link in customer'
      '   and ps.arcusto_custno = a.custno(+)'
      ''
      '       -- link freight'
      '   and ps.freight_id = f.id(+)    '
      '   '
      '       -- link in ship_to to see if we dist_center_id'
      '   and ps.ship_to_id = s.id(+)'
      ''
      '   and '
      '      ( :picked_by_arcusto_id = 0'
      
        '        -- link to parent query ship_to_id based on ship_to_id_d' +
        'ist or ship_to_id'
      
        '        and decode( s.dist_center_id, NULL, ps.ship_to_id, s.dis' +
        't_center_id ) = :ship_to_id'
      '        '
      '        or'
      ''
      '        :picked_by_arcusto_id > 0'
      '        and '
      '        :picked_by_arcusto_id = ps.arcusto_id )'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 85
    Top = 164
    ParamData = <
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = Null
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = Null
      end
      item
        Name = 'SHIP_TO_ID'
        DataType = ftFMTBcd
        NumericScale = 38
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'picked_by_arcusto_id'
        DataType = ftFloat
        ParamType = ptInput
        Size = 8
        Value = Null
      end>
    object QryShipmentsPACKSLIPNO: TStringField
      DisplayLabel = 'PS #'
      DisplayWidth = 8
      FieldName = 'PACKSLIPNO'
      Origin = 'ps.packslipno'
      Size = 15
    end
    object QryShipmentsSHIPDATE: TDateTimeField
      DisplayLabel = 'Ship Date'
      DisplayWidth = 12
      FieldName = 'SHIPDATE'
      Origin = 'ps.shipdate'
    end
    object QryShipmentsSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 13
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'ps.ship_to_attn '
      FixedChar = True
      Size = 60
    end
    object QryShipmentsARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Customer'
      DisplayWidth = 14
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'ps.arcusto_company'
      FixedChar = True
      Size = 60
    end
    object QryShipmentsARCUSTO_ADDR1: TStringField
      DisplayLabel = 'Address'
      DisplayWidth = 17
      FieldName = 'ARCUSTO_ADDR1'
      Origin = 'ps.arcusto_addr1 '
      FixedChar = True
      Size = 60
    end
    object QryShipmentsARCUSTO_CITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 12
      FieldName = 'ARCUSTO_CITY'
      Origin = 'ps.arcusto_city'
      FixedChar = True
      Size = 30
    end
    object QryShipmentsARCUSTO_STATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 8
      FieldName = 'ARCUSTO_STATE'
      Origin = 'ps.arcusto_state'
      FixedChar = True
    end
    object QryShipmentsARCUSTO_ZIP: TStringField
      DisplayLabel = 'Zip'
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ZIP'
      Origin = 'ps.arcusto_zip'
      FixedChar = True
    end
    object QryShipmentsPS_DATE: TDateTimeField
      DisplayLabel = 'PS Date'
      DisplayWidth = 18
      FieldName = 'PS_DATE'
      Origin = 'ps.ps_date  '
    end
    object QryShipmentsSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 12
      FieldName = 'STATUS'
      Origin = 'a.status_id'
      FixedChar = True
    end
    object QryShipmentsEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'ps.eplant_id'
      Size = 0
    end
    object QryShipmentsARCHIVED: TStringField
      DisplayLabel = 'Archived'
      DisplayWidth = 8
      FieldName = 'ARCHIVED'
      Origin = 'NVL(ps.archived, '#39'N'#39')'
      Size = 1
    end
    object QryShipmentsPS_TICKET_ID: TBCDField
      DisplayLabel = 'Pick Ticket #'
      DisplayWidth = 12
      FieldName = 'PS_TICKET_ID'
      Origin = 'ps.ps_ticket_id'
      Size = 0
    end
    object QryShipmentsSHIP_VIA: TStringField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 30
      FieldName = 'SHIP_VIA'
      Origin = 'f.descrip'
      Size = 60
    end
    object QryShipmentsPS_TICKET_BATCH: TBCDField
      DisplayLabel = 'Pick Ticket Batch'
      DisplayWidth = 10
      FieldName = 'PS_TICKET_BATCH'
      Origin = 'ps.PS_TICKET_BATCH'
      Size = 0
    end
    object QryShipmentsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryShipmentsFREIGHT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FREIGHT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcArcusto: TDataSource
    DataSet = QryArcusto
    Left = 39
    Top = 204
  end
  object QryArcusto: TFDQuery
    BeforeOpen = QryArcustoBeforeOpen
    OnCalcFields = QryArcustoCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       custno,'
      '       company,'
      '       addr1,'
      '       city,'
      '       state,'
      '       country,'
      '       zip,'
      '       id as picked_by_arcusto_id'
      '  from arcusto'
      ' where :arcusto_id = 0 '
      '    or :arcusto_id = id')
    Left = 39
    Top = 218
    ParamData = <
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryArcustoCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 25
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
    object QryArcustoADDR1: TStringField
      DisplayLabel = 'Address'
      DisplayWidth = 25
      FieldName = 'ADDR1'
      Origin = 'ARCUSTO.ADDR1'
      Size = 60
    end
    object QryArcustoCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'ARCUSTO.CITY'
      FixedChar = True
      Size = 30
    end
    object QryArcustoSTATE: TStringField
      DisplayLabel = 'State/Prov'
      DisplayWidth = 10
      FieldName = 'STATE'
      Origin = 'ARCUSTO.STATE'
    end
    object QryArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Origin = 'ARCUSTO.COUNTRY'
      FixedChar = True
      Size = 100
    end
    object QryArcustoZIP: TStringField
      DisplayLabel = 'Zip/Post Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'ARCUSTO.ZIP'
      FixedChar = True
      Size = 10
    end
    object QryArcustoID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ARCUSTO.ID'
      Visible = False
      Size = 0
    end
    object QryArcustoShip_To_ID: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Ship_To_ID'
      Visible = False
      Calculated = True
    end
    object QryArcustoPICKED_BY_ARCUSTO_ID: TBCDField
      FieldName = 'PICKED_BY_ARCUSTO_ID'
      Origin = 'IQ.ARCUSTO.ID'
      Visible = False
      Size = 0
    end
    object QryArcustodate1: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'date1'
      Visible = False
      Calculated = True
    end
    object QryArcustodate2: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'date2'
      Visible = False
      Calculated = True
    end
  end
end
