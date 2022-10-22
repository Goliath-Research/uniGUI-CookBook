object FrmForecastRelExcept: TFrmForecastRelExcept
  Left = 218
  Top = 200
  ClientHeight = 267
  ClientWidth = 481
  Caption = 'Warning'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 230
    Width = 481
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Shape3: TUniPanel
      Left = 8
      Top = 9
      Width = 11
      Height = 11
      Hint = ''
      ParentShowHint = False
      TabOrder = 2
      Caption = ''
    end
    object Label5: TUniLabel
      Left = 24
      Top = 8
      Width = 90
      Height = 13
      Hint = ''
      Caption = '- Forecast Release'
      TabOrder = 3
    end
    object Panel3: TUniPanel
      Left = 273
      Top = 1
      Width = 208
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 103
        Top = 6
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
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 95
    Width = 481
    Height = 135
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 264
    IQComponents.Grid.Height = 49
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwSrcReleases
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
    IQComponents.Navigator.DataSource = wwSrcReleases
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 264
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 49
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = wwSrcReleases
    Columns = <
      item
        FieldName = 'SEQ'
        Title.Caption = 'Sequence #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FORECAST'
        Title.Caption = 'Forecast'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'QUAN'
        Title.Caption = 'Quantity'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REQUEST_DATE'
        Title.Caption = 'Request Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROMISE_DATE'
        Title.Caption = 'Promised Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSER1'
        Title.Caption = 'User Note'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object PnlPrompt: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 481
    Height = 95
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object Panel4: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 53
      Height = 93
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ParentColor = True
      object Image1: TUniImage
        Left = 8
        Top = 8
        Width = 32
        Height = 32
        Hint = ''
        Center = True
        AutoSize = True
        Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C0000C40E0000C40E0000000000000000
          0000FF00FF9797976D6D6D666666666666666666666666666666666666666666
          6666666666666666666666666666666666666666666666666666666666666666
          666666666666666666666666666666666666666666666666666C6C6C969696FF
          00FF9B9B9B47799D1897F3129BFE129BFE129BFE129BFE129BFE129BFE129BFE
          129BFE129BFE129BFE129AFE129BFE129BFE129AFE129AFE129AFE129AFE129A
          FE1299FE1299FE129AFE129AFE1299FE129AFE1199FE1197FE1390F544769F9B
          9B9B71717126A6EF20B1FF21B2FF21B2FF21B2FF21B2FF20B1FF20B2FF21B1FF
          20B1FF20B1FF20B1FF1FADFB4580A363686A62686C4581A520ABF920B0FF20B0
          FF1FB0FF20AFFF1FB0FF1FAFFF1FAFFF1FAFFF1FAFFF1CABFF16A1FF1891EE71
          717175757530B1E929C0FF29BFFF29BFFF29BEFF29BFFF29BEFF28BEFF29BEFF
          29BEFF29BEFF28BCFE4A84A18F8F8FB9B9B9B2B2B28888884A829F27BCFE28BD
          FF27BCFF28BDFF28BCFF27BCFF27BCFF27BCFF27BCFF25B9FF1DACFF2291E07B
          7B7B9999994895B32CC4FF2CC3FF2CC3FF2CC3FF2BC3FF2BC2FF2CC3FF2BC3FF
          2BC2FF2BC2FF2FB8F0727272E5E5E5D6D6D6C3C3C3B7B7B771717131B1E72AC1
          FF29C1FF2AC0FF2AC1FF2AC0FF2AC0FF2ABFFF29C0FF27BDFF1FB0FF437EA6A1
          A1A1C3C3C3636A6D35BEEF2FC8FF2FC7FF2FC8FF2FC7FF2EC7FF2EC7FF2EC7FF
          2EC6FF2DC7FF38AEDB868686FFFFFFFFFFFFE4E4E4C7C7C78282823DA2CB2DC5
          FF2DC5FF2CC4FF2CC4FF2CC5FF2CC4FF2CC5FF2CC4FF27BDFF26A3E964676AC9
          C9C9FF00FF9B9B9B5090A532CDFF32CCFF32CDFF31CCFF31CCFF31CCFF31CCFF
          31CBFF31CBFF33C0F1717171FAFAFAFFFFFFFFFFFFE4E4E475757536B9E730CA
          FF2FCAFF2FC9FF2FC9FF30C9FF2FC9FF2FC9FF2DC7FF24BBFF4F7A939F9F9FFF
          00FFFF00FFCBCBCB6567683EBEE236D2FF36D1FF36D1FF35D1FF35D0FF35D0FF
          35D0FF34D0FF34CFFE4D8CA3A0A0A0F4F4F4F2F2F2A1A1A14E899F34CDFE33CF
          FF33CFFF33CEFF33CEFF33CEFF33CDFF31CCFF2CC5FF349DD2848484FF00FFFF
          00FFFF00FFFF00FFA3A3A35B808A3AD6FF3AD6FF3AD6FF3AD5FF3AD5FF39D5FF
          39D5FF39D5FF39D5FF38D0FC4D92A9626B6F616C704C93AA36CFFB37D4FF37D3
          FF37D3FF37D3FF37D3FF36D2FF37D3FF34CFFF29BEFB5B707BAEAEAEFF00FFFF
          00FFFF00FFFF00FFFF00FF8A8A8A4DB0C93FDAFF3FDAFF3FDAFF3FDAFF3EDAFF
          3ED9FF3ED9FF3ED9FF3ED9FF3DD9FF3DD9FF3DD8FF3CD9FF3CD8FF3CD8FF3DD8
          FF3CD8FF3BD7FF3CD7FF3BD7FF3BD6FF32CCFF3E97C0909090FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFB4B4B462727646DAFA45DEFF45DEFF44DDFF44DEFF
          44DDFF44DDFF44DDFF5692A1666666666666666666636B6D5398AA42DCFF42DB
          FF42DCFF41DBFF41DCFF41DCFF3CD6FF31BFF4616C71BABABAFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF93939357A7B74CE1FF4CE1FF4BE1FF4BE1FF
          4AE0FF4AE0FF4AE0FF666666D2D2D2C1C1C1B8B8B8B0B0B0646B6D49E0FF48DF
          FF48DFFF47E0FF47DFFF45DDFF39D2FF4C8BA5979797FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFC0C0C0656C6D55D7EF52E3FF52E4FF52E3FF
          52E4FF51E4FF51E3FF666666F3F3F3DDDDDDC4C4C4B2B2B2646B6D4FE3FF4FE3
          FF4EE3FF4EE3FF4DE3FF45DAFF3CB6E2656768CBCBCBFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9B61929C5BE7FF5BE6FF5AE6FF
          59E6FF59E6FF59E6FF666666FFFFFFF9F9F9D5D5D5B6B6B6646B6D57E5FF56E5
          FF57E5FF56E5FF51E2FF40D3FF587B8AA3A3A3FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7E7E7E64C9DB64E9FF63E9FF
          63E9FF62E9FF63E9FF666666FFFFFFFFFFFFDCDCDCB8B8B8646B6D60E8FF5FE8
          FF5FE8FF5EE7FF51DEFF48A9CB898989FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA8A8A8667E836EECFF6EEBFF
          6DEBFF6DEBFF6DEBFF666666FFFFFFFFFFFFDCDCDCB8B8B8656B6D6AEBFF69EA
          FF69EAFF61E5FF4BD2FB5E737BB3B3B3FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A8A8A71BDC978EEFF
          78EDFF77EEFF77EEFF666666FFFFFFFFFFFFDCDCDCB8B8B8656B6D74ECFF74ED
          FF71EBFF5FE0FF529CB7939393FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4B4B468747682E9F8
          83F0FF83EFFF82F0FF666666FFFFFFFFFFFFDCDCDCB8B8B8666B6D7FEFFF7EEF
          FF74E8FF57CAEF646A6DC0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF95959577A6AE
          8EF2FF8EF1FF8DF2FF666666FFFFFFFFFFFFE5E5E5BCBCBC666B6D8BF1FF85EE
          FF6DE1FF5B8A9C9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C667696A
          91E0E998F4FF98F3FF666666FFFFFFFFFFFFFFFFFFCFCFCF676B6D94F2FF83EB
          FF60BCDB7E7E7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9F
          779195A3F5FFA3F5FF666666FFFFFFFFFFFFFFFFFFF0F0F0686C6D98F1FF77E2
          FF617B84A8A8A8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          7E7E7E9BD4DBACF7FF7E9CA1666666666666666666686C6D80A4AA90ECFF64AE
          C98A8A8AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          A8A8A8738183B3F6FDB4F8FFB4F8FFB3F9FFB3F9FFB3F8FFA6F3FF7DDCF86471
          76B4B4B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF90909097BCC0BCFAFFBBFAFFBAFAFFBBFAFFB6F8FF98EBFF669BAE9595
          95FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFBABABA6B7071BAF0F4C0FBFFC0FBFFBFFBFFADF3FF7BD0E966686AC6C6
          C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF9797978AA4A7C1FBFFC1FBFFBAF8FF95E9FF6587939F9F9FFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFC9C9C968696AB3E6E9BFFAFFA9F1FF73BED7818181FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF9F9F9F788688AAE4ED86D2E864777DABABABFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF9C9C9C7272727575759F9F9FFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF}
        Transparent = True
      end
    end
    object Panel5: TUniPanel
      Tag = 1999
      Left = 53
      Top = 1
      Width = 428
      Height = 93
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ParentColor = True
      object Label6: TUniLabel
        Left = 8
        Top = 8
        Width = 191
        Height = 13
        Hint = ''
        Caption = 'Order line includes Forecast Release(s).'
        TabOrder = 1
      end
      object Label1: TUniLabel
        Left = 32
        Top = 32
        Width = 44
        Height = 13
        Hint = ''
        Caption = 'Order #'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object Edit1: TUniDBText
        Left = 120
        Top = 32
        Width = 24
        Height = 13
        Hint = ''
        DataField = 'ORDERNO'
        DataSource = SrcOrdLine
      end
      object Label3: TUniLabel
        Left = 32
        Top = 48
        Width = 40
        Height = 13
        Hint = ''
        Caption = 'Item #'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 4
      end
      object Edit3: TUniDBText
        Left = 120
        Top = 48
        Width = 24
        Height = 13
        Hint = ''
        DataField = 'ITEMNO'
        DataSource = SrcOrdLine
      end
      object Label4: TUniLabel
        Left = 32
        Top = 64
        Width = 64
        Height = 13
        Hint = ''
        Caption = 'Description'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 6
      end
      object Edit4: TUniDBText
        Left = 120
        Top = 64
        Width = 24
        Height = 13
        Hint = ''
        DataField = 'DESCRIP'
        DataSource = SrcOrdLine
      end
    end
  end
  object SrcOrdLine: TDataSource
    DataSet = QryOrdLine
    Left = 152
    Top = 176
  end
  object QryOrdLine: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.id as ord_detail_id,'
      '       o.id as orders_id,'
      '       o.orderno,'
      '       decode(d.arinvt_id, NULL, misc_item, a.itemno) as itemno,'
      '       a.descrip,'
      '       decode(d.arinvt_id, NULL, d.ecode, a.ecode) as ecode'
      '  from orders o,'
      '       ord_detail d,'
      '       arinvt a'
      ' where d.id = :ord_detail_id'
      '   and o.id = d.orders_id'
      '   and d.arinvt_id = a.id(+)')
    Left = 160
    Top = 192
    ParamData = <
      item
        Name = 'ord_detail_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryOrdLineORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Size = 0
    end
    object QryOrdLineORDERS_ID: TBCDField
      FieldName = 'ORDERS_ID'
      Size = 0
    end
    object QryOrdLineITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 250
    end
    object QryOrdLineDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryOrdLineECODE: TStringField
      FieldName = 'ECODE'
      Size = 10
    end
    object QryOrdLineORDERNO: TStringField
      FieldName = 'ORDERNO'
      Size = 15
    end
  end
  object wwSrcReleases: TDataSource
    DataSet = wwQryReleases
    Left = 216
    Top = 176
  end
  object wwQryReleases: TFDQuery
    MasterSource = SrcOrdLine
    MasterFields = 'ORD_DETAIL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       seq,'
      '       request_date,'
      '       promise_date,'
      '       quan,'
      '       forecast,'
      '       cuser1'
      '  from releases'
      ' where ord_detail_id = :ord_detail_id'
      ' order by seq')
    Left = 224
    Top = 192
    ParamData = <
      item
        Name = 'ORD_DETAIL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object wwQryReleasesSEQ: TBCDField
      DisplayLabel = 'Sequence #'
      DisplayWidth = 9
      FieldName = 'SEQ'
      Origin = 'RELEASES.SEQ'
      Size = 0
    end
    object wwQryReleasesFORECAST: TStringField
      DisplayLabel = 'Forecast'
      DisplayWidth = 8
      FieldName = 'FORECAST'
      Origin = 'RELEASES.FORECAST'
      Size = 1
    end
    object wwQryReleasesQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 9
      FieldName = 'QUAN'
      Origin = 'RELEASES.QUAN'
    end
    object wwQryReleasesREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Request Date'
      DisplayWidth = 12
      FieldName = 'REQUEST_DATE'
      Origin = 'RELEASES.REQUEST_DATE'
    end
    object wwQryReleasesPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Promised Date'
      DisplayWidth = 13
      FieldName = 'PROMISE_DATE'
      Origin = 'RELEASES.PROMISE_DATE'
    end
    object wwQryReleasesCUSER1: TStringField
      DisplayLabel = 'User Note'
      DisplayWidth = 13
      FieldName = 'CUSER1'
      Origin = 'RELEASES.CUSER1'
      Size = 255
    end
    object wwQryReleasesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'RELEASES.ID'
      Visible = False
      Size = 0
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmForecastRelExcept')
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMFORECASTRELEXCEPT'
    Left = 200
    Top = 232
  end
end
