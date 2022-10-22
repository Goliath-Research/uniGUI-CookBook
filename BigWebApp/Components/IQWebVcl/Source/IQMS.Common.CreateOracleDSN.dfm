object FrmIQCreateDSN: TFrmIQCreateDSN
  Left = 422
  Top = 236
  ClientHeight = 262
  ClientWidth = 337
  Caption = 'Create IQMS DSN'
  Position = poOwnerFormCenter
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 220
    Width = 337
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 199
    ExplicitWidth = 297
    object PnlButtonsInner: TUniPanel
      Left = 224
      Top = 1
      Width = 113
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 184
      object btnCreate: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Create DSN'
        TabOrder = 1
        OnClick = DoCreateClick
      end
    end
  end
  object PnlClient01: TUniPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 220
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 297
    ExplicitHeight = 199
    object Splitter1: TUniSplitter
      Left = 99
      Top = 0
      Width = 6
      Height = 220
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 199
    end
    object PnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 99
      Height = 218
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 199
      DesignSize = (
        99
        218)
      object lblOraVersion: TUniLabel
        Left = 8
        Top = 84
        Width = 69
        Height = 13
        Hint = ''
        Caption = 'Oracle Version'
        TabOrder = 1
      end
      object lblServer: TUniLabel
        Left = 8
        Top = 60
        Width = 32
        Height = 13
        Hint = ''
        Caption = 'Server'
        TabOrder = 2
      end
      object lblDriver: TUniLabel
        Left = 8
        Top = 108
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Driver'
        TabOrder = 3
      end
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'DSN Name'
        TabOrder = 4
      end
      object lblUserName: TUniLabel
        Left = 8
        Top = 164
        Width = 52
        Height = 13
        Hint = ''
        Caption = 'User Name'
        TabOrder = 5
      end
      object lblPassword: TUniLabel
        Left = 8
        Top = 188
        Width = 46
        Height = 13
        Hint = ''
        Caption = 'Password'
        TabOrder = 6
      end
      object Bevel2: TUniPanel
        Left = 8
        Top = 128
        Width = 94
        Height = 2
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        Caption = ''
      end
      object Label2: TUniLabel
        Left = 8
        Top = 36
        Width = 17
        Height = 13
        Hint = ''
        Caption = 'SID'
        TabOrder = 8
      end
    end
    object PnlClient02: TUniPanel
      Left = 105
      Top = 1
      Width = 232
      Height = 218
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitLeft = 102
      ExplicitWidth = 195
      ExplicitHeight = 199
      DesignSize = (
        232
        218)
      object Bevel1: TUniPanel
        Left = 1
        Top = 128
        Width = 293
        Height = 2
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
        ExplicitWidth = 253
      end
      object cmbOraVersion: TUniComboBox
        Left = 1
        Top = 80
        Width = 222
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Oracle 8'
          'Oracle 9i'
          'Oracle 10g'
          'Oracle 11g'
          'Oracle 12c')
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        ExplicitWidth = 182
      end
      object edtServer: TUniEdit
        Left = 1
        Top = 56
        Width = 222
        Hint = ''
        Text = 'IQORA'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -12
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        ExplicitWidth = 182
      end
      object cmbDriver: TUniComboBox
        Left = 1
        Top = 104
        Width = 222
        Height = 21
        Hint = ''
        Text = 'Microsoft ODBC for Oracle'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        OnKeyDown = DoStandardCtrlKeyDown
      end
      object edtDSNName: TUniEdit
        Left = 1
        Top = 8
        Width = 222
        Hint = ''
        Text = 'IQMS Database'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -12
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Color = clWhite
        ExplicitWidth = 182
      end
      object edtUserName: TUniEdit
        Left = 1
        Top = 160
        Width = 222
        Height = 21
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        OnKeyDown = DoLoginEditBoxKeyDown
        ExplicitWidth = 182
      end
      object edtPassword: TUniEdit
        Left = 1
        Top = 184
        Width = 222
        Height = 21
        Hint = ''
        PasswordChar = '*'
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        OnKeyDown = DoLoginEditBoxKeyDown
        ExplicitWidth = 182
      end
      object chkAutoLogin: TUniCheckBox
        Left = 1
        Top = 136
        Width = 222
        Height = 17
        Hint = ''
        Caption = 'Automatically log in with this user'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        OnClick = chkAutoLoginClick
        ExplicitWidth = 182
      end
      object edtSID: TUniEdit
        Left = 1
        Top = 32
        Width = 222
        Hint = ''
        Text = 'IQMS'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -12
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        ExplicitWidth = 182
      end
    end
  end
  object TestDatabase: TFDConnection
    Params.Strings = (
      'USER NAME=SHIPPING')
    Left = 60
    Top = 40
  end
end
