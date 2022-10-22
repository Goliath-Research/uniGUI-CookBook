object Frm_ICA_PO_Receipts: TFrm_ICA_PO_Receipts
  Left = 0
  Top = 0
  ClientHeight = 372
  ClientWidth = 566
  Caption = 'Select PO Receipts'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 331
    Width = 566
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 331
      Top = 1
      Width = 235
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnAssign: TUniButton
        Left = 71
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Assign'
        TabOrder = 1
        OnClick = BtnAssignClick
      end
      object BtnCancel: TUniButton
        Left = 152
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 89
    Width = 566
    Height = 242
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 349
    IQComponents.Grid.Height = 156
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcRec
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
    IQComponents.Navigator.DataSource = SrcRec
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 349
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 156
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcRec
    Columns = <
      item
        FieldName = 'QTY_RECEIVED'
        Title.Caption = 'Qty. Received'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RECEIPTNO'
        Title.Caption = 'Receipt #'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UNIT_PRICE'
        Title.Caption = 'Unit Price'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Description2'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 14
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Rev.'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PONO'
        Title.Caption = 'PO #'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOTNO'
        Title.Caption = 'Lot #'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DATE_RECEIVED'
        Title.Caption = 'Date Received'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ICA_DTL_ID'
        Title.Caption = 'ICA Detail ID'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 89
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    DesignSize = (
      566
      89)
    object Label1: TUniLabel
      Left = 16
      Top = 11
      Width = 97
      Height = 13
      Hint = ''
      Caption = 'Date Received From'
      TabOrder = 4
    end
    object Label2: TUniLabel
      Left = 16
      Top = 35
      Width = 85
      Height = 13
      Hint = ''
      Caption = 'Date Received To'
      TabOrder = 5
    end
    object BtnApply: TUniButton
      Left = 480
      Top = 8
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Apply'
      Anchors = [akTop, akRight]
      TabOrder = 6
      OnClick = BtnApplyClick
    end
    object cbViewRec: TUniCheckBox
      Tag = 1999
      Left = 16
      Top = 63
      Width = 142
      Height = 17
      Hint = ''
      Caption = 'View All Receipts'
      TabOrder = 1
    end
    object wwDBFrom: TUniDateTimePicker
      Left = 145
      Top = 8
      Width = 121
      Height = 21
      Hint = ''
      DateTime = 42634.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object wwDBTo: TUniDateTimePicker
      Left = 145
      Top = 35
      Width = 121
      Height = 21
      Hint = ''
      DateTime = 42634.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 144
    Top = 144
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
      end
    end
  end
  object QryRec: TFDQuery
    BeforeOpen = QryRecBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select r.id,'
      '       r.po_detail_id,'
      '       r.qty_received,'
      '       r.receiptno,'
      '       r.unit_price,'
      '       r.lotno,'
      '       r.fgmulti_id,'
      '       r.date_received,'
      '       d.arinvt_id,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.class,'
      '       a.rev,'
      '       p.pono,'
      
        '       proc_cost_ex_a.get_glacct_recv_main_item2(a.id) as glacct' +
        '_id_alloc,'
      '       ica_cost_alloc.GetICA_DTL_ID(r.id) as ica_dtl_id,'
      '      (select min(fgmulti_id)'
      '                from translog'
      '               where trans_in_out = '#39'IN'#39
      '                 and source = '#39'PO_DETAIL'#39
      '                 and source_id = d.id'
      
        '                 and trunc(trans_date) between :AFrom and :ATo) ' +
        'as translog_fgmulti_id       '
      '  from po_receipts r,'
      '       po_detail d,'
      '       po p,'
      '       arinvt a'
      ' where r.po_detail_id = d.id'
      '   and d.po_id = p.id'
      '   and d.arinvt_id = a.id'
      
        '   and ( (p.vendor_id = :AvendorId and :ADummy1 = 1) or (:ADummy' +
        '2 = 1) )'
      '   and r.date_received between :AFrom and :ATo'
      '')
    Left = 16
    Top = 152
    ParamData = <
      item
        Name = 'AvendorId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ADummy1'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ADummy2'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'AFrom'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'ATo'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryRecQTY_RECEIVED: TBCDField
      DisplayLabel = 'Qty. Received'
      DisplayWidth = 10
      FieldName = 'QTY_RECEIVED'
      Origin = 'r.QTY_RECEIVED'
    end
    object QryRecRECEIPTNO: TStringField
      DisplayLabel = 'Receipt #'
      DisplayWidth = 20
      FieldName = 'RECEIPTNO'
      Origin = 'r.RECEIPTNO'
      Size = 50
    end
    object QryRecUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Origin = 'r.UNIT_PRICE'
      Size = 6
    end
    object QryRecITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'a.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryRecDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'a.DESCRIP'
      Size = 100
    end
    object QryRecDESCRIP2: TStringField
      DisplayLabel = 'Description2'
      DisplayWidth = 20
      FieldName = 'DESCRIP2'
      Origin = 'a.DESCRIP2'
      Size = 100
    end
    object QryRecCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'a.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryRecREV: TStringField
      DisplayLabel = 'Rev.'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'a.REV'
      FixedChar = True
      Size = 15
    end
    object QryRecPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 35
      FieldName = 'PONO'
      Origin = 'p.PONO'
      Size = 35
    end
    object QryRecLOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'r.LOTNO'
      Size = 25
    end
    object QryRecDATE_RECEIVED: TDateTimeField
      DisplayLabel = 'Date Received'
      DisplayWidth = 18
      FieldName = 'DATE_RECEIVED'
      Origin = 'r.DATE_RECEIVED'
    end
    object QryRecICA_DTL_ID: TFMTBCDField
      DisplayLabel = 'ICA Detail ID'
      DisplayWidth = 10
      FieldName = 'ICA_DTL_ID'
      Origin = 'ica_cost_alloc.GetICA_DTL_ID(r.id)'
      Size = 38
    end
    object QryRecID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'r.id'
      Visible = False
      Size = 0
    end
    object QryRecPO_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PO_DETAIL_ID'
      Origin = 'r.PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryRecARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'd.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryRecGLACCT_ID_ALLOC: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_ALLOC'
      Origin = 'proc_cost_ex_a.get_glacct_recv_main_item2(a.id)'
      Visible = False
      Size = 38
    end
    object QryRecFGMULTI_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FGMULTI_ID'
      Visible = False
      Size = 0
    end
    object QryRecTRANSLOG_FGMULTI_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'TRANSLOG_FGMULTI_ID'
      Visible = False
      Size = 38
    end
  end
  object SrcRec: TDataSource
    DataSet = QryRec
    Left = 48
    Top = 152
  end
  object PKFgMulti: TIQWebHpick
    BeforeOpen = PKFgMultiBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select f.arinvt_id as arinvt_id, '
      '       f.lotno as lotno,'
      '       f.id as id,'
      '       f.onhand as onhand,'
      '       l.descrip as descrip,'
      '       a.itemno as itemno,'
      '       a.descrip as item_descrip,'
      '       a.descrip2 as item_descrip2,'
      '       a.class as class,'
      '       a.rev as rev'
      '  from fgmulti f,'
      '       locations l,'
      '       arinvt a '
      ' where f.loc_id = l.id'
      '   and f.arinvt_id = :AId'
      '   and f.arinvt_id = a.id  '
      '       ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 208
    Top = 143
    ParamData = <
      item
        Name = 'AId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PKFgMultiARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.FGMULTI.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PKFgMultiLOTNO: TStringField
      DisplayLabel = 'Lot #'
      FieldName = 'LOTNO'
      Origin = 'IQ.FGMULTI.LOTNO'
      FixedChar = True
      Size = 25
    end
    object PKFgMultiID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FGMULTI.ID'
      Visible = False
      Size = 0
    end
    object PKFgMultiONHAND: TBCDField
      DisplayLabel = 'On Hand Qty.'
      FieldName = 'ONHAND'
      Origin = 'IQ.FGMULTI.ONHAND'
    end
    object PKFgMultiDESCRIP: TStringField
      DisplayLabel = 'Location'
      FieldName = 'DESCRIP'
      Origin = 'IQ.LOCATIONS.DESCRIP'
      Size = 50
    end
    object PKFgMultiITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PKFgMultiITEM_DESCRIP: TStringField
      DisplayLabel = 'Item Description'
      FieldName = 'ITEM_DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
    end
    object PKFgMultiITEM_DESCRIP2: TStringField
      DisplayLabel = 'Item Description2'
      FieldName = 'ITEM_DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
    object PKFgMultiCLASS: TStringField
      DisplayLabel = 'Item Class'
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object PKFgMultiREV: TStringField
      DisplayLabel = 'Item Rev.'
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
  end
end
