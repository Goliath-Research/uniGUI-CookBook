object FrmSearchLot: TFrmSearchLot
  Left = 0
  Top = 0
  ClientHeight = 282
  ClientWidth = 590
  Caption = 'Search for a Lot# (including Wildcards)'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TUniPanel
    Left = 0
    Top = 0
    Width = 590
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      590
      27)
    object BtnApply: TUniSpeedButton
      Left = 558
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Apply filter'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        D08050D08050D08050D08050FF00FFD08060D08860D08860D08860FF00FFD088
        60D08860D08860D08860FF00FFFF00FF808080808080808080808080FF00FF83
        8383888888888888888888FF00FF888888888888888888888888FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        000000000000000000000000FF00FF000000000000000000000000FF00FF0000
        00000000000000000000FF00FFFF00FF000000000000000000000000FF00FF00
        0000000000000000000000FF00FF000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        D08050D08050D08050D08050FF00FFD08060D08060D08860D08860FF00FFD088
        60D08860D08860D08860FF00FFFF00FF808080808080808080808080FF00FF83
        8383838383888888888888FF00FF888888888888888888888888FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF707070404040000800FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070404040050505FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF707070505050100810FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070705050500B0B0BFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF707070707070404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070404040FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF707070909890504850E3CCB8FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070709696964A4A4ACA
        CACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD3C8B9909090D0C8C0505850BAA69CFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C6909090C7C7C7555555A6
        A6A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        DACBBF808880F0F0F0E0D8D0909890404840D0BCACFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA868686F0F0F0D7D7D796969646
        4646BABABAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE5D3C9
        707070F0E8F0FFF8FFF0E8E0D0D0D0707070404840D9C1AEFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFD3D3D3707070EBEBEBFAFAFAE7E7E7D0D0D070
        7070464646BFBFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFCFC7707070
        C0C8C0FFFFFFF0F8F0F0F0F0D0D8D0B0A8B0606060404840CDB5A2FF00FFFF00
        FFFF00FFFF00FFFF00FFCFCFCF707070C6C6C6FFFFFFF6F6F6F0F0F0D6D6D6AB
        ABAB606060464646B4B4B4FF00FFFF00FFFF00FFFF00FFFF00FFC0B8C0C0C0C0
        D0C8D0C0C0C0B0B8B0B0B0B0B0B0B0A0A0A0808080606060404840FF00FFFF00
        FFFF00FFFF00FFFF00FFBBBBBBC0C0C0CBCBCBC0C0C0B6B6B6B0B0B0B0B0B0A0
        A0A0808080606060464646FF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = BtnApplyClick
    end
    object lblActivityTo: TUniLabel
      Left = 175
      Top = 7
      Width = 38
      Height = 13
      Hint = ''
      Caption = 'To Date'
      TabOrder = 5
    end
    object lblActivityFrom: TUniLabel
      Left = 10
      Top = 7
      Width = 50
      Height = 13
      Hint = ''
      Caption = 'From Date'
      TabOrder = 6
    end
    object Label3: TUniLabel
      Left = 339
      Top = 7
      Width = 23
      Height = 13
      Hint = ''
      Caption = 'Lot#'
      TabOrder = 7
    end
    object EditToDate: TUniDateTimePicker
      Left = 231
      Top = 3
      Width = 94
      Height = 21
      Hint = ''
      DateTime = 42646.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 0
    end
    object EditFromDate: TUniDateTimePicker
      Left = 73
      Top = 3
      Width = 94
      Height = 21
      Hint = ''
      DateTime = 42646.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object EdLotno: TUniEdit
      Left = 368
      Top = 3
      Width = 184
      Height = 21
      Hint = 'Use % as a wildcard,  _ as a single char wildcard.'
      ShowHint = True
      ParentShowHint = False
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 241
    Width = 590
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 380
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = Exit1Click
      end
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 590
    Height = 214
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 373
    IQComponents.Grid.Height = 128
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcTranslog
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
    IQComponents.Navigator.DataSource = SrcTranslog
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 373
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 128
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcTranslog
    Columns = <
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Revision'
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
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext. Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOTNO'
        Title.Caption = 'Lot#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FG_LOTNO'
        Title.Caption = 'FG Lot#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_DATE'
        Title.Caption = 'Trans. Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 336
    Top = 44
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Search for a Lot# (including Wildcards)'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 191388 $'
    Left = 392
    Top = 48
  end
  object QryTranslog: TFDQuery
    Tag = 1
    BeforeOpen = QryTranslogBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.id, '
      '       v.arinvt_id, '
      '       v.class, '
      '       v.itemno, '
      '       v.rev, '
      '       v.descrip,'
      '       v.descrip2, '
      '       v.lotno, '
      '       v.fg_lotno, '
      '       v.trans_date'
      '  from translog v'
      ' where v.trans_date between :AFrom and :ATo '
      '   and v.lotno like :ALotno')
    Left = 48
    Top = 112
    ParamData = <
      item
        Name = 'AFrom'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'ATo'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'ALotno'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryTranslogCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'v.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryTranslogITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 20
      FieldName = 'ITEMNO'
      Origin = 'v.ITEMNO'
      Size = 50
    end
    object QryTranslogREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'v.REV'
      FixedChar = True
      Size = 15
    end
    object QryTranslogDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'v.DESCRIP'
      Size = 100
    end
    object QryTranslogDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP2'
      Origin = 'v.DESCRIP2'
      Size = 100
    end
    object QryTranslogLOTNO: TStringField
      DisplayLabel = 'Lot#'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'v.LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryTranslogFG_LOTNO: TStringField
      DisplayLabel = 'FG Lot#'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'v.FG_LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryTranslogTRANS_DATE: TDateTimeField
      DisplayLabel = 'Trans. Date'
      DisplayWidth = 18
      FieldName = 'TRANS_DATE'
      Origin = 'v.TRANS_DATE'
    end
    object QryTranslogID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'v.ID'
      Visible = False
      Size = 0
    end
    object QryTranslogARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'v.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcTranslog: TDataSource
    DataSet = QryTranslog
    Left = 136
    Top = 60
  end
  object QryTranslogAll: TFDQuery
    Tag = 1
    BeforeOpen = QryTranslogBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.id, '
      '       v.arinvt_id, '
      '       v.class, '
      '       v.itemno, '
      '       v.rev, '
      '       v.descrip,'
      '       v.descrip2, '
      '       v.lotno, '
      '       v.fg_lotno, '
      '       v.trans_date'
      '  from (select id, '
      '               arinvt_id, '
      '               class, '
      '               itemno, '
      '               rev, '
      '               descrip,'
      '               descrip2, '
      '               lotno, '
      '               fg_lotno, '
      '               trans_date'
      '          from translog '
      '        UNION ALL '
      '        select id, '
      '               arinvt_id, '
      '               class, '
      '               itemno, '
      '               rev, '
      '               descrip, '
      '               descrip2,'
      '               lotno, '
      '               fg_lotno,'
      '               trans_date '
      '          from hist_translog ) v'
      ' where v.trans_date between :AFrom and :ATo '
      '   and v.lotno like :ALotno')
    Left = 144
    Top = 120
    ParamData = <
      item
        Name = 'AFrom'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'ATo'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'ALotno'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryTranslogAllCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'v.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryTranslogAllITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 20
      FieldName = 'ITEMNO'
      Origin = 'v.ITEMNO'
      Size = 50
    end
    object QryTranslogAllREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'v.REV'
      FixedChar = True
      Size = 15
    end
    object QryTranslogAllDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'v.DESCRIP'
      Size = 100
    end
    object QryTranslogAllDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP2'
      Origin = 'v.DESCRIP2'
      Size = 100
    end
    object QryTranslogAllLOTNO: TStringField
      DisplayLabel = 'Lot#'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'v.LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryTranslogAllFG_LOTNO: TStringField
      DisplayLabel = 'FG Lot#'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'v.FG_LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryTranslogAllTRANS_DATE: TDateTimeField
      DisplayLabel = 'Trans. Date'
      DisplayWidth = 18
      FieldName = 'TRANS_DATE'
      Origin = 'v.TRANS_DATE'
    end
    object QryTranslogAllID: TBCDField
      FieldName = 'ID'
      Origin = 'v.ID'
      Visible = False
      Size = 0
    end
    object QryTranslogAllARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'v.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
end
