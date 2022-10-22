object FrmJobCostPostedTrans: TFrmJobCostPostedTrans
  Left = 0
  Top = 0
  HelpContext = 23149
  ClientHeight = 740
  ClientWidth = 1046
  Caption = 'PIT Posted Transactions'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 341
    Top = 0
    Width = 4
    Height = 740
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel2: TUniPanel
    Left = 345
    Top = 0
    Width = 701
    Height = 740
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter3: TUniSplitter
      Left = 1
      Top = 551
      Width = 699
      Height = 4
      Cursor = crVSplit
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      ParentColor = False
      Color = clBtnFace
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 555
      Width = 699
      Height = 184
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object IQSearch2: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 697
        Height = 182
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 480
        IQComponents.Grid.Height = 96
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcTransDtl
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
        IQComponents.Navigator.DataSource = SrcTransDtl
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 480
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 96
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcTransDtl
        Columns = <
          item
            FieldName = 'ACCT'
            Title.Caption = 'Acct #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ACCT_DESCRIP'
            Title.Caption = 'Acct Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COST_ELEMENT'
            Title.Caption = 'Cost Element'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CREDIT'
            Title.Caption = 'Credit'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DEBIT'
            Title.Caption = 'Debit'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 699
      Height = 550
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter4: TUniSplitter
        Left = 1
        Top = 380
        Width = 697
        Height = 4
        Cursor = crVSplit
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        ParentColor = False
        Color = clBtnFace
      end
      object IQSearch1: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 697
        Height = 379
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 480
        IQComponents.Grid.Height = 293
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcTrans
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
        IQComponents.Navigator.DataSource = SrcTrans
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 480
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 293
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcTrans
        Columns = <
          item
            FieldName = 'GLBATCHID_ID'
            Title.Caption = 'Batch ID'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FROM_DATE'
            Title.Caption = 'From Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TO_DATE'
            Title.Caption = 'To Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CREATED_DATE'
            Title.Caption = 'Created Date'
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
            FieldName = 'ITEMNO'
            Title.Caption = 'Item #'
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
            FieldName = 'DESCRIP'
            Title.Caption = 'Item Description'
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
            FieldName = 'POSTED'
            Title.Caption = 'Posted'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BATCHNUMBER'
            Title.Caption = 'Batch #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FISCALYR'
            Title.Caption = 'Fiscal Year'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PERIOD'
            Title.Caption = 'Period'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BATCH_DATE'
            Title.Caption = 'Batch Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
      object Panel7: TUniPanel
        Left = 1
        Top = 384
        Width = 697
        Height = 165
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object IQSearch3: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 695
          Height = 163
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 478
          IQComponents.Grid.Height = 77
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcTransChild
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
          IQComponents.Navigator.DataSource = SrcTransChild
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 478
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 77
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcTransChild
          Columns = <
            item
              FieldName = 'GLBATCHID_ID'
              Title.Caption = 'Batch ID'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'FROM_DATE'
              Title.Caption = 'From Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'TO_DATE'
              Title.Caption = 'To Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CREATED_DATE'
              Title.Caption = 'Created Date'
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
              FieldName = 'ITEMNO'
              Title.Caption = 'Item #'
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
              FieldName = 'DESCRIP'
              Title.Caption = 'Item Description'
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
              FieldName = 'POSTED'
              Title.Caption = 'Posted'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BATCHNUMBER'
              Title.Caption = 'Batch #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'FISCALYR'
              Title.Caption = 'Fiscal Year'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PERIOD'
              Title.Caption = 'Period'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BATCH_DATE'
              Title.Caption = 'Batch Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          Marker = 0
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 740
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 107
      Top = 38
      Width = 5
      Height = 649
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel25: TUniPanel
      Left = 1
      Top = 687
      Width = 339
      Height = 52
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Bevel3: TUniPanel
        Left = 1
        Top = 1
        Width = 337
        Height = 3
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
      end
      object Panel26: TUniPanel
        Left = 225
        Top = 4
        Width = 113
        Height = 47
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnApplyActCost: TUniButton
          Left = 3
          Top = 9
          Width = 103
          Height = 33
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Apply'
          TabOrder = 1
          OnClick = btnApplyActCostClick
        end
      end
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 38
      Width = 106
      Height = 649
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      object Label15: TUniLabel
        Left = 10
        Top = 75
        Width = 38
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'To Date'
        TabOrder = 1
      end
      object Label13: TUniLabel
        Left = 10
        Top = 106
        Width = 33
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Item #'
        TabOrder = 2
      end
      object Label14: TUniLabel
        Left = 10
        Top = 43
        Width = 50
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'From Date'
        TabOrder = 3
      end
      object Label16: TUniLabel
        Left = 10
        Top = 12
        Width = 54
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Trans Type'
        TabOrder = 4
      end
      object Label17: TUniLabel
        Left = 10
        Top = 137
        Width = 32
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Acct #'
        TabOrder = 5
      end
      object Label18: TUniLabel
        Left = 10
        Top = 169
        Width = 38
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Batch #'
        TabOrder = 6
      end
    end
    object Panel24: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 339
      Height = 37
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 2
      Caption = ''
      Color = clBtnShadow
      object Label20: TUniLabel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 97
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Selection Criteria'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object Panel4: TUniPanel
      Left = 112
      Top = 38
      Width = 228
      Height = 649
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      Caption = ''
      DesignSize = (
        228
        649)
      object wwDBComboDlgItemNo: TUniEdit
        Left = 0
        Top = 102
        Width = 225
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ReadOnly = True
        OnKeyDown = wwDBComboDlgItemNoKeyDown
      end
      object dateFrom: TUniDBDateTimePicker
        Left = 0
        Top = 39
        Width = 225
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DateTime = 42684.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object dateTo: TUniDBDateTimePicker
        Left = 0
        Top = 71
        Width = 225
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DateTime = 42684.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object comboTransType: TUniDBComboBox
        Left = 0
        Top = 8
        Width = 225
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Anchors = [akLeft, akTop, akRight]
        Style = csDropDownList
        Items.Strings = (
          'Disposition Transactions'#9'DISPOSITION TRANSACTIONS'
          'Manual Transactions'#9'MANUAL TRANSACTIONS'
          'Receiving Transactions'#9'RECEIVING TRANSACTIONS'
          'Physical Inventory'#9'PHYSICAL INVENTORY'
          'Scrap'#9'SCRAP'
          'InterPlant Transfers'#9'INTERPLANT TRANSFERS'
          'Repair/Rework'#9'REPAIR'
          'Process WIP'#9'PROCESS WIP'
          'Finish Process WIP'#9'FINISH PROCESS WIP'
          'Shipments'#9'PACKING SLIP'
          'MRO'#9'PM'
          'Projects'#9'PROJECTS'
          'Process Reverse Backflush'#9'REVERSE_BACKFLUSH'
          'Adjust WIP'#9'ADJUST WIP')
        TabOrder = 3
      end
      object wwDBComboDlgAcct: TUniEdit
        Left = 0
        Top = 133
        Width = 225
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ReadOnly = True
        OnKeyDown = wwDBComboDlgAcctKeyDown
      end
      object edBatch: TUniEdit
        Left = 0
        Top = 165
        Width = 225
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
      end
    end
  end
  object PkArinvt: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select arinvt.id,'
      '       arinvt.class,'
      '       arinvt.itemno,'
      '       arinvt.rev,'
      '       arinvt.descrip,'
      '       arinvt.descrip2,'
      '       arinvt.eplant_id,'
      '       arinvt.arcusto_id,'
      '       arcusto.custno,'
      '       arcusto.company,'
      '       arinvt.pk_hide'
      '  from arinvt,'
      '       arcusto'
      ' where arinvt.arcusto_id = arcusto.id(+)'
      '   and misc.eplant_filter( arinvt.eplant_id ) = 1'
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 86
    Top = 186
    object PkArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT.ID'
      Visible = False
      Size = 0
    end
    object StringField8: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object StringField9: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object PkArinvtREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object StringField10: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
    object PkArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.ARINVT.EPLANT_ID'
      Size = 0
    end
    object PkArinvtARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'IQ.ARINVT.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkArinvtCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkArinvtCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object PkArinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkAcct: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '       acct,'
      '       descrip,'
      '       eplant_id,'
      '       pk_hide'
      '  from glacct'
      ' where misc.eplant_filter(eplant_id) = 1'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 115
    Top = 186
    object PkAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAcctACCT: TStringField
      DisplayLabel = 'Account #'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkAcctDESCRIP: TStringField
      DisplayLabel = 'Account Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkAcctPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 143
    Top = 186
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
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
        Caption = '&Printer Setup'
        OnClick = PrinterSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmJobCostPostedTrans'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196578 $'
    BuildVersion = '176554'
    Left = 171
    Top = 186
  end
  object SrcTrans: TDataSource
    DataSet = QryTrans
    Left = 89
    Top = 224
  end
  object QryTrans: TFDQuery
    BeforeOpen = QryTransBeforeOpen
    AfterScroll = QryTransAfterScroll
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       h.glbatchid_id,'
      '       h.from_date,'
      '       h.to_date,'
      '       h.created_date,'
      '       d.id as c_trans_drill_id,'
      '       d.class,'
      '       d.itemno,'
      '       d.rev,'
      '       d.descrip,'
      '       d.qty,'
      '       h.posted,'
      '       b.batchnumber,'
      '       v.fiscalyr,'
      '       v.period,'
      '       b.batch_date,'
      '       d.arinvt_id,'
      '       t.id as translog_id'
      '  from   '
      '       c_trans_drill_hdr h,'
      '       c_trans_drill d,  '
      '       glbatchid b,'
      '       v_glyear_periods v,'
      '       translog t'
      ' where  '
      '       h.id = d.c_trans_drill_hdr_id(+)'
      '   and h.glbatchid_id = b.id(+)'
      '   and b.glperiods_id = v.period_id(+)'
      '   and d.translog_id2 = t.id'
      '   and NVL(t.parent_arinvt_id, 0) = 0'
      '   and h.from_date >= :from_date'
      '   and h.to_date <= :to_date'
      '   and h.trans_type = :trans_type'
      '   and (:arinvt_id = 0'
      '        or'
      '        d.arinvt_id = :arinvt_id)'
      '            '
      '   and (:batch = 0'
      '        or'
      '         b.batchnumber = :batch)'
      '')
    Left = 89
    Top = 252
    ParamData = <
      item
        Name = 'FROM_DATE'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TO_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'TRANS_TYPE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'BATCH'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTransGLBATCHID_ID: TBCDField
      DisplayLabel = 'Batch ID'
      FieldName = 'GLBATCHID_ID'
      Origin = 'h.glbatchid_id'
      Precision = 15
      Size = 0
    end
    object QryTransFROM_DATE: TDateTimeField
      DisplayLabel = 'From Date'
      FieldName = 'FROM_DATE'
      Origin = 'h.from_date'
    end
    object QryTransTO_DATE: TDateTimeField
      DisplayLabel = 'To Date'
      FieldName = 'TO_DATE'
      Origin = 'h.TO_DATE'
    end
    object QryTransCREATED_DATE: TDateTimeField
      DisplayLabel = 'Created Date'
      FieldName = 'CREATED_DATE'
      Origin = 'h.CREATED_DATE'
    end
    object QryTransCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'd.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryTransITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 30
      FieldName = 'ITEMNO'
      Origin = 'd.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryTransREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'd.REV'
      FixedChar = True
      Size = 15
    end
    object QryTransDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'd.DESCRIP'
      Size = 100
    end
    object QryTransQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QTY'
      Origin = 'd.QTY'
      Precision = 15
      Size = 6
    end
    object QryTransPOSTED: TStringField
      DisplayLabel = 'Posted'
      FieldName = 'POSTED'
      Origin = 'h.POSTED'
      FixedChar = True
      Size = 1
    end
    object QryTransFISCALYR: TStringField
      DisplayLabel = 'Fiscal Year'
      FieldName = 'FISCALYR'
      Origin = 'v.FISCALYR'
      Size = 25
    end
    object QryTransBATCHNUMBER: TBCDField
      DisplayLabel = 'Batch #'
      FieldName = 'BATCHNUMBER'
      Origin = 'b.BATCHNUMBER'
      Precision = 15
      Size = 0
    end
    object QryTransPERIOD: TBCDField
      DisplayLabel = 'Period'
      FieldName = 'PERIOD'
      Origin = 'v.PERIOD'
      Precision = 2
      Size = 0
    end
    object QryTransBATCH_DATE: TDateTimeField
      DisplayLabel = 'Batch Date'
      FieldName = 'BATCH_DATE'
      Origin = 'b.BATCH_DATE'
    end
    object QryTransC_TRANS_DRILL_ID: TBCDField
      FieldName = 'C_TRANS_DRILL_ID'
      Origin = 'C_TRANS_DRILL_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTransARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'BATCHNUMBER'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTransTRANSLOG_ID: TBCDField
      FieldName = 'TRANSLOG_ID'
      Origin = 'TRANSLOG_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcTransDtl: TDataSource
    DataSet = QryTransDtl
    Left = 137
    Top = 224
  end
  object QryTransDtl: TFDQuery
    BeforeOpen = QryTransDtlBeforeOpen
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.acct,'
      '       g.descrip as acct_descrip,'
      '       a.debit,'
      '       a.credit,'
      '       a.id,'
      '       a.cost_element'
      '  from c_trans_drill_acct a,'
      '       glacct g'
      ' where a.c_trans_drill_id = :ac_trans_drill_id'
      '   and a.glacct_id = g.id(+)'
      '   and (:aacct_id = 0'
      '        or'
      '        a.glacct_id = :aacct_id)'
      '')
    Left = 137
    Top = 260
    ParamData = <
      item
        Name = 'AC_TRANS_DRILL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'AACCT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end>
    object QryTransDtlACCT: TStringField
      DisplayLabel = 'Acct #'
      FieldName = 'ACCT'
      Origin = 'a.acct'
      Size = 50
    end
    object QryTransDtlACCT_DESCRIP: TStringField
      DisplayLabel = 'Acct Description'
      FieldName = 'ACCT_DESCRIP'
      Origin = 'g.descrip'
      Size = 50
    end
    object QryTransDtlDEBIT: TBCDField
      DisplayLabel = 'Debit'
      FieldName = 'DEBIT'
      Origin = 'a.debit'
      currency = True
      Precision = 15
      Size = 2
    end
    object QryTransDtlCREDIT: TBCDField
      DisplayLabel = 'Credit'
      FieldName = 'CREDIT'
      Origin = 'a.credit'
      currency = True
      Precision = 15
      Size = 2
    end
    object QryTransDtlCOST_ELEMENT: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'COST_ELEMENT'
      Origin = 'a.COST_ELEMENT'
      Size = 50
    end
  end
  object SrcTransChild: TDataSource
    DataSet = QryTransChild
    Left = 89
    Top = 320
  end
  object QryTransChild: TFDQuery
    BeforeOpen = QryTransChildBeforeOpen
    AfterScroll = QryTransChildAfterScroll
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       h.glbatchid_id,'
      '       h.from_date,'
      '       h.to_date,'
      '       h.created_date,'
      '       d.id as c_trans_drill_id,'
      '       d.class,'
      '       d.itemno,'
      '       d.rev,'
      '       d.descrip,'
      '       d.qty,'
      '       h.posted,'
      '       b.batchnumber,'
      '       v.fiscalyr,'
      '       v.period,'
      '       b.batch_date,'
      '       d.arinvt_id'
      '  from   '
      '       c_trans_drill_hdr h,'
      '       c_trans_drill d,  '
      '       glbatchid b,'
      '       v_glyear_periods v,'
      '       translog t'
      ' where  '
      '       h.id = d.c_trans_drill_hdr_id(+)'
      '   and h.glbatchid_id = b.id(+)'
      '   and b.glperiods_id = v.period_id(+)'
      '   and d.translog_id2 = t.id'
      '   and NVL(t.parent_arinvt_id, 0) = NVL(:aParentArinvtId, -1)'
      '   and t.parent_arinvt_id is not null'
      '   and h.from_date >= :from_date                     '
      '   and h.to_date <= :to_date'
      '   and h.trans_type = :trans_type'
      '   and (:arinvt_id = 0'
      '        or'
      '        d.arinvt_id = :arinvt_id)'
      '            '
      '   and (:batch = 0'
      '        or'
      '         b.batchnumber = :batch)'
      '')
    Left = 105
    Top = 308
    ParamData = <
      item
        Name = 'APARENTARINVTID'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FROM_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'TO_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'TRANS_TYPE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'BATCH'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object BCDField1: TBCDField
      DisplayLabel = 'Batch ID'
      FieldName = 'GLBATCHID_ID'
      Origin = 'h.glbatchid_id'
      Precision = 15
      Size = 0
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'From Date'
      FieldName = 'FROM_DATE'
      Origin = 'h.from_date'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'To Date'
      FieldName = 'TO_DATE'
      Origin = 'h.TO_DATE'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Created Date'
      FieldName = 'CREATED_DATE'
      Origin = 'h.CREATED_DATE'
    end
    object StringField1: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'd.CLASS'
      FixedChar = True
      Size = 2
    end
    object StringField2: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 30
      FieldName = 'ITEMNO'
      Origin = 'd.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object StringField3: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'd.REV'
      FixedChar = True
      Size = 15
    end
    object StringField4: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'd.DESCRIP'
      Size = 100
    end
    object FMTBCDField1: TFMTBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QTY'
      Origin = 'd.QTY'
      Precision = 15
      Size = 6
    end
    object StringField5: TStringField
      DisplayLabel = 'Posted'
      FieldName = 'POSTED'
      Origin = 'h.POSTED'
      FixedChar = True
      Size = 1
    end
    object BCDField2: TBCDField
      DisplayLabel = 'Batch #'
      FieldName = 'BATCHNUMBER'
      Origin = 'b.BATCHNUMBER'
      Precision = 15
      Size = 0
    end
    object StringField6: TStringField
      DisplayLabel = 'Fiscal Year'
      FieldName = 'FISCALYR'
      Origin = 'v.FISCALYR'
      Size = 25
    end
    object BCDField3: TBCDField
      DisplayLabel = 'Period'
      FieldName = 'PERIOD'
      Origin = 'v.PERIOD'
      Precision = 2
      Size = 0
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Batch Date'
      FieldName = 'BATCH_DATE'
      Origin = 'b.BATCH_DATE'
    end
    object BCDField4: TBCDField
      FieldName = 'C_TRANS_DRILL_ID'
      Origin = 'C_TRANS_DRILL_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTransChildARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 100
    Top = 361
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmJobCostPostedTrans'
    WebUse = False
    TouchScreen = False
    Left = 197
    Top = 364
  end
  object PopupMenu1: TUniPopupMenu
    Left = 213
    Top = 252
    object JumpToTranslog1: TUniMenuItem
      Caption = 'Jump To &Transaction Log'
      OnClick = JumpToTranslog1Click
    end
    object JumpToGLBatch1: TUniMenuItem
      Caption = 'Jump To &GL Batch'
      OnClick = JumpToGLBatch1Click
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'JumpToGLBatch1'
      'JumpToTranslog1')
    SecurityCode = 'FRMJOBCOSTPOSTEDTRANS'
    Left = 200
    Top = 184
  end
end
