object FrmArinvt_UOM: TFrmArinvt_UOM
  Left = 200
  Top = 108
  HelpContext = 1128257
  ClientHeight = 268
  ClientWidth = 396
  Caption = 'Conversion Factors'
  Constraints.MinWidth = 287
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 396
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnArinvt_UOM: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Edit Master UOM List'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFDDDDD00000000
        00DDDDDD7777777777FDDDDD0FFFFFFFF0DDDDDD7FDDDDDDD7FDDDDD0FFFFFFF
        F0DDDDDD7FDDDDDDD7FDDDDD0FF80FFFF0DDDDDD7FD87FDDD7FDDDDD0F800FFF
        F0DDDDDD7F877FDDD7FDDDDD080B0FFFF0DDDDDD787F7DDDD7FDDDDD00B0FFFF
        F0DDDDDD77F7DDDDD7FDDDDD0B0FFFFFF0DDDDDD7F7DDDDDD7FDDDD0B0FFFFFF
        F0DDDDD7F7DDDDDDD7FDDD0B0FFFFFFFF0DDDD7F7FDDDDDDD7FDD0B07FFFFFFF
        F0DDD7F77FFFFFFFF7FDD90D0000000000DDD77D7777777777DDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnArinvt_UOMClick
    end
    object DBNavigator1: TUniDBNavigator
      Left = 270
      Top = 1
      Width = 125
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcArinvt_UOM_Conv
      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Grid: TIQUniGridControl
    Left = 0
    Top = 103
    Width = 396
    Height = 165
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 179
    IQComponents.Grid.Height = 79
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcArinvt_UOM_Conv
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
    IQComponents.Navigator.DataSource = SrcArinvt_UOM_Conv
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 179
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 79
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcArinvt_UOM_Conv
    Columns = <
      item
        FieldName = 'CONV_VALUE'
        Title.Caption = 'Factor'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UOM_Lookup'
        Title.Caption = 'UOM'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'OPERATOR_KIND'
        Title.Caption = 'Divide/Multiply'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DEFAULT_OE'
        Title.Caption = 'OE Default'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'DEFAULT_PO'
        Title.Caption = 'PO Default'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'OnHand'
        Title.Caption = 'On Hand'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object wwDBLookupCombo1: TUniDBLookupComboBox
    Left = 162
    Top = 183
    Width = 121
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    TabOrder = 2
    Color = clWindow
  end
  object wwDBComboBoxOperator: TUniDBComboBox
    Left = 161
    Top = 206
    Width = 121
    Height = 21
    Hint = 'Divide: X of custom UOM = 1 of native UOM'
    ShowHint = True
    ParentShowHint = False
    Items.Strings = (
      'Divide'#9'D'
      'Multiply'#9'M')
    TabOrder = 3
  end
  object PnlClient01: TUniPanel
    Left = 0
    Top = 27
    Width = 396
    Height = 76
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 82
      Top = 1
      Width = 6
      Height = 74
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 81
      Height = 74
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label2: TUniLabel
        Left = 8
        Top = 7
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Item #'
        TabOrder = 1
      end
      object Label3: TUniLabel
        Left = 8
        Top = 31
        Width = 57
        Height = 13
        Hint = ''
        Caption = 'Native UOM'
        TabOrder = 2
      end
      object Label1: TUniLabel
        Left = 8
        Top = 55
        Width = 40
        Height = 13
        Hint = ''
        Caption = 'Revision'
        TabOrder = 3
      end
    end
    object PnlClient02: TUniPanel
      Left = 88
      Top = 1
      Width = 307
      Height = 74
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        307
        74)
      object DBEdit2: TUniDBEdit
        Left = 0
        Top = 3
        Width = 304
        Height = 21
        Hint = ''
        DataField = 'ITEMNO'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object DBEdit3: TUniDBEdit
        Left = 0
        Top = 27
        Width = 304
        Height = 21
        Hint = ''
        DataField = 'UNIT'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object DBEdit1: TUniDBEdit
        Left = 0
        Top = 51
        Width = 304
        Height = 21
        Hint = ''
        DataField = 'REV'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
  object wwDBComboDlgFactor: TUniEdit
    Left = 161
    Top = 153
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 5
  end
  object SrcArinvt_UOM_Conv: TDataSource
    DataSet = TblArinvt_UOM_Conv
    Left = 32
    Top = 144
  end
  object TblArinvt_UOM_Conv: TFDTable
    BeforePost = TblArinvt_UOM_ConvBeforePost
    AfterPost = TblArinvt_UOM_ConvAfterPost
    BeforeDelete = TblArinvt_UOM_ConvBeforeDelete
    OnCalcFields = TblArinvt_UOM_ConvCalcFields
    IndexFieldNames = 'ARINVT_ID'
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ARINVT_UOM_CONV'
    TableName = 'ARINVT_UOM_CONV'
    Left = 32
    Top = 160
    object TblArinvt_UOM_ConvCONV_VALUE: TFMTBCDField
      DisplayLabel = 'Factor'
      DisplayWidth = 9
      FieldName = 'CONV_VALUE'
      DisplayFormat = '########0.0#########'
      Size = 10
    end
    object TblArinvt_UOM_ConvUOM_Lookup: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 7
      FieldKind = fkLookup
      FieldName = 'UOM_Lookup'
      LookupDataSet = QryArinvt_UOM
      LookupKeyFields = 'UOM'
      LookupResultField = 'UOM'
      KeyFields = 'UOM'
      Size = 10
      Lookup = True
    end
    object TblArinvt_UOM_ConvOPERATOR_KIND: TStringField
      DisplayLabel = 'Divide/Multiply'
      DisplayWidth = 12
      FieldName = 'OPERATOR_KIND'
      FixedChar = True
      Size = 1
    end
    object TblArinvt_UOM_ConvDEFAULT_OE: TStringField
      DisplayLabel = 'OE Default'
      DisplayWidth = 9
      FieldName = 'DEFAULT_OE'
      FixedChar = True
      Size = 1
    end
    object TblArinvt_UOM_ConvDEFAULT_PO: TStringField
      DisplayLabel = 'PO Default'
      DisplayWidth = 9
      FieldName = 'DEFAULT_PO'
      FixedChar = True
      Size = 1
    end
    object TblArinvt_UOM_ConvOnHand: TFloatField
      DisplayLabel = 'On Hand'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'OnHand'
      ReadOnly = True
      DisplayFormat = '#########.######'
      Calculated = True
    end
    object TblArinvt_UOM_ConvID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblArinvt_UOM_ConvARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object TblArinvt_UOM_ConvUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Required = True
      Visible = False
      Size = 10
    end
  end
  object QryArinvt_UOM: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select uom from arinvt_uom'
      'order by uom')
    Left = 80
    Top = 160
    object QryArinvt_UOMUOM: TStringField
      FieldName = 'UOM'
      Origin = 'ARINVT_UOM.UOM'
      Size = 10
    end
  end
end
