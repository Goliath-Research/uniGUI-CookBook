object OrdersForm: TOrdersForm
  Left = 0
  Top = 0
  Caption = 'Orders / Items'
  ClientHeight = 599
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 289
    Width = 635
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 257
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 25
    Align = alTop
    TabOrder = 0
    object navItems: TDBNavigator
      Left = 394
      Top = 1
      Width = 240
      Height = 23
      DataSource = OrdersDM.dsOrders
      Align = alRight
      TabOrder = 0
    end
    object btnProducts: TBitBtn
      Left = 1
      Top = 1
      Width = 75
      Height = 23
      Action = OrdersDM.actOpenProductsForm
      Align = alLeft
      Caption = 'Products'
      TabOrder = 1
    end
    object btnCustomers: TBitBtn
      Left = 76
      Top = 1
      Width = 75
      Height = 23
      Action = OrdersDM.actOpenCustomersForm
      Align = alLeft
      Caption = 'Customers'
      TabOrder = 2
    end
  end
  object grdItems: TDBGrid
    Left = 0
    Top = 25
    Width = 635
    Height = 264
    Align = alTop
    DataSource = OrdersDM.dsOrders
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustomerID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Customer'
        Title.Alignment = taCenter
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Posted'
        Title.Alignment = taCenter
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Paid'
        Title.Alignment = taCenter
        Width = 128
        Visible = True
      end>
  end
  object pnlClient: TPanel
    Left = 0
    Top = 292
    Width = 635
    Height = 307
    Align = alClient
    TabOrder = 2
    object pnlTopItems: TPanel
      Left = 1
      Top = 1
      Width = 633
      Height = 25
      Align = alTop
      TabOrder = 0
      object dbnvgrProducts: TDBNavigator
        Left = 392
        Top = 1
        Width = 240
        Height = 23
        DataSource = OrdersDM.dsItems
        Align = alRight
        TabOrder = 0
      end
    end
    object dbgrdProducts: TDBGrid
      Left = 1
      Top = 26
      Width = 633
      Height = 280
      Align = alClient
      DataSource = OrdersDM.dsItems
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'OrderID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ProductName'
          Title.Alignment = taCenter
          Title.Caption = 'Product'
          Width = 286
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ProductID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Quantity'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Price'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
  end
end
