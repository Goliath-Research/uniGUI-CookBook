object FrmInvWhereUsedFlat: TFrmInvWhereUsedFlat
  Left = 0
  Top = 0
  ClientHeight = 352
  ClientWidth = 844
  Caption = 'Sequential Where Used View'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 352
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 1
      Top = 1
      Width = 842
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnRecalc: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Recalc Where Used'
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
        OnClick = sbtnRefreshClick
      end
      object DBNavigator1: TUniDBNavigator
        Left = 742
        Top = 1
        Width = 100
        Height = 26
        Hint = ''
        DataSource = SrcWhereUsed
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object pnlGrid: TUniPanel
      Left = 1
      Top = 28
      Width = 842
      Height = 324
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Grid: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 840
        Height = 322
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 623
        IQComponents.Grid.Height = 236
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcWhereUsed
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
        IQComponents.Navigator.DataSource = SrcWhereUsed
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 623
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 236
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcWhereUsed
        Columns = <
          item
            FieldName = 'MAX_LEVEL'
            Title.Caption = 'Max Level'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MFGNO'
            Title.Caption = 'Mfg #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'OPDESC'
            Title.Caption = 'Operation / Process Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANT_ID'
            Title.Caption = 'EPlant ID'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSTNO'
            Title.Caption = 'Cust #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VENDORNO'
            Title.Caption = 'Vendor #'
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
            FieldName = 'CLASS'
            Title.Caption = 'Class'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REV'
            Title.Caption = 'Rev'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP2'
            Title.Caption = 'Ext Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'OPNO'
            Title.Caption = 'Operation / Process #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object SrcWhereUsed: TDataSource
    DataSet = QryWhereUsed
    Left = 22
    Top = 68
  end
  object QryWhereUsed: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select x.id,'
      '       x.arinvt_id,'
      '       x.ptoper_id,'
      '       x.sndop_id,'
      '       x.opmat_id,'
      '       x.kind,'
      '       x.max_level,'
      '       a.class,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.rev,'
      '       a.descrip2,'
      '       a.eplant_id,'
      '       s.mfgno,'
      '       op.opno,'
      '       op.opdesc,'
      '       c.custno,'
      '       v.vendorno'
      '  from'
      '       gtt_where_used_involved x,'
      '       arinvt a,'
      '       sndop op,'
      '       standard s,'
      '       arcusto c,'
      '       vendor v'
      ' where'
      '       -- arinvt'
      '       x.arinvt_id = a.id'
      '       -- standard'
      '   and a.standard_id = s.id(+)'
      '       -- sndop'
      '   and x.sndop_id = op.id(+)'
      '       -- arcusto'
      '   and a.arcusto_id = c.id(+)'
      '       -- vendor'
      '   and a.vendor_id = v.id(+)'
      '   '
      'order by x.id')
    Left = 36
    Top = 76
    object QryWhereUsedITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 24
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object QryWhereUsedDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object QryWhereUsedMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 20
      FieldName = 'MFGNO'
      Origin = 's.mfgno'
      Size = 50
    end
    object QryWhereUsedOPDESC: TStringField
      DisplayLabel = 'Operation / Process Description'
      DisplayWidth = 28
      FieldName = 'OPDESC'
      Origin = 'op.opdesc'
      Size = 60
    end
    object QryWhereUsedCUSTNO: TStringField
      DisplayLabel = 'Default Customer'
      DisplayWidth = 16
      FieldName = 'CUSTNO'
      Origin = 'c.custno'
      FixedChar = True
      Size = 10
    end
    object QryWhereUsedVENDORNO: TStringField
      DisplayLabel = 'Default Vendor'
      DisplayWidth = 15
      FieldName = 'VENDORNO'
      Origin = 'v.vendorno'
      FixedChar = True
      Size = 10
    end
    object QryWhereUsedKIND: TStringField
      DisplayLabel = 'Used As'
      DisplayWidth = 20
      FieldName = 'KIND'
      Origin = 'x.kind'
      Size = 30
    end
    object QryWhereUsedCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object QryWhereUsedREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object QryWhereUsedDESCRIP2: TStringField
      DisplayLabel = 'Item Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object QryWhereUsedOPNO: TStringField
      DisplayLabel = 'Operation / Process #'
      DisplayWidth = 19
      FieldName = 'OPNO'
      Origin = 'op.opno'
      Size = 15
    end
    object QryWhereUsedMAX_LEVEL: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Max Level'
      FieldName = 'MAX_LEVEL'
      ProviderFlags = []
      Precision = 15
      Size = 0
    end
    object QryWhereUsedEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object QryWhereUsedID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryWhereUsedARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Precision = 15
      Size = 0
    end
    object QryWhereUsedPTOPER_ID: TBCDField
      FieldName = 'PTOPER_ID'
      Origin = 'PTOPER_ID'
      Precision = 15
      Size = 0
    end
    object QryWhereUsedSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Origin = 'SNDOP_ID'
      Precision = 15
      Size = 0
    end
    object QryWhereUsedOPMAT_ID: TBCDField
      FieldName = 'OPMAT_ID'
      Origin = 'OPMAT_ID'
      Precision = 15
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 84
    Top = 76
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
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmInvWhereUsedFlat'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 188779 $'
    Left = 120
    Top = 76
  end
end
