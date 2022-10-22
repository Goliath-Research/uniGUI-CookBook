object SndDB: TSndDB
  OldCreateOrder = True
  Height = 116
  Width = 175
  object Database1: TFDConnection
    Params.Strings = (
      'user name=IQMS'
      'password=IQMS')
    LoginPrompt = False
    Left = 12
    Top = 6
  end
end
