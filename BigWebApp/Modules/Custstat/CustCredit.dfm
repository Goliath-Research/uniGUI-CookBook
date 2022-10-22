object FrmCustCreditLimit: TFrmCustCreditLimit
  Left = 175
  Top = 163
  HelpContext = 1201621
  ClientHeight = 229
  ClientWidth = 502
  Caption = 'Customer Credit Limit Calculation'
  OnShow = FormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  ActiveControl = cbPackSlip
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlBottom: TUniPanel
    Left = 0
    Top = 180
    Width = 502
    Height = 49
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object BtnCalc: TUniButton
      Left = 16
      Top = 8
      Width = 97
      Height = 28
      Hint = ''
      Caption = 'Calculate'
      TabOrder = 2
      OnClick = BtnCalcClick
    end
    object PnlCustStatus: TUniPanel
      Tag = 1999
      Left = 272
      Top = 1
      Width = 230
      Height = 47
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object GroupBox2: TUniGroupBox
        Left = 1
        Top = 1
        Width = 222
        Height = 43
        Hint = ''
        Caption = ' Customer Status '
        TabOrder = 0
        DesignSize = (
          222
          43)
        object dbcStatus: TUniDBComboBox
          Left = 8
          Top = 14
          Width = 150
          Height = 21
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          DataField = 'STATUS_ID'
          DataSource = SrcArcusto
          Items.Strings = (
            'Active'
            'Inactive'
            'Quote'
            'Cr Hold'
            'Ship Hold'
            'Mfg Hold'
            'Obsolete')
          TabOrder = 0
        end
        object Nav: TUniDBNavigator
          Left = 161
          Top = 12
          Width = 50
          Height = 25
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataSource = SrcArcusto
          VisibleButtons = [nbPost, nbCancel]
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 502
    Height = 180
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 285
      Top = 0
      Width = 6
      Height = 180
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 285
      Height = 178
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        285
        178)
      object Label6: TUniLabel
        Left = 33
        Top = 150
        Width = 71
        Height = 13
        Hint = ''
        Caption = 'Past-Due Days'
        TabOrder = 6
      end
      object cbPackSlip: TUniCheckBox
        Left = 19
        Top = 12
        Width = 193
        Height = 17
        Hint = ''
        Caption = 'Include shipments not yet invoiced'
        TabOrder = 0
      end
      object GroupBox1: TUniGroupBox
        Left = 11
        Top = 31
        Width = 259
        Height = 66
        Hint = ''
        Caption = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        object Label1: TUniLabel
          Left = 8
          Top = 38
          Width = 76
          Height = 13
          Hint = ''
          Caption = 'Number of days'
          TabOrder = 3
        end
        object edDays: TUniDBNumberEdit
          Left = 90
          Top = 35
          Width = 49
          Height = 21
          Hint = ''
          TabOrder = 1
          DecimalSeparator = '.'
        end
        object cbSO: TUniCheckBox
          Left = 8
          Top = 11
          Width = 195
          Height = 17
          Hint = ''
          Caption = 'Include SO releases not yet shipped'
          TabOrder = 0
          OnClick = cbSOClick
        end
      end
      object cbAutoCalc: TUniCheckBox
        Left = 18
        Top = 102
        Width = 193
        Height = 17
        Hint = ''
        Caption = 'Auto-calculate during Order entry'
        TabOrder = 2
        OnClick = cbAutoCalcClick
      end
      object cbAutoUpd: TUniCheckBox
        Left = 18
        Top = 123
        Width = 193
        Height = 17
        Hint = ''
        Caption = 'Auto-update Credit Status'
        TabOrder = 3
        OnClick = cbAutoUpdClick
      end
      object wwDBPastDue: TUniDBComboBox
        Left = 123
        Top = 146
        Width = 121
        Height = 21
        Hint = ''
        Items.Strings = (
          'None'#9'0'
          '30'#9'30'
          '60'#9'60'
          '90'#9'90')
        TabOrder = 4
        OnCloseUp = wwDBPastDueCloseUp
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 291
      Top = 1
      Width = 211
      Height = 178
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter2: TUniSplitter
        Left = 81
        Top = 0
        Width = 6
        Height = 178
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlLeft02: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 81
        Height = 176
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label2: TUniLabel
          Left = 8
          Top = 36
          Width = 37
          Height = 13
          Hint = ''
          Caption = 'Current'
          TabOrder = 1
        end
        object Label3: TUniLabel
          Left = 8
          Top = 84
          Width = 60
          Height = 13
          Hint = ''
          Caption = 'Open to Buy'
          TabOrder = 2
        end
        object Label4: TUniLabel
          Left = 8
          Top = 60
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Credit Limit'
          TabOrder = 3
        end
        object Label5: TUniLabel
          Left = 8
          Top = 12
          Width = 24
          Height = 13
          Hint = ''
          Caption = 'Total'
          TabOrder = 4
        end
      end
      object PnlClient03: TUniPanel
        Tag = 1999
        Left = 87
        Top = 1
        Width = 124
        Height = 176
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          124
          176)
        object DBCurrent: TUniDBEdit
          Left = 1
          Top = 32
          Width = 113
          Height = 20
          Cursor = crArrow
          Hint = ''
          DataField = 'CURRANT'
          DataSource = Src
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object DBEdit1: TUniDBEdit
          Left = 1
          Top = 80
          Width = 113
          Height = 20
          Cursor = crArrow
          Hint = ''
          DataField = 'OPENTOBY'
          DataSource = Src
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object DBEdit2: TUniDBEdit
          Left = 1
          Top = 56
          Width = 113
          Height = 20
          Cursor = crArrow
          Hint = ''
          DataField = 'CREDITLIMIT'
          DataSource = Src
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object DBTotal: TUniDBEdit
          Left = 1
          Top = 8
          Width = 113
          Height = 20
          Cursor = crArrow
          Hint = ''
          DataField = 'TOTAL'
          DataSource = Src
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 207
    object File1: TUniMenuItem
      Caption = '&File'
      object Calculate1: TUniMenuItem
        Caption = '&Calculate'
        OnClick = BtnCalcClick
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Customer credit limit calculation'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 191813 $'
    Left = 224
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'Calculate1'
      'BtnCalc'
      'dbcStatus'
      'Nav'
      'cbPackSlip'
      'cbSO'
      'edDays'
      'cbAutoCalc')
    SecurityCode = 'FRMCUSTCREDITLIMIT'
    Left = 232
  end
  object Src: TDataSource
    DataSet = Qry
    Left = 248
  end
  object Qry: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select :ACurrent as currant, :AOpen as OpenToBy, :ALimit as Cred' +
        'itLimit, :ATotal as Total from dual')
    Left = 264
    ParamData = <
      item
        Name = 'ACurrent'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'AOpen'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ALimit'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ATotal'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryCURRANT: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'CURRANT'
      ProviderFlags = []
      Precision = 38
      Size = 38
    end
    object QryOPENTOBY: TFMTBCDField
      FieldName = 'OPENTOBY'
      Origin = 'OPENTOBY'
      Precision = 38
      Size = 38
    end
    object QryCREDITLIMIT: TFMTBCDField
      FieldName = 'CREDITLIMIT'
      Origin = 'CREDITLIMIT'
      Precision = 38
      Size = 38
    end
    object QryTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 38
      Size = 38
    end
  end
  object SrcArcusto: TDataSource
    DataSet = QryArcusto
    Left = 144
    Top = 192
  end
  object QryArcusto: TFDQuery
    AfterPost = QryArcustoAfterPost
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id, status_id from arcusto where id = :AId')
    Left = 160
    Top = 192
    ParamData = <
      item
        Name = 'AId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArcustoID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARCUSTO.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object QryArcustoSTATUS_ID: TStringField
      FieldName = 'STATUS_ID'
      Origin = 'IQ.ARCUSTO.STATUS_ID'
      FixedChar = True
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ModifySQL.Strings = (
      'update arcusto'
      'set'
      '  STATUS_ID = :STATUS_ID'
      'where'
      '  ID = :OLD_ID')
    Left = 192
    Top = 192
  end
end
