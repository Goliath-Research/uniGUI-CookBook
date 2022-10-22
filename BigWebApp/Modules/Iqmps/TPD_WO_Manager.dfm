object FrmTPD_WO_Manager: TFrmTPD_WO_Manager
  Left = 275
  Top = 206
  HelpContext = 1012204
  ClientHeight = 426
  ClientWidth = 1020
  Caption = 'WO Management'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 184
    Width = 1020
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlWOHeader: TUniPanel
    Left = 0
    Top = 0
    Width = 1020
    Height = 184
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object IQSearchWO: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 1018
      Height = 182
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 801
      IQComponents.Grid.Height = 96
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcWO
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
      IQComponents.Navigator.DataSource = SrcWO
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 801
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
      DataSource = SrcWO
      Columns = <
        item
          FieldName = 'START_TIME'
          Title.Caption = 'Must Start'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ID'
          Title.Caption = 'WO #'
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
          FieldName = 'FIRM'
          Title.Caption = 'Firm'
          Width = 64
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'Cycle_Req_Disp'
          Title.Caption = 'Cycle_Req_Disp'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CustNo'
          Title.Caption = 'Customer #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRODHRS'
          Title.Caption = 'Prod Hours'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'END_TIME'
          Title.Caption = 'End Date'
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
          FieldName = 'MFG_TYPE'
          Title.Caption = 'MfgType'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRIORITY_NOTE'
          Title.Caption = 'Priority Note'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
      object wwDBComboDlgCustNo: TUniEdit
        Left = 222
        Top = 89
        Width = 121
        Height = 21
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 3
        ReadOnly = True
      end
      object wwDBComboDlgPriorityNote: TUniEdit
        Left = 515
        Top = 87
        Width = 121
        Height = 21
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 187
    Width = 1020
    Height = 239
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 287
      Top = 1
      Width = 6
      Height = 237
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object pnlPtOrder: TUniPanel
      Left = 1
      Top = 1
      Width = 286
      Height = 237
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel7: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 284
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label4: TUniLabel
          Left = 1
          Top = 1
          Width = 118
          Height = 13
          Hint = ''
          Caption = 'Configuration Details'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object wwDBGrid2: TIQUniGridControl
        Left = 1
        Top = 21
        Width = 284
        Height = 215
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 67
        IQComponents.Grid.Height = 129
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcPtorder
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
        IQComponents.Navigator.DataSource = SrcPtorder
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 67
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 129
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcPtorder
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
            FieldName = 'CLASS'
            Title.Caption = 'Class'
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
            FieldName = 'DESCRIP2'
            Title.Caption = 'Ext Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object Panel4: TUniPanel
      Left = 293
      Top = 1
      Width = 726
      Height = 237
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object wwDBGrid1: TIQUniGridControl
        Left = 1
        Top = 21
        Width = 724
        Height = 215
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 507
        IQComponents.Grid.Height = 129
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcPtOrderRel
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
        IQComponents.Navigator.DataSource = SrcPtOrderRel
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 507
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 129
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcPtOrderRel
        Columns = <
          item
            FieldName = 'REL_QUAN_DISP'
            Title.Caption = 'Delivery Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REL_DATE'
            Title.Caption = 'Delivery Date'
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
            FieldName = 'PONO'
            Title.Caption = 'PO #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
      object Panel9: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 724
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object Label7: TUniLabel
          Left = 1
          Top = 1
          Width = 108
          Height = 13
          Hint = ''
          Caption = 'Delivery Quantities'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
  end
  object SrcWO: TDataSource
    DataSet = QryWO
    Left = 62
    Top = 84
  end
  object QryWO: TFDQuery
    BeforeOpen = QryWOBeforeOpen
    BeforeInsert = QryWOBeforeInsert
    AfterInsert = QryWOAfterInsert
    BeforeEdit = QryWOBeforeEdit
    BeforePost = QryWOBeforePost
    AfterPost = ApplyUpdates
    BeforeDelete = CheckFirm
    AfterDelete = ApplyUpdates
    OnCalcFields = QryWOCalcFields
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLWO
    SQL.Strings = (
      'select wo.id,'
      '       '
      '       wo.standard_id,'
      '       wo.arcusto_id,'
      '       wo.eplant_id,'
      '       wo.firm,'
      ''
      '       wo.origin,'
      '       wo.cycles_req,'
      '       wo.prodhrs,'
      '       wo.start_time,'
      '       wo.end_time,'
      '       wo.bucket,'
      '       wo.priority_note,'
      ''
      '       s.mfg_type,'
      '       s.uom as bom_uom,'
      '       s.mfgno'
      '  from workorder wo,'
      '       ptorder,'
      '       partno p,'
      '       standard s'
      ' where'
      '       p.arinvt_id = :arinvt_id'
      '   and p.id = ptorder.partno_id'
      '   and ptorder.workorder_id = wo.id'
      '   and p.standard_id = s.id'
      ''
      ' order by   '
      '       wo.start_time,'
      '       wo.id'
      '            '
      ''
      '')
    Left = 62
    Top = 98
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryWOSTART_TIME: TDateTimeField
      DisplayLabel = 'Must Start'
      DisplayWidth = 15
      FieldName = 'START_TIME'
      Origin = 'wo.start_time'
    end
    object QryWOID: TBCDField
      DisplayLabel = 'WO #'
      DisplayWidth = 15
      FieldName = 'ID'
      Origin = 'wo.id'
      Size = 0
    end
    object QryWOMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO'
      Origin = 's.mfgno'
      Size = 50
    end
    object QryWOFIRM: TStringField
      DisplayLabel = 'Firm'
      DisplayWidth = 5
      FieldName = 'FIRM'
      Origin = 'wo.firm'
      FixedChar = True
      Size = 1
    end
    object QryWOCustNo: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CustNo'
      Calculated = True
    end
    object QryWOEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'wo.eplant_id'
      Size = 0
    end
    object QryWOCycle_Req_Disp: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Cycle_Req_Disp'
      DisplayFormat = '##########0.##'
      Calculated = True
    end
    object QryWOPRODHRS: TFMTBCDField
      DisplayLabel = 'Prod Hours'
      DisplayWidth = 10
      FieldName = 'PRODHRS'
      Origin = 'wo.prodhrs'
      Size = 6
    end
    object QryWOEND_TIME: TDateTimeField
      DisplayLabel = 'End Date'
      DisplayWidth = 18
      FieldName = 'END_TIME'
      Origin = 'wo.end_time'
    end
    object QryWOORIGIN: TStringField
      DisplayLabel = 'Origin'
      DisplayWidth = 10
      FieldName = 'ORIGIN'
      Origin = 'wo.origin'
      Size = 10
    end
    object QryWOMFG_TYPE: TStringField
      DisplayLabel = 'MfgType'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      Origin = 's.mfg_type'
      FixedChar = True
      Size = 10
    end
    object QryWOCYCLES_REQ: TBCDField
      DisplayLabel = 'Cycles Req'
      DisplayWidth = 11
      FieldName = 'CYCLES_REQ'
      Origin = 'IQ.WORKORDER.CYCLES_REQ'
      Visible = False
      Size = 2
    end
    object QryWOARCUSTO_ID: TBCDField
      DisplayWidth = 11
      FieldName = 'ARCUSTO_ID'
      Origin = 'IQ.WORKORDER.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryWOSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.WORKORDER.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryWOBUCKET: TBCDField
      FieldName = 'BUCKET'
      Origin = 'wo.bucket'
      Visible = False
      Size = 0
    end
    object QryWOBOM_UOM: TStringField
      DisplayWidth = 10
      FieldName = 'BOM_UOM'
      Origin = 's.uom'
      Visible = False
      Size = 10
    end
    object QryWOPRIORITY_NOTE: TStringField
      DisplayLabel = 'Priority Note'
      FieldName = 'PRIORITY_NOTE'
      Origin = 'IQ.WORKORDER.PRIORITY_NOTE'
      Size = 255
    end
  end
  object UpdateSQLWO: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into workorder'
      
        '  (ID, STANDARD_ID, ARCUSTO_ID, FIRM, ORIGIN, CYCLES_REQ, PRODHR' +
        'S, START_TIME, '
      '   END_TIME, PRIORITY_NOTE)'
      'values'
      
        '  (:ID, :STANDARD_ID, :ARCUSTO_ID, :FIRM, :ORIGIN, :CYCLES_REQ, ' +
        ':PRODHRS, '
      '   :START_TIME, :END_TIME, :PRIORITY_NOTE)')
    ModifySQL.Strings = (
      'update workorder'
      'set'
      '  ID = :ID,'
      '  STANDARD_ID = :STANDARD_ID,'
      '  ARCUSTO_ID = :ARCUSTO_ID,'
      '  FIRM = :FIRM,'
      '  ORIGIN = :ORIGIN,'
      '  CYCLES_REQ = :CYCLES_REQ,'
      '  PRODHRS = :PRODHRS,'
      '  START_TIME = :START_TIME,'
      '  END_TIME = :END_TIME,'
      '  PRIORITY_NOTE = :PRIORITY_NOTE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from workorder'
      'where'
      '  ID = :OLD_ID')
    Left = 62
    Top = 125
  end
  object AppDef1: TIQWebAppDef
    AppCode = 'WORKORDER'
    DataField = 'MFG_TYPE'
    DataSource = SrcWO
    Left = 28
    Top = 84
  end
  object SrcPtorder: TDataSource
    DataSet = QryPtorder
    Left = 116
    Top = 85
  end
  object QryPtorder: TFDQuery
    CachedUpdates = True
    MasterSource = SrcWO
    MasterFields = 'STANDARD_ID;ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select p.id,'
      '       p.workorder_id,'
      '       p.partno_id,'
      '       partno.arinvt_id,'
      '       a.itemno,'
      '       a.class,'
      '       a.rev,'
      '       a.descrip,'
      '       a.descrip2'
      '  from partno, ptorder p, arinvt a'
      ' where '
      '       -- link ptorder'
      '       partno.standard_id = :standard_id'
      '   and partno.id = p.partno_id(+)'
      '   and p.workorder_id(+) = :id'
      '       -- link arinvt'
      '   and partno.arinvt_id = a.id'
      '          ')
    Left = 116
    Top = 100
    ParamData = <
      item
        Name = 'STANDARD_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryPtorderITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryPtorderDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryPtorderCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object QryPtorderREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 6
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object QryPtorderDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryPtorderID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryPtorderWORKORDER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Visible = False
      Size = 0
    end
    object QryPtorderPARTNO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARTNO_ID'
      Visible = False
      Size = 0
    end
    object QryPtorderARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcPtOrderRel: TDataSource
    DataSet = QryPtOrderRel
    Left = 165
    Top = 85
  end
  object QryPtOrderRel: TFDQuery
    BeforeInsert = QryPtOrderRelBeforeInsert
    BeforeEdit = QryPtOrderRelBeforeEdit
    BeforePost = QryPtOrderRelBeforePost
    AfterPost = ApplyUpdatesFromReleases
    AfterDelete = ApplyUpdatesFromReleases
    OnNewRecord = QryPtOrderRelNewRecord
    CachedUpdates = True
    MasterSource = SrcPtorder
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateObject = UpdateSQLPtOrder_Rel
    SQL.Strings = (
      'select r.ptorder_id,'
      '       r.rel_quan_disp,'
      '       r.rel_date,'
      '       r.orderno,'
      '       r.pono,'
      '       r.rowid,'
      '       r.id'
      '  from ptorder_rel r'
      ' where '
      '       -- link ptorder'
      '       r.ptorder_id = :id'
      '          ')
    Left = 165
    Top = 99
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryPtOrderRelREL_QUAN_DISP: TBCDField
      DisplayLabel = 'Delivery Qty'
      DisplayWidth = 14
      FieldName = 'REL_QUAN_DISP'
      Required = True
      Size = 2
    end
    object QryPtOrderRelREL_DATE: TDateTimeField
      DisplayLabel = 'Delivery Date'
      DisplayWidth = 18
      FieldName = 'REL_DATE'
      Required = True
    end
    object QryPtOrderRelORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 14
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryPtOrderRelPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 12
      FieldName = 'PONO'
      Size = 35
    end
    object QryPtOrderRelPTORDER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PTORDER_ID'
      Visible = False
      Size = 0
    end
    object QryPtOrderRelROWID: TStringField
      DisplayWidth = 18
      FieldName = 'ROWID'
      ReadOnly = True
      Visible = False
      Size = 23
    end
    object QryPtOrderRelID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQLPtOrder_Rel: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO PTORDER_REL'
      '(PTORDER_ID, REL_DATE, ORDERNO, PONO, REL_QUAN_DISP, '
      '  ID)'
      
        'VALUES (:NEW_PTORDER_ID, :NEW_REL_DATE, :NEW_ORDERNO, :NEW_PONO,' +
        ' :NEW_REL_QUAN_DISP, '
      '  :NEW_ID)')
    ModifySQL.Strings = (
      'UPDATE PTORDER_REL'
      
        'SET PTORDER_ID = :NEW_PTORDER_ID, REL_DATE = :NEW_REL_DATE, ORDE' +
        'RNO = :NEW_ORDERNO, '
      
        '  PONO = :NEW_PONO, REL_QUAN_DISP = :NEW_REL_QUAN_DISP, ID = :NE' +
        'W_ID'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM PTORDER_REL'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT PTORDER_ID, REL_DATE, REL_QUAN, ORDERNO, PONO, PTALLOCATE' +
        '_ID, '
      
        '  PTALLOCATE_PARENT_ID, REL_QUAN_DISP, DIVISION_ID, ORD_DETAIL_I' +
        'D, '
      '  REL_QUAN_ORIGIN, ID, SHIP_TO_ID, PTALLOCATE_TOP_PARENT_ID, '
      
        '  PTALLOC_TOP_COMPLEX_PARENT_ID, FORE_DTL_ID, JOB_SEQ, RELEASES_' +
        'ID, '
      '  SYS_ADDED_ORIGIN, PROMISE_DATE, REQUEST_DATE'
      'FROM PTORDER_REL'
      'WHERE ID = :ID')
    Left = 166
    Top = 123
  end
  object PopupMenu1: TUniPopupMenu
    Left = 218
    Top = 85
    object About1: TUniMenuItem
      Caption = 'About ...'
      OnClick = About1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object JumpToWorkorder1: TUniMenuItem
      Caption = 'Jump To Workorder'
      OnClick = JumpToWorkorder1Click
    end
  end
  object PkArcusto: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select custno,'
      '          company,'
      '          city,'
      '          state,'
      '          country,'
      '          id,'
      '          pk_hide'
      'from v_arcusto'
      'order by custno'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 254
    Top = 85
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 25
    end
    object PkArcustoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Size = 2
    end
    object PkArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object PkArcustoID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object PkArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARCUSTO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmTPD_WO_Manager'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 359
    Top = 90
  end
end
