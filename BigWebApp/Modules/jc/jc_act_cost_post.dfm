object FrmJC_ActCostPost: TFrmJC_ActCostPost
  Left = 0
  Top = 0
  HelpContext = 16451
  ClientHeight = 434
  ClientWidth = 967
  Caption = 'Actual Cost Posting'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 967
    Height = 434
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 1
      Top = 1
      Width = 965
      Height = 432
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 0
        Top = 233
        Width = 965
        Height = 4
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object Panel2: TUniPanel
        Left = 1
        Top = 28
        Width = 963
        Height = 205
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object srchArinvoiceDetail: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 961
          Height = 203
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 744
          IQComponents.Grid.Height = 117
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcLotSumArinvoiceDetail
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
          IQComponents.Navigator.DataSource = SrcLotSumArinvoiceDetail
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 744
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 117
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcLotSumArinvoiceDetail
          Columns = <
            item
              FieldName = 'ITEMNO'
              Title.Caption = 'Item #'
              Width = 140
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Item Description'
              Width = 147
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QTY'
              Title.Caption = 'Qty'
              Width = 105
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'TOTAL_ACT_COST'
              Title.Caption = 'Total Act Cost'
              Width = 105
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'TOTAL_STD_COST'
              Title.Caption = 'Total Std Cost'
              Width = 105
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'INVOICE_NO'
              Title.Caption = 'Invoice #'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACCT'
              Title.Caption = 'GLAccount'
              Width = 168
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STD_COST'
              Title.Caption = 'Std Cost'
              Width = 105
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACT_COST'
              Title.Caption = 'Act Cost'
              Width = 105
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP2'
              Title.Caption = 'Item Ext Description'
              Width = 175
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CLASS'
              Title.Caption = 'Class'
              Width = 28
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REV'
              Title.Caption = 'Item Rev'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LOTNO'
              Title.Caption = 'Lot #'
              Width = 175
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'INVOICE_DATE'
              Title.Caption = 'Invoice Date'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
      object Panel4: TUniPanel
        Left = 1
        Top = 237
        Width = 963
        Height = 195
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object wwDBGridCostElement: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 961
          Height = 193
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 744
          IQComponents.Grid.Height = 107
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcCost_Elements
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
          IQComponents.Navigator.DataSource = SrcCost_Elements
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 744
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 107
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcCost_Elements
          Columns = <
            item
              FieldName = 'ELEM_DESCRIP'
              Title.Caption = 'Cost Element'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STD_COST'
              Title.Caption = 'Std Cost'
              Width = 119
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACT_COST'
              Title.Caption = 'Act Cost'
              Width = 119
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CostVar'
              Title.Caption = 'Variance'
              Width = 119
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACCT'
              Title.Caption = 'GLAccount'
              Width = 217
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Ext_Cost'
              Title.Caption = 'Extended Cost'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
      object Panel3: TUniPanel
        Left = 1
        Top = 1
        Width = 963
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
        object sbtnLotCostSummary: TUniSpeedButton
          Left = 1
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Print lot cost summary'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            1800000000000006000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAB395
            8068508060508060507060507058407058407050407050406048306048306048
            30AF8C6FFF00FFFF00FFFF00FFB1B1B16565656060606060605E5E5E56565656
            56565050505050504646464646464646468A8A8AFF00FFFF00FFD3B39AA48B82
            E0D0C0B0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0
            90604830FF00FFFF00FFB1B1B18B8B8BCECECE9E9E9E9E9E9E9E9E9E9E9E9E9E
            9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E464646FF00FFFF00FFC8AD97B39B91
            FFE8E0FFF8F0FFF0E0FFE8E0F0D8D0F0D0B0F0C0A000A00000A00000A0007058
            406048308D7057FF00FFABABAB9B9B9BE9E9E9F7F7F7EEEEEEE9E9E9D9D9D9CD
            CDCDBEBEBE8A8A8A8A8A8A8A8A8A5656564646466E6E6EFF00FFB49383E0D8D0
            FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E0E0F0D8C000FF1000FFB000A0008068
            50705040604830FF00FF939393D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2E2
            E2E2D5D5D5DCDCDCE8E8E88A8A8A656565505050464646FF00FFB09080F0E8E0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E000FF1000FF1000A0009070
            60706050604830FF00FF8F8F8FE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7E7E7E7DCDCDCDCDCDC8A8A8A7070705E5E5E464646FF00FFB09880D0C0B0
            D0B8B0C0B0A0B0A090B09880A088809080709070608068608060507058509080
            70806860705840FF00FF959595BEBEBEB8B8B8AEAEAE9E9E9E9595958888887E
            7E7E7070706868686060605858587E7E7E686868565656FF00FFC0A090FFF8F0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0FFF0F0F0F0F0F0E8E0A088
            80907860806050FF00FFA0A0A0F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF7F7F7F2F2F2F0F0F0E7E7E7888888757575606060FF00FFDFC5AEB9A089
            D0B0A0C0A8A0D0B0A0C0A090B09080A08070907060806050706050807060B0A0
            90A08870806050FF00FFC3C3C39D9D9DAFAFAFA8A8A8AFAFAFA0A0A08F8F8F80
            80807070706060605E5E5E6E6E6E9E9E9E858585606060FF00FFFF00FFD9C3AF
            C0B0A0E0C8C0FFFFFFFFF8FFFFF8FFFFF0F0F0F0E0F0E0E0C0A8A0806050A090
            80C0B0A0806050FF00FFFF00FFC1C1C1AEAEAEC9C9C9FFFFFFFAFAFAFAFAFAF2
            F2F2EDEDEDE2E2E2A8A8A86060608E8E8EAEAEAE606060FF00FFFF00FFFF00FF
            F0D9C5C0B0A0FFFFFFF0E8E0D0C8C0D0C8C0D0B8B0D0C0B0E0D0D08068608060
            50B09890B0A090FF00FFFF00FFFF00FFD7D7D7AEAEAEFFFFFFE7E7E7C7C7C7C7
            C7C7B8B8B8BEBEBED2D2D26868686060609999999E9E9EFF00FFFF00FFFF00FF
            FF00FFE0C8B1F0E8E0FFFFFFFFFFFFFFFFFFFFF8FFFFF0F0F0E0D0D0B8B08060
            50C5AA97FF00FFFF00FFFF00FFFF00FFFF00FFC6C6C6E7E7E7FFFFFFFFFFFFFF
            FFFFFAFAFAF2F2F2DEDEDEB8B8B8606060A9A9A9FF00FFFF00FFFF00FFFF00FF
            FF00FFF6DFCCD0B8B0FFFFFFF0F0F0D0C8C0D0C8C0D0B8B0C0B0B0E0D8D08070
            60876757FF00FFFF00FFFF00FFFF00FFFF00FFDDDDDDB8B8B8FFFFFFF0F0F0C7
            C7C7C7C7C7B8B8B8B1B1B1D7D7D76E6E6E676767FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFE9D1C3E1D1D0FFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0E8E0D0B8
            B0806050EDD5C2FF00FFFF00FFFF00FFFF00FFFF00FFD0D0D0D3D3D3FFFFFFFF
            FFFFFFFFFFFFFFFFFAFAFAE7E7E7B8B8B8606060D4D4D4FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFE9D2C4D0C0B0D0C0B0D0C0B0D0C0B0D0C0B0D0C0B0D0C0
            B0D0C0B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1D1D1BEBEBEBE
            BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbtnLotCostSummaryClick
        end
        object Bevel3: TUniPanel
          Left = 30
          Top = 1
          Width = 2
          Height = 26
          Hint = ''
          TabOrder = 2
          Caption = ''
        end
        object sbtnPrepareGL: TUniSpeedButton
          Left = 34
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Prepare General Journal Entries'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF034464034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A4A4A4A4A4AFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF0344640ED1FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A4A4AD6D6D64A4A4AFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF00669A14D3FF034464FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070D7D7D74A
            4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF0099CC1BD5FF1BD5FF034464FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A1D9D9D9D9
            D9D94A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF00669A22D7FF22D7FF034464FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DA
            DADADADADA4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF00669A00669A00669A29DAFF034464034464034464FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070707070DC
            DCDC4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF00669A30DCFF30DCFF034464FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DEDEDEDE
            DEDE4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF00669A37DEFF37DEFF034464FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DF
            DFDFDFDFDF4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF00669A3DE0FF3DE0FF3DE0FF034464FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E1
            E1E1E1E1E1E1E1E14A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF00669A00669A00669A00669A44E3FF034464034464034464034464FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070707070707070E3
            E3E34A4A4A4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF00669A4BE5FF4BE5FF4BE5FF4BE5FF034464FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E5E5E5E5E5E5E5
            E5E5E5E5E54A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF00669A5CEBFE5CEBFE5CEBFE5CEBFE034464FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E9E9E9E9
            E9E9E9E9E9E9E9E94A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF0099CC00669A70F1FE70F1FE70F1FE70F1FE034464FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A1707070EE
            EEEEEEEEEEEEEEEEEEEEEE4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF0099CC0344640344640344640344640344640344
            64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A14A
            4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbtnPrepareGLClick
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 528
    Top = 72
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Report1: TUniMenuItem
      Caption = 'Report'
      object Print1: TUniMenuItem
        Caption = 'Print'
        OnClick = Print1Click
      end
      object PrintSetup1: TUniMenuItem
        Caption = 'Print Setup'
        OnClick = PrintSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmJC_ActCostPost'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195028 $'
    BuildVersion = '176554'
    Left = 560
    Top = 72
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 590
    Top = 72
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmJC_ActCostPost'
    WebUse = False
    TouchScreen = False
    Left = 622
    Top = 72
  end
  object QryLotSumArinvoiceDetail: TFDQuery
    BeforeOpen = QryLotSumArinvoiceDetailBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select main.id,'
      '       main.arinvoice_detail_id,'
      '       main.lotno, '
      '       main.shipment_dtl_id,'
      '       main.arinvt_id,'
      '       cd.id as process_cost_dtl_id,'
      '       a.standard_id,'
      '       a.acct_id_inv,'
      ''
      '       a.class,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.rev,'
      '       a.descrip2,'
      '       '
      '       /* d.invoice_qty as qty */'
      
        '       decode( d.rma_detail_id, null, decode(sign(d.invoice_qty)' +
        ', -1, -1, 1), -1) * main.qty as qty,'
      '       cd.std_cost,'
      '       cd.act_cost,'
      '       '
      
        '       decode( d.rma_detail_id, null, decode(sign(d.invoice_qty)' +
        ', -1, -1, 1), -1) * nvl(cd.std_cost,0) * main.qty as total_std_c' +
        'ost,'
      
        '       decode( d.rma_detail_id, null, decode(sign(d.invoice_qty)' +
        ', -1, -1, 1), -1) * nvl(cd.act_cost,0) * main.qty as total_act_c' +
        'ost,'
      '       '
      '       i.invoice_no,'
      '       i.invoice_date,'
      '                     '
      '       ( select glacct.acct'
      '           from glacct'
      '          where id = case'
      
        '                       when nvl(iqsys2.post_ship_avait_inv, '#39'N'#39')' +
        ' = '#39'Y'#39' then pit_eval_shipments.GetAcctId_GroupInv(a.id)'
      
        '                       else pit_eval_shipments.GetAcctIdInv(a.id' +
        ') '
      '                      end'
      '       ) as acct,'
      ''
      '       case'
      
        '          when nvl(iqsys2.post_ship_avait_inv, '#39'N'#39') = '#39'Y'#39' then p' +
        'it_eval_shipments.GetAcctId_GroupInv(a.id)'
      '          else pit_eval_shipments.GetAcctIdInv(a.id) '
      '       end as glacct_id'
      '       '
      '       /*'
      '       decode( a.standard_id, '
      '               null, ( select glacct.acct'
      
        '                         from arinvt_elements ae, elements e, gl' +
        'acct'
      '                        where ae.arinvt_id = a.id '
      '                          and ae.elements_id = e.id(+) '
      
        '                          and plugins.get_glacct_id_with_ep_gl( ' +
        'e.acct_id_recv_dispo_inv, '#39'acct_id_fg'#39', misc.geteplantid ) = gla' +
        'cct.id(+)'
      '                          and rownum < 2 ),'
      '                  '
      '                 (select glacct.acct'
      '                   from glacct'
      
        '                  where plugins.get_glacct_id_with_ep_gl( NVL(a.' +
        'acct_id_inv, g.acct_id_fg), '#39'acct_id_fg'#39', misc.geteplantid ) = g' +
        'lacct.id(+))'
      '                 ) as acct'
      '       */          '
      '                          '
      '  from '
      '       c_process_cost_lot_sum main,'
      '       c_process_cost_dtl cd,'
      '       arinvt a,'
      '       arinvoice_detail d,'
      '       arinvoice i,'
      '       arinvt_group g,'
      '       iqsys2'
      ' where'
      '       main.userid = :userid'
      '   and main.c_process_cost_hdr_id = cd.c_process_cost_hdr_id'
      '   and main.arinvt_id = cd.arinvt_id'
      '   and cd.arinvt_id = a.id'
      '   and a.arinvt_group_id = g.id(+)'
      ''
      '       /* invoice */'
      '   and nvl(d.actual_cost_posted, '#39'N'#39') <> '#39'Y'#39
      '   and main.arinvoice_detail_id = d.id'
      '   and d.arinvoice_id = i.id'
      ''
      '')
    Left = 56
    Top = 176
    ParamData = <
      item
        Name = 'userid'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryLotSumArinvoiceDetailITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 20
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object QryLotSumArinvoiceDetailDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 21
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object QryLotSumArinvoiceDetailQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 15
      FieldName = 'QTY'
      Origin = 'decode( d.rma_detail_id, null, 1, -1) * main.qty'
      DisplayFormat = '##########0.00'
      Size = 38
    end
    object QryLotSumArinvoiceDetailTOTAL_ACT_COST: TFMTBCDField
      DisplayLabel = 'Total Act Cost'
      DisplayWidth = 15
      FieldName = 'TOTAL_ACT_COST'
      Origin = 
        'decode( d.rma_detail_id, null, 1, -1) * nvl(cd.std_cost,0) * mai' +
        'n.qty'
      DisplayFormat = '#######0.000000'
      Size = 38
    end
    object QryLotSumArinvoiceDetailTOTAL_STD_COST: TFMTBCDField
      DisplayLabel = 'Total Std Cost'
      DisplayWidth = 15
      FieldName = 'TOTAL_STD_COST'
      Origin = 
        'decode( d.rma_detail_id, null, 1, -1) * nvl(cd.std_cost,0) * mai' +
        'n.qty'
      DisplayFormat = '#######0.000000'
      Size = 38
    end
    object QryLotSumArinvoiceDetailINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      DisplayWidth = 18
      FieldName = 'INVOICE_NO'
      Origin = 'i.invoice_no'
      Size = 25
    end
    object QryLotSumArinvoiceDetailACCT: TStringField
      DisplayLabel = 'GLAccount'
      DisplayWidth = 24
      FieldName = 'ACCT'
      Size = 50
    end
    object QryLotSumArinvoiceDetailSTD_COST: TFMTBCDField
      DisplayLabel = 'Std Cost'
      DisplayWidth = 15
      FieldName = 'STD_COST'
      Origin = 'cd.std_cost'
      DisplayFormat = '#######0.000000'
      Size = 6
    end
    object QryLotSumArinvoiceDetailACT_COST: TFMTBCDField
      DisplayLabel = 'Act Cost'
      DisplayWidth = 15
      FieldName = 'ACT_COST'
      Origin = 'cd.act_cost'
      DisplayFormat = '#######0.000000'
      Size = 6
    end
    object QryLotSumArinvoiceDetailDESCRIP2: TStringField
      DisplayLabel = 'Item Ext Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object QryLotSumArinvoiceDetailCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object QryLotSumArinvoiceDetailREV: TStringField
      DisplayLabel = 'Item Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object QryLotSumArinvoiceDetailLOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'main.lotno'
      Size = 25
    end
    object QryLotSumArinvoiceDetailINVOICE_DATE: TDateTimeField
      DisplayLabel = 'Invoice Date'
      DisplayWidth = 18
      FieldName = 'INVOICE_DATE'
      Origin = 'i.INVOICE_DATE'
    end
    object QryLotSumArinvoiceDetailARINVOICE_DETAIL_ID: TBCDField
      DisplayLabel = 'ARInvoice Detail ID'
      DisplayWidth = 14
      FieldName = 'ARINVOICE_DETAIL_ID'
      Origin = 'main.arinvoice_detail_id'
      Visible = False
      Size = 0
    end
    object QryLotSumArinvoiceDetailID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryLotSumArinvoiceDetailSHIPMENT_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENT_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryLotSumArinvoiceDetailARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryLotSumArinvoiceDetailPROCESS_COST_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PROCESS_COST_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryLotSumArinvoiceDetailSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryLotSumArinvoiceDetailACCT_ID_INV: TBCDField
      DisplayWidth = 10
      FieldName = 'ACCT_ID_INV'
      Visible = False
      Size = 0
    end
    object QryLotSumArinvoiceDetailGLACCT_ID: TFMTBCDField
      FieldName = 'GLACCT_ID'
      Visible = False
      Size = 38
    end
  end
  object SrcLotSumArinvoiceDetail: TDataSource
    DataSet = QryLotSumArinvoiceDetail
    Left = 56
    Top = 120
  end
  object SrcCost_Elements: TDataSource
    DataSet = QryCost_Elements
    Left = 66
    Top = 336
  end
  object QryCost_Elements: TFDQuery
    Tag = 1
    OnCalcFields = QryCost_ElementsCalcFields
    MasterSource = SrcLotSumArinvoiceDetail
    MasterFields = 'PROCESS_COST_DTL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select decode(ce.attribute, '#39'USE COGS'#39', ce.elem_descrip, e.elem_' +
        'descrip ) as elem_descrip,'
      '       ce.std_cost,'
      '       ce.act_cost,'
      '       ce.price_variance,'
      '       ce.qty_variance,'
      '       ce.glacct_id,'
      '      (select acct from glacct'
      '         where id = ce.glacct_id'
      '       ) as acct'
      '       '
      '  from c_process_cost_elem ce,'
      '       elements e,'
      '       iqsys i'
      ' where ce.c_process_cost_dtl_id = :process_cost_dtl_id'
      '   and ce.elements_id = e.id(+)'
      '   '
      '   '
      '')
    Left = 65
    Top = 392
    ParamData = <
      item
        Name = 'PROCESS_COST_DTL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryCost_ElementsELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      DisplayWidth = 30
      FieldName = 'ELEM_DESCRIP'
      FixedChar = True
      Size = 30
    end
    object QryCost_ElementsSTD_COST: TFMTBCDField
      DisplayLabel = 'Std Cost'
      DisplayWidth = 17
      FieldName = 'STD_COST'
      DisplayFormat = '#######0.000000'
      Size = 6
    end
    object QryCost_ElementsACT_COST: TFMTBCDField
      DisplayLabel = 'Act Cost'
      DisplayWidth = 17
      FieldName = 'ACT_COST'
      DisplayFormat = '#######0.000000'
      Size = 6
    end
    object QryCost_ElementsCostVar: TFMTBCDField
      DisplayLabel = 'Variance'
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'CostVar'
      DisplayFormat = '#######0.000000'
      Calculated = True
    end
    object QryCost_ElementsACCT: TStringField
      DisplayLabel = 'GLAccount'
      DisplayWidth = 31
      FieldName = 'ACCT'
      Size = 50
    end
    object QryCost_ElementsExt_Cost: TFMTBCDField
      DisplayLabel = 'Extended Cost'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Ext_Cost'
      DisplayFormat = '#######0.000000'
      Calculated = True
    end
    object QryCost_ElementsPRICE_VARIANCE: TFMTBCDField
      DisplayLabel = 'Price Variance'
      DisplayWidth = 15
      FieldName = 'PRICE_VARIANCE'
      Visible = False
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object QryCost_ElementsQTY_VARIANCE: TFMTBCDField
      DisplayLabel = 'Qty Variance'
      DisplayWidth = 15
      FieldName = 'QTY_VARIANCE'
      Visible = False
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object QryCost_ElementsGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Visible = False
      Size = 0
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMJC_ACTCOSTPOST')
    SecurityCode = 'FRMJC_ACTCOSTPOST'
    Left = 672
    Top = 76
  end
end
