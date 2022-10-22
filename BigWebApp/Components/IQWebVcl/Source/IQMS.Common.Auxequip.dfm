object FrmIQAuxEquip: TFrmIQAuxEquip
  Left = 261
  Top = 212
  ClientHeight = 270
  ClientWidth = 513
  Caption = 'Auxiliary Equipment'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 270
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pnlAuxNav: TUniPanel
      Left = 1
      Top = 1
      Width = 511
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnAuxTooling: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Assign Tooling Info'
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
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          C7C0BB202830CCBCB0FF00FFFF00FFFF00FFFF00FFFF00FFDDBFA6705840DAB7
          9CFF00FFFF00FFFF00FFFF00FFFF00FFC0C0C0292929BBBBBBFF00FFFF00FFFF
          00FFFF00FFFF00FFBCBCBC565656B5B5B5FF00FFFF00FFFF00FFFF00FFFF00FF
          70809030B8F0101820CCBCAFFF00FFFF00FFFF00FFDFC3AB705840F0E8E0B0A0
          90FF00FFFF00FFFF00FFFF00FFFF00FF838383C1C1C1191919BBBBBBFF00FFFF
          00FFFF00FFC1C1C1565656E7E7E79E9E9EFF00FFFF00FFFF00FFFF00FFFF00FF
          D0C6BF70809030B8F0202840CCBBADFF00FFE1C7B0705840F0F0F0B0A090FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC5C5C5838383C1C1C12E2E2EBABABAFF
          00FFC5C5C5565656F0F0F09E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFD0C6BD70809030B8F0303850C0A99C705840FFF8F0B0A090FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5C5C5838383C1C1C13D3D3DA8
          A8A8565656F7F7F79E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFD0C4BC70809040A8D0705840FFFFFFB0A090FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC3C3C3838383ADADAD56
          5656FFFFFF9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFBEB0A5705840FFFFFFB0A090CAB6A6FF00FFFF00FFECC8
          ACD8B498805850D4AD8FFF00FFFF00FFFF00FFFF00FFFF00FFAFAFAF565656FF
          FFFF9E9E9EB5B5B5FF00FFFF00FFC6C6C6B2B2B25A5A5AABABABFF00FFFF00FF
          FF00FFFF00FFE1C9B5705840FFFFFFB0A09030B8F0606070B6A597FF00FFCEAB
          93806850F0F0F0908070FF00FFFF00FFFF00FFFF00FFC7C7C7565656FFFFFF9E
          9E9EC1C1C1646464A4A4A4FF00FFA9A9A9656565F0F0F07E7E7EFF00FFFF00FF
          FF00FFE2CBB7705840FFFFFFB0A090CFC1B770809070A0A09080709070608060
          50957C64B09080CAAD96FF00FFFF00FFFF00FFC9C9C9565656FFFFFF9E9E9EC0
          C0C08383839D9D9D7E7E7E7070706060607979798F8F8FABABABD4BEB2A08070
          806850907060FFFFFFB0A090FF00FFFF00FFC2B3A5A09080F0F0F0E0E0D0D0C8
          C09B8169D3B095E4BB9DBDBDBD808080656565707070FFFFFF9E9E9EFF00FFFF
          00FFB2B2B28E8E8EF0F0F0DDDDDDC7C7C77E7E7EAEAEAEB9B9B9B0A090C0B0A0
          C0B0A0C0B0A0908070FF00FFFF00FFFF00FFFF00FFC0A090FFFFFFFDF9F6F0E0
          E0C09E8AFF00FFFF00FF9E9E9EAEAEAEAEAEAEAEAEAE7E7E7EFF00FFFF00FFFF
          00FFFF00FFA0A0A0FFFFFFF9F9F9E2E2E29D9D9DFF00FFFF00FFB0A090FDEADC
          F1DCCBC0B0A0A08070FF00FFFF00FFFF00FFDAC2AEA08870FEF6FBF0DFDDC3A2
          92E4C1A6FF00FFFF00FF9E9E9EE9E9E9DBDBDBAEAEAE808080FF00FFFF00FFFF
          00FFC0C0C0858585F8F8F8E1E1E1A2A2A2BFBFBFFF00FFFF00FFFF00FFFF00FF
          FDEBDFD0B8B0C0A8A0FF00FFEED4BF9D846C907060B4ABA2C6ADA3D0AF9CE6C5
          ABFF00FFFF00FFFF00FFFF00FFFF00FFEAEAEAB8B8B8A8A8A8FF00FFD2D2D281
          8181707070AAAAAAADADADAEAEAEC3C3C3FF00FFFF00FFFF00FFFF00FFFF00FF
          B0A090B0A090E4CEBCFF00FFC0A8A0C0A090D0B0A0C0B0A0E0C5AFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9ECCCCCCFF00FFA8A8A8A0
          A0A0AFAFAFAEAEAEC3C3C3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnAuxToolingClick
      end
      object NavMain: TUniDBNavigator
        Left = 327
        Top = 1
        Width = 183
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcAux
        VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        BeforeAction = NavMainBeforeAction
      end
    end
    object Panel6: TUniPanel
      Left = 1
      Top = 28
      Width = 511
      Height = 241
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = 'pnlIQSearchAux'
      object Grid: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 509
        Height = 239
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 292
        IQComponents.Grid.Height = 153
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcAux
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
        IQComponents.Navigator.DataSource = SrcAux
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 292
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 153
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcAux
        Columns = <
          item
            FieldName = 'AUX_DESC'
            Title.Caption = 'Description'
            Width = 119
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'AUX_RATE'
            Title.Caption = 'Rate'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'HOW_MANY'
            Title.Caption = 'How Many'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DIVISION_NAME'
            Title.Caption = 'Division'
            Width = 140
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANT_NAME'
            Title.Caption = 'EPlant'
            Width = 140
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
        object cmbDivision: TUniDBLookupComboBox
          Left = 128
          Top = 104
          Width = 121
          Height = 21
          Hint = ''
          ListFieldIndex = 0
          TabOrder = 3
          Color = clWindow
          OnDropDown = cmbDivisionDropDown
        end
        object cmbEPlant: TUniEdit
          Left = 128
          Top = 128
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 2
        end
      end
    end
  end
  object SrcAux: TDataSource
    DataSet = QryAux
    OnDataChange = SrcAuxDataChange
    Left = 24
    Top = 24
  end
  object QryAux: TFDQuery
    BeforeOpen = DoAssignEPlantFilter
    BeforePost = DoBeforePost
    AfterPost = DoAfterPost
    AfterDelete = DoAfterPost
    Filtered = True
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateObject = UpdateSQLAux
    SQL.Strings = (
      'select'
      '     aux.id as id,'
      '     aux.aux_desc as aux_desc,'
      '     aux.aux_rate as aux_rate,'
      '     aux.how_many as how_many,'
      '     aux.eplant_id as eplant_id,'
      '     eplant.name as eplant_name,'
      '     aux.division_id as division_id,'
      '     division.name as division_name'
      'from'
      '     aux,'
      '     eplant,'
      '     division'
      'where'
      '     eplant.id(+) = aux.eplant_id and'
      '     division.id(+) = aux.division_id'
      ''
      ' '
      ' ')
    Left = 26
    Top = 38
    object QryAuxAUX_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 17
      FieldName = 'AUX_DESC'
      Origin = 'AUX.AUX_DESC'
      FixedChar = True
      Size = 50
    end
    object QryAuxAUX_RATE: TBCDField
      DisplayLabel = 'Rate'
      DisplayWidth = 10
      FieldName = 'AUX_RATE'
      Origin = 'AUX.AUX_RATE'
      Size = 2
    end
    object QryAuxHOW_MANY: TBCDField
      DisplayLabel = 'How Many'
      DisplayWidth = 10
      FieldName = 'HOW_MANY'
      Origin = 'AUX.HOW_MANY'
      Size = 0
    end
    object QryAuxDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 20
      FieldName = 'DIVISION_NAME'
      Origin = 'DIVISION.NAME'
      Size = 25
    end
    object QryAuxEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 20
      FieldName = 'EPLANT_NAME'
      Origin = 'EPLANT.NAME'
      Size = 30
    end
    object QryAuxDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Origin = 'AUX.DIVISION_ID'
      Visible = False
      Size = 0
    end
    object QryAuxEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 8
      FieldName = 'EPLANT_ID'
      Origin = 'AUX.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryAuxID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'AUX.ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLAux: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into aux'
      '  (ID, AUX_DESC, AUX_RATE, HOW_MANY, EPLANT_ID, DIVISION_ID)'
      'values'
      
        '  (:ID, :AUX_DESC, :AUX_RATE, :HOW_MANY, :EPLANT_ID, :DIVISION_I' +
        'D)')
    ModifySQL.Strings = (
      'update aux'
      'set'
      '  ID = :ID,'
      '  AUX_DESC = :AUX_DESC,'
      '  AUX_RATE = :AUX_RATE,'
      '  HOW_MANY = :HOW_MANY,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  DIVISION_ID = :DIVISION_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from aux'
      'where'
      '  ID = :OLD_ID')
    Left = 60
    Top = 38
  end
  object QryDivisionLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, name, descrip from division'
      'order by name')
    Left = 137
    Top = 34
    object QryDivisionLookupNAME: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'IQ.DIVISION.NAME'
      Size = 25
    end
    object QryDivisionLookupDESCRIP: TStringField
      DisplayLabel = 'Division Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.DIVISION.DESCRIP'
      Size = 50
    end
    object QryDivisionLookupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.DIVISION.ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 328
    Top = 155
    object File1: TUniMenuItem
      Caption = '&File'
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Auxiliary Equipment'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193868 $'
    BuildVersion = '176554'
    Left = 320
    Top = 91
  end
end
