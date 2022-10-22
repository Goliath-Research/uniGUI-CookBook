object FrmTranAdjQtyIn: TFrmTranAdjQtyIn
  Left = 269
  Top = 178
  ClientHeight = 153
  ClientWidth = 334
  Caption = 'Adjust Label Qty'
  Constraints.MinHeight = 191
  Constraints.MinWidth = 350
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  DesignSize = (
    334
    153)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 10
    Top = 36
    Width = 95
    Height = 13
    Hint = ''
    Caption = 'Enter New Quantity'
    TabOrder = 3
  end
  object Label2: TUniLabel
    Left = 10
    Top = 13
    Width = 37
    Height = 13
    Hint = ''
    Caption = 'Serial #'
    TabOrder = 4
  end
  object Bevel1: TUniPanel
    Left = 10
    Top = 112
    Width = 322
    Height = 4
    Hint = ''
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 5
    Caption = ''
  end
  object Label6: TUniLabel
    Left = 10
    Top = 62
    Width = 87
    Height = 13
    Hint = ''
    Caption = 'Transaction  Code'
    TabOrder = 6
  end
  object lblReason: TUniLabel
    Left = 10
    Top = 88
    Width = 36
    Height = 13
    Hint = ''
    Caption = 'Reason'
    TabOrder = 7
  end
  object edQty: TUniEdit
    Left = 110
    Top = 32
    Width = 220
    Height = 21
    Hint = ''
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object edSerial: TUniEdit
    Left = 110
    Top = 8
    Width = 220
    Height = 21
    Hint = ''
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
  end
  object btkOK: TUniButton
    Left = 133
    Top = 124
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    Anchors = [akRight, akBottom]
    TabOrder = 8
    OnClick = btkOKClick
  end
  object btnCancel: TUniButton
    Left = 235
    Top = 124
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    Anchors = [akRight, akBottom]
    TabOrder = 9
  end
  object wwComboTransCode: TUniDBLookupComboBox
    Left = 110
    Top = 58
    Width = 220
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Color = clWindow
  end
  object edReason: TUniComboBox
    Tag = 1
    Left = 110
    Top = 84
    Width = 220
    Height = 21
    Hint = ''
    Style = csSimple
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 10
  end
  object wwQryTransCode: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, code, descrip '
      '  from trans_code'
      ' order by code')
    Left = 12
    Top = 122
    object wwQryTransCodeCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'TRANS_CODE.CODE'
      Size = 10
    end
    object wwQryTransCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'TRANS_CODE.DESCRIP'
      Size = 25
    end
    object wwQryTransCodeID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'TRANS_CODE.ID'
      Visible = False
      Size = 0
    end
  end
end
