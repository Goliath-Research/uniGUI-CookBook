object FrmAPPoRecDrillDwn: TFrmAPPoRecDrillDwn
  Left = 192
  Top = 180
  ClientHeight = 335
  ClientWidth = 679
  Caption = 'PO Receiving Drill Down'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter3: TUniSplitter
    Left = 0
    Top = 159
    Width = 679
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel12: TUniPanel
    Left = 0
    Top = 0
    Width = 679
    Height = 159
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object GridPoReceipts: TUniDBGrid
      Left = 1
      Top = 47
      Width = 677
      Height = 112
      Hint = ''
      DataSource = SrcRec
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ParentColor = False
      Color = clBtnFace
      Columns = <
        item
          FieldName = 'RECEIPTNO'
          Title.Caption = 'Receipt #'
          Width = 304
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QTY_RECEIVED'
          Title.Caption = 'Quantity Received'
          Width = 104
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DATE_RECEIVED'
          Title.Caption = 'Date'
          Width = 58
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'POSTED'
          Title.Caption = 'Posted'
          Width = 41
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMMENT1'
          Title.Caption = 'Comment'
          Width = 129
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object PnlToolbar: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 677
      Height = 47
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object PnlToolbarCaption: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 675
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object lblCaptionLabel: TUniLabel
          Left = 1
          Top = 1
          Width = 52
          Height = 13
          Hint = ''
          Caption = 'Received'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object PnlToolbarInner: TUniPanel
        Tag = 1999
        Left = 1
        Top = 20
        Width = 675
        Height = 27
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object NavReceipts: TUniDBNavigator
          Left = 575
          Top = 1
          Width = 100
          Height = 25
          Hint = ''
          DataSource = SrcRec
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
  end
  object Panel11: TUniPanel
    Left = 0
    Top = 162
    Width = 679
    Height = 173
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object gridRejects: TUniDBGrid
      Left = 1
      Top = 47
      Width = 677
      Height = 126
      Hint = ''
      DataSource = SrcRej
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ParentColor = False
      Color = clBtnFace
      Columns = <
        item
          FieldName = 'QTY_REJECTED'
          Title.Caption = 'Quantity Rejected'
          Width = 94
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DATE_REJECTED'
          Title.Caption = 'Date'
          Width = 55
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RMANO'
          Title.Caption = 'RMA #'
          Width = 81
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REASON'
          Title.Caption = 'Reason'
          Width = 160
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object Panel1: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 677
      Height = 47
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Panel2: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 675
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label1: TUniLabel
          Left = 1
          Top = 1
          Width = 51
          Height = 13
          Hint = ''
          Caption = 'Rejected'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel3: TUniPanel
        Tag = 1999
        Left = 1
        Top = 20
        Width = 675
        Height = 27
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object navRejects: TUniDBNavigator
          Left = 575
          Top = 1
          Width = 100
          Height = 25
          Hint = ''
          DataSource = SrcRej
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
  end
  object SrcRej: TDataSource
    DataSet = QryRej
    Left = 32
    Top = 240
  end
  object QryRej: TFDQuery
    MasterSource = SrcRec
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select qty_rejected,'
      '          date_rejected,'
      '          rmano,'
      '          reason'
      '  from po_rejects'
      ' where po_receipts_id = :ID')
    Left = 48
    Top = 240
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 119910000c
      end>
  end
  object SrcRec: TDataSource
    DataSet = QryRec
    Left = 32
    Top = 80
  end
  object QryRec: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '           receiptno,'
      '           qty_received,'
      '           date_received,'
      '           posted,'
      '          comment1'
      'from po_receipts'
      'where po_detail_id = :PO_DETAIL_ID')
    Left = 40
    Top = 80
    ParamData = <
      item
        Name = 'PO_DETAIL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
        Value = '9459'
      end>
    object QryRecRECEIPTNO: TStringField
      FieldName = 'RECEIPTNO'
      Origin = 'PO_RECEIPTS.RECEIPTNO'
      Size = 50
    end
    object QryRecQTY_RECEIVED: TBCDField
      FieldName = 'QTY_RECEIVED'
      Origin = 'PO_RECEIPTS.QTY_RECEIVED'
    end
    object QryRecDATE_RECEIVED: TDateTimeField
      FieldName = 'DATE_RECEIVED'
      Origin = 'PO_RECEIPTS.DATE_RECEIVED'
    end
    object QryRecPOSTED: TStringField
      FieldName = 'POSTED'
      Origin = 'PO_RECEIPTS.POSTED'
      Size = 1
    end
    object QryRecCOMMENT1: TStringField
      FieldName = 'COMMENT1'
      Origin = 'PO_RECEIPTS.COMMENT1'
      Size = 250
    end
    object QryRecID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
  end
end
