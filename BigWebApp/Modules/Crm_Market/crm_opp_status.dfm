object FrmOppStatus: TFrmOppStatus
  Left = 351
  Top = 197
  ClientHeight = 247
  ClientWidth = 386
  Caption = 'Opportunity Status'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 386
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object PnlToolbar: TUniPanel
    Left = 0
    Top = 0
    Width = 386
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object NavMain: TUniDBNavigator
      Left = 160
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcOppStatus
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 30
    Width = 386
    Height = 217
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlGrid: TUniPanel
      Left = 1
      Top = 1
      Width = 384
      Height = 215
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Grid: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 382
        Height = 213
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 165
        IQComponents.Grid.Height = 127
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcOppStatus
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
        IQComponents.Navigator.DataSource = SrcOppStatus
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 165
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 127
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcOppStatus
        Columns = <
          item
            FieldName = 'CODE'
            Title.Caption = 'Code'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIPTION'
            Title.Caption = 'Description'
            Width = 245
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'IS_CLOSED'
            Title.Caption = 'Type'
            Width = 63
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object cmbType: TUniDBComboBox
        Left = 176
        Top = 96
        Width = 121
        Height = 21
        Hint = ''
        DataField = 'IS_CLOSED'
        DataSource = SrcOppStatus
        Style = csDropDownList
        Items.Strings = (
          'Open'#9'N'
          'Closed'#9'Y')
        TabOrder = 1
      end
    end
  end
  object SrcOppStatus: TDataSource
    DataSet = TblOppStatus
    Left = 128
    Top = 46
  end
  object TblOppStatus: TFDTable
    BeforePost = TblOppStatusBeforePost
    OnNewRecord = TblOppStatusNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereChanged
    UpdateOptions.UpdateTableName = 'CRM_OPP_STATUS'
    TableName = 'CRM_OPP_STATUS'
    Left = 136
    Top = 56
    object TblOppStatusCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Size = 10
    end
    object TblOppStatusDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object TblOppStatusIS_CLOSED: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 9
      FieldName = 'IS_CLOSED'
      FixedChar = True
      Size = 1
    end
    object TblOppStatusID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
end
