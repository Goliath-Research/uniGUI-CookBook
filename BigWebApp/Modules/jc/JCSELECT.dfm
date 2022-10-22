object frmJCSelect: TfrmJCSelect
  Left = 172
  Top = 145
  BorderStyle = bsDialog
  Caption = 'Selection Criteria'
  ClientHeight = 187
  ClientWidth = 414
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Style = []
  Position = poDefaultPosOnly
  object GroupBox1: TUniGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 169
    Caption = 'Specific'
    TabOrder = 0
    object Label1: TUniLabel
      Left = 16
      Top = 32
      Width = 59
      Height = 13
      Caption = 'Part Number'
    end
    object Label2: TUniLabel
      Left = 16
      Top = 72
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object Label3: TUniLabel
      Left = 16
      Top = 112
      Width = 55
      Height = 13
      Caption = 'Sales Order'
    end
  end
  object BitBtn1: TUniBitBtn
    Left = 232
    Top = 152
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object Cancel: TUniButton
    Left = 328
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
  end
  object GroupBox2: TUniGroupBox
    Left = 218
    Top = 8
    Width = 185
    Height = 105
    Caption = 'Date Range'
    TabOrder = 3
    object From: TUniLabel
      Left = 16
      Top = 32
      Width = 23
      Height = 13
      Caption = 'From'
    end
    object Label4: TUniLabel
      Left = 16
      Top = 56
      Width = 13
      Height = 13
      Caption = 'To'
    end
  end
end
