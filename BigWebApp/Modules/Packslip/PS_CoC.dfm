object FrmCoC: TFrmCoC
  Left = 152
  Top = 145
  HelpContext = 1086019
  ClientHeight = 376
  ClientWidth = 702
  Caption = 'Certificate of Conformance'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 226
    Width = 702
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 226
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 1
      Top = 53
      Width = 700
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object wwDBGridShipBom: TIQUniGridControl
      Left = 1
      Top = 83
      Width = 700
      Height = 142
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 483
      IQComponents.Grid.Height = 56
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcShip_Bom
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
      IQComponents.Navigator.DataSource = SrcShip_Bom
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 483
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 56
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcShip_Bom
      Columns = <
        item
          FieldName = 'ItemNo_Indented'
          Title.Caption = 'Items'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Itemno'
          Title.Caption = 'Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MfgNo'
          Title.Caption = 'MFG #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PTSPER'
          Title.Caption = 'Items Per'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Descrip'
          Title.Caption = 'Item Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Rev'
          Title.Caption = 'Rev'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Class'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LEVEL'
          Title.Caption = 'Level'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'KIND'
          Title.Caption = 'Kind'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Translog_Rec_Exists'
          Title.Caption = 'Translog~Rec Exists'
          Width = 64
          CheckBoxField.FieldValues = 'Y;N'
        end>
      Marker = 0
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 56
      Width = 700
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        700
        27)
      object sbtnPrintPackingSlip: TUniSpeedButton
        Left = 26
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Print CoC'
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
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentColor = False
        Color = clWindow
        OnClick = sbtnPrintPackingSlipClick
      end
      object sbtnCalcCoC: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Calculate CoC'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          CDB6A88068608060507058407058407050407050406050406050306050307050
          40B89A83FF00FFFF00FFFF00FFFF00FFB5B5B568686860606056565656565650
          50505050504E4E4E4C4C4C4C4C4C505050989898FF00FFFF00FFFF00FFFF00FF
          877766D0C0B0D0B8B0D0B0A0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A090B098
          90775E46FF00FFFF00FFFF00FFFF00FF757575BEBEBEB8B8B8AFAFAFAEAEAEA8
          A8A8A8A8A8A0A0A0A0A0A09E9E9E9999995C5C5CFF00FFFF00FFFF00FFFF00FF
          967E66F0E0D0D0C0B0D0B8B0D0B0B0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A0
          90775E46FF00FFFF00FFFF00FFFF00FF7B7B7BDEDEDEBEBEBEB8B8B8B3B3B3AE
          AEAEA8A8A8A8A8A8A0A0A0A0A0A09E9E9E5C5C5CFF00FFFF00FFFF00FFFF00FF
          967E75F0E0D0C08870B07050D0B8B0C08870B07050C0B0A0C08870B07050C0A0
          90775E46FF00FFFF00FFFF00FFFF00FF7E7E7EDEDEDE898989717171B8B8B889
          8989717171AEAEAE898989717171A0A0A05C5C5CFF00FFFF00FFFF00FFFF00FF
          968675F0E0E0FFC8B0C08870D0C0B0F0C8B0C08870C0B0A0F0C8B0C08070C0A8
          90775E46FF00FFFF00FFFF00FFFF00FF848484E2E2E2C8C8C8898989BEBEBEC7
          C7C7898989AEAEAEC7C7C7838383A5A5A55C5C5CFF00FFFF00FFFF00FFFF00FF
          968D85F0E8E0E0D0C0D0C8C0D0C0C0D0C0B0D0B8B0D0B8B0C0B0A0C0B0A0C0A8
          A0776655FF00FFFF00FFFF00FFFF00FF8C8C8CE7E7E7CECECEC7C7C7C2C2C2BE
          BEBEB8B8B8B8B8B8AEAEAEAEAEAEA8A8A8646464FF00FFFF00FFFF00FFFF00FF
          A58D85FFE8E0C09070B07050E0C8C0C09080B07050D0B8B0C09070B07050C0B0
          A0866655FF00FFFF00FFFF00FFFF00FF8D8D8DE9E9E98E8E8E717171C9C9C991
          9191717171B8B8B88E8E8E717171AEAEAE666666FF00FFFF00FFFF00FFFF00FF
          A59585FFF0F0FFC8B0C08870E0D0C0F0C8B0C08870D0C0B0F0C8B0C08870D0B0
          A0866D55FF00FFFF00FFFF00FFFF00FF939393F2F2F2C8C8C8898989CECECEC7
          C7C7898989BEBEBEC7C7C7898989AFAFAF6B6B6BFF00FFFF00FFFF00FFFF00FF
          A59C94FFF0F0E0E0E0E0D8D0E0D0D0E0D0D0E0C8C0D0C8C0D0C0B0D0C0B0D0B8
          B0866D55FF00FFFF00FFFF00FFFF00FF9B9B9BF2F2F2E0E0E0D7D7D7D2D2D2D2
          D2D2C9C9C9C7C7C7BEBEBEBEBEBEB8B8B86B6B6BFF00FFFF00FFFF00FFFF00FF
          B4A494FFF8F09080D04030A0E0D8D09080D04030A0E0C8C09080D04030A0D0C0
          B0867564FF00FFFF00FFFF00FFFF00FFA2A2A2F7F7F7979797595959D7D7D797
          9797595959C9C9C9979797595959BEBEBE737373FF00FFFF00FFFF00FFFF00FF
          B4A4A3FFF8F0C0C0E09080D0E0E0E0C0C0E09080D0E0D0D0C0C0E09080D0D0C0
          C0957564FF00FFFF00FFFF00FFFF00FFA6A6A6F7F7F7C8C8C8979797E0E0E0C8
          C8C8979797D2D2D2C8C8C8979797C2C2C2757575FF00FFFF00FFFF00FFFF00FF
          B4ABA3FFF8FFFFE0D0FFD0B0FFD0B0FFC090F0B890D0A080D0A080D0B0A0D0C8
          C0957C73FF00FFFF00FFFF00FFFF00FFAAAAAAFAFAFAE0E0E0CECECECECECEBD
          BDBDB6B6B69E9E9E9E9E9EAFAFAFC7C7C77C7C7CFF00FFFF00FFFF00FFFF00FF
          B4ABA3FFFFFFFF9860FFA060FFA060FFA060FFA060FFA060FFA060B06850C0A8
          90958473FF00FFFF00FFFF00FFFF00FFAAAAAAFFFFFF9A9A9A9F9F9F9F9F9F9F
          9F9F9F9F9F9F9F9F9F9F9F6B6B6BA5A5A5828282FF00FFFF00FFFF00FFFF00FF
          B4B3A3FFFFFFE07840F0D8D0F0D8D0F0C8B0E0B0A0E0A080E08050A05830D0A0
          90958473FF00FFFF00FFFF00FFFF00FFB0B0B0FFFFFF7B7B7BD9D9D9D9D9D9C7
          C7C7B1B1B1A0A0A08282825A5A5AA1A1A1828282FF00FFFF00FFFF00FFFF00FF
          DAC7C0BEB3A9F0B8A0D09070D08860D08050D07040D06830C06030D08060A088
          80C6A891FF00FFFF00FFFF00FFFF00FFC7C7C7B2B2B2B8B8B890909088888880
          80807373736C6C6C646464838383888888A6A6A6FF00FFFF00FFFF00FFFF00FF
          FF00FFCCC4B3B0A8A0B0A8A0B0A090B09890B09890A09890A09080A08880C9AE
          98FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1A7A7A7A7A7A79E9E9E99
          99999999999797978E8E8E888888ACACACFF00FFFF00FFFF00FF}
        Caption = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentColor = False
        Color = clWindow
        OnClick = sbtnCalcCoCClick
      end
      object Shape5: TUniPanel
        Left = 461
        Top = 9
        Width = 10
        Height = 11
        Hint = 'BOM item without lot trace data'
        ShowHint = True
        ParentShowHint = False
        Anchors = [akTop, akRight]
        TabOrder = 4
        Caption = ''
      end
      object Shape1: TUniPanel
        Left = 447
        Top = 9
        Width = 10
        Height = 11
        Hint = 'Substitute material / Rework '
        ShowHint = True
        ParentShowHint = False
        Anchors = [akTop, akRight]
        TabOrder = 5
        Caption = ''
      end
      object NavShipBom: TUniDBNavigator
        Left = 472
        Top = 1
        Width = 227
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcShip_Bom
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object wwDataInspectorHeader: TwwDataInspector
      Left = 1
      Top = 1
      Width = 700
      Height = 52
      DisableThemes = False
      Align = alTop
      Color = clInfoBk
      TabOrder = 2
      DataSource = SrcHeader
      Items = <
        item
          DataSource = SrcHeader
          DataField = 'PACKSLIPNO'
          Caption = 'Packslip #'
          WordWrap = False
        end
        item
          DataSource = SrcHeader
          DataField = 'ITEMNO'
          Caption = 'Item #'
          Items = <
            item
              DataSource = SrcHeader
              DataField = 'DESCRIP'
              Caption = 'Description'
              WordWrap = False
            end
            item
              DataSource = SrcHeader
              DataField = 'CLASS'
              Caption = 'Class'
              WordWrap = False
            end
            item
              DataSource = SrcHeader
              DataField = 'REV'
              Caption = 'Revision'
              WordWrap = False
            end
            item
              DataSource = SrcHeader
              DataField = 'DESCRIP2'
              Caption = 'Extended Description'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcHeader
          DataField = 'CUSTNO'
          Caption = 'Customer #'
          Items = <
            item
              DataSource = SrcHeader
              DataField = 'COMPANY'
              Caption = 'Company Name'
              WordWrap = False
            end>
          WordWrap = False
        end>
      CaptionWidth = 139
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
    end
    object wwDBComboDlgItemNo: TUniEdit
      Left = 230
      Top = 162
      Width = 121
      Height = 21
      Hint = ''
      Visible = False
      Text = ''
      TabOrder = 3
    end
    object wwDBComboBoxKind: TUniDBComboBox
      Left = 230
      Top = 189
      Width = 121
      Height = 21
      Hint = ''
      Visible = False
      Style = csDropDownList
      Items.Strings = (
        'Top Item'#9'TOP ITEM'
        'Component'#9'COMPONENT'
        'Primary Material'#9'PRIMARY MATERIAL'
        'Manual Adjustment'#9'MANUAL ADJUSTMENT'
        'Substitute'#9'SUBSTITUTE'
        'Rework'#9'REWORK')
      TabOrder = 4
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 229
    Width = 702
    Height = 147
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter3: TUniSplitter
      Left = 198
      Top = 28
      Width = 6
      Height = 118
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 700
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object NavShipBomLot: TUniDBNavigator
        Left = 472
        Top = 1
        Width = 227
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcShipBomLot
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object wwDBGridShipBomLot: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 197
      Height = 118
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 434
      IQComponents.Grid.Height = 32
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcShipBomLot
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
      IQComponents.Navigator.DataSource = SrcShipBomLot
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = -20
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 32
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcShipBomLot
      Columns = <
        item
          FieldName = 'LOTNO'
          Title.Caption = 'Lot #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TRANSLOG_ID'
          Title.Caption = 'Translog ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'VENDOR_ID'
          Title.Caption = 'VENDOR_ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object wwDataInspectorTranslog: TwwDataInspector
      Left = 204
      Top = 28
      Width = 497
      Height = 118
      DisableThemes = False
      Align = alClient
      TabOrder = 2
      DataSource = SrcTranslog
      Items = <
        item
          DataSource = SrcTranslog
          DataField = 'TRANS_IN_OUT'
          Caption = 'Trans Kind'
          WordWrap = False
        end
        item
          DataSource = SrcTranslog
          DataField = 'TRANS_DATE'
          Caption = 'Trans Date'
          Items = <
            item
              DataSource = SrcTranslog
              DataField = 'RECV_DATE'
              Caption = 'Recv Date'
              WordWrap = False
            end
            item
              DataSource = SrcTranslog
              DataField = 'PROD_DATE'
              Caption = 'Prod Date'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcTranslog
          DataField = 'TRANS_QUAN'
          Caption = 'Quantity'
          Items = <
            item
              DataSource = SrcTranslog
              DataField = 'BEGIN_QUAN'
              Caption = 'Start Quantity'
              WordWrap = False
            end
            item
              DataSource = SrcTranslog
              DataField = 'BEGIN_QUAN_TOTAL'
              Caption = 'Start Quantity Total'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcTranslog
          DataField = 'TRANS_TYPE'
          Caption = 'Type'
          Items = <
            item
              DataSource = SrcTranslog
              DataField = 'TRANS_REASON'
              Caption = 'Reason'
              WordWrap = False
            end
            item
              DataSource = SrcTranslog
              DataField = 'TRANS_DESCRIP'
              Caption = 'Trans Description'
              WordWrap = False
            end
            item
              DataSource = SrcTranslog
              DataField = 'TRANS_CODE'
              Caption = 'Trans Code'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcTranslog
          DataField = 'LOC_DESC'
          Caption = 'Location'
          Items = <
            item
              DataSource = SrcTranslog
              DataField = 'LOCATION_DESCRIP'
              Caption = 'Location Description'
              WordWrap = False
            end
            item
              DataSource = SrcTranslog
              DataField = 'LOTNO'
              Caption = 'Lot #'
              WordWrap = False
            end
            item
              DataSource = SrcTranslog
              DataField = 'FG_LOTNO'
              Caption = 'FG Lot #'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcTranslog
          Caption = 'Miscellaneous'
          Items = <
            item
              DataSource = SrcTranslog
              DataField = 'MFGNO'
              Caption = 'MFG #'
              WordWrap = False
            end
            item
              DataSource = SrcTranslog
              DataField = 'ORDERNO'
              Caption = 'Order #'
              WordWrap = False
            end
            item
              DataSource = SrcTranslog
              DataField = 'USERID'
              Caption = 'User ID'
              WordWrap = False
            end
            item
              DataSource = SrcTranslog
              DataField = 'DIVISION_NAME'
              Caption = 'Division Name'
              WordWrap = False
            end
            item
              DataSource = SrcTranslog
              DataField = 'WORKORDER_ID'
              Caption = 'WO #'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcVendor
          DataField = 'VENDORNO'
          Caption = 'Vendor #'
          Items = <
            item
              DataSource = SrcVendor
              DataField = 'COMPANY'
              Caption = 'Company'
              WordWrap = False
            end>
          WordWrap = False
        end>
      CaptionWidth = 98
      Options = [ovColumnResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
    end
  end
  object SrcShip_Bom: TDataSource
    DataSet = QryShip_Bom
    Left = 77
    Top = 122
  end
  object QryShip_Bom: TFDQuery
    BeforePost = QryShip_BomBeforePost
    OnCalcFields = QryShip_BomCalcFields
    OnNewRecord = QryShip_BomNewRecord
    MasterSource = SrcHeader
    MasterFields = 'SHIPMENT_DTL_ID'
    OnUpdateRecord = QryShip_BomUpdateRecord
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'C_SHIP_BOM'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLShipBom
    SQL.Strings = (
      'select '
      '       id,'
      '       shipment_dtl_id,'
      '       parent_id,'
      '       arinvt_id,'
      '       standard_id,'
      '       parent_arinvt_id,'
      '       parent_standard_id,'
      '       opmat_id,'
      '       ptsper,'
      '       bom_level,'
      '       level,'
      '       kind'
      '  from '
      
        '       (select * from c_ship_bom where shipment_dtl_id = :shipme' +
        'nt_dtl_id)'
      ' start '
      '       with parent_id is NULL'
      'connect '
      '       by parent_id = prior id'
      ''
      ' '
      ' ')
    Left = 77
    Top = 136
    ParamData = <
      item
        Name = 'SHIPMENT_DTL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryShip_Bom_ItemNo_Indented: TStringField
      DisplayLabel = 'Items'
      DisplayWidth = 29
      FieldKind = fkCalculated
      FieldName = 'ItemNo_Indented'
      ReadOnly = True
      Size = 4000
      Calculated = True
    end
    object QryShip_BomItemno: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 19
      FieldKind = fkCalculated
      FieldName = 'Itemno'
      Size = 25
      Calculated = True
    end
    object QryShip_BomMfgNo: TStringField
      DisplayLabel = 'MFG #'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'MfgNo'
      ReadOnly = True
      Size = 25
      Calculated = True
    end
    object QryShip_BomPTSPER: TFMTBCDField
      DisplayLabel = 'Items Per'
      DisplayWidth = 10
      FieldName = 'PTSPER'
      DisplayFormat = '########0.######'
      Size = 6
    end
    object QryShip_BomDescrip: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      ReadOnly = True
      Size = 35
      Calculated = True
    end
    object QryShip_BomRev: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Rev'
      ReadOnly = True
      Size = 15
      Calculated = True
    end
    object QryShip_BomClass: TStringField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'Class'
      ReadOnly = True
      Size = 2
      Calculated = True
    end
    object QryShip_BomLEVEL: TFMTBCDField
      DisplayLabel = 'Level'
      DisplayWidth = 6
      FieldName = 'LEVEL'
      ReadOnly = True
      Size = 38
    end
    object QryShip_BomKIND: TStringField
      DisplayLabel = 'Kind'
      DisplayWidth = 17
      FieldName = 'KIND'
    end
    object QryShip_BomTranslog_Rec_Exists: TStringField
      DisplayLabel = 'Translog~Rec Exists'
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'Translog_Rec_Exists'
      Calculated = True
    end
    object QryShip_BomSTANDARD_ID: TBCDField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 12
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryShip_BomARINVT_ID: TBCDField
      DisplayLabel = 'Item #'
      DisplayWidth = 16
      FieldName = 'ARINVT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object QryShip_BomPARENT_ARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryShip_BomPARENT_STANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryShip_BomOPMAT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'OPMAT_ID'
      Visible = False
      Size = 0
    end
    object QryShip_BomBOM_LEVEL: TBCDField
      DisplayWidth = 10
      FieldName = 'BOM_LEVEL'
      Visible = False
      Size = 0
    end
    object QryShip_BomID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryShip_BomSHIPMENT_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENT_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryShip_BomPARENT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcHeader: TDataSource
    DataSet = QryHeader
    Left = 38
    Top = 122
  end
  object QryHeader: TFDQuery
    BeforeOpen = QryHeaderBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select packslipno,'
      '       itemno,'
      '       descrip,'
      '       class,'
      '       rev,'
      '       descrip2,'
      '       custno,'
      '       company,'
      '       shipment_dtl_id       '
      '  from c_ship_hist'
      ' where shipment_dtl_id = :shipment_dtl_id'
      ''
      '')
    Left = 38
    Top = 136
    ParamData = <
      item
        Name = 'shipment_dtl_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryHeaderPACKSLIPNO: TStringField
      FieldName = 'PACKSLIPNO'
      Origin = 'IQ.C_SHIP_HIST.PACKSLIPNO'
      Size = 15
    end
    object QryHeaderITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'IQ.C_SHIP_HIST.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryHeaderDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.C_SHIP_HIST.DESCRIP'
      Size = 100
    end
    object QryHeaderCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'IQ.C_SHIP_HIST.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryHeaderREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.C_SHIP_HIST.REV'
      FixedChar = True
      Size = 15
    end
    object QryHeaderDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Origin = 'IQ.C_SHIP_HIST.DESCRIP2'
      Size = 100
    end
    object QryHeaderCUSTNO: TStringField
      FieldName = 'CUSTNO'
      Origin = 'IQ.C_SHIP_HIST.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryHeaderCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'IQ.C_SHIP_HIST.COMPANY'
      Size = 60
    end
    object QryHeaderSHIPMENT_DTL_ID: TBCDField
      FieldName = 'SHIPMENT_DTL_ID'
      Origin = 'IQ.C_SHIP_HIST.SHIPMENT_DTL_ID'
      Size = 0
    end
  end
  object SrcShipBomLot: TDataSource
    DataSet = QryShipBomLot
    Left = 117
    Top = 122
  end
  object QryShipBomLot: TFDQuery
    BeforePost = QryShipBomLotBeforePost
    OnNewRecord = QryShipBomLotNewRecord
    MasterSource = SrcShip_Bom
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'C_SHIP_BOM_LOT'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLShipBomLot
    SQL.Strings = (
      'select id,'
      '       c_ship_bom_id,'
      '       lotno,'
      '       translog_id,'
      '       vendor_id'
      '  from '
      '       c_ship_bom_lot       '
      ' where '
      '       c_ship_bom_id = :id'
      ' order by'
      '       id'
      ' ')
    Left = 117
    Top = 137
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryShipBomLotLOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 14
      FieldName = 'LOTNO'
      Origin = 'IQ.C_SHIP_BOM_LOT.LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryShipBomLotTRANSLOG_ID: TBCDField
      DisplayLabel = 'Translog ID'
      DisplayWidth = 10
      FieldName = 'TRANSLOG_ID'
      Origin = 'IQ.C_SHIP_BOM_LOT.TRANSLOG_ID'
      ReadOnly = True
      Size = 0
    end
    object QryShipBomLotVENDOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Origin = 'IQ.C_SHIP_BOM_LOT.VENDOR_ID'
      Size = 0
    end
    object QryShipBomLotID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.C_SHIP_BOM_LOT.ID'
      Visible = False
      Size = 0
    end
    object QryShipBomLotC_SHIP_BOM_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'C_SHIP_BOM_ID'
      Origin = 'IQ.C_SHIP_BOM_LOT.C_SHIP_BOM_ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenuShipBom: TUniPopupMenu
    OnPopup = PopupMenuShipBomPopup
    Left = 234
    Top = 124
    object AddItem1: TUniMenuItem
      Caption = 'Add Item ...'
      OnClick = AddItem1Click
    end
    object AddSubItem1: TUniMenuItem
      Caption = 'Add SubItem ...'
      OnClick = AddSubItem1Click
    end
    object DeleteItem1: TUniMenuItem
      Caption = 'Delete Item'
      OnClick = DeleteItem1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumptoInventory1Click
    end
    object JumptoBOM1: TUniMenuItem
      Caption = 'Jump to BOM'
      OnClick = JumptoBOM1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object About1: TUniMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
  object UpdateSQLShipBom: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into c_ship_bom'
      
        '  (ID, SHIPMENT_DTL_ID, PARENT_ID, ARINVT_ID, STANDARD_ID, PAREN' +
        'T_ARINVT_ID, '
      '   PARENT_STANDARD_ID, OPMAT_ID, PTSPER, BOM_LEVEL, KIND)'
      'values'
      
        '  (:ID, :SHIPMENT_DTL_ID, :PARENT_ID, :ARINVT_ID, :STANDARD_ID, ' +
        ':PARENT_ARINVT_ID, '
      '   :PARENT_STANDARD_ID, :OPMAT_ID, :PTSPER, :BOM_LEVEL, :KIND)')
    ModifySQL.Strings = (
      'update c_ship_bom'
      'set'
      '  ID = :ID,'
      '  SHIPMENT_DTL_ID = :SHIPMENT_DTL_ID,'
      '  PARENT_ID = :PARENT_ID,'
      '  ARINVT_ID = :ARINVT_ID,'
      '  STANDARD_ID = :STANDARD_ID,'
      '  PARENT_ARINVT_ID = :PARENT_ARINVT_ID,'
      '  PARENT_STANDARD_ID = :PARENT_STANDARD_ID,'
      '  OPMAT_ID = :OPMAT_ID,'
      '  PTSPER = :PTSPER,'
      '  BOM_LEVEL = :BOM_LEVEL,'
      '  KIND = :KIND'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from c_ship_bom'
      'where'
      '  ID = :OLD_ID')
    Left = 77
    Top = 157
  end
  object PkArinvt: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select arinvt.id,'
      '       arinvt.class,'
      '       arinvt.itemno,'
      '       arinvt.rev,'
      '       arinvt.descrip,'
      '       arinvt.descrip2,'
      '       arinvt.eplant_id,'
      '       arinvt.arcusto_id,'
      '       arinvt.standard_id,'
      '       arcusto.custno,'
      '       arcusto.company'
      '  from arinvt,'
      '       arcusto'
      ' where arinvt.arcusto_id = arcusto.id(+)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 267
    Top = 124
    object PkArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT.ID'
      Visible = False
      Size = 0
    end
    object PkArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object PkArinvtREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object PkArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
    object PkArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.ARINVT.EPLANT_ID'
      Size = 0
    end
    object PkArinvtARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'IQ.ARINVT.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkArinvtSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object PkArinvtCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkArinvtCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
  end
  object UpdateSQLShipBomLot: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into c_ship_bom_lot'
      '  (ID, C_SHIP_BOM_ID, LOTNO, TRANSLOG_ID, VENDOR_ID)'
      'values'
      '  (:ID, :C_SHIP_BOM_ID, :LOTNO, :TRANSLOG_ID, :VENDOR_ID)')
    ModifySQL.Strings = (
      'update c_ship_bom_lot'
      'set'
      '  ID = :ID,'
      '  C_SHIP_BOM_ID = :C_SHIP_BOM_ID,'
      '  LOTNO = :LOTNO,'
      '  TRANSLOG_ID = :TRANSLOG_ID,'
      '  VENDOR_ID = :VENDOR_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from c_ship_bom_lot'
      'where'
      '  ID = :OLD_ID')
    Left = 117
    Top = 158
  end
  object SrcTranslog: TDataSource
    DataSet = QryTranslog
    Left = 155
    Top = 122
  end
  object QryTranslog: TFDQuery
    MasterSource = SrcShipBomLot
    MasterFields = 'TRANSLOG_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from translog'
      'where id = :translog_id')
    Left = 155
    Top = 137
    ParamData = <
      item
        Name = 'TRANSLOG_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryTranslogID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.TRANSLOG.ID'
      Size = 0
    end
    object QryTranslogARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.TRANSLOG.ARINVT_ID'
      Size = 0
    end
    object QryTranslogCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'IQ.TRANSLOG.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryTranslogITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'IQ.TRANSLOG.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryTranslogREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.TRANSLOG.REV'
      FixedChar = True
      Size = 15
    end
    object QryTranslogDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.TRANSLOG.DESCRIP'
      Size = 100
    end
    object QryTranslogUNIT: TStringField
      FieldName = 'UNIT'
      Origin = 'IQ.TRANSLOG.UNIT'
      Size = 10
    end
    object QryTranslogTRANS_IN_OUT: TStringField
      FieldName = 'TRANS_IN_OUT'
      Origin = 'IQ.TRANSLOG.TRANS_IN_OUT'
      FixedChar = True
      Size = 3
    end
    object QryTranslogTRANS_DATE: TDateTimeField
      FieldName = 'TRANS_DATE'
      Origin = 'IQ.TRANSLOG.TRANS_DATE'
    end
    object QryTranslogTRANS_QUAN: TFMTBCDField
      FieldName = 'TRANS_QUAN'
      Origin = 'IQ.TRANSLOG.TRANS_QUAN'
      Size = 6
    end
    object QryTranslogRG_QUAN: TFMTBCDField
      FieldName = 'RG_QUAN'
      Origin = 'IQ.TRANSLOG.RG_QUAN'
      Size = 6
    end
    object QryTranslogTRANS_TYPE: TStringField
      FieldName = 'TRANS_TYPE'
      Origin = 'IQ.TRANSLOG.TRANS_TYPE'
      Size = 30
    end
    object QryTranslogLOC_DESC: TStringField
      FieldName = 'LOC_DESC'
      Origin = 'IQ.TRANSLOG.LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object QryTranslogACT_COST: TFMTBCDField
      FieldName = 'ACT_COST'
      Origin = 'IQ.TRANSLOG.ACT_COST'
      Size = 6
    end
    object QryTranslogMFGNO: TStringField
      FieldName = 'MFGNO'
      Origin = 'IQ.TRANSLOG.MFGNO'
      Size = 50
    end
    object QryTranslogORDERNO: TStringField
      FieldName = 'ORDERNO'
      Origin = 'IQ.TRANSLOG.ORDERNO'
      Size = 15
    end
    object QryTranslogUSERID: TStringField
      FieldName = 'USERID'
      Origin = 'IQ.TRANSLOG.USERID'
      Size = 35
    end
    object QryTranslogLOTNO: TStringField
      FieldName = 'LOTNO'
      Origin = 'IQ.TRANSLOG.LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryTranslogFG_LOTNO: TStringField
      FieldName = 'FG_LOTNO'
      Origin = 'IQ.TRANSLOG.FG_LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryTranslogTRANS_REASON: TStringField
      FieldName = 'TRANS_REASON'
      Origin = 'IQ.TRANSLOG.TRANS_REASON'
      Size = 50
    end
    object QryTranslogPOSTED: TStringField
      FieldName = 'POSTED'
      Origin = 'IQ.TRANSLOG.POSTED'
      FixedChar = True
      Size = 1
    end
    object QryTranslogBATCH: TBCDField
      FieldName = 'BATCH'
      Origin = 'IQ.TRANSLOG.BATCH'
      Size = 0
    end
    object QryTranslogBEGIN_QUAN: TFMTBCDField
      FieldName = 'BEGIN_QUAN'
      Origin = 'IQ.TRANSLOG.BEGIN_QUAN'
      Size = 6
    end
    object QryTranslogBEGIN_RG_QUAN: TFMTBCDField
      FieldName = 'BEGIN_RG_QUAN'
      Origin = 'IQ.TRANSLOG.BEGIN_RG_QUAN'
      Size = 6
    end
    object QryTranslogDAY_PART_ID: TBCDField
      FieldName = 'DAY_PART_ID'
      Origin = 'IQ.TRANSLOG.DAY_PART_ID'
      Size = 0
    end
    object QryTranslogSTD_COST: TFMTBCDField
      FieldName = 'STD_COST'
      Origin = 'IQ.TRANSLOG.STD_COST'
      Size = 6
    end
    object QryTranslogCOST_ELEMENT: TStringField
      FieldName = 'COST_ELEMENT'
      Origin = 'IQ.TRANSLOG.COST_ELEMENT'
      FixedChar = True
      Size = 30
    end
    object QryTranslogPARENT_ARINVT_ID: TBCDField
      FieldName = 'PARENT_ARINVT_ID'
      Origin = 'IQ.TRANSLOG.PARENT_ARINVT_ID'
      Size = 0
    end
    object QryTranslogFGMULTI_CUSER1: TStringField
      FieldName = 'FGMULTI_CUSER1'
      Origin = 'IQ.TRANSLOG.FGMULTI_CUSER1'
      Size = 25
    end
    object QryTranslogFGMULTI_CUSER2: TStringField
      FieldName = 'FGMULTI_CUSER2'
      Origin = 'IQ.TRANSLOG.FGMULTI_CUSER2'
      Size = 25
    end
    object QryTranslogFGMULTI_CUSER3: TStringField
      FieldName = 'FGMULTI_CUSER3'
      Origin = 'IQ.TRANSLOG.FGMULTI_CUSER3'
      Size = 25
    end
    object QryTranslogSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'IQ.TRANSLOG.SOURCE'
      Size = 50
    end
    object QryTranslogSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.TRANSLOG.SOURCE_ID'
      Size = 0
    end
    object QryTranslogRECEIPTNO: TStringField
      FieldName = 'RECEIPTNO'
      Origin = 'IQ.TRANSLOG.RECEIPTNO'
      Size = 50
    end
    object QryTranslogDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Origin = 'IQ.TRANSLOG.DIVISION_ID'
      Size = 0
    end
    object QryTranslogDIVISION_NAME: TStringField
      FieldName = 'DIVISION_NAME'
      Origin = 'IQ.TRANSLOG.DIVISION_NAME'
      Size = 25
    end
    object QryTranslogTRANS_CODE: TStringField
      FieldName = 'TRANS_CODE'
      Origin = 'IQ.TRANSLOG.TRANS_CODE'
      Size = 10
    end
    object QryTranslogTRANS_DESCRIP: TStringField
      FieldName = 'TRANS_DESCRIP'
      Origin = 'IQ.TRANSLOG.TRANS_DESCRIP'
      Size = 25
    end
    object QryTranslogLOCATION_DESCRIP: TStringField
      FieldName = 'LOCATION_DESCRIP'
      Origin = 'IQ.TRANSLOG.LOCATION_DESCRIP'
      Size = 50
    end
    object QryTranslogWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Origin = 'IQ.TRANSLOG.WORKORDER_ID'
      Size = 0
    end
    object QryTranslogEXCLUDE_RPT: TStringField
      FieldName = 'EXCLUDE_RPT'
      Origin = 'IQ.TRANSLOG.EXCLUDE_RPT'
      FixedChar = True
      Size = 1
    end
    object QryTranslogEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.TRANSLOG.EPLANT_ID'
      Size = 0
    end
    object QryTranslogBEGIN_QUAN_TOTAL: TFMTBCDField
      FieldName = 'BEGIN_QUAN_TOTAL'
      Origin = 'IQ.TRANSLOG.BEGIN_QUAN_TOTAL'
      Size = 6
    end
    object QryTranslogBEGIN_RG_QUAN_TOTAL: TFMTBCDField
      FieldName = 'BEGIN_RG_QUAN_TOTAL'
      Origin = 'IQ.TRANSLOG.BEGIN_RG_QUAN_TOTAL'
      Size = 6
    end
    object QryTranslogRECV_DATE: TDateTimeField
      FieldName = 'RECV_DATE'
      Origin = 'IQ.TRANSLOG.RECV_DATE'
    end
    object QryTranslogPROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
      Origin = 'IQ.TRANSLOG.PROD_DATE'
    end
    object QryTranslogRMA_DETAIL_ID: TBCDField
      FieldName = 'RMA_DETAIL_ID'
      Origin = 'IQ.TRANSLOG.RMA_DETAIL_ID'
      Size = 0
    end
    object QryTranslogACT_DATE: TDateTimeField
      FieldName = 'ACT_DATE'
      Origin = 'IQ.TRANSLOG.ACT_DATE'
    end
    object QryTranslogTRACKNO: TStringField
      FieldName = 'TRACKNO'
      Origin = 'IQ.TRANSLOG.TRACKNO'
      Size = 30
    end
    object QryTranslogNON_CONFORM_CODE: TStringField
      FieldName = 'NON_CONFORM_CODE'
      Origin = 'IQ.TRANSLOG.NON_CONFORM_CODE'
      Size = 10
    end
    object QryTranslogFGMULTI_ID: TBCDField
      FieldName = 'FGMULTI_ID'
      Origin = 'IQ.TRANSLOG.FGMULTI_ID'
      Size = 0
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcShip_Bom
    JumpTo = jtInventory
    Left = 300
    Top = 125
  end
  object IQJumpBom: TIQWebJump
    DataField = 'STANDARD_ID'
    DataSource = SrcShip_Bom
    JumpTo = jtBom
    Left = 330
    Top = 125
  end
  object SrcVendor: TDataSource
    DataSet = QryVendor
    Left = 191
    Top = 122
  end
  object QryVendor: TFDQuery
    MasterSource = SrcShipBomLot
    MasterFields = 'VENDOR_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select vendorno, company from vendor'
      ' where id = :vendor_id')
    Left = 192
    Top = 137
    ParamData = <
      item
        Name = 'VENDOR_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryVendorVENDORNO: TStringField
      FieldName = 'VENDORNO'
      Origin = 'IQ.VENDOR.VENDORNO'
      FixedChar = True
      Size = 10
    end
    object QryVendorCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'IQ.VENDOR.COMPANY'
      FixedChar = True
      Size = 60
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Certificate of Conformance'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192282 $'
    BuildVersion = '176554'
    Left = 364
    Top = 126
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'sbtnCalcCoC'
      'sbtnPrintPackingSlip'
      'wwDBComboDlgItemNo'
      'QryShip_BomTranslog_Rec_Exists'
      'QryShipBomLotLOTNO'
      'QryShip_Bom_ItemNo_Indented'
      'QryShip_BomItemno'
      'QryShip_BomMfgNo'
      'QryShip_BomPTSPER'
      'QryShip_BomDescrip'
      'QryShip_BomRev'
      'QryShip_BomClass'
      'QryShip_BomLEVEL'
      'QryShip_BomKIND'
      'NavShipBom'
      'NavShipBomLot'
      'QryShipBomLotTRANSLOG_ID'
      'QryShipBomLotVENDOR_ID')
    SecurityCode = 'FRMCOC'
    AfterApply = SRAfterApply
    Left = 392
    Top = 126
  end
end
