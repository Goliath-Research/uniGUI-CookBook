object FormHelp2: TFormHelp2
  Left = 0
  Top = 0
  ClientHeight = 136
  ClientWidth = 424
  Caption = ''
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TUniMemo
    Left = 0
    Top = 0
    Width = 424
    Height = 136
    Hint = ''
    ScrollBars = ssBoth
    Lines.Strings = (
      '1. Enter Release Version'
      '2. Locate your .pjs file'
      '3. Command line & arguments will automatically generate'
      '4. Add your changelist #'#39's'
      '5. Send email!'
      ''
      'Bonus features:'
      
        '-Right clicking in submission type lets you set current submissi' +
        'on type as default'
      '-Double clicking '#39'Release Version'#39' field populates it with DEV')
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    TabOrder = 0
    ExplicitHeight = 119
  end
end
