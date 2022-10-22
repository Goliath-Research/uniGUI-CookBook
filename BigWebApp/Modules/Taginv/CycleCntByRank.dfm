object FrmAssignInvCycleCodeByRank: TFrmAssignInvCycleCodeByRank
  Left = 301
  Top = 176
  ClientHeight = 382
  ClientWidth = 713
  Caption = 'Cycle Count Code Ranking'
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
    Width = 713
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnRecalc: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 
        'Recalculate and assign each item cycle count code based on the r' +
        'ank %'
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
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
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
    object DBNavigator1: TUniDBNavigator
      Left = 525
      Top = 1
      Width = 187
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcArinvt
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 713
    Height = 355
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 496
    IQComponents.Grid.Height = 269
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
    IQComponents.HiddenPanel.Left = 496
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 269
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
        FieldName = 'Cycle_Code'
        Title.Caption = 'Cycle Code'
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
        FieldName = 'CodeDescription'
        Title.Caption = 'Cycle Code ~Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CYCLE_COUNT_RANK_LOCK'
        Title.Caption = 'Lock Cycle ~Code'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Item Description'
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
        Title.Caption = 'Item Ext ~Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object wwDataInspectorCycleCount: TwwDataInspector
    Left = 18
    Top = 246
    Width = 375
    Height = 56
    DisableThemes = False
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    DataSource = SrcCycleCount
    Items = <
      item
        DataSource = SrcCycleCount
        DataField = 'DESCRIP'
        Caption = 'Description'
        WordWrap = False
      end
      item
        DataSource = SrcCycleCount
        DataField = 'RANK_PERCENT'
        Caption = 'Rank %'
        WordWrap = False
      end
      item
        DataSource = SrcCycleCount
        DataField = 'COUNT_PER_YEAR'
        Caption = 'Count / Year'
        WordWrap = False
      end>
    DefaultRowHeight = 18
    CaptionWidth = 103
    Options = [ovColumnResize, ovEnterToTab, ovCenterCaptionVert, ovUseOwnBackgroundColors]
    PaintOptions.BackgroundDrawStyle = bdsStretch
    PaintOptions.BackgroundOptions = [coBlendFixedRow, coBlendFixedColumn]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clBlack
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovDottedLine
    LineStyleData = ovDottedLine
    Visible = False
  end
  object wwExpandButtonCycleCount: TwwExpandButton
    Left = 14
    Top = 198
    Width = 94
    Height = 16
    DisableThemes = False
    Grid = wwDataInspectorCycleCount
    OnAfterExpand = wwExpandButtonCycleCountAfterExpand
    Caption = 'wwExpandButtonCycleCount'
    ShowText = True
    TabOrder = 3
    Visible = False
  end
  object wwDBComboDlgCodeDescrip: TUniEdit
    Left = 304
    Top = 156
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 4
    OnKeyDown = wwDBComboDlgCodeDescripKeyDown
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 121
    Top = 152
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    BeforeInsert = QryArinvtBeforeInsert
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    CachedUpdates = True
    OnUpdateRecord = QryArinvtUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.class,'
      '       a.rev,'
      '       a.cycle_count_id,'
      '       a.cycle_count_rank_lock'
      '  from arinvt a,'
      '       cycle_count c'
      ' where a.cycle_count_id = c.id'
      '   and c.kind = :kind'
      '   and misc.eplant_filter( a.eplant_id ) = 1'
      ' order by'
      '       c.seq,'
      '       a.itemno          '
      '       ')
    Left = 112
    Top = 172
    ParamData = <
      item
        Name = 'kind'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryArinvtCycle_Code: TStringField
      DisplayLabel = 'Cycle Code'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Cycle_Code'
      ReadOnly = True
      Calculated = True
    end
    object QryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 18
      FieldName = 'ITEMNO'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object QryArinvtCYCLE_COUNT_RANK_LOCK: TStringField
      DisplayLabel = 'Lock Cycle Code'
      DisplayWidth = 1
      FieldName = 'CYCLE_COUNT_RANK_LOCK'
      Size = 1
    end
    object QryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 29
      FieldName = 'DESCRIP'
      ReadOnly = True
      Size = 35
    end
    object QryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object QryArinvtREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 5
      FieldName = 'REV'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object QryArinvtCodeDescription: TStringField
      DisplayLabel = 'Cycle Code ~Description'
      FieldKind = fkCalculated
      FieldName = 'CodeDescription'
      Size = 35
      Calculated = True
    end
    object QryArinvtCYCLE_COUNT_ID: TBCDField
      FieldName = 'CYCLE_COUNT_ID'
      Precision = 15
      Size = 0
    end
    object QryArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
  end
  object PkArinvt: TIQWebHpick
    BeforeOpen = QryArinvtBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.itemno    as itemno,'
      '       a.descrip   as descrip,'
      '       a.descrip2  as descrip2,'
      '       a.rev       as rev,'
      '       a.class     as class,'
      '       a.onhand    as onhand,'
      '       a.ID        as ID,'
      '       a.eplant_id as eplant_id,'
      '       c.company   as customer_name,'
      '       a.pk_hide   as pk_hide,'
      '       a.non_material as non_material'
      '  from arinvt a,'
      '       arcusto c,'
      '       cycle_count x'
      ' where a.arcusto_id = c.id(+)'
      '   and a.cycle_count_id = x.id'
      '   and x.kind = :kind'
      '   and misc.eplant_filter( a.eplant_id ) = 1'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 149
    Top = 152
    ParamData = <
      item
        Name = 'kind'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkArinvtITEMNO: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext.Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkArinvtREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Size = 15
    end
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkArinvtID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvtONHAND: TBCDField
      DisplayLabel = 'On Hand'
      FieldName = 'ONHAND'
      Origin = 'ARINVT.ONHAND'
    end
    object PkArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'ARINVT.EPLANT_ID'
      Size = 0
    end
    object PkArinvtCUSTOMER_NAME: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 20
      FieldName = 'CUSTOMER_NAME'
      Size = 60
    end
    object PkArinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArinvtNON_MATERIAL: TStringField
      DisplayLabel = 'Non Material'
      FieldName = 'NON_MATERIAL'
      FixedChar = True
      Size = 1
    end
  end
  object SrcCycleCount: TDataSource
    DataSet = QryCycleCount
    Left = 187
    Top = 152
  end
  object QryCycleCount: TFDQuery
    Tag = 1
    BeforeOpen = QryCycleCountBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select descrip,'
      '       rank_percent,'
      '       count_per_year'
      '  from cycle_count'
      ' where id = :cycle_count_id')
    Left = 188
    Top = 164
    ParamData = <
      item
        Name = 'cycle_count_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryCycleCountDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.CYCLE_COUNT.DESCRIP'
      Size = 35
    end
    object QryCycleCountRANK_PERCENT: TBCDField
      FieldName = 'RANK_PERCENT'
      Origin = 'IQ.CYCLE_COUNT.RANK_PERCENT'
      Size = 2
    end
    object QryCycleCountCOUNT_PER_YEAR: TBCDField
      FieldName = 'COUNT_PER_YEAR'
      Origin = 'IQ.CYCLE_COUNT.COUNT_PER_YEAR'
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 227
    Top = 152
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
    ModuleName = 'FrmAssignInvCycleCodeByRank'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197433 $'
    BuildVersion = '176554'
    Left = 265
    Top = 152
  end
  object PkCycleCountCode: TIQWebHpick
    BeforeOpen = QryArinvtBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       seq as seq,'
      '       code as code,'
      '       descrip as descrip,'
      '       rank_percent as rank_percent,'
      '       count_per_year as count_per_year,'
      '       days as days'
      '  from cycle_count'
      ' where kind = :kind'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 304
    Top = 180
    ParamData = <
      item
        Name = 'kind'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkCycleCountCodeID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.CYCLE_COUNT.ID'
      Visible = False
      Size = 0
    end
    object PkCycleCountCodeSEQ: TFMTBCDField
      DisplayLabel = 'Seq'
      FieldName = 'SEQ'
      Origin = 'IQ.CYCLE_COUNT.SEQ'
      Size = 38
    end
    object PkCycleCountCodeCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'IQ.CYCLE_COUNT.CODE'
      Size = 15
    end
    object PkCycleCountCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.CYCLE_COUNT.DESCRIP'
      Size = 35
    end
    object PkCycleCountCodeRANK_PERCENT: TBCDField
      DisplayLabel = 'Rank %'
      FieldName = 'RANK_PERCENT'
      Origin = 'IQ.CYCLE_COUNT.RANK_PERCENT'
      Size = 2
    end
    object PkCycleCountCodeCOUNT_PER_YEAR: TBCDField
      DisplayLabel = 'Counted Per Year'
      FieldName = 'COUNT_PER_YEAR'
      Origin = 'IQ.CYCLE_COUNT.COUNT_PER_YEAR'
      Size = 0
    end
    object PkCycleCountCodeDAYS: TBCDField
      DisplayLabel = 'Days'
      FieldName = 'DAYS'
      Origin = 'IQ.CYCLE_COUNT.DAYS'
      Size = 2
    end
  end
end
