object FrmCrmAddVendorContact: TFrmCrmAddVendorContact
  Left = 388
  Top = 205
  ClientHeight = 312
  ClientWidth = 333
  Caption = 'Quick Add'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  ActiveControl = dbFirst
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 333
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Panel2: TUniPanel
    Tag = 1999
    Left = 0
    Top = 277
    Width = 333
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 129
      Top = 1
      Width = 204
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 1
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 101
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object PC: TUniPageControl
    Left = 0
    Top = 3
    Width = 333
    Height = 274
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'New Contact'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PnlMain: TUniPanel
        Left = 0
        Top = 0
        Width = 325
        Height = 246
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 109
          Top = 0
          Width = 6
          Height = 246
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
          ExplicitHeight = 249
        end
        object PnlLeft: TUniPanel
          Left = 1
          Top = 1
          Width = 109
          Height = 244
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 8
            Top = 4
            Width = 51
            Height = 13
            Hint = ''
            Caption = 'First Name'
            TabOrder = 1
          end
          object Label2: TUniLabel
            Left = 8
            Top = 28
            Width = 50
            Height = 13
            Hint = ''
            Caption = 'Last Name'
            TabOrder = 2
          end
          object Label5: TUniLabel
            Left = 8
            Top = 52
            Width = 48
            Height = 13
            Hint = ''
            Caption = 'Salutation'
            TabOrder = 3
          end
          object Label6: TUniLabel
            Left = 8
            Top = 76
            Width = 20
            Height = 13
            Hint = ''
            Caption = 'Title'
            TabOrder = 4
          end
          object Label7: TUniLabel
            Left = 8
            Top = 100
            Width = 50
            Height = 13
            Hint = ''
            Caption = 'Telephone'
            TabOrder = 5
          end
          object Label8: TUniLabel
            Left = 8
            Top = 148
            Width = 18
            Height = 13
            Hint = ''
            Caption = 'Fax'
            TabOrder = 6
          end
          object Label10: TUniLabel
            Left = 8
            Top = 172
            Width = 28
            Height = 13
            Hint = ''
            Caption = 'Pager'
            TabOrder = 7
          end
          object Label11: TUniLabel
            Left = 8
            Top = 220
            Width = 24
            Height = 13
            Hint = ''
            Caption = 'Email'
            TabOrder = 8
          end
          object Label12: TUniLabel
            Left = 8
            Top = 124
            Width = 16
            Height = 13
            Hint = ''
            Caption = 'Ext'
            TabOrder = 9
          end
          object Label3: TUniLabel
            Left = 8
            Top = 196
            Width = 70
            Height = 13
            Hint = ''
            Caption = 'Cell Telephone'
            TabOrder = 10
          end
        end
        object PnlClient: TUniPanel
          Left = 112
          Top = 1
          Width = 213
          Height = 244
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            210
            244)
          object dbFirst: TUniDBEdit
            Left = 1
            Top = 1
            Width = 201
            Height = 21
            Hint = ''
            DataField = 'FIRST_NAME'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitWidth = 204
          end
          object dbLast: TUniDBEdit
            Left = 1
            Top = 24
            Width = 201
            Height = 21
            Hint = ''
            DataField = 'LAST_NAME'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ExplicitWidth = 204
          end
          object dbSalut: TUniDBEdit
            Left = 1
            Top = 48
            Width = 201
            Height = 21
            Hint = ''
            DataField = 'SALUTATION'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitWidth = 204
          end
          object dbTitle: TUniDBEdit
            Left = 1
            Top = 72
            Width = 201
            Height = 21
            Hint = ''
            DataField = 'TITLE'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            ExplicitWidth = 204
          end
          object dbPhone: TUniDBEdit
            Left = 1
            Top = 96
            Width = 201
            Height = 21
            Hint = ''
            DataField = 'PHONE_NUMBER'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            ExplicitWidth = 204
          end
          object dbFax: TUniDBEdit
            Left = 1
            Top = 144
            Width = 201
            Height = 21
            Hint = ''
            DataField = 'FAX_NUMBER'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            ExplicitWidth = 204
          end
          object dbPager: TUniDBEdit
            Left = 1
            Top = 168
            Width = 201
            Height = 21
            Hint = ''
            DataField = 'PAGER'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
            ExplicitWidth = 204
          end
          object dbEmail: TUniDBEdit
            Left = 1
            Top = 216
            Width = 201
            Height = 21
            Hint = ''
            DataField = 'EMAIL'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 9
            ExplicitWidth = 204
          end
          object dbExt: TUniDBEdit
            Left = 1
            Top = 120
            Width = 81
            Height = 21
            Hint = ''
            DataField = 'EXT'
            DataSource = Src
            TabOrder = 5
          end
          object dbeMobile: TUniDBEdit
            Left = 1
            Top = 192
            Width = 201
            Height = 21
            Hint = ''
            DataField = 'MOBILE'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
            ExplicitWidth = 204
          end
        end
      end
    end
  end
  object Src: TDataSource
    DataSet = TblContact
    Left = 236
    Top = 75
  end
  object TblContact: TFDTable
    BeforePost = TblContactBeforePost
    OnNewRecord = TblContactNewRecord
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'VENDOR_CONTACT'
    TableName = 'VENDOR_CONTACT'
    Left = 248
    Top = 88
    object TblContactID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblContactVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Required = True
      Size = 0
    end
    object TblContactCONTACT_TYPE: TStringField
      FieldName = 'CONTACT_TYPE'
      FixedChar = True
      Size = 5
    end
    object TblContactCONTACT_SEQNO: TBCDField
      FieldName = 'CONTACT_SEQNO'
      Size = 0
    end
    object TblContactSALUTATION: TStringField
      FieldName = 'SALUTATION'
      FixedChar = True
      Size = 5
    end
    object TblContactLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      FixedChar = True
      Size = 30
    end
    object TblContactFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      FixedChar = True
      Size = 30
    end
    object TblContactTITLE: TStringField
      FieldName = 'TITLE'
      FixedChar = True
      Size = 60
    end
    object TblContactPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object TblContactEXT: TStringField
      FieldName = 'EXT'
      FixedChar = True
      Size = 5
    end
    object TblContactFAX_NUMBER: TStringField
      FieldName = 'FAX_NUMBER'
      Size = 25
    end
    object TblContactEMAIL: TStringField
      FieldName = 'EMAIL'
      FixedChar = True
      Size = 250
    end
    object TblContactPAGER: TStringField
      FieldName = 'PAGER'
      FixedChar = True
      Size = 25
    end
    object TblContactCUSER1: TStringField
      FieldName = 'CUSER1'
      Size = 60
    end
    object TblContactCUSER2: TStringField
      FieldName = 'CUSER2'
      Size = 60
    end
    object TblContactECOPY: TStringField
      FieldName = 'ECOPY'
      FixedChar = True
      Size = 1
    end
    object TblContactUSE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      FixedChar = True
      Size = 1
    end
    object TblContactWEB_USERID: TStringField
      FieldName = 'WEB_USERID'
      Size = 35
    end
    object TblContactMOBILE: TStringField
      FieldName = 'MOBILE'
      Size = 25
    end
  end
  object QryVendor: TFDQuery
    BeforeOpen = QryVendorBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '      id,'
      '      phone_number,'
      '      fax_number,'
      '      NVL( use_usa_mask, '#39'N'#39' ) as use_usa_mask'
      'from v_vendor where id = :id'
      ' ')
    Left = 244
    Top = 144
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryVendorID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryVendorPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object QryVendorFAX_NUMBER: TStringField
      FieldName = 'FAX_NUMBER'
      Size = 25
    end
    object QryVendorUSE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      Size = 1
    end
  end
end
