object FrmPasteReleases_OE: TFrmPasteReleases_OE
  Left = 287
  Top = 175
  ClientHeight = 162
  ClientWidth = 357
  Caption = 'Confirm Paste Releases'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 127
    Width = 357
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 45
      Top = 1
      Width = 312
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnAppend: TUniButton
        Left = 5
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Append'
        TabOrder = 1
        OnClick = btnAppendClick
      end
      object brnOverwrite: TUniButton
        Left = 107
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Overwrite'
        TabOrder = 2
        OnClick = btnAppendClick
      end
      object btnCancel: TUniButton
        Left = 209
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
    Width = 357
    Height = 127
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'QUAN'
        Title.Caption = 'Quantity'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROMISE_DATE'
        Title.Caption = 'Promise Date'
        Width = 104
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REQUEST_DATE'
        Title.Caption = 'Request Date'
        Width = 100
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
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select promise_date,'
      '       quan,'
      '       request_date'
      '  from releases'
      ' where ord_detail_id = :detail_id'
      'order by promise_date')
    Left = 88
    Top = 56
    ParamData = <
      item
        Name = 'detail_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1PROMISE_DATE: TDateTimeField
      FieldName = 'PROMISE_DATE'
      Origin = 'RELEASES.PROMISE_DATE'
      DisplayFormat = 'mm/dd/yyyy'
    end
    object Query1QUAN: TBCDField
      FieldName = 'QUAN'
      Origin = 'RELEASES.QUAN'
    end
    object Query1REQUEST_DATE: TDateTimeField
      FieldName = 'REQUEST_DATE'
      Origin = 'RELEASES.REQUEST_DATE'
      DisplayFormat = 'mm/dd/yyyy'
    end
  end
end
