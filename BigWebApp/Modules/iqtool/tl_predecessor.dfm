object FrmTLPredecessor: TFrmTLPredecessor
  Left = 268
  Top = 241
  ClientHeight = 262
  ClientWidth = 505
  Caption = 'Predecessors'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 221
    Width = 505
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 294
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 221
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlToolbar: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 503
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object NavMain: TUniDBNavigator
        Left = 327
        Top = 1
        Width = 175
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcPredecessors
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object PnlGrid: TUniPanel
      Tag = 1999
      Left = 1
      Top = 28
      Width = 503
      Height = 192
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Grid: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 501
        Height = 190
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 284
        IQComponents.Grid.Height = 104
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcPredecessors
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
        IQComponents.Navigator.DataSource = SrcPredecessors
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 284
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 104
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcPredecessors
        Columns = <
          item
            FieldName = 'TASKNO'
            Title.Caption = 'Task #'
            Width = 175
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NAME'
            Title.Caption = 'Task Name'
            Width = 175
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'STARTDATE'
            Title.Caption = 'Start'
            Width = 126
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FINISHDATE'
            Title.Caption = 'Finish'
            Width = 126
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object SrcPredecessors: TDataSource
    DataSet = QryPredecessors
    Left = 232
    Top = 80
  end
  object QryPredecessors: TFDQuery
    BeforeOpen = QryPredecessorsBeforeOpen
    BeforeInsert = QryPredecessorsBeforeInsert
    BeforeDelete = QryPredecessorsBeforeDelete
    CachedUpdates = True
    OnUpdateRecord = QryPredecessorsUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT a.id, a.predecessor_id, b.taskno, b.name, '
      '       b.outlinenumber, b.startdate, b.finishdate'
      'FROM tool_predecessor a, v_tool_task_info b'
      'WHERE b.id = a.predecessor_id AND'
      '      a.tool_task_info_id = :ID')
    Left = 240
    Top = 88
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPredecessorsTASKNO: TStringField
      DisplayLabel = 'Task #'
      DisplayWidth = 25
      FieldName = 'TASKNO'
      Origin = 'b.taskno'
      Size = 25
    end
    object QryPredecessorsNAME: TStringField
      DisplayLabel = 'Task Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'b.name'
      Size = 255
    end
    object QryPredecessorsSTARTDATE: TDateTimeField
      DisplayLabel = 'Start'
      DisplayWidth = 18
      FieldName = 'STARTDATE'
      Origin = 'b.startdate'
    end
    object QryPredecessorsFINISHDATE: TDateTimeField
      DisplayLabel = 'Finish'
      DisplayWidth = 18
      FieldName = 'FINISHDATE'
      Origin = 'b.finishdate'
    end
    object QryPredecessorsOUTLINENUMBER: TStringField
      DisplayLabel = 'Outline #'
      DisplayWidth = 18
      FieldName = 'OUTLINENUMBER'
      Origin = 'b.outlinenumber'
      Visible = False
      Size = 255
    end
    object QryPredecessorsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object QryPredecessorsPREDECESSOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PREDECESSOR_ID'
      Origin = 'a.predecessor_id'
      Visible = False
      Size = 0
    end
  end
end
