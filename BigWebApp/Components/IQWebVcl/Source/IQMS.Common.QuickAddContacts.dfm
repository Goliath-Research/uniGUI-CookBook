inherited QuickAddContacts: TQuickAddContacts
  ClientHeight = 277
  ClientWidth = 327
  Caption = 'Quick Add Contact'
  ExplicitWidth = 343
  ExplicitHeight = 316
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 238
    Width = 327
    ExplicitTop = 238
    ExplicitWidth = 327
    inherited Panel2: TUniPanel
      Left = 121
      ExplicitLeft = 121
    end
  end
  inherited PageControl1: TUniPageControl
    Width = 327
    Height = 238
    ExplicitWidth = 327
    ExplicitHeight = 238
    inherited TabSheet1: TUniTabSheet
      ExplicitWidth = 319
      ExplicitHeight = 210
      object Label1: TUniLabel
        Left = 5
        Top = 8
        Width = 51
        Height = 13
        Hint = ''
        Caption = 'First Name'
        TabOrder = 9
      end
      object Label2: TUniLabel
        Left = 5
        Top = 31
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Last Name'
        TabOrder = 10
      end
      object Label5: TUniLabel
        Left = 5
        Top = 54
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Salutation'
        TabOrder = 11
      end
      object Label6: TUniLabel
        Left = 5
        Top = 77
        Width = 20
        Height = 13
        Hint = ''
        Caption = 'Title'
        TabOrder = 12
      end
      object Label7: TUniLabel
        Left = 5
        Top = 100
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Telephone'
        TabOrder = 13
      end
      object Label8: TUniLabel
        Left = 5
        Top = 123
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'Fax'
        TabOrder = 14
      end
      object Label10: TUniLabel
        Left = 5
        Top = 146
        Width = 28
        Height = 13
        Hint = ''
        Caption = 'Pager'
        TabOrder = 15
      end
      object Label11: TUniLabel
        Left = 5
        Top = 169
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'Email'
        TabOrder = 16
      end
      object Label12: TUniLabel
        Left = 220
        Top = 100
        Width = 16
        Height = 13
        Hint = ''
        Caption = 'Ext'
        Anchors = [akTop, akRight]
        TabOrder = 17
      end
      object dbFirst: TUniDBEdit
        Left = 72
        Top = 4
        Width = 138
        Height = 21
        Hint = ''
        DataField = 'FIRST_NAME'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object dbLast: TUniDBEdit
        Left = 72
        Top = 27
        Width = 138
        Height = 21
        Hint = ''
        DataField = 'LAST_NAME'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object dbSalut: TUniDBEdit
        Left = 72
        Top = 50
        Width = 138
        Height = 21
        Hint = ''
        DataField = 'SALUTATION'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object dbTitle: TUniDBEdit
        Left = 72
        Top = 73
        Width = 138
        Height = 21
        Hint = ''
        DataField = 'TITLE'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object dbPhone: TUniDBEdit
        Left = 72
        Top = 96
        Width = 138
        Height = 21
        Hint = ''
        DataField = 'PHONE_NUMBER'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object dbFax: TUniDBEdit
        Left = 72
        Top = 119
        Width = 138
        Height = 21
        Hint = ''
        DataField = 'FAX_NUMBER'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
      end
      object dbPager: TUniDBEdit
        Left = 72
        Top = 142
        Width = 138
        Height = 21
        Hint = ''
        DataField = 'PAGER'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      object dbEmail: TUniDBEdit
        Left = 72
        Top = 165
        Width = 234
        Height = 21
        Hint = ''
        DataField = 'EMAIL'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
      end
      object dbExt: TUniDBEdit
        Left = 249
        Top = 96
        Width = 58
        Height = 21
        Hint = ''
        DataField = 'EXT'
        DataSource = DataSource1
        Anchors = [akTop, akRight]
        TabOrder = 8
      end
    end
  end
  inherited Table1: TFDTable
    UpdateOptions.UpdateTableName = 'CONTACT'
    TableName = 'CONTACT'
  end
end
