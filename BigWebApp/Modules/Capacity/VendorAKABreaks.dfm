object FrmVendorAkaBreaks: TFrmVendorAkaBreaks
  Left = 0
  Top = 0
  ClientHeight = 300
  ClientWidth = 635
  Caption = 'All Vendor AKA Breaks'
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
    Width = 635
    Height = 24
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Alignment = taLeftJustify
    Caption = ''
    object Panel2: TUniPanel
      Left = 400
      Top = 1
      Width = 235
      Height = 22
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = ''
    end
  end
  inline IQSearch1: TIQUniGridControl
    Left = 0
    Top = 24
    Width = 635
    Height = 276
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitTop = 24
    ExplicitWidth = 635
    ExplicitHeight = 276
    inherited PageControl: TUniPageControl
      Width = 635
      Height = 247
    end
    inherited TopToolBar: TUniToolBar
      Width = 635
    end
  end
  object Src: TDataSource
    DataSet = Qry
    Left = 114
    Top = 78
  end
  object Qry: TFDQuery
    Tag = -1
    BeforeOpen = QryBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select av.id as arinvt_vendors_id,'
      '       av.arinvt_id,'
      '       av.vendor_id,'
      '       av.vend_itemno,'
      '       av.vend_descrip,'
      '       av.vend_rev,'
      '       av.lead_days,'
      '       avb.quan,'
      '       avb.qprice,'
      '       avb.price_date,'
      '       avb.effect_date,'
      '       avb.deactive_date,'
      '       avb.id as arinvt_vendors_breaks_id,'
      '       avb.comment1,'
      '       v.vendorno,'
      '       v.company as vendor,'
      '       v.eplant_id,'
      
        '       po_misc_unit_price.IQ_GetPriceBreak_aka( :aQty, av.id ) a' +
        's aka_price'
      '  from ARINVT_VENDORS av,'
      '       ARINVT_VENDORS_BREAKS avb,'
      '       VENDOR v'
      ' where avb.ARINVT_VENDORS_ID = av.id'
      '   and av.vendor_id = v.id   '
      '   and av.arinvt_id = :ArinvtId'
      
        '   and Trunc(sysdate) between NVL(avb.effect_date, trunc(sysdate' +
        ')) and NVL(avb.deactive_date, trunc(sysdate))'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 113
    Top = 102
    ParamData = <
      item
        Name = 'aQty'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ArinvtId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryARINVT_VENDORS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_VENDORS_ID'
      Origin = 'av.id'
      Size = 0
    end
    object QryARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'av.arinvt_id'
      Size = 0
    end
    object QryVENDOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Origin = 'av.vendor_id'
      Size = 0
    end
    object QryVEND_ITEMNO: TStringField
      DisplayLabel = 'Vendor Item#'
      DisplayWidth = 25
      FieldName = 'VEND_ITEMNO'
      Origin = 'av.vend_itemno'
      Size = 25
    end
    object QryVEND_DESCRIP: TStringField
      DisplayLabel = 'Vendor Description'
      DisplayWidth = 35
      FieldName = 'VEND_DESCRIP'
      Origin = 'av.vend_descrip'
      Size = 35
    end
    object QryVEND_REV: TStringField
      DisplayWidth = 15
      FieldName = 'VEND_REV'
      Origin = 'av.vend_rev'
      Size = 15
    end
    object QryLEAD_DAYS: TBCDField
      DisplayLabel = 'Lead days'
      DisplayWidth = 10
      FieldName = 'LEAD_DAYS'
      Origin = 'av.lead_days'
      Size = 0
    end
    object QryQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QUAN'
      Origin = 'avb.quan'
      Size = 2
    end
    object QryQPRICE: TFMTBCDField
      DisplayLabel = 'Price Break'
      DisplayWidth = 10
      FieldName = 'QPRICE'
      Origin = 'avb.qprice'
      Size = 6
    end
    object QryPRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      DisplayWidth = 18
      FieldName = 'PRICE_DATE'
      Origin = 'avb.price_date'
    end
    object QryEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
      Origin = 'avb.effect_date'
    end
    object QryDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'DeActive date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
      Origin = 'avb.deactive_date'
    end
    object QryARINVT_VENDORS_BREAKS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_VENDORS_BREAKS_ID'
      Origin = 'avb.id'
      Size = 0
    end
    object QryCOMMENT1: TStringField
      DisplayWidth = 255
      FieldName = 'COMMENT1'
      Origin = 'avb.comment1'
      Size = 255
    end
    object QryVENDORNO: TStringField
      DisplayLabel = 'Vendor#'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'v.vendorno'
      FixedChar = True
      Size = 10
    end
    object QryVENDOR: TStringField
      DisplayLabel = 'Vendor'
      DisplayWidth = 60
      FieldName = 'VENDOR'
      Origin = 'v.company'
      Size = 60
    end
    object QryEPLANT_ID: TBCDField
      DisplayLabel = 'Vendor Eplant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'v.eplant_id'
      Size = 0
    end
    object QryAKA_PRICE: TFMTBCDField
      FieldName = 'AKA_PRICE'
      Size = 38
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 200
    Top = 88
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
end
