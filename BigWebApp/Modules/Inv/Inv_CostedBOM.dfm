object FrmCostedBOM: TFrmCostedBOM
  Left = 199
  Top = 141
  HelpContext = 7155
  ClientHeight = 328
  ClientWidth = 518
  Caption = 'Costed BOM'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 175
    Width = 518
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 518
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 518
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object rbtnCurrent: TUniRadioButton
      Left = 8
      Top = 5
      Width = 61
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Current'
      ParentFont = False
      Font.Name = 'Segoe UI'
      TabOrder = 0
      OnClick = ApplySourceSelection
    end
    object rbtnBudget: TUniRadioButton
      Left = 170
      Top = 5
      Width = 65
      Height = 17
      Hint = ''
      Caption = 'Budget'
      ParentFont = False
      Font.Name = 'Segoe UI'
      TabOrder = 2
      OnClick = ApplySourceSelection
    end
    object rbtnForecast: TUniRadioButton
      Left = 256
      Top = 5
      Width = 69
      Height = 17
      Hint = ''
      Caption = 'Forecast'
      ParentFont = False
      Font.Name = 'Segoe UI'
      TabOrder = 3
      OnClick = ApplySourceSelection
    end
    object rbtnFuture: TUniRadioButton
      Left = 85
      Top = 5
      Width = 65
      Height = 17
      Hint = ''
      Caption = 'Future'
      ParentFont = False
      Font.Name = 'Segoe UI'
      TabOrder = 1
      OnClick = ApplySourceSelection
    end
  end
  object wwDataInspector1: TwwDataInspector
    Left = 0
    Top = 178
    Width = 518
    Height = 150
    TabStop = False
    DisableThemes = False
    Align = alClient
    TabOrder = 4
    DataSource = DataSource1
    Items = <
      item
        DataSource = DataSource1
        Caption = 'Details'
        Expanded = True
        Items = <
          item
            DataSource = DataSource1
            DataField = 'ITEM_DESCRIP'
            Caption = 'Item Description'
            Items = <
              item
                DataSource = DataSource1
                DataField = 'CLASS'
                Caption = 'Class'
                WordWrap = False
              end
              item
                DataSource = DataSource1
                DataField = 'REV'
                Caption = 'Revision'
                WordWrap = False
              end
              item
                DataSource = DataSource1
                DataField = 'UNIT'
                Caption = 'UOM'
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = DataSource1
            DataField = 'DESCRIP'
            Caption = 'Cost Contribution'
            Items = <
              item
                DataSource = DataSource1
                DataField = 'TYPE'
                Caption = 'Type'
                WordWrap = False
              end
              item
                DataSource = DataSource1
                DataField = 'NOTE'
                Caption = 'Note'
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = DataSource1
            DataField = 'INTRODUCED_BY_DESCRIP'
            Caption = 'Introduced By'
            Items = <
              item
                DataSource = DataSource1
                DataField = 'INTRODUCED_BY_ITEMNO'
                Caption = 'Item #'
                WordWrap = False
              end>
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = DataSource1
        DataField = 'CostCalcDateDisp'
        Caption = 'Calculated Date'
        Tag = 1
        Options = []
        WordWrap = False
      end>
    CaptionWidth = 125
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovDottedLine
    LineStyleData = ovDottedLine
  end
  object pnlGrid: TUniPanel
    Left = 0
    Top = 30
    Width = 518
    Height = 145
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = 'pnlGrid'
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 516
      Height = 143
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 299
      IQComponents.Grid.Height = 57
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = DataSource1
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
      IQComponents.Navigator.DataSource = DataSource1
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 299
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 57
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = DataSource1
      Columns = <
        item
          FieldName = 'ELEM_DESCRIP'
          Title.Caption = 'Element'
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
          FieldName = 'PTSPER'
          Title.Caption = 'Quantity Per'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STD_COST'
          Title.Caption = 'Standard Cost'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EXT_COST'
          Title.Caption = 'Extended Cost'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 131
    Top = 81
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    BeforeInsert = AbortBeforeAnyChange
    BeforeEdit = AbortBeforeAnyChange
    BeforeDelete = AbortBeforeAnyChange
    OnCalcFields = Query1CalcFields
    Filtered = True
    OnFilterRecord = Query1FilterRecord
    CachedUpdates = True
    OnUpdateRecord = Query1UpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '
      '       e.elem_descrip,'
      '       a1.class,'
      '       a1.itemno,'
      '       a1.descrip as item_descrip,'
      '       a1.rev,'
      '       u.ptsper,'
      '       u.std_cost,'
      '       ext_cost,'
      '       u.unit,'
      '       u.descrip,'
      '       u.type,'
      '       a2.itemno as introduced_by_itemno,'
      '       a2.descrip as introduced_by_descrip,'
      '       u.arinvt_id,'
      '       u.introduced_by_arinvt_id,'
      '       u.note,'
      
        '       (select eplant_id from standard where id = a2.standard_id' +
        ') as introduced_by_eplant_id,'
      '       a2.standard_id as introduced_by_standard_id'
      '  from '
      '       /* _SELECT_FROM_START_ */'
      '       arinvt_use u,'
      '       /* _SELECT_FROM_END_   */'
      '       arinvt a1,     '
      '       arinvt a2,'
      '       elements e'
      ' where'
      '       u.arinvt_id = a1.id(+)'
      '   and u.introduced_by_arinvt_id = a2.id(+)'
      '   and u.elements_id = e.id'
      '   and u.parent_arinvt_id = :arinvt_id'
      ' order by'
      '       e.elem_descrip'
      ' '
      ' ')
    Left = 131
    Top = 105
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end>
    object Query1ELEM_DESCRIP: TStringField
      DisplayLabel = 'Element'
      DisplayWidth = 13
      FieldName = 'ELEM_DESCRIP'
      FixedChar = True
      Size = 30
    end
    object Query1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 14
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object Query1PTSPER: TFMTBCDField
      DisplayLabel = 'Quantity Per'
      DisplayWidth = 11
      FieldName = 'PTSPER'
      DisplayFormat = '########0.######'
      Size = 6
    end
    object Query1STD_COST: TFMTBCDField
      DisplayLabel = 'Standard Cost'
      DisplayWidth = 13
      FieldName = 'STD_COST'
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object Query1EXT_COST: TFMTBCDField
      DisplayLabel = 'Extended Cost'
      DisplayWidth = 13
      FieldName = 'EXT_COST'
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object Query1ITEM_DESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 19
      FieldName = 'ITEM_DESCRIP'
      Visible = False
      Size = 100
    end
    object Query1UNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Visible = False
      Size = 10
    end
    object Query1DESCRIP: TStringField
      DisplayLabel = 'Cost Contribution'
      DisplayWidth = 31
      FieldName = 'DESCRIP'
      Visible = False
      Size = 200
    end
    object Query1TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 15
      FieldName = 'TYPE'
      Visible = False
      Size = 15
    end
    object Query1INTRODUCED_BY_ITEMNO: TStringField
      DisplayLabel = 'Introduced By Item #'
      DisplayWidth = 25
      FieldName = 'INTRODUCED_BY_ITEMNO'
      Visible = False
      FixedChar = True
      Size = 50
    end
    object Query1INTRODUCED_BY_DESCRIP: TStringField
      DisplayLabel = 'Introduced by Item Description'
      DisplayWidth = 35
      FieldName = 'INTRODUCED_BY_DESCRIP'
      Visible = False
      Size = 100
    end
    object Query1ARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object Query1INTRODUCED_BY_ARINVT_ID: TBCDField
      FieldName = 'INTRODUCED_BY_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object Query1CLASS: TStringField
      FieldName = 'CLASS'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object Query1REV: TStringField
      FieldName = 'REV'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object Query1NOTE: TStringField
      FieldName = 'NOTE'
      Visible = False
      Size = 255
    end
    object Query1INTRODUCED_BY_EPLANT_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'INTRODUCED_BY_EPLANT_ID'
      Visible = False
      Size = 38
    end
    object Query1INTRODUCED_BY_STANDARD_ID: TBCDField
      FieldName = 'INTRODUCED_BY_STANDARD_ID'
      Visible = False
      Size = 0
    end
    object Query1CostCalcDateDisp: TStringField
      FieldKind = fkCalculated
      FieldName = 'CostCalcDateDisp'
      Visible = False
      Calculated = True
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 159
    Top = 81
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = 'Reports'
      object Print1: TUniMenuItem
        Caption = 'Print'
        OnClick = Print1Click
      end
      object PrintSetup1: TUniMenuItem
        Caption = 'Printer Setup'
        OnClick = PrintSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 187
    Top = 81
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmCostedBOM'
    WebUse = False
    TouchScreen = False
    Left = 215
    Top = 81
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmCostedBOM'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 188979 $'
    Left = 243
    Top = 81
  end
  object popmMainGrid: TUniPopupMenu
    OnPopup = popmMainGridPopup
    Left = 272
    Top = 81
    object JumpToInventory1: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumpToInventory1Click
    end
    object JumpToIntroducedByInventory1: TUniMenuItem
      Caption = 'Jump To "Introduced By" Inventory'
      OnClick = JumpToIntroducedByInventory1Click
    end
    object JumpToIntroducedByBOM1: TUniMenuItem
      Caption = 'Jump to "Introduced By" BOM'
      OnClick = JumpToIntroducedByBOM1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object CopyToClipboard1: TUniMenuItem
      Caption = 'Copy To Clipboard'
      OnClick = CopyToClipboard1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = DataSource1
    JumpTo = jtInventory
    Left = 272
    Top = 108
  end
  object IQJumpBOMIntoBy: TIQWebJump
    DataField = 'INTRODUCED_BY_STANDARD_ID'
    DataSource = DataSource1
    JumpTo = jtBom
    Left = 328
    Top = 108
  end
  object IQJumpInvIntroBy: TIQWebJump
    DataField = 'INTRODUCED_BY_ARINVT_ID'
    DataSource = DataSource1
    JumpTo = jtInventory
    Left = 300
    Top = 108
  end
end
