object FrmPOExpectedReceiptsAdd: TFrmPOExpectedReceiptsAdd
  Left = 0
  Top = 0
  ClientHeight = 337
  ClientWidth = 648
  Caption = 'Create Expected PO Receipts'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 85
    Width = 648
    Height = 211
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object srchVendors: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 646
      Height = 209
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 429
      IQComponents.Grid.Height = 123
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcVendors
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
      IQComponents.HiddenPanel.Left = 429
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 123
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
          Title.Caption = 'Adderss 1'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR2'
          Title.Caption = 'Adderss 2'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR3'
          Title.Caption = 'Adderss 3'
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
          FieldName = 'ZIP'
          Title.Caption = 'Zip/Postal Code'
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
          FieldName = 'DIVISION_NAME'
          Title.Caption = 'Division Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_NAME'
          Title.Caption = 'EPlant Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 296
    Width = 648
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Left = 429
      Top = 1
      Width = 219
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 109
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object pnlHeader: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 648
    Height = 85
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    Color = clWindow
    object Splitter2: TUniSplitter
      Left = 425
      Top = 0
      Width = 6
      Height = 85
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object pnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 425
      Height = 83
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter3: TUniSplitter
        Left = 97
        Top = 0
        Width = 6
        Height = 83
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object pnlLeft02: TUniPanel
        Left = 1
        Top = 1
        Width = 97
        Height = 81
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label4: TUniLabel
          Left = 8
          Top = 9
          Width = 64
          Height = 13
          Hint = ''
          Caption = 'Receive Date'
          TabOrder = 1
        end
        object Label1: TUniLabel
          Left = 8
          Top = 33
          Width = 30
          Height = 13
          Hint = ''
          Caption = 'EPlant'
          TabOrder = 2
        end
        object lblDivision: TUniLabel
          Left = 8
          Top = 57
          Width = 36
          Height = 13
          Hint = ''
          Caption = 'Division'
          TabOrder = 3
        end
      end
      object Panel8: TUniPanel
        Left = 103
        Top = 1
        Width = 227
        Height = 81
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          227
          81)
        object wwDBDateTimePickRecvDate: TUniDBDateTimePicker
          Left = 1
          Top = 6
          Width = 225
          Height = 21
          Hint = ''
          DateTime = 42681.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object wwDBComboDlgEPlant: TUniEdit
          Left = 1
          Top = 30
          Width = 225
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
          OnKeyDown = wwDBComboDlgEPlantKeyDown
        end
        object wwDBComboDlgDivision: TUniEdit
          Left = 1
          Top = 54
          Width = 225
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ReadOnly = True
          OnKeyDown = wwDBComboDlgEPlantKeyDown
        end
      end
      object Panel1: TUniPanel
        Left = 330
        Top = 1
        Width = 95
        Height = 81
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        object sbtnApply: TUniSpeedButton
          Left = 1
          Top = 5
          Width = 87
          Height = 22
          Hint = 'Apply selected criteria'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666F6666666666000066666636666666666666666686F666666666
            0000666666306666666666666666886F66666666000066666663066666666666
            66666886F6666666000066666663B066666666666666F8F86F66666600006666
            63000F06666666666668888686F666660000666663FBFBF06666666666686F66
            686F666600006666663FB0333666666666668F688886666600006666663BFB06
            6666666666FF8FF686F66666000066630000BFB06666666668888866686F6666
            00006663FBFBFBFB06666666686F6666668F6666000066663FBFB03336666666
            668F666888866666000066663BFBFB06666666666686F66686F6666600006666
            63BFBFB0666666666668F666686F66660000666663FBFBFB0666666666686F66
            6686F66600006666663FBFBFB066666666668FFFFFF8FF660000666666333333
            3336666666668888888886660000666666666666666666666666666666666666
            0000}
          Caption = 'Apply'
          ParentColor = False
          Color = clWindow
          OnClick = sbtnApplyClick
        end
      end
    end
    object Panel9: TUniPanel
      Left = 431
      Top = 1
      Width = 217
      Height = 83
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object chkAutoAppend: TUniCheckBox
        Left = 8
        Top = 8
        Width = 130
        Height = 17
        Hint = ''
        Visible = False
        Caption = 'Auto Append Receipts'
        TabOrder = 0
      end
    end
  end
  object SrcVendors: TDataSource
    DataSet = QryVendors
    Left = 16
    Top = 148
  end
  object QryVendors: TFDQuery
    BeforeOpen = QryVendorsBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct'
      '       h.vendor_id as vendor_id, '
      '       v.vendorno, '
      '       v.company,'
      '       v.addr1,'
      '       v.addr2,'
      '       v.addr3,'
      '       v.city,'
      '       v.state,'
      '       v.zip,'
      '       v.country,'
      '       d.division_id,'
      '       d.eplant_id,'
      '       div.name as division_name,'
      '       e.name as eplant_name_short,'
      '       '#39'['#39' || d.eplant_id || '#39'] '#39' || e.name as eplant_name'
      ' '
      '  from PO h, '
      '       po_detail d, '
      '       po_releases r,'
      '       v_vendor v,'
      '       c_po_receipts_total p, '
      '       c_po_releases_total po_rel,'
      '       division div,'
      '       eplant e'
      ' where '
      '       -- link po_detail'
      '       h.id = d.po_id'
      '       -- link vendor'
      '   and h.vendor_id = v.id '
      '       -- lilnk composite tables'
      '   and d.id = p.po_detail_id(+) '
      '   and d.id = po_rel.po_detail_id(+) '
      '   '
      '       -- not closed with more room to receive'
      '   and nvl(d.closed, '#39'N'#39') <> '#39'Y'#39
      
        '   and greatest(0, NVL(po_rel.quan, 0) - NVL(p.qty_received, 0))' +
        ' > 0'
      '   '
      '       -- promise date criteria'
      '   and d.id = r.po_detail_id'
      '   and trunc(r.promise_date) <= :recv_date'
      ' '
      '       -- lookup tables'
      '   and d.division_id = div.id(+)'
      '   and d.eplant_id = e.id(+)'
      ''
      '       -- more criteria'
      '   and (nvl(:eplant_id,0) = 0'
      '        or '
      '        :eplant_id > 0 and d.eplant_id = :eplant_id )'
      ''
      '   and (nvl(:division_id,0) = 0'
      '        or '
      '        :division_id > 0 and d.division_id = :division_id )'
      '        '
      '')
    Left = 16
    Top = 176
    ParamData = <
      item
        Name = 'recv_date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'eplant_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'division_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryVendorsVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'v.VENDORNO'
      FixedChar = True
      Size = 10
    end
    object QryVendorsCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'COMPANY'
      Origin = 'v.COMPANY'
      Size = 60
    end
    object QryVendorsADDR1: TStringField
      DisplayLabel = 'Adderss 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'v.ADDR1'
      Size = 60
    end
    object QryVendorsADDR2: TStringField
      DisplayLabel = 'Adderss 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'v.ADDR2'
      Size = 60
    end
    object QryVendorsADDR3: TStringField
      DisplayLabel = 'Adderss 3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Origin = 'v.ADDR3'
      Size = 60
    end
    object QryVendorsCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CITY'
      Origin = 'v.city'
      FixedChar = True
      Size = 30
    end
    object QryVendorsSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 10
      FieldName = 'STATE'
      Origin = 'v.state'
    end
    object QryVendorsZIP: TStringField
      DisplayLabel = 'Zip/Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'v.zip'
      FixedChar = True
      Size = 10
    end
    object QryVendorsCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Origin = 'v.country'
      FixedChar = True
      Size = 100
    end
    object QryVendorsDIVISION_NAME: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 25
      FieldName = 'DIVISION_NAME'
      Origin = 'div.name'
      Size = 25
    end
    object QryVendorsEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant Name'
      DisplayWidth = 25
      FieldName = 'EPLANT_NAME'
      Origin = 'e.name'
      Size = 73
    end
    object QryVendorsVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'h.VENDOR_ID'
      Visible = False
      Size = 0
    end
    object QryVendorsDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object QryVendorsEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryVendorsEPLANT_NAME_SHORT: TStringField
      FieldName = 'EPLANT_NAME_SHORT'
      Visible = False
      Size = 30
    end
  end
  object PKEplant: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       name as name'
      '  from eplant'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 104
    Top = 140
    object PKEplantID: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'EPlant ID'
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
      Precision = 15
      Size = 0
    end
    object PKEplantNAME: TStringField
      DisplayLabel = 'Description'
      FieldName = 'NAME'
      Origin = 'IQ.EPLANT.NAME'
      Size = 30
    end
  end
  object PkDivision: TIQWebHpick
    BeforeOpen = PkDivisionBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id as id,'
      '       d.name as name,'
      '       d.eplant_id as eplant_id,'
      '       e.name as eplant_name'
      '  from division d,'
      '       eplant e'
      ' where d.eplant_id = e.id(+)'
      '   and ( (NVL(d.eplant_id, 0) = 0)'
      '         or'
      
        '         ((NVL(d.eplant_id, 0) <> 0) and  (NVL(d.eplant_id, 0) =' +
        ' :aEplantId))'
      '        )')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 138
    Top = 140
    ParamData = <
      item
        Name = 'AEPLANTID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkDivisionNAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'NAME'
      Size = 25
    end
    object PkDivisionEPLANT_NAME: TStringField
      DisplayLabel = 'Eplant Description'
      FieldName = 'EPLANT_NAME'
      Origin = 'EPLANT_NAME'
      Size = 30
    end
    object PkDivisionID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object PkDivisionEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
  end
end
