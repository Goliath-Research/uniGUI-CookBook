object FrmICT_Params: TFrmICT_Params
  Left = 0
  Top = 0
  ClientHeight = 132
  ClientWidth = 454
  Caption = 'ICT Parameters'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 90
    Width = 454
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 232
      Top = 1
      Width = 221
      Height = 40
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
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 112
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
    Width = 454
    Height = 90
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object dbchkAlwaysCheckNewDemand: TUniDBCheckBox
      Left = 16
      Top = 16
      Width = 269
      Height = 17
      Hint = ''
      DataField = 'SCHED_FORCE_ICT_PROCESSING'
      DataSource = SrcParams
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = 'Check New Demand Regardless of Pull Trigger Qty'
      TabOrder = 0
    end
  end
  object SrcParams: TDataSource
    DataSet = QryParams
    Left = 36
    Top = 40
  end
  object QryParams: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvUpdateMode]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.UpdateTableName = 'PARAMS'
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'select sched_force_ict_processing'
      '  from params')
    Left = 36
    Top = 68
    object QryParamsSCHED_FORCE_ICT_PROCESSING: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SCHED_FORCE_ICT_PROCESSING'
      ProviderFlags = []
      Size = 1
    end
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    ModifySQL.Strings = (
      'UPDATE PARAMS'
      'SET SCHED_FORCE_ICT_PROCESSING = :NEW_SCHED_FORCE_ICT_PROCESSING'
      '')
    Left = 36
    Top = 97
  end
end
