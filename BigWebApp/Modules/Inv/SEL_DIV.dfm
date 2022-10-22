object FrmSelectDivision: TFrmSelectDivision
  Left = 255
  Top = 181
  ClientHeight = 133
  ClientWidth = 298
  Caption = 'Select Division'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  DesignSize = (
    298
    133)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 8
    Top = 8
    Width = 284
    Height = 90
    Hint = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
  end
  object wwDBLookupCombo1: TUniDBLookupComboBox
    Left = 35
    Top = 63
    Width = 247
    Height = 21
    Hint = ''
    ListOnlyMode = lmFollowSource
    ListSource = SrcDivision
    KeyField = 'NAME'
    ListFieldIndex = 0
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Color = clWindow
  end
  object btnOK: TUniButton
    Left = 91
    Top = 104
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
  object btnCancel: TUniButton
    Left = 195
    Top = 104
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    Anchors = [akTop, akRight]
    TabOrder = 5
  end
  object rbtnAllDiv: TUniRadioButton
    Left = 15
    Top = 18
    Width = 271
    Height = 17
    Hint = ''
    Anchors = [akLeft, akTop, akRight]
    Checked = True
    Caption = 'All Divisions'
    TabOrder = 3
    OnClick = rbtnAllDivClick
  end
  object rbtnOneDiv: TUniRadioButton
    Left = 15
    Top = 41
    Width = 271
    Height = 17
    Hint = ''
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Select Division'
    TabOrder = 4
    OnClick = rbtnAllDivClick
  end
  object wwQryDivision: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.ID, '
      '       d.name,'
      '       e.name as eplant_name'
      '  from division d,'
      '       eplant e'
      ' where d.eplant_id = e.id(+)'
      '   and misc.eplant_filter( d.eplant_id ) = 1')
    Left = 192
    Top = 26
    object wwQryDivisionNAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 20
      FieldName = 'NAME'
      Size = 25
    end
    object wwQryDivisionEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 10
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object wwQryDivisionID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcDivision: TDataSource
    DataSet = wwQryDivision
    Left = 136
    Top = 64
  end
end
