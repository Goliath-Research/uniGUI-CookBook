object FrmM_Filter: TFrmM_Filter
  Left = 227
  Top = 153
  ClientHeight = 175
  ClientWidth = 310
  Caption = 'Select Filter'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 310
    Height = 2
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 2
    Width = 310
    Height = 132
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = 'Panel1'
    ExplicitHeight = 122
    object PageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 308
      Height = 130
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ActivePage = tabOverall
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tabOverall: TUniTabSheet
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Overall View'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 83
        object Label6: TUniLabel
          Left = 1
          Top = 14
          Width = 42
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'MfgType'
          TabOrder = 1
        end
        object lookupMfgTypeOverAll: TUniDBLookupComboBox
          Left = 63
          Top = 9
          Width = 230
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListFieldIndex = 0
          TabOrder = 0
          Color = clWindow
        end
      end
      object tabEPlant: TUniTabSheet
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImageIndex = 1
        Caption = 'EPlant'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 83
        object Label9: TUniLabel
          Left = 1
          Top = 48
          Width = 30
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'EPlant'
          TabOrder = 2
        end
        object Label1: TUniLabel
          Left = 1
          Top = 14
          Width = 42
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'MfgType'
          TabOrder = 3
        end
        object lookupEPlant: TUniDBLookupComboBox
          Left = 63
          Top = 43
          Width = 230
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListFieldIndex = 0
          TabOrder = 1
          Color = clWindow
        end
        object lookupMfgTypeEPlant: TUniDBLookupComboBox
          Left = 63
          Top = 9
          Width = 230
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListFieldIndex = 0
          TabOrder = 0
          Color = clWindow
        end
      end
      object tabMfgCell: TUniTabSheet
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImageIndex = 2
        Caption = 'MfgCell'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 83
        object Label2: TUniLabel
          Left = 1
          Top = 14
          Width = 35
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'MfgCell'
          TabOrder = 1
        end
        object lookupMfgCell: TUniDBLookupComboBox
          Left = 63
          Top = 9
          Width = 230
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListFieldIndex = 0
          TabOrder = 0
          Color = clWindow
        end
      end
      object tabWorkCenter: TUniTabSheet
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImageIndex = 3
        Caption = 'Work Center'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 83
        object Label3: TUniLabel
          Left = 1
          Top = 14
          Width = 33
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Center'
          TabOrder = 1
        end
        object lookupWorkCenter: TUniDBLookupComboBox
          Left = 63
          Top = 9
          Width = 230
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListFieldIndex = 0
          TabOrder = 0
          Color = clWindow
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 134
    Width = 310
    Height = 41
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 92
      Top = 1
      Width = 217
      Height = 39
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 10
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 111
        Top = 10
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object QryMfgType: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select mfgtype, '
      '       descrip'
      '  from mfgtype'
      'where mfg.is_mfgtype_pm( mfgtype ) = 0'
      ' order by mfgtype'
      '')
    Left = 2
    Top = 70
    object QryMfgTypeMFGTYPE: TStringField
      DisplayLabel = 'MfgType'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object QryMfgTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      FixedChar = True
    end
  end
  object QryMfgCell: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select mfgcell,'
      '       descrip,'
      '       mfgtype, '
      '       eplant_id'
      '  from v_mfgcell'
      ' order by mfgcell'
      ' ')
    Left = 32
    Top = 70
    object QryMfgCellMFGCELL: TStringField
      DisplayLabel = 'MfgCell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      FixedChar = True
      Size = 15
    end
    object QryMfgCellDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      FixedChar = True
      Size = 25
    end
    object QryMfgCellMFGTYPE: TStringField
      DisplayLabel = 'MfgType'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object QryMfgCellEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object QryWorkCenter: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       eqno,'
      '       cntr_type,'
      '       mfgcell,'
      '       mfg_type,'
      '       eplant_id'
      '  from work_center'
      '   where (frame_id is null or frame_set_id is not null)'
      ' order by eqno'
      '')
    Left = 63
    Top = 71
    object QryWorkCenterEQNO: TStringField
      DisplayLabel = 'Center'
      DisplayWidth = 10
      FieldName = 'EQNO'
      FixedChar = True
      Size = 60
    end
    object QryWorkCenterCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 10
      FieldName = 'CNTR_TYPE'
      FixedChar = True
    end
    object QryWorkCenterMFGCELL: TStringField
      DisplayLabel = 'MfgCell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      FixedChar = True
      Size = 15
    end
    object QryWorkCenterMFG_TYPE: TStringField
      DisplayLabel = 'MfgType'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryWorkCenterEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryWorkCenterID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.WORK_CENTER.ID'
      Visible = False
      Size = 0
    end
  end
  object QryEPlant: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, name from eplant'
      'order by name')
    Left = 91
    Top = 72
    object QryEPlantNAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 30
    end
    object QryEPlantID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Size = 0
    end
  end
end
