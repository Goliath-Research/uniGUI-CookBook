object FrmInvPOParamsDivision: TFrmInvPOParamsDivision
  Left = 0
  Top = 0
  ClientHeight = 339
  ClientWidth = 773
  Caption = 'Inventory PO Parameters by Division'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  ActiveControl = wwDBGrid1
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 41
    Width = 773
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 41
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object wwDataInspector1: TwwDataInspector
      Left = 1
      Top = 1
      Width = 771
      Height = 39
      TabStop = False
      DisableThemes = False
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
      DataSource = SrcArinvt
      Items = <
        item
          DataSource = SrcArinvt
          DataField = 'ITEMNO'
          Caption = 'Item #'
          WordWrap = False
        end
        item
          DataSource = SrcArinvt
          DataField = 'DESCRIP'
          Caption = 'Description'
          Items = <
            item
              DataSource = SrcArinvt
              DataField = 'DESCRIP2'
              Caption = 'Ext Description'
              WordWrap = False
            end
            item
              DataSource = SrcArinvt
              DataField = 'CLASS'
              Caption = 'Class'
              WordWrap = False
            end
            item
              DataSource = SrcArinvt
              DataField = 'REV'
              Caption = 'Rev'
              WordWrap = False
            end>
          WordWrap = False
        end>
      DefaultRowHeight = 19
      CaptionWidth = 100
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      CaptionIndent = 18
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 44
    Width = 773
    Height = 295
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 771
      Height = 293
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 554
      IQComponents.Grid.Height = 207
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcArinvtDivision
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
      IQComponents.Navigator.DataSource = SrcArinvtDivision
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 554
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 207
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 179
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 208
      DataSource = SrcArinvtDivision
      Columns = <
        item
          FieldName = 'Division'
          Title.Caption = 'Division'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MIN_ORDER_QTY'
          Title.Caption = 'Min Order'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MAX_ORDER_QTY'
          Title.Caption = 'Max Order'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SAFETY_STOCK'
          Title.Caption = 'Re-Order Point'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PO_SAFETY'
          Title.Caption = 'PO Safety'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PO_SCOPE'
          Title.Caption = 'PO Scope'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PO_MOVE_RANGE'
          Title.Caption = 'PO Range'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LEAD_DAYS'
          Title.Caption = 'Lead Days'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SAFETY_STOCK2'
          Title.Caption = 'Safety Stock'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      ExplicitTop = 29
      ExplicitHeight = 265
      Marker = 0
    end
    object wwDBComboDlgDivision: TUniEdit
      Left = 28
      Top = 156
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 1
      ReadOnly = True
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMINVPOPARAMSDIVISION'
    Left = 404
    Top = 100
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 80
    Top = 96
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, itemno, descrip, descrip2, class, rev'
      '  from arinvt'
      '  where id = :arinvt_id')
    Left = 80
    Top = 124
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT.ID'
      Size = 0
    end
    object QryArinvtITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryArinvtDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
    end
    object QryArinvtDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
    object QryArinvtCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryArinvtREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
  end
  object SrcArinvtDivision: TDataSource
    DataSet = QryArinvtDivision
    Left = 128
    Top = 96
  end
  object QryArinvtDivision: TFDQuery
    BeforePost = QryArinvtDivisionBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnCalcFields = QryArinvtDivisionCalcFields
    OnNewRecord = QryArinvtDivisionNewRecord
    MasterSource = SrcArinvt
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'arinvt_division'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLArinvtDivision
    SQL.Strings = (
      'select id, '
      '       arinvt_id,'
      '       division_id,'
      '       min_order_qty,'
      '       max_order_qty,'
      '       safety_stock, '
      '       po_safety,    '
      '       po_scope,     '
      '       po_move_range,'
      '       lead_days,'
      '       safety_stock2'
      '  from arinvt_division'
      ' where arinvt_id = :id '
      ' order by id')
    Left = 128
    Top = 124
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryArinvtDivisionDivision: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'Division'
      Size = 25
      Calculated = True
    end
    object QryArinvtDivisionMIN_ORDER_QTY: TBCDField
      DisplayLabel = 'Min Order'
      DisplayWidth = 11
      FieldName = 'MIN_ORDER_QTY'
      Origin = 'IQ.ARINVT_DIVISION.MIN_ORDER_QTY'
    end
    object QryArinvtDivisionMAX_ORDER_QTY: TBCDField
      DisplayLabel = 'Max Order'
      DisplayWidth = 11
      FieldName = 'MAX_ORDER_QTY'
      Origin = 'IQ.ARINVT_DIVISION.MAX_ORDER_QTY'
    end
    object QryArinvtDivisionSAFETY_STOCK: TBCDField
      DisplayLabel = 'Re-Order Point'
      DisplayWidth = 11
      FieldName = 'SAFETY_STOCK'
      Origin = 'IQ.ARINVT_DIVISION.SAFETY_STOCK'
    end
    object QryArinvtDivisionPO_SAFETY: TBCDField
      DisplayLabel = 'PO Safety'
      DisplayWidth = 11
      FieldName = 'PO_SAFETY'
      Origin = 'IQ.ARINVT_DIVISION.PO_SAFETY'
      Size = 0
    end
    object QryArinvtDivisionPO_SCOPE: TBCDField
      DisplayLabel = 'PO Scope'
      DisplayWidth = 11
      FieldName = 'PO_SCOPE'
      Origin = 'IQ.ARINVT_DIVISION.PO_SCOPE'
      Size = 0
    end
    object QryArinvtDivisionPO_MOVE_RANGE: TBCDField
      DisplayLabel = 'PO Range'
      DisplayWidth = 11
      FieldName = 'PO_MOVE_RANGE'
      Origin = 'IQ.ARINVT_DIVISION.PO_MOVE_RANGE'
      Size = 0
    end
    object QryArinvtDivisionID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT_DIVISION.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryArinvtDivisionARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ARINVT_DIVISION.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryArinvtDivisionDIVISION_ID: TBCDField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_ID'
      Origin = 'IQ.ARINVT_DIVISION.DIVISION_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object QryArinvtDivisionLEAD_DAYS: TBCDField
      DisplayLabel = 'Lead Days'
      FieldName = 'LEAD_DAYS'
      Origin = 'IQ.ARINVT_DIVISION.LEAD_DAYS'
      Size = 0
    end
    object QryArinvtDivisionSAFETY_STOCK2: TBCDField
      DisplayLabel = 'Safety Stock'
      FieldName = 'SAFETY_STOCK2'
      Origin = 'IQ.ARINVT_DIVISION.SAFETY_STOCK2'
    end
  end
  object UpdateSQLArinvtDivision: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into arinvt_division'
      
        '  (ID, ARINVT_ID, DIVISION_ID, MIN_ORDER_QTY, MAX_ORDER_QTY, SAF' +
        'ETY_STOCK, '
      '   PO_SAFETY, PO_SCOPE, PO_MOVE_RANGE, LEAD_DAYS, SAFETY_STOCK2)'
      'values'
      
        '  (:ID, :ARINVT_ID, :DIVISION_ID, :MIN_ORDER_QTY, :MAX_ORDER_QTY' +
        ', :SAFETY_STOCK, '
      
        '   :PO_SAFETY, :PO_SCOPE, :PO_MOVE_RANGE, :LEAD_DAYS, :SAFETY_ST' +
        'OCK2)')
    ModifySQL.Strings = (
      'update arinvt_division'
      'set'
      '  ID = :ID,'
      '  ARINVT_ID = :ARINVT_ID,'
      '  DIVISION_ID = :DIVISION_ID,'
      '  MIN_ORDER_QTY = :MIN_ORDER_QTY,'
      '  MAX_ORDER_QTY = :MAX_ORDER_QTY,'
      '  SAFETY_STOCK = :SAFETY_STOCK,'
      '  PO_SAFETY = :PO_SAFETY,'
      '  PO_SCOPE = :PO_SCOPE,'
      '  PO_MOVE_RANGE = :PO_MOVE_RANGE,'
      '  LEAD_DAYS = :LEAD_DAYS,'
      '  SAFETY_STOCK2 = :SAFETY_STOCK2'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from arinvt_division'
      'where'
      '  ID = :OLD_ID')
    Left = 128
    Top = 152
  end
  object PkDivision: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id,'
      '       d.name, '
      '       d.descrip,'
      '       d.eplant_id'
      '  from division d'
      ' where misc.eplant_filter(d.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 120
    Top = 226
    object PkDivisionID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkDivisionNAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'NAME'
      Size = 25
    end
    object PkDivisionDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkDivisionEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
end
