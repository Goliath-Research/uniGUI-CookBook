object FrmQuoteWhereUsed: TFrmQuoteWhereUsed
  Left = 175
  Top = 220
  ClientHeight = 339
  ClientWidth = 613
  Caption = 'Where Used?'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 339
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 611
      Height = 337
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 394
      IQComponents.Grid.Height = 251
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
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 394
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 251
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = wwDataSource1
      Columns = <
        item
          FieldName = 'RFQ'
          Title.Caption = 'RFQ #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROJECT'
          Title.Caption = 'RFQ Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QUOTE_DATE'
          Title.Caption = 'Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QUOTE_REV'
          Title.Caption = 'RFQ Revision'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SOURCE'
          Title.Caption = 'Source'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Item Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Item Ext Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMPANY'
          Title.Caption = 'Customer Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MFG_TYPE'
          Title.Caption = 'Mfg Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARCHIVED'
          Title.Caption = 'Archived'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Item Rev'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Item Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 136
    Top = 136
  end
  object wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select quote.rfq as rfq,'
      '       quote.project as project,'
      '       quote.quote_date as quote_date,'
      '       quote.quote_rev  as quote_rev,'
      '       x.descrip as descrip,'
      '       x.itemno as itemno,'
      '       x.source,'
      '       x.descrip2 as descrip2,'
      '       a.company  as company,'
      '       quote.id as id,'
      '       quote.eplant_id as eplant_id,'
      '       quote.mfg_type as mfg_type,'
      '       quote.archived,'
      '       x.rev,'
      '       x.class'
      '       '
      '  from'
      '       v_arcusto a,'
      '       quote,'
      '       ( select qinvt.descrip as descrip,'
      '                qinvt.itemno as itemno,'
      '                qinvt.descrip2 as descrip2,'
      '                qinvt.class,'
      '                qinvt.rev,'
      '                qinvt.quote_id,'
      '                '#39'MAIN ITEM'#39' as source'
      '           from Qinvt'
      '          where qinvt.id = :qinvt_id'
      '        '
      '         UNION ALL'
      '        '
      '         select qinvt.descrip as descrip,'
      '                qinvt.itemno as itemno,'
      '                qinvt.descrip2 as descrip2,'
      '                qinvt.class,'
      '                qinvt.rev,'
      '                qinvt.quote_id,'
      '                '#39'COMPONENT'#39' as source'
      '            from qopmat, qptoper, qinvt'
      '          where qopmat.qinvt_id = :qinvt_id'
      '            and qopmat.qsndop_id = qptoper.qsndop_id'
      '            and qptoper.qinvt_id = qinvt.id'
      '        '
      '         UNION ALL'
      '        '
      '         select qinvt.descrip as descrip,'
      '                qinvt.itemno as itemno,'
      '                qinvt.descrip2 as descrip2,'
      '                qinvt.class,'
      '                qinvt.rev,'
      '                quote.id as quote_id,'
      '                '#39'PRIMARY MATERIAL'#39' as source'
      '           from qinvt, quote'
      '          where quote.qinvt_id_mat = :qinvt_id'
      '            and quote.id = qinvt.quote_id(+)) x'
      ''
      ' where quote.id = x.quote_id'
      '   and quote.arcusto_id = a.id(+)'
      '   and misc.eplant_filter(quote.eplant_id) = 1'
      '')
    Left = 136
    Top = 152
    ParamData = <
      item
        Name = 'qinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1RFQ: TStringField
      DisplayLabel = 'RFQ #'
      DisplayWidth = 20
      FieldName = 'RFQ'
      Origin = 'quote.rfq '
      FixedChar = True
    end
    object wwQuery1PROJECT: TStringField
      DisplayLabel = 'RFQ Description'
      DisplayWidth = 30
      FieldName = 'PROJECT'
      Origin = 'quote.project'
      Size = 255
    end
    object wwQuery1QUOTE_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 18
      FieldName = 'QUOTE_DATE'
      Origin = 'quote.quote_date'
    end
    object wwQuery1QUOTE_REV: TBCDField
      DisplayLabel = 'RFQ Revision'
      DisplayWidth = 10
      FieldName = 'QUOTE_REV'
      Origin = 'quote.quote_rev'
      Size = 0
    end
    object wwQuery1SOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 16
      FieldName = 'SOURCE'
      Origin = 'x.source'
      Size = 16
    end
    object wwQuery1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'x.itemno'
      FixedChar = True
      Size = 50
    end
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'x.descrip'
      FixedChar = True
      Size = 100
    end
    object wwQuery1DESCRIP2: TStringField
      DisplayLabel = 'Item Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'x.descrip2'
      Size = 100
    end
    object wwQuery1COMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'a.company'
      Size = 60
    end
    object wwQuery1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'quote.eplant_id'
      Size = 0
    end
    object wwQuery1MFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      Origin = 'quote.mfg_type'
      FixedChar = True
      Size = 10
    end
    object wwQuery1ARCHIVED: TStringField
      DisplayLabel = 'Archived'
      DisplayWidth = 1
      FieldName = 'ARCHIVED'
      Origin = 'quote.archived'
      FixedChar = True
      Size = 1
    end
    object wwQuery1REV: TStringField
      DisplayLabel = 'Item Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      Origin = 'x.rev'
      FixedChar = True
      Size = 15
    end
    object wwQuery1CLASS: TStringField
      DisplayLabel = 'Item Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'x.class'
      FixedChar = True
      Size = 2
    end
    object wwQuery1ID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 192
    Top = 136
    object JumpToRFQ1: TUniMenuItem
      Caption = 'Jump To RFQ'
      OnClick = JumpToRFQ1Click
    end
  end
  object IQJumpQuote: TIQWebJump
    DataField = 'ID'
    DataSource = wwDataSource1
    JumpTo = jtQuote
    Left = 192
    Top = 152
  end
end
