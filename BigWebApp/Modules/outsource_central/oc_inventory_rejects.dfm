object FrmOutsourceInvReject: TFrmOutsourceInvReject
  Left = 117
  Top = 254
  ClientHeight = 156
  ClientWidth = 330
  Caption = 'Rejects'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 7
    Top = 8
    Width = 314
    Height = 102
    Hint = ''
    TabOrder = 3
    Caption = ''
  end
  object Label1: TUniLabel
    Left = 17
    Top = 17
    Width = 52
    Height = 13
    Hint = ''
    Caption = 'Reject Qty'
    TabOrder = 4
  end
  object Label2: TUniLabel
    Left = 17
    Top = 46
    Width = 59
    Height = 13
    Hint = ''
    Caption = 'Reject Code'
    TabOrder = 5
  end
  object Label3: TUniLabel
    Left = 17
    Top = 72
    Width = 55
    Height = 13
    Hint = ''
    Caption = 'Trans Code'
    TabOrder = 6
  end
  object edRejectQty: TUniEdit
    Left = 97
    Top = 17
    Width = 104
    Height = 21
    Hint = ''
    Text = '0'
    TabOrder = 0
  end
  object wwDBLookupComboRejectCode: TUniDBLookupComboBox
    Left = 97
    Top = 42
    Width = 210
    Height = 21
    Hint = ''
    ListField = 'REJECT_CODE'
    ListSource = ds_CodeLookUp
    KeyField = 'REJECT_CODE'
    ListFieldIndex = 0
    TabOrder = 1
    Color = clWindow
  end
  object btnOK: TUniButton
    Left = 161
    Top = 120
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 7
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 246
    Top = 120
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 8
  end
  object wwDBLookupComboTransCode: TUniDBLookupComboBox
    Left = 97
    Top = 68
    Width = 210
    Height = 21
    Hint = ''
    ListField = 'CODE'
    ListSource = ds_TransCode
    KeyField = 'CODE'
    ListFieldIndex = 0
    TabOrder = 2
    Color = clWindow
  end
  object wwCodeLookUp: TFDQuery
    Filtered = True
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select reject_code, '
      '       attribute,'
      '       eplant_id'
      '  from REJECT_CODE'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1 '
      ' order by reject_code '
      ' '
      ' ')
    Left = 166
    Top = 27
    object wwCodeLookUpREJECT_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'REJECT_CODE'
      Origin = 'REJECT_CODE.REJECT_CODE'
      Size = 5
    end
    object wwCodeLookUpATTRIBUTE: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 100
      FieldName = 'ATTRIBUTE'
      Origin = 'REJECT_CODE.ATTRIBUTE'
      Size = 100
    end
    object wwCodeLookUpEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.REJECT_CODE.EPLANT_ID'
      Size = 0
    end
  end
  object QryTransCode: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select code,'
      '       descrip'
      '  from trans_code     '
      '       ')
    Left = 168
    Top = 76
    object QryTransCodeCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'IQ.TRANS_CODE.CODE'
      Size = 10
    end
    object QryTransCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 100
      FieldName = 'DESCRIP'
      Origin = 'IQ.TRANS_CODE.DESCRIP'
      Size = 25
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMOUTSOURCEINVREJECT'
    Left = 91
    Top = 115
  end
  object ds_CodeLookUp: TDataSource
    DataSet = wwCodeLookUp
    Left = 240
    Top = 24
  end
  object ds_TransCode: TDataSource
    DataSet = QryTransCode
    Left = 240
    Top = 88
  end
end
