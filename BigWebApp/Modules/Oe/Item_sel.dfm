object FrmItemSelect: TFrmItemSelect
  Left = 199
  Top = 165
  ClientHeight = 175
  ClientWidth = 342
  Caption = 'Item Selection'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 140
    Hint = ''
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 3
      Top = 4
      Width = 336
      Height = 130
      Hint = ''
      TabOrder = 6
      Caption = ''
    end
    object RadioButton1: TUniRadioButton
      Left = 15
      Top = 14
      Width = 212
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Locate Existing Item By Inventory Class'
      TabOrder = 0
      OnClick = RadioButton1Click
    end
    object wwClass: TUniDBLookupComboBox
      Left = 35
      Top = 33
      Width = 57
      Height = 21
      Hint = ''
      ListFieldIndex = 0
      TabOrder = 1
      Color = clWindow
    end
    object RadioButton2: TUniRadioButton
      Left = 15
      Top = 58
      Width = 84
      Height = 17
      Hint = ''
      Caption = 'Free Form'
      TabOrder = 2
      OnClick = RadioButton1Click
    end
    object EditMisc_Item: TUniEdit
      Left = 35
      Top = 78
      Width = 290
      Height = 21
      Hint = ''
      Text = 'EditMisc_Item'
      TabOrder = 3
      OnChange = EditMisc_ItemChange
    end
    object RadioButton3: TUniRadioButton
      Left = 15
      Top = 107
      Width = 113
      Height = 17
      Hint = ''
      Caption = 'Locate AKA Item'
      TabOrder = 4
      OnClick = RadioButton1Click
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 134
    Width = 342
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Tag = 1999
      Left = 133
      Top = 1
      Width = 208
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object ButtonCancel: TUniButton
        Left = 104
        Top = 11
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 1
        OnClick = ButtonCancelClick
      end
      object ButtonOk: TUniButton
        Left = 2
        Top = 11
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 2
        OnClick = ButtonOkClick
      end
    end
  end
  object wwQuery1: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(class) as class,'
      '       descrip'
      '  from arinvt_class'
      ' where NVL( RTrim(type), '#39'*'#39') <> '#39'ROUTING'#39
      ' order by class'
      ' ')
    Left = 232
    Top = 16
    object wwQuery1CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Required = True
      Size = 2
    end
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 50
    end
  end
end
