object FrmTransEnforceLotFIFO: TFrmTransEnforceLotFIFO
  Left = 0
  Top = 0
  ClientHeight = 244
  ClientWidth = 546
  Caption = 'Lot FIFO Violation'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 546
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 432
      Top = 1
      Width = 114
      Height = 26
      Hint = ''
      DataSource = SrcFGMulti
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 28
    Width = 546
    Height = 175
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 544
      Height = 173
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 327
      IQComponents.Grid.Height = 87
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcFGMulti
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
      IQComponents.Navigator.DataSource = SrcFGMulti
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 327
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 87
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcFGMulti
      Columns = <
        item
          FieldName = 'LOTNO'
          Title.Caption = 'Must First Use Lot #'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOC_DESC'
          Title.Caption = 'Location'
          Width = 182
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ONHAND'
          Title.Caption = 'On Hand'
          Width = 77
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARINVT_LOT_DOCS_ID'
          Title.Caption = 'Inventory ~Lot ID'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'IN_DATE'
          Title.Caption = 'In Date'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Location Description'
          Width = 203
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 203
    Width = 546
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel4: TUniPanel
      Left = 363
      Top = 1
      Width = 183
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnContinue: TUniButton
        Left = 4
        Top = 9
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Continue'
        TabOrder = 1
        OnClick = btnContinueClick
      end
      object btnCancel: TUniButton
        Left = 97
        Top = 9
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object SrcFGMulti: TDataSource
    DataSet = QryFGMulti
    Left = 72
    Top = 92
  end
  object QryFGMulti: TFDQuery
    BeforeOpen = QryFGMultiBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select lot.id as arinvt_lot_docs_id,'
      '       f.id,'
      '       f.loc_desc,'
      '       f.lotno,'
      '       f.onhand,'
      '       f.in_date,'
      '       descrip'
      '  from '
      '       v_fgmulti_locations f,'
      '       arinvt_lot_docs lot'
      ' where '
      '       f.arinvt_id = :arinvt_id  '
      '   and f.arinvt_id = lot.arinvt_id'
      '   and rtrim(f.lotno) = rtrim(lot.lotno)'
      '   '
      '   and nvl(f.onhand,0) <> 0'
      '   and f.non_conform_id is null'
      ''
      '   and ( :exclude_no_ship = 0 '
      '         or'
      '         :exclude_no_ship = 1 and nvl(f.no_ship, '#39'N'#39') <> '#39'Y'#39' )'
      '         '
      '   and lot.id = :violated_arinvt_lot_docs_id'
      ''
      'order by lot.id,'
      '         f.in_date ')
    Left = 72
    Top = 116
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'exclude_no_ship'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'violated_arinvt_lot_docs_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryFGMultiLOTNO: TStringField
      DisplayLabel = 'Must First Use Lot #'
      DisplayWidth = 16
      FieldName = 'LOTNO'
      Size = 25
    end
    object QryFGMultiLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 26
      FieldName = 'LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object QryFGMultiONHAND: TBCDField
      DisplayLabel = 'On Hand'
      DisplayWidth = 11
      FieldName = 'ONHAND'
    end
    object QryFGMultiARINVT_LOT_DOCS_ID: TBCDField
      DisplayLabel = 'Inventory ~Lot ID'
      DisplayWidth = 10
      FieldName = 'ARINVT_LOT_DOCS_ID'
      Size = 0
    end
    object QryFGMultiIN_DATE: TDateTimeField
      DisplayLabel = 'In Date'
      DisplayWidth = 18
      FieldName = 'IN_DATE'
    end
    object QryFGMultiDESCRIP: TStringField
      DisplayLabel = 'Location Description'
      DisplayWidth = 29
      FieldName = 'DESCRIP'
      Size = 50
    end
    object QryFGMultiID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnContinue')
    SecurityCode = 'FRMTRANSENFORCELOTFIFO'
    Left = 124
    Top = 116
  end
end
