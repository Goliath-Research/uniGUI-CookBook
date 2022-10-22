inherited FrmInvClassDivisionFilter: TFrmInvClassDivisionFilter
  Left = 229
  Top = 146
  ClientHeight = 135
  ClientWidth = 306
  Caption = 'Filter'
  ExplicitWidth = 312
  ExplicitHeight = 164
  DesignSize = (
    306
    135)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMainInvParams: TUniPanel
    Left = 3
    Top = 4
    Width = 298
    Height = 89
    ExplicitLeft = 3
    ExplicitTop = 4
    ExplicitWidth = 298
    ExplicitHeight = 89
    inherited wwLookupClass: TUniDBLookupComboBox
      Left = 103
      ExplicitLeft = 103
    end
    object wwLookupDivision: TUniDBLookupComboBox
      Left = 103
      Top = 51
      Width = 168
      Height = 21
      Hint = ''
      ListFieldIndex = 0
      TabOrder = 1
      Color = clWindow
    end
    object Label4: TUniLabel
      Left = 8
      Top = 54
      Width = 36
      Height = 13
      Hint = ''
      Caption = 'Division'
      TabOrder = 4
    end
  end
  inherited PnlButtons: TUniPanel
    Top = 97
    Width = 306
    Height = 38
    ExplicitTop = 97
    ExplicitWidth = 306
    ExplicitHeight = 38
    DesignSize = (
      306
      38)
    inherited btnOK: TUniButton
      Top = 8
      Anchors = [akRight, akBottom]
      ExplicitTop = 8
    end
    inherited btnCancel: TUniButton
      Left = 200
      Top = 8
      Anchors = [akRight, akBottom]
      ExplicitLeft = 200
      ExplicitTop = 8
    end
  end
  inherited wwQuery1: TFDQuery
    Left = 208
  end
  inherited SR: TIQWebSecurityRegister
    Left = 12
    Top = 100
  end
  object wwQryDivision: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.id, '
      '       d.name,'
      '       e.name as eplant_name'
      '  from division d,'
      '       eplant e'
      ' where d.eplant_id = e.id(+)       ')
    Left = 248
    Top = 16
    object wwQryDivisionNAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 20
      FieldName = 'NAME'
      Size = 25
    end
    object wwQryDivisionEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 15
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
end
