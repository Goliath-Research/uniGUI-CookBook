inherited FrmQC_PkDoc: TFrmQC_PkDoc
  Left = 143
  Top = 207
  ClientHeight = 312
  ClientWidth = 630
  Caption = 'Select Document from Library'
  OldCreateOrder = True
  ExplicitWidth = 646
  ExplicitHeight = 351
  PixelsPerInch = 96
  TextHeight = 17
  inherited IQSearch1: TIQUniGridControl
    Top = 28
    Width = 630
    Height = 235
    ExplicitTop = 28
    ExplicitWidth = 630
    ExplicitHeight = 235
    inherited PageControl: TUniPageControl
      Width = 630
      Height = 206
      ExplicitWidth = 463
      ExplicitHeight = 125
      inherited GridTab: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 455
        ExplicitHeight = 97
      end
      inherited FormTab: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 455
        ExplicitHeight = 97
      end
    end
    inherited TopToolBar: TUniToolBar
      Width = 630
      ExplicitWidth = 463
    end
  end
  inherited Panel1: TUniPanel
    Top = 263
    Width = 630
    ExplicitTop = 263
    ExplicitWidth = 630
    inherited Panel2: TUniPanel
      Left = 358
      ExplicitLeft = 358
    end
  end
  object pnlTop: TUniPanel [2]
    Left = 0
    Top = 0
    Width = 630
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object sbtnAddDocument: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Append a document to the library and select it ...'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF99632D
        9E67309E67309E67309E67309E67309E67309E6730164E010963000963001750
        01FF00FFFF00FFFF00FFFF00FF9A632ACF8B52CF8D53CF8D53CF8D53CF8D53BB
        884A045E0000D81D00D70000D70400DA391C5D05FF00FFFF00FFFF00FFA16D34
        DDA66CDDA86FDDA86FDDA86FDDA86F04600100DC5700D820FFFFFFFAFAFA00DA
        3600DC671C5D05FF00FFFF00FFA5753DE7B783E7BB86E7BB86E7BB861C5D0531
        DF8800DC5E00DA39FFFFFFFAFAFA00DA4800DD6B43E4971C5A01FF00FFA97D47
        EFCA9BEFCD9FEFCD9FEFCD9F1C5D0523DD80FEFEFEFAFAFAFFFFFFFAFAFAFAFA
        FAFFFFFF18DD791C5D05FF00FFAD8652FADFB6FAE2BBFAE2BBFAE2BB1C5D0500
        DD6BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00DD6E1C5D05FF00FFB08C5A
        FFECCAFFEFCFFFEFCFFFEFCF1C5D0500DC6200DD6E4FDF95FFFFFFFFFFFF5BDF
        9B18DD791DE2821C5D05FF00FFB29160FFF1D2FFF5D8FFF5D8FFF5D8FFF5D81C
        5D0512DD7779E0AAFFFFFFFFFFFF70E0A623DD801C5D05FF00FFFF00FFB19162
        FFF4D8FFF7DDFFF7DDFFF7DDFFF7DDFFF7DD1C5D0500DD6775E0A859E09900DF
        691C5D05FF00FFFF00FFFF00FFB09064FDF5DDFFFAE4FFFAE4FFFAE4FFFAE4FF
        FAE4FFFAE41C5D051C5D051C5D051C5D05FF00FFFF00FFFF00FFFF00FFAF8E64
        FDF4E0FDFBE9FFFDEAFFFDEAFFFDEAFFFDEAFFFDEAFFFDEAFFFDEAFFFBE89171
        47FF00FFFF00FFFF00FFFF00FFAD8A60FAEFDDFDFAECFDFDEEFFFDEFFFFDEFFF
        FDEFFFFDEFFFFDEFFFFDEFFFFDED917147FF00FFFF00FFFF00FFFF00FF997343
        997344997444997344FDFDF1FFFDF4FFFDF4FFFDF4FFFDF4FFFDF4FFFDF19171
        48FF00FFFF00FFFF00FFFF00FFFF00FFB28E6BFDFDF59A7444FDF9F0FDFDF5FF
        FDF6FFFDF6FFFDF6FFFDF6FFFBF4907148FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFAB8A65997444F9E9DDFDF1E8FDF5ECFFF5ECFFF5ECFFF4EAFFF4E89071
        48FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9973439973439A77479B
        79499C79499775459774439773438D6C3AFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      TabOrder = 3
      OnClick = sbtnAddDocumentClick
    end
    object NavMain: TUniDBNavigator
      Left = 480
      Top = 1
      Width = 150
      Height = 26
      Hint = ''
      DataSource = wwDataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
    object Panel10: TUniPanel
      Left = 438
      Top = 1
      Width = 42
      Height = 26
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Bevel3: TUniPanel
        Left = 33
        Top = 1
        Width = 6
        Height = 24
        Hint = ''
        TabOrder = 1
        Caption = ''
      end
      object sbtnHideExpired: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 26
        Height = 25
        Hint = 'Hide Expired'
        ShowHint = True
        ParentShowHint = False
        GroupIndex = 1
        AllowAllUp = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFC07040B05830B05830A05020A050209048209048
          20904020804020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7171715C
          5C5C5C5C5C5353535353534A4A4A4A4A4A454545424242FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFC07850F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0
          B0F0D0B0904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979D9
          D9D9D5D5D5D0D0D0CDCDCDCDCDCDCDCDCDCDCDCD454545FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFD08860FFF8F0FFF8F0FFF0E0FFF0E0FFE8E0FFE8
          E0F0D0B0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888F7
          F7F7F7F7F7EEEEEEEEEEEEE9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07040
          B05830B05830A05020A05020904820904820904020804020FFF0F0FFE8E0FFE8
          E0F0D0B0904820FF00FFFF00FF7171715C5C5C5C5C5C5353535353534A4A4A4A
          4A4A454545424242F2F2F2E9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07850
          F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0B0F0D0B0904020FFF8F0FFF0E0FFF0
          E0F0D0C0A04820FF00FFFF00FF797979D9D9D9D5D5D5D0D0D0CDCDCDCDCDCDCD
          CDCDCDCDCD454545F7F7F7EEEEEEEEEEEED0D0D04D4D4DFF00FFFF00FFD08860
          FFF8F0E09060D08050D08050D08050D08050F0D0B0904820FFFFFFFFF0F0FFF0
          F0F0D8D0A05020FF00FFFF00FF888888F7F7F790909080808080808080808080
          8080CDCDCD4A4A4AFFFFFFF2F2F2F2F2F2D9D9D9535353FF00FFFF00FFD09070
          FFFFFFFFFFFFFFF0F0FFF0F0FFE8E0FFE8E0F0D0B0904820FFFFFFFFF8F0FFF8
          F0F0E0E0A05020FF00FFFF00FF909090FFFFFFFFFFFFF2F2F2F2F2F2E9E9E9E9
          E9E9CDCDCD4A4A4AFFFFFFF7F7F7F7F7F7E2E2E2535353FF00FFFF00FFE0A080
          FFFFFFF0A880E09870E09060D08050D08050F0D0C0A04820FFFFFFFFFFFFFFFF
          FFFFFFFFA05020FF00FFFF00FFA0A0A0FFFFFFA8A8A898989890909080808080
          8080D0D0D04D4D4DFFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0A890
          FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0F0F0D8D0A05020FFFFFFFFFFFFFFFF
          FFFFFFFFA05020FF00FFFF00FFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F2
          F2F2D9D9D9535353FFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0B8A0
          FFFFFFFFB090F0B090F0A880F09870E09060F0E0E0A05020E0A080D09070D088
          60C07850C07040FF00FFFF00FFB7B7B7FFFFFFB1B1B1B0B0B0A8A8A89A9A9A90
          9090E2E2E2535353A0A0A0909090888888797979717171FF00FFFF00FFF0C0A0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
          F0C0B0F0C0B0F0B8A0E0A080D09070D08860C07850C07040FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFC7C7C7C1C1C1C1C1C1B8B8B8A0A0A090909088
          8888797979717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        TabOrder = 2
        OnClick = sbtnHideExpiredClick
      end
    end
  end
  inherited wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    BeforeInsert = AbortOnInsert
    CachedUpdates = True
    OnUpdateRecord = FakeUpdateRecord
    SQL.Strings = (
      'select d.id,'
      '       d.docno,'
      '       d.descrip,'
      '       r.filename,'
      '       d.status,'
      '       r.revision,'
      
        '       decode( d.status, '#39'Released'#39',  decode( sign(r.deactive_da' +
        'te-sysdate), -1, '#39'Y'#39', '#39'N'#39'), '#39'N'#39' ) is_expired,'
      ''
      '       stat1.date_created,'
      '       stat2.date_last_modified,'
      ''
      '       d.cuser1,'
      '       d.cuser2,'
      '       d.cuser3'
      '  from external_doc d,'
      '       doc_revision r,'
      ''
      '       ( select log.external_doc_id,'
      '                min( log.trans_date ) as date_created'
      '          from doc_log log'
      '         where trans_in_out = '#39'OUT'#39
      '           and log.doc_revision_id is NULL'
      '         group by log.external_doc_id ) stat1,'
      ''
      '       ( select log.external_doc_id,'
      '                max(log.trans_date) as date_last_modified'
      '           from doc_log log'
      '          where trans_in_out = '#39'IN'#39
      '          group by log.external_doc_id ) stat2'
      ''
      ' where '
      '       d.doc_library_id = :id'
      '   and d.id = r.external_doc_id(+)'
      '   and NVL(r.hist(+), '#39'N'#39') = '#39'N'#39
      '   and nvl(d.pk_hide,'#39'N'#39') <> '#39'Y'#39
      ''
      '   and d.id = stat1.external_doc_id(+)'
      '   and d.id = stat2.external_doc_id(+)'
      ''
      '   and (:hide_expired = 0'
      '        or'
      
        '        :hide_expired = 1 and decode( d.status, '#39'Released'#39',  dec' +
        'ode( sign(r.deactive_date-sysdate), -1, '#39'Y'#39', '#39'N'#39'), '#39'N'#39' ) = '#39'N'#39')'
      ''
      ''
      '')
    Left = 57
    Top = 184
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'hide_expired'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1DOCNO: TStringField
      DisplayLabel = 'Doc #'
      DisplayWidth = 15
      FieldName = 'DOCNO'
      Origin = 'DOCNO'
      Size = 25
    end
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Document Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'd.descrip'
      Size = 250
    end
    object wwQuery1FILENAME: TStringField
      DisplayLabel = 'FileName'
      DisplayWidth = 17
      FieldName = 'FILENAME'
      Origin = 'r.filename'
      Size = 255
    end
    object wwQuery1STATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 10
      FieldName = 'STATUS'
      Origin = 'd.status'
    end
    object wwQuery1REVISION: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 10
      FieldName = 'REVISION'
      Origin = 'r.revision'
    end
    object wwQuery1IS_EXPIRED: TStringField
      DisplayLabel = 'Expired'
      DisplayWidth = 7
      FieldName = 'IS_EXPIRED'
      Origin = 
        'decode( d.status, '#39'Released'#39',  decode( sign(r.deactive_date-sysd' +
        'ate), -1, '#39'Y'#39', '#39'N'#39'), '#39'N'#39' )'
      Size = 1
    end
    object wwQuery1CUSER1: TStringField
      DisplayLabel = 'CUser1'
      DisplayWidth = 25
      FieldName = 'CUSER1'
      Origin = 'd.cuser1'
      Size = 60
    end
    object wwQuery1CUSER2: TStringField
      DisplayLabel = 'CUser2'
      DisplayWidth = 25
      FieldName = 'CUSER2'
      Origin = 'd.cuser2'
      Size = 60
    end
    object wwQuery1CUSER3: TStringField
      DisplayLabel = 'CUser3'
      DisplayWidth = 25
      FieldName = 'CUSER3'
      Origin = 'd.cuser3'
      Size = 60
    end
    object wwQuery1ID: TBCDField
      FieldName = 'ID'
      Origin = 'd.id'
      Visible = False
      Size = 0
    end
    object wwQuery1DATE_CREATED: TDateTimeField
      DisplayLabel = 'Created'
      FieldName = 'DATE_CREATED'
      Origin = 'stat1.DATE_CREATED'
    end
    object wwQuery1DATE_LAST_MODIFIED: TDateTimeField
      DisplayLabel = 'Last Modified'
      FieldName = 'DATE_LAST_MODIFIED'
      Origin = 'stat2.DATE_LAST_MODIFIED'
    end
  end
end
