object FrmIQExtDocRevisions: TFrmIQExtDocRevisions
  Left = 0
  Top = 0
  ClientHeight = 349
  ClientWidth = 458
  Caption = 'Document Revisions'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 458
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 343
      Top = 1
      Width = 115
      Height = 26
      Hint = ''
      DataSource = wwSrcDocRev
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
    object pnlDateOfInterest: TUniPanel
      Left = 317
      Top = 1
      Width = 26
      Height = 26
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Shape1: TUniPanel
        Left = 2
        Top = 9
        Width = 10
        Height = 11
        Hint = 'Execute Date'
        ShowHint = True
        ParentShowHint = False
        TabOrder = 1
        Caption = ''
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 28
    Width = 458
    Height = 321
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    inline wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 456
      Height = 319
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 456
      ExplicitHeight = 319
      inherited PageControl: TUniPageControl
        Width = 456
        Height = 290
        ExplicitWidth = 456
        ExplicitHeight = 290
      end
      inherited TopToolBar: TUniToolBar
        Width = 456
      end
    end
  end
  object wwQryDocRev: TFDQuery
    BeforeOpen = wwQryDocRevBeforeOpen
    CachedUpdates = True
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '       external_doc_id,'
      '       filename,'
      '       revision,'
      
        '       decode( nvl(hist, '#39'N'#39'), '#39'Y'#39', '#39'Archived'#39', '#39'Current'#39') as st' +
        'ate,'
      '       effect_date,'
      '       deactive_date,'
      '       doc_repository_id'
      '  from doc_revision'
      ' where external_doc_id = :id'
      '   and (hist = '#39'Y'#39
      '        or'
      
        '        nvl(hist,'#39'N'#39') = '#39'N'#39' and '#39'RELEASED'#39' = (select upper(statu' +
        's) from external_doc where id = :id))'
      ' order by id desc'
      ' '
      ' '
      ' ')
    Left = 34
    Top = 98
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryDocRevFILENAME: TStringField
      DisplayLabel = 'FileName'
      DisplayWidth = 30
      FieldName = 'FILENAME'
      Size = 255
    end
    object wwQryDocRevREVISION: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 20
      FieldName = 'REVISION'
    end
    object wwQryDocRevEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
    end
    object wwQryDocRevSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 10
      FieldName = 'STATE'
      Size = 8
    end
    object wwQryDocRevID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object wwQryDocRevEXTERNAL_DOC_ID: TBCDField
      FieldName = 'EXTERNAL_DOC_ID'
      Visible = False
      Size = 0
    end
    object wwQryDocRevDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Expiration'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
      Visible = False
    end
    object wwQryDocRevDOC_REPOSITORY_ID: TBCDField
      FieldName = 'DOC_REPOSITORY_ID'
      Visible = False
      Size = 0
    end
  end
  object wwSrcDocRev: TDataSource
    DataSet = wwQryDocRev
    Left = 34
    Top = 71
  end
  object PopupMenu1: TUniPopupMenu
    Left = 100
    Top = 72
    object Execute1: TUniMenuItem
      Caption = 'Execute'
      OnClick = Execute1Click
    end
    object Print1: TUniMenuItem
      Caption = 'Print'
      OnClick = Print1Click
    end
  end
end
