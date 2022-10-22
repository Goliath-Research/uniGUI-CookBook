object FrmSlitParams: TFrmSlitParams
  Left = 0
  Top = 0
  ClientHeight = 253
  ClientWidth = 343
  Caption = 'Slitting Parameters'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 343
    Height = 212
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Label1: TUniLabel
      Left = 8
      Top = 16
      Width = 132
      Height = 13
      Hint = ''
      Caption = 'Allowed Over Production %'
      TabOrder = 4
    end
    object Label2: TUniLabel
      Left = 8
      Top = 40
      Width = 137
      Height = 13
      Hint = ''
      Caption = 'Allowed Under Production %'
      TabOrder = 5
    end
    object dbeOver: TUniDBEdit
      Left = 160
      Top = 13
      Width = 49
      Height = 21
      Hint = ''
      DataField = 'OVER_TOLERANCE'
      DataSource = srcSlitParams
      TabOrder = 0
    end
    object dbeUnder: TUniDBEdit
      Left = 160
      Top = 37
      Width = 49
      Height = 21
      Hint = ''
      DataField = 'UNDER_TOLERANCE'
      DataSource = srcSlitParams
      TabOrder = 1
    end
    object chkRoundSetsPer: TUniDBCheckBox
      Left = 8
      Top = 64
      Width = 201
      Height = 17
      Hint = ''
      DataField = 'ROUND_SETS_PER'
      DataSource = srcSlitParams
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = 'Round Sets Per Master Roll'
      TabOrder = 2
    end
  end
  object PnlToolbar: TUniPanel
    Left = 0
    Top = 212
    Width = 343
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      343
      41)
    object btnOK: TUniButton
      Left = 132
      Top = 6
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'OK'
      ModalResult = 1
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnCancel: TUniButton
      Left = 236
      Top = 6
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akRight, akBottom]
      TabOrder = 2
      OnClick = btnCancelClick
    end
  end
  object tblSlitParams: TFDTable
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SLIT_PARAMS'
    TableName = 'SLIT_PARAMS'
    Left = 192
    Top = 120
    object tblSlitParamsOVER_TOLERANCE: TBCDField
      FieldName = 'OVER_TOLERANCE'
      Origin = 'OVER_TOLERANCE'
      Precision = 3
      Size = 0
    end
    object tblSlitParamsUNDER_TOLERANCE: TBCDField
      FieldName = 'UNDER_TOLERANCE'
      Origin = 'UNDER_TOLERANCE'
      Precision = 3
      Size = 0
    end
    object tblSlitParamsROUND_SETS_PER: TStringField
      FieldName = 'ROUND_SETS_PER'
      Origin = 'ROUND_SETS_PER'
      Size = 1
    end
  end
  object srcSlitParams: TDataSource
    DataSet = tblSlitParams
    Left = 112
    Top = 120
  end
end
