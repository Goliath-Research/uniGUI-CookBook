object FrmOeUomConversion: TFrmOeUomConversion
  Left = 0
  Top = 0
  ClientHeight = 173
  ClientWidth = 661
  Caption = 'Sales Order Qty Conversion'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 661
    Height = 173
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 444
    IQComponents.Grid.Height = 87
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = DataSource1
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = DataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 444
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 87
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'CAPTION'
        Title.Caption = 'Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY'
        Title.Caption = 'SO UOM'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NATIVE_QTY'
        Title.Caption = 'Native UOM'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 184
    Top = 8
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select arinvt_id,'
      '       x.caption,'
      '       x.qty'
      '      '
      ''
      ' from ord_detail d,'
      '      ( select :blanket_qty as qty, '
      '               '#39'Blanket Qty'#39' as caption,'
      '               1 as seq '
      '          from dual'
      ''
      '        union all       '
      '        select :total_releases,  '
      '               '#39'Total Releases'#39','
      '               2 '
      '          from dual'
      ''
      '        union all       '
      '        select :qty_shipped,'
      '               '#39'Qty Shipped'#39','
      '               3'
      '          from dual'
      ''
      '        union all       '
      '        select :backlog_qty,'
      '               '#39'Backlog Qty'#39','
      '               4 '
      '          from dual ) x'
      ' where d.id = :ord_detail_id'
      'order by x.seq'
      ' '
      ''
      '         '
      '       ')
    Left = 232
    Top = 8
    ParamData = <
      item
        Name = 'blanket_qty'
        DataType = ftFloat
      end
      item
        Name = 'total_releases'
        DataType = ftFloat
      end
      item
        Name = 'qty_shipped'
        DataType = ftFloat
      end
      item
        Name = 'backlog_qty'
        DataType = ftFloat
      end
      item
        Name = 'ord_detail_id'
        DataType = ftFloat
      end>
  end
end
