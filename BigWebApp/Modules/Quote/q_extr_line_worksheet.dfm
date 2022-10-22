object FrmExtrusionLineWorksheet: TFrmExtrusionLineWorksheet
  Left = 569
  Top = 180
  ClientHeight = 308
  ClientWidth = 471
  Caption = 'Pipe Extrusion Worksheet '
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 263
    Width = 471
    Height = 45
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 131
    ExplicitWidth = 383
    object Panel4: TUniPanel
      Left = 242
      Top = 1
      Width = 228
      Height = 43
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 154
      object btnOK: TUniButton
        Left = 3
        Top = 10
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 117
        Top = 10
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object wwDataInspector1: TwwDataInspector
    Left = 0
    Top = 0
    Width = 471
    Height = 263
    DisableThemes = False
    Align = alClient
    TabOrder = 1
    DataSource = wwDataSource1
    Items = <
      item
        DataSource = wwDataSource1
        DataField = 'EXTR_OD'
        Caption = 'OD (in) or (mm)'
        WordWrap = False
      end
      item
        DataSource = wwDataSource1
        DataField = 'EXTR_ID'
        Caption = 'ID (in) or (mm)'
        WordWrap = False
      end
      item
        DataSource = wwDataSource1
        DataField = 'EXTR_LINESPEED'
        Caption = 'Linespeed (f/min) or (m/min)'
        WordWrap = False
      end
      item
        DataSource = wwDataSource1
        DataField = 'SPG'
        Caption = 'SPG'
        WordWrap = False
      end>
    DefaultRowHeight = 20
    CaptionWidth = 147
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovDottedLine
    LineStyleData = ovDottedLine
    ExplicitTop = 5
  end
  object wwDataSource1: TDataSource
    DataSet = QryQuote
    Left = 20
    Top = 106
  end
  object QryQuote: TFDQuery
    BeforeOpen = QryQuoteBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select extr_od,'
      '       extr_id,'
      '       extr_linespeed,'
      '       :spg as spg,'
      '       id'
      '  from quote'
      ' where id = :quote_id')
    Left = 92
    Top = 103
    ParamData = <
      item
        Name = 'spg'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'quote_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryQuoteEXTR_OD: TFMTBCDField
      FieldName = 'EXTR_OD'
      Size = 6
    end
    object QryQuoteEXTR_ID: TFMTBCDField
      FieldName = 'EXTR_ID'
      Size = 6
    end
    object QryQuoteEXTR_LINESPEED: TFMTBCDField
      FieldName = 'EXTR_LINESPEED'
      Size = 6
    end
    object QryQuoteSPG: TFMTBCDField
      FieldName = 'SPG'
      Size = 38
    end
    object QryQuoteID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into quote'
      '  (EXTR_OD, EXTR_ID, EXTR_LINESPEED)'
      'values'
      '  (:EXTR_OD, :EXTR_ID, :EXTR_LINESPEED)')
    ModifySQL.Strings = (
      'update quote'
      'set'
      '  EXTR_OD = :EXTR_OD,'
      '  EXTR_ID = :EXTR_ID,'
      '  EXTR_LINESPEED = :EXTR_LINESPEED'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from quote'
      'where'
      '  ID = :OLD_ID')
    Left = 173
    Top = 100
  end
end
