object FrmRMA_PickLabels: TFrmRMA_PickLabels
  Left = 182
  Top = 233
  ClientHeight = 264
  ClientWidth = 429
  Caption = 'Select from picklist'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 429
    Height = 223
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 427
      Height = 221
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 210
      IQComponents.Grid.Height = 135
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
      IQComponents.HiddenPanel.Left = 210
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 135
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcMasterLabels
      Columns = <
        item
          FieldName = 'SERIAL'
          Title.Caption = 'Serial #'
          Width = 63
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QTY'
          Title.Caption = 'Qty'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOC_DESC'
          Title.Caption = 'Location'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FG_LOTNO'
          Title.Caption = 'Lot #'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitLeft = 2
      ExplicitTop = -3
      Marker = 0
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 223
    Width = 429
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 207
      Top = 1
      Width = 222
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 3
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 114
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object SrcMasterLabels: TDataSource
    DataSet = QryMasterLabels
    Left = 36
    Top = 64
  end
  object QryMasterLabels: TFDQuery
    BeforeOpen = QryMasterLabelsBeforeOpen
    ConnectionName = 'IQFD'
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
      '       work_rma_labels w'
      ' where m.arinvt_id = :arinvt_id'
      '   and w.batch(+) = :batch'
      '   and m.id = w.master_label_id(+)'
      '   and w.id is NULL'
      '   and '
      '        ((:shipment_dtl_id > 0)'
      '          and'
      '         (m.shipment_dtl_id = :shipment_dtl_id )'
      '       or'
      '         (:shipment_dtl_id = 0)'
      '          and'
      '         (NVL(m.shipment_dtl_id, 0) = 0))'
      
        '--         (m.shipment_dtl_id is not NULL or m.ps_ticket_rel_id ' +
        'is not NULL and m.ps_ticket_dtl_id is not NULL ))'
      ''
      '')
    Left = 132
    Top = 77
    ParamData = <
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
        Name = 'shipment_dtl_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMasterLabelsSERIAL: TStringField
      DisplayLabel = 'Serial #'
      DisplayWidth = 9
      FieldName = 'SERIAL'
      Origin = 'm.serial'
      Size = 13
    end
    object QryMasterLabelsQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'm.qty'
      Size = 6
    end
    object QryMasterLabelsLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
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
    object QryMasterLabelsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
end
