object TransError: TTransError
  Left = 197
  Top = 172
  ClientHeight = 265
  ClientWidth = 298
  Caption = 'Transaction Error'
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 194
    Width = 298
    Height = 12
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object DBMemo1: TUniDBMemo
    Left = 0
    Top = 206
    Width = 298
    Height = 59
    Hint = ''
    DataField = 'ERR_MESG'
    DataSource = DataSource1
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 110
    Width = 298
    Height = 84
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'ID'
        Title.Caption = 'Trans ID'
        Width = 47
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_BATCH'
        Title.Caption = 'Batch#'
        Width = 44
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_IN_OUT'
        Title.Caption = 'In/Out'
        Width = 36
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_TYPE'
        Title.Caption = 'Type'
        Width = 102
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FGMULTI_ID'
        Title.Caption = 'Loc ID'
        Width = 41
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 298
    Height = 110
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object Label1: TUniLabel
      Left = 7
      Top = 6
      Width = 25
      Height = 13
      Hint = ''
      Caption = 'Class'
      TabOrder = 1
    end
    object Label2: TUniLabel
      Left = 7
      Top = 27
      Width = 30
      Height = 13
      Hint = ''
      Caption = 'Item#'
      TabOrder = 2
    end
    object Label3: TUniLabel
      Left = 7
      Top = 47
      Width = 19
      Height = 13
      Hint = ''
      Caption = 'Rev'
      TabOrder = 3
    end
    object Label4: TUniLabel
      Left = 7
      Top = 68
      Width = 35
      Height = 13
      Hint = ''
      Caption = 'Descrip'
      TabOrder = 4
    end
    object Label5: TUniLabel
      Left = 7
      Top = 88
      Width = 19
      Height = 13
      Hint = ''
      Caption = 'Unit'
      TabOrder = 5
    end
    object dbText1: TUniDBText
      Left = 71
      Top = 6
      Width = 40
      Height = 13
      Hint = ''
      DataField = 'CLASS'
      DataSource = DataSource2
    end
    object dbText2: TUniDBText
      Left = 71
      Top = 27
      Width = 40
      Height = 13
      Hint = ''
      DataField = 'ITEMNO'
      DataSource = DataSource2
    end
    object dbText3: TUniDBText
      Left = 71
      Top = 47
      Width = 40
      Height = 13
      Hint = ''
      DataField = 'REV'
      DataSource = DataSource2
    end
    object dbText4: TUniDBText
      Left = 71
      Top = 68
      Width = 40
      Height = 13
      Hint = ''
      DataField = 'DESCRIP'
      DataSource = DataSource2
    end
    object dbText5: TUniDBText
      Left = 71
      Top = 88
      Width = 40
      Height = 13
      Hint = ''
      DataField = 'UNIT'
      DataSource = DataSource2
    end
  end
  object Query1: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select invtrans.id,'
      '       invtrans.trans_in_out,'
      '       invtrans.trans_type,'
      '       invtrans.trans_batch,'
      '       invtrans.fgmulti_id,'
      '       invtrans_err.err_mesg'
      '  from invtrans, invtrans_err'
      ' where invtrans.trans_batch = :batch'
      '   and invtrans.id = invtrans_err.invtrans_id'
      ' order by invtrans_err.id')
    Left = 64
    Top = 144
    ParamData = <
      item
        Name = 'batch'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1ID: TBCDField
      DisplayLabel = 'Trans ID'
      FieldName = 'ID'
      Size = 0
    end
    object Query1TRANS_IN_OUT: TStringField
      DisplayLabel = 'In/Out'
      FieldName = 'TRANS_IN_OUT'
      Size = 3
    end
    object Query1TRANS_TYPE: TStringField
      DisplayLabel = 'Trans Type'
      FieldName = 'TRANS_TYPE'
      Size = 30
    end
    object Query1TRANS_BATCH: TBCDField
      DisplayLabel = 'Trans Batch#'
      FieldName = 'TRANS_BATCH'
      Size = 0
    end
    object Query1FGMULTI_ID: TBCDField
      DisplayLabel = 'Location ID'
      FieldName = 'FGMULTI_ID'
      Size = 0
    end
    object Query1ERR_MESG: TStringField
      DisplayLabel = 'Error Message'
      FieldName = 'ERR_MESG'
      Size = 2000
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 34
    Top = 144
  end
  object Query2: TFDQuery
    MasterSource = DataSource1
    MasterFields = 'FGMULTI_ID'
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select  arinvt.class,'
      '        arinvt.itemno,'
      '        arinvt.rev,'
      '        arinvt.descrip,'
      '        arinvt.unit'
      'from arinvt, fgmulti'
      'where fgmulti.id = :fgmulti_id'
      '  and arinvt.id = fgmulti.arinvt_id')
    Left = 160
    Top = 144
    ParamData = <
      item
        Name = 'FGMULTI_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query2CLASS: TStringField
      FieldName = 'CLASS'
      Size = 2
    end
    object Query2ITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object Query2REV: TStringField
      FieldName = 'REV'
      Size = 15
    end
    object Query2DESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object Query2UNIT: TStringField
      FieldName = 'UNIT'
      Size = 10
    end
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 192
    Top = 144
  end
end
