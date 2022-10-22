object FactTableQueryForm: TFactTableQueryForm
  Left = 0
  Top = 0
  Caption = 'Fact Table Query (SQL)'
  ClientHeight = 311
  ClientWidth = 514
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
  object USynMemo1: TUSynMemo
    Left = 0
    Top = 0
    Width = 514
    Height = 311
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Highlighter = USynSQLSyn1
    Lines.Strings = (
      'select'
      '  c.ID as CustomerID,'
      '  c.Name as Customer,'
      '  o.ID as OrderID,'
      '  o.Posted,'
      '  p.ID as ProductID,'
      '  p.Description as Product,'
      '  i.Quantity,'
      '  p.Price,'
      '  i.Quantity * p.Price as Total'
      'from'
      '  dbo.Customers as c'
      '    inner join dbo.Orders   as o on o.CustomerID = c.ID'
      '    inner join dbo.Items    as i on i.OrderID    = o.ID'
      '    inner join dbo.Products as p on i.ProductID  = p.ID')
    ExplicitWidth = 497
    ExplicitHeight = 231
  end
  object USynSQLSyn1: TUSynSQLSyn
    Left = 256
    Top = 32
  end
end
