object FrmGLActivityPitDrillDown: TFrmGLActivityPitDrillDown
  Left = 0
  Top = 0
  ClientHeight = 377
  ClientWidth = 603
  Caption = 'PIT Drill Down'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 603
    Height = 377
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 601
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
    end
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 601
      Height = 349
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 384
      IQComponents.Grid.Height = 263
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = DataSource1
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 200
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = DataSource1
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 384
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 263
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
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QTY'
          Title.Caption = 'Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DEBIT'
          Title.Caption = 'Debit'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CREDIT'
          Title.Caption = 'Credit'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Rev'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object FDQuery1: TFDQuery
    BeforeOpen = FDQuery1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select b.arinvt_id,'
      '       b.itemno,'
      '       t.trans_quan as qty,'
      '       c.debit,'
      '       c.credit,'
      '       b.class,'
      '       b.rev,'
      '       b.descrip'
      '  from c_trans_drill_hdr a,'
      '       c_trans_drill b,'
      '       c_trans_drill_acct c,'
      '       translog t'
      ' where a.glbatchid_id = :glbatchid_id'
      '   and a.id = b.c_trans_drill_hdr_id(+)'
      '   and b.id = c.c_trans_drill_id(+)'
      '   and b.translog_id = t.id(+)'
      '   and glacct_id = :glacct_id'
      'order by c.id')
    Left = 68
    Top = 116
    ParamData = <
      item
        Name = 'GLBATCHID_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'GLACCT_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDQuery1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      FixedChar = True
      Size = 100
    end
    object FDQuery1QTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 16
      FieldName = 'QTY'
      Origin = 'QTY'
      Precision = 15
      Size = 6
    end
    object FDQuery1DEBIT: TBCDField
      DisplayLabel = 'Debit'
      DisplayWidth = 13
      FieldName = 'DEBIT'
      Origin = 'DEBIT'
      DisplayFormat = '########0.######'
      Precision = 12
      Size = 2
    end
    object FDQuery1CREDIT: TBCDField
      DisplayLabel = 'Credit'
      DisplayWidth = 13
      FieldName = 'CREDIT'
      Origin = 'CREDIT'
      DisplayFormat = '########0.######'
      Precision = 12
      Size = 2
    end
    object FDQuery1CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object FDQuery1REV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'REV'
      FixedChar = True
      Size = 15
    end
    object FDQuery1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object FDQuery1ARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 68
    Top = 88
  end
end
