object FrmPhilips: TFrmPhilips
  Left = 561
  Top = 214
  ClientHeight = 88
  ClientWidth = 296
  Caption = 'Phillips conversion'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  OnCreate = UniFormCreate
  DesignSize = (
    296
    88)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 7
    Top = 17
    Width = 16
    Height = 13
    Hint = ''
    Caption = 'File'
    TabOrder = 1
  end
  object Label2: TUniLabel
    Left = 6
    Top = 67
    Width = 111
    Height = 13
    Hint = ''
    Caption = 'Processing, please wait'
    TabOrder = 2
  end
  object sbChangeDir: TUniSpeedButton
    Left = 265
    Top = 12
    Width = 27
    Height = 25
    Hint = 'Find Remitance report'
    ParentShowHint = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    Caption = ''
    ParentColor = False
    Color = clWindow
    OnClick = sbChangeDirClick
  end
  object edFile: TUniEdit
    Left = 32
    Top = 14
    Width = 225
    Height = 19
    Hint = ''
    Text = ''
    TabOrder = 0
    Color = clBtnFace
    ReadOnly = True
  end
  object btnProcess: TUniButton
    Left = 139
    Top = 59
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&Process'
    Anchors = [akRight, akBottom]
    TabOrder = 4
    OnClick = btnProcessClick
  end
  object btnCancel: TUniButton
    Left = 219
    Top = 59
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&Close'
    Anchors = [akRight, akBottom]
    TabOrder = 5
    OnClick = btnCancelClick
  end
  object Qry: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.arcusto_custno as customer_number,'
      '       o.pono as  pono,'
      '       d.arinvt_itemno as itemno,'
      '       NVL(sd.qtyshipped, 0) as qtyshipped,'
      '       NVL(d.unit_price, 0) as unit_price'
      '  from arinvoice_detail d,'
      '       arinvoice a,'
      '       shipment_dtl sd,'
      '       shipments s,'
      '       ord_detail od,'
      '       orders o'
      ' where a.glbatchid_id = :NID'
      '   and a.id = d.arinvoice_id'
      '   and d.shipment_dtl_id = sd.id(+)'
      '   and sd.shipments_id = s.id(+)'
      '   and d.ord_detail_id = od.id(+)'
      '   and od.orders_id = o.id(+)'
      ' order by a.id'
      ''
      ''
      ''
      ''
      '  '
      ' ')
    Left = 176
    Top = 8
    ParamData = <
      item
        Name = 'NID'
        DataType = ftString
      end>
    object QryCUSTOMER_NUMBER: TStringField
      FieldName = 'CUSTOMER_NUMBER'
      Size = 10
    end
    object QryPONO: TStringField
      FieldName = 'PONO'
    end
    object QryITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 25
    end
    object QryQTYSHIPPED: TFloatField
      FieldName = 'QTYSHIPPED'
    end
    object QryUNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
  end
end
