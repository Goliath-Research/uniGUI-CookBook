object FrmAssyTrackCostingWO: TFrmAssyTrackCostingWO
  Left = 348
  Top = 215
  ClientHeight = 297
  ClientWidth = 461
  Caption = 'Costing Info'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 297
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 0
      Top = 58
      Width = 461
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 459
      Height = 58
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object wwDataInspector1: TwwDataInspector
        Left = 0
        Top = 0
        Width = 459
        Height = 58
        DisableThemes = False
        Align = alClient
        TabOrder = 1
        DataSource = SrcMain
        Items = <
          item
            DataSource = SrcMain
            DataField = 'WORKORDER_ID'
            Caption = 'WO #'
            WordWrap = False
          end
          item
            DataSource = SrcMain
            DataField = 'ITEMNO'
            Caption = 'Item #'
            Items = <
              item
                DataSource = SrcMain
                DataField = 'DESCRIP'
                Caption = 'Description'
                WordWrap = False
              end
              item
                DataSource = SrcMain
                DataField = 'DESCRIP2'
                Caption = 'Ext Description'
                ReadOnly = True
                WordWrap = False
              end
              item
                DataSource = SrcMain
                DataField = 'REV'
                Caption = 'Rev'
                WordWrap = False
              end
              item
                DataSource = SrcMain
                DataField = 'CLASS'
                Caption = 'Class'
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcMain
            DataField = 'ID'
            Caption = 'Batch ID'
            WordWrap = False
          end>
        DefaultRowHeight = 18
        CaptionWidth = 100
        Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        LineStyleCaption = ovDottedLine
        LineStyleData = ovDottedLine
      end
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 61
      Width = 459
      Height = 236
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object wwDBGrid1: TIQUniGridControl
        Left = 1
        Top = 27
        Width = 457
        Height = 209
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 240
        IQComponents.Grid.Height = 123
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcCostElements
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
        IQComponents.Navigator.DataSource = SrcCostElements
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 240
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 123
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcCostElements
        Columns = <
          item
            FieldName = 'ELEM_DESCRIP'
            Title.Caption = 'Cost Element'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ACT_COST'
            Title.Caption = 'Act Cost'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'STD_COST'
            Title.Caption = 'Std Cost'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VARIANCE'
            Title.Caption = 'Variance'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object Panel4: TUniPanel
        Left = 1
        Top = 1
        Width = 457
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object sbtnRecalc: TUniSpeedButton
          Left = 2
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Recalculate'
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
          ParentColor = False
          Color = clWindow
          OnClick = sbtnRecalcClick
        end
        object sbtnSaveToHist: TUniSpeedButton
          Left = 27
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Save costing info ...'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFE4A592C06860B05850A05050A05050A0505090
            4850904840904840804040803840803840703840703830FF00FFFF00FFD06870
            F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
            30A03830703840FF00FFFF00FFD07070FF98A0F08880E0808070585040403090
            7870F0E0E0F0E8E0908070A04030A04040A04030803840FF00FFFF00FFD07870
            FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
            40A04040804040FF00FFFF00FFD07880FFA8B0FFA0A0F0909070585070585070
            5850705850706050806860C05850B05050B04840804040FF00FFFF00FFE08080
            FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
            50B05050904840FF00FFFF00FFE08890FFB8C0FFB8B0D06060C06050C05850C0
            5040B05030B04830A04020A03810C06060C05850904840FF00FFFF00FFE09090
            FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
            10C06060904850FF00FFFF00FFE098A0FFC0C0D07070FFFFFFFFFFFFFFFFFFFF
            F8F0F0F0F0F0E8E0F0D8D0E0D0C0A04020D06860A05050FF00FFFF00FFF0A0A0
            FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
            30D07070A05050FF00FFFF00FFF0A8A0FFC0C0E08080FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF8F0F0F0F0F0E8E0B05030E07880A05050FF00FFFF00FFF0B0B0
            FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
            40603030B05850FF00FFFF00FFF0B0B0FFC0C0FF9090FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF8F0C05850B05860B05860FF00FFFF00FFF0B8B0
            F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
            80D07870D07070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbtnSaveToHistClick
        end
      end
    end
  end
  object SrcMain: TDataSource
    DataSet = QryMain
    Left = 45
    Top = 136
  end
  object QryMain: TFDQuery
    BeforeOpen = QryMainBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select assy1.id,'
      '       assy1.workorder_id,'
      '       assy1.partno_id,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.rev,'
      '       a.class'
      '  from c_assy1_proc_cost assy1,'
      '       partno p,'
      '       arinvt a'
      ' where assy1.id = :id'
      '   and assy1.partno_id = p.id'
      '   and p.arinvt_id = a.id')
    Left = 46
    Top = 153
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMainID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.C_ASSY1_PROC_COST.ID'
      Size = 0
    end
    object QryMainWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Origin = 'IQ.C_ASSY1_PROC_COST.WORKORDER_ID'
      Size = 0
    end
    object QryMainPARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Origin = 'IQ.C_ASSY1_PROC_COST.PARTNO_ID'
      Size = 0
    end
    object QryMainITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryMainDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
    end
    object QryMainREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object QryMainCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryMainDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 49
    Top = 228
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About ...'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmAssyTrackCostingWO'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 190281 $'
    BuildVersion = '176554'
    Left = 83
    Top = 228
  end
  object SrcCostElements: TDataSource
    DataSet = QryCostElements
    Left = 92
    Top = 137
  end
  object QryCostElements: TFDQuery
    MasterSource = SrcMain
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id,'
      '       a.elements_id,'
      '       e.elem_descrip,'
      '       a.act_cost,'
      '       a.std_cost,'
      '       (nvl(a.std_cost,0) - nvl(a.act_cost,0)) as variance'
      '  from c_assy1_proc_cost_elem a,'
      '       elements e'
      ' where '
      '       a.c_assy1_proc_cost_id = :id'
      '   and a.elements_id = e.id'
      ' order by e.elem_descrip')
    Left = 93
    Top = 155
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryCostElementsELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      DisplayWidth = 30
      FieldName = 'ELEM_DESCRIP'
      FixedChar = True
      Size = 30
    end
    object QryCostElementsACT_COST: TFMTBCDField
      DisplayLabel = 'Act Cost'
      DisplayWidth = 13
      FieldName = 'ACT_COST'
      DisplayFormat = '########0.######'
      Size = 6
    end
    object QryCostElementsSTD_COST: TFMTBCDField
      DisplayLabel = 'Std Cost'
      DisplayWidth = 13
      FieldName = 'STD_COST'
      DisplayFormat = '########0.######'
      Size = 6
    end
    object QryCostElementsVARIANCE: TFMTBCDField
      DisplayLabel = 'Variance'
      DisplayWidth = 13
      FieldName = 'VARIANCE'
      DisplayFormat = '########0.######'
      Size = 38
    end
    object QryCostElementsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryCostElementsELEMENTS_ID: TBCDField
      FieldName = 'ELEMENTS_ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 118
    Top = 228
    object Details1: TUniMenuItem
      Caption = 'Details'
      OnClick = Details1Click
    end
  end
end
