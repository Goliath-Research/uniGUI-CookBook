object dLoginForm: TdLoginForm
  Left = 0
  Top = 0
  ClientHeight = 137
  ClientWidth = 396
  Caption = 'Login Form'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Layout = 'form'
  OnCreate = UniLoginFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 86
    Width = 396
    Height = 51
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    object UniFieldContainer1: TUniFieldContainer
      Left = 0
      Top = 0
      Width = 396
      Height = 51
      Hint = ''
      ParentColor = False
      Align = alClient
      TabOrder = 1
      Layout = 'table'
      LayoutAttribs.Columns = 2
      object btnOk: TUniBitBtn
        Left = 46
        Top = 13
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        Images = UniNativeImageList1
        ImageIndex = 0
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 282
        Top = 13
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        Images = UniNativeImageList1
        ImageIndex = 1
      end
    end
  end
  object UniFieldSet1: TUniFieldSet
    Left = 0
    Top = 0
    Width = 396
    Height = 86
    Hint = ''
    Title = 'Enter Credentials'
    Align = alClient
    Layout = 'form'
    LayoutConfig.Region = 'center'
    TabOrder = 1
    object edtUsername: TUniEdit
      Left = 40
      Top = 20
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 1
      ClearButton = True
      FieldLabel = 'Username'
      OnKeyDown = edtUsernameKeyDown
    end
    object edtPassword: TUniEdit
      Left = 40
      Top = 48
      Width = 121
      Hint = ''
      PasswordChar = '*'
      Text = ''
      TabOrder = 2
      ClearButton = True
      FieldLabel = 'Password'
      OnKeyDown = edtPasswordKeyDown
    end
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 296
    Top = 16
    Images = {
      02000000FFFFFF1F04F400000089504E470D0A1A0A0000000D49484452000000
      100000001008060000001FF3FF61000000097048597300000EC300000EC301C7
      6FA864000000A649444154388DC5D2BD1182401445E10F2BB0144B900E342780
      8C102B81D0CC84DC12B4044AA10493D559F16761C6195FF8F69E3377761EFF9E
      6C49B8EEBB352E188E45532D1244F026ACAED8AF16143847306CD1CE6A50F7DD
      09E5643D204F0ABEC1C7A219B34970737F9803133E71121C90A34DC190D57D57
      E234098E58A7E04F0DDECD5BF821089233764B6088EFA00AE1D9F05383D022BE
      B624FC2288242D0E29F8277303F3F849AC4A1FB1B00000000049454E44AE4260
      82FFFFFF1F040001000089504E470D0A1A0A0000000D49484452000000100000
      001008060000001FF3FF61000000097048597300000EC300000EC301C76FA864
      000000B249444154388DAD93C10D842010453FC402B60C8EB64062216E2CC05A
      2880682124B4C0D1322CC1CBA0230226CBCEC9C1FF3ECC27008D25E2C7360D23
      80198056D6ED39F1360D1F001E8051D6ADA701C10BE942CE84C13D2D7D9575AB
      A46666DA1E8027A0049F4C478D4E04D144539FC281985B06B95D0233BCC17144
      C17E944C783DF211A9A262920D57A2B1FE3742538815B87A8DCABA5DBE096827
      CD4E134FE4812B44539BB36062D20C46FCF0989AEB0011AC63D7249431000000
      000049454E44AE426082}
  end
end
