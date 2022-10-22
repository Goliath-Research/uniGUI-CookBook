object FrmPmSelectEquip: TFrmPmSelectEquip
  Left = 0
  Top = 0
  ClientHeight = 316
  ClientWidth = 554
  Caption = 'Select from Associated Equipment'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 273
    Width = 554
    Height = 43
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 343
      Top = 1
      Width = 210
      Height = 41
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
        TabOrder = 1
        Default = True
        OnClick = btnOkClick
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
    object chkShowExistingWorkOrders: TUniCheckBox
      Left = 9
      Top = 6
      Width = 177
      Height = 17
      Hint = 
        'If checked, once you have selected a MRO Equipment, you will be ' +
        'prompted to select a MRO Work Order'
      ShowHint = True
      ParentShowHint = False
      Caption = 'Show existing Work Orders'
      TabOrder = 1
      OnClick = chkShowExistingWorkOrdersTouchScreenClick
    end
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 27
    Width = 554
    Height = 246
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 552
      Height = 244
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 335
      IQComponents.Grid.Height = 158
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcData
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.OnDblClick = btnOkClick
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 241
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = SrcData
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.Navigator.BeforeAction = NavBeforeAction
      IQComponents.HiddenPanel.Left = 335
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
      DataSource = SrcData
      Columns = <
        item
          FieldName = 'EQNO'
          Title.Caption = 'Equipment #'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 350
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 49
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object PnlToolbar: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 554
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object sbtnMisc: TUniSpeedButton
      Left = 0
      Top = 0
      Width = 25
      Height = 25
      Hint = 'If down, a miscellaneous task will be created.'
      GroupIndex = 1
      AllowAllUp = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF800000
        800000800000800000800000800000800000800000800000800000800000FF00
        FFFF00FFFF00FFFF00FFFF00FF80808080808080808080808080808080808080
        8080808080808080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        800000C00000C06020C06020C08020C08020C08020C08020800000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF800000C00000C06020C06020C08020C08020800000FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFFFF00FFFF00FFFF
        00FFFF00FF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF800000C00000C06020C06020800000FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFFFF00FFFF
        00FF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF800000C00000800000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF80
        8080FF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF800000FF00FFFF00FFFF00FF0040400040400060
        A00060A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FF
        00FFFF00FFFF00FF808080808080808080808080FFFFFFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00404000C0E000E0E000E0
        E000E0E00060A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF808080C2C2C2D9D9D9D9D9D9D9D9D96F6F6FFFFFFFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00404000C0E000FFFF00FFFF00FF
        FF00E0E000E0E00060A0FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF808080FFFFFFFF00FFFF00FFFF00FFD9D9D9D9D9D96F6F6F0020804000A0
        4000A04000A04000A04000A04000A0FF00FF00404000C0E000FFFF00FFFFFFFF
        FF00FFFF00E0E00060A0808080808080808080808080808080808080808080FF
        FFFF808080FFFFFFFF00FFFF00FFFF00FFFF00FFD9D9D96F6F6F0020800060E0
        0000FF0000FF0000FF0000FF4000A0FF00FF00404000C0E000FFFFFFFFFF00FF
        FF00FFFF00E0E00060A0808080FFFFFFFF00FFFF00FFFF00FFFF00FF808080FF
        FFFF808080FFFFFFFF00FFFF00FFFF00FFFF00FFD9D9D96F6F6F0020800060E0
        0060E00000FF0000FF0000FF4000A0FF00FF00404000808000C0E000FFFF00FF
        FF00FFFF00E0E00060A0808080FFFFFFFF00FFFF00FFFF00FFFF00FF808080FF
        FFFF808080FFFFFFFFFFFFFF00FFFF00FFFF00FFD9D9D96F6F6F0020800020E0
        0060E00060E00000FF0000FF4000A0FF00FFFF00FF00404000808000C0E000C0
        E000C0E0004040FF00FF808080FFFFFFFF00FFFF00FFFF00FFFF00FF808080FF
        FFFFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFF808080FF00FF0020800020E0
        0060E00060E00060E00000FF4000A0FF00FFFF00FFFF00FF0040400040400040
        40004040FF00FFFF00FF808080FFFFFFFF00FFFF00FFFF00FFFF00FF808080FF
        FFFFFF00FFFF00FF808080808080808080808080FF00FFFF00FF0020804000E0
        4000E00020E00060E00060E04000A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF
        FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF002080002080
        002080002080002080002080002080FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF808080808080808080808080808080808080808080FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
    end
  end
  object SrcData: TDataSource
    DataSet = QryDataAssoc
    Left = 248
    Top = 112
  end
  object QryDataAssoc: TFDQuery
    BeforeOpen = QryDataAssocBeforeOpen
    CachedUpdates = True
    OnUpdateRecord = EmptyUpdateRecord
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'SELECT DISTINCT a.id, a.eqno, a.descrip, a.class'
      '  FROM pmeqmt a, (SELECT a.pmeqmt_id'
      '                    FROM standard_pmeqmt a'
      '                   WHERE a.standard_id = :standard_id'
      '                  UNION'
      '                  SELECT a.pmeqmt_id'
      '                    FROM work_center a'
      '                   WHERE a.id = :work_center_id'
      '                  UNION'
      '                  SELECT a.pmeqmt_id_linked'
      '                    FROM pmeqmt_link a, standard_pmeqmt b'
      '                   WHERE b.standard_id = :standard_id AND'
      '                         a.pmeqmt_id = b.pmeqmt_id'
      '                  UNION'
      '                  SELECT a.pmeqmt_id_linked'
      '                    FROM pmeqmt_link a, work_center b'
      '                   WHERE b.id = :work_center_id AND'
      '                         a.pmeqmt_id = b.pmeqmt_id) b'
      ' WHERE a.id = b.pmeqmt_id AND'
      '       NVL(a.pk_hide,'#39'N'#39') <> '#39'Y'#39)
    Left = 192
    Top = 120
    ParamData = <
      item
        Name = 'STANDARD_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'WORK_CENTER_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDataAssocEQNO: TStringField
      DisplayLabel = 'Equipment #'
      DisplayWidth = 25
      FieldName = 'EQNO'
      Origin = 'a.eqno'
      Size = 25
    end
    object QryDataAssocDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 50
    end
    object QryDataAssocCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 7
      FieldName = 'CLASS'
      Origin = 'a.class'
      Size = 2
    end
    object QryDataAssocID: TBCDField
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
  end
  object QryDataAll: TFDQuery
    CachedUpdates = True
    OnUpdateRecord = EmptyUpdateRecord
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'SELECT a.id, a.eqno, a.descrip, a.class'
      '  FROM pmeqmt a'
      'WHERE NVL(a.pk_hide,'#39'N'#39') <> '#39'Y'#39)
    Left = 320
    Top = 120
    object QryDataAllID: TBCDField
      FieldName = 'ID'
      Origin = 'a.id'
      Size = 0
    end
    object QryDataAllEQNO: TStringField
      FieldName = 'EQNO'
      Origin = 'a.eqno'
      Size = 25
    end
    object QryDataAllDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 50
    end
    object QryDataAllCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'a.class'
      Size = 2
    end
  end
end
