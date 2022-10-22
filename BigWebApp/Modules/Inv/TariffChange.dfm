object FrmTariffChange: TFrmTariffChange
  Left = 0
  Top = 0
  ClientHeight = 102
  ClientWidth = 635
  Caption = 'Tariff Change'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  DesignSize = (
    635
    102)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 16
    Top = 13
    Width = 141
    Height = 13
    Hint = ''
    Caption = 'Reason for the tariff change:'
    TabOrder = 3
  end
  object Label2: TUniLabel
    Left = 16
    Top = 38
    Width = 60
    Height = 13
    Hint = ''
    Caption = 'Review date'
    TabOrder = 4
  end
  object wwDate: TUniDBDateTimePicker
    Left = 195
    Top = 35
    Width = 121
    Height = 21
    Hint = ''
    DateTime = 42683.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 0
  end
  object IQUDComboBox1: TIQWebUDComboBox
    Left = 195
    Top = 8
    Width = 365
    Height = 21
    Hint = 'Right click to edit the list'
    HelpContext = -57
    ShowHint = True
    ParentShowHint = False
    Anchors = [akLeft, akTop, akRight]
    DataField = 'REASON'
    DataSource = SrcTariff
    TabOrder = 1
    KeyTableName = 'TARIFF_CODE_HISTORY'
    KeyFieldName = 'REASON'
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 69
    Width = 635
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel2: TUniPanel
      Left = 450
      Top = 1
      Width = 185
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 8
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 104
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object TblTariff: TFDTable
    Filtered = True
    OnFilterRecord = TblTariffFilterRecord
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'TARIFF_CODE_HISTORY'
    TableName = 'TARIFF_CODE_HISTORY'
    Left = 80
    Top = 56
    object TblTariffID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblTariffDATE_REVIEWED: TDateTimeField
      FieldName = 'DATE_REVIEWED'
    end
    object TblTariffREASON: TStringField
      FieldName = 'REASON'
      Size = 2000
    end
    object TblTariffDATE_CHANGED: TDateTimeField
      FieldName = 'DATE_CHANGED'
    end
    object TblTariffARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object TblTariffUSERID: TStringField
      FieldName = 'USERID'
      Size = 35
    end
    object TblTariffOLD_TARIFF_CODE_ID: TBCDField
      FieldName = 'OLD_TARIFF_CODE_ID'
      Size = 0
    end
    object TblTariffNEW_TARIFF_CODE_ID: TBCDField
      FieldName = 'NEW_TARIFF_CODE_ID'
      Size = 0
    end
  end
  object SrcTariff: TDataSource
    DataSet = TblTariff
    Left = 28
    Top = 81
  end
end
