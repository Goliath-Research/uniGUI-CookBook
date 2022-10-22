inherited FrmNewLocByArinvt: TFrmNewLocByArinvt
  Left = 307
  ClientHeight = 239
  ClientWidth = 365
  Caption = 'New Location and Lot #'
  BorderStyle = bsSizeable
  ExplicitWidth = 320
  ExplicitHeight = 278
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TUniStatusBar
    Top = 220
    Width = 365
    ExplicitTop = 220
    ExplicitWidth = 365
  end
  inherited Panel1: TUniPanel
    Top = 185
    Width = 365
    ExplicitTop = 185
    ExplicitWidth = 365
    inherited btnOk: TUniButton
      Left = 150
      ExplicitLeft = 150
    end
    inherited BtnCancel: TUniButton
      Left = 259
      ExplicitLeft = 259
    end
  end
  inherited pnlData1: TUniPanel
    Width = 365
    ExplicitWidth = 365
  end
  inherited pnlData3: TUniPanel
    Top = 111
    Width = 365
    Height = 54
    ExplicitTop = 111
    ExplicitWidth = 365
    ExplicitHeight = 54
    object Label4: TUniLabel [0]
      Left = 14
      Top = 4
      Width = 41
      Height = 13
      Hint = ''
      Caption = 'Lot Date'
      TabOrder = 4
    end
    inherited Label44: TUniLabel
      Top = 29
      ExplicitTop = 29
    end
    inherited EdDiv: TUniEdit
      Top = 25
      ExplicitTop = 25
    end
    object wwDBDateTimePickerLotDate: TUniDBDateTimePicker
      Left = 120
      Top = 0
      Width = 156
      Height = 21
      Hint = ''
      DateTime = 42689.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
  end
  inherited pnlData2: TUniPanel
    Width = 365
    Height = 24
    ExplicitWidth = 365
    ExplicitHeight = 24
    inherited lblExpLotDate: TUniLabel
      Left = 12
      ExplicitLeft = 12
    end
    inherited wwDBDateTimePickerLotExpiry: TUniDBDateTimePicker
      Top = 0
      ExplicitTop = 0
    end
  end
  inherited SR: TIQWebSecurityRegister
    Left = 292
    Top = 150
  end
  inherited wwQryLocations: TFDQuery
    Top = 122
  end
  inherited PkLoc: TIQWebHpick
    Left = 294
    Top = 94
  end
end
