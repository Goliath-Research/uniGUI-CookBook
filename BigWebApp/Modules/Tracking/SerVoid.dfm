object FrmSerialVoid: TFrmSerialVoid
  Left = 87
  Top = 141
  ClientHeight = 377
  ClientWidth = 475
  Caption = 'Void Labels'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 105
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      475
      105)
    object Label1: TUniLabel
      Left = 11
      Top = 55
      Width = 64
      Height = 13
      Hint = ''
      Caption = 'From Serial #'
      TabOrder = 4
    end
    object Label2: TUniLabel
      Left = 11
      Top = 81
      Width = 52
      Height = 13
      Hint = ''
      Caption = 'To Serial #'
      TabOrder = 5
    end
    object Panel42: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 473
      Height = 41
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Style = [fsBold]
      TabOrder = 0
      Caption = ''
      Color = clBtnShadow
      object Label9: TUniLabel
        Left = 1
        Top = 1
        Width = 113
        Height = 13
        Hint = ''
        Caption = ' Void range of labels'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object Label10: TUniLabel
        Left = 1
        Top = 14
        Width = 476
        Height = 13
        Hint = ''
        Caption = 
          ' Enter range of labels to be voided / deleted. Note shipped or i' +
          'n-inventory labels cannot be voided.'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        TabOrder = 2
      end
    end
    object edFrom: TUniEdit
      Left = 88
      Top = 51
      Width = 173
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object edTo: TUniEdit
      Left = 88
      Top = 77
      Width = 173
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object btnApply: TUniButton
      Left = 394
      Top = 52
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Apply'
      Anchors = [akTop, akRight]
      TabOrder = 6
      OnClick = btnApplyClick
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 105
    Width = 475
    Height = 233
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 258
    IQComponents.Grid.Height = 147
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcMasterLabel
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Grid.OnDrawColumnCell = wwDBGrid1DBGridDrawColumnCell
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SrcMasterLabel
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 258
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 147
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 36
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 65
    DataSource = SrcMasterLabel
    Columns = <
      item
        FieldName = 'SERIAL'
        Title.Caption = 'Serial #'
        Width = 63
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DISPO_SCAN'
        Title.Caption = 'In-Inventory'
        Width = 70
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'Is_Shipped'
        Title.Caption = 'Shipped'
        Width = 56
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 28
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Rev'
        Width = 35
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 189
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY'
        Title.Caption = 'Qty'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FG_LOTNO'
        Title.Caption = 'Lot #'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOC_DESC'
        Title.Caption = 'Location'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'Mfg #'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PONO'
        Title.Caption = 'PO #'
        Width = 77
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PRINT_DATE'
        Title.Caption = 'Print Date'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SYS_DATE'
        Title.Caption = 'System Date'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USER_NAME'
        Title.Caption = 'User Name'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext. Description'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    ExplicitHeight = 122
    Marker = 0
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 338
    Width = 475
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitTop = 227
    DesignSize = (
      475
      39)
    object Shape5: TUniPanel
      Left = 9
      Top = 14
      Width = 10
      Height = 11
      Hint = 'Label is in-inventory or has been shipped - will not be voided'
      ShowHint = True
      ParentShowHint = False
      TabOrder = 1
      Caption = ''
    end
    object btnVoid: TUniButton
      Left = 306
      Top = 7
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Void'
      Anchors = [akTop, akRight]
      TabOrder = 2
      OnClick = btnVoidClick
    end
    object btnCancel: TUniButton
      Left = 393
      Top = 7
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
  end
  object SrcMasterLabel: TDataSource
    DataSet = QryMasterLabel
    Left = 48
    Top = 148
  end
  object QryMasterLabel: TFDQuery
    BeforeOpen = QryMasterLabelBeforeOpen
    OnCalcFields = QryMasterLabelCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       serial,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip,'
      '       descrip2,'
      '       NVL(dispo_scan, '#39'N'#39') as dispo_scan,'
      '       shipment_dtl_id,'
      '       ps_ticket_rel_id,'
      '       ps_ticket_dtl_id,'
      '       mfgno,'
      '       orderno,'
      '       pono,'
      '       fg_lotno,'
      '       print_date,'
      '       scanned,'
      '       qty,'
      '       parent_id,'
      '       loc_desc,'
      '       arinvt_id,'
      '       sys_date,'
      '       user_name'
      '  from master_label'
      ' where serial between :from_serial and :to_serial'
      ' order by serial'
      ' '
      ' ')
    Left = 48
    Top = 171
    ParamData = <
      item
        Name = 'from_serial'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'to_serial'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryMasterLabelSERIAL: TStringField
      DisplayLabel = 'Serial #'
      DisplayWidth = 9
      FieldName = 'SERIAL'
      Origin = 'IQ.MASTER_LABEL.SERIAL'
      Size = 13
    end
    object QryMasterLabelDISPO_SCAN: TStringField
      DisplayLabel = 'In-Inventory'
      DisplayWidth = 10
      FieldName = 'DISPO_SCAN'
      Origin = 'IQ.MASTER_LABEL.DISPO_SCAN'
      FixedChar = True
      Size = 1
    end
    object QryMasterLabelIs_Shipped: TStringField
      DisplayLabel = 'Shipped'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'Is_Shipped'
      Size = 1
      Calculated = True
    end
    object QryMasterLabelCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'IQ.MASTER_LABEL.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryMasterLabelITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 20
      FieldName = 'ITEMNO'
      Origin = 'IQ.MASTER_LABEL.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryMasterLabelREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 5
      FieldName = 'REV'
      Origin = 'IQ.MASTER_LABEL.REV'
      FixedChar = True
      Size = 15
    end
    object QryMasterLabelDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 27
      FieldName = 'DESCRIP'
      Origin = 'IQ.MASTER_LABEL.DESCRIP'
      Size = 100
    end
    object QryMasterLabelQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'IQ.MASTER_LABEL.QTY'
      Size = 6
    end
    object QryMasterLabelFG_LOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 10
      FieldName = 'FG_LOTNO'
      Origin = 'IQ.MASTER_LABEL.FG_LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryMasterLabelLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 16
      FieldName = 'LOC_DESC'
      Origin = 'IQ.MASTER_LABEL.LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object QryMasterLabelMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 16
      FieldName = 'MFGNO'
      Origin = 'IQ.MASTER_LABEL.MFGNO'
      Size = 50
    end
    object QryMasterLabelPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 11
      FieldName = 'PONO'
      Origin = 'IQ.MASTER_LABEL.PONO'
      Size = 35
    end
    object QryMasterLabelPRINT_DATE: TDateTimeField
      DisplayLabel = 'Print Date'
      DisplayWidth = 18
      FieldName = 'PRINT_DATE'
      Origin = 'IQ.MASTER_LABEL.PRINT_DATE'
    end
    object QryMasterLabelSYS_DATE: TDateTimeField
      DisplayLabel = 'System Date'
      DisplayWidth = 18
      FieldName = 'SYS_DATE'
      Origin = 'IQ.MASTER_LABEL.SYS_DATE'
    end
    object QryMasterLabelUSER_NAME: TStringField
      DisplayLabel = 'User Name'
      DisplayWidth = 35
      FieldName = 'USER_NAME'
      Origin = 'IQ.MASTER_LABEL.USER_NAME'
      Size = 35
    end
    object QryMasterLabelDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryMasterLabelSHIPMENT_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENT_DTL_ID'
      Origin = 'IQ.MASTER_LABEL.SHIPMENT_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLabelPS_TICKET_REL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PS_TICKET_REL_ID'
      Origin = 'IQ.MASTER_LABEL.PS_TICKET_REL_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLabelPS_TICKET_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PS_TICKET_DTL_ID'
      Origin = 'IQ.MASTER_LABEL.PS_TICKET_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLabelORDERNO: TStringField
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 'IQ.MASTER_LABEL.ORDERNO'
      Visible = False
      Size = 15
    end
    object QryMasterLabelSCANNED: TStringField
      DisplayWidth = 1
      FieldName = 'SCANNED'
      Origin = 'IQ.MASTER_LABEL.SCANNED'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryMasterLabelPARENT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_ID'
      Origin = 'IQ.MASTER_LABEL.PARENT_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLabelARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.MASTER_LABEL.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLabelID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.MASTER_LABEL.ID'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnVoid')
    SecurityCode = 'FRMSERIALVOID'
    Left = 67
    Top = 239
  end
end
