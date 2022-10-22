object FrmTransCodes: TFrmTransCodes
  Left = 232
  Top = 125
  HelpContext = 1096111
  ClientHeight = 332
  ClientWidth = 443
  Caption = 'Inventory Transaction Codes'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    ExplicitTop = 27
  end
  object DBGrid1: TIQUniGridControl
    Left = 0
    Top = 3
    Width = 443
    Height = 329
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 226
    IQComponents.Grid.Height = 243
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
    IQComponents.HiddenPanel.Left = 226
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 243
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 216
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 245
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'CODE'
        Title.Caption = 'Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Acct'
        Title.Caption = 'GL Account'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 30
    ExplicitHeight = 302
    Marker = 0
  end
  object wwDBLookupCombo1: TUniDBLookupComboBox
    Left = 40
    Top = 211
    Width = 121
    Height = 21
    Hint = ''
    ListField = 'ACCT'
    ListSource = SrcQryGlAcct
    KeyField = 'ID'
    ListFieldIndex = 0
    TabOrder = 1
    Color = clWindow
  end
  object wwDBComboDlgEPlant_ID: TUniEdit
    Left = 40
    Top = 184
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
    ReadOnly = True
  end
  object DataSource1: TDataSource
    DataSet = FDQryTransCode
    Left = 64
    Top = 112
  end
  object QryGlAcct: TFDQuery
    BeforeOpen = QryGlAcctBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select g.id, '
      '       g.eplant_id, '
      
        '       (select acct from glacct where id = plugins.get_glacct_no' +
        '_name(g.id, misc.geteplantid)) as acct, '
      '       g.descrip '
      '  from glacct g'
      'order by g.acct')
    Left = 104
    Top = 111
    object QryGlAcctACCT: TStringField
      DisplayLabel = 'Account'
      DisplayWidth = 15
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object QryGlAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object QryGlAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object QryGlAcctID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 208
    Top = 184
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmTransCodes'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 188977 $'
    Left = 248
    Top = 184
  end
  object PopupMenu1: TUniPopupMenu
    Left = 208
    Top = 83
    object AssignAcctviaPickList1: TUniMenuItem
      Caption = 'Assign Acct# via pick list'
      OnClick = AssignAcctviaPickList1Click
    end
  end
  object PKAcct: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       acct,'
      '       descrip,'
      '       type,'
      '       eplant_id'
      '  from glacct  '
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39'    '
      '  and misc.eplant_filter(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 272
    Top = 83
    object PKAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKAcctACCT: TStringField
      DisplayLabel = 'Account'
      FieldName = 'ACCT'
      Size = 50
    end
    object PKAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PKAcctTYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'TYPE'
      Size = 25
    end
    object PKAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object FDQryTransCode: TFDQuery
    BeforeOpen = Table1BeforeOpen
    BeforePost = Table1BeforePost
    OnCalcFields = Table1CalcFields
    Filtered = True
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'TRANS_CODE'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select * from TRANS_CODE')
    Left = 184
    Top = 142
    object FDQryTransCodeCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Required = True
      Size = 10
    end
    object FDQryTransCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 25
    end
    object FDQryTransCodeEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object FDQryTransCodeID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object FDQryTransCodeGLACCT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID'
      Visible = False
      Size = 0
    end
    object FDQryTransCodeAcct: TStringField
      FieldKind = fkCalculated
      FieldName = 'Acct'
      Calculated = True
    end
  end
  object SrcQryGlAcct: TDataSource
    DataSet = QryGlAcct
    Left = 144
    Top = 230
  end
end
