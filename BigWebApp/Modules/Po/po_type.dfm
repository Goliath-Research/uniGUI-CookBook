object FrmPO_Type: TFrmPO_Type
  Left = 326
  Top = 210
  HelpContext = 14874
  ClientHeight = 308
  ClientWidth = 703
  Caption = 'PO Types'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 703
    Height = 27
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 703
    Height = 281
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 486
    IQComponents.Grid.Height = 195
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
    IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.Navigator.BeforeAction = CheckRefresh
    IQComponents.HiddenPanel.Left = 486
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 195
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
        FieldName = 'NAME'
        Title.Caption = 'Name'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 378
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLOSEPOWITHIN'
        Title.Caption = 'Close PO Type~Short Within %'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 152
    Top = 74
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
        ShortCut = 112
        OnClick = Contents1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmPO_Type'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194046 $'
    BuildVersion = '176554'
    Left = 180
    Top = 74
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMPO_TYPE'
    AfterApply = SRAfterApply
    Left = 209
    Top = 74
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 55
    Top = 147
  end
  object Query1: TFDQuery
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnNewRecord = Query1NewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      
        'select id, name, descrip, closepowithin from po_type order by na' +
        'me')
    Left = 55
    Top = 193
    object Query1NAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 20
      FieldName = 'NAME'
      Origin = 'IQ.PO_TYPE.NAME'
      Required = True
    end
    object Query1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'IQ.PO_TYPE.DESCRIP'
      Size = 60
    end
    object Query1CLOSEPOWITHIN: TBCDField
      DisplayLabel = 'Close PO Type~Short Within %'
      DisplayWidth = 10
      FieldName = 'CLOSEPOWITHIN'
      Origin = 'IQ.PO_TYPE.CLOSEPOWITHIN'
      Size = 2
    end
    object Query1ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.PO_TYPE.ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into po_type'
      '  (ID, NAME, DESCRIP, CLOSEPOWITHIN)'
      'values'
      '  (:ID, :NAME, :DESCRIP, :CLOSEPOWITHIN)')
    ModifySQL.Strings = (
      'update po_type'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  DESCRIP = :DESCRIP,'
      '  CLOSEPOWITHIN = :CLOSEPOWITHIN'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from po_type'
      'where'
      '  ID = :OLD_ID')
    Left = 327
    Top = 151
  end
end
