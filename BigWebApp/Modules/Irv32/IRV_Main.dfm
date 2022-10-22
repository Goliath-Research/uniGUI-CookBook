object FrmIRV32: TFrmIRV32
  Left = 80
  Top = 98
  HelpContext = 1017477
  ClientHeight = 487
  ClientWidth = 841
  Caption = 'EnterpriseIQ / IRV32 MRP Engine'
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object splitDetails: TUniSplitter
    Left = 0
    Top = 287
    Width = 841
    Height = 5
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 466
    Width = 841
    Height = 21
    Hint = ''
    Panels = <
      item
        Text = 'Total '
        Width = 150
      end
      item
        Style = psOwnerDraw
        Width = 50
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 0
    Width = 841
    Height = 287
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 839
      Height = 285
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 622
      IQComponents.Grid.Height = 199
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcPTAllocate
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
      IQComponents.Navigator.DataSource = SrcPTAllocate
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 622
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 199
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcPTAllocate
      Columns = <
        item
          FieldName = 'ID'
          Title.Caption = 'ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MAX_LEVEL'
          Title.Caption = 'Level'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MFGNO'
          Title.Caption = 'Mfg #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BUCKET'
          Title.Caption = 'Bkt'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MUST_START_DATE'
          Title.Caption = 'Must Start'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIP_QUAN'
          Title.Caption = 'Ship Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MFG_QUAN'
          Title.Caption = 'Mfg Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FG_ALLOCATE'
          Title.Caption = 'FG Alloc'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SCHED_ALLOCATE'
          Title.Caption = 'Sched Alloc'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SCHED_EX_ALLOCATE'
          Title.Caption = 'Sched Ext Allocate'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WO_FIRM_ALLOCATE'
          Title.Caption = 'Firm WO Alloc'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MAKE_TO_ORDER_ALLOC'
          Title.Caption = 'MakeToOrder Alloc'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PO_ALLOCATE'
          Title.Caption = 'PO Alloc'
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
          FieldName = 'ORDERNO'
          Title.Caption = 'Order #'
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
          FieldName = 'REV'
          Title.Caption = 'Item Rev'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Item Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PARENT_ID'
          Title.Caption = 'Parent ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORIGIN'
          Title.Caption = 'Origin'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NOTE1'
          Title.Caption = 'Note'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORDER_TYPE'
          Title.Caption = 'Order Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DIVISION_ID'
          Title.Caption = 'Division ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BATCH_SIZE'
          Title.Caption = 'WO Max Batch Size'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Ext Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object pnlDetails: TUniPanel
    Left = 0
    Top = 292
    Width = 841
    Height = 174
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Splitter6: TUniSplitter
      Left = 289
      Top = 0
      Width = 5
      Height = 174
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 289
      Height = 172
      Hint = ''
      ActivePage = TabSheet1
      TabBarVisible = True
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      object TabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Sales Order'
        DesignSize = (
          281
          144)
        object Label8: TUniLabel
          Left = 3
          Top = 5
          Width = 42
          Height = 13
          Hint = ''
          Caption = 'Order ID'
          TabOrder = 10
        end
        object Label9: TUniLabel
          Left = 3
          Top = 25
          Width = 48
          Height = 13
          Hint = ''
          Caption = 'Ord Dtl ID'
          TabOrder = 11
        end
        object Label5: TUniLabel
          Left = 3
          Top = 45
          Width = 52
          Height = 13
          Hint = ''
          Caption = 'Requested'
          TabOrder = 12
        end
        object Label6: TUniLabel
          Left = 3
          Top = 65
          Width = 43
          Height = 13
          Hint = ''
          Caption = 'Promised'
          TabOrder = 13
        end
        object Label15: TUniLabel
          Left = 149
          Top = 25
          Width = 41
          Height = 13
          Hint = ''
          Caption = 'Prod Hrs'
          TabOrder = 14
        end
        object Label16: TUniLabel
          Left = 149
          Top = 45
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Cycles Req'
          TabOrder = 15
        end
        object Label12: TUniLabel
          Left = 149
          Top = 65
          Width = 58
          Height = 13
          Hint = ''
          Caption = 'Standard ID'
          TabOrder = 16
        end
        object Label14: TUniLabel
          Left = 149
          Top = 85
          Width = 43
          Height = 13
          Hint = ''
          Caption = 'Arinvt ID'
          TabOrder = 17
        end
        object Label7: TUniLabel
          Left = 3
          Top = 85
          Width = 46
          Height = 13
          Hint = ''
          Caption = 'Must Ship'
          TabOrder = 18
        end
        object Label1: TUniLabel
          Left = 149
          Top = 5
          Width = 39
          Height = 13
          Hint = ''
          Caption = 'Order #'
          TabOrder = 19
        end
        object DBText6: TUniDBEdit
          Left = 63
          Top = 1
          Width = 79
          Height = 19
          Hint = ''
          DataField = 'ORDER_ID'
          DataSource = SrcPTAllocate
          TabOrder = 0
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText7: TUniDBEdit
          Left = 63
          Top = 22
          Width = 79
          Height = 19
          Hint = ''
          DataField = 'ORD_DETAIL_ID'
          DataSource = SrcPTAllocate
          TabOrder = 1
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText8: TUniDBEdit
          Left = 63
          Top = 42
          Width = 79
          Height = 19
          Hint = ''
          DataField = 'REQUEST_DATE'
          DataSource = SrcPTAllocate
          TabOrder = 2
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText9: TUniDBEdit
          Left = 63
          Top = 62
          Width = 79
          Height = 19
          Hint = ''
          DataField = 'PROMISE_DATE'
          DataSource = SrcPTAllocate
          TabOrder = 3
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText13: TUniDBEdit
          Tag = 1
          Left = 211
          Top = 22
          Width = 65
          Height = 19
          Hint = ''
          DataField = 'PRODHRS'
          DataSource = SrcPTAllocate
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText14: TUniDBEdit
          Tag = 1
          Left = 211
          Top = 42
          Width = 65
          Height = 19
          Hint = ''
          DataField = 'CYCLES_REQ'
          DataSource = SrcPTAllocate
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText11: TUniDBEdit
          Tag = 1
          Left = 211
          Top = 62
          Width = 65
          Height = 19
          Hint = ''
          DataField = 'STANDARD_ID'
          DataSource = SrcPTAllocate
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText12: TUniDBEdit
          Tag = 1
          Left = 211
          Top = 82
          Width = 65
          Height = 19
          Hint = ''
          DataField = 'ARINVT_ID'
          DataSource = SrcPTAllocate
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText10: TUniDBEdit
          Left = 63
          Top = 82
          Width = 79
          Height = 19
          Hint = ''
          DataField = 'MUST_SHIP_DATE'
          DataSource = SrcPTAllocate
          TabOrder = 8
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText19: TUniDBEdit
          Tag = 1
          Left = 211
          Top = 2
          Width = 65
          Height = 19
          Hint = ''
          DataField = 'OrderNo'
          DataSource = SrcPTAllocate
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 9
          Color = clBtnFace
          ReadOnly = True
        end
      end
      object TabSheet2: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Bucket'
        DesignSize = (
          281
          144)
        object Label2: TUniLabel
          Left = 7
          Top = 5
          Width = 11
          Height = 13
          Hint = ''
          Caption = 'ID'
          TabOrder = 6
        end
        object Label3: TUniLabel
          Left = 135
          Top = 5
          Width = 43
          Height = 13
          Hint = ''
          Caption = 'Bucket #'
          TabOrder = 7
        end
        object Label4: TUniLabel
          Left = 135
          Top = 26
          Width = 42
          Height = 13
          Hint = ''
          Caption = '# Cycles'
          TabOrder = 8
        end
        object Label11: TUniLabel
          Left = 7
          Top = 46
          Width = 12
          Height = 13
          Hint = ''
          Caption = 'To'
          TabOrder = 9
        end
        object Label13: TUniLabel
          Left = 135
          Top = 46
          Width = 41
          Height = 13
          Hint = ''
          Caption = 'Prod Hrs'
          TabOrder = 10
        end
        object Label10: TUniLabel
          Left = 7
          Top = 26
          Width = 24
          Height = 13
          Hint = ''
          Caption = 'From'
          TabOrder = 11
        end
        object DBText1: TUniDBEdit
          Tag = 1
          Left = 40
          Top = 23
          Width = 85
          Height = 19
          Hint = ''
          DataField = 'BUCKET_START'
          DataSource = SrcPTBucket
          TabOrder = 0
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText2: TUniDBEdit
          Tag = 1
          Left = 40
          Top = 43
          Width = 85
          Height = 19
          Hint = ''
          DataField = 'BUCKET_END'
          DataSource = SrcPTBucket
          TabOrder = 1
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText3: TUniDBEdit
          Tag = 1
          Left = 40
          Top = 2
          Width = 85
          Height = 19
          Hint = ''
          DataField = 'ID'
          DataSource = SrcPTBucket
          TabOrder = 2
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText4: TUniDBEdit
          Tag = 1
          Left = 188
          Top = 2
          Width = 85
          Height = 19
          Hint = ''
          DataField = 'SEQ'
          DataSource = SrcPTBucket
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText5: TUniDBEdit
          Tag = 1
          Left = 188
          Top = 23
          Width = 85
          Height = 19
          Hint = ''
          DataField = 'CYCLES_REQ'
          DataSource = SrcPTBucket
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText15: TUniDBEdit
          Tag = 1
          Left = 188
          Top = 43
          Width = 85
          Height = 19
          Hint = ''
          DataField = 'PRODHRS'
          DataSource = SrcPTBucket
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          Color = clBtnFace
          ReadOnly = True
        end
      end
      object TabSheet3: TUniTabSheet
        Hint = ''
        ImageIndex = 2
        Caption = 'Work Order'
        object Label17: TUniLabel
          Left = 7
          Top = 5
          Width = 11
          Height = 13
          Hint = ''
          Caption = 'ID'
          TabOrder = 4
        end
        object Label18: TUniLabel
          Left = 7
          Top = 25
          Width = 24
          Height = 13
          Hint = ''
          Caption = 'Start'
          TabOrder = 5
        end
        object Label19: TUniLabel
          Left = 7
          Top = 45
          Width = 18
          Height = 13
          Hint = ''
          Caption = 'End'
          TabOrder = 6
        end
        object Label20: TUniLabel
          Left = 7
          Top = 65
          Width = 42
          Height = 13
          Hint = 'ReOrdered Bkt# after merge with WOs'
          ShowHint = True
          ParentShowHint = False
          Caption = 'Act Bkt#'
          TabOrder = 7
        end
        object DBText16: TUniDBEdit
          Tag = 1
          Left = 60
          Top = 22
          Width = 135
          Height = 19
          Hint = ''
          DataField = 'START_TIME'
          DataSource = SrcWorkOrd
          TabOrder = 0
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText17: TUniDBEdit
          Tag = 1
          Left = 60
          Top = 2
          Width = 135
          Height = 19
          Hint = ''
          DataField = 'ID'
          DataSource = SrcWorkOrd
          TabOrder = 1
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText18: TUniDBEdit
          Tag = 1
          Left = 60
          Top = 42
          Width = 135
          Height = 19
          Hint = ''
          DataField = 'END_TIME'
          DataSource = SrcWorkOrd
          TabOrder = 2
          Color = clBtnFace
          ReadOnly = True
        end
        object DBText20: TUniDBEdit
          Tag = 1
          Left = 60
          Top = 62
          Width = 135
          Height = 19
          Hint = ''
          DataField = 'BUCKET'
          DataSource = SrcWorkOrd
          TabOrder = 3
          Color = clBtnFace
          ReadOnly = True
        end
      end
      object TabSheet4: TUniTabSheet
        Hint = ''
        ImageIndex = 3
        Caption = 'Log'
        object DBGrid2: TUniDBGrid
          Left = 0
          Top = 0
          Width = 281
          Height = 144
          Hint = ''
          DataSource = SrcPtAlloc_Log
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'ID'
              Title.Caption = 'ID'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'TEXT'
              Title.Caption = 'Text'
              Width = 213
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
    end
    object Panel1: TUniPanel
      Left = 294
      Top = 1
      Width = 547
      Height = 172
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel3: TUniPanel
        Left = 1
        Top = 1
        Width = 545
        Height = 29
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        DesignSize = (
          545
          29)
        object edStatus: TUniEdit
          Left = 5
          Top = 5
          Width = 543
          Height = 19
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Color = clBtnFace
          ReadOnly = True
        end
      end
      object ListBox1: TUniListBox
        Left = 1
        Top = 29
        Width = 545
        Height = 112
        Hint = ''
        Constraints.MinHeight = 20
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        ParentFont = False
        Font.Name = 'Courier New'
      end
      object Panel5: TUniPanel
        Left = 1
        Top = 141
        Width = 545
        Height = 31
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        DesignSize = (
          545
          31)
        object btnRun: TUniButton
          Left = 460
          Top = 4
          Width = 75
          Height = 24
          Hint = ''
          Caption = 'Recalculate'
          Anchors = [akTop, akRight]
          TabOrder = 1
          OnClick = btnRunClick
        end
      end
    end
  end
  object SrcPTAllocate: TDataSource
    DataSet = QryPTAllocate
    Left = 52
    Top = 176
  end
  object funcGet_Max_Level: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    SchemaName = 'IQMS'
    PackageName = 'IRV32'
    StoredProcName = 'GET_MAX_LEVEL'
    Left = 277
    Top = 174
    ParamData = <
      item
        Position = 1
        Name = 'RESULT'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptResult
      end>
  end
  object procProcess_Level: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    SchemaName = 'IQMS'
    PackageName = 'IRV32'
    StoredProcName = 'PROCESS_LEVEL'
    Left = 309
    Top = 174
    ParamData = <
      item
        Position = 1
        Name = 'V_LEVEL'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end>
  end
  object StoredProc1: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    SchemaName = 'IQMS'
    Left = 245
    Top = 174
  end
  object MainMenu1: TUniMainMenu
    Left = 366
    Top = 174
    object File1: TUniMenuItem
      Caption = 'File'
      object NetChangeLog1: TUniMenuItem
        Caption = 'Change Log'
        OnClick = NetChangeLog1Click
      end
      object N3: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Troubleshooting1: TUniMenuItem
      Caption = 'Troubleshooting'
      object VerifyCurrentlyRunningMfgUniqueness1: TUniMenuItem
        Caption = 'Verify Currently Running Mfg # Uniqueness'
        OnClick = VerifyCurrentlyRunningMfgUniqueness1Click
      end
      object ExistingLocks1: TUniMenuItem
        Caption = 'Existing Locks'
        OnClick = ExistingLocks1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object QryDistinctMfgs: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct'
      '       p.standard_id,'
      '       s.mfgno,'
      
        '       decode( p.origin, '#39'FORECAST'#39', '#39'FORECAST'#39', '#39' '#39' ) as origin' +
        ','
      
        '       decode( rtrim(p.order_type), '#39'AUTO-MRP'#39', p.division_id, n' +
        'ull ) as division_id,'
      '       p.order_type,'
      
        '       decode( p.is_make_to_order, '#39'Y'#39', ord_detail_id, null) as ' +
        'make_to_order_detail_id,'
      '       p.complex_standard_id'
      '  from ptallocate p,'
      '       standard s'
      ' where p.standard_id is not NULL'
      '   and p.mfg_quan > 0'
      '   and p.standard_id = s.id'
      '   and nvl(p.max_level,0) = :processed_level'
      '  order by'
      '       s.mfgno,'
      '       p.standard_id,'
      '       decode( p.origin, '#39'FORECAST'#39', '#39'FORECAST'#39', '#39' '#39' ),'
      
        '       decode( rtrim(p.order_type), '#39'AUTO-MRP'#39', 1, 2 )  /* proce' +
        'ss auto mrp first */'
      ' '
      ' '
      ' '
      ' ')
    Left = 248
    Top = 212
    ParamData = <
      item
        Name = 'processed_level'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object QryPtBucket: TFDQuery
    MasterSource = SrcPTAllocate
    MasterFields = 'PTBUCKET_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, '
      '       standard_id,'
      '       seq,'
      '       bucket_start,'
      '       bucket_end,'
      '       cycles_req,'
      '       prodhrs,'
      '       end_time'
      '  from ptbucket '
      'where id = :ptbucket_id')
    Left = 87
    Top = 175
    ParamData = <
      item
        Name = 'PTBUCKET_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryPtBucketID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryPtBucketSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Size = 0
    end
    object QryPtBucketSEQ: TBCDField
      FieldName = 'SEQ'
      Size = 0
    end
    object QryPtBucketBUCKET_START: TDateTimeField
      FieldName = 'BUCKET_START'
    end
    object QryPtBucketBUCKET_END: TDateTimeField
      FieldName = 'BUCKET_END'
    end
    object QryPtBucketCYCLES_REQ: TBCDField
      FieldName = 'CYCLES_REQ'
      Size = 2
    end
    object QryPtBucketPRODHRS: TFMTBCDField
      FieldName = 'PRODHRS'
      Size = 6
    end
    object QryPtBucketEND_TIME: TDateTimeField
      FieldName = 'END_TIME'
    end
  end
  object SrcPTBucket: TDataSource
    DataSet = QryPtBucket
    Left = 91
    Top = 199
  end
  object IQJump1: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcPTAllocate
    JumpTo = jtInventory
    Left = 403
    Top = 171
  end
  object IQJump2: TIQWebJump
    DataField = 'STANDARD_ID'
    DataSource = SrcPTAllocate
    JumpTo = jtBom
    Left = 403
    Top = 189
  end
  object PopupMenu1: TUniPopupMenu
    Left = 403
    Top = 210
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to &Inventory'
      OnClick = JumptoInventory1Click
    end
    object JumptoBOM1: TUniMenuItem
      Caption = 'Jump to &BOM'
      OnClick = JumptoBOM1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object GoToID1: TUniMenuItem
      Caption = 'Go To ID ...'
      OnClick = GoToID1Click
    end
    object GoToParent1: TUniMenuItem
      Caption = 'Go To Parent'
      OnClick = GoToParent1Click
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'IQWin32 / IRV32 MRP Engine'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 191399 $'
    Left = 438
    Top = 174
  end
  object SrcWorkOrd: TDataSource
    DataSet = QryWorkOrd
    Left = 127
    Top = 182
  end
  object QryWorkOrd: TFDQuery
    MasterSource = SrcPTAllocate
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select workorder.id,'
      '       workorder.start_time,'
      '       workorder.end_time,'
      '       workorder.bucket'
      '  from workorder, ptorder, ptorder_rel'
      ' where ptorder_rel.ptallocate_id = :ID'
      '   and ptorder.id = ptorder_rel.ptorder_id'
      '   and workorder.id = ptorder.workorder_id')
    Left = 127
    Top = 198
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 51356150000c
      end>
  end
  object SrcPtAlloc_Log: TDataSource
    DataSet = QryPtAlloc_Log
    Left = 166
    Top = 180
  end
  object QryPtAlloc_Log: TFDQuery
    MasterSource = SrcPTAllocate
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       text'
      '  from ptallocate_log'
      ' where ptallocate_id = :id'
      ' order by id'
      ' ')
    Left = 166
    Top = 198
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 51356150000c
      end>
    object QryPtAlloc_LogID: TBCDField
      FieldName = 'ID'
      Origin = 'PTALLOCATE_LOG.ID'
      Size = 0
    end
    object QryPtAlloc_LogTEXT: TStringField
      DisplayWidth = 60
      FieldName = 'TEXT'
      Origin = 'PTALLOCATE_LOG.TEXT'
      Size = 255
    end
  end
  object QryPTAllocate: TFDQuery
    AfterOpen = QryPTAllocateAfterOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select pa.id,'
      '       pa.order_id,'
      '       pa.ord_detail_id,'
      '       pa.request_date,'
      '       pa.promise_date,'
      '       pa.must_ship_date,'
      '       pa.must_start_date,'
      '       pa.arinvt_id,'
      '       pa.partno_id,'
      '       pa.ship_quan,'
      '       pa.mfg_quan,'
      '       pa.fg_allocate,'
      '       pa.po_allocate,'
      '       pa.sched_allocate,'
      '       pa.max_level,'
      '       pa.parent_id,'
      '       pa.prodhrs,'
      '       pa.cycles_req,'
      '       pa.standard_id,'
      '       pa.ptbucket_id,'
      '       pa.wo_firm_allocate,'
      '       pa.opmat_standard_id,'
      '       pa.origin,'
      '       pa.fore_dtl_id,'
      '       pa.overlap_hrs,'
      '       pa.note1,'
      '       pa.sched_ex_allocate,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.rev,'
      '       a.class,'
      '       s.mfgno,'
      '       b.seq as bucket,'
      '       o.orderno,'
      '       pa.order_type,'
      '       pa.division_id,'
      '       pa.make_to_order_alloc,'
      '       pa.batch_size'
      '  from '
      '       ptallocate pa,'
      '       arinvt a,'
      '       partno,'
      '       standard s,'
      '       ptbucket b,'
      '       orders o'
      ' where '
      '       -- arinvt'
      '       pa.arinvt_id = a.id'
      ''
      '       -- standard'
      '   and pa.partno_id = partno.id(+)'
      '   and partno.standard_id = s.id(+)'
      ''
      '       -- ptbucket'
      '   and pa.ptbucket_id = b.id(+)'
      ''
      '       -- orders'
      '   and pa.order_id = o.id(+)'
      ' '
      ' ')
    Left = 50
    Top = 199
    object QryPTAllocateID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'pa.id'
      Size = 0
    end
    object QryPTAllocateMAX_LEVEL: TBCDField
      DisplayLabel = 'Level'
      DisplayWidth = 6
      FieldName = 'MAX_LEVEL'
      Origin = 'pa.max_level'
      Size = 0
    end
    object QryPTAllocateMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 15
      FieldName = 'MFGNO'
      Origin = 's.mfgno'
      Size = 50
    end
    object QryPTAllocateBUCKET: TBCDField
      DisplayLabel = 'Bkt'
      DisplayWidth = 4
      FieldName = 'BUCKET'
      Origin = 'b.seq'
      Size = 0
    end
    object QryPTAllocateMUST_START_DATE: TDateTimeField
      DisplayLabel = 'Must Start'
      DisplayWidth = 10
      FieldName = 'MUST_START_DATE'
      Origin = 'pa.must_start_date'
    end
    object QryPTAllocateSHIP_QUAN: TFMTBCDField
      DisplayLabel = 'Ship Qty'
      DisplayWidth = 8
      FieldName = 'SHIP_QUAN'
      Origin = 'pa.ship_quan'
      Size = 6
    end
    object QryPTAllocateMFG_QUAN: TFMTBCDField
      DisplayLabel = 'Mfg Qty'
      DisplayWidth = 10
      FieldName = 'MFG_QUAN'
      Origin = 'pa.mfg_quan'
      Size = 6
    end
    object QryPTAllocateFG_ALLOCATE: TBCDField
      DisplayLabel = 'FG Alloc'
      DisplayWidth = 10
      FieldName = 'FG_ALLOCATE'
      Origin = 'pa.fg_allocate'
      Size = 0
    end
    object QryPTAllocateSCHED_ALLOCATE: TBCDField
      DisplayLabel = 'Sched Alloc'
      DisplayWidth = 10
      FieldName = 'SCHED_ALLOCATE'
      Origin = 'pa.SCHED_ALLOCATE'
      Size = 0
    end
    object QryPTAllocateSCHED_EX_ALLOCATE: TFMTBCDField
      DisplayLabel = 'Sched Ext Allocate'
      DisplayWidth = 15
      FieldName = 'SCHED_EX_ALLOCATE'
      Origin = 'pa.SCHED_EX_ALLOCATE'
      Size = 6
    end
    object QryPTAllocateWO_FIRM_ALLOCATE: TBCDField
      DisplayLabel = 'Firm WO Alloc'
      DisplayWidth = 11
      FieldName = 'WO_FIRM_ALLOCATE'
      Origin = 'pa.WO_FIRM_ALLOCATE'
      Size = 0
    end
    object QryPTAllocateMAKE_TO_ORDER_ALLOC: TFMTBCDField
      DisplayLabel = 'MakeToOrder Alloc'
      DisplayWidth = 15
      FieldName = 'MAKE_TO_ORDER_ALLOC'
      Size = 6
    end
    object QryPTAllocatePO_ALLOCATE: TBCDField
      DisplayLabel = 'PO Alloc'
      DisplayWidth = 10
      FieldName = 'PO_ALLOCATE'
      Origin = 'pa.PO_ALLOCATE'
      Size = 0
    end
    object QryPTAllocateITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 16
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object QryPTAllocateORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 'o.ORDERNO'
      Size = 15
    end
    object QryPTAllocateDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 23
      FieldName = 'DESCRIP'
      Origin = 'a.DESCRIP'
      Size = 100
    end
    object QryPTAllocateREV: TStringField
      DisplayLabel = 'Item Rev'
      DisplayWidth = 8
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object QryPTAllocateCLASS: TStringField
      DisplayLabel = 'Item Class'
      DisplayWidth = 9
      FieldName = 'CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object QryPTAllocatePARENT_ID: TBCDField
      DisplayLabel = 'Parent ID'
      DisplayWidth = 10
      FieldName = 'PARENT_ID'
      Origin = 'pa.PARENT_ID'
      Size = 0
    end
    object QryPTAllocateORIGIN: TStringField
      DisplayLabel = 'Origin'
      DisplayWidth = 10
      FieldName = 'ORIGIN'
      Origin = 'pa.origin'
      Size = 10
    end
    object QryPTAllocateNOTE1: TStringField
      DisplayLabel = 'Note'
      DisplayWidth = 30
      FieldName = 'NOTE1'
      Origin = 'pa.note1'
      Size = 150
    end
    object QryPTAllocateORDER_TYPE: TStringField
      DisplayLabel = 'Order Type'
      DisplayWidth = 10
      FieldName = 'ORDER_TYPE'
      Origin = 'pa.order_type'
      Size = 10
    end
    object QryPTAllocateDIVISION_ID: TBCDField
      DisplayLabel = 'Division ID'
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Origin = 'pa.division_id'
      Size = 0
    end
    object QryPTAllocateBATCH_SIZE: TFMTBCDField
      DisplayLabel = 'WO Max Batch Size'
      DisplayWidth = 16
      FieldName = 'BATCH_SIZE'
      Size = 6
    end
    object QryPTAllocateDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 48
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object QryPTAllocatePARTNO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARTNO_ID'
      Visible = False
      Size = 0
    end
    object QryPTAllocateORDER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORDER_ID'
      Visible = False
      Size = 0
    end
    object QryPTAllocateORD_DETAIL_ID: TBCDField
      DisplayWidth = 14
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryPTAllocateREQUEST_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'REQUEST_DATE'
      Visible = False
    end
    object QryPTAllocatePROMISE_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PROMISE_DATE'
      Visible = False
    end
    object QryPTAllocateMUST_SHIP_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'MUST_SHIP_DATE'
      Visible = False
    end
    object QryPTAllocateARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryPTAllocatePRODHRS: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'PRODHRS'
      Visible = False
      Size = 6
    end
    object QryPTAllocateCYCLES_REQ: TBCDField
      DisplayWidth = 11
      FieldName = 'CYCLES_REQ'
      Visible = False
      Size = 2
    end
    object QryPTAllocateSTANDARD_ID: TBCDField
      DisplayWidth = 12
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryPTAllocatePTBUCKET_ID: TBCDField
      DisplayWidth = 12
      FieldName = 'PTBUCKET_ID'
      Visible = False
      Size = 0
    end
    object QryPTAllocateOPMAT_STANDARD_ID: TBCDField
      DisplayWidth = 20
      FieldName = 'OPMAT_STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryPTAllocateFORE_DTL_ID: TBCDField
      DisplayWidth = 12
      FieldName = 'FORE_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryPTAllocateOVERLAP_HRS: TBCDField
      DisplayWidth = 13
      FieldName = 'OVERLAP_HRS'
      Visible = False
      Size = 2
    end
  end
  object ImageList1: TUniImageList
    Left = 302
    Top = 291
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1E1E100A9AAA900898E8A00868A87009F9F9F00D9D9D9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7E7E700B9BBB900A1A5A200B2B2B200E1E1E100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F900A0B1A40045715000135D240008591B0008591B00074415002C4131009191
      9100F7F7F7000000000000000000000000000000000000000000000000000000
      0000A6A6B000444474001919630012125900121259002E2E4C007D7D7E00E4E4
      E400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBFBFB00A0B1
      A400338546000B77240002741C000B7724000B7724000B74220009671F000C3D
      17007B7D7C00FBFBFB0000000000000000000000000000000000F6F6F7006F6F
      98000505810000009000000090000000900000008C0001017E00000053004545
      5000DADADA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5CABA003D9D
      5300128B2D00208D3A0038984E00088022000D7A26000B7422000B7422000B74
      22000C3D1700A9AAA900000000000000000000000000000000007676B0000101
      9B001313A4000000A2000000A2000000A20001019B0015159C00000090000000
      600055555C00F2F2F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9F5EC005BB16E001BA2
      3A0025A84300B6E1C000EBF8EE0053B369000C8C280013822C000D7A26000D7A
      26000A7123004E5D5200F4F4F4000000000000000000BDBDD70009099D002222
      A400C6C6DD007B7BD8000101AE000101AE004646BA00D0D0E5005555B5000000
      900006064C00A9A9A90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0E2BB0025A8430037BC
      5500BDEDC800F9F0F700EEE6EC00EDF9F0005AC07200169A3400188B3200107F
      29000D85290022552E00D6D6D60000000000000000006565D0000101AE001E1E
      AC00BABAC000FFFFFA006C6CD9004646C600E7E7EE00EDEDE4004747B4000000
      A20001017E0065656E00FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000081CE93001CB73F005FC5
      7600DAD2D80086CC960062B37500E1D7DF00EFFCF10060C67700189E3600188B
      3200128B2D001C672D00C9C9C90000000000000000003A3AC5000303BD000000
      CC001A1AB200B5B5CA00FBFBFD00F3F3FD00E2E2E8004141B8000303BD000202
      B40001019B004C4C6A00F6F6F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077CF8B0029C44C0039CF
      5B0051C56B0040D7620038D75D0062B37500DCD2DA00F1FCF40060C67700169A
      3400169A340020783500CCCDCC0000000000000000003535CD000B0BD0000707
      DC000202D4005959C900FFFFFA00000000009A9AE1000303C3000000C9000303
      C3000101AE004B4B7300F6F6F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008ADD9D002CCA500032D9
      580036DC5D0042DA640042DA640039D55C005FB27100DAD2D800F1FCF40060C6
      77001AAB3B0033854600E4E4E40000000000000000003D3DDB001515E3000707
      ED003D3DDB00DCDCEB00E6E6EB00D0D0E500F4F4F9007171E8000202D4000606
      CF000A0AB40062628200FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFF0CA0034D65A003BE1
      61003FDA620046DD690045DB660042DA640038D35B005BB16E00D6CBD400C1E2
      C9002FC451006B9B7600FDFDFD0000000000000000006464EB001E1EF7004141
      E900E1E1E100E6E6E0004141CF001E1EC600B8B8C400FEFEF1006060E2000707
      DC000A0AB400A1A1AB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F8FDF9006AE5860053E7
      750057E277004EE1700046DD690040D7620040D7620039CF5B0053B3690051C5
      6B003FC15D00CDD4CF00000000000000000000000000B5B6F8002E2EFD005B5B
      ED00ACACC5005353D5000000F0000000F0002525D0009393B6005656E5001818
      F40045459D00EEEEEE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9F9E1005FE7
      7E0072E98D0082EA9A0072E98D0057E2770049DB6A0043D463003BD75E0041D3
      6200ABC6B10000000000000000000000000000000000FDFDFF00797AFA004D4D
      FF006D6DF1006464FC004949FF003C3CFF004242FF004444F1003434FF003535
      CD00C8C8CF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D9F9
      E1007BEB950076E9910093ECA70089EBA1006AE5860050E1710065DB8000BFE1
      C700000000000000000000000000000000000000000000000000F3F3FD008080
      FC006161FF009090FF009E9EFF008D8DFE007272FF004D4DFF005252DF00C6C6
      DD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ECFCEF00A3F0B50099EFAD00A3F0B50097EFAB00A0F1B200DDF3E2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BCBCFD008988FD008D8DFE008D8DFE007B7BFF009B9CF500EAEAF6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000F81FF83F00000000
      E007F00F00000000C003C00700000000C003C003000000008001800300000000
      8001800100000000800180010000000080018101000000008001800100000000
      80018003000000008003800300000000C007800700000000E00FC00F00000000
      F01FF01F00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object procAuto_Load_Process: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    PackageName = 'AUTO_LOAD'
    StoredProcName = 'PROCESS'
    Left = 477
    Top = 173
    ParamData = <
      item
        Position = 1
        Name = 'V_EPLANT_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'V_MFGCELL_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end>
  end
  object procAssignConsumed: TFDStoredProc
    AutoCalcFields = False
    Connection = UniMainModule.FDConnection1
    PackageName = 'IRV32'
    StoredProcName = 'ASSIGN_CONSUMED_ITEMS_BY_LEVEL'
    Left = 588
    Top = 173
    ParamData = <
      item
        Position = 1
        Name = 'V_LEVEL'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end>
  end
end
