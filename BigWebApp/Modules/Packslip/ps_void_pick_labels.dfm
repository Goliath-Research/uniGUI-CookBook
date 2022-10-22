object FrmPSVoid_PickLabels: TFrmPSVoid_PickLabels
  Left = 280
  Top = 256
  ClientHeight = 283
  ClientWidth = 634
  Caption = 'Select Serial #'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 242
    Width = 634
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 425
      Top = 1
      Width = 209
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 242
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 632
      Height = 240
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 415
      IQComponents.Grid.Height = 154
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcMasterLabels
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
      IQComponents.Navigator.DataSource = SrcMasterLabels
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 415
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 154
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcMasterLabels
      Marker = 0
    end
  end
  object SrcMasterLabels: TDataSource
    DataSet = QryMasterLabels
    Left = 36
    Top = 64
  end
  object QryMasterLabels: TFDQuery
    BeforeOpen = QryMasterLabelsBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select m.id,'
      '       m.serial,'
      '       m.qty,'
      '       m.loc_desc,'
      '       m.fg_lotno'
      '  from master_label m,'
      '       work_rma_labels w,'
      '       shipment_dtl s,'
      '       fgmulti f'
      ' where '
      '       /* get shipment_dtl for vmi and ict */'
      '       s.id = :shipment_dtl_id'
      ''
      
        '       /* limit to labels for that arinvt. 02-04-2001 note for I' +
        'CT we are using TARGET arinvt_id stores in shipment_dtl.ict_arin' +
        'vt_id */'
      
        '   and m.arinvt_id = decode( s.ict_arinvt_id, null, :arinvt_id, ' +
        's.ict_arinvt_id )'
      '   and w.batch(+) = :batch'
      '   and m.id = w.master_label_id(+)'
      '   and w.id is NULL'
      ''
      '       /* limit to labels belonging to this shipment */'
      
        '       /* and m.shipment_dtl_id in (select id from shipment_dtl ' +
        'where shipments_id = __shipments_id__) */'
      
        '   and rf.get_master_label_ship_dtl_id( m.id ) in (select id fro' +
        'm shipment_dtl where shipments_id = :shipments_id)'
      ''
      
        '       /* get fgmulti_id of that label (pallet or standalone lab' +
        'el) and link in fgmulti*/'
      '   and rf.get_master_label_fgmulti_id( m.id ) = f.id(+)'
      ''
      '   and (   /* plain label */'
      '           m.fgmulti_id is NULL'
      '         or'
      '           /* vmi */'
      '           s.vmi_fgmulti_id is not NULL '
      '         or'
      '           /* in transit (like verify inventory etc) */'
      '           f.id is not null '
      
        '                and f.shipment_dtl_id_in_transit in (select id f' +
        'rom shipment_dtl where shipments_id = :shipments_id) '
      '                and f.in_transit_origin in (1,2,3))'
      ''
      
        '       /* do not show pallet children - just independent + palle' +
        't labels  */   '
      '   and ( nvl(m.parent_id,0) = 0'
      '         or'
      
        '         m.parent_id > 0 and rf.get_master_label_type( m.parent_' +
        'id ) = '#39'PALLET MIXED LOT'#39')'
      ''
      
        '       /* is a pallet was broken into boxes the pallet qty is se' +
        't to 0 - keep it out of the picklist */'
      '   and m.qty > 0'
      ''
      '   '
      '')
    Left = 36
    Top = 76
    ParamData = <
      item
        Name = 'shipment_dtl_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'batch'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'shipments_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMasterLabelsID: TBCDField
      FieldName = 'ID'
      Origin = 'm.id'
      Visible = False
      Size = 0
    end
    object QryMasterLabelsSERIAL: TStringField
      DisplayLabel = 'Serial #'
      FieldName = 'SERIAL'
      Origin = 'm.serial'
      Size = 13
    end
    object QryMasterLabelsQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QTY'
      Origin = 'm.qty'
      Size = 6
    end
    object QryMasterLabelsLOC_DESC: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOC_DESC'
      Origin = 'm.loc_desc'
      FixedChar = True
      Size = 30
    end
    object QryMasterLabelsFG_LOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 15
      FieldName = 'FG_LOTNO'
      Origin = 'm.fg_lotno'
      FixedChar = True
      Size = 25
    end
  end
end
