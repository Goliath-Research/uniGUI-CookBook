object FrmFAB_Parameters: TFrmFAB_Parameters
  Left = 111
  Top = 169
  ClientHeight = 156
  ClientWidth = 383
  Caption = 'Parameters'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 286
    Top = 0
    Width = 97
    Height = 156
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object btnCancel: TUniButton
      Left = 11
      Top = 51
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      Cancel = True
      ModalResult = 2
      TabOrder = 1
    end
    object btnOK: TUniButton
      Left = 11
      Top = 19
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 286
    Height = 156
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 284
      Height = 154
      Hint = ''
      ActivePage = tabGeneral
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tabGeneral: TUniTabSheet
        Hint = ''
        Caption = 'General'
        object dbchkDelFirmWo: TUniDBCheckBox
          Left = 10
          Top = 8
          Width = 176
          Height = 17
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataField = 'DEL_FIRM_WO'
          DataSource = DataSource1
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Auto Remove FIRM work orders'
          TabOrder = 0
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 230
    Top = 60
  end
  object Table1: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'PARAMS'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'PARAMS'
    Left = 229
    Top = 120
    object Table1DEL_FIRM_WO: TStringField
      FieldName = 'DEL_FIRM_WO'
      Origin = 'DEL_FIRM_WO'
      FixedChar = True
      Size = 1
    end
    object Table1ID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
  end
end
