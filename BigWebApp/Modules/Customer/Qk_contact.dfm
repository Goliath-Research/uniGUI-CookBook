inherited FrmQuickAddContact: TFrmQuickAddContact
  Left = 343
  Top = 181
  ClientHeight = 303
  ClientWidth = 318
  Caption = 'Quick Add'
  ActiveControl = dbFirst
  ExplicitWidth = 334
  ExplicitHeight = 342
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 264
    Width = 318
    ExplicitTop = 264
    ExplicitWidth = 318
    inherited Panel2: TUniPanel
      Left = 104
      Width = 214
      ExplicitLeft = 104
      ExplicitWidth = 214
      inherited btnCancel: TUniButton
        Left = 109
        ExplicitLeft = 109
      end
    end
  end
  inherited PageControl1: TUniPageControl
    Width = 318
    Height = 264
    ExplicitWidth = 318
    ExplicitHeight = 264
    inherited TabSheet1: TUniTabSheet
      Caption = 'New Contact'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 310
      ExplicitHeight = 236
      object PnlClient01: TUniPanel
        Left = 0
        Top = 0
        Width = 310
        Height = 236
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 97
          Top = 0
          Width = 6
          Height = 236
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 97
          Height = 234
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
          Height = 234
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            207
            234)
          object dbFirst: TUniDBEdit
            Left = 1
            Top = 1
            Width = 198
            Height = 21
            Hint = ''
            DataField = 'FIRST_NAME'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object dbLast: TUniDBEdit
            Left = 1
            Top = 24
            Width = 198
            Height = 21
            Hint = ''
            DataField = 'LAST_NAME'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object dbSalut: TUniDBEdit
            Left = 1
            Top = 48
            Width = 198
            Height = 21
            Hint = ''
            DataField = 'SALUTATION'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object dbTitle: TUniDBEdit
            Left = 1
            Top = 72
            Width = 198
            Height = 21
            Hint = ''
            DataField = 'TITLE'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object dbPhone: TUniDBEdit
            Left = 1
            Top = 96
            Width = 198
            Height = 21
            Hint = ''
            DataField = 'PHONE_NUMBER'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object dbFax: TUniDBEdit
            Left = 1
            Top = 144
            Width = 198
            Height = 21
            Hint = ''
            DataField = 'FAX_NUMBER'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
          end
          object dbPager: TUniDBEdit
            Left = 1
            Top = 168
            Width = 198
            Height = 21
            Hint = ''
            DataField = 'PAGER'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
          end
          object dbMobile: TUniDBEdit
            Left = 1
            Top = 192
            Width = 198
            Height = 21
            Hint = ''
            DataField = 'MOBILE'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
          end
          object dbEmail: TUniDBEdit
            Left = 1
            Top = 216
            Width = 198
            Height = 21
            Hint = ''
            DataField = 'EMAIL'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 9
          end
          object dbExt: TUniDBEdit
            Left = 1
            Top = 120
            Width = 100
            Height = 21
            Hint = ''
            DataField = 'EXT'
            DataSource = DataSource1
            TabOrder = 5
          end
        end
      end
    end
  end
  inherited Table1: TFDTable
    IndexFieldNames = 'ID'
    UpdateOptions.UpdateTableName = 'CONTACT'
    TableName = 'CONTACT'
    object Table1ID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object Table1ARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Required = True
      Size = 0
    end
    object Table1CONTACT_TYPE: TStringField
      FieldName = 'CONTACT_TYPE'
      Size = 5
    end
    object Table1CONTACT_SEQNO: TBCDField
      FieldName = 'CONTACT_SEQNO'
      Size = 0
    end
    object Table1SALUTATION: TStringField
      FieldName = 'SALUTATION'
      Size = 5
    end
    object Table1LAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object Table1FIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object Table1TITLE: TStringField
      FieldName = 'TITLE'
      Size = 60
    end
    object Table1PHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object Table1EXT: TStringField
      FieldName = 'EXT'
      Size = 5
    end
    object Table1FAX_NUMBER: TStringField
      FieldName = 'FAX_NUMBER'
      Size = 25
    end
    object Table1EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 255
    end
    object Table1PAGER: TStringField
      FieldName = 'PAGER'
      Size = 25
    end
    object Table1CUSER1: TStringField
      FieldName = 'CUSER1'
      Size = 60
    end
    object Table1CUSER2: TStringField
      FieldName = 'CUSER2'
      Size = 60
    end
    object Table1ECODE: TStringField
      FieldName = 'ECODE'
      Size = 10
    end
    object Table1EID: TBCDField
      FieldName = 'EID'
      Size = 0
    end
    object Table1EDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
    end
    object Table1ECOPY: TStringField
      FieldName = 'ECOPY'
      Size = 1
    end
    object Table1USE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      Size = 1
    end
    object Table1MOBILE: TStringField
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
      Size = 30
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
