object FrmForeParams: TFrmForeParams
  Left = 226
  Top = 134
  HelpContext = 1000096
  ClientHeight = 428
  ClientWidth = 346
  Caption = 'Forecast Parameters'
  OnShow = FormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 8
    Top = 3
    Width = 331
    Height = 382
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    TabOrder = 0
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'General'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object dbGroupBoxGenerateForecast: TUniDBRadioGroup
        AlignWithMargins = True
        Left = 3
        Top = 63
        Width = 317
        Height = 86
        Hint = 
          'Generate forecast based on past shipments, orders or forecast. '#13 +
          'Default is sales orders.'
        DataField = 'FR_GEN_BY_SHIPMENTS'
        DataSource = DataSource1
        Caption = '  Generate Forecast Based On  '
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Items.Strings = (
          'Orders'
          'Shipments'
          'Forecast')
      end
      object GroupBoxConsume: TUniGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 155
        Width = 317
        Height = 109
        Hint = ''
        Caption = '  Consume Forecast  '
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        object Panel1: TUniPanel
          Left = 2
          Top = 15
          Width = 313
          Height = 43
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object Label3: TUniLabel
            Left = 9
            Top = 4
            Width = 55
            Height = 13
            Hint = ''
            Caption = 'Time Frame'
            TabOrder = 3
          end
          object rbtnWeekly: TUniRadioButton
            Left = 82
            Top = 2
            Width = 113
            Height = 17
            Hint = ''
            Caption = 'Weekly'
            TabOrder = 0
          end
          object rbtnMonthly: TUniRadioButton
            Left = 82
            Top = 23
            Width = 113
            Height = 17
            Hint = ''
            Caption = 'Monthly'
            TabOrder = 1
          end
        end
        object Panel2: TUniPanel
          Left = 2
          Top = 43
          Width = 313
          Height = 66
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Label4: TUniLabel
            Left = 9
            Top = 4
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Based On'
            TabOrder = 3
          end
          object rbtnPromiseDate: TUniRadioButton
            Left = 82
            Top = 2
            Width = 113
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Promise Date'
            TabOrder = 0
          end
          object rbtnMustShipDate: TUniRadioButton
            Left = 82
            Top = 23
            Width = 113
            Height = 17
            Hint = ''
            Caption = 'Must Ship Date'
            TabOrder = 1
          end
        end
      end
      object GroupBoxWO: TUniGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 317
        Height = 54
        Hint = ''
        Caption = '  Work Orders  '
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        object DBCheckBox1: TUniDBCheckBox
          Left = 9
          Top = 19
          Width = 126
          Height = 17
          Hint = ''
          DataField = 'FR_GENERATE_WO'
          DataSource = DataSource1
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Generate work orders'
          TabOrder = 0
        end
      end
      object GroupBox1: TUniGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 270
        Width = 317
        Height = 77
        Hint = ''
        Caption = '  Other  '
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        object Label1: TUniLabel
          Left = 9
          Top = 23
          Width = 75
          Height = 13
          Hint = ''
          Caption = 'WO Time Fence'
          TabOrder = 3
        end
        object DBEdit1: TUniDBEdit
          Left = 126
          Top = 20
          Width = 41
          Height = 21
          Hint = 'Generated  Work Order Time Fence in days'
          ShowHint = True
          ParentShowHint = False
          DataField = 'FR_WO_TIME_FENCE'
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBCheckBox4: TUniDBCheckBox
          Left = 9
          Top = 47
          Width = 152
          Height = 17
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataField = 'FR_SHOW_TOTAL'
          DataSource = DataSource1
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Show Forecast Totals'
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Import'
      object DBCheckBox2: TUniDBCheckBox
        Left = 7
        Top = 4
        Width = 194
        Height = 17
        Hint = ''
        DataField = 'FR_IMPORT_EXCEL_PRICE'
        DataSource = DataSource1
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Import Pricing from Excel Forecast'
        TabOrder = 0
      end
      object DBCheckBox3: TUniDBCheckBox
        Left = 7
        Top = 28
        Width = 158
        Height = 17
        Hint = ''
        DataField = 'FR_IMP_LOG_MESG'
        DataSource = DataSource1
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Log and Suppress Messages'
        TabOrder = 1
      end
    end
  end
  object btnOK: TUniButton
    Left = 128
    Top = 394
    Width = 97
    Height = 25
    Hint = ''
    Caption = '&OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 238
    Top = 394
    Width = 97
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 254
    Top = 37
  end
  object Table1: TFDTable
    BeforePost = Table1BeforePost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 253
    Top = 59
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'Table1'
      'btnOK')
    SecurityCode = 'FRMFOREPARAMS'
    Left = 297
    Top = 39
  end
end
