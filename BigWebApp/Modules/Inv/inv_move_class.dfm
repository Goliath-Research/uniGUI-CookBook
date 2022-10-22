object FrmInvMoveClass: TFrmInvMoveClass
  Left = 0
  Top = 0
  HelpContext = 19700
  ClientHeight = 261
  ClientWidth = 423
  Caption = 'Movement Classes'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 55
    Width = 423
    Height = 206
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 83
    ExplicitHeight = 178
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 421
      Height = 204
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 204
      IQComponents.Grid.Height = 118
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcMoveClass
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
      IQComponents.Navigator.DataSource = SrcMoveClass
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 204
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 118
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 90
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 119
      DataSource = SrcMoveClass
      Columns = <
        item
          FieldName = 'SEQ'
          Title.Caption = 'Seq #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CODE'
          Title.Caption = 'Movement Class'
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
          FieldName = 'RANK_PERCENT'
          Title.Caption = 'Transaction Rank %'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      ExplicitHeight = 176
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 423
    Height = 55
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 7
      Top = 7
      Width = 90
      Height = 13
      Hint = ''
      Caption = 'Ranking Based On '
      TabOrder = 2
    end
    object wwDBComboBox1: TUniDBComboBox
      Left = 6
      Top = 26
      Width = 125
      Height = 21
      Hint = ''
      DataField = 'INV_MOVE_CLASS_RANKING'
      DataSource = SrcParams
      Style = csDropDownList
      Items.Strings = (
        'Percentage'#9'P'
        'Defined Amount'#9'A')
      ItemIndex = 0
      TabOrder = 0
      OnChange = wwDBComboBox1Change
    end
  end
  object QryMoveClass: TFDQuery
    BeforePost = QryMoveClassBeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    OnNewRecord = QryMoveClassNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'inv_move_class'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLMoveClass
    SQL.Strings = (
      'select id,'
      '       seq,'
      '       code,'
      '       descrip,'
      '       rank_percent,'
      '       rank_amount'
      '  from inv_move_class'
      ' order by seq, id'
      '')
    Left = 16
    Top = 140
    object QryMoveClassSEQ: TBCDField
      DisplayLabel = 'Seq #'
      DisplayWidth = 6
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Precision = 3
      Size = 0
    end
    object QryMoveClassCODE: TStringField
      DisplayLabel = 'Movement Class'
      DisplayWidth = 15
      FieldName = 'CODE'
      Required = True
      Size = 1
    end
    object QryMoveClassDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 22
      FieldName = 'DESCRIP'
    end
    object QryMoveClassRANK_PERCENT: TBCDField
      DisplayLabel = 'Transaction Rank %'
      DisplayWidth = 18
      FieldName = 'RANK_PERCENT'
      Origin = 'RANK_PERCENT'
      Precision = 5
      Size = 2
    end
    object QryMoveClassRANK_AMOUNT: TBCDField
      DisplayLabel = 'Defined Amount'
      FieldName = 'RANK_AMOUNT'
      Origin = 'RANK_AMOUNT'
      Visible = False
      Precision = 6
      Size = 0
    end
    object QryMoveClassID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcMoveClass: TDataSource
    DataSet = QryMoveClass
    Left = 16
    Top = 112
  end
  object MainMenu1: TUniMainMenu
    Left = 176
    Top = 112
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
    ModuleName = 'FrmInvMoveClass'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196617 $'
    BuildVersion = '176554'
    Left = 208
    Top = 112
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryMoveClass'
      'NavMain')
    SecurityCode = 'FRMINVMOVECLASS'
    Left = 240
    Top = 112
  end
  object UpdateSQLMoveClass: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into inv_move_class'
      '  (ID, SEQ, CODE, DESCRIP, RANK_PERCENT, RANK_AMOUNT)'
      'values'
      '  (:ID, :SEQ, :CODE, :DESCRIP, :RANK_PERCENT, :RANK_AMOUNT)')
    ModifySQL.Strings = (
      'update inv_move_class'
      'set'
      '  ID = :ID,'
      '  SEQ = :SEQ,'
      '  CODE = :CODE,'
      '  DESCRIP = :DESCRIP,'
      '  RANK_PERCENT = :RANK_PERCENT,'
      '  RANK_AMOUNT = :RANK_AMOUNT'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from inv_move_class'
      'where'
      '  ID = :OLD_ID')
    Left = 16
    Top = 172
  end
  object SrcParams: TDataSource
    DataSet = QryParams
    Left = 64
    Top = 112
  end
  object QryParams: TFDQuery
    AfterPost = ApplyUpdate
    CachedUpdates = True
    OnUpdateRecord = QryParamsUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select inv_move_class_ranking from params')
    Left = 64
    Top = 140
    object QryParamsINV_MOVE_CLASS_RANKING: TStringField
      FieldName = 'INV_MOVE_CLASS_RANKING'
      Origin = 'IQ.PARAMS.INV_MOVE_CLASS_RANKING'
      Size = 1
    end
  end
end
