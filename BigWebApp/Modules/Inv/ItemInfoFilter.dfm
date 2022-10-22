object FrmItemInfoFilter: TFrmItemInfoFilter
  Left = 322
  Top = 162
  ClientHeight = 273
  ClientWidth = 383
  Caption = 'Filter'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel10: TUniPanel
    Left = 0
    Top = 0
    Width = 276
    Height = 273
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object gbGeneral: TUniGroupBox
      Left = 1
      Top = 1
      Width = 274
      Height = 116
      Hint = ''
      Caption = '  General  '
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object PnlClient01: TUniPanel
        Left = 2
        Top = 15
        Width = 270
        Height = 99
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 66
          Top = 1
          Width = 6
          Height = 97
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 65
          Height = 97
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 8
            Top = 4
            Width = 24
            Height = 13
            Hint = ''
            Caption = 'Type'
            TabOrder = 1
          end
          object Label4: TUniLabel
            Left = 8
            Top = 28
            Width = 33
            Height = 13
            Hint = ''
            Caption = 'Source'
            TabOrder = 2
          end
          object Label2: TUniLabel
            Left = 8
            Top = 52
            Width = 24
            Height = 13
            Hint = ''
            Caption = 'From'
            TabOrder = 3
          end
          object Label3: TUniLabel
            Left = 8
            Top = 76
            Width = 12
            Height = 13
            Hint = ''
            Caption = 'To'
            TabOrder = 4
          end
        end
        object PnlClient02: TUniPanel
          Left = 72
          Top = 1
          Width = 197
          Height = 97
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            197
            97)
          object cmbType: TUniComboBox
            Left = 0
            Top = 0
            Width = 209
            Height = 21
            Hint = ''
            Style = csDropDownList
            Text = ''
            Items.Strings = (
              'Any'
              'Purchased'
              'Manufactured')
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object cmbSource: TUniComboBox
            Left = 0
            Top = 24
            Width = 209
            Height = 21
            Hint = ''
            Style = csDropDownList
            Text = ''
            Items.Strings = (
              'Any'
              'Current'
              'Archived')
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object Date1: TUniDateTimePicker
            Left = 0
            Top = 48
            Width = 209
            Height = 21
            Hint = ''
            DateTime = 42689.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object Date2: TUniDateTimePicker
            Left = 0
            Top = 72
            Width = 209
            Height = 21
            Hint = ''
            DateTime = 42689.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
        end
      end
    end
    object gbPurchased: TUniGroupBox
      Left = 1
      Top = 117
      Width = 274
      Height = 91
      Hint = ''
      Caption = '  Purchased  '
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      object Panel5: TUniPanel
        Left = 2
        Top = 15
        Width = 270
        Height = 18
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        DesignSize = (
          270
          18)
        object chkOneVendor: TUniCheckBox
          Left = 8
          Top = 0
          Width = 266
          Height = 17
          Hint = ''
          Caption = 'Show one vendor'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object PnlClient03: TUniPanel
        Left = 2
        Top = 33
        Width = 270
        Height = 56
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitWidth = 272
        object Splitter2: TUniSplitter
          Left = 66
          Top = 1
          Width = 6
          Height = 54
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft02: TUniPanel
          Left = 1
          Top = 1
          Width = 65
          Height = 54
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label5: TUniLabel
            Left = 8
            Top = 4
            Width = 34
            Height = 13
            Hint = ''
            Caption = 'Vendor'
            TabOrder = 1
          end
          object Label6: TUniLabel
            Left = 8
            Top = 28
            Width = 48
            Height = 13
            Hint = 'Also applies to RMA and Vendor RMA'
            ShowHint = True
            ParentShowHint = False
            Caption = 'PO Status'
            TabOrder = 2
          end
        end
        object PnlClient04: TUniPanel
          Left = 72
          Top = 1
          Width = 197
          Height = 54
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            197
            54)
          object wwDBcombVendor: TUniDBLookupComboBox
            Left = 0
            Top = 0
            Width = 209
            Height = 21
            Hint = ''
            ListField = 'VENDORNO'
            ListSource = wwSrcVendor
            KeyField = 'COMPANY'
            ListFieldIndex = 0
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Color = clWindow
            OnDropDown = wwDBcombVendorDropDown
          end
          object cmbPoStatus: TUniComboBox
            Left = 0
            Top = 24
            Width = 209
            Height = 21
            Hint = ''
            Style = csDropDownList
            Text = ''
            Items.Strings = (
              'Any'
              'Open'
              'Closed')
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
      end
    end
    object gbManufactured: TUniGroupBox
      Left = 1
      Top = 208
      Width = 274
      Height = 67
      Hint = ''
      Caption = '  Manufactured  '
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      object Panel6: TUniPanel
        Left = 2
        Top = 15
        Width = 270
        Height = 18
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        DesignSize = (
          270
          18)
        object chkOneCustomer: TUniCheckBox
          Left = 8
          Top = 0
          Width = 267
          Height = 17
          Hint = ''
          Caption = 'Show one customer'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object PnlClient05: TUniPanel
        Left = 2
        Top = 33
        Width = 270
        Height = 32
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitWidth = 272
        object Splitter3: TUniSplitter
          Left = 66
          Top = 1
          Width = 6
          Height = 30
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft03: TUniPanel
          Left = 1
          Top = 1
          Width = 65
          Height = 30
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label8: TUniLabel
            Left = 8
            Top = 4
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Customer'
            TabOrder = 1
          end
        end
        object PnlClient06: TUniPanel
          Left = 72
          Top = 1
          Width = 197
          Height = 30
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            197
            30)
          object wwDBcombCustomer: TUniDBLookupComboBox
            Left = 0
            Top = 0
            Width = 209
            Height = 21
            Hint = ''
            ListField = 'CUSTNO'
            ListSource = wwSrcArcusto
            KeyField = 'COMPANY'
            ListFieldIndex = 0
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Color = clWindow
            OnDropDown = wwDBcombVendorDropDown
          end
        end
      end
    end
  end
  object Panel1: TUniPanel
    Left = 276
    Top = 0
    Width = 107
    Height = 273
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object btnOK: TUniButton
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnCancel: TUniButton
      Left = 8
      Top = 40
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      Cancel = True
      ModalResult = 2
      TabOrder = 2
    end
  end
  object wwSrcVendor: TDataSource
    DataSet = wwQryVendor
    Left = 272
    Top = 120
  end
  object wwQryVendor: TFDQuery
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(vendorno) as vendorno,'
      '       company,'
      '       id as vendor_id,'
      '       pk_hide'
      '  from vendor'
      ' order by vendorno'
      ' ')
    Left = 320
    Top = 112
    object wwQryVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Size = 10
    end
    object wwQryVendorCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 25
      FieldName = 'COMPANY'
      Size = 60
    end
    object wwQryVendorVENDOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object wwQryVendorPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object wwSrcArcusto: TDataSource
    DataSet = wwQryArcusto
    Left = 264
    Top = 168
  end
  object wwQryArcusto: TFDQuery
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(custno) as custno,'
      '       company,'
      '       id as arcusto_id,'
      '       pk_hide'
      'from arcusto'
      'order by custno'
      ' ')
    Left = 328
    Top = 160
    object wwQryArcustoCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Size = 10
    end
    object wwQryArcustoCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 25
      FieldName = 'COMPANY'
      Size = 60
    end
    object wwQryArcustoARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object wwQryArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
