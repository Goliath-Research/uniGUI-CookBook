object FrmSecInsAutoLoginSetup: TFrmSecInsAutoLoginSetup
  Left = 243
  Top = 192
  ClientHeight = 203
  ClientWidth = 415
  Caption = 'Auto Login Setup'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 160
    Width = 415
    Height = 43
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Bevel2: TUniPanel
      Left = 1
      Top = 1
      Width = 413
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel2: TUniPanel
      Left = 233
      Top = 3
      Width = 182
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 5
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 97
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 415
    Height = 160
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 108
      Top = 35
      Width = 6
      Height = 125
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Bevel1: TUniPanel
      Left = 1
      Top = 35
      Width = 22
      Height = 125
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 5
      Caption = ''
    end
    object Panel4: TUniPanel
      Left = 22
      Top = 35
      Width = 86
      Height = 125
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      object Label1: TUniLabel
        Left = 5
        Top = 12
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'User ID'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 5
        Top = 36
        Width = 46
        Height = 13
        Hint = ''
        Caption = 'Password'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 5
        Top = 60
        Width = 44
        Height = 13
        Hint = ''
        Caption = 'EPlant ID'
        TabOrder = 3
      end
      object Label4: TUniLabel
        Left = 5
        Top = 84
        Width = 22
        Height = 13
        Hint = ''
        Caption = 'Alias'
        TabOrder = 4
      end
    end
    object Panel5: TUniPanel
      Left = 114
      Top = 35
      Width = 301
      Height = 125
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      DesignSize = (
        301
        125)
      object edUserName: TUniEdit
        Left = 1
        Top = 7
        Width = 293
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edPassword: TUniEdit
        Left = 1
        Top = 31
        Width = 293
        Height = 21
        Hint = ''
        PasswordChar = '*'
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edAliasName: TUniEdit
        Left = 1
        Top = 79
        Width = 293
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object wwDBComboDlgEplant_ID: TUniEdit
        Left = 1
        Top = 55
        Width = 293
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ReadOnly = True
        OnClick = wwDBComboDlgEplant_IDCustomDlg
      end
    end
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 413
      Height = 35
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object chkEnableAutoLogin: TUniCheckBox
        Left = 8
        Top = 9
        Width = 121
        Height = 17
        Hint = ''
        Caption = 'Enable Auto Login'
        TabOrder = 0
        OnClick = chkEnableAutoLoginClick
      end
    end
  end
  object SQLConnection1: TSQLConnection
    Left = 32
    Top = 152
  end
end
