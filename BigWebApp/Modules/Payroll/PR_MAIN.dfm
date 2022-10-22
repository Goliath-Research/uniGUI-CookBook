object Form2: TForm2
  Left = 69
  Top = 187
  ClientHeight = 324
  ClientWidth = 571
  Caption = 'Employee'#39's Data '
  OldCreateOrder = False
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 169
    Top = 24
    Width = 8
    Height = 300
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 571
    Height = 24
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 371
      Top = 1
      Width = 200
      Height = 22
      Hint = ''
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object TreeView1: TUniTreeView
    Left = 0
    Top = 24
    Width = 169
    Height = 300
    Hint = ''
    Items.NodeData = {
      03020000002E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      000700000001084A006F006500200042006C006F007700360000000000000000
      000000FFFFFFFFFFFFFFFF000000000000000000000000010C470065006E0065
      00720061006C00200049006E0066006F00280000000000000000000000FFFFFF
      FFFFFFFFFF000000000000000000000000010557006100670065007300280000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010554
      006100780065007300320000000000000000000000FFFFFFFFFFFFFFFF000000
      000000000000000000010A44006500640075006300740069006F006E0073003A
      0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
      0E44006900720065006300740020004400650070006F007300690074002E0000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010841
      00630063007200750061006C0073001E0000000000000000000000FFFFFFFFFF
      FFFFFF0000000000000000000000000100300000000000000000000000FFFFFF
      FFFFFFFFFF0000000000000000000000000109530075007A007900200057006F
      006E006700}
    Items.FontData = {
      0102000000FFFFFFFF07000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
      FF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
      FF00000000FFFFFFFF00000000}
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Color = clWindow
  end
  object Panel2: TUniPanel
    Left = 177
    Top = 24
    Width = 394
    Height = 300
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = ''
  end
  object PageControl1: TUniPageControl
    Left = 177
    Top = 24
    Width = 394
    Height = 300
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'General '
      object Label1: TUniLabel
        Left = 8
        Top = 16
        Width = 51
        Height = 13
        Hint = ''
        Caption = 'First Name'
        TabOrder = 12
      end
      object Label2: TUniLabel
        Left = 8
        Top = 48
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Last Name'
        TabOrder = 13
      end
      object Label4: TUniLabel
        Left = 289
        Top = 25
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Middle'
        TabOrder = 14
      end
      object Label37: TUniLabel
        Left = 16
        Top = 94
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Address 1'
        TabOrder = 15
      end
      object Label38: TUniLabel
        Left = 16
        Top = 120
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Address 2'
        TabOrder = 16
      end
      object Label40: TUniLabel
        Left = 16
        Top = 147
        Width = 19
        Height = 13
        Hint = ''
        Caption = 'City'
        TabOrder = 17
      end
      object Label41: TUniLabel
        Left = 16
        Top = 173
        Width = 26
        Height = 13
        Hint = ''
        Caption = 'State'
        TabOrder = 18
      end
      object Label42: TUniLabel
        Left = 142
        Top = 172
        Width = 14
        Height = 13
        Hint = ''
        Caption = 'Zip'
        TabOrder = 19
      end
      object Label56: TUniLabel
        Left = 16
        Top = 199
        Width = 39
        Height = 13
        Hint = ''
        Caption = 'Country'
        TabOrder = 20
      end
      object Label58: TUniLabel
        Left = 289
        Top = 107
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Phone'
        TabOrder = 21
      end
      object Label59: TUniLabel
        Left = 289
        Top = 133
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'Fax'
        TabOrder = 22
      end
      object Label65: TUniLabel
        Left = 360
        Top = 107
        Width = 20
        Height = 13
        Hint = ''
        Caption = 'Ext.'
        TabOrder = 23
      end
      object Middle: TUniLabel
        Left = 208
        Top = 19
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Middle'
        TabOrder = 24
      end
      object dbeEmpAddr1: TUniDBEdit
        Left = 72
        Top = 89
        Width = 195
        Height = 22
        Hint = ''
        MaxLength = 30
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 0
        Color = clBtnFace
      end
      object dbeEmpAddr2: TUniDBEdit
        Left = 72
        Top = 115
        Width = 195
        Height = 22
        Hint = ''
        MaxLength = 30
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 1
        Color = clBtnFace
      end
      object dbeEmpCity: TUniDBEdit
        Left = 72
        Top = 142
        Width = 195
        Height = 22
        Hint = ''
        MaxLength = 30
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 2
        Color = clBtnFace
      end
      object dbeEmpZIP: TUniDBEdit
        Left = 168
        Top = 168
        Width = 99
        Height = 22
        Hint = ''
        MaxLength = 10
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 3
        Color = clBtnFace
      end
      object dbeEmpState: TUniDBComboBox
        Left = 72
        Top = 167
        Width = 65
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
        TabOrder = 4
        Color = clBtnFace
      end
      object dbeEmpCountry: TUniDBEdit
        Left = 72
        Top = 194
        Width = 120
        Height = 21
        Hint = ''
        MaxLength = 30
        TabOrder = 5
        Color = clBtnFace
      end
      object dbeEmpPhone: TUniDBEdit
        Left = 280
        Top = 102
        Width = 98
        Height = 21
        Hint = ''
        MaxLength = 12
        TabOrder = 6
        Color = clBtnFace
      end
      object dbeEmpFax: TUniDBEdit
        Left = 280
        Top = 128
        Width = 98
        Height = 21
        Hint = ''
        MaxLength = 12
        TabOrder = 7
        Color = clBtnFace
      end
      object DBEdit2: TUniDBEdit
        Left = 330
        Top = 102
        Width = 48
        Height = 21
        Hint = ''
        TabOrder = 8
        Color = clBtnFace
      end
      object dbeEmpFName: TUniDBEdit
        Left = 72
        Top = 16
        Width = 121
        Height = 21
        Hint = ''
        TabOrder = 9
      end
      object dbeEmpLastName: TUniDBEdit
        Left = 72
        Top = 45
        Width = 121
        Height = 21
        Hint = ''
        TabOrder = 10
      end
      object DBEdit4: TUniDBEdit
        Left = 249
        Top = 16
        Width = 121
        Height = 21
        Hint = ''
        TabOrder = 11
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'Wage Info'
    end
    object TabSheet3: TUniTabSheet
      Hint = ''
      Caption = 'Taxation'
    end
    object TabSheet4: TUniTabSheet
      Hint = ''
      Caption = 'Deductions'
    end
    object TabSheet5: TUniTabSheet
      Hint = ''
      Caption = 'Accruals'
    end
    object TabSheet6: TUniTabSheet
      Hint = ''
      Caption = 'H.R.'
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 184
    object File1: TUniMenuItem
      Caption = 'File'
      object New1: TUniMenuItem
        Caption = 'New'
      end
    end
    object Options1: TUniMenuItem
      Caption = 'Options'
    end
    object Print1: TUniMenuItem
      Caption = 'Print'
    end
  end
end
