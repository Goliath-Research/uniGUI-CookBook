object FrmShowDayParts: TFrmShowDayParts
  Left = 42
  Top = 147
  ClientHeight = 165
  ClientWidth = 436
  Caption = ''
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 436
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 336
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcQryDayPart
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object GridDayPart: TUniDBGrid
    Left = 0
    Top = 27
    Width = 436
    Height = 138
    Hint = ''
    DataSource = SrcQryDayPart
    ReadOnly = True
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ParentColor = False
    Color = clBtnFace
    Columns = <
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 44
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 39
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Revision'
        Width = 49
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'Manufacturing #'
        Width = 103
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY'
        Title.Caption = 'Quantity'
        Width = 59
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object SrcQryDayPart: TDataSource
    DataSet = QryDayPart
    Left = 152
    Top = 64
  end
  object QryDayPart: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.itemno as itemno, '
      '       a.descrip as descrip, '
      '       a.class as class, '
      '       a.rev as rev, '
      '       s.mfgno as mfgno, '
      '       d.qty as qty,'
      '       h.workorder_id as workorder_id,'
      '       h.prod_date as prod_date'
      '  from arinvt a, '
      '       partno p, '
      '       standard s, '
      '       day_pts d,'
      '       day_hrs h '
      ' where p.standard_id = s.id '
      '   and p.arinvt_id = a.id '
      '   and d.partno_id = p.id '
      '   and h.id = :nId'
      '   and d.day_hrs_id = h.id'
      '                       '
      ' '
      ' ')
    Left = 152
    Top = 88
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDayPartITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryDayPartDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryDayPartCLASS: TStringField
      FieldName = 'CLASS'
      Size = 2
    end
    object QryDayPartREV: TStringField
      FieldName = 'REV'
      Size = 15
    end
    object QryDayPartMFGNO: TStringField
      FieldName = 'MFGNO'
      Size = 50
    end
    object QryDayPartQTY: TFMTBCDField
      FieldName = 'QTY'
      DisplayFormat = '#########0.00'
      Size = 6
    end
    object QryDayPartWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryDayPartPROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
    end
  end
end
