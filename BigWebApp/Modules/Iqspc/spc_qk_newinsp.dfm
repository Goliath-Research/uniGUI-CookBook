object FrmSPCNewQuickInspection: TFrmSPCNewQuickInspection
  Left = 284
  Top = 298
  ClientHeight = 162
  ClientWidth = 397
  Caption = 'New SPC Quick Inspection'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  BorderIcons = [biSystemMenu, biMinimize]
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 397
    Height = 121
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      397
      121)
    object lblName: TUniLabel
      Left = 8
      Top = 20
      Width = 27
      Height = 13
      Hint = ''
      Caption = 'Name'
      TabOrder = 4
    end
    object lblDescription: TUniLabel
      Left = 8
      Top = 44
      Width = 53
      Height = 13
      Hint = ''
      Caption = 'Description'
      TabOrder = 5
    end
    object lblSampleCount: TUniLabel
      Left = 8
      Top = 92
      Width = 66
      Height = 13
      Hint = ''
      Caption = 'Sample Count'
      TabOrder = 6
    end
    object dbeName: TUniDBEdit
      Left = 104
      Top = 16
      Width = 290
      Height = 21
      Hint = ''
      DataField = 'NAME'
      DataSource = SrcSPCInspection
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object dbeDescription: TUniDBEdit
      Left = 104
      Top = 40
      Width = 290
      Height = 46
      Hint = ''
      DataField = 'DESCRIPTION'
      DataSource = SrcSPCInspection
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object wwDBSpinEdit1: TUniDBNumberEdit
      Left = 104
      Top = 88
      Width = 57
      Height = 21
      Hint = ''
      DataField = 'SAMPLE_COUNT'
      DataSource = SrcSPCInspection
      TabOrder = 2
      MaxValue = 100.000000000000000000
      MinValue = 2.000000000000000000
      DecimalSeparator = '.'
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 121
    Width = 397
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 189
      Top = 1
      Width = 208
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object SrcSPCInspection: TDataSource
    DataSet = TblSPCInspection
    Left = 216
    Top = 16
  end
  object TblSPCInspection: TFDTable
    BeforePost = TblSPCInspectionBeforePost
    OnNewRecord = TblSPCInspectionNewRecord
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SPC_INSPECTION'
    TableName = 'SPC_INSPECTION'
    Left = 224
    Top = 32
    object TblSPCInspectionID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblSPCInspectionNAME: TStringField
      FieldName = 'NAME'
      Size = 35
    end
    object TblSPCInspectionDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object TblSPCInspectionSAMPLE_COUNT: TBCDField
      FieldName = 'SAMPLE_COUNT'
      Size = 0
    end
    object TblSPCInspectionCREATED: TDateTimeField
      FieldName = 'CREATED'
    end
    object TblSPCInspectionCREATEDBY: TStringField
      FieldName = 'CREATEDBY'
      Size = 35
    end
    object TblSPCInspectionSOURCE: TStringField
      FieldName = 'SOURCE'
      Size = 30
    end
    object TblSPCInspectionSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Size = 0
    end
  end
end
