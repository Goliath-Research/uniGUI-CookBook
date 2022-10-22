object FrmInvTransStagingParams: TFrmInvTransStagingParams
  Left = 0
  Top = 0
  ClientHeight = 147
  ClientWidth = 412
  Caption = 'Staging Parameters'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 106
    Width = 412
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 191
      Top = 1
      Width = 220
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 5
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 113
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 106
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pgctrlMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 410
      Height = 104
      Hint = ''
      ActivePage = TabSheet1
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'TabSheet1'
        object Panel4: TUniPanel
          Left = 0
          Top = 0
          Width = 402
          Height = 76
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object DBCheckBox1: TUniDBCheckBox
            Left = 8
            Top = 12
            Width = 233
            Height = 17
            Hint = 'Hard allocate raw materials to work order on directed move'
            ShowHint = True
            ParentShowHint = False
            DataField = 'HARD_ALLOC_RAW_MAT_DIRECT_MOVE'
            DataSource = DataSource1
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Hard Allocate Raw Materials to Work Order'
            TabOrder = 0
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 272
    Top = 28
  end
  object FDQuery1: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateMode]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.UpdateTableName = 'PARAMS'
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'select HARD_ALLOC_RAW_MAT_DIRECT_MOVE from params')
    Left = 216
    Top = 48
    object FDQuery1HARD_ALLOC_RAW_MAT_DIRECT_MOVE: TStringField
      FieldName = 'HARD_ALLOC_RAW_MAT_DIRECT_MOVE'
      Origin = 'HARD_ALLOC_RAW_MAT_DIRECT_MOVE'
      Size = 1
    end
  end
  object FDUpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    ModifySQL.Strings = (
      'UPDATE PARAMS'
      
        'SET HARD_ALLOC_RAW_MAT_DIRECT_MOVE = :NEW_HARD_ALLOC_RAW_MAT_DIR' +
        'ECT_MOVE')
    Left = 300
    Top = 56
  end
end
