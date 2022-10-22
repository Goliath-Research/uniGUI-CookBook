object FrmExistingLocks: TFrmExistingLocks
  Left = 146
  Top = 164
  HelpContext = 1017477
  ClientHeight = 272
  ClientWidth = 558
  Caption = 'Existing Locks'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 28
    Width = 558
    Height = 244
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 341
    IQComponents.Grid.Height = 158
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
    IQComponents.HiddenPanel.Left = 341
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 158
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitLeft = 0
    IQComponents.FormTab.ExplicitTop = 0
    IQComponents.FormTab.ExplicitWidth = 256
    IQComponents.FormTab.ExplicitHeight = 128
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'LOCKER'
        Title.Caption = 'Locks'
        Width = 287
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOCK_HANDLE'
        Title.Caption = 'Lock Handle'
        Width = 168
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MODULE'
        Title.Caption = 'Module'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 392
      Top = 1
      Width = 166
      Height = 26
      Hint = ''
      DataSource = wwDataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object wwDataSource1: TDataSource
    DataSet = procFindLocks
    Left = 119
    Top = 105
  end
  object procFindLocks: TFDStoredProc
    BeforeOpen = procFindLocksBeforeOpen
    BeforeInsert = AbortOperation
    BeforeRefresh = procFindLocksBeforeRefresh
    CachedUpdates = True
    OnUpdateRecord = procFindLocksUpdateRecord
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.MISC_CURSORS.FIND_LOCKS'
    Left = 216
    Top = 128
    ParamData = <
      item
        Name = 'V_CURSOR'
        DataType = ftCursor
        ParamType = ptInputOutput
        Value = Null
      end
      item
        Name = 'V_LOCKNAME'
        DataType = ftString
        ParamType = ptInput
        Value = 'IQMS-IQWIN32'
      end>
    object procFindLocksLOCKER: TStringField
      DisplayLabel = 'Locks'
      DisplayWidth = 41
      FieldName = 'LOCKER'
      Size = 125
    end
    object procFindLocksLOCK_HANDLE: TStringField
      DisplayLabel = 'Lock Handle'
      DisplayWidth = 24
      FieldName = 'LOCK_HANDLE'
      Size = 32
    end
    object procFindLocksMODULE: TStringField
      DisplayLabel = 'Module'
      DisplayWidth = 20
      FieldName = 'MODULE'
      Size = 48
    end
  end
end
