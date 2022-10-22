object FrmDivision: TFrmDivision
  Left = 171
  Top = 205
  HelpContext = 1097686
  ClientHeight = 419
  ClientWidth = 499
  Caption = 'Divisions/Warehouses'
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
    Top = 27
    Width = 499
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 499
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 30
    Width = 499
    Height = 389
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 282
    IQComponents.Grid.Height = 303
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
    IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.Navigator.BeforeAction = CheckRefresh
    IQComponents.HiddenPanel.Left = 282
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 303
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
        FieldName = 'NAME'
        Title.Caption = 'Name'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 161
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_NAME'
        Title.Caption = 'EPlant'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'OVERRIDE_SIC'
        Title.Caption = 'Override Serialized ~Inventory Control'
        Width = 105
        CheckBoxField.FieldValues = 'Y;N'
      end>
    ExplicitTop = 33
    Marker = 0
    object wwDBComboDlgEPlant: TUniEdit
      Left = 88
      Top = 208
      Width = 121
      Height = 21
      Hint = ''
      Visible = False
      Text = ''
      TabOrder = 2
      ReadOnly = True
    end
  end
  object wwDataSource1: TDataSource
    DataSet = QryDivision
    Left = 32
    Top = 232
  end
  object MainMenu1: TUniMainMenu
    Left = 224
    Top = 232
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmDivision'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193901 $'
    BuildVersion = '176554'
    Left = 256
    Top = 232
  end
  object QryDivision: TFDQuery
    BeforePost = QryDivisionBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select d.id,'
      '       d.name,'
      '       d.descrip,'
      '       d.eplant_id,'
      '       d.gl_plug_value,'
      '       d.override_sic,'
      '       e.name as eplant_name'
      '  from division d,'
      '       eplant e'
      ' where d.eplant_id = e.id(+)       ')
    Left = 32
    Top = 264
    object QryDivisionNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 18
      FieldName = 'NAME'
      Origin = 'd.NAME'
      Size = 25
    end
    object QryDivisionDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 23
      FieldName = 'DESCRIP'
      Origin = 'd.DESCRIP'
      Size = 50
    end
    object QryDivisionEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 30
      FieldName = 'EPLANT_NAME'
      Origin = 'e.name'
      Size = 30
    end
    object QryDivisionOVERRIDE_SIC: TStringField
      DisplayLabel = 'Override Serialized ~Inventory Control'
      DisplayWidth = 15
      FieldName = 'OVERRIDE_SIC'
      Origin = 'd.OVERRIDE_SIC'
      Size = 1
    end
    object QryDivisionID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryDivisionEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryDivisionGL_PLUG_VALUE: TStringField
      FieldName = 'GL_PLUG_VALUE'
      Visible = False
      Size = 50
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into division'
      '  (ID, NAME, DESCRIP, EPLANT_ID, GL_PLUG_VALUE, OVERRIDE_SIC)'
      'values'
      
        '  (:ID, :NAME, :DESCRIP, :EPLANT_ID, :GL_PLUG_VALUE, :OVERRIDE_S' +
        'IC)')
    ModifySQL.Strings = (
      'update division'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  DESCRIP = :DESCRIP,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  GL_PLUG_VALUE = :GL_PLUG_VALUE,'
      '  OVERRIDE_SIC = :OVERRIDE_SIC'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from division'
      'where'
      '  ID = :OLD_ID')
    Left = 32
    Top = 328
  end
end
