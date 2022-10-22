object FrmPrSelPayGroup: TFrmPrSelPayGroup
  Left = 39
  Top = 164
  HelpContext = 9987
  ClientHeight = 107
  ClientWidth = 431
  Caption = 'Print Checks - Select Paygroup(s)'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 77
    Width = 431
    Height = 30
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Label1: TUniLabel
      Left = 6
      Top = 11
      Width = 69
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'Bank Account:'
      TabOrder = 3
    end
    object Panel2: TUniPanel
      Left = 267
      Top = 1
      Width = 164
      Height = 28
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 3
        Top = 5
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Ok'
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 83
        Top = 5
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
    object edAcct: TUniEdit
      Left = 80
      Top = 9
      Width = 121
      Height = 19
      Cursor = crArrow
      Hint = ''
      Visible = False
      Text = ''
      TabOrder = 1
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 431
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object sbSelectAll: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Select All'
      ShowHint = True
      ParentShowHint = False
      GroupIndex = 1
      Down = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        B3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
        7DB3977DB3977DB3977DFF00FFFF00FFB3977D25B9FF28BEFF2CC4FF31CBFF36
        D2FF3DD8FF46DFFF51E3FF63E8FF77EEFF8EF1FFA3F5FFB3977DFF00FFFF00FF
        B3977D24B9FF28BEFF2BC4FF31CBFF36D1FF3DD9FF45DEFF52E4FF63E9FF78ED
        FF8EF2FFA3F5FFB3977DFF00FFFF00FFB3977DA1A1A09393928787857E7D7C79
        78767978777F7E7C888685908F8D979693979694979694B3977DFF00FFFF00FF
        B3977D25B9FF28BEFF2CC4FF31CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
        FF8EF1FFA3F5FFB3977DFF00FFFF00FFB3977D24B9FF28BEFF2BC4FF31CBFF36
        D1FF3DD9FF45DEFF52E4FF63E9FF78EDFF8EF2FFA3F5FFB3977DFF00FFFF00FF
        508050407040305030203820B9B9B9ADADADA0A0A09292918686867D7D7D7A7A
        7A7B7A7A838281B3977DFF00FFFF00FF50905060A86050885030503031CBFF36
        D2FF3DD8FF46DFFF51E3FF63E8FF77EEFF8EF1FFA3F5FFB3977D70A88060A070
        60986070B0705098504070403050302038203DD9FF45DEFF52E4FF63E9FF78ED
        FF8EF2FFA3F5FFB3977D80B090A0D8A070C08070B87060A06050905040884030
        5030A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A5790B8A0B0D8B0
        A0D8A090D0A070B87060A860509850407040FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF90C0A090B8A080B090A0D8A070C08060986050905050
        8050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        90B8A0B0D8B0A0D8A060A070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF90C0A090B8A080B09070A880FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbSelectAllClick
    end
    object sbDeselectAll: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Deselect All'
      ShowHint = True
      ParentShowHint = False
      GroupIndex = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000232E0000232E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        B3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
        7DB3977DB3977DB3977DFF00FFFF00FFB3977DF3EADCF2E8DBF1E8DAF1E6D8F1
        E5D7F0E5D6F0E4D5EFE4D3EFE3D2EFE2D1EFE2D0EEE1CFB3977DFF00FFFF00FF
        B3977DF7F1EAF7F1E9F6F0E7F5EFE6F6EEE4F5EEE2F4ECE1F3EBE0F3EADEF3EA
        DDF2E9DBF2E8DAB3977DFF00FFFF00FFB3977D9393928787857E7D7C79787679
        78777F7E7C888685908F8D9796939796949796949D9A98B3977DFF00FFFF00FF
        B3977DFFFEFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFEFEFEFEFDB3977DFF00FFFF00FFB3977DFFF9F4FFFAF6FFFBF7FFFBF8FF
        FCF9FFFDFAFFFDFBFFFEFCFFFFFDFFFFFEFFFFFEFFFFFFB3977DFF00FFFF00FF
        B3977DC2C2C2C1C1C1B9B9B9ADADADA0A0A09292918686867D7D7D7A7A7A7B7A
        7A838281929190B3977DFF00FFFF00FFB3977DFFFEFEFFFFFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFDB3977D6078D01038B0
        1038B01030B01028A01028A0002090002090FFFDFAFFFDFBFFFEFCFFFFFDFFFF
        FEFFFFFEFFFFFFB3977D6080D09098FF5060FF5060FF3048F03048E02040D010
        28A0A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A577088E0A0A8FF
        9090FF7080FF5068FF3058F02048F01038B0FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF7088E07088E06080D06078D05070C05060C04058B040
        58B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbDeselectAllClick
    end
  end
  object grid: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 431
    Height = 50
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 214
    IQComponents.Grid.Height = 434
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcControl
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 100
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SrcControl
    IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 214
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 434
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcControl
    Columns = <
      item
        FieldName = 'PAYPERIOD_ENDING_DATE'
        Title.Caption = 'PayPeriod Ending Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WORK_PERIOD_BEGIN'
        Title.Caption = 'Work Start Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WORK_PERIOD_END'
        Title.Caption = 'Work End Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PAYDATE'
        Title.Caption = 'Paydate'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PayGroup'
        Title.Caption = 'Pay Group'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PR_TYPE'
        Title.Caption = 'Type'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CashAccount'
        Title.Caption = 'Cash Account'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PRENOTE'
        Title.Caption = 'PRENOTE'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object tblControl: TFDTable
    Filtered = True
    OnFilterRecord = tblControlFilterRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PR_PREPOST_CONTROL'
    TableName = 'PR_PREPOST_CONTROL'
    Left = 38
    Top = 48
    object tblControlPAYPERIOD_ENDING_DATE: TDateTimeField
      DisplayLabel = 'PayPeriod Ending Date'
      DisplayWidth = 10
      FieldName = 'PAYPERIOD_ENDING_DATE'
      ReadOnly = True
      EditMask = '!99/99/0000;1; '
    end
    object tblControlWORK_PERIOD_BEGIN: TDateTimeField
      DisplayLabel = 'Work Start Date'
      DisplayWidth = 10
      FieldName = 'WORK_PERIOD_BEGIN'
      ReadOnly = True
      EditMask = '!99/99/0000;1; '
    end
    object tblControlWORK_PERIOD_END: TDateTimeField
      DisplayLabel = 'Work End Date'
      DisplayWidth = 10
      FieldName = 'WORK_PERIOD_END'
      ReadOnly = True
      EditMask = '!99/99/0000;1; '
    end
    object tblControlPAYDATE: TDateTimeField
      DisplayLabel = 'Paydate'
      DisplayWidth = 10
      FieldName = 'PAYDATE'
      ReadOnly = True
    end
    object tblControlPayGroup: TStringField
      DisplayLabel = 'Pay Group'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'PayGroup'
      LookupDataSet = QryPayGroup
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIPTION'
      KeyFields = 'PR_PAYGROUP_ID'
      ReadOnly = True
      Lookup = True
    end
    object tblControlPR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 15
      FieldName = 'PR_TYPE'
      Size = 15
    end
    object tblControlCashAccount: TStringField
      DisplayLabel = 'Cash Account'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'CashAccount'
      LookupDataSet = tblBankInfoDtl
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCOUNT_NUMBER'
      KeyFields = 'BANKINFO_DTL_ID'
      Lookup = True
    end
    object tblControlPR_PAYGROUP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_PAYGROUP_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object tblControlBANKINFO_DTL_ID: TBCDField
      FieldName = 'BANKINFO_DTL_ID'
      Visible = False
      Size = 0
    end
    object tblControlID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object tblControlGLPERIODS_ID_PR: TBCDField
      FieldName = 'GLPERIODS_ID_PR'
      Visible = False
      Size = 0
    end
    object tblControlPRENOTE: TStringField
      DisplayWidth = 1
      FieldName = 'PRENOTE'
      Size = 1
    end
  end
  object SrcControl: TDataSource
    DataSet = tblControl
    Left = 28
    Top = 48
  end
  object QryPayGroup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from pr_paygroup')
    Left = 76
    Top = 48
  end
  object PKBankInfo: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select b.name           as name,'
      '       b.address_1      as addr1,'
      '       b.address_2      as addr2,'
      '       b.city           as city,'
      '       b.state          as state,'
      '       b.zip            as zip,'
      '       d.id             as bankinfo_dtl_id,'
      '       d.account_number as account_number,'
      '       d.description    as description,'
      '       d.last_checkno   as last_checkno, '
      '       g.acct           as acct,'
      '       d.glacct_id_cash as glacct_id_cash'
      '  from bankinfo b,'
      '       bankinfo_dtl d,'
      '       glacct g'
      ' where d.bankinfo_id = b.id'
      '   and d.glacct_id_cash = g.id(+)'
      '     '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 152
    Top = 48
    object PKBankInfoNAME: TStringField
      DisplayLabel = 'Bank'
      FieldName = 'NAME'
      Size = 60
    end
    object PKBankInfoADDR1: TStringField
      DisplayLabel = 'Address1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PKBankInfoADDR2: TStringField
      DisplayLabel = 'Address2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PKBankInfoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
    end
    object PKBankInfoSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PKBankInfoZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Size = 10
    end
    object PKBankInfoBANKINFO_DTL_ID: TBCDField
      FieldName = 'BANKINFO_DTL_ID'
      Visible = False
      Size = 0
    end
    object PKBankInfoACCOUNT_NUMBER: TStringField
      FieldName = 'Account Number'
      Size = 25
    end
    object PKBankInfoDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object PKBankInfoLAST_CHECKNO: TBCDField
      DisplayLabel = 'Last Check#'
      FieldName = 'LAST_CHECKNO'
      Size = 0
    end
    object PKBankInfoACCT: TStringField
      DisplayLabel = 'GL cash account'
      FieldName = 'ACCT'
      Size = 50
    end
    object PKBankInfoGLACCT_ID_CASH: TBCDField
      FieldName = 'GLACCT_ID_CASH'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'SBAccount'
      'btnOk'
      'edAcct'
      'sbSelectAll'
      'sbDeselectAll'
      'Nav'
      'grid'
      'tblControl'
      'QryPayGroup'
      'PKBankInfo'
      '')
    SecurityCode = 'FRMPRSELPAYGROUP'
    Left = 192
    Top = 48
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Select Paygroup(s)'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192968 $'
    BuildVersion = '176554'
    Left = 232
    Top = 48
  end
  object tblBankInfoDtl: TFDTable
    Active = True
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'BANKINFO_DTL'
    TableName = 'BANKINFO_DTL'
    Left = 264
    Top = 52
  end
  object MainMenu1: TUniMainMenu
    Left = 232
    Top = 83
    object File1: TUniMenuItem
      Caption = '&File'
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
end
