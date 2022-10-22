inherited FrmAssyDataGetSerialNumber: TFrmAssyDataGetSerialNumber
  ClientHeight = 216
  ClientWidth = 652
  Font.Name = 'Segoe UI'
  OnCreate = FormCreate
  ExplicitWidth = 658
  ExplicitHeight = 245
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TUniLabel
    Top = 26
    Width = 102
    ExplicitTop = 26
    ExplicitWidth = 102
  end
  inherited sbtnPickMFG: TUniSpeedButton
    Left = 549
    Top = 7
    Width = 50
    Height = 50
    ExplicitLeft = 549
    ExplicitTop = 7
    ExplicitWidth = 50
    ExplicitHeight = 50
  end
  object sbtnEdit: TUniSpeedButton [2]
    Left = 490
    Top = 7
    Width = 50
    Height = 50
    Hint = ''
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFDDDDD00000000
      00DDDDDD7777777777FDDDDD0FFFFFFFF0DDDDDD7FDDDDDDD7FDDDDD0FFFFFFF
      F0DDDDDD7FDDDDDDD7FDDDDD0FF80FFFF0DDDDDD7FD87FDDD7FDDDDD0F800FFF
      F0DDDDDD7F877FDDD7FDDDDD080B0FFFF0DDDDDD787F7DDDD7FDDDDD00B0FFFF
      F0DDDDDD77F7DDDDD7FDDDDD0B0FFFFFF0DDDDDD7F7DDDDDD7FDDDD0B0FFFFFF
      F0DDDDD7F7DDDDDDD7FDDD0B0FFFFFFFF0DDDD7F7FDDDDDDD7FDD0B07FFFFFFF
      F0DDD7F77FFFFFFFF7FDD90D0000000000DDD77D7777777777DDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    Caption = ''
    ParentColor = False
    Color = clWindow
    OnClick = sbtnEditClick
  end
  inherited edSer: TUniEdit
    Left = 150
    Top = 17
    Width = 334
    Height = 30
    ExplicitLeft = 150
    ExplicitTop = 17
    ExplicitWidth = 334
    ExplicitHeight = 30
  end
  inherited PnlButtons: TUniPanel
    Top = 144
    Width = 652
    Height = 72
    ExplicitTop = 144
    ExplicitWidth = 652
    ExplicitHeight = 72
    inherited PnlButtonsInner: TUniPanel
      Left = 61
      Width = 590
      Height = 70
      ExplicitLeft = 61
      ExplicitWidth = 590
      ExplicitHeight = 70
      inherited btnReprint: TUniButton
        Left = 176
        Width = 120
        Height = 50
        ExplicitLeft = 176
        ExplicitWidth = 120
        ExplicitHeight = 50
      end
      inherited btnOk: TUniButton
        Left = 40
        Width = 120
        Height = 50
        ExplicitLeft = 40
        ExplicitWidth = 120
        ExplicitHeight = 50
      end
      inherited btnVoid: TUniButton
        Left = 320
        Width = 120
        Height = 50
        ExplicitLeft = 320
        ExplicitWidth = 120
        ExplicitHeight = 50
      end
      inherited BtnCancel: TUniButton
        Left = 464
        Width = 120
        Height = 50
        ExplicitLeft = 464
        ExplicitWidth = 120
        ExplicitHeight = 50
      end
    end
  end
  inherited CbFor: TUniCheckBox
    Left = 150
    Top = 65
    ExplicitLeft = 150
    ExplicitTop = 65
  end
end
