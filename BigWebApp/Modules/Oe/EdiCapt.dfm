object FrmEdiCap: TFrmEdiCap
  Left = 37
  Top = 162
  ClientHeight = 193
  ClientWidth = 389
  Caption = 'Captured EDI Segments'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 283
      Top = 1
      Width = 105
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 389
    Height = 166
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 172
    IQComponents.Grid.Height = 80
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
    IQComponents.HiddenPanel.Left = 172
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 80
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
        FieldName = 'SEG'
        Title.Caption = 'Segment'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Seg_String_Disp'
        Title.Caption = 'Segment String'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANSACTION_SET_CODE'
        Title.Caption = 'Trans. Set Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TIMESTAMP'
        Title.Caption = 'Time Stamp'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FILE_NAME'
        Title.Caption = 'File Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = QryCurr
    Left = 179
    Top = 49
  end
  object QryCurr: TFDQuery
    OnCalcFields = QryCurrCalcFields
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       seg,'
      '       seg_string,'
      '       transaction_set_code,'
      '       timestamp,'
      '       file_name'
      '  from ord_detail_seg'
      ' where ord_detail_id = :ID'
      'order by id')
    Left = 180
    Top = 64
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryCurrSEG: TStringField
      DisplayLabel = 'Segment'
      DisplayWidth = 3
      FieldName = 'SEG'
      Origin = 'IQ.EDI_ORD_SEG.SEG'
      FixedChar = True
      Size = 3
    end
    object QryCurrSeg_String_Disp: TStringField
      DisplayLabel = 'Segment String'
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'Seg_String_Disp'
      Size = 250
      Calculated = True
    end
    object QryCurrTRANSACTION_SET_CODE: TStringField
      DisplayLabel = 'Trans. Set Code'
      DisplayWidth = 3
      FieldName = 'TRANSACTION_SET_CODE'
      Origin = 'IQ.EDI_ORD_SEG.TRANSACTION_SET_CODE'
      FixedChar = True
      Size = 3
    end
    object QryCurrTIMESTAMP: TDateTimeField
      DisplayLabel = 'Time Stamp'
      DisplayWidth = 18
      FieldName = 'TIMESTAMP'
    end
    object QryCurrFILE_NAME: TStringField
      DisplayLabel = 'File Name'
      DisplayWidth = 250
      FieldName = 'FILE_NAME'
      Origin = 'FILE_NAME'
      Size = 250
    end
    object QryCurrID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object QryHist: TFDQuery
    OnCalcFields = QryHistCalcFields
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       seg,'
      '       seg_string,'
      '       transaction_set_code,'
      '       timestamp,'
      '       file_name'
      '  from hist_ord_detail_seg'
      ' where ord_detail_id = :ID'
      'order by id')
    Left = 220
    Top = 64
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object StringField1: TStringField
      DisplayLabel = 'Segment'
      DisplayWidth = 3
      FieldName = 'SEG'
      Origin = 'IQ.EDI_ORD_SEG.SEG'
      FixedChar = True
      Size = 3
    end
    object QryHistSeg_String_Disp: TStringField
      DisplayLabel = 'Segment String'
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'Seg_String_Disp'
      Size = 250
      Calculated = True
    end
    object StringField3: TStringField
      DisplayLabel = 'Trans. Set Code'
      DisplayWidth = 3
      FieldName = 'TRANSACTION_SET_CODE'
      Origin = 'IQ.EDI_ORD_SEG.TRANSACTION_SET_CODE'
      FixedChar = True
      Size = 3
    end
    object QryHistTIMESTAMP: TDateTimeField
      DisplayLabel = 'Time Stamp'
      DisplayWidth = 18
      FieldName = 'TIMESTAMP'
    end
    object QryHistID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryHistFILE_NAME: TStringField
      DisplayLabel = 'File Name'
      FieldName = 'FILE_NAME'
      Origin = 'FILE_NAME'
      Size = 250
    end
  end
  object wwMemoDialog1: TwwMemoDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MemoAttributes = [mSizeable, mWordWrap, mViewOnly]
    DlgLeft = 0
    DlgTop = 0
    DlgWidth = 561
    DlgHeight = 396
    Left = 128
    Top = 48
  end
end
