object FrmSerialPrintRange: TFrmSerialPrintRange
  Left = 87
  Top = 141
  ClientHeight = 370
  ClientWidth = 662
  Caption = 'Reprint Labels'
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
    Width = 662
    Height = 130
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      662
      130)
    object Label1: TUniLabel
      Left = 11
      Top = 55
      Width = 64
      Height = 13
      Hint = ''
      Caption = 'From Serial #'
      TabOrder = 5
    end
    object Label2: TUniLabel
      Left = 314
      Top = 55
      Width = 52
      Height = 13
      Hint = ''
      Caption = 'To Serial #'
      TabOrder = 6
    end
    object Label3: TUniLabel
      Left = 11
      Top = 80
      Width = 63
      Height = 13
      Hint = ''
      Caption = 'Default Label'
      TabOrder = 7
    end
    object sbtnSearch: TUniSpeedButton
      Left = 295
      Top = 74
      Width = 25
      Height = 25
      Hint = 'Search Default Label'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
        90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
        40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
        00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
        90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
        F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
        A068509050308048308048208038108F4C26B08870A068509058309048308040
        20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
        4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
        FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
        50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
        B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
        F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
        50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
        57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
        C09880B08060A068509050309058409D6842B07860B08870A070508048308048
        20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
        67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
        C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
        20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
        00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
        CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
        37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
        00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
        00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
        00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSearchClick
    end
    object Label4: TUniLabel
      Left = 11
      Top = 106
      Width = 90
      Height = 13
      Hint = ''
      Caption = 'Setup CRW Printer'
      TabOrder = 9
    end
    object Panel42: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 660
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
        Width = 131
        Height = 13
        Hint = ''
        Caption = ' Reprint range of labels'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object Label10: TUniLabel
        Left = 1
        Top = 14
        Width = 178
        Height = 13
        Hint = ''
        Caption = ' Enter range of labels to be reprinted'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        TabOrder = 2
      end
    end
    object edFrom: TUniEdit
      Left = 117
      Top = 51
      Width = 173
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object edTo: TUniEdit
      Left = 390
      Top = 51
      Width = 173
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object Edit1: TUniEdit
      Left = 117
      Top = 77
      Width = 173
      Height = 19
      Hint = ''
      Text = ''
      TabOrder = 3
      Color = clBtnFace
      ReadOnly = True
    end
    object btnApply: TUniButton
      Left = 572
      Top = 49
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Apply'
      Anchors = [akTop, akRight]
      TabOrder = 10
      OnClick = btnApplyClick
    end
    object wwDBComboDlgCRWPrinter: TUniComboBox
      Left = 117
      Top = 102
      Width = 446
      Hint = ''
      Text = ''
      TabOrder = 11
      OnKeyDown = wwDBComboDlgCRWPrinterKeyDown
      OnDropDown = wwDBComboDlgCRWPrinterCustomDlg
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 130
    Width = 662
    Height = 201
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 445
    IQComponents.Grid.Height = 115
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcMasterLabel
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
    IQComponents.Navigator.DataSource = SrcMasterLabel
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 445
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 115
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 93
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 122
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
      end
      item
        FieldName = 'LABEL_MENU_NAME'
        Title.Caption = 'Label'
        Width = 175
        Editor = wwDBGrid1.wwDBComboDlg1
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    ExplicitHeight = 179
    IQControlCount = 1
    IQParents = (
      'wwDBComboDlg1=GridEditorsPanel')
    Marker = 0
    object wwDBComboDlg1: TUniComboBox
      Left = 8
      Top = 8
      Width = 145
      Hint = ''
      Text = 'wwDBComboDlg1'
      TabOrder = 1
      OnCloseUp = wwDBGrid1wwDBComboDlg1CloseUp
      OnDropDown = wwDBComboDlg1CustomDlg
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 331
    Width = 662
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitTop = 309
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 452
      Top = 1
      Width = 209
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
        OnClick = btnCancelClick
      end
      object btnReprint: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Reprint'
        TabOrder = 2
        OnClick = btnReprintClick
      end
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
      'select m.id,'
      '       m.serial,'
      '       m.class,'
      '       m.itemno,'
      '       m.rev,'
      '       m.descrip,'
      '       m.descrip2,'
      '       NVL(m.dispo_scan, '#39'N'#39') as dispo_scan,'
      '       m.shipment_dtl_id,'
      '       m.ps_ticket_rel_id,'
      '       m.ps_ticket_dtl_id,'
      '       m.mfgno,'
      '       m.orderno,'
      '       m.pono,'
      '       m.fg_lotno,'
      '       m.print_date,'
      '       m.scanned,'
      '       m.qty,'
      '       m.parent_id,'
      '       m.loc_desc,'
      '       m.arinvt_id,'
      '       m.sys_date,'
      '       m.user_name,'
      '       l.label_menu_name'
      '  from master_label m,'
      '       lm_labels l'
      ' where m.serial between :from_serial and :to_serial'
      '   and m.lm_labels_id = l.id(+)'
      ' order by m.serial'
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
      Origin = 'MASTER_LABEL.SERIAL'
      Size = 13
    end
    object QryMasterLabelDISPO_SCAN: TStringField
      DisplayLabel = 'In-Inventory'
      DisplayWidth = 10
      FieldName = 'DISPO_SCAN'
      Origin = 'MASTER_LABEL.DISPO_SCAN'
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
      Origin = 'MASTER_LABEL.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryMasterLabelITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 20
      FieldName = 'ITEMNO'
      Origin = 'MASTER_LABEL.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryMasterLabelREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 5
      FieldName = 'REV'
      Origin = 'MASTER_LABEL.REV'
      FixedChar = True
      Size = 15
    end
    object QryMasterLabelDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 27
      FieldName = 'DESCRIP'
      Origin = 'MASTER_LABEL.DESCRIP'
      Size = 100
    end
    object QryMasterLabelQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'MASTER_LABEL.QTY'
      Size = 6
    end
    object QryMasterLabelFG_LOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 10
      FieldName = 'FG_LOTNO'
      Origin = 'MASTER_LABEL.FG_LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryMasterLabelLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 16
      FieldName = 'LOC_DESC'
      Origin = 'MASTER_LABEL.LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object QryMasterLabelMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 16
      FieldName = 'MFGNO'
      Origin = 'MASTER_LABEL.MFGNO'
      Size = 50
    end
    object QryMasterLabelPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 11
      FieldName = 'PONO'
      Origin = 'MASTER_LABEL.PONO'
      Size = 35
    end
    object QryMasterLabelPRINT_DATE: TDateTimeField
      DisplayLabel = 'Print Date'
      DisplayWidth = 18
      FieldName = 'PRINT_DATE'
      Origin = 'MASTER_LABEL.PRINT_DATE'
    end
    object QryMasterLabelSYS_DATE: TDateTimeField
      DisplayLabel = 'System Date'
      DisplayWidth = 18
      FieldName = 'SYS_DATE'
      Origin = 'MASTER_LABEL.SYS_DATE'
    end
    object QryMasterLabelUSER_NAME: TStringField
      DisplayLabel = 'User Name'
      DisplayWidth = 35
      FieldName = 'USER_NAME'
      Origin = 'MASTER_LABEL.USER_NAME'
      Size = 35
    end
    object QryMasterLabelDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP2'
      Origin = 'MASTER_LABEL.DESCRIP2'
      Size = 100
    end
    object QryMasterLabelLABEL_MENU_NAME: TStringField
      DisplayLabel = 'Label'
      DisplayWidth = 25
      FieldName = 'LABEL_MENU_NAME'
      Size = 25
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
      Origin = 'MASTER_LABEL.ORDERNO'
      Visible = False
      Size = 15
    end
    object QryMasterLabelSCANNED: TStringField
      DisplayWidth = 1
      FieldName = 'SCANNED'
      Origin = 'MASTER_LABEL.SCANNED'
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
      'btnReprint')
    SecurityCode = 'FRMSERIALPRINTRANGE'
    Left = 53
    Top = 237
  end
  object PrintDialog1: TPrintDialog
    Left = 96
    Top = 236
  end
end
