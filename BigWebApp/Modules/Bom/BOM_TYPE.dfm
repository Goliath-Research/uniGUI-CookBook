object MFG_Type: TMFG_Type
  Left = 352
  Top = 216
  ClientHeight = 94
  ClientWidth = 332
  Caption = 'Select Type'
  BorderStyle = bsDialog
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 8
    Top = 8
    Width = 313
    Height = 42
    Hint = ''
    TabOrder = 0
    Caption = ''
  end
  object Label1: TUniLabel
    Left = 18
    Top = 22
    Width = 48
    Height = 13
    Hint = ''
    Caption = 'MFG Type'
    TabOrder = 1
  end
  object btnOK: TUniButton
    Left = 120
    Top = 60
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TUniButton
    Left = 224
    Top = 60
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object ComboBox1: TUniComboBox
    Left = 124
    Top = 18
    Width = 189
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 4
  end
  object Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select mfgtype '
      '  from mfgtype'
      ' where mfg.is_mfgtype_pm( mfgtype ) = 0'
      'order by mfgtype')
    Left = 8
    Top = 56
  end
end
