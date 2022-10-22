object FrmDNHistory: TFrmDNHistory
  Left = 231
  Top = 179
  ClientHeight = 331
  ClientWidth = 585
  Caption = 'Dunning Transaction History'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 585
    Height = 331
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 1
      Top = 165
      Width = 583
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object PnlArcusto: TUniPanel
      Left = 1
      Top = 1
      Width = 583
      Height = 164
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object PnlLetterCaption: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 581
        Height = 18
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object lblLetters: TUniLabel
          Left = 1
          Top = 1
          Width = 106
          Height = 13
          Hint = ''
          Caption = 'Customer Invoices'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object PnlArcustoDisplay: TUniPanel
        Left = 1
        Top = 19
        Width = 581
        Height = 144
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object GridHist: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 579
          Height = 142
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 362
          IQComponents.Grid.Height = 56
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcHist
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
          IQComponents.Navigator.DataSource = SrcHist
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 362
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 56
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcHist
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
              FieldName = 'DESCRIP'
              Title.Caption = 'Dunning Group'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACTUAL_SEQ'
              Title.Caption = 'Last Dunning Level'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CUSTNO'
              Title.Caption = 'Customer #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BILL_TO_ATTN'
              Title.Caption = 'Company'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BILL_TO_CONTACT'
              Title.Caption = 'Contact'
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
              FieldName = 'BILL_TO_ZIP'
              Title.Caption = 'Postal Code'
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
              FieldName = 'CREATED'
              Title.Caption = 'Created'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CREATED_BY'
              Title.Caption = 'Created By'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          Marker = 0
        end
      end
    end
    object PnlDetail: TUniPanel
      Left = 1
      Top = 168
      Width = 583
      Height = 162
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object PnlHistDtl: TUniPanel
        Left = 1
        Top = 1
        Width = 581
        Height = 160
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Panel4: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 579
          Height = 18
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object Label2: TUniLabel
            Left = 1
            Top = 1
            Width = 73
            Height = 13
            Hint = ''
            Caption = 'Transactions'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object Panel2: TUniPanel
          Left = 1
          Top = 19
          Width = 579
          Height = 140
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object GridHistDtl: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 577
            Height = 138
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 360
            IQComponents.Grid.Height = 52
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcHistDtl
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
            IQComponents.Navigator.DataSource = SrcHistDtl
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 360
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 52
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcHistDtl
            Columns = <
              item
                FieldName = 'DUNNING_SEQ'
                Title.Caption = 'Dunning Level'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DUNNING_RPT'
                Title.Caption = 'Report File Name'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'SENT_DATE'
                Title.Caption = 'Date Sent'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'SENT_BY'
                Title.Caption = 'Sent By'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            TabsVisible = True
            Marker = 0
          end
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 72
    Top = 80
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
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
  object SrcHist: TDataSource
    DataSet = QryHist
    Left = 256
    Top = 80
  end
  object SrcHistDtl: TDataSource
    DataSet = QryHistDtl
    Left = 304
    Top = 80
  end
  object QryHistDtl: TFDQuery
    MasterSource = SrcHist
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select * from dunning_hist_detail'
      'where dunning_hist_id = :id')
    Left = 320
    Top = 88
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 1900000c
      end>
    object QryHistDtlDUNNING_SEQ: TBCDField
      DisplayLabel = 'Dunning Level'
      DisplayWidth = 16
      FieldName = 'DUNNING_SEQ'
      Origin = 'DUNNING_HIST_DETAIL.DUNNING_SEQ'
      ReadOnly = True
      Size = 0
    end
    object QryHistDtlDUNNING_RPT: TStringField
      DisplayLabel = 'Report File Name'
      DisplayWidth = 25
      FieldName = 'DUNNING_RPT'
      Origin = 'DUNNING_HIST_DETAIL.DUNNING_RPT'
      ReadOnly = True
      Size = 250
    end
    object QryHistDtlSENT_DATE: TDateTimeField
      DisplayLabel = 'Date Sent'
      DisplayWidth = 21
      FieldName = 'SENT_DATE'
      Origin = 'DUNNING_HIST_DETAIL.SENT_DATE'
      ReadOnly = True
    end
    object QryHistDtlSENT_BY: TStringField
      DisplayLabel = 'Sent By'
      DisplayWidth = 22
      FieldName = 'SENT_BY'
      Origin = 'DUNNING_HIST_DETAIL.SENT_BY'
      ReadOnly = True
      Size = 30
    end
    object QryHistDtlID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'DUNNING_HIST_DETAIL.ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryHistDtlDUNNING_HIST_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DUNNING_HIST_ID'
      Origin = 'DUNNING_HIST_DETAIL.DUNNING_HIST_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryHistDtlDUNNING_LETTER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DUNNING_LETTER_ID'
      Origin = 'DUNNING_HIST_DETAIL.DUNNING_LETTER_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
  end
  object QryHist: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '    dunning_hist.id,'
      '    dunning_hist.arcusto_id,'
      '    dunning_hist.arinvoice_id,'
      '    dunning_hist.dunning_group_id,'
      '    dunning_hist.descrip,'
      '    dunning_hist.actual_seq,'
      '    dunning_hist.custno,'
      '    dunning_hist.company,'
      '    dunning_hist.arcusto_addr1,'
      '    dunning_hist.arcusto_addr2,'
      '    dunning_hist.arcusto_addr3,'
      '    dunning_hist.arcusto_city,'
      '    dunning_hist.arcusto_state,'
      '    dunning_hist.arcusto_zip,'
      '    dunning_hist.arcusto_country,'
      '    dunning_hist.use_usa_mask,'
      '    dunning_hist.bill_to_attn,'
      '    dunning_hist.bill_to_contact,'
      '    dunning_hist.bill_to_addr1,'
      '    dunning_hist.bill_to_addr2,'
      '    dunning_hist.bill_to_addr3,'
      '    dunning_hist.bill_to_city,'
      '    dunning_hist.bill_to_state,'
      '    dunning_hist.bill_to_zip,'
      '    dunning_hist.bill_to_country,'
      '    dunning_hist.invoice_no,'
      '    dunning_hist.invoice_date,'
      '    dunning_hist.created,'
      '    dunning_hist.created_by,'
      '    dunning_hist.changed,'
      '    dunning_hist.changed_by   '
      'from dunning_hist'
      ''
      ' ')
    Left = 264
    Top = 88
    object QryHistINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      DisplayWidth = 18
      FieldName = 'INVOICE_NO'
      Origin = 'dunning_hist.INVOICE_NO'
      ReadOnly = True
      Size = 25
    end
    object QryHistINVOICE_DATE: TDateTimeField
      DisplayLabel = 'Invoice Date'
      DisplayWidth = 18
      FieldName = 'INVOICE_DATE'
      Origin = 'dunning_hist.INVOICE_DATE'
      ReadOnly = True
    end
    object QryHistDESCRIP: TStringField
      DisplayLabel = 'Dunning Group'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'DUNNING_HIST.DESCRIP'
      ReadOnly = True
      Size = 250
    end
    object QryHistACTUAL_SEQ: TBCDField
      DisplayLabel = 'Last Dunning Level'
      DisplayWidth = 17
      FieldName = 'ACTUAL_SEQ'
      Origin = 'IQ.DUNNING_HIST.ACTUAL_SEQ'
      Size = 0
    end
    object QryHistCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'DUNNING_HIST.CUSTNO'
      ReadOnly = True
      Size = 10
    end
    object QryHistBILL_TO_ATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 25
      FieldName = 'BILL_TO_ATTN'
      Origin = 'DUNNING_HIST.BILL_TO_ATTN'
      ReadOnly = True
      Size = 60
    end
    object QryHistBILL_TO_CONTACT: TStringField
      DisplayLabel = 'Contact'
      DisplayWidth = 30
      FieldName = 'BILL_TO_CONTACT'
      Origin = 'DUNNING_HIST.BILL_TO_CONTACT'
      ReadOnly = True
      Size = 30
    end
    object QryHistBILL_TO_ADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'BILL_TO_ADDR1'
      Origin = 'DUNNING_HIST.BILL_TO_ADDR1'
      ReadOnly = True
      Size = 60
    end
    object QryHistBILL_TO_ADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'BILL_TO_ADDR2'
      Origin = 'DUNNING_HIST.BILL_TO_ADDR2'
      ReadOnly = True
      Size = 60
    end
    object QryHistBILL_TO_ADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 20
      FieldName = 'BILL_TO_ADDR3'
      Origin = 'DUNNING_HIST.BILL_TO_ADDR3'
      ReadOnly = True
      Size = 60
    end
    object QryHistBILL_TO_CITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 12
      FieldName = 'BILL_TO_CITY'
      Origin = 'DUNNING_HIST.BILL_TO_CITY'
      ReadOnly = True
      Size = 30
    end
    object QryHistBILL_TO_STATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 12
      FieldName = 'BILL_TO_STATE'
      Origin = 'DUNNING_HIST.BILL_TO_STATE'
      ReadOnly = True
    end
    object QryHistBILL_TO_ZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'BILL_TO_ZIP'
      Origin = 'DUNNING_HIST.BILL_TO_ZIP'
      ReadOnly = True
      Size = 10
    end
    object QryHistBILL_TO_COUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 20
      FieldName = 'BILL_TO_COUNTRY'
      Origin = 'DUNNING_HIST.BILL_TO_COUNTRY'
      ReadOnly = True
      Size = 100
    end
    object QryHistCREATED: TDateTimeField
      DisplayLabel = 'Created'
      DisplayWidth = 18
      FieldName = 'CREATED'
      Origin = 'DUNNING_HIST.CREATED'
      ReadOnly = True
    end
    object QryHistCREATED_BY: TStringField
      DisplayLabel = 'Created By'
      DisplayWidth = 20
      FieldName = 'CREATED_BY'
      Origin = 'DUNNING_HIST.CREATED_BY'
      ReadOnly = True
      Size = 30
    end
    object QryHistCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 60
      FieldName = 'COMPANY'
      Origin = 'DUNNING_HIST.COMPANY'
      ReadOnly = True
      Visible = False
      Size = 60
    end
    object QryHistID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'DUNNING_HIST.ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryHistARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'DUNNING_HIST.ARCUSTO_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryHistARINVOICE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVOICE_ID'
      Origin = 'DUNNING_HIST.ARINVOICE_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryHistDUNNING_GROUP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DUNNING_GROUP_ID'
      Origin = 'DUNNING_HIST.DUNNING_GROUP_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryHistARCUSTO_ADDR1: TStringField
      DisplayWidth = 60
      FieldName = 'ARCUSTO_ADDR1'
      Origin = 'DUNNING_HIST.ARCUSTO_ADDR1'
      ReadOnly = True
      Visible = False
      Size = 60
    end
    object QryHistARCUSTO_ADDR2: TStringField
      DisplayWidth = 60
      FieldName = 'ARCUSTO_ADDR2'
      Origin = 'DUNNING_HIST.ARCUSTO_ADDR2'
      ReadOnly = True
      Visible = False
      Size = 60
    end
    object QryHistARCUSTO_ADDR3: TStringField
      DisplayWidth = 60
      FieldName = 'ARCUSTO_ADDR3'
      Origin = 'DUNNING_HIST.ARCUSTO_ADDR3'
      ReadOnly = True
      Visible = False
      Size = 60
    end
    object QryHistARCUSTO_CITY: TStringField
      DisplayWidth = 30
      FieldName = 'ARCUSTO_CITY'
      Origin = 'DUNNING_HIST.ARCUSTO_CITY'
      ReadOnly = True
      Visible = False
      Size = 30
    end
    object QryHistARCUSTO_STATE: TStringField
      DisplayWidth = 5
      FieldName = 'ARCUSTO_STATE'
      Origin = 'DUNNING_HIST.ARCUSTO_STATE'
      ReadOnly = True
      Visible = False
    end
    object QryHistARCUSTO_ZIP: TStringField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ZIP'
      Origin = 'DUNNING_HIST.ARCUSTO_ZIP'
      ReadOnly = True
      Visible = False
      Size = 10
    end
    object QryHistARCUSTO_COUNTRY: TStringField
      DisplayWidth = 30
      FieldName = 'ARCUSTO_COUNTRY'
      Origin = 'DUNNING_HIST.ARCUSTO_COUNTRY'
      ReadOnly = True
      Visible = False
      Size = 100
    end
    object QryHistUSE_USA_MASK: TStringField
      DisplayWidth = 1
      FieldName = 'USE_USA_MASK'
      Origin = 'DUNNING_HIST.USE_USA_MASK'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryHistCHANGED: TDateTimeField
      DisplayLabel = 'Changed'
      DisplayWidth = 18
      FieldName = 'CHANGED'
      Origin = 'DUNNING_HIST.CHANGED'
      ReadOnly = True
      Visible = False
    end
    object QryHistCHANGED_BY: TStringField
      DisplayLabel = 'Changed By'
      DisplayWidth = 20
      FieldName = 'CHANGED_BY'
      Origin = 'DUNNING_HIST.CHANGED_BY'
      ReadOnly = True
      Visible = False
      Size = 30
    end
  end
  object PHist: TUniPopupMenu
    Left = 100
    Top = 80
    object JumptoInvoice1: TUniMenuItem
      Caption = 'Jump to Invoice'
      OnClick = JumptoInvoice1Click
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Dunning History'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196885 $'
    BuildVersion = '176554'
    Left = 128
    Top = 80
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FRMDNHISTORY'
    WebUse = False
    TouchScreen = False
    Left = 156
    Top = 80
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 184
    Top = 80
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmDNHistory')
    SecurityCode = 'FRMDNHISTORY'
    Left = 213
    Top = 80
  end
end
