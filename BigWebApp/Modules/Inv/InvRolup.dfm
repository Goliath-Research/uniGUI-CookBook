object FrmCostElem_Rollup: TFrmCostElem_Rollup
  Left = 273
  Top = 193
  HelpContext = 1042382
  ClientHeight = 196
  ClientWidth = 355
  Caption = 'Cost Elements vs. Rollup'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
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
    TabOrder = 2
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
    object DBNavigator1: TUniDBNavigator
      Left = 254
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 30
    Width = 355
    Height = 147
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'ELEM_DESCRIP'
        Title.Caption = 'Cost Element'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARINVT_STD_COST'
        Title.Caption = 'Standard Cost'
        Width = 78
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ROLLUP_STD_COST'
        Title.Caption = 'Rollup Cost'
        Width = 68
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ELEM_TYPE'
        Title.Caption = 'Cost Element Type'
        Width = 95
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 177
    Width = 355
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 64
    Top = 104
  end
  object Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.arinvt_id,'
      '       e.elem_descrip,'
      '       a.std_cost as arinvt_std_cost,'
      '       r.std_cost as rollup_std_cost,'
      '       e.elem_type'
      '  from arinvt_elements a,'
      '       arinvt_rollup r,'
      '       elements e'
      ' where a.arinvt_id = :arinvt_id'
      '   and a.arinvt_id = r.arinvt_id(+)'
      '   and a.elements_id = r.elements_id(+)'
      '   and e.id = a.elements_id'
      ' '
      ' '
      ' '
      ' ')
    Left = 64
    Top = 120
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1ARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object Query1ELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      DisplayWidth = 20
      FieldName = 'ELEM_DESCRIP'
      Size = 30
    end
    object Query1ARINVT_STD_COST: TFMTBCDField
      DisplayLabel = 'Std Cost'
      FieldName = 'ARINVT_STD_COST'
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object Query1ROLLUP_STD_COST: TFMTBCDField
      DisplayLabel = 'Rollup Cost'
      FieldName = 'ROLLUP_STD_COST'
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object Query1ELEM_TYPE: TStringField
      DisplayLabel = 'Cost Element Type'
      FieldName = 'ELEM_TYPE'
      Size = 10
    end
  end
end
