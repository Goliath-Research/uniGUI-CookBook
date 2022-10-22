object FrmSalesAnalysis: TFrmSalesAnalysis
  Left = 199
  Top = 115
  ClientHeight = 374
  ClientWidth = 616
  Caption = ''
  OldCreateOrder = True
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 193
    Top = 73
    Width = 9
    Height = 301
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object GroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 616
    Height = 73
    Hint = ''
    Caption = ' Criteria '
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    object Label2: TUniLabel
      Left = 8
      Top = 20
      Width = 16
      Height = 13
      Hint = ''
      Caption = 'By:'
      TabOrder = 1
    end
    object Label3: TUniLabel
      Left = 184
      Top = 20
      Width = 35
      Height = 13
      Hint = ''
      Caption = 'Range:'
      TabOrder = 4
    end
    object Label6: TUniLabel
      Left = 184
      Top = 48
      Width = 47
      Height = 13
      Hint = ''
      Caption = 'Compare:'
      TabOrder = 5
    end
    object Label5: TUniLabel
      Left = 438
      Top = 20
      Width = 12
      Height = 13
      Hint = ''
      Caption = 'To'
      TabOrder = 7
    end
    object Label4: TUniLabel
      Left = 8
      Top = 48
      Width = 24
      Height = 13
      Hint = ''
      Caption = 'Sort:'
      TabOrder = 8
    end
    object ComboBox1: TUniComboBox
      Left = 36
      Top = 16
      Width = 140
      Height = 21
      Hint = ''
      Text = 'ComboBox1'
      Items.Strings = (
        'Customer'
        'Item Number'
        'Product Line'
        'Region'
        'Sales Person'
        'Territory')
      TabOrder = 9
      OnChange = ComboBox1Change
    end
    object ComboBox2: TUniComboBox
      Left = 232
      Top = 16
      Width = 153
      Height = 21
      Hint = ''
      Text = 'ComboBox2'
      Items.Strings = (
        'By Date Range'
        'By Period'
        'Current Month To Date'
        'Current Quarter To Date'
        'Current Year To Date')
      TabOrder = 10
      OnChange = ComboBox2Change
    end
    object Edit1: TUniEdit
      Left = 389
      Top = 16
      Width = 48
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object Edit3: TUniEdit
      Left = 454
      Top = 16
      Width = 48
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 3
    end
    object ComboBox3: TUniComboBox
      Left = 36
      Top = 44
      Width = 140
      Height = 21
      Hint = ''
      Text = 'ComboBox3'
      Items.Strings = (
        'Ascending (A-Z)'
        'Descending (Z-A)')
      TabOrder = 11
    end
    object ComboBox4: TUniComboBox
      Left = 232
      Top = 44
      Width = 153
      Height = 21
      Hint = ''
      Text = 'ComboBox4'
      Items.Strings = (
        'None'
        'Last (Month, Period...)'
        'Previous Year')
      TabOrder = 12
    end
    object BitBtn1: TUniBitBtn
      Left = 389
      Top = 43
      Width = 113
      Height = 25
      Hint = ''
      Caption = 'Apply'
      TabOrder = 6
    end
  end
  object PnlItem: TUniPanel
    Left = 0
    Top = 73
    Width = 193
    Height = 301
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Caption = 'PnlItem'
    object Label1: TUniLabel
      Left = 1
      Top = 1
      Width = 12
      Height = 13
      Hint = ''
      Caption = 'By'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object DBGrid1: TUniDBGrid
      Left = 1
      Top = 13
      Width = 191
      Height = 288
      Hint = ''
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          Title.Caption = 'Item No.'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          Title.Caption = 'Description'
          Width = 128
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object PageControl1: TUniPageControl
    Left = 202
    Top = 73
    Width = 414
    Height = 301
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Graph'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object Chart1: TUniChart
        Left = 0
        Top = 0
        Width = 406
        Height = 273
        Hint = ''
        Title.Text.Strings = (
          'Sales by Item Number')
        LayoutConfig.BodyPadding = '10'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'View SQL'
      object Memo1: TUniMemo
        Left = 0
        Top = 8
        Width = 409
        Height = 241
        Hint = ''
        TabOrder = 0
      end
      object BitBtn2: TUniBitBtn
        Left = 152
        Top = 256
        Width = 113
        Height = 25
        Hint = ''
        Caption = 'Run SQL...'
        TabOrder = 1
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 544
    Top = 16
    object Options1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = '&New...'
      end
      object Open1: TUniMenuItem
        Caption = '&Open...'
      end
      object Save1: TUniMenuItem
        Caption = '&Save'
      end
      object SaveAs1: TUniMenuItem
        Caption = 'Save &As...'
      end
      object Delete1: TUniMenuItem
        Caption = '&Delete'
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print...'
      end
      object PrintSetup1: TUniMenuItem
        Caption = 'Print &Setup...'
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents...'
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object About1: TUniMenuItem
        Caption = '&About...'
      end
    end
  end
end
