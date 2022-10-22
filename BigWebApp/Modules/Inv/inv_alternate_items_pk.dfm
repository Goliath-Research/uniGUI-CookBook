inherited FrmInvAlternateItemsPk: TFrmInvAlternateItemsPk
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited wwDBGrid1: TIQUniGridControl
    Height = 243
    IQComponents.Grid.Height = 157
    IQComponents.HiddenPanel.Height = 157
    IQComponents.HiddenPanel.ExplicitHeight = 157
    IQComponents.FormTab.ExplicitHeight = 186
    Columns = <
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Rev'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NonCommited'
        Title.Caption = 'Non Commited'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ONHAND'
        Title.Caption = 'On Hand'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UNIT'
        Title.Caption = 'UOM'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext Description'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitHeight = 243
    Marker = 0
  end
  object Panel2: TUniPanel [1]
    Left = 0
    Top = 243
    Width = 582
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 406
      Top = 1
      Width = 176
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 6
        Top = 9
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 93
        Top = 9
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  inherited wwQuery1: TFDQuery
    Active = True
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select alt.id,'
      '       alt.parent_arinvt_id,'
      '       alt.arinvt_id,'
      '       a.itemno,'
      '       a.rev,'
      '       a.class,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.onhand,'
      '       a.unit,'
      '       alt.alternate_item_code_id,'
      '       alt.seq,'
      
        '       round(inv_misc.GetNonCommited( a.id ), 2) as non_committe' +
        'd'
      '  from arinvt_alternate alt, arinvt a'
      ' where alt.parent_arinvt_id = :arinvt_id'
      '   and alt.arinvt_id = a.id'
      '   '
      '   and nvl(a.is_by_product, '#39'N'#39') <> '#39'Y'#39
      '   and nvl(a.pk_hide, '#39'N'#39') <> '#39'Y'#39
      ''
      '   and (:alternate_item_code_id = 0'
      '        or'
      '        :alternate_item_code_id =  alt.alternate_item_code_id)'
      '   '
      ' order by nvl(alt.seq, 99999),'
      '          a.itemno')
    Top = 147
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'alternate_item_code_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'alternate_item_code_id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    inherited wwQuery1ITEMNO: TStringField [0]
    end
    inherited wwQuery1REV: TStringField [1]
    end
    inherited wwQuery1CLASS: TStringField [2]
    end
    inherited wwQuery1DESCRIP: TStringField [3]
    end
    inherited wwQuery1NonCommited: TFloatField [4]
    end
    inherited wwQuery1ONHAND: TBCDField [5]
    end
    inherited wwQuery1UNIT: TStringField [6]
    end
    inherited wwQuery1DESCRIP2: TStringField [7]
    end
    inherited wwQuery1SEQ: TBCDField [8]
      Visible = False
    end
    inherited wwQuery1AlternateItemCode: TStringField [9]
      Visible = False
    end
  end
  inherited PkTrgArinvt: TIQWebHpick
    Active = True
    Left = 300
    Top = 160
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
        Value = 1474590000c
      end>
  end
end
