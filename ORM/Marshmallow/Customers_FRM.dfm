object CustomersForm: TCustomersForm
  Left = 0
  Top = 0
  Caption = 'Customers'
  ClientHeight = 341
  ClientWidth = 411
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
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 411
    Height = 25
    Align = alTop
    TabOrder = 0
    object navCustomers: TDBNavigator
      Left = 170
      Top = 1
      Width = 240
      Height = 23
      DataSource = CustomersDM.dsCustomers
      Align = alRight
      TabOrder = 0
    end
  end
  object grdCustomers: TDBGrid
    Left = 0
    Top = 25
    Width = 411
    Height = 316
    Align = alClient
    DataSource = CustomersDM.dsCustomers
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
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Alignment = taCenter
        Title.Caption = 'Customer Name'
        Width = 322
        Visible = True
      end>
  end
end
