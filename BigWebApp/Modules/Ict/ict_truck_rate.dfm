object FrmICT_TruckRate: TFrmICT_TruckRate
  Left = 0
  Top = 0
  ClientHeight = 452
  ClientWidth = 963
  Caption = 'Full Truck Rate Table'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 307
    Top = 0
    Width = 4
    Height = 452
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 307
    Height = 452
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel13: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 305
      Height = 22
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Style = [fsBold]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = '  From'
      Color = clWindow
    end
    object wwDBGridFrom: TIQUniGridControl
      Left = 1
      Top = 23
      Width = 305
      Height = 428
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 88
      IQComponents.Grid.Height = 342
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcSource
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
      IQComponents.Navigator.DataSource = SrcSource
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 88
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 342
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcSource
      Columns = <
        item
          FieldName = 'SOURCE'
          Title.Caption = 'Source Origin'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NAME'
          Title.Caption = 'Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel2: TUniPanel
    Left = 311
    Top = 0
    Width = 652
    Height = 452
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 650
      Height = 22
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Style = [fsBold]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = '  To'
      Color = clWindow
    end
    object wwDBGridTo: TIQUniGridControl
      Left = 1
      Top = 51
      Width = 650
      Height = 400
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 433
      IQComponents.Grid.Height = 314
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcTruckRate
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
      IQComponents.Navigator.DataSource = SrcTruckRate
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 433
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 314
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcTruckRate
      Columns = <
        item
          FieldName = 'TO_SOURCE'
          Title.Caption = 'Destination Origin'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SOURCE_NAME'
          Title.Caption = 'Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COST'
          Title.Caption = 'Freight Cost'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EFFECT_DATE'
          Title.Caption = 'Effective Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DEACTIVE_DATE'
          Title.Caption = 'Inactive Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 23
      Width = 650
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      object sbHideInactive: TUniSpeedButton
        Left = 4
        Top = 3
        Width = 25
        Height = 25
        Hint = 'Hide inactives'
        ShowHint = True
        ParentShowHint = False
        GroupIndex = 1
        AllowAllUp = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFC07040B05830B05830A05020A050209048209048
          20904020804020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7171715C
          5C5C5C5C5C5353535353534A4A4A4A4A4A454545424242FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFC07850F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0
          B0F0D0B0904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979D9
          D9D9D5D5D5D0D0D0CDCDCDCDCDCDCDCDCDCDCDCD454545FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFD08860FFF8F0FFF8F0FFF0E0FFF0E0FFE8E0FFE8
          E0F0D0B0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888F7
          F7F7F7F7F7EEEEEEEEEEEEE9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07040
          B05830B05830A05020A05020904820904820904020804020FFF0F0FFE8E0FFE8
          E0F0D0B0904820FF00FFFF00FF7171715C5C5C5C5C5C5353535353534A4A4A4A
          4A4A454545424242F2F2F2E9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07850
          F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0B0F0D0B0904020FFF8F0FFF0E0FFF0
          E0F0D0C0A04820FF00FFFF00FF797979D9D9D9D5D5D5D0D0D0CDCDCDCDCDCDCD
          CDCDCDCDCD454545F7F7F7EEEEEEEEEEEED0D0D04D4D4DFF00FFFF00FFD08860
          FFF8F0E09060D08050D08050D08050D08050F0D0B0904820FFFFFFFFF0F0FFF0
          F0F0D8D0A05020FF00FFFF00FF888888F7F7F790909080808080808080808080
          8080CDCDCD4A4A4AFFFFFFF2F2F2F2F2F2D9D9D9535353FF00FFFF00FFD09070
          FFFFFFFFFFFFFFF0F0FFF0F0FFE8E0FFE8E0F0D0B0904820FFFFFFFFF8F0FFF8
          F0F0E0E0A05020FF00FFFF00FF909090FFFFFFFFFFFFF2F2F2F2F2F2E9E9E9E9
          E9E9CDCDCD4A4A4AFFFFFFF7F7F7F7F7F7E2E2E2535353FF00FFFF00FFE0A080
          FFFFFFF0A880E09870E09060D08050D08050F0D0C0A04820FFFFFFFFFFFFFFFF
          FFFFFFFFA05020FF00FFFF00FFA0A0A0FFFFFFA8A8A898989890909080808080
          8080D0D0D04D4D4DFFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0A890
          FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0F0F0D8D0A05020FFFFFFFFFFFFFFFF
          FFFFFFFFA05020FF00FFFF00FFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F2
          F2F2D9D9D9535353FFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0B8A0
          FFFFFFFFB090F0B090F0A880F09870E09060F0E0E0A05020E0A080D09070D088
          60C07850C07040FF00FFFF00FFB7B7B7FFFFFFB1B1B1B0B0B0A8A8A89A9A9A90
          9090E2E2E2535353A0A0A0909090888888797979717171FF00FFFF00FFF0C0A0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
          F0C0B0F0C0B0F0B8A0E0A080D09070D08860C07850C07040FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFC7C7C7C1C1C1C1C1C1B8B8B8A0A0A090909088
          8888797979717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbHideInactiveClick
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 705
    Top = 137
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
    ModuleName = 'FrmICT_TruckRate'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195340 $'
    BuildVersion = '176554'
    Left = 735
    Top = 137
  end
  object SrcSource: TDataSource
    DataSet = QrySource
    Left = 704
    Top = 184
  end
  object QrySource: TFDQuery
    AfterScroll = QrySourceAfterScroll
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '#39'EPLANT'#39' as source,'
      '        id as source_id,'
      '        name'
      '   from eplant'
      ' UNION ALL'
      'select '#39'DIVISION'#39','
      '        id,'
      '        name'
      '  from division'
      'order by 1,3'
      '')
    Left = 704
    Top = 212
    object QrySourceSOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 10
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Size = 8
    end
    object QrySourceSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Origin = 'SOURCE_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QrySourceNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 30
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 30
    end
  end
  object SrcTruckRate: TDataSource
    DataSet = QryTruckRate
    Left = 755
    Top = 184
  end
  object QryTruckRate: TFDQuery
    BeforeOpen = QryTruckRateBeforeOpen
    BeforePost = QryTruckRateBeforePost
    OnNewRecord = QryTruckRateNewRecord
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert]
    SQL.Strings = (
      'select t.id,'
      '       t.from_source,'
      '       t.from_source_id,'
      '       t.to_source,'
      '       t.to_source_id,'
      '       t.cost,'
      '       t.effect_date,'
      '       t.deactive_date,'
      
        '       substr(truck_misc.get_source_description( t.to_source, t.' +
        'to_source_id ),1,30) as source_name'
      '  from truck_rate t'
      ' where t.from_source = :source'
      '   and t.from_source_id = :source_id'
      ''
      '   and (:hide_inactive = 0'
      '        or'
      
        '        :hide_inactive = 1 and trunc(sysdate) between nvl(effect' +
        '_date, trunc(sysdate)) and nvl(deactive_date, trunc(sysdate)))'
      ' order by '
      '       t.to_source,'
      
        '       truck_misc.get_source_description( t.to_source, t.to_sour' +
        'ce_id ),'
      '       t.effect_date,'
      '       t.id'
      '       '
      '       '
      '       ')
    Left = 755
    Top = 212
    ParamData = <
      item
        Name = 'SOURCE'
        DataType = ftString
        ParamType = ptInput
        Size = 9
        Value = 'DIVISION'
      end
      item
        Name = 'SOURCE_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 40000c
      end
      item
        Name = 'HIDE_INACTIVE'
        DataType = ftBCD
        FDDataType = dtUInt32
        ParamType = ptInput
      end>
    object QryTruckRateTO_SOURCE: TStringField
      DisplayLabel = 'To Source'
      DisplayWidth = 30
      FieldName = 'TO_SOURCE'
      Origin = 'TO_SOURCE'
      Required = True
      Size = 30
    end
    object QryTruckRateSOURCE_NAME: TStringField
      DisplayLabel = 'To Source Name'
      DisplayWidth = 30
      FieldName = 'SOURCE_NAME'
      Origin = 'SOURCE_NAME'
      ProviderFlags = []
      Size = 30
    end
    object QryTruckRateCOST: TFMTBCDField
      DisplayLabel = 'Freight Cost'
      DisplayWidth = 16
      FieldName = 'COST'
      Origin = 'COST'
      Precision = 15
      Size = 6
    end
    object QryTruckRateEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
      Origin = 'EFFECT_DATE'
    end
    object QryTruckRateDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Deactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
      Origin = 'DEACTIVE_DATE'
    end
    object QryTruckRateID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTruckRateFROM_SOURCE: TStringField
      DisplayLabel = 'From Source'
      FieldName = 'FROM_SOURCE'
      Origin = 'FROM_SOURCE'
      Required = True
      Visible = False
      Size = 30
    end
    object QryTruckRateFROM_SOURCE_ID: TBCDField
      FieldName = 'FROM_SOURCE_ID'
      Origin = 'FROM_SOURCE_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTruckRateTO_SOURCE_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'TO_SOURCE_ID'
      Origin = 'TO_SOURCE_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain')
    SecurityCode = 'FRMICT_TRUCKRATE'
    Left = 766
    Top = 137
  end
end
