object FrmCTP_Params: TFrmCTP_Params
  Left = 274
  Top = 251
  ClientHeight = 117
  ClientWidth = 286
  Caption = 'CTP Parameters'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 8
    Top = 8
    Width = 273
    Height = 73
    Hint = ''
    TabOrder = 0
    Caption = ''
  end
  object Label1: TUniLabel
    Left = 24
    Top = 24
    Width = 72
    Height = 13
    Hint = ''
    Caption = 'Response Time'
    TabOrder = 1
  end
  object btnOK: TUniButton
    Left = 117
    Top = 88
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 205
    Top = 88
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object DBEdit1: TUniDBEdit
    Left = 112
    Top = 20
    Width = 73
    Height = 21
    Hint = 'Response Time in Days - added to lead time'
    ShowHint = True
    ParentShowHint = False
    DataField = 'CTP_RESPONSE_TIME'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBCheckBox1: TUniDBCheckBox
    Left = 24
    Top = 51
    Width = 209
    Height = 17
    Hint = ''
    DataField = 'CTP_USE_RAW_MAT_ATP'
    DataSource = DataSource1
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
    Caption = 'Use ATP calculation for Raw Materials'
    TabOrder = 3
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 16
    Top = 64
  end
  object Table1: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 16
    Top = 80
  end
end
