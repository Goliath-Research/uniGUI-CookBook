object FrmICT_Wizard: TFrmICT_Wizard
  Left = 90
  Top = 165
  HelpContext = 14771
  ClientHeight = 422
  ClientWidth = 624
  Caption = 'Intercompany Transactions'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pctrlSteps: TUniPageControl
    Left = 0
    Top = 0
    Width = 624
    Height = 422
    Hint = ''
    ActivePage = tabStep3
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    TabStop = False
    object tabStep1: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'tabStep1'
      object Panel14: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 616
        Height = 58
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 0
        Caption = ''
        Color = clGray
        object Label3: TUniLabel
          Left = 1
          Top = 1
          Width = 58
          Height = 16
          Hint = ''
          Caption = 'Step 1/3'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object Label4: TUniLabel
          Left = 1
          Top = 17
          Width = 332
          Height = 16
          Hint = ''
          Caption = 'Select Target intercompany location and click Next button.'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          TabOrder = 2
        end
      end
      object Panel1: TUniPanel
        Left = 0
        Top = 353
        Width = 616
        Height = 41
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          616
          41)
        object Bevel1: TUniPanel
          Left = 1
          Top = 1
          Width = 614
          Height = 2
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
        end
        object btnStep1Next: TUniButton
          Left = 441
          Top = 10
          Width = 75
          Height = 25
          Hint = ''
          Caption = 'Next'
          Anchors = [akTop, akRight]
          TabOrder = 2
          OnClick = btnStep1NextClick
        end
        object btnStep1Cancel: TUniButton
          Left = 532
          Top = 10
          Width = 75
          Height = 25
          Hint = ''
          Caption = 'Cancel'
          Cancel = True
          Anchors = [akTop, akRight]
          TabOrder = 3
          OnClick = btnStep1CancelClick
        end
      end
      object pnlStep1Carrier: TUniPanel
        Left = 0
        Top = 58
        Width = 616
        Height = 295
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        Color = clWhite
      end
    end
    object tabStep2: TUniTabSheet
      Hint = ''
      TabVisible = False
      ImageIndex = 2
      Caption = 'tabStep2'
      object Panel4: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 616
        Height = 58
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 0
        Caption = ''
        Color = clGray
        object Label5: TUniLabel
          Left = 1
          Top = 1
          Width = 58
          Height = 16
          Hint = ''
          Caption = 'Step 2/3'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object Label6: TUniLabel
          Left = 1
          Top = 17
          Width = 296
          Height = 16
          Hint = ''
          Caption = 'Select Transfer From location and click Next button.'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          TabOrder = 2
        end
      end
      object Panel5: TUniPanel
        Left = 0
        Top = 353
        Width = 616
        Height = 41
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          616
          41)
        object Bevel3: TUniPanel
          Left = 1
          Top = 1
          Width = 614
          Height = 2
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
        end
        object btnStep2Back: TUniButton
          Left = 350
          Top = 10
          Width = 75
          Height = 25
          Hint = ''
          Caption = 'Back'
          Anchors = [akTop, akRight]
          TabOrder = 2
          OnClick = btnStep2BackClick
        end
        object btnStep2Cancel: TUniButton
          Left = 532
          Top = 10
          Width = 75
          Height = 25
          Hint = ''
          Caption = 'Cancel'
          Cancel = True
          ModalResult = 2
          Anchors = [akTop, akRight]
          TabOrder = 3
          OnClick = btnStep1CancelClick
        end
        object btnStep2Next: TUniButton
          Left = 441
          Top = 10
          Width = 75
          Height = 25
          Hint = ''
          Caption = 'Next'
          Anchors = [akTop, akRight]
          TabOrder = 4
          OnClick = btnStep1NextClick
        end
      end
      object pnlStep2Carrier: TUniPanel
        Left = 0
        Top = 58
        Width = 616
        Height = 295
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        Color = clWhite
      end
    end
    object tabStep3: TUniTabSheet
      Hint = ''
      TabVisible = False
      ImageIndex = 1
      Caption = 'tabStep3'
      object Panel2: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 616
        Height = 58
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 0
        Caption = ''
        Color = clGray
        object Label1: TUniLabel
          Left = 1
          Top = 1
          Width = 58
          Height = 16
          Hint = ''
          Caption = 'Step 3/3'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 1
          Top = 17
          Width = 633
          Height = 16
          Hint = ''
          Caption = 
            'Select items you wish to include in intercompany transaction, sp' +
            'ecify quantity, due date and click Finish button.'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          TabOrder = 2
        end
      end
      object Panel3: TUniPanel
        Left = 0
        Top = 353
        Width = 616
        Height = 41
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        DesignSize = (
          616
          41)
        object Bevel2: TUniPanel
          Left = 1
          Top = 1
          Width = 614
          Height = 2
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
        end
        object btnStep3Back: TUniButton
          Left = 358
          Top = 10
          Width = 75
          Height = 25
          Hint = ''
          Caption = 'Back'
          Anchors = [akTop, akRight]
          TabOrder = 2
          OnClick = btnStep2BackClick
        end
        object btnStep3Cancel: TUniButton
          Left = 540
          Top = 10
          Width = 75
          Height = 25
          Hint = ''
          Caption = 'Cancel'
          Cancel = True
          ModalResult = 2
          Anchors = [akTop, akRight]
          TabOrder = 3
          OnClick = btnStep1CancelClick
        end
        object btnStep3Finish: TUniButton
          Left = 449
          Top = 10
          Width = 75
          Height = 25
          Hint = ''
          Caption = 'Finish'
          Anchors = [akTop, akRight]
          TabOrder = 4
          OnClick = btnStep3FinishClick
        end
      end
      object IQSearchArinvt: TIQUniGridControl
        Left = 0
        Top = 58
        Width = 616
        Height = 234
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 399
        IQComponents.Grid.Height = 148
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcArinv
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
        IQComponents.Navigator.DataSource = SrcArinv
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 399
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 148
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcArinv
        Columns = <
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QTY'
            Title.Caption = 'Qty'
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
            FieldName = 'REV'
            Title.Caption = 'Rev'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CLASS'
            Title.Caption = 'Class'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP2'
            Title.Caption = 'Ext Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ONHAND'
            Title.Caption = 'On Hand'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'UOM'
            Title.Caption = 'UOM'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NON_COMMITTED'
            Title.Caption = 'Non Committed'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
      object Panel6: TUniPanel
        Left = 0
        Top = 292
        Width = 616
        Height = 61
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 3
        Caption = ''
        object Label7: TUniLabel
          Left = 20
          Top = 38
          Width = 25
          Height = 13
          Hint = ''
          Caption = 'PO #'
          TabOrder = 3
        end
        object chkCreateNewSalesOrder: TUniCheckBox
          Left = 2
          Top = 12
          Width = 133
          Height = 17
          Hint = ''
          Caption = 'Create new sales order'
          TabOrder = 0
          OnClick = chkCreateNewSalesOrderClick
        end
        object edPoNo: TUniEdit
          Left = 64
          Top = 34
          Width = 157
          Height = 21
          Hint = ''
          Enabled = False
          Text = ''
          TabOrder = 1
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 11
    Top = 388
    object File1: TUniMenuItem
      Caption = 'File'
      object Setup1: TUniMenuItem
        Caption = 'Setup'
        OnClick = Setup1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmICT_Wizard'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197390 $'
    BuildVersion = '176554'
    Left = 44
    Top = 389
  end
  object SrcArinv: TDataSource
    DataSet = QryArinvt
    Left = 202
    Top = 173
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    BeforePost = QryArinvtBeforePost
    AfterPost = QryArinvtAfterPost
    CachedUpdates = True
    OnUpdateRecord = QryArinvtUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id,'
      '       a.itemno,'
      '       0 as qty,'
      '       to_date('#39#39') as due_date,'
      '       a.descrip,'
      '       a.rev,'
      '       a.class,'
      '       a.descrip2,'
      '       a.onhand,'
      '       a.unit as uom,'
      
        '       round(inv_misc.GetNonCommited( a.id, :division_id ), 2) a' +
        's non_committed'
      '  from '
      '       arinvt a'
      ' where '
      '       ( :division_id = 0'
      '         or'
      
        '         exists ( select 1 from fgmulti where arinvt_id = a.id a' +
        'nd division_id = :division_id ))'
      '         '
      '   and NVL(eplant_id, 0) = NVL(:eplant_id, 0)'
      '   and NVL(a.pk_hide, '#39'N'#39') <> '#39'Y'#39
      '    '
      '    ')
    Left = 202
    Top = 193
    ParamData = <
      item
        Name = 'division_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'eplant_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object QryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      ReadOnly = True
      Size = 100
    end
    object QryArinvtQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'QTY'
      Size = 38
    end
    object QryArinvtDUE_DATE: TDateTimeField
      DisplayLabel = 'Due Date'
      DisplayWidth = 18
      FieldName = 'DUE_DATE'
    end
    object QryArinvtREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      Origin = 'a.rev'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object QryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      Origin = 'a.class'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object QryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 39
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      ReadOnly = True
      Size = 100
    end
    object QryArinvtONHAND: TBCDField
      DisplayLabel = 'On Hand'
      DisplayWidth = 10
      FieldName = 'ONHAND'
      Origin = 'a.onhand'
      ReadOnly = True
    end
    object QryArinvtUOM: TStringField
      DisplayWidth = 20
      FieldName = 'UOM'
      Origin = 'a.unit'
      ReadOnly = True
      Size = 10
    end
    object QryArinvtNON_COMMITTED: TFMTBCDField
      DisplayLabel = 'Non Committed'
      DisplayWidth = 13
      FieldName = 'NON_COMMITTED'
      Size = 38
    end
    object QryArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmICT_Wizard')
    SecurityItems.Strings = (
      'chkCreateNewSalesOrder')
    SecurityCode = 'FRMICT_WIZARD'
    Left = 284
    Top = 176
  end
  object PkSalesOrder: TIQWebHpick
    BeforeOpen = PkSalesOrderBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select o.ID      as id,'
      '       o.orderno as orderno,'
      '       a.custno  as custno,'
      '       s.attn    as ship_to_attn,'
      
        '       decode( o.eplant_id, NULL, NULL, e.name || '#39' [ '#39' || o.epl' +
        'ant_id || '#39' ]'#39') as source_eplant,'
      '       d.name    as division_name'
      '  from orders o,'
      '       arcusto a,'
      '       ship_to s,'
      '       eplant e,'
      '       division d'
      ' where o.arcusto_id = :arcusto_id'
      '   and o.ship_to_id = s.id(+)'
      '   and o.arcusto_id = a.id(+)'
      '   and o.eplant_id = e.id(+)'
      '   and o.division_id = d.id(+)'
      '   and o.eplant_id = :ASource_Eplant_ID'
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 150
    Top = 173
    ParamData = <
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ASource_Eplant_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkSalesOrderID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkSalesOrderORDERNO: TStringField
      DisplayLabel = 'Ship Order #'
      FieldName = 'ORDERNO'
      Size = 15
    end
    object PkSalesOrderCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkSalesOrderSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 25
      FieldName = 'SHIP_TO_ATTN'
      Size = 60
    end
    object PkSalesOrderSOURCE_EPLANT: TStringField
      DisplayLabel = 'Source EPlant'
      DisplayWidth = 25
      FieldName = 'SOURCE_EPLANT'
      Size = 75
    end
    object PkSalesOrderDIVISION_NAME: TStringField
      DisplayLabel = 'Division Name'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
  end
end
