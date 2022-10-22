object FrmUnderRecvCheck: TFrmUnderRecvCheck
  Left = 369
  Top = 228
  ClientHeight = 182
  ClientWidth = 410
  Caption = 'Change Release Qty Based on Undershipment'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 141
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object TwwDataInspector
      Left = 0
      Top = 0
      Width = 410
      Height = 141
      DisableThemes = False
      Align = alClient
      TabOrder = 1
      DataSource = DataSource1
      Items = <
        item
          DataSource = DataSource1
          DataField = 'PONO'
          Caption = 'PO #'
          WordWrap = False
        end
        item
          DataSource = DataSource1
          DataField = 'SEQ'
          Caption = 'PO Line #'
          WordWrap = False
        end
        item
          DataSource = DataSource1
          DataField = 'ITEMNO'
          Caption = 'Item #'
          Items = <
            item
              DataSource = DataSource1
              DataField = 'DESCRIP'
              Caption = 'Item Description'
              WordWrap = False
            end
            item
              DataSource = DataSource1
              DataField = 'REV'
              Caption = 'Rev'
              WordWrap = False
            end
            item
              DataSource = DataSource1
              DataField = 'CLASS'
              Caption = 'Class'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = DataSource1
          DataField = 'QUAN'
          Caption = 'Release Qty'
          WordWrap = False
        end
        item
          DataSource = DataSource1
          DataField = 'LEFT_TO_RECV'
          Caption = 'Left to Receive'
          WordWrap = False
        end
        item
          DataSource = DataSource1
          DataField = 'RECV_QUAN'
          Caption = 'Qty Received ( Undershipment )'
          WordWrap = False
        end>
      DefaultRowHeight = 19
      CaptionWidth = 176
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 141
    Width = 410
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      410
      41)
    object btnOK: TUniButton
      Left = 249
      Top = 9
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'OK'
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnCancel: TUniButton
      Left = 337
      Top = 9
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 338
    Top = 11
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select po.id,'
      '       po.pono,'
      '       d.seq,'
      
        '       decode( d.arinvt_id, null, d.misc_itemno, a.itemno ) as i' +
        'temno,'
      '       a.descrip,'
      '       a.rev,'
      '       a.class,'
      '       x.quan,'
      '       x.left_to_recv,'
      '       x.quan - x.left_to_recv as recv_quan'
      '  from po, '
      '       po_detail d,'
      '       arinvt a,'
      '       ( select x.id,'
      '                x.po_detail_id,'
      '                x.quan, '
      
        '                greatest(0, Least( x.quan, x.cum_quan - NVL(r.qt' +
        'y_received, 0))) left_to_recv'
      '           from c_po_releases x,    '
      '                c_po_receipts_total r'
      '          where'
      '                x.id = :po_releases_id'
      '            and x.po_detail_id = r.po_detail_id(+) ) x'
      ' where '
      '       x.po_detail_id = d.id'
      '   and d.po_id = po.id'
      '   and d.arinvt_id = a.id(+)'
      '   '
      '')
    Left = 339
    Top = 29
    ParamData = <
      item
        Name = 'po_releases_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1ID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object Query1PONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Size = 35
    end
    object Query1SEQ: TBCDField
      DisplayLabel = 'PO Line #'
      FieldName = 'SEQ'
      Size = 0
    end
    object Query1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object Query1DESCRIP: TStringField
      DisplayLabel = 'Item Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object Query1REV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object Query1CLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object Query1QUAN: TBCDField
      DisplayLabel = 'Release Qty'
      FieldName = 'QUAN'
    end
    object Query1LEFT_TO_RECV: TFMTBCDField
      DisplayLabel = 'Left to Receive'
      FieldName = 'LEFT_TO_RECV'
      Size = 38
    end
    object Query1RECV_QUAN: TFMTBCDField
      DisplayLabel = 'Qty Received'
      FieldName = 'RECV_QUAN'
      Size = 38
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMUNDERRECVCHECK'
    Left = 209
    Top = 45
  end
end
