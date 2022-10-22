object FrmProdParams: TFrmProdParams
  Left = 156
  Top = 187
  HelpContext = 1063712
  ClientHeight = 331
  ClientWidth = 584
  Caption = 'Production Report Parameters'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  ActiveControl = wwDBSpinEdit1
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 283
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 303
    object PageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 582
      Height = 281
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ActivePage = TabSheet1
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TUniTabSheet
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabVisible = False
        Caption = 'General'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 283
        object Bevel1: TUniPanel
          Left = 0
          Top = 105
          Width = 574
          Height = 3
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
        object GroupBox2: TUniGroupBox
          Left = 0
          Top = 108
          Width = 574
          Height = 108
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '  Floor Disposition Control  '
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          object DBCheckBox1: TUniDBCheckBox
            Left = 20
            Top = 21
            Width = 257
            Height = 21
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'DO_NOT_DISPO_FLOOR_PARTIAL'
            DataSource = wwDataSource1
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Do not disposition partials'
            TabOrder = 0
          end
          object DBCheckBox2: TUniDBCheckBox
            Left = 20
            Top = 45
            Width = 282
            Height = 21
            Hint = 
              'RT Scan to Inventory from RF will backflush components of floor ' +
              'dispositioned parts'
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ShowHint = True
            ParentShowHint = False
            DataField = 'BACKFLUSH_ON_SCAN_TO_INV'
            DataSource = wwDataSource1
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Auto-Backflush on RT scan to inventory'
            TabOrder = 1
          end
          object DBCheckBox4: TUniDBCheckBox
            Left = 20
            Top = 69
            Width = 543
            Height = 21
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ShowHint = True
            ParentShowHint = False
            DataField = 'DISPO_HARD_ALLOC_WO_FINISHED'
            DataSource = wwDataSource1
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 
              'Disposition all Hard Allocated raw material when work order is m' +
              'arked "Prod Finished"'
            TabOrder = 2
          end
        end
        object GroupBox1: TUniGroupBox
          Left = 0
          Top = 0
          Width = 574
          Height = 105
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '  General Info  '
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          object Label1: TUniLabel
            Left = 20
            Top = 26
            Width = 41
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Decimals'
            TabOrder = 4
          end
          object lblMatConsPercentWarn: TUniLabel
            Left = 20
            Top = 50
            Width = 117
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Consumption % warning'
            TabOrder = 5
          end
          object wwDBSpinEdit1: TUniDBNumberEdit
            Left = 183
            Top = 23
            Width = 51
            Height = 21
            Hint = 'Rounding precision'
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ShowHint = True
            ParentShowHint = False
            DataField = 'PROD_REP_DECIMAL'
            DataSource = wwDataSource1
            TabOrder = 0
            MaxValue = 6.000000000000000000
            DecimalSeparator = '.'
          end
          object ebdMatConsPercentWarn: TUniDBEdit
            Left = 183
            Top = 47
            Width = 123
            Height = 21
            Hint = 'Material consumption percentage warning'
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ShowHint = True
            ParentShowHint = False
            DataField = 'PROD_MAT_CONSUME_PERCENT_WARN'
            DataSource = wwDataSource1
            TabOrder = 1
          end
          object dbchkHideProdRepCurrShift: TUniDBCheckBox
            Left = 20
            Top = 71
            Width = 242
            Height = 21
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'PROD_REP_HIDE_CURRENT_SHIFT'
            DataSource = wwDataSource1
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Hide current shift production report'
            TabOrder = 2
          end
        end
        object DBCheckBox3: TUniDBCheckBox
          Left = 20
          Top = 228
          Width = 321
          Height = 17
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ShowHint = True
          ParentShowHint = False
          DataField = 'PROD_SHOW_WORK_CENTER_CAPACITY'
          DataSource = wwDataSource1
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Show Individual Work Center Capacity (info only)'
          TabOrder = 2
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 283
    Width = 584
    Height = 48
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 367
      Top = 1
      Width = 217
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
      object btnOK: TUniButton
        Left = 1
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK'
        TabOrder = 1
        Default = True
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 106
        Top = 7
        Width = 97
        Height = 27
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
  object wwDataSource1: TDataSource
    DataSet = wwTable1
    Left = 224
    Top = 15
  end
  object wwTable1: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 224
    Top = 29
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK'
      'wwTable1')
    SecurityCode = 'FRMPRODPARAMS'
    Left = 272
    Top = 28
  end
end
