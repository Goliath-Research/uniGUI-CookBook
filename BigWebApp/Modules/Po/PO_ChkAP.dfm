inherited FrmUnInvoicedPOExcep: TFrmUnInvoicedPOExcep
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      inherited Label1: TUniLabel
        Width = 22
        Caption = 'PO#'
        ExplicitWidth = 22
      end
      inherited Label3: TUniLabel
        Width = 23
        Caption = 'Date'
        ExplicitWidth = 23
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'PONO'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'PO_DATE'
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'Details'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object DBGrid1: TUniDBGrid
        Left = 0
        Top = 0
        Width = 399
        Height = 92
        Hint = ''
        DataSource = DataSource2
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'CLASS'
            Title.Caption = 'Class'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item #'
            Width = 77
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REV'
            Title.Caption = 'Rev'
            Width = 25
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NET_RECEIVED'
            Title.Caption = 'Received'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'UNINVOICED'
            Title.Caption = 'Uninvoiced'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select pono, '
      '       po_date,'
      '       id, '
      '       '#39'Uninvoiced PO Receipts'#39' as status_id'
      '  from po'
      ' where id = :id')
    Left = 120
    Top = 65528
  end
  inherited DataSource1: TDataSource
    Left = 120
    Top = 5
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMUNINVOICEDPOEXCEP')
    SecurityCode = 'FRMUNINVOICEDPOEXCEP'
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 160
    Top = 5
  end
  object Query2: TFDQuery
    MasterSource = DataSource1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.po_detail_id,'
      '       a.class,'
      '       a.itemno,'
      '       a.rev,'
      '       v.net_received,'
      '       v.uninvoiced'
      '  from '
      '       v_po_received_vs_ap v,'
      '       arinvt a'
      ' where '
      '       v.po_id = :id'
      '   and v.uninvoiced <> 0'
      '   and v.arinvt_id = a.id(+)'
      '       '
      '       ')
    Left = 160
    Top = 65530
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
      end>
  end
end
