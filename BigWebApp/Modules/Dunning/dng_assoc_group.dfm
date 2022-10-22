object FrmDNAssocGroup: TFrmDNAssocGroup
  Left = 317
  Top = 254
  ClientHeight = 238
  ClientWidth = 527
  Caption = 'Associated'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 5
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 5
    Width = 527
    Height = 233
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 525
      Height = 231
      Hint = ''
      ActivePage = TabInvoices
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabCustomers: TUniTabSheet
        Hint = ''
        Caption = 'Customers'
        object GridArcusto: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 517
          Height = 203
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 300
          IQComponents.Grid.Height = 117
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
          IQComponents.HiddenPanel.Left = 300
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 117
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
              Title.Caption = 'State or Region'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ZIP'
              Title.Caption = 'Postal Code'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          Marker = 0
        end
      end
      object TabInvoices: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Invoices'
        object GridInvoices: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 517
          Height = 203
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 300
          IQComponents.Grid.Height = 117
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcArInvoice
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
          IQComponents.Navigator.DataSource = SrcArInvoice
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 300
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 117
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcArInvoice
          Columns = <
            item
              FieldName = 'INVOICE_NO'
              Title.Caption = 'Invoice #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'INVOICE_DATE'
              Title.Caption = 'Invoice Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DUE_DATE'
              Title.Caption = 'Due Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BILL_TO_ATTN'
              Title.Caption = 'Attention'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BILL_TO_ADDR1'
              Title.Caption = 'Address 1'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BILL_TO_ADDR2'
              Title.Caption = 'Address 2'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BILL_TO_ADDR3'
              Title.Caption = 'Address 3'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BILL_TO_CITY'
              Title.Caption = 'City'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BILL_TO_STATE'
              Title.Caption = 'State or Region'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BILL_TO_COUNTRY'
              Title.Caption = 'Country'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BILL_TO_ZIP'
              Title.Caption = 'Postal Code'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DUNNING_SEQ'
              Title.Caption = 'Last Letter #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DUNNING_EXCLUDE'
              Title.Caption = 'Exclude Invoice?'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'TERMS_DESCRIP'
              Title.Caption = 'Terms'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'TERMS_DAYS'
              Title.Caption = 'Terms Days'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          Marker = 0
        end
      end
    end
  end
  object SrcArcusto: TDataSource
    DataSet = QryArcusto
    Left = 196
    Top = 72
  end
  object QryArcusto: TFDQuery
    BeforeOpen = DoBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '     id,'
      '     custno,'
      '     company,'
      '     addr1,'
      '     addr2,'
      '     addr3,'
      '     city,'
      '     state,'
      '     zip'
      'from arcusto'
      'where'
      '     NVL( pk_hide, '#39'N'#39' ) <> '#39'Y'#39
      '     and NVL( dunning_exclude, '#39'N'#39' ) <> '#39'Y'#39
      '     and dunning_group_id = :id'
      '')
    Left = 200
    Top = 80
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArcustoCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryArcustoCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
    object QryArcustoADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Origin = 'ARCUSTO.ADDR1'
      Size = 60
    end
    object QryArcustoADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 'ARCUSTO.ADDR2'
      Size = 60
    end
    object QryArcustoADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Origin = 'ARCUSTO.ADDR3'
      Size = 60
    end
    object QryArcustoCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 20
      FieldName = 'CITY'
      Origin = 'ARCUSTO.CITY'
      FixedChar = True
      Size = 30
    end
    object QryArcustoSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 12
      FieldName = 'STATE'
      Origin = 'ARCUSTO.STATE'
      FixedChar = True
    end
    object QryArcustoZIP: TStringField
      DisplayLabel = 'Postal Code'
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
  end
  object SrcArInvoice: TDataSource
    DataSet = QryInvoices
    Left = 268
    Top = 72
  end
  object QryInvoices: TFDQuery
    BeforeOpen = DoBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '     arinvoice.id,'
      '     arinvoice.arcusto_id,'
      '     arinvoice.invoice_no,'
      '     arinvoice.invoice_date,'
      '     arinvoice.due_date,'
      '     arinvoice.bill_to_attn,'
      '     arinvoice.bill_to_addr1,'
      '     arinvoice.bill_to_addr2,'
      '     arinvoice.bill_to_addr3,'
      '     arinvoice.bill_to_city,'
      '     arinvoice.bill_to_state,'
      '     arinvoice.bill_to_country,'
      '     arinvoice.bill_to_zip,'
      '     arinvoice.dunning_seq,'
      '     arinvoice.dunning_exclude,'
      '     arinvoice.eplant_id,'
      '     arinvoice.terms_descrip,'
      '     arinvoice.terms_days'
      'from arinvoice, arcusto'
      'where'
      '     NVL( arinvoice.dunning_exclude, '#39'N'#39' ) <> '#39'Y'#39
      '     and arcusto.id = arinvoice.arcusto_id'
      '     and arcusto.dunning_group_id = :id'
      '     and misc.eplant_filter(arinvoice.eplant_id) = 1'
      ' '
      ' ')
    Left = 280
    Top = 80
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryInvoicesINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      DisplayWidth = 25
      FieldName = 'INVOICE_NO'
      Origin = 'ARINVOICE.INVOICE_NO'
      Size = 25
    end
    object QryInvoicesINVOICE_DATE: TDateTimeField
      DisplayLabel = 'Invoice Date'
      DisplayWidth = 18
      FieldName = 'INVOICE_DATE'
      Origin = 'ARINVOICE.INVOICE_DATE'
    end
    object QryInvoicesDUE_DATE: TDateTimeField
      DisplayLabel = 'Due Date'
      DisplayWidth = 18
      FieldName = 'DUE_DATE'
      Origin = 'ARINVOICE.DUE_DATE'
    end
    object QryInvoicesBILL_TO_ATTN: TStringField
      DisplayLabel = 'Attention'
      DisplayWidth = 60
      FieldName = 'BILL_TO_ATTN'
      Origin = 'ARINVOICE.BILL_TO_ATTN'
      Size = 60
    end
    object QryInvoicesBILL_TO_ADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'BILL_TO_ADDR1'
      Origin = 'ARINVOICE.BILL_TO_ADDR1'
      Size = 60
    end
    object QryInvoicesBILL_TO_ADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'BILL_TO_ADDR2'
      Origin = 'ARINVOICE.BILL_TO_ADDR2'
      Size = 60
    end
    object QryInvoicesBILL_TO_ADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'BILL_TO_ADDR3'
      Origin = 'ARINVOICE.BILL_TO_ADDR3'
      Size = 60
    end
    object QryInvoicesBILL_TO_CITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 20
      FieldName = 'BILL_TO_CITY'
      Origin = 'ARINVOICE.BILL_TO_CITY'
      FixedChar = True
      Size = 30
    end
    object QryInvoicesBILL_TO_STATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 10
      FieldName = 'BILL_TO_STATE'
      Origin = 'ARINVOICE.BILL_TO_STATE'
      FixedChar = True
    end
    object QryInvoicesBILL_TO_COUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 20
      FieldName = 'BILL_TO_COUNTRY'
      Origin = 'ARINVOICE.BILL_TO_COUNTRY'
      FixedChar = True
      Size = 100
    end
    object QryInvoicesBILL_TO_ZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'BILL_TO_ZIP'
      Origin = 'ARINVOICE.BILL_TO_ZIP'
      FixedChar = True
      Size = 10
    end
    object QryInvoicesDUNNING_SEQ: TBCDField
      DisplayLabel = 'Last Letter #'
      DisplayWidth = 10
      FieldName = 'DUNNING_SEQ'
      Origin = 'ARINVOICE.DUNNING_SEQ'
      Size = 0
    end
    object QryInvoicesDUNNING_EXCLUDE: TStringField
      DisplayLabel = 'Exclude Invoice?'
      DisplayWidth = 1
      FieldName = 'DUNNING_EXCLUDE'
      Origin = 'ARINVOICE.DUNNING_EXCLUDE'
      FixedChar = True
      Size = 1
    end
    object QryInvoicesTERMS_DESCRIP: TStringField
      DisplayLabel = 'Terms'
      DisplayWidth = 20
      FieldName = 'TERMS_DESCRIP'
      Origin = 'ARINVOICE.TERMS_DESCRIP'
      FixedChar = True
      Size = 60
    end
    object QryInvoicesTERMS_DAYS: TBCDField
      DisplayLabel = 'Terms Days'
      DisplayWidth = 10
      FieldName = 'TERMS_DAYS'
      Origin = 'ARINVOICE.TERMS_DAYS'
      Size = 0
    end
    object QryInvoicesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ARINVOICE.ID'
      Visible = False
      Size = 0
    end
    object QryInvoicesARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARINVOICE.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryInvoicesEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'ARINVOICE.EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 172
    Top = 176
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
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
    ModuleName = 'Associated Dunning Group'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196871 $'
    BuildVersion = '176554'
    Left = 204
    Top = 176
  end
  object PArcusto: TUniPopupMenu
    OnPopup = PArcustoPopup
    Left = 332
    Top = 133
    object JumpToCustomerMaintenance1: TUniMenuItem
      Caption = 'Jump to Customer Maintenance'
      OnClick = JumpToCustomerMaintenance1Click
    end
  end
  object PInvoice: TUniPopupMenu
    OnPopup = PInvoicePopup
    Left = 364
    Top = 133
    object JumpToInvoice1: TUniMenuItem
      Caption = 'Jump to Invoice'
      OnClick = JumpToInvoice1Click
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmDNAssocGroup')
    SecurityItems.Strings = (
      'JumptoCustomerMaintenance1'
      'JumpToInvoice1')
    SecurityCode = 'ASSOCIATED DUNNING GROUP'
    Left = 356
    Top = 85
  end
end
