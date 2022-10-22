object FrmCostAllocAP: TFrmCostAllocAP
  Left = 79
  Top = 191
  HelpContext = 14500
  ClientHeight = 319
  ClientWidth = 696
  Caption = 'Freight Cost Allocation'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 58
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      696
      58)
    object Label8: TUniLabel
      Left = 8
      Top = 12
      Width = 37
      Height = 13
      Hint = ''
      Caption = 'Ship Via'
      TabOrder = 4
    end
    object Label1: TUniLabel
      Left = 10
      Top = 37
      Width = 34
      Height = 13
      Hint = ''
      Caption = 'Freight'
      TabOrder = 5
    end
    object Label2: TUniLabel
      Left = 372
      Top = 12
      Width = 123
      Height = 13
      Hint = ''
      Caption = 'Cost Allocation Technique'
      Anchors = [akTop, akRight]
      TabOrder = 6
    end
    object SBSearchTech: TUniSpeedButton
      Left = 674
      Top = 7
      Width = 22
      Height = 22
      Hint = 'Cost Allocation Technique'
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
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = SBSearchTechClick
    end
    object sbShipSearch: TUniSpeedButton
      Left = 324
      Top = 6
      Width = 24
      Height = 22
      Hint = 'Search Ship Via'
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
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = sbShipSearchClick
    end
    object EdFreight: TUniEdit
      Left = 53
      Top = 33
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 0
    end
    object EdTech: TUniEdit
      Left = 521
      Top = 9
      Width = 150
      Height = 19
      Hint = ''
      Text = ''
      Anchors = [akTop, akRight]
      TabOrder = 1
      Color = clBtnFace
      ReadOnly = True
    end
    object EdShipVia: TUniEdit
      Left = 52
      Top = 9
      Width = 263
      Height = 19
      Hint = ''
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Color = clBtnFace
      ReadOnly = True
    end
    object sbAlloc: TUniButton
      Left = 519
      Top = 33
      Width = 178
      Height = 25
      Hint = ''
      Caption = 'Allocate Freight Cost'
      Anchors = [akTop, akRight]
      TabOrder = 9
      OnClick = sbAllocClick
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 58
    Width = 696
    Height = 261
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 479
    IQComponents.Grid.Height = 175
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = Src
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
    IQComponents.Navigator.DataSource = Src
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 479
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 175
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = Src
    Columns = <
      item
        FieldName = 'QTY_INVOICED'
        Title.Caption = 'Invoiced'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FREIGHT_PRICE'
        Title.Caption = 'Freight'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'AMOUNT_BEFORE_TAX'
        Title.Caption = 'Amount'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FREIGHT_COMP'
        Title.Caption = 'Ship Via'
        Width = 55
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEM_DESCRIP'
        Title.Caption = 'Description'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEM_ITEMNO'
        Title.Caption = 'Item#'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext. Description'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 184
    Top = 88
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object AllocateFreightCost1: TUniMenuItem
        Caption = '&Allocate Freight Cost'
        OnClick = sbAllocClick
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'AP Freight Cost Allocation'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196369 $'
    BuildVersion = '176554'
    Left = 232
    Top = 88
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'AllocateFreightCost1'
      'EdFreight'
      'sbAlloc'
      'SBSearchTech'
      'wwComboFreight'
      'EdShipVia'
      'sbShipSearch')
    SecurityCode = 'FRMCOSTALLOCAP'
    Left = 280
    Top = 88
  end
  object QryRec: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id,'
      '       a.amount_before_tax,'
      '       a.amount_distributed,'
      '       a.qty_invoiced,'
      '       a1.descrip2,'
      
        '       nvl(a1.itemno , nvl(d.misc_itemno, vrd.arinvt_itemno )) a' +
        's item_itemno,'
      
        '       nvl(a1.descrip, nvl(d.misc_item  , vrd.arinvt_descrip)) a' +
        's item_descrip,'
      '       a.freight_price,'
      '       fr.descrip as Freight_Comp'
      '  from apprepost_detail a,'
      '       glacct g,'
      '       glacct g2,'
      '       v_tax_codes vt,'
      '       v_ref_code rf,'
      '       vendor_rma_detail vrd,'
      '       PO_DETAIL d,'
      '       ARINVT a1,'
      '       C_PO_RECEIPTS_TOTAL p,'
      '       C_APINV_DTL_PO_TOTAL i,'
      '       po po,'
      '       freight fr'
      ' where a.glacct_id_expense = g.id(+)'
      '   and a.ref_code_id = rf.ref_code_id(+)'
      '   and a.glacct_id_ppv = g2.id(+)'
      '   and a.tax_code_id = vt.id(+)'
      '   and a.vendor_rma_detail_id = vrd.id(+)'
      '   and d.arinvt_id = a1.id(+)'
      '   and d.id = i.po_detail_id(+)'
      '   and d.id = p.po_detail_id(+)'
      '   and a.po_detail_id = d.id(+)'
      '   and d.po_id = po.id(+)'
      '   and a.freight_id = fr.id(+)'
      '   and apprepost_id = :aId')
    Left = 112
    Top = 202
    ParamData = <
      item
        Name = 'AId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryRecQTY_INVOICED: TBCDField
      DisplayLabel = 'Invoiced'
      DisplayWidth = 10
      FieldName = 'QTY_INVOICED'
      Origin = 'a.QTY_INVOICED'
    end
    object QryRecFREIGHT_PRICE: TBCDField
      DisplayLabel = 'Freight'
      DisplayWidth = 10
      FieldName = 'FREIGHT_PRICE'
      Origin = 'a.FREIGHT_PRICE'
      Size = 2
    end
    object QryRecAMOUNT_BEFORE_TAX: TBCDField
      DisplayLabel = 'Amount'
      DisplayWidth = 10
      FieldName = 'AMOUNT_BEFORE_TAX'
      Origin = 'a.AMOUNT_BEFORE_TAX'
      Size = 2
    end
    object QryRecFREIGHT_COMP: TStringField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 30
      FieldName = 'FREIGHT_COMP'
      Origin = 'fr.descrip'
      Size = 60
    end
    object QryRecITEM_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'ITEM_DESCRIP'
      Origin = 
        'decode(a.vendor_rma_detail_id, null, decode(NVL(d.arinvt_id, 0),' +
        ' 0, misc_item, a1.descrip), vrd.arinvt_descrip)'
      Size = 100
    end
    object QryRecITEM_ITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 15
      FieldName = 'ITEM_ITEMNO'
      Origin = 
        'decode(a.vendor_rma_detail_id, null, decode(NVL(d.arinvt_id, 0),' +
        ' 0, '#39'Misc. Item'#39', a1.itemno), vrd.arinvt_itemno)'
      Size = 50
    end
    object QryRecDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP2'
      Origin = 'a1.DESCRIP2'
      Size = 100
    end
    object QryRecID: TBCDField
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object QryRecAMOUNT_DISTRIBUTED: TBCDField
      FieldName = 'AMOUNT_DISTRIBUTED'
      Origin = 'a.AMOUNT_DISTRIBUTED'
      Visible = False
      Size = 2
    end
  end
  object Src: TDataSource
    DataSet = QryRec
    Left = 112
    Top = 160
  end
  object PkFreight: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       scac_iata_code,'
      '       code_qualifier,'
      '       transport_code,'
      '       equip_owners_code,'
      '       comment1'
      '  from freight')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 352
    Top = 80
    object PkFreightID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FREIGHT.ID'
      Visible = False
      Size = 0
    end
    object PkFreightDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.FREIGHT.DESCRIP'
      Size = 60
    end
    object PkFreightSCAC_IATA_CODE: TStringField
      DisplayLabel = 'SCAC IATA'
      FieldName = 'SCAC_IATA_CODE'
      Origin = 'IQ.FREIGHT.SCAC_IATA_CODE'
      FixedChar = True
      Size = 17
    end
    object PkFreightCODE_QUALIFIER: TStringField
      DisplayLabel = 'Code Qualifier'
      FieldName = 'CODE_QUALIFIER'
      Origin = 'IQ.FREIGHT.CODE_QUALIFIER'
      Size = 6
    end
    object PkFreightTRANSPORT_CODE: TStringField
      DefaultExpression = 'Transportation Method Code'
      DisplayLabel = 'Transportation Method Code'
      FieldName = 'TRANSPORT_CODE'
      Origin = 'IQ.FREIGHT.TRANSPORT_CODE'
      Size = 6
    end
    object PkFreightEQUIP_OWNERS_CODE: TStringField
      DisplayLabel = 'Equipment Owners Code'
      FieldName = 'EQUIP_OWNERS_CODE'
      Origin = 'IQ.FREIGHT.EQUIP_OWNERS_CODE'
      Size = 4
    end
    object PkFreightCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      FieldName = 'COMMENT1'
      Origin = 'IQ.FREIGHT.COMMENT1'
      Size = 50
    end
  end
  object PkProc: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select distinct object_name as object_name'
      '  from all_arguments'
      ' where owner = '#39'IQMS'#39
      '   and package_name = '#39'FREIGHT_COST_ALLOC'#39' '
      '   and substr(object_name, 1, 3) = '#39'BY_'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 400
    Top = 79
    object PkProcOBJECT_NAME: TStringField
      DisplayLabel = 'Procedure'
      FieldName = 'OBJECT_NAME'
      Origin = 'IQ.ALL_ARGUMENTS.OBJECT_NAME'
      Size = 30
    end
  end
end
