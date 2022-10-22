object FrmOSSrvcCreds: TFrmOSSrvcCreds
  Left = 0
  Top = 0
  ClientHeight = 202
  ClientWidth = 435
  Caption = 'Operating System Services Credentials'
  Position = poOwnerFormCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  DesignSize = (
    435
    202)
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsername: TUniLabel
    Left = 9
    Top = 84
    Width = 48
    Height = 13
    Hint = ''
    Caption = 'Username'
    TabOrder = 3
  end
  object lblPassword: TUniLabel
    Left = 9
    Top = 111
    Width = 46
    Height = 13
    Hint = ''
    Caption = 'Password'
    TabOrder = 4
  end
  object lblDomainName: TUniLabel
    Left = 9
    Top = 138
    Width = 65
    Height = 13
    Hint = ''
    Caption = 'Domain Name'
    TabOrder = 5
  end
  object edUsername: TUniDBEdit
    Left = 89
    Top = 81
    Width = 177
    Height = 21
    Hint = ''
    DataField = 'SRVC_USERNAME'
    DataSource = srcIQSys2
    TabOrder = 0
  end
  object edPassword: TUniDBEdit
    Left = 89
    Top = 108
    Width = 257
    Height = 21
    Hint = ''
    DataField = 'SRVC_PASSWORD'
    DataSource = srcIQSys2
    PasswordChar = #8
    TabOrder = 1
  end
  object edDomainName: TUniDBEdit
    Left = 89
    Top = 135
    Width = 257
    Height = 21
    Hint = ''
    DataField = 'SRVC_DOMAIN'
    DataSource = srcIQSys2
    TabOrder = 2
  end
  object btnOK: TUniButton
    Left = 271
    Top = 169
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    Anchors = [akRight, akBottom]
    TabOrder = 6
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 352
    Top = 169
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    Anchors = [akRight, akBottom]
    TabOrder = 7
  end
  object CaptionPanel1: TIQWebCaptionPanel
    Left = 0
    Top = 0
    Width = 435
    Height = 73
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 8
    Caption = 'OS Services Credentials'
    ParentColor = True
    Text = 
      'Some applications running as a service, require OS user credenti' +
      'als to be passed to the OS when launching a new process.  (Examp' +
      'le: When Apache or Ataman launch lmwprint.exe.)'
    PictureLayout = plImageRight
    LayoutStyle = lsWindowsXP
    DesignSize = (
      435
      73)
  end
  object tblIQSys2: TFDTable
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQSYS2'
    TableName = 'IQSYS2'
    Left = 145
    Top = 160
    object tblIQSys2SRVC_DOMAIN: TStringField
      FieldName = 'SRVC_DOMAIN'
      Size = 64
    end
    object tblIQSys2SRVC_USERNAME: TStringField
      FieldName = 'SRVC_USERNAME'
    end
    object tblIQSys2SRVC_PASSWORD: TStringField
      FieldName = 'SRVC_PASSWORD'
      Size = 127
    end
  end
  object srcIQSys2: TDataSource
    DataSet = tblIQSys2
    Left = 161
    Top = 152
  end
end
