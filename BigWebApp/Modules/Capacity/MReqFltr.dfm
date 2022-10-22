inherited FrmInvClassFilterMatReq: TFrmInvClassFilterMatReq
  ClientHeight = 232
  ClientWidth = 342
  ExplicitWidth = 348
  ExplicitHeight = 261
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMainInvParams: TUniPanel
    Width = 334
    Height = 181
    ExplicitWidth = 334
    ExplicitHeight = 181
    object Label2: TUniLabel [0]
      Left = 13
      Top = 96
      Width = 30
      Height = 13
      Hint = ''
      Caption = 'Period'
      TabOrder = 8
    end
    object Label3: TUniLabel [1]
      Left = 199
      Top = 96
      Width = 12
      Height = 13
      Hint = ''
      Caption = 'To'
      TabOrder = 9
    end
    object Label5: TUniLabel [2]
      Left = 13
      Top = 145
      Width = 56
      Height = 13
      Hint = ''
      Caption = 'Buyer Code'
      TabOrder = 10
    end
    inherited Label1: TUniLabel
      Left = 13
      TabOrder = 5
      ExplicitLeft = 13
    end
    inherited Label4: TUniLabel
      TabOrder = 7
    end
    object DateTimePicker2: TUniDateTimePicker
      Left = 221
      Top = 92
      Width = 87
      Height = 21
      Hint = ''
      DateTime = 42634.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 3
    end
    object DateTimePicker1: TUniDateTimePicker
      Left = 103
      Top = 92
      Width = 87
      Height = 21
      Hint = ''
      DateTime = 42634.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 2
    end
    object wwLookupBuyerCode: TUniDBLookupComboBox
      Left = 103
      Top = 137
      Width = 205
      Height = 21
      Hint = ''
      ListSource = SrcBuyerCode
      KeyField = 'BUYER_CODE'
      ListFieldIndex = 0
      TabOrder = 4
      Color = clWindow
    end
  end
  inherited PnlButtons: TUniPanel
    Top = 187
    Width = 342
    Height = 45
    ExplicitTop = 187
    ExplicitWidth = 342
    ExplicitHeight = 45
    inherited btnOK: TUniButton
      Left = 132
      Top = 10
      ExplicitLeft = 132
      ExplicitTop = 10
    end
    inherited btnCancel: TUniButton
      Left = 241
      Top = 10
      ExplicitLeft = 241
      ExplicitTop = 10
    end
  end
  inherited wwQuery1: TFDQuery
    SQL.Strings = (
      'select RTrim(class) as class,'
      '       descrip'
      '  from arinvt_class'
      ' where NVL( RTrim(type), '#39'*'#39') <> '#39'ROUTING'#39)
  end
  object wwQryBuyerCode: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, '
      '       buyer_code,'
      '       descrip'
      '  from buyer_code'
      '')
    Left = 173
    Top = 16
    object wwQryBuyerCodeBUYER_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'BUYER_CODE'
      Origin = 'IQ.BUYER_CODE.BUYER_CODE'
      Size = 10
    end
    object wwQryBuyerCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'IQ.BUYER_CODE.DESCRIP'
      Size = 50
    end
    object wwQryBuyerCodeID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.BUYER_CODE.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcBuyerCode: TDataSource
    DataSet = wwQryBuyerCode
    Left = 59
    Top = 100
  end
end
