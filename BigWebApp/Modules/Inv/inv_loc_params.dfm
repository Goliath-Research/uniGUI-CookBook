object FrmInvLocParams: TFrmInvLocParams
  Left = 0
  Top = 0
  ClientHeight = 146
  ClientWidth = 398
  Caption = 'Parameters'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 105
    Width = 398
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 176
      Top = 1
      Width = 222
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 114
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 105
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object DBCheckBox1: TUniDBCheckBox
      Left = 16
      Top = 16
      Width = 329
      Height = 17
      Hint = ''
      DataField = 'INV_UNIQUE_LOC_BY_EPLANT'
      DataSource = SrcParams
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = 'Do Not Allow Duplicate Master Inventory Locations by Division'
      TabOrder = 0
    end
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 24
    Top = 48
  end
  object TblParams: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 144
    Top = 52
    object TblParamsINV_UNIQUE_LOC_BY_EPLANT: TStringField
      FieldName = 'INV_UNIQUE_LOC_BY_EPLANT'
      Size = 1
    end
  end
end
