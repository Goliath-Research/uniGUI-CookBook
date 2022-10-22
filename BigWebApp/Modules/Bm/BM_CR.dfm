object FrmShowCashRec: TFrmShowCashRec
  Left = 86
  Top = 213
  ClientHeight = 291
  ClientWidth = 911
  Caption = 'FrmShowCashRec'
  OldCreateOrder = True
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 911
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBToggle: TUniSpeedButton
      Left = 27
      Top = 1
      Width = 25
      Height = 24
      Hint = 'Toggle Grid/Form'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
        FFF07F3FF3FF3FFF3FF70F00F00F000F00F07F773773777377370FFFFFFFFFFF
        FFF07F3FF3FF33FFFFF70F00F00FF00000F07F773773377777F70FEEEEEFF0F9
        FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F737F70F0000FFF0FF
        FCF07F7777F337F337370F0000FFF0FFFFF07F777733373333370FFFFFFFFFFF
        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
        C880733777777777733700000000000000007777777777777777333333333333
        3333333333333333333333333333333333333333333333333333}
      Caption = ''
      ParentColor = False
      Color = clWindow
    end
    object SBSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 24
      Hint = 'Search...'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDDDDDDDD000000DD00
        0DDDD000DDDDDD000000D07E70DD07E70DDDDD000000D0E7E0DD0E7E0DDDDD00
        0000D0FE70DD0FE70DDDDD000000D0EFE0DD0EFE0DDDDD000000D8000D00D000
        8DDDDD000000DD0DDDDDDDDD0DDD0D000000DDD0DDD0DDDDD0DD0D000000DDDD
        0DD0DDDDDD0D0D000000DDDDD0D0DDDDDDD0DD000000DDDDDD0DDDDDDDDDDD00
        0000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      Caption = ''
      ParentColor = False
      Color = clWindow
    end
    object NavHeader: TUniDBNavigator
      Left = 690
      Top = 1
      Width = 221
      Height = 25
      Hint = ''
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 264
    Width = 911
    Height = 27
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object NavDetail: TUniDBNavigator
      Left = 1
      Top = 1
      Width = 221
      Height = 25
      Hint = ''
      DataSource = SrcQryDetail
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
    end
    object Panel4: TUniPanel
      Left = 826
      Top = 1
      Width = 85
      Height = 25
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = 'Panel4'
      object BtnClose: TUniButton
        Left = 5
        Top = 2
        Width = 75
        Height = 23
        Hint = ''
        Caption = '&Close'
        TabOrder = 1
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 27
    Width = 911
    Height = 237
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = 'Panel3'
    object Splitter1: TUniSplitter
      Left = 0
      Top = 120
      Width = 911
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object GridDetail: TUniDBGrid
      Left = 1
      Top = 123
      Width = 909
      Height = 114
      Hint = ''
      DataSource = SrcQryDetail
      ReadOnly = True
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      ParentColor = False
      Color = clBtnFace
      Columns = <
        item
          FieldName = 'AMOUNT_APPLIED'
          Title.Caption = 'Amount Applied'
          Width = 79
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DISCOUNT_APPLIED'
          Title.Caption = 'Disc. Applied'
          Width = 65
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Invoice_No'
          Title.Caption = 'Inv.#'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'InvAcct'
          Title.Caption = 'Inv. Acct'
          Width = 304
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DiscAcct'
          Title.Caption = 'Disc. Acct'
          Width = 304
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object PageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 909
      Height = 120
      Hint = ''
      ActivePage = TabGrid
      TabBarVisible = True
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object TabGrid: TUniTabSheet
        Hint = ''
        TabVisible = False
        Caption = 'TabGrid'
        object GridHeader: TUniDBGrid
          Left = 0
          Top = 0
          Width = 901
          Height = 92
          Hint = ''
          DataSource = SrcQryHeader
          ReadOnly = True
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ParentColor = False
          Color = clBtnFace
          Columns = <
            item
              FieldName = 'REF_NO'
              Title.Caption = 'Ref./Check#'
              Width = 94
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REF_DATE'
              Title.Caption = 'Ref./Check Date'
              Width = 112
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DEPOSIT_DATE'
              Title.Caption = 'Deposit Date'
              Width = 112
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REF_AMOUNT'
              Title.Caption = 'Ref./Check Amount'
              Width = 98
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REF_TYPE'
              Title.Caption = 'Ref./Check Type'
              Width = 94
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CashAcct'
              Title.Caption = 'Cash Acct.'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Customer'
              Title.Caption = 'Customer'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CustNo'
              Title.Caption = 'Cust#'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object TabForm: TUniTabSheet
        Hint = ''
        TabVisible = False
        Caption = 'TabForm'
        object Label1: TUniLabel
          Left = 1
          Top = 8
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Ref./Check#:'
          TabOrder = 8
        end
        object Label2: TUniLabel
          Left = 1
          Top = 35
          Width = 84
          Height = 13
          Hint = ''
          Caption = 'Ref./Check Date:'
          TabOrder = 9
        end
        object Label3: TUniLabel
          Left = 185
          Top = 35
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Deposit Date:'
          TabOrder = 10
        end
        object Label4: TUniLabel
          Left = 1
          Top = 63
          Width = 70
          Height = 13
          Hint = ''
          Caption = 'Cash Account:'
          TabOrder = 11
        end
        object Label5: TUniLabel
          Left = 185
          Top = 8
          Width = 67
          Height = 13
          Hint = ''
          Caption = 'Ref./Check $:'
          TabOrder = 12
        end
        object Label6: TUniLabel
          Left = 367
          Top = 35
          Width = 50
          Height = 13
          Hint = ''
          Caption = 'Customer:'
          TabOrder = 13
        end
        object Label7: TUniLabel
          Left = 367
          Top = 63
          Width = 34
          Height = 13
          Hint = ''
          Caption = 'Cust#:'
          TabOrder = 14
        end
        object Label8: TUniLabel
          Left = 367
          Top = 8
          Width = 28
          Height = 13
          Hint = ''
          Caption = 'Type:'
          TabOrder = 15
        end
        object DBEditRefNo: TUniDBEdit
          Left = 87
          Top = 5
          Width = 52
          Height = 19
          Hint = ''
          DataField = 'REF_NO'
          DataSource = SrcQryHeader
          TabOrder = 0
          Color = clBtnFace
          ReadOnly = True
        end
        object DBEditRefDate: TUniDBEdit
          Left = 87
          Top = 32
          Width = 70
          Height = 19
          Hint = ''
          DataField = 'REF_DATE'
          DataSource = SrcQryHeader
          TabOrder = 1
          Color = clBtnFace
          ReadOnly = True
        end
        object DBEditDepositDate: TUniDBEdit
          Left = 258
          Top = 32
          Width = 70
          Height = 19
          Hint = ''
          DataField = 'DEPOSIT_DATE'
          DataSource = SrcQryHeader
          TabOrder = 4
          Color = clBtnFace
          ReadOnly = True
        end
        object DBEditRefAmount: TUniDBEdit
          Left = 258
          Top = 5
          Width = 70
          Height = 19
          Hint = ''
          DataField = 'REF_AMOUNT'
          DataSource = SrcQryHeader
          TabOrder = 3
          Color = clBtnFace
          ReadOnly = True
        end
        object DBEditCashAcct: TUniDBEdit
          Left = 87
          Top = 60
          Width = 274
          Height = 19
          Hint = ''
          DataField = 'GLACCT_ACCT'
          DataSource = SrcQryHeader
          TabOrder = 2
          Color = clBtnFace
          ReadOnly = True
        end
        object DBEditCustomer: TUniDBEdit
          Left = 415
          Top = 32
          Width = 114
          Height = 19
          Hint = ''
          DataField = 'ARCUSTO_COMPANY'
          DataSource = SrcQryHeader
          TabOrder = 5
          Color = clBtnFace
          ReadOnly = True
        end
        object DBEditCustNo: TUniDBEdit
          Left = 415
          Top = 60
          Width = 52
          Height = 19
          Hint = ''
          DataField = 'ARCUSTO_CUSTNO'
          DataSource = SrcQryHeader
          TabOrder = 6
          Color = clBtnFace
          ReadOnly = True
        end
        object DBEdit1: TUniDBEdit
          Left = 416
          Top = 5
          Width = 114
          Height = 19
          Hint = ''
          DataField = 'REF_TYPE'
          DataSource = SrcQryHeader
          TabOrder = 7
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 176
    object File1: TUniMenuItem
      Caption = '&File'
      object Search1: TUniMenuItem
        Caption = '&Search...'
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = 'About..'
      end
    end
  end
  object SrcQryDetail: TDataSource
    DataSet = QryDetail
    Left = 40
    Top = 187
  end
  object QryDetail: TFDQuery
    MasterSource = SrcQryHeader
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from cashrec_detail where cashrec_id = :ID')
    Left = 56
    Top = 179
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 810000c
      end>
    object QryCashRecDetailCASHREC_ID: TBCDField
      FieldName = 'CASHREC_ID'
      Size = 0
    end
    object QryCashRecDetailARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object QryCashRecDetailARINVOICE_ID: TBCDField
      FieldName = 'ARINVOICE_ID'
      Size = 0
    end
    object QryCashRecDetailAMOUNT_APPLIED: TBCDField
      FieldName = 'AMOUNT_APPLIED'
      currency = True
      Size = 2
    end
    object QryCashRecDetailDISCOUNT_APPLIED: TBCDField
      FieldName = 'DISCOUNT_APPLIED'
      currency = True
      Size = 2
    end
    object QryCashRecDetailGLACCT_ID_DISC: TBCDField
      FieldName = 'GLACCT_ID_DISC'
      Size = 0
    end
    object QryCashRecDetailCustomer: TStringField
      FieldKind = fkLookup
      FieldName = 'Customer'
      LookupKeyFields = 'ID'
      LookupResultField = 'COMPANY'
      KeyFields = 'ARCUSTO_ID'
      Lookup = True
    end
    object QryCashRecDetailCustNo: TStringField
      FieldKind = fkLookup
      FieldName = 'CustNo'
      LookupKeyFields = 'ID'
      LookupResultField = 'CUSTNO'
      KeyFields = 'ARCUSTO_ID'
      Lookup = True
    end
    object QryCashRecDetailInvoice_No: TStringField
      FieldKind = fkLookup
      FieldName = 'Invoice_No'
      LookupKeyFields = 'ID'
      LookupResultField = 'INVOICE_NO'
      KeyFields = 'ARINVOICE_ID'
      Lookup = True
    end
    object QryCashRecDetailInvAcctId: TFloatField
      FieldKind = fkLookup
      FieldName = 'InvAcctId'
      LookupKeyFields = 'ID'
      LookupResultField = 'GLACCT_ID_AR'
      KeyFields = 'ARINVOICE_ID'
      Lookup = True
    end
    object QryCashRecDetailInvAcct: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'InvAcct'
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'InvAcctId'
      Size = 50
      Lookup = True
    end
    object QryCashRecDetailDiscAcct: TStringField
      FieldKind = fkLookup
      FieldName = 'DiscAcct'
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'GLACCT_ID_DISC'
      Size = 50
      Lookup = True
    end
  end
  object SrcQryHeader: TDataSource
    DataSet = QryHeader
    Left = 128
    Top = 163
  end
  object QryHeader: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from cashrec')
    Left = 144
    Top = 168
    object QryCashRecID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryCashRecREF_NO: TStringField
      FieldName = 'REF_NO'
      Size = 15
    end
    object QryCashRecREF_DATE: TDateTimeField
      FieldName = 'REF_DATE'
    end
    object QryCashRecDEPOSIT_DATE: TDateTimeField
      FieldName = 'DEPOSIT_DATE'
    end
    object QryCashRecBANKINFO_DTL_ID: TBCDField
      FieldName = 'BANKINFO_DTL_ID'
      Size = 0
    end
    object QryCashRecGLACCT_ID_CASH: TBCDField
      FieldName = 'GLACCT_ID_CASH'
      Size = 0
    end
    object QryCashRecGLBATCHID_ID: TBCDField
      FieldName = 'GLBATCHID_ID'
      Size = 0
    end
    object QryHeaderARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object QryHeaderREF_TYPE: TStringField
      FieldName = 'REF_TYPE'
      Size = 15
    end
    object QryHeaderREF_AMOUNT: TBCDField
      FieldName = 'REF_AMOUNT'
      currency = True
      Size = 2
    end
    object QryHeaderARCUSTO_COMPANY: TStringField
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'CASHREC.ARCUSTO_COMPANY'
      Size = 60
    end
    object QryHeaderGLACCT_ACCT: TStringField
      FieldName = 'GLACCT_ACCT'
      Origin = 'CASHREC.GLACCT_ACCT'
      Size = 50
    end
    object QryHeaderARCUSTO_CUSTNO: TStringField
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'CASHREC.ARCUSTO_CUSTNO'
      Size = 10
    end
  end
end
