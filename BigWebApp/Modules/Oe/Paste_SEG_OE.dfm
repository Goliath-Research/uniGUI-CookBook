object FRMPasteEDISegs: TFRMPasteEDISegs
  Left = 322
  Top = 174
  ClientHeight = 283
  ClientWidth = 372
  Caption = 'Confirm Paste EDI Segments'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 248
    Width = 372
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 176
    ExplicitWidth = 324
    object Panel1: TUniPanel
      Tag = 1999
      Left = 57
      Top = 1
      Width = 314
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 9
      object btnAppend: TUniButton
        Left = 6
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Append'
        TabOrder = 1
        OnClick = btnAppendClick
      end
      object brnOverwrite: TUniButton
        Left = 108
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Overwrite'
        TabOrder = 2
        OnClick = btnAppendClick
      end
      object btnCancel: TUniButton
        Left = 210
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        TabOrder = 3
        OnClick = btnAppendClick
      end
    end
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 0
    Width = 372
    Height = 248
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'SEG'
        Title.Caption = 'Segment'
        Width = 56
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SegStr'
        Title.Caption = 'Segment String'
        Width = 270
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 88
    Top = 40
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    OnCalcFields = Query1CalcFields
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      'ord_detail_id,'
      'seg,'
      'SubStr(seg_string, 1, 255) as seg_string'
      '  from Ord_Detail_seg '
      ' where ord_detail_id = :detail_id'
      'order by id')
    Left = 88
    Top = 104
    ParamData = <
      item
        Name = 'detail_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1ID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ORD_DETAIL_SEG.ID'
      Size = 0
    end
    object Query1ORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Origin = 'IQ.ORD_DETAIL_SEG.ORD_DETAIL_ID'
      Size = 0
    end
    object Query1SEG: TStringField
      FieldName = 'SEG'
      Origin = 'IQ.ORD_DETAIL_SEG.SEG'
      FixedChar = True
      Size = 3
    end
    object Query1SegStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'SegStr'
      Calculated = True
    end
  end
end
