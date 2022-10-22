object FrmBom_Clone: TFrmBom_Clone
  Left = 316
  Top = 244
  ClientHeight = 177
  ClientWidth = 392
  Caption = 'Clone BOM'
  OnShow = FormShow
  Constraints.MinHeight = 170
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtonCarrier: TUniPanel
    Left = 0
    Top = 136
    Width = 392
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 390
      Height = 2
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object PnlButtons: TUniPanel
      Left = 177
      Top = 2
      Width = 215
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 3
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 110
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 136
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 81
      Top = 0
      Width = 6
      Height = 136
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 81
      Height = 134
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label5: TUniLabel
        Left = 6
        Top = 9
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'New MFG #'
        TabOrder = 1
      end
    end
    object PnlClient01: TUniPanel
      Left = 87
      Top = 1
      Width = 305
      Height = 134
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        305
        134)
      object edNewMfgNo: TUniEdit
        Left = 1
        Top = 5
        Width = 301
        Hint = ''
        CharCase = ecUpperCase
        MaxLength = 25
        Text = ''
        ParentFont = False
        Font.Color = clBlack
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object chkIncludeUDForm: TUniCheckBox
        Left = 1
        Top = 48
        Width = 301
        Height = 17
        Hint = ''
        Caption = 'Include User-Defined Form Information'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object chkIncludeInternalDocs: TUniCheckBox
        Left = 1
        Top = 66
        Width = 301
        Height = 17
        Hint = ''
        Caption = 'Include Internal Documents'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object chkIncludeExternalDocs: TUniCheckBox
        Left = 1
        Top = 84
        Width = 301
        Height = 17
        Hint = ''
        Caption = 'Include External Documents'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object chkCloneAllMfgItems: TUniCheckBox
        Left = 1
        Top = 102
        Width = 301
        Height = 17
        Hint = ''
        Caption = 'Clone All Manufactured Items'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        OnClick = chkReuseProcessesClick
      end
      object chkReuseProcesses: TUniCheckBox
        Left = 1
        Top = 30
        Width = 301
        Height = 17
        Hint = ''
        Caption = 'Reuse Processes / Operations'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        OnClick = chkReuseProcessesClick
      end
    end
  end
  object QryInternalDocsBlob: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       d1.id       as src_docs_id,'
      '       d1.doc_blob as src_doc_blob,'
      '       d2.id       as trg_docs_id,'
      '       d2.doc_blob as trg_doc_blob'
      '  from '
      '       standard_docs s1,'
      '       iq_docs d1,'
      ''
      '       standard_docs s2,'
      '       iq_docs d2'
      ' where '
      '       s1.standard_id = :src_standard_id'
      '   and s1.iq_docs_id = d1.id'
      ''
      '   and s2.standard_id = :trg_standard_id'
      '   and s2.iq_docs_id = d2.id'
      ''
      '   and s1.docseq = s2.docseq'
      ' '
      ' ')
    Left = 21
    Top = 39
    ParamData = <
      item
        Name = 'src_standard_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'trg_standard_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryInternalDocsBlobSRC_DOCS_ID: TBCDField
      FieldName = 'SRC_DOCS_ID'
      Origin = 'IQ.IQ_DOCS.ID'
      Size = 0
    end
    object QryInternalDocsBlobSRC_DOC_BLOB: TBlobField
      FieldName = 'SRC_DOC_BLOB'
    end
    object QryInternalDocsBlobTRG_DOCS_ID: TBCDField
      FieldName = 'TRG_DOCS_ID'
      Origin = 'IQ.IQ_DOCS.ID'
      Size = 0
    end
    object QryInternalDocsBlobTRG_DOC_BLOB: TBlobField
      FieldName = 'TRG_DOC_BLOB'
      Origin = 'IQ.IQ_DOCS.DOC_BLOB'
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'chkReuseProcesses'
      'chkIncludeUDForm'
      'chkIncludeInternalDocs'
      'chkIncludeExternalDocs')
    SecurityCode = 'FRMBOM_CLONE'
    Left = 324
    Top = 56
  end
end
