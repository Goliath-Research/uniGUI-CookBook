object FrmQuantumView: TFrmQuantumView
  Left = 285
  Top = 249
  ClientHeight = 276
  ClientWidth = 699
  Caption = 'Quantum View'#174' Notify Recipients'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 699
    Height = 276
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pnlTop: TUniPanel
      Left = 1
      Top = 1
      Width = 697
      Height = 169
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object grpRecipients: TUniGroupBox
        Left = 1
        Top = 1
        Width = 695
        Height = 167
        Hint = ''
        Caption = 'Recipients'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitWidth = 699
        object Label1: TUniLabel
          Left = 16
          Top = 30
          Width = 92
          Height = 13
          Hint = ''
          Caption = 'Company or Name:'
          TabOrder = 17
        end
        object Label2: TUniLabel
          Left = 184
          Top = 30
          Width = 72
          Height = 13
          Hint = ''
          Caption = 'Contact Name:'
          TabOrder = 18
        end
        object Label3: TUniLabel
          Left = 352
          Top = 30
          Width = 70
          Height = 13
          Hint = ''
          Caption = 'Email Address:'
          TabOrder = 19
        end
        object grpTypes: TUniGroupBox
          Left = 513
          Top = 15
          Width = 182
          Height = 150
          Hint = ''
          Caption = 'Notification Types'
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 15
          object lblShip: TUniLabel
            Left = 8
            Top = 16
            Width = 20
            Height = 13
            Hint = ''
            Caption = 'Ship'
            TabOrder = 21
          end
          object Label9: TUniLabel
            Left = 40
            Top = 16
            Width = 47
            Height = 13
            Hint = ''
            Caption = 'Exception'
            TabOrder = 22
          end
          object Label10: TUniLabel
            Left = 90
            Top = 16
            Width = 39
            Height = 13
            Hint = ''
            Caption = 'Delivery'
            TabOrder = 23
          end
          object lblInTransit: TUniLabel
            Left = 134
            Top = 16
            Width = 47
            Height = 13
            Hint = ''
            Caption = 'In-Transit'
            TabOrder = 24
          end
          object chkShip1: TUniDBCheckBox
            Left = 16
            Top = 32
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'SHIP1'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 0
          end
          object chkShip2: TUniDBCheckBox
            Left = 16
            Top = 56
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'SHIP2'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 4
          end
          object chkShip3: TUniDBCheckBox
            Left = 16
            Top = 80
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'SHIP3'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 8
          end
          object chkShip4: TUniDBCheckBox
            Left = 16
            Top = 104
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'SHIP4'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 12
          end
          object chkShip5: TUniDBCheckBox
            Left = 16
            Top = 128
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'SHIP5'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 16
          end
          object chkException2: TUniDBCheckBox
            Left = 60
            Top = 56
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'EXCEPTION2'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 5
          end
          object chkException4: TUniDBCheckBox
            Left = 60
            Top = 104
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'EXCEPTION4'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 13
          end
          object chkException5: TUniDBCheckBox
            Left = 60
            Top = 128
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'EXCEPTION5'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 17
          end
          object chkException1: TUniDBCheckBox
            Left = 60
            Top = 32
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'EXCEPTION1'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 1
          end
          object chkException3: TUniDBCheckBox
            Left = 60
            Top = 80
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'EXCEPTION3'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 9
          end
          object chkDelivery2: TUniDBCheckBox
            Left = 104
            Top = 56
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'DELIVERY2'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 6
          end
          object chkDelivery4: TUniDBCheckBox
            Left = 104
            Top = 104
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'DELIVERY4'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 14
          end
          object chkDelivery5: TUniDBCheckBox
            Left = 104
            Top = 127
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'DELIVERY5'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 18
          end
          object chkDelivery1: TUniDBCheckBox
            Left = 104
            Top = 32
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'DELIVERY1'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 2
          end
          object chkDelivery3: TUniDBCheckBox
            Left = 104
            Top = 80
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'DELIVERY3'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 10
          end
          object chkTransit1: TUniDBCheckBox
            Left = 148
            Top = 32
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'INTRANSIT1'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 3
          end
          object chkTransit2: TUniDBCheckBox
            Left = 148
            Top = 56
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'INTRANSIT2'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 7
          end
          object chkTransit3: TUniDBCheckBox
            Left = 148
            Top = 80
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'INTRANSIT3'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 11
          end
          object chkTransit4: TUniDBCheckBox
            Left = 148
            Top = 104
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'INTRANSIT4'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 15
          end
          object chkTransit5: TUniDBCheckBox
            Left = 148
            Top = 127
            Width = 17
            Height = 17
            Hint = ''
            DataField = 'INTRANSIT5'
            DataSource = srcQuantumView
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 19
          end
        end
        object dbeCompany1: TUniDBEdit
          Left = 16
          Top = 46
          Width = 161
          Height = 21
          Hint = ''
          DataField = 'COMPANY1'
          DataSource = srcQuantumView
          TabOrder = 0
        end
        object dbeContact1: TUniDBEdit
          Left = 184
          Top = 46
          Width = 161
          Height = 21
          Hint = ''
          DataField = 'CONTACT1'
          DataSource = srcQuantumView
          TabOrder = 1
        end
        object dbeContact5: TUniDBEdit
          Left = 184
          Top = 142
          Width = 161
          Height = 21
          Hint = ''
          DataField = 'CONTACT5'
          DataSource = srcQuantumView
          TabOrder = 13
        end
        object dbeContact4: TUniDBEdit
          Left = 184
          Top = 118
          Width = 161
          Height = 21
          Hint = ''
          DataField = 'CONTACT4'
          DataSource = srcQuantumView
          TabOrder = 10
        end
        object dbeContact3: TUniDBEdit
          Left = 184
          Top = 94
          Width = 161
          Height = 21
          Hint = ''
          DataField = 'CONTACT3'
          DataSource = srcQuantumView
          TabOrder = 7
        end
        object dbeContact2: TUniDBEdit
          Left = 184
          Top = 70
          Width = 161
          Height = 21
          Hint = ''
          DataField = 'CONTACT2'
          DataSource = srcQuantumView
          TabOrder = 4
        end
        object dbeCompany5: TUniDBEdit
          Left = 16
          Top = 142
          Width = 161
          Height = 21
          Hint = ''
          DataField = 'COMPANY5'
          DataSource = srcQuantumView
          TabOrder = 12
        end
        object dbeCompany4: TUniDBEdit
          Left = 16
          Top = 118
          Width = 161
          Height = 21
          Hint = ''
          DataField = 'COMPANY4'
          DataSource = srcQuantumView
          TabOrder = 9
        end
        object dbeCompany3: TUniDBEdit
          Left = 16
          Top = 94
          Width = 161
          Height = 21
          Hint = ''
          DataField = 'COMPANY3'
          DataSource = srcQuantumView
          TabOrder = 6
        end
        object dbeCompany2: TUniDBEdit
          Left = 16
          Top = 70
          Width = 161
          Height = 21
          Hint = ''
          DataField = 'COMPANY2'
          DataSource = srcQuantumView
          TabOrder = 3
        end
        object dbeEmail1: TUniEdit
          Left = 351
          Top = 46
          Width = 161
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 2
        end
        object dbeEmail2: TUniEdit
          Left = 351
          Top = 70
          Width = 161
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 5
        end
        object dbeEmail3: TUniEdit
          Left = 351
          Top = 94
          Width = 161
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 8
        end
        object dbeEmail4: TUniEdit
          Left = 351
          Top = 118
          Width = 161
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 11
        end
        object dbeEmail5: TUniEdit
          Left = 351
          Top = 142
          Width = 161
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 14
        end
      end
    end
    object pnlBottom: TUniPanel
      Left = 1
      Top = 169
      Width = 697
      Height = 107
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object pnlButtons: TUniPanel
        Left = 545
        Top = 1
        Width = 152
        Height = 105
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object btnOK: TUniButton
          Left = 40
          Top = 16
          Width = 75
          Height = 25
          Hint = ''
          Caption = 'OK'
          ModalResult = 1
          TabOrder = 1
        end
        object btnCancel: TUniButton
          Left = 40
          Top = 56
          Width = 75
          Height = 25
          Hint = ''
          Caption = 'Cancel'
          ModalResult = 2
          TabOrder = 2
          OnClick = btnCancelClick
        end
      end
      object grpOptions: TUniGroupBox
        Left = 1
        Top = 1
        Width = 545
        Height = 105
        Hint = ''
        Caption = 'General Options'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitWidth = 547
        object Label4: TUniLabel
          Left = 16
          Top = 24
          Width = 142
          Height = 13
          Hint = ''
          Caption = 'Ship From Company or Name:'
          TabOrder = 5
        end
        object Label5: TUniLabel
          Left = 184
          Top = 24
          Width = 101
          Height = 13
          Hint = ''
          Caption = 'Failed Email Address:'
          TabOrder = 6
        end
        object Label6: TUniLabel
          Left = 352
          Top = 24
          Width = 62
          Height = 13
          Hint = ''
          Caption = 'Subject Line:'
          TabOrder = 7
        end
        object Label7: TUniLabel
          Left = 16
          Top = 64
          Width = 32
          Height = 13
          Hint = ''
          Caption = 'Memo:'
          TabOrder = 8
        end
        object dbeShipFrom: TUniDBEdit
          Left = 16
          Top = 40
          Width = 161
          Height = 21
          Hint = ''
          DataField = 'SHIP_FROM_NAME'
          DataSource = srcQuantumView
          TabOrder = 0
        end
        object dbeMemo: TUniDBEdit
          Left = 16
          Top = 80
          Width = 489
          Height = 21
          Hint = ''
          DataField = 'MEMO'
          DataSource = srcQuantumView
          TabOrder = 3
        end
        object dbeFailEmail: TUniDBEdit
          Left = 184
          Top = 40
          Width = 161
          Height = 21
          Hint = ''
          DataField = 'FAIL_EMAIL'
          DataSource = srcQuantumView
          TabOrder = 1
        end
        object cmbSubject: TUniDBComboBox
          Left = 352
          Top = 40
          Width = 153
          Height = 21
          Hint = ''
          DataField = 'SUBJECT_TYPE'
          DataSource = srcQuantumView
          Items.Strings = (
            'Tracking Number'#9'0'
            'Reference Number 1'#9'1'
            'Reference Number 2'#9'2')
          TabOrder = 2
        end
      end
    end
  end
  object qryQuantumView: TFDQuery
    BeforeOpen = qryQuantumViewBeforeOpen
    BeforePost = qryQuantumViewBeforePost
    AfterPost = qryQuantumViewAfterPost
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateObject = UpdateSQLPkgQuantumView
    SQL.Strings = (
      'select *'
      'from ups_quantum_view'
      'where id = :ID')
    Left = 456
    Top = 200
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object qryQuantumViewID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.UPS_QUANTUM_VIEW.ID'
      Size = 0
    end
    object qryQuantumViewSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'IQ.UPS_QUANTUM_VIEW.SOURCE'
      Size = 50
    end
    object qryQuantumViewSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.UPS_QUANTUM_VIEW.SOURCE_ID'
      Size = 0
    end
    object qryQuantumViewSHIP_FROM_NAME: TStringField
      FieldName = 'SHIP_FROM_NAME'
      Origin = 'IQ.UPS_QUANTUM_VIEW.SHIP_FROM_NAME'
      Size = 60
    end
    object qryQuantumViewFAIL_EMAIL: TStringField
      FieldName = 'FAIL_EMAIL'
      Origin = 'IQ.UPS_QUANTUM_VIEW.FAIL_EMAIL'
      Size = 60
    end
    object qryQuantumViewSUBJECT_TYPE: TBCDField
      FieldName = 'SUBJECT_TYPE'
      Origin = 'IQ.UPS_QUANTUM_VIEW.SUBJECT_TYPE'
      Size = 0
    end
    object qryQuantumViewSUBJECT: TStringField
      FieldName = 'SUBJECT'
      Origin = 'IQ.UPS_QUANTUM_VIEW.SUBJECT'
      Size = 60
    end
    object qryQuantumViewMEMO: TStringField
      FieldName = 'MEMO'
      Origin = 'IQ.UPS_QUANTUM_VIEW.MEMO'
      Size = 150
    end
    object qryQuantumViewCOMPANY1: TStringField
      FieldName = 'COMPANY1'
      Origin = 'IQ.UPS_QUANTUM_VIEW.COMPANY1'
      Size = 60
    end
    object qryQuantumViewCONTACT1: TStringField
      FieldName = 'CONTACT1'
      Origin = 'IQ.UPS_QUANTUM_VIEW.CONTACT1'
      Size = 60
    end
    object qryQuantumViewEMAIL1: TStringField
      FieldName = 'EMAIL1'
      Origin = 'IQ.UPS_QUANTUM_VIEW.EMAIL1'
      Size = 60
    end
    object qryQuantumViewSHIP1: TStringField
      FieldName = 'SHIP1'
      Origin = 'IQ.UPS_QUANTUM_VIEW.SHIP1'
      Size = 1
    end
    object qryQuantumViewEXCEPTION1: TStringField
      FieldName = 'EXCEPTION1'
      Origin = 'IQ.UPS_QUANTUM_VIEW.EXCEPTION1'
      Size = 1
    end
    object qryQuantumViewDELIVERY1: TStringField
      FieldName = 'DELIVERY1'
      Origin = 'IQ.UPS_QUANTUM_VIEW.DELIVERY1'
      Size = 1
    end
    object qryQuantumViewCOMPANY2: TStringField
      FieldName = 'COMPANY2'
      Origin = 'IQ.UPS_QUANTUM_VIEW.COMPANY2'
      Size = 60
    end
    object qryQuantumViewCONTACT2: TStringField
      FieldName = 'CONTACT2'
      Origin = 'IQ.UPS_QUANTUM_VIEW.CONTACT2'
      Size = 60
    end
    object qryQuantumViewEMAIL2: TStringField
      FieldName = 'EMAIL2'
      Origin = 'IQ.UPS_QUANTUM_VIEW.EMAIL2'
      Size = 60
    end
    object qryQuantumViewSHIP2: TStringField
      FieldName = 'SHIP2'
      Origin = 'IQ.UPS_QUANTUM_VIEW.SHIP2'
      Size = 1
    end
    object qryQuantumViewEXCEPTION2: TStringField
      FieldName = 'EXCEPTION2'
      Origin = 'IQ.UPS_QUANTUM_VIEW.EXCEPTION2'
      Size = 1
    end
    object qryQuantumViewDELIVERY2: TStringField
      FieldName = 'DELIVERY2'
      Origin = 'IQ.UPS_QUANTUM_VIEW.DELIVERY2'
      Size = 1
    end
    object qryQuantumViewCOMPANY3: TStringField
      FieldName = 'COMPANY3'
      Origin = 'IQ.UPS_QUANTUM_VIEW.COMPANY3'
      Size = 60
    end
    object qryQuantumViewCONTACT3: TStringField
      FieldName = 'CONTACT3'
      Origin = 'IQ.UPS_QUANTUM_VIEW.CONTACT3'
      Size = 60
    end
    object qryQuantumViewEMAIL3: TStringField
      FieldName = 'EMAIL3'
      Origin = 'IQ.UPS_QUANTUM_VIEW.EMAIL3'
      Size = 60
    end
    object qryQuantumViewSHIP3: TStringField
      FieldName = 'SHIP3'
      Origin = 'IQ.UPS_QUANTUM_VIEW.SHIP3'
      Size = 1
    end
    object qryQuantumViewEXCEPTION3: TStringField
      FieldName = 'EXCEPTION3'
      Origin = 'IQ.UPS_QUANTUM_VIEW.EXCEPTION3'
      Size = 1
    end
    object qryQuantumViewDELIVERY3: TStringField
      FieldName = 'DELIVERY3'
      Origin = 'IQ.UPS_QUANTUM_VIEW.DELIVERY3'
      Size = 1
    end
    object qryQuantumViewCOMPANY4: TStringField
      FieldName = 'COMPANY4'
      Origin = 'IQ.UPS_QUANTUM_VIEW.COMPANY4'
      Size = 60
    end
    object qryQuantumViewCONTACT4: TStringField
      FieldName = 'CONTACT4'
      Origin = 'IQ.UPS_QUANTUM_VIEW.CONTACT4'
      Size = 60
    end
    object qryQuantumViewEMAIL4: TStringField
      FieldName = 'EMAIL4'
      Origin = 'IQ.UPS_QUANTUM_VIEW.EMAIL4'
      Size = 60
    end
    object qryQuantumViewSHIP4: TStringField
      FieldName = 'SHIP4'
      Origin = 'IQ.UPS_QUANTUM_VIEW.SHIP4'
      Size = 1
    end
    object qryQuantumViewEXCEPTION4: TStringField
      FieldName = 'EXCEPTION4'
      Origin = 'IQ.UPS_QUANTUM_VIEW.EXCEPTION4'
      Size = 1
    end
    object qryQuantumViewDELIVERY4: TStringField
      FieldName = 'DELIVERY4'
      Origin = 'IQ.UPS_QUANTUM_VIEW.DELIVERY4'
      Size = 1
    end
    object qryQuantumViewCOMPANY5: TStringField
      FieldName = 'COMPANY5'
      Origin = 'IQ.UPS_QUANTUM_VIEW.COMPANY5'
      Size = 60
    end
    object qryQuantumViewCONTACT5: TStringField
      FieldName = 'CONTACT5'
      Origin = 'IQ.UPS_QUANTUM_VIEW.CONTACT5'
      Size = 60
    end
    object qryQuantumViewEMAIL5: TStringField
      FieldName = 'EMAIL5'
      Origin = 'IQ.UPS_QUANTUM_VIEW.EMAIL5'
      Size = 60
    end
    object qryQuantumViewSHIP5: TStringField
      FieldName = 'SHIP5'
      Origin = 'IQ.UPS_QUANTUM_VIEW.SHIP5'
      Size = 1
    end
    object qryQuantumViewEXCEPTION5: TStringField
      FieldName = 'EXCEPTION5'
      Origin = 'IQ.UPS_QUANTUM_VIEW.EXCEPTION5'
      Size = 1
    end
    object qryQuantumViewDELIVERY5: TStringField
      FieldName = 'DELIVERY5'
      Origin = 'IQ.UPS_QUANTUM_VIEW.DELIVERY5'
      Size = 1
    end
    object qryQuantumViewRETURN: TStringField
      FieldName = 'RETURN'
      Origin = 'IQ.UPS_QUANTUM_VIEW.RETURN'
      Size = 1
    end
    object qryQuantumViewINTRANSIT1: TStringField
      FieldName = 'INTRANSIT1'
      Origin = 'IQ.UPS_QUANTUM_VIEW.INTRANSIT1'
      Size = 1
    end
    object qryQuantumViewINTRANSIT2: TStringField
      FieldName = 'INTRANSIT2'
      Origin = 'IQ.UPS_QUANTUM_VIEW.INTRANSIT2'
      Size = 1
    end
    object qryQuantumViewINTRANSIT3: TStringField
      FieldName = 'INTRANSIT3'
      Origin = 'IQ.UPS_QUANTUM_VIEW.INTRANSIT3'
      Size = 1
    end
    object qryQuantumViewINTRANSIT4: TStringField
      FieldName = 'INTRANSIT4'
      Origin = 'IQ.UPS_QUANTUM_VIEW.INTRANSIT4'
      Size = 1
    end
    object qryQuantumViewINTRANSIT5: TStringField
      FieldName = 'INTRANSIT5'
      Origin = 'IQ.UPS_QUANTUM_VIEW.INTRANSIT5'
      Size = 1
    end
  end
  object srcQuantumView: TDataSource
    DataSet = qryQuantumView
    Left = 480
    Top = 216
  end
  object UpdateSQLPkgQuantumView: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ups_quantum_view'
      
        '  (ID, SOURCE, SOURCE_ID, SHIP_FROM_NAME, FAIL_EMAIL, SUBJECT_TY' +
        'PE, '
      'SUBJECT, '
      
        '   MEMO, COMPANY1, CONTACT1, EMAIL1, SHIP1, EXCEPTION1, DELIVERY' +
        '1, '
      'COMPANY2, '
      '   CONTACT2, EMAIL2, SHIP2, EXCEPTION2, DELIVERY2, COMPANY3, '
      'CONTACT3, '
      
        '   EMAIL3, SHIP3, EXCEPTION3, DELIVERY3, COMPANY4, CONTACT4, EMA' +
        'IL4, '
      'SHIP4, '
      '   EXCEPTION4, DELIVERY4, COMPANY5, CONTACT5, EMAIL5, SHIP5, '
      'EXCEPTION5, '
      
        '   DELIVERY5, INTRANSIT1, INTRANSIT2, INTRANSIT3, INTRANSIT4, IN' +
        'TRANSIT5)'
      'values'
      '  (:ID, :SOURCE, :SOURCE_ID, :SHIP_FROM_NAME, :FAIL_EMAIL, '
      ':SUBJECT_TYPE, '
      
        '   :SUBJECT, :MEMO, :COMPANY1, :CONTACT1, :EMAIL1, :SHIP1, :EXCE' +
        'PTION1, '
      
        '   :DELIVERY1, :COMPANY2, :CONTACT2, :EMAIL2, :SHIP2, :EXCEPTION' +
        '2, '
      ':DELIVERY2, '
      
        '   :COMPANY3, :CONTACT3, :EMAIL3, :SHIP3, :EXCEPTION3, :DELIVERY' +
        '3, '
      ':COMPANY4, '
      
        '   :CONTACT4, :EMAIL4, :SHIP4, :EXCEPTION4, :DELIVERY4, :COMPANY' +
        '5, '
      ':CONTACT5, '
      
        '   :EMAIL5, :SHIP5, :EXCEPTION5, :DELIVERY5, :INTRANSIT1,:INTRAN' +
        'SIT2:INTRANSIT3:INTRANSIT4:INTRANSIT5)')
    ModifySQL.Strings = (
      'update ups_quantum_view'
      'set'
      '  SOURCE = :SOURCE,'
      '  SOURCE_ID = :SOURCE_ID,'
      '  SHIP_FROM_NAME = :SHIP_FROM_NAME,'
      '  FAIL_EMAIL = :FAIL_EMAIL,'
      '  SUBJECT_TYPE = :SUBJECT_TYPE,'
      '  SUBJECT = :SUBJECT,'
      '  MEMO = :MEMO,'
      '  COMPANY1 = :COMPANY1,'
      '  CONTACT1 = :CONTACT1,'
      '  EMAIL1 = :EMAIL1,'
      '  SHIP1 = :SHIP1,'
      '  EXCEPTION1 = :EXCEPTION1,'
      '  DELIVERY1 = :DELIVERY1,'
      '  COMPANY2 = :COMPANY2,'
      '  CONTACT2 = :CONTACT2,'
      '  EMAIL2 = :EMAIL2,'
      '  SHIP2 = :SHIP2,'
      '  EXCEPTION2 = :EXCEPTION2,'
      '  DELIVERY2 = :DELIVERY2,'
      '  COMPANY3 = :COMPANY3,'
      '  CONTACT3 = :CONTACT3,'
      '  EMAIL3 = :EMAIL3,'
      '  SHIP3 = :SHIP3,'
      '  EXCEPTION3 = :EXCEPTION3,'
      '  DELIVERY3 = :DELIVERY3,'
      '  COMPANY4 = :COMPANY4,'
      '  CONTACT4 = :CONTACT4,'
      '  EMAIL4 = :EMAIL4,'
      '  SHIP4 = :SHIP4,'
      '  EXCEPTION4 = :EXCEPTION4,'
      '  DELIVERY4 = :DELIVERY4,'
      '  COMPANY5 = :COMPANY5,'
      '  CONTACT5 = :CONTACT5,'
      '  EMAIL5 = :EMAIL5,'
      '  SHIP5 = :SHIP5,'
      '  EXCEPTION5 = :EXCEPTION5,'
      '  DELIVERY5 = :DELIVERY5,'
      '  INTRANSIT1 = :INTRANSIT1,'
      '  INTRANSIT2 = :INTRANSIT2,'
      '  INTRANSIT3 = :INTRANSIT3,'
      '  INTRANSIT4 = :INTRANSIT4,'
      '  INTRANSIT5 = :INTRANSIT5'
      'where id = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ups_quantum_view'
      'where'
      '  ID = :OLD_ID')
    Left = 472
    Top = 200
  end
  object PKShipToContact: TIQWebHpick
    Tag = 1
    BeforeOpen = PKShipToContactBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select c.id,'
      
        '       decode(s.id, null, decode(b.id, null, a.company, b.attn),' +
        ' s.attn) as attn,'
      '       c.last_name,'
      '       c.first_name,'
      
        '       trim(trim(c.first_name) || '#39' '#39' || trim(c.last_name)) as c' +
        'ontact,'
      '       c.title,'
      '       c.phone_number,'
      '       c.ext,'
      '       c.fax_number,'
      '       c.email,'
      '       c.pager,'
      '       c.ecode,'
      '       c.contact_type,'
      '       c.source'
      '  from contact c,'
      '          arcusto a,'
      '          (select id, '#39'SHIP_TO'#39' as source, attn from ship_to) s,'
      '          (select id, '#39'BILL_TO'#39' as source, attn from bill_to) b'
      'where c.arcusto_id = :ID'
      '   and NVL(c.pk_hide, '#39'N'#39') = '#39'N'#39
      'and c.source_id = b.id(+)'
      'and c.source = b.source(+)'
      'and c.source_id = s.id(+)'
      'and c.source = s.source(+)'
      'and c.arcusto_id = a.id')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 532
    Top = 167
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PKShipToContactATTN: TStringField
      DisplayLabel = 'Company'
      FieldName = 'ATTN'
      Origin = 'IQ.SHIP_TO.ATTN'
      Visible = False
      Size = 60
    end
    object PKShipToContactFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Origin = 'IQ.CONTACT.FIRST_NAME'
      FixedChar = True
      Size = 30
    end
    object PKShipToContactLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Origin = 'IQ.CONTACT.LAST_NAME'
      FixedChar = True
      Size = 30
    end
    object PKShipToContactEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Origin = 'IQ.CONTACT.EMAIL'
      Size = 250
    end
    object PKShipToContactCONTACT: TStringField
      FieldName = 'CONTACT'
      Origin = 'IQ.CONTACT.FIRST_NAME'
      Visible = False
      Size = 61
    end
  end
end
