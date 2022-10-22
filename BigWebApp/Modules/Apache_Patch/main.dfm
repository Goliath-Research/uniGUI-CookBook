object FrmMain: TFrmMain
  Left = 390
  Top = 208
  Width = 408
  Height = 227
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF
    FFFFFFFFFFFFFFFFFFFFFFFF87FFFFFFFFFFF877678FFFFFFFFFFFF8648FFFFF
    FFF87644464678FFFFFFFFF646FFFFFFF764464666464466FFFFFF4467FFFFFF
    F446678FF87666647FFFF7666FFFFFF8466FFFFFFFFFF866647F6446FFFFFFF6
    647FFFFFFFFFFF8646664668FFFFFFF668FFFFFFFFFFFFFF866664FFFFFFFF74
    6FFFFFFFFFFFFFFFF74666FFFFFFFF764FFFFFFFFFFFFFFF7664448FFFFFFF66
    4FFFFFFFFFFFFFF846686447FFFFFF646FFFFFFFFFFFFFF6648F7666FFFFFF74
    6FFFFFFFFFFFFF4667FFF8648FFFFF746FFFFFFFFFFFF7666FFFFF646FFFFFF4
    6FFFFFFFFFF76466FFFFFF7647FFFFF648FFFFFFFFF6466FFFFFFFF666FFFFF6
    66FFFFF8FFF646FFFFFFFFF866FFFFF8646FFF746FFFFFFFFFFFFFFF668FFFFF
    664FFF846FFFFFFFFFFFFFFF647FFFFFF446FFF467FFFFFFFFFFFFFF646FFFFF
    F6647FF6448FFFFFFFFFFFFF766FFFFFFF6648FF766FFFFFFFFFFFFF746FFFFF
    FFF466FFF646FFFFFFFFFFFF647FFFFFFFF8664FFF6646FFFFFFFFFF448FFFFF
    FFFFF6466FF64667FFFFFF8646FFFFFFFFFFF86447FF744668FFF86467FFFFF4
    667FFFF64648FF7666644666FFFFFFF6446FFFFF764478F866466468FFFFFFF6
    446FFFFFFF76446FFFFFFFFFFFFFFFF4666FFFFFFFF7666FFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 200
    Align = alClient
    Color = clGray
    TabOrder = 0
    object Label1: TUniLabel
      Left = 40
      Top = 16
      Width = 316
      Height = 24
      Caption = 'Oracle - Apache Patch Installation'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label2: TUniLabel
      Left = 56
      Top = 56
      Width = 273
      Height = 13
      Caption = 'This installer will apply all  current security patches for your'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label3: TUniLabel
      Left = 56
      Top = 72
      Width = 277
      Height = 13
      Caption = 'apache server.  It should be run prior to making your server'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TUniLabel
      Left = 56
      Top = 88
      Width = 125
      Height = 13
      Caption = 'accessible on the Internet.'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblStatus: TUniLabel
      Left = 16
      Top = 168
      Width = 41
      Height = 13
      Caption = 'Status:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label5: TUniLabel
      Left = 327
      Top = 152
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'current as of:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TUniLabel
      Left = 318
      Top = 168
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'May 2, 2003'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCurStat: TUniLabel
      Left = 64
      Top = 168
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object sbtnInstall: TUniButton
      Left = 152
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Install'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      ParentFont = False
      OnClick = sbtnInstallClick
    end
  end
end
