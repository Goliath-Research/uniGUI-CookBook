object FrmPMAddSched: TFrmPMAddSched
  Left = 376
  Top = 179
  ClientHeight = 346
  ClientWidth = 616
  Caption = 'Add to Capacity Schedule'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 301
    Width = 616
    Height = 45
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel3: TUniPanel
      Left = 1
      Top = 1
      Width = 614
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel3: TUniPanel
      Left = 392
      Top = 3
      Width = 224
      Height = 42
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 616
    Height = 301
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 614
      Height = 245
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Bevel1: TUniPanel
        Left = 1
        Top = 24
        Width = 27
        Height = 221
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 3
        Caption = ''
      end
      object IQSearchWO: TIQUniGridControl
        Left = 27
        Top = 24
        Width = 587
        Height = 221
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 370
        IQComponents.Grid.Height = 135
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcWO
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
        IQComponents.Navigator.DataSource = SrcWO
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 370
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 135
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcWO
        Columns = <
          item
            FieldName = 'ID'
            Title.Caption = 'Work Order #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'WO_DATE'
            Title.Caption = 'Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DEPARTMENT'
            Title.Caption = 'Department'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'WO_CLASS'
            Title.Caption = 'Class'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REQUESTED_BY'
            Title.Caption = 'Requested By'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'STATUS'
            Title.Caption = 'Status'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PRIORITY'
            Title.Caption = 'Priority'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'WO_TYPE'
            Title.Caption = 'Type'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EQNO'
            Title.Caption = 'Equipment #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EQUIP_DESCRIP'
            Title.Caption = 'Equipment Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EQUIP_CLASS'
            Title.Caption = 'Equipment Class'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANT_ID'
            Title.Caption = 'EPlant ID'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object Panel6: TUniPanel
        Left = 1
        Top = 1
        Width = 612
        Height = 24
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Style = [fsBold]
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = ' 1. Select Work Order'
      end
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 245
      Width = 614
      Height = 56
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Bevel2: TUniPanel
        Left = 1
        Top = 27
        Width = 27
        Height = 29
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 3
        Caption = ''
      end
      object Panel7: TUniPanel
        Left = 1
        Top = 1
        Width = 612
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Style = [fsBold]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = ' 2. Select Start Date'
      end
      object wwDBDateTimePickerStartDate: TUniDBDateTimePicker
        Left = 28
        Top = 28
        Width = 199
        Height = 21
        Hint = ''
        DateTime = 42662.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
      end
    end
  end
  object SrcWO: TDataSource
    DataSet = QryWO
    Left = 104
    Top = 109
  end
  object QryWO: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '    w.id,'
      '    w.wo_date, '
      '    w.class as wo_class, '
      '    w.requested_by, '
      '    w.department, '
      '    w.status, '
      '    w.priority, '
      '    w.wo_type, '
      '    p.eqno, '
      '    p.descrip as equip_descrip, '
      '    p.class as equip_class, '
      '    w.eplant_id'
      'from '
      '    pmwo w, '
      '    pmeqmt p'
      'where '
      '    w.start_date is null'
      'and NVL(w.archived,'#39'N'#39') <> '#39'Y'#39
      'and iqpm.get_pmwo_pmeqmt_id( w.id ) = p.id(+)'
      'and misc.eplant_filter( w.eplant_id ) = 1'
      ''
      ''
      ''
      '')
    Left = 103
    Top = 125
    object QryWOID: TBCDField
      DisplayLabel = 'Work Order #'
      DisplayWidth = 12
      FieldName = 'ID'
      Origin = 'w.id'
      Size = 0
    end
    object QryWOWO_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 18
      FieldName = 'WO_DATE'
      Origin = 'w.wo_date'
    end
    object QryWODEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 20
      FieldName = 'DEPARTMENT'
      Origin = 'w.department'
    end
    object QryWOWO_CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'WO_CLASS'
      Origin = 'w.class'
      FixedChar = True
      Size = 2
    end
    object QryWOREQUESTED_BY: TStringField
      DisplayLabel = 'Requested By'
      DisplayWidth = 35
      FieldName = 'REQUESTED_BY'
      Origin = 'w.requested_by'
      Size = 35
    end
    object QryWOSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'STATUS'
      Origin = 'w.status'
    end
    object QryWOPRIORITY: TStringField
      DisplayLabel = 'Priority'
      DisplayWidth = 20
      FieldName = 'PRIORITY'
      Origin = 'w.priority'
    end
    object QryWOWO_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 35
      FieldName = 'WO_TYPE'
      Origin = 'w.wo_type'
      Size = 35
    end
    object QryWOEQNO: TStringField
      DisplayLabel = 'Equipment #'
      DisplayWidth = 25
      FieldName = 'EQNO'
      Origin = 'p.eqno'
      Size = 25
    end
    object QryWOEQUIP_DESCRIP: TStringField
      DisplayLabel = 'Equipment Description'
      DisplayWidth = 30
      FieldName = 'EQUIP_DESCRIP'
      Origin = 'p.descrip'
      Size = 50
    end
    object QryWOEQUIP_CLASS: TStringField
      DisplayLabel = 'Equipment Class'
      DisplayWidth = 13
      FieldName = 'EQUIP_CLASS'
      Origin = 'p.class'
      FixedChar = True
      Size = 2
    end
    object QryWOEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'w.eplant_id'
      Size = 0
    end
  end
end
