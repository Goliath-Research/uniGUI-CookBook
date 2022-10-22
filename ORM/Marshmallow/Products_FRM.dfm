object ProductsForm: TProductsForm
  Left = 0
  Top = 0
  Caption = 'Products'
  ClientHeight = 299
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
  object grdProducts: TDBGrid
    Left = 0
    Top = 25
    Width = 635
    Height = 274
    Align = alClient
    DataSource = ProductsDM.dsProducts
    TabOrder = 0
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Title.Alignment = taCenter
        Width = 287
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 25
    Align = alTop
    TabOrder = 1
    object navProducts: TDBNavigator
      Left = 394
      Top = 1
      Width = 240
      Height = 23
      DataSource = ProductsDM.dsProducts
      Align = alRight
      TabOrder = 0
    end
  end
end
