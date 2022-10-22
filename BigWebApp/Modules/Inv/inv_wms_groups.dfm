object FrmInvWmsGroups: TFrmInvWmsGroups
  Left = 0
  Top = 0
  HelpContext = 25737
  ClientHeight = 459
  ClientWidth = 557
  Caption = 'WMS Inventory Groups'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 185
    Width = 557
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlTopMain: TUniPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 185
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 1
      Top = 1
      Width = 555
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnSearch: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 26
        Height = 25
        Hint = 'Search Item'
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
        ParentColor = False
        Color = clWindow
        OnClick = sbtnSearchClick
      end
    end
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 555
      Height = 157
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 338
      IQComponents.Grid.Height = 71
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcWmsInvGroup
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
      IQComponents.Navigator.DataSource = SrcWmsInvGroup
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 338
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 71
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcWmsInvGroup
      Columns = <
        item
          FieldName = 'CODE'
          Title.Caption = 'Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object dpnlClientMain: TUniPanel
    Left = 0
    Top = 189
    Width = 557
    Height = 270
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 555
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = ' Inventory Items'
    end
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 555
      Height = 242
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 338
      IQComponents.Grid.Height = 156
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcArinvt
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
      IQComponents.Navigator.DataSource = SrcArinvt
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 338
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 156
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcArinvt
      Columns = <
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Rev'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ONHAND'
          Title.Caption = 'OnHand'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UNIT'
          Title.Caption = 'Unit'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Ext Description'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 124
    Top = 68
    object File1: TUniMenuItem
      Caption = 'File'
      object Close1: TUniMenuItem
        Caption = 'Close'
        OnClick = Close1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmInvWmsGroups'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193639 $'
    BuildVersion = '176554'
    Left = 156
    Top = 68
  end
  object SrcWmsInvGroup: TDataSource
    DataSet = QryWmsInvGroup
    Left = 32
    Top = 68
  end
  object QryWmsInvGroup: TFDQuery
    BeforePost = QryWmsInvGroupBeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'wms_inv_group'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLWmsInvGroup
    SQL.Strings = (
      'select id, '
      '       code, '
      '       descrip'
      '  from wms_inv_group'
      ' order by code')
    Left = 32
    Top = 97
    object QryWmsInvGroupCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 25
      FieldName = 'CODE'
      Origin = 'IQ.WMS_INV_GROUP.CODE'
      Required = True
      Size = 25
    end
    object QryWmsInvGroupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'IQ.WMS_INV_GROUP.DESCRIP'
      Size = 60
    end
    object QryWmsInvGroupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.WMS_INV_GROUP.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLWmsInvGroup: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into wms_inv_group'
      '  (ID, CODE, DESCRIP)'
      'values'
      '  (:ID, :CODE, :DESCRIP)')
    ModifySQL.Strings = (
      'update wms_inv_group'
      'set'
      '  ID = :ID,'
      '  CODE = :CODE,'
      '  DESCRIP = :DESCRIP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from wms_inv_group'
      'where'
      '  ID = :OLD_ID')
    Left = 32
    Top = 128
  end
  object PkWmsInvGroup: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       code as code,'
      '       descrip as descrip'
      '  from wms_inv_group')
    OnIQModify = PkWmsInvGroupIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 124
    Top = 100
    object PkWmsInvGroupID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.WMS_INV_GROUP.ID'
      Visible = False
      Size = 0
    end
    object PkWmsInvGroupCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'IQ.WMS_INV_GROUP.CODE'
      Size = 25
    end
    object PkWmsInvGroupDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.WMS_INV_GROUP.DESCRIP'
      Size = 60
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'QryWmsInvGroup')
    SecurityCode = 'FRMINVWMSGROUPS'
    Left = 156
    Top = 100
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 72
    Top = 68
  end
  object QryArinvt: TFDQuery
    BeforeInsert = AbortInsert
    CachedUpdates = True
    MasterSource = SrcWmsInvGroup
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.rev,'
      '       a.class,'
      '       a.onhand,'
      '       a.ID,'
      '       a.eplant_id,'
      '       a.unit,'
      '       a.wms_inv_group_id'
      '  from arinvt a'
      ' where a.wms_inv_group_id = :id'
      '')
    Left = 72
    Top = 99
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryArinvtCLASS2: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      Origin = 'a.CLASS'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object QryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'a.ITEMNO'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object QryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 32
      FieldName = 'DESCRIP'
      Origin = 'a.DESCRIP'
      ReadOnly = True
      Size = 100
    end
    object QryArinvtREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'a.REV'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object QryArinvtONHAND: TBCDField
      DisplayLabel = 'OnHand'
      DisplayWidth = 10
      FieldName = 'ONHAND'
      Origin = 'a.ONHAND'
      ReadOnly = True
    end
    object QryArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'a.EPLANT_ID'
      ReadOnly = True
      Size = 0
    end
    object QryArinvtUNIT: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Origin = 'a.UNIT'
      ReadOnly = True
      Size = 10
    end
    object QryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP2'
      Origin = 'a.DESCRIP2'
      ReadOnly = True
      Size = 100
    end
    object QryArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'a.ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryArinvtWMS_INV_GROUP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WMS_INV_GROUP_ID'
      Origin = 'IQ.ARINVT.WMS_INV_GROUP_ID'
      Visible = False
      Size = 0
    end
  end
  object PkArinvt: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.itemno as itemno,'
      '       a.descrip as descrip,'
      '       a.descrip2 as descrip2,'
      '       a.rev as rev,'
      '       a.class as class,'
      '       a.onhand as onhand,'
      '       a.ID as id,'
      '       a.eplant_id as eplant_id,'
      '       a.unit as unit,'
      '       a.pk_hide as pk_hide '
      '  from arinvt a'
      ' where'
      '       misc.eplant_filter( a.eplant_id ) = 1'
      '   and a.wms_inv_group_id is null'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 188
    Top = 100
    object PkArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object PkArinvtDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Item Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object PkArinvtREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object PkArinvtONHAND: TBCDField
      DisplayLabel = 'OnHand'
      FieldName = 'ONHAND'
      Origin = 'a.onhand'
    end
    object PkArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Size = 0
    end
    object PkArinvtUNIT: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Origin = 'a.unit'
      Size = 10
    end
    object PkArinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
