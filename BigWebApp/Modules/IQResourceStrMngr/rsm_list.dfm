object FrmRsmList: TFrmRsmList
  Left = 316
  Top = 182
  ClientHeight = 264
  ClientWidth = 414
  Caption = 'Constant List'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 110
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      414
      110)
    object Label1: TUniLabel
      Left = 8
      Top = 4
      Width = 26
      Height = 13
      Hint = ''
      Caption = 'Prefix'
      TabOrder = 10
    end
    object Label2: TUniLabel
      Left = 176
      Top = 4
      Width = 72
      Height = 13
      Hint = ''
      Caption = 'Number Format'
      TabOrder = 11
    end
    object Label4: TUniLabel
      Left = 8
      Top = 36
      Width = 52
      Height = 13
      Hint = ''
      Caption = 'Start Value'
      TabOrder = 12
    end
    object Label5: TUniLabel
      Left = 8
      Top = 60
      Width = 49
      Height = 13
      Hint = ''
      Caption = 'End Value'
      TabOrder = 13
    end
    object Bevel1: TUniPanel
      Left = 1
      Top = 25
      Width = 420
      Height = 3
      Hint = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 14
      Caption = ''
    end
    object Label3: TUniLabel
      Left = 8
      Top = 84
      Width = 51
      Height = 13
      Hint = ''
      Caption = 'Left Indent'
      TabOrder = 15
    end
    object edtPrefix: TUniEdit
      Left = 96
      Top = 1
      Width = 49
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 0
    end
    object btnCreate: TUniBitBtn
      Left = 280
      Top = 80
      Width = 128
      Height = 25
      Hint = ''
      Caption = 'Create List'
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnClick = btnCreateClick
    end
    object cmbFormat: TUniComboBox
      Left = 264
      Top = 1
      Width = 145
      Height = 21
      Hint = ''
      Text = '000000000'
      Items.Strings = (
        '000000000000'
        '000000000'
        '000000')
      TabOrder = 16
    end
    object edtStart: TUniEdit
      Left = 96
      Top = 32
      Width = 49
      Height = 21
      Hint = ''
      Text = '0'
      TabOrder = 3
    end
    object edtEnd: TUniEdit
      Left = 96
      Top = 56
      Width = 49
      Height = 21
      Hint = ''
      Text = '0'
      TabOrder = 4
    end
    object udStart: TUpDown
      Left = 145
      Top = 32
      Width = 16
      Height = 21
      Associate = edtStart
      Max = 32767
      TabOrder = 5
    end
    object udEnd: TUpDown
      Left = 145
      Top = 56
      Width = 16
      Height = 21
      Associate = edtEnd
      Max = 32767
      TabOrder = 6
    end
    object edtIndent: TUniEdit
      Left = 96
      Top = 80
      Width = 49
      Height = 21
      Hint = ''
      Text = '0'
      TabOrder = 7
    end
    object udIndent: TUpDown
      Left = 145
      Top = 80
      Width = 16
      Height = 21
      Associate = edtIndent
      Max = 32767
      TabOrder = 8
    end
    object chkPValue: TUniCheckBox
      Left = 184
      Top = 32
      Width = 234
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Assign default empty string value'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 110
    Width = 414
    Height = 154
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object memList: TUniMemo
      Left = 1
      Top = 1
      Width = 412
      Height = 120
      Hint = ''
      ScrollBars = ssVertical
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      WordWrap = False
    end
    object UniPanel1: TUniPanel
      Left = 1
      Top = 120
      Width = 412
      Height = 34
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object btnSelectAll: TUniButton
        Left = 7
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Select All'
        TabOrder = 1
        OnClick = btnSelectAllClick
      end
      object btnCopy: TUniButton
        Left = 95
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Copy'
        TabOrder = 2
      end
      object btnCopyAll: TUniButton
        Left = 183
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Copy All'
        TabOrder = 3
      end
    end
  end
  object PMemo: TUniPopupMenu
    Left = 216
    Top = 114
    object SelectAll1: TUniMenuItem
      Caption = 'Select All'
      ShortCut = 16449
    end
    object Copy1: TUniMenuItem
      Caption = 'Copy'
      ShortCut = 16451
    end
    object CopyAll1: TUniMenuItem
      Caption = 'Copy All'
      ShortCut = 24643
    end
  end
end
