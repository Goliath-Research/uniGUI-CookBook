object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Sales Register Demo (not using ORM)'
  ClientHeight = 53
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnProducts: TBitBtn
    Left = 0
    Top = 0
    Width = 75
    Height = 53
    Action = MainDM.actOpenProductsForm
    Align = alLeft
    Caption = 'Products'
    TabOrder = 0
    ExplicitLeft = 1
    ExplicitTop = 1
    ExplicitHeight = 23
  end
  object btnCustomers: TBitBtn
    Left = 75
    Top = 0
    Width = 75
    Height = 53
    Action = MainDM.actOpenCustomersForm
    Align = alLeft
    Caption = 'Customers'
    TabOrder = 1
    ExplicitLeft = 76
    ExplicitTop = 1
    ExplicitHeight = 23
  end
  object btnOpenOrdersForm: TBitBtn
    Left = 150
    Top = 0
    Width = 75
    Height = 53
    Action = MainDM.actOpenOrdersForm
    Align = alLeft
    Caption = 'Orders'
    TabOrder = 2
    ExplicitLeft = 83
  end
  object mmMain: TMainMenu
    Left = 256
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Action = MainDM.FileExit1
      end
    end
    object Actions1: TMenuItem
      Caption = 'Actions'
      object EditProducts1: TMenuItem
        Action = MainDM.actOpenProductsForm
      end
      object EditCustomers1: TMenuItem
        Action = MainDM.actOpenCustomersForm
      end
      object EditOrders1: TMenuItem
        Action = MainDM.actOpenOrdersForm
      end
    end
  end
end
