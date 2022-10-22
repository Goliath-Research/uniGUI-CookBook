object FrmPCMonCapabTypes: TFrmPCMonCapabTypes
  Left = 646
  Top = 290
  ClientHeight = 232
  ClientWidth = 470
  Caption = 'Capability Types'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grdPCMonCapabType: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 470
    Height = 205
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    ShowHint = True
    ParentShowHint = False
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 253
    IQComponents.Grid.Height = 119
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.ShowHint = True
    IQComponents.Grid.DataSource = SrcPCMON_CAPAB_TYPE
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
    IQComponents.Navigator.DataSource = SrcPCMON_CAPAB_TYPE
    IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 253
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 119
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.ShowHint = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ShowHint = True
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcPCMON_CAPAB_TYPE
    Columns = <
      item
        FieldName = 'NAME'
        Title.Caption = 'Name'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 350
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ChartGuageDisplay'
        Title.Caption = 'Chart/Gauge Display'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NO_OF_DATA_POINTS'
        Title.Caption = 'Charting Data Points'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'HIDE_POINT_LABELS'
        Title.Caption = 'Hide Chart Point Labels'
        Width = 7
        CheckBoxField.FieldValues = 'Y;N'
      end>
    Marker = 0
  end
  object pnlNav: TUniPanel
    Left = 0
    Top = 0
    Width = 470
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnSearchDevices: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search for Devices'
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
      OnClick = sbtnSearchDevicesClick
    end
  end
  object wwDBComboDlgCommand: TUniEdit
    Left = 176
    Top = 128
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
    OnKeyDown = wwDBComboDlgCommandKeyDown
    OnKeyPress = wwDBComboDlgCommandKeyPress
  end
  object SrcPCMON_CAPAB_TYPE: TDataSource
    DataSet = TblPCMON_CAPAB_TYPE
    Left = 112
    Top = 64
  end
  object TblPCMON_CAPAB_TYPE: TFDTable
    BeforePost = TblPCMON_CAPAB_TYPEBeforePost
    OnCalcFields = TblPCMON_CAPAB_TYPECalcFields
    IndexFieldNames = 'ID'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'PCMON_CAPAB_TYPE'
    TableName = 'PCMON_CAPAB_TYPE'
    Left = 192
    Top = 56
    object TblPCMON_CAPAB_TYPENAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Size = 50
    end
    object TblPCMON_CAPAB_TYPEDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Size = 50
    end
    object TblPCMON_CAPAB_TYPEDisplayChartName: TStringField
      DisplayLabel = 'Chart/Gauge Display'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'ChartGuageDisplay'
      Size = 35
      Calculated = True
    end
    object TblPCMON_CAPAB_TYPENO_OF_DATA_POINTS: TBCDField
      DisplayLabel = 'Charting Data Points'
      DisplayWidth = 10
      FieldName = 'NO_OF_DATA_POINTS'
      Size = 0
    end
    object TblPCMON_CAPAB_TYPEHIDE_POINT_LABELS: TStringField
      DisplayLabel = 'Hide Chart Point Labels'
      DisplayWidth = 1
      FieldName = 'HIDE_POINT_LABELS'
      Size = 1
    end
    object TblPCMON_CAPAB_TYPEID: TFMTBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 38
    end
    object TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_TYPE: TStringField
      FieldName = 'DISPLAY_OBJECT_TYPE'
      Visible = False
      Size = 5
    end
    object TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_ID: TBCDField
      FieldName = 'DISPLAY_OBJECT_ID'
      Visible = False
      Size = 0
    end
  end
  object pkCapabilityType: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select   a.id as id,'
      '         a.name as name,'
      '         a.descrip as descrip'
      '  from   pcmon_capab_type a')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 312
    Top = 64
    object pkCapabilityTypeID: TFMTBCDField
      FieldName = 'ID'
      Origin = 'IQ.PCMON_CAPAB_TYPE.ID'
      Visible = False
      Size = 38
    end
    object pkCapabilityTypeNAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 50
    end
    object pkCapabilityTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 50
    end
  end
end
