object FrmInvItemSpec: TFrmInvItemSpec
  Left = 324
  Top = 198
  ClientHeight = 230
  ClientWidth = 355
  Caption = 'Item Specification'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 355
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 355
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search ...'
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
      OnClick = sbnSearchClick
    end
  end
  object Grid: TIQUniGridControl
    Left = 0
    Top = 30
    Width = 355
    Height = 200
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 138
    IQComponents.Grid.Height = 114
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcSpecs
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
    IQComponents.Navigator.DataSource = SrcSpecs
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 138
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 114
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcSpecs
    Columns = <
      item
        FieldName = 'Code'
        Title.Caption = 'Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Description'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Rev'
        Title.Caption = 'Rev.'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object dbDescrip: TUniDBLookupComboBox
    Left = 160
    Top = 85
    Width = 121
    Height = 21
    Hint = ''
    ListField = 'ID'
    ListSource = SrcQryMS
    KeyField = 'DESCRIP'
    ListFieldIndex = 0
    TabOrder = 2
    Color = clWindow
  end
  object DBCode: TUniDBLookupComboBox
    Left = 160
    Top = 112
    Width = 121
    Height = 21
    Hint = ''
    ListField = 'ID'
    ListSource = SrcQryMS
    KeyField = 'CODE'
    ListFieldIndex = 0
    TabOrder = 3
    Color = clWindow
  end
  object DBRev: TUniDBLookupComboBox
    Left = 160
    Top = 139
    Width = 121
    Height = 21
    Hint = ''
    ListField = 'ID'
    ListSource = SrcQryMS
    KeyField = 'REV'
    ListFieldIndex = 0
    TabOrder = 4
    Color = clWindow
  end
  object MainMenu1: TUniMainMenu
    Left = 41
    Top = 51
    object File1: TUniMenuItem
      Caption = '&File'
      object MasterSpecs1: TUniMenuItem
        Caption = '&Master Specs'
        OnClick = MasterSpecs1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Item Specs'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197400 $'
    BuildVersion = '176554'
    Left = 76
    Top = 52
  end
  object SrcSpecs: TDataSource
    DataSet = TblSpecs
    Left = 224
  end
  object TblSpecs: TFDTable
    BeforePost = TblSpecsBeforePost
    AfterScroll = TblSpecsAfterScroll
    OnCalcFields = TblSpecsCalcFields
    IndexFieldNames = 'ARINVT_ID'
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ARINVT_SPEC'
    TableName = 'ARINVT_SPEC'
    Left = 168
    object TblSpecsCode: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Code'
      Size = 30
      Calculated = True
    end
    object TblSpecsDescription: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Description'
      Size = 50
      Calculated = True
    end
    object TblSpecsRev: TStringField
      DisplayLabel = 'Rev.'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'Rev'
      Size = 15
      Calculated = True
    end
    object TblSpecsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblSpecsARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object TblSpecsMASTER_SPEC_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MASTER_SPEC_ID'
      Visible = False
      Size = 0
    end
  end
  object QryMS: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from master_spec')
    Left = 24
    Top = 152
    object QryMSDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'MASTER_SPEC.DESCRIP'
      Size = 50
    end
    object QryMSCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 15
      FieldName = 'CODE'
      Origin = 'MASTER_SPEC.CODE'
      Size = 30
    end
    object QryMSREV: TStringField
      DisplayLabel = 'Rev.'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'MASTER_SPEC.REV'
      Size = 15
    end
    object QryMSID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'MASTER_SPEC.ID'
      Visible = False
      Size = 0
    end
  end
  object PkItemSpec: TIQWebHpick
    BeforeOpen = PkItemSpecBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id as id,'
      '       a.master_spec_id as master_spec_id,'
      '       m.code as code,'
      '       m.descrip as descrip,'
      '       m.rev as rev'
      '  from arinvt_spec a, master_spec m'
      ' where a.arinvt_id = :arinvt_id'
      '   and a.master_spec_id = m.id'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 95
    Top = 152
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkItemSpecID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT_SPEC.ID'
      Visible = False
      Size = 0
    end
    object PkItemSpecMASTER_SPEC_ID: TBCDField
      FieldName = 'MASTER_SPEC_ID'
      Origin = 'IQ.ARINVT_SPEC.MASTER_SPEC_ID'
      Visible = False
      Size = 0
    end
    object PkItemSpecCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'IQ.MASTER_SPEC.CODE'
      Size = 30
    end
    object PkItemSpecDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.MASTER_SPEC.DESCRIP'
      Size = 50
    end
    object PkItemSpecREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'IQ.MASTER_SPEC.REV'
      Size = 15
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'Grid'
      'Nav'
      'TblSpecs'
      'sbnSearch'
      'MasterSpecs1'
      'dbDescrip'
      'DBCode'
      'DBRev')
    SecurityCode = 'FRMINVITEMSPEC'
    Left = 216
    Top = 184
  end
  object SrcQryMS: TDataSource
    DataSet = QryMS
    Left = 264
    Top = 16
  end
end
