object Form1: TForm1
  Left = 184
  Top = 99
  ClientHeight = 338
  ClientWidth = 560
  Caption = 'Base Employee Info'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 24
    Top = 16
    Width = 51
    Height = 13
    Hint = ''
    Caption = 'First Name'
    TabOrder = 14
  end
  object Label2: TUniLabel
    Left = 24
    Top = 48
    Width = 50
    Height = 13
    Hint = ''
    Caption = 'Last Name'
    TabOrder = 15
  end
  object Label4: TUniLabel
    Left = 305
    Top = 25
    Width = 30
    Height = 13
    Hint = ''
    Caption = 'Middle'
    TabOrder = 16
  end
  object Label37: TUniLabel
    Left = 32
    Top = 107
    Width = 48
    Height = 13
    Hint = ''
    Caption = 'Address 1'
    TabOrder = 17
  end
  object Label38: TUniLabel
    Left = 32
    Top = 133
    Width = 48
    Height = 13
    Hint = ''
    Caption = 'Address 2'
    TabOrder = 18
  end
  object Label39: TUniLabel
    Left = 32
    Top = 159
    Width = 48
    Height = 13
    Hint = ''
    Caption = 'Address 3'
    TabOrder = 19
  end
  object Label40: TUniLabel
    Left = 32
    Top = 185
    Width = 19
    Height = 13
    Hint = ''
    Caption = 'City'
    TabOrder = 20
  end
  object Label41: TUniLabel
    Left = 32
    Top = 211
    Width = 26
    Height = 13
    Hint = ''
    Caption = 'State'
    TabOrder = 21
  end
  object Label42: TUniLabel
    Left = 158
    Top = 210
    Width = 14
    Height = 13
    Hint = ''
    Caption = 'Zip'
    TabOrder = 22
  end
  object Label56: TUniLabel
    Left = 32
    Top = 237
    Width = 39
    Height = 13
    Hint = ''
    Caption = 'Country'
    TabOrder = 23
  end
  object Label58: TUniLabel
    Left = 305
    Top = 107
    Width = 30
    Height = 13
    Hint = ''
    Caption = 'Phone'
    TabOrder = 24
  end
  object Label59: TUniLabel
    Left = 305
    Top = 133
    Width = 18
    Height = 13
    Hint = ''
    Caption = 'Fax'
    TabOrder = 25
  end
  object Label65: TUniLabel
    Left = 456
    Top = 107
    Width = 20
    Height = 13
    Hint = ''
    Caption = 'Ext.'
    TabOrder = 26
  end
  object Label73: TUniLabel
    Left = 305
    Top = 158
    Width = 28
    Height = 13
    Hint = ''
    Caption = 'Notes'
    TabOrder = 27
  end
  object dbeEmpAddr1: TUniDBEdit
    Left = 88
    Top = 102
    Width = 195
    Height = 21
    Hint = ''
    MaxLength = 30
    ParentFont = False
    Font.Color = clBlack
    TabOrder = 0
    Color = clBtnFace
  end
  object dbeEmpAddr2: TUniDBEdit
    Left = 88
    Top = 128
    Width = 195
    Height = 21
    Hint = ''
    MaxLength = 30
    ParentFont = False
    Font.Color = clBlack
    TabOrder = 1
    Color = clBtnFace
  end
  object dbeEmpAddr3: TUniDBEdit
    Left = 88
    Top = 154
    Width = 195
    Height = 21
    Hint = ''
    MaxLength = 30
    ParentFont = False
    Font.Color = clBlack
    TabOrder = 2
    Color = clBtnFace
  end
  object dbeEmpCity: TUniDBEdit
    Left = 88
    Top = 180
    Width = 195
    Height = 21
    Hint = ''
    MaxLength = 30
    ParentFont = False
    Font.Color = clBlack
    TabOrder = 3
    Color = clBtnFace
  end
  object dbeEmpZIP: TUniDBEdit
    Left = 184
    Top = 206
    Width = 99
    Height = 21
    Hint = ''
    MaxLength = 10
    ParentFont = False
    Font.Color = clBlack
    TabOrder = 4
    Color = clBtnFace
  end
  object dbeEmpState: TUniDBComboBox
    Left = 88
    Top = 205
    Width = 65
    Height = 21
    Hint = ''
    Items.Strings = (
      'AK'
      'AL'
      'AR'
      'AZ'
      'CA'
      'CO'
      'CT'
      'DC'
      'DE'
      'FL'
      'GA'
      'HA'
      'IA'
      'ID'
      'IL'
      'IN'
      'KS'
      'KY'
      'LA'
      'MA'
      'MD'
      'MI'
      'MN'
      'MO'
      'MS'
      'MT'
      'NC'
      'ND'
      'NE'
      'NH'
      'NJ'
      'NM'
      'NV'
      'NY'
      'OH'
      'OK'
      'OR'
      'PA'
      'RI'
      'SC'
      'SD'
      'TN'
      'TX'
      'UT'
      'VA'
      'VT'
      'WA'
      'WI'
      'WV'
      'WY')
    ParentFont = False
    Font.Color = clBlack
    TabOrder = 5
    Color = clBtnFace
  end
  object dbeEmpCountry: TUniDBEdit
    Left = 88
    Top = 232
    Width = 120
    Height = 21
    Hint = ''
    MaxLength = 30
    TabOrder = 6
    Color = clBtnFace
  end
  object dbeEmpPhone: TUniDBEdit
    Left = 351
    Top = 102
    Width = 98
    Height = 21
    Hint = ''
    MaxLength = 12
    TabOrder = 7
    Color = clBtnFace
  end
  object dbeEmpFax: TUniDBEdit
    Left = 351
    Top = 128
    Width = 98
    Height = 21
    Hint = ''
    MaxLength = 12
    TabOrder = 8
    Color = clBtnFace
  end
  object DBEdit2: TUniDBEdit
    Left = 481
    Top = 102
    Width = 48
    Height = 21
    Hint = ''
    TabOrder = 9
    Color = clBtnFace
  end
  object DBMemo1: TUniDBMemo
    Left = 352
    Top = 156
    Width = 201
    Height = 175
    Hint = ''
    TabOrder = 10
    Color = clBtnFace
  end
  object dbeEmpFName: TUniDBEdit
    Left = 88
    Top = 16
    Width = 121
    Height = 21
    Hint = ''
    TabOrder = 11
  end
  object dbeEmpLastName: TUniDBEdit
    Left = 88
    Top = 45
    Width = 121
    Height = 21
    Hint = ''
    TabOrder = 12
  end
  object DBEdit4: TUniDBEdit
    Left = 350
    Top = 24
    Width = 121
    Height = 21
    Hint = ''
    TabOrder = 13
  end
end
