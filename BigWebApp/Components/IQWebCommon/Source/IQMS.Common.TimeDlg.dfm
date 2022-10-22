inherited FrmTimeDialog: TFrmTimeDialog
  ClientHeight = 131
  Caption = 'Date/Time'
  ExplicitHeight = 160
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox1: TUniGroupBox
    Height = 91
    Caption = '  Select Date/Time Scope  '
    ExplicitHeight = 91
    inherited Label1: TUniLabel
      TabOrder = 6
    end
    object DateTimePicker1Time: TUniDateTimePicker
      Left = 49
      Top = 46
      Width = 96
      Height = 21
      Hint = ''
      DateTime = 0.199935659722541500
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Kind = tUniTime
      TabOrder = 2
    end
    object DateTimePicker2Time: TUniDateTimePicker
      Left = 198
      Top = 45
      Width = 97
      Height = 21
      Hint = ''
      DateTime = 0.199935833334166100
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Kind = tUniTime
      TabOrder = 3
    end
  end
  inherited Panel1: TUniPanel
    Top = 91
    Height = 40
    ExplicitTop = 91
    ExplicitHeight = 40
    inherited Panel2: TUniPanel
      Height = 38
      ExplicitHeight = 38
    end
  end
end
