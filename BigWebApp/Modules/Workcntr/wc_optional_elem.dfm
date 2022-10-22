object FrmWorkCenterOptionalElements: TFrmWorkCenterOptionalElements
  Left = 360
  Top = 189
  HelpContext = 15512
  ClientHeight = 276
  ClientWidth = 474
  Caption = 'Work Center Optional Elements'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 474
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 474
    Height = 249
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 257
    IQComponents.Grid.Height = 163
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
    IQComponents.HiddenPanel.Left = 257
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 163
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
        FieldName = 'DESCRIP'
        Title.Caption = 'Element Description'
        Width = 420
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ELEMENT_SIZE'
        Title.Caption = 'Size'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 31
    Top = 123
  end
  object wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    BeforePost = wwQuery1BeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    OnNewRecord = wwQuery1NewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id, '
      '       work_center_id, '
      '       descrip, '
      '       element_size'
      '  from work_center_opt_element'
      ' where work_center_id = :work_center_id'
      'order by id')
    Left = 32
    Top = 169
    ParamData = <
      item
        Name = 'work_center_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Element Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'IQ.WORK_CENTER_OPT_ELEMENT.DESCRIP'
      Size = 60
    end
    object wwQuery1ELEMENT_SIZE: TFMTBCDField
      DisplayLabel = 'Size'
      DisplayWidth = 13
      FieldName = 'ELEMENT_SIZE'
      Origin = 'IQ.WORK_CENTER_OPT_ELEMENT.ELEMENT_SIZE'
      Size = 6
    end
    object wwQuery1ID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.WORK_CENTER_OPT_ELEMENT.ID'
      Visible = False
      Size = 0
    end
    object wwQuery1WORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Origin = 'IQ.WORK_CENTER_OPT_ELEMENT.WORK_CENTER_ID'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'wwQuery1')
    SecurityCode = 'FRMWORKCENTEROPTIONALELEMENTS'
    AfterApply = SRAfterApply
    Left = 114
    Top = 89
  end
  object MainMenu1: TUniMainMenu
    Left = 165
    Top = 90
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmWorkCenterOptionalElements'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194188 $'
    BuildVersion = '176554'
    Left = 201
    Top = 94
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into work_center_opt_element'
      '  (ID, WORK_CENTER_ID, DESCRIP, ELEMENT_SIZE)'
      'values'
      '  (:ID, :WORK_CENTER_ID, :DESCRIP, :ELEMENT_SIZE)')
    ModifySQL.Strings = (
      'update work_center_opt_element'
      'set'
      '  ID = :ID,'
      '  WORK_CENTER_ID = :WORK_CENTER_ID,'
      '  DESCRIP = :DESCRIP,'
      '  ELEMENT_SIZE = :ELEMENT_SIZE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from work_center_opt_element'
      'where'
      '  ID = :OLD_ID')
    Left = 198
    Top = 185
  end
end
