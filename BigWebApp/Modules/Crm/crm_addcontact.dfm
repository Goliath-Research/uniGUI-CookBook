object FrmCrmAddContact: TFrmCrmAddContact
  Left = 388
  Top = 205
  ClientHeight = 303
  ClientWidth = 318
  Caption = 'Quick Add'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 318
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
    Top = 268
    Width = 318
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 106
      Top = 1
      Width = 212
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 5
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
        Left = 109
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
    Width = 318
    Height = 265
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'New Contact'
      object PnlClient01: TUniPanel
        Left = 0
        Top = 0
        Width = 310
        Height = 237
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 97
          Top = 0
          Width = 6
          Height = 237
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 97
          Height = 235
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
          object lblMobile: TUniLabel
            Left = 8
            Top = 196
            Width = 70
            Height = 13
            Hint = ''
            Caption = 'Cell Telephone'
            TabOrder = 8
          end
          object Label11: TUniLabel
            Left = 8
            Top = 220
            Width = 24
            Height = 13
            Hint = ''
            Caption = 'Email'
            TabOrder = 9
          end
          object Label12: TUniLabel
            Left = 8
            Top = 124
            Width = 47
            Height = 13
            Hint = ''
            Caption = 'Extension'
            TabOrder = 10
          end
        end
        object PnlClient02: TUniPanel
          Left = 103
          Top = 1
          Width = 207
          Height = 235
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            207
            235)
          object dbFirst: TUniDBEdit
            Left = 1
            Top = 1
            Width = 194
            Height = 25
            Hint = ''
            DataField = 'FIRST_NAME'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object dbLast: TUniDBEdit
            Left = 1
            Top = 24
            Width = 194
            Height = 25
            Hint = ''
            DataField = 'LAST_NAME'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object dbSalut: TUniDBEdit
            Left = 1
            Top = 48
            Width = 194
            Height = 25
            Hint = ''
            DataField = 'SALUTATION'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object dbTitle: TUniDBEdit
            Left = 1
            Top = 72
            Width = 194
            Height = 25
            Hint = ''
            DataField = 'TITLE'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object dbPhone: TUniDBEdit
            Left = 1
            Top = 96
            Width = 194
            Height = 25
            Hint = ''
            DataField = 'PHONE_NUMBER'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object dbFax: TUniDBEdit
            Left = 1
            Top = 144
            Width = 194
            Height = 25
            Hint = ''
            DataField = 'FAX_NUMBER'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
          end
          object dbPager: TUniDBEdit
            Left = 1
            Top = 168
            Width = 194
            Height = 25
            Hint = ''
            DataField = 'PAGER'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
          end
          object dbMobile: TUniDBEdit
            Left = 1
            Top = 192
            Width = 194
            Height = 25
            Hint = ''
            DataField = 'MOBILE'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
          end
          object dbEmail: TUniDBEdit
            Left = 1
            Top = 216
            Width = 194
            Height = 25
            Hint = ''
            DataField = 'EMAIL'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 9
          end
          object dbExt: TUniDBEdit
            Left = 1
            Top = 120
            Width = 100
            Height = 25
            Hint = ''
            DataField = 'EXT'
            DataSource = Src
            TabOrder = 5
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
    UpdateOptions.UpdateTableName = 'CONTACT'
    TableName = 'CONTACT'
    Left = 248
    Top = 88
    object TblContactID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblContactARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Required = True
      Size = 0
    end
    object TblContactCONTACT_TYPE: TStringField
      FieldName = 'CONTACT_TYPE'
      Size = 5
    end
    object TblContactCONTACT_SEQNO: TBCDField
      FieldName = 'CONTACT_SEQNO'
      Size = 0
    end
    object TblContactSALUTATION: TStringField
      FieldName = 'SALUTATION'
      Size = 5
    end
    object TblContactLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object TblContactFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object TblContactTITLE: TStringField
      FieldName = 'TITLE'
      Size = 60
    end
    object TblContactPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object TblContactEXT: TStringField
      FieldName = 'EXT'
      Size = 5
    end
    object TblContactFAX_NUMBER: TStringField
      FieldName = 'FAX_NUMBER'
      Size = 25
    end
    object TblContactEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 250
    end
    object TblContactPAGER: TStringField
      FieldName = 'PAGER'
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
    object TblContactECODE: TStringField
      FieldName = 'ECODE'
      Size = 10
    end
    object TblContactUSE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      Size = 1
    end
    object TblContactMOBILE: TStringField
      FieldName = 'MOBILE'
      Size = 25
    end
  end
  object QryArcusto: TFDQuery
    BeforeOpen = QryArcustoBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from arcusto where id = :id')
    Left = 244
    Top = 144
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArcustoCUSTNO: TStringField
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      Size = 10
    end
    object QryArcustoCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
    object QryArcustoADDR1: TStringField
      FieldName = 'ADDR1'
      Origin = 'ARCUSTO.ADDR1'
      Size = 60
    end
    object QryArcustoADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'ARCUSTO.ADDR2'
      Size = 60
    end
    object QryArcustoADDR3: TStringField
      FieldName = 'ADDR3'
      Origin = 'ARCUSTO.ADDR3'
      Size = 60
    end
    object QryArcustoCITY: TStringField
      FieldName = 'CITY'
      Origin = 'ARCUSTO.CITY'
      Size = 30
    end
    object QryArcustoSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'ARCUSTO.STATE'
    end
    object QryArcustoCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'ARCUSTO.COUNTRY'
      Size = 100
    end
    object QryArcustoZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ARCUSTO.ZIP'
      Size = 10
    end
    object QryArcustoPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Origin = 'ARCUSTO.PHONE_NUMBER'
      Size = 25
    end
    object QryArcustoEXT: TStringField
      FieldName = 'EXT'
      Origin = 'ARCUSTO.EXT'
      Size = 5
    end
    object QryArcustoFAX_NUMBER: TStringField
      FieldName = 'FAX_NUMBER'
      Origin = 'ARCUSTO.FAX_NUMBER'
      Size = 25
    end
    object QryArcustoUSE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      Origin = 'ARCUSTO.USE_USA_MASK'
      Size = 1
    end
  end
end
