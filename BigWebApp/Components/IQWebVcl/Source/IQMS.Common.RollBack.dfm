object FrmRollBack: TFrmRollBack
  Left = 64
  Top = 155
  HelpContext = 1149634
  ClientHeight = 238
  ClientWidth = 386
  Caption = 'RollBack Setup'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 386
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Nav: TUniDBNavigator
      Left = 161
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcRollBack
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object grid: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 386
    Height = 211
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 169
    IQComponents.Grid.Height = 125
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcRollBack
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
    IQComponents.Navigator.DataSource = SrcRollBack
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 169
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 125
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcRollBack
    Columns = <
      item
        FieldName = 'SEGMENT_NAME'
        Title.Caption = 'RB Segment Name'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TABLESPACE_NAME'
        Title.Caption = 'Table Space Name'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'INIT_SIZE'
        Title.Caption = 'Init Size'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NEXT_EXT'
        Title.Caption = 'Next Ext.'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object cmbTableSpaceName: TUniDBLookupComboBox
    Left = 32
    Top = 176
    Width = 121
    Height = 21
    Hint = ''
    ListField = 'TABLESPACE_NAME'
    ListSource = SrcTblSpaceName
    KeyField = 'TABLESPACE_NAME'
    ListFieldIndex = 0
    TabOrder = 2
    Color = clWindow
  end
  object cmbSegmentName: TUniDBLookupComboBox
    Left = 32
    Top = 136
    Width = 121
    Height = 21
    Hint = ''
    ListField = 'MODULE'
    ListSource = SrcRBNames
    KeyField = 'SEGMENT_NAME'
    ListFieldIndex = 0
    DataField = 'SEGMENT_NAME'
    DataSource = SrcRollBack
    TabOrder = 3
    Color = clWindow
  end
  object MainMenu1: TUniMainMenu
    Left = 168
    Top = 24
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
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
    ModuleName = 'Rollback Setup'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 80
  end
  object SrcRollBack: TDataSource
    DataSet = TblRollBack
    Left = 32
    Top = 72
  end
  object TblRollBack: TFDTable
    BeforePost = TblRollBackBeforePost
    IndexFieldNames = 'SEGMENT_NAME'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'IQ_ROLLBACK'
    TableName = 'IQ_ROLLBACK'
    Left = 48
    Top = 128
    object TblRollBackSEGMENT_NAME: TStringField
      DisplayLabel = 'RB Segment Name'
      DisplayWidth = 30
      FieldName = 'SEGMENT_NAME'
      Size = 30
    end
    object TblRollBackTABLESPACE_NAME: TStringField
      DisplayLabel = 'Table Space Name'
      DisplayWidth = 30
      FieldName = 'TABLESPACE_NAME'
      Size = 30
    end
    object TblRollBackINIT_SIZE: TBCDField
      DisplayLabel = 'Init Size'
      DisplayWidth = 10
      FieldName = 'INIT_SIZE'
      Size = 0
    end
    object TblRollBackNEXT_EXT: TBCDField
      DisplayLabel = 'Next Ext.'
      DisplayWidth = 10
      FieldName = 'NEXT_EXT'
      Size = 0
    end
    object TblRollBackID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object QryTblSpaceName: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct tablespace_name from dba_rollback_segs'
      'order by tablespace_name')
    Left = 160
    Top = 176
    object QryTblSpaceNameTABLESPACE_NAME: TStringField
      DisplayLabel = 'Table Space Name'
      DisplayWidth = 30
      FieldName = 'TABLESPACE_NAME'
      Origin = 'DBA_ROLLBACK_SEGS.TABLESPACE_NAME'
      Size = 30
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'Nav')
    SecurityCode = 'FRMROLLBACK'
    AfterApply = SRAfterApply
    Left = 104
    Top = 80
  end
  object wwRBNames: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '#39'PAYROLL'#39'          as Module,'
      '       '#39'Prepare Payroll'#39'  as Action,'
      '       '#39'RB_PAYROLL'#39'       as Segment_Name'
      '  from dual'
      'union all'
      'select '#39'AR'#39','
      '       '#39'Post Invoices '#39','
      '       '#39'RB_AR'#39
      '  from dual'
      'union all'
      'select '#39'FRX'#39','
      '       '#39'FRX Populate Database'#39','
      '       '#39'FRL_POPULATE'#39
      '  from dual'
      'union all'
      'select '#39'DD'#39','
      '       '#39'Update DataStrucure scripts'#39','
      '       '#39'RB_DD'#39
      '  from dual'
      'union all'
      'select '#39'EDI'#39','
      '       '#39'Autoprocess EDI files'#39','
      '       '#39'RB_EDI'#39
      '  from dual'
      'order by 3'
      ' ')
    Left = 160
    Top = 136
    object wwRBNamesSEGMENT_NAME: TStringField
      DisplayLabel = 'Segment Name'
      DisplayWidth = 12
      FieldName = 'SEGMENT_NAME'
      Size = 12
    end
    object wwRBNamesMODULE: TStringField
      DisplayLabel = 'Module Name'
      DisplayWidth = 7
      FieldName = 'MODULE'
      Size = 7
    end
    object wwRBNamesACTION: TStringField
      DisplayLabel = 'Action'
      DisplayWidth = 27
      FieldName = 'ACTION'
      Size = 27
    end
  end
  object SrcTblSpaceName: TDataSource
    DataSet = QryTblSpaceName
    Left = 272
    Top = 120
  end
  object SrcRBNames: TDataSource
    DataSet = wwRBNames
    Left = 280
    Top = 176
  end
end
