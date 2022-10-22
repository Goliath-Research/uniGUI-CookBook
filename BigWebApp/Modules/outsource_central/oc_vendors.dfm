object FrmOutsourceVendors: TFrmOutsourceVendors
  Left = 123
  Top = 315
  ClientHeight = 336
  ClientWidth = 427
  Caption = 'Outsource Vendors'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 427
    Height = 336
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 1
      Top = 167
      Width = 425
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 425
      Height = 166
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object IQSearch1: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 423
        Height = 164
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 206
        IQComponents.Grid.Height = 78
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
        IQComponents.HiddenPanel.Left = 206
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 78
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
            FieldName = 'CUSTNO'
            Title.Caption = 'Vendor #'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMPANY'
            Title.Caption = 'Company'
            Width = 175
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ADDR1'
            Title.Caption = 'Address 1'
            Width = 133
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ADDR2'
            Title.Caption = 'Address 2'
            Width = 133
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ADDR3'
            Title.Caption = 'Address 3'
            Width = 133
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CITY'
            Title.Caption = 'City'
            Width = 91
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'STATE'
            Title.Caption = 'State/Province'
            Width = 98
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COUNTRY'
            Title.Caption = 'Country'
            Width = 63
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ZIP'
            Title.Caption = 'Zip/Postal Code'
            Width = 98
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PHONE_NUMBER'
            Title.Caption = 'Phone'
            Width = 119
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PRIME_CONTACT'
            Title.Caption = 'Primary Contact'
            Width = 133
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
    object wwDataInspector1: TwwDataInspector
      Left = 1
      Top = 198
      Width = 425
      Height = 137
      DisableThemes = False
      Align = alClient
      TabOrder = 1
      DataSource = SrcShipTo
      Items = <
        item
          DataSource = SrcShipTo
          DataField = 'ATTN'
          Caption = 'Company'
          WordWrap = False
        end
        item
          DataSource = SrcShipTo
          DataField = 'ADDR1'
          Caption = 'Address 1'
          Items = <
            item
              DataSource = SrcShipTo
              DataField = 'ADDR2'
              Caption = 'Address 2'
              WordWrap = False
            end
            item
              DataSource = SrcShipTo
              DataField = 'ADDR3'
              Caption = 'Address 3'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcShipTo
          DataField = 'CITY'
          Caption = 'City'
          WordWrap = False
        end
        item
          DataSource = SrcShipTo
          DataField = 'STATE'
          Caption = 'State/Province'
          WordWrap = False
        end
        item
          DataSource = SrcShipTo
          DataField = 'COUNTRY'
          Caption = 'Country'
          WordWrap = False
        end
        item
          DataSource = SrcShipTo
          DataField = 'ZIP'
          Caption = 'Zip/Postal Code'
          WordWrap = False
        end
        item
          DataSource = SrcShipTo
          DataField = 'SHIP_TIME'
          Caption = 'Ship Days'
          WordWrap = False
        end
        item
          DataSource = SrcShipTo
          DataField = 'PHONE_NUMBER'
          Caption = 'Phone'
          WordWrap = False
        end
        item
          DataSource = SrcShipTo
          DataField = 'FAX'
          Caption = 'Fax'
          WordWrap = False
        end
        item
          DataSource = SrcShipTo
          DataField = 'PRIME_CONTACT'
          Caption = 'Primary Contact'
          WordWrap = False
        end>
      DefaultRowHeight = 18
      CaptionWidth = 100
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 170
      Width = 425
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = ' Ship-To Address'
      object NavShipTo: TUniDBNavigator
        Left = 344
        Top = 1
        Width = 80
        Height = 26
        Hint = ''
        DataSource = SrcShipTo
        VisibleButtons = [nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
  end
  object SrcVendors: TDataSource
    DataSet = QryVendors
    Left = 24
    Top = 76
  end
  object QryVendors: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.custno,'
      '       a.company,'
      '       a.addr1,'
      '       a.addr2,'
      '       a.addr3,'
      '       a.city, '
      '       a.state,'
      '       a.country,'
      '       a.zip,'
      '       a.phone_number,'
      '       a.prime_contact,'
      '       a.id'
      '  from arcusto a,'
      '      v_vendor v'
      ' where a.vendor_id_outsource is not NULL'
      '   and a.vendor_id_outsource = v.id'
      ' '
      '')
    Left = 24
    Top = 125
    object QryVendorsCUSTNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'A.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryVendorsCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 25
      FieldName = 'COMPANY'
      Origin = 'A.COMPANY'
      Size = 60
    end
    object QryVendorsADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 19
      FieldName = 'ADDR1'
      Origin = 'A.ADDR1'
      Size = 60
    end
    object QryVendorsADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 19
      FieldName = 'ADDR2'
      Origin = 'A.ADDR2'
      Size = 60
    end
    object QryVendorsADDR3: TStringField
      DisplayLabel = 'Address 3 '
      DisplayWidth = 19
      FieldName = 'ADDR3'
      Origin = 'A.ADDR3'
      Size = 60
    end
    object QryVendorsCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 13
      FieldName = 'CITY'
      Origin = 'A.CITY'
      FixedChar = True
      Size = 30
    end
    object QryVendorsSTATE: TStringField
      DisplayLabel = 'State/Province'
      DisplayWidth = 14
      FieldName = 'STATE'
      Origin = 'A.STATE'
    end
    object QryVendorsCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 9
      FieldName = 'COUNTRY'
      Origin = 'A.COUNTRY'
      FixedChar = True
      Size = 30
    end
    object QryVendorsZIP: TStringField
      DisplayLabel = 'Zip/Postal Code'
      DisplayWidth = 14
      FieldName = 'ZIP'
      Origin = 'A.ZIP'
      FixedChar = True
      Size = 10
    end
    object QryVendorsPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      DisplayWidth = 17
      FieldName = 'PHONE_NUMBER'
      Origin = 'A.PHONE_NUMBER'
      Size = 25
    end
    object QryVendorsPRIME_CONTACT: TStringField
      DisplayLabel = 'Primary Contact'
      DisplayWidth = 19
      FieldName = 'PRIME_CONTACT'
      Origin = 'A.PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object QryVendorsID: TBCDField
      FieldName = 'ID'
      Origin = 'ARCUSTO.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcShipTo: TDataSource
    DataSet = TblShipTo
    Left = 107
    Top = 77
  end
  object TblShipTo: TFDTable
    BeforeInsert = TblShipToBeforeInsert
    IndexFieldNames = 'ARCUSTO_ID'
    MasterSource = SrcVendors
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SHIP_TO'
    TableName = 'SHIP_TO'
    Left = 107
    Top = 125
    object TblShipToID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblShipToARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Required = True
      Size = 0
    end
    object TblShipToATTN: TStringField
      DisplayLabel = 'Company'
      FieldName = 'ATTN'
      Size = 60
    end
    object TblShipToADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object TblShipToADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object TblShipToADDR3: TStringField
      DisplayLabel = 'Address 3'
      FieldName = 'ADDR3'
      Size = 60
    end
    object TblShipToCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object TblShipToSTATE: TStringField
      DisplayLabel = 'State/Province'
      FieldName = 'STATE'
    end
    object TblShipToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 100
    end
    object TblShipToZIP: TStringField
      DisplayLabel = 'Zip/Postal Code'
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object TblShipToSHIP_TIME: TBCDField
      DisplayLabel = 'Ship Days'
      FieldName = 'SHIP_TIME'
      Size = 3
    end
    object TblShipToPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object TblShipToFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Size = 25
    end
    object TblShipToPRIME_CONTACT: TStringField
      DisplayLabel = 'Primary Contact'
      FieldName = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
  end
end
