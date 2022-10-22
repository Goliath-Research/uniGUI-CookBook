object FrmOEPkgPalletInfo: TFrmOEPkgPalletInfo
  Left = 175
  Top = 245
  ClientHeight = 276
  ClientWidth = 675
  Caption = 'Packaging/Pallet info'
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
    Width = 675
    Height = 276
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 458
    IQComponents.Grid.Height = 190
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwDataSource1
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
    IQComponents.Navigator.DataSource = wwDataSource1
    IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 458
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 190
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitLeft = 414
    IQComponents.HiddenPanel.ExplicitHeight = 99
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitWidth = 623
    IQComponents.FormTab.ExplicitHeight = 128
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'ORD_DET_SEQNO'
        Title.Caption = '#'
        Width = 14
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 154
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TOTAL_QTY_ORD'
        Title.Caption = 'Qty'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PTS_PER_PKG'
        Title.Caption = 'Parts/Package'
        Width = 84
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PALLET_PTSPER'
        Title.Caption = 'Parts/Pallet'
        Width = 84
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PALLET_COUNT'
        Title.Caption = 'Pallet Count'
        Width = 84
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UNIT'
        Title.Caption = 'UOM'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext Description'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 29
    ExplicitWidth = 631
    ExplicitHeight = 185
    Marker = 0
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 79
    Top = 118
  end
  object wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.id,'
      '       d.orders_id,'
      '       d.arinvt_id,'
      '       d.ord_det_seqno,'
      
        '       decode( d.arinvt_id, null, d.misc_item, a.itemno ) as ite' +
        'mno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       d.unit,'
      '       d.total_qty_ord,'
      '       d.eplant_id,'
      '       Mfg.Get_Main_Pkg_PtsPer_Ex( a.id ) as pts_per_pkg,'
      '       a.pallet_ptsper,'
      '       ceil( decode( nvl(a.pallet_ptsper, 0),'
      '                     0, 0,'
      
        '                     d.total_qty_ord / iqmisc.no_zero(a.pallet_p' +
        'tsper))) as pallet_count'
      '  from '
      '       ord_detail d,'
      '       arinvt a'
      ' where'
      '       d.orders_id = :orders_id'
      '   and d.arinvt_id = a.id(+)'
      '   and misc.eplant_filter( d.eplant_id ) = 1'
      'order by d.ord_det_seqno'
      '')
    Left = 153
    Top = 119
    ParamData = <
      item
        Name = 'orders_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1ORD_DET_SEQNO: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 10
      FieldName = 'ORD_DET_SEQNO'
      Size = 0
    end
    object wwQuery1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 30
      FieldName = 'ITEMNO'
      Size = 250
    end
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object wwQuery1TOTAL_QTY_ORD: TBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'TOTAL_QTY_ORD'
    end
    object wwQuery1PTS_PER_PKG: TFMTBCDField
      DisplayLabel = 'Parts/Package'
      DisplayWidth = 12
      FieldName = 'PTS_PER_PKG'
      Size = 38
    end
    object wwQuery1PALLET_PTSPER: TFMTBCDField
      DisplayLabel = 'Parts/Pallet'
      DisplayWidth = 10
      FieldName = 'PALLET_PTSPER'
      Size = 6
    end
    object wwQuery1PALLET_COUNT: TFMTBCDField
      DisplayLabel = 'Pallet Count'
      DisplayWidth = 10
      FieldName = 'PALLET_COUNT'
      Size = 38
    end
    object wwQuery1UNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Size = 10
    end
    object wwQuery1DESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object wwQuery1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object wwQuery1ID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object wwQuery1ORDERS_ID: TBCDField
      FieldName = 'ORDERS_ID'
      Visible = False
      Size = 0
    end
    object wwQuery1ARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
end
