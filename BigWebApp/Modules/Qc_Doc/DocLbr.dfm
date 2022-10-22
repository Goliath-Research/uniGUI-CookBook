object FrmDocLbr: TFrmDocLbr
  Left = 65
  Top = 162
  ClientHeight = 230
  ClientWidth = 550
  Caption = 'Document Library'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 550
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search'
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
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = SBSearchClick
    end
  end
  object Grid: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 550
    Height = 203
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 333
    IQComponents.Grid.Height = 117
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcDocLbr
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
    IQComponents.Navigator.DataSource = SrcDocLbr
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 333
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
    DataSource = SrcDocLbr
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Library Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PATH'
        Title.Caption = 'UNC Path'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TYPE'
        Title.Caption = 'Type'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DEFAULT_EXT'
        Title.Caption = 'Default Ext.'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REVISION_PATH'
        Title.Caption = 'UNC Revision Path'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'KEEP_REVISIONS'
        Title.Caption = 'Keep Revisions'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end>
    Marker = 0
  end
  object wwPath: TUniEdit
    Left = 24
    Top = 80
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
    OnKeyDown = wwPathKeyDown
  end
  object wwRevPath: TUniEdit
    Left = 24
    Top = 104
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 3
    OnKeyDown = wwRevPathKeyDown
  end
  object wwType: TUniDBComboBox
    Left = 24
    Top = 131
    Width = 121
    Height = 21
    Hint = ''
    Style = csDropDownList
    Items.Strings = (
      'No Restriction'
      'Secure'
      'Approval')
    TabOrder = 4
  end
  object MainMenu1: TUniMainMenu
    Left = 80
    Top = 32
    object File1: TUniMenuItem
      Caption = '&File'
      object Search1: TUniMenuItem
        Caption = '&Search'
        OnClick = SBSearchClick
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
        Caption = 'Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcDocLbr: TDataSource
    DataSet = TblDocLbr
    Left = 120
    Top = 32
  end
  object TblDocLbr: TFDTable
    BeforeEdit = TblDocLbrBeforeEdit
    BeforePost = TblDocLbrBeforePost
    BeforeDelete = TblDocLbrBeforeDelete
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'DOC_LIBRARY'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'DOC_LIBRARY'
    Left = 136
    Top = 32
    object TblDocLbrDESCRIP: TStringField
      DisplayLabel = 'Library Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Required = True
      Size = 60
    end
    object TblDocLbrPATH: TStringField
      DisplayLabel = 'UNC Path'
      DisplayWidth = 20
      FieldName = 'PATH'
      Size = 150
    end
    object TblDocLbrTYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 15
      FieldName = 'TYPE'
      Size = 15
    end
    object TblDocLbrDEFAULT_EXT: TStringField
      DisplayLabel = 'Default Ext.'
      DisplayWidth = 10
      FieldName = 'DEFAULT_EXT'
      Size = 10
    end
    object TblDocLbrREVISION_PATH: TStringField
      DisplayLabel = 'UNC Revision Path'
      DisplayWidth = 20
      FieldName = 'REVISION_PATH'
      Size = 150
    end
    object TblDocLbrKEEP_REVISIONS: TStringField
      DisplayLabel = 'Keep Revisions'
      DisplayWidth = 12
      FieldName = 'KEEP_REVISIONS'
      FixedChar = True
      Size = 1
    end
    object TblDocLbrID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'Nav'
      'Grid'
      'TblDocLbr')
    SecurityCode = 'FRMDOCLBR'
    AfterApply = SRAfterApply
    Left = 176
    Top = 32
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Document Library'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 232
    Top = 32
  end
  object PkDocLbr: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id               as id,'
      '       descrip          as descrip,'
      '       path             as path,'
      '       default_ext      as default_ext,'
      '       type             as type,'
      '       revision_path    as revision_path,'
      '       keep_revisions   as keep_revisions'
      '  from doc_library'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 216
    Top = 72
    object PkDocLbrID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.DOC_LIBRARY.ID'
      Visible = False
      Size = 0
    end
    object PkDocLbrDESCRIP: TStringField
      DisplayLabel = 'Library Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.DOC_LIBRARY.DESCRIP'
      Size = 60
    end
    object PkDocLbrPATH: TStringField
      DisplayLabel = 'UNC Library Path'
      FieldName = 'PATH'
      Origin = 'IQ.DOC_LIBRARY.PATH'
      Size = 150
    end
    object PkDocLbrDEFAULT_EXT: TStringField
      DisplayLabel = 'Default Ext.'
      FieldName = 'DEFAULT_EXT'
      Origin = 'IQ.DOC_LIBRARY.DEFAULT_EXT'
      Size = 10
    end
    object PkDocLbrTYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'TYPE'
      Origin = 'IQ.DOC_LIBRARY.TYPE'
      Size = 15
    end
    object PkDocLbrREVISION_PATH: TStringField
      DisplayLabel = 'UNC Revision path'
      FieldName = 'REVISION_PATH'
      Origin = 'IQ.DOC_LIBRARY.REVISION_PATH'
      Size = 150
    end
    object PkDocLbrKEEP_REVISIONS: TStringField
      DisplayLabel = 'Keep Revisions'
      FieldName = 'KEEP_REVISIONS'
      Origin = 'IQ.DOC_LIBRARY.KEEP_REVISIONS'
      FixedChar = True
      Size = 1
    end
  end
end
