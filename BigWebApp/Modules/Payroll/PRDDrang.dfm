object FrmDDDateRange: TFrmDDDateRange
  Left = 17
  Top = 146
  ClientHeight = 87
  ClientWidth = 363
  Caption = 'Check date range for Direct Deposit'
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 12
    Top = 15
    Width = 28
    Height = 13
    Hint = ''
    Caption = 'From:'
    TabOrder = 3
  end
  object Label2: TUniLabel
    Left = 180
    Top = 15
    Width = 16
    Height = 13
    Hint = ''
    Caption = 'To:'
    TabOrder = 4
  end
  object dbFromDate: TUniDBLookupComboBox
    Left = 44
    Top = 11
    Width = 121
    Height = 21
    Hint = ''
    ListField = 'CHECK_DATE'
    ListSource = ds_Date1
    KeyField = 'CHECK_DATE'
    ListFieldIndex = 0
    ClearButton = True
    TabOrder = 0
    Color = clWindow
    MatchFieldWidth = False
    RemoteQuery = True
  end
  object dbToDate: TUniDBLookupComboBox
    Left = 204
    Top = 11
    Width = 121
    Height = 21
    Hint = ''
    ListField = 'CHECK_DATE'
    ListSource = ds_Date2
    KeyField = 'CHECK_DATE'
    ListFieldIndex = 0
    ClearButton = True
    TabOrder = 1
    Color = clWindow
    MatchFieldWidth = False
    RemoteQuery = True
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 46
    Width = 363
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    BorderStyle = ubsNone
    Caption = ''
    object Panel2: TUniPanel
      Left = 178
      Top = 0
      Width = 185
      Height = 41
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      BorderStyle = ubsNone
      Caption = ''
      object BtnCancel: TUniButton
        Left = 16
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 1
      end
      object BtnOk: TUniButton
        Left = 104
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Ok'
        TabOrder = 2
        OnClick = BtnOkClick
      end
    end
  end
  object QryDate1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct check_date '
      '  from cheque'
      ' where id in (select cheque_id '
      '                from pr_check_hist'
      '               where id in (select pr_check_hist_id '
      '                              from pr_check_dd_hist) )'
      '   and SubStr(NVL(check_status, '#39' '#39'), 1, 4) <> '#39'VOID'#39
      'order by check_date')
    Left = 40
    Top = 46
    object QryDate1CHECK_DATE: TDateTimeField
      FieldName = 'CHECK_DATE'
      EditMask = '!99/99/0000;1; '
    end
  end
  object QryDate2: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct check_date '
      '  from cheque'
      ' where id in (select cheque_id '
      '                from pr_check_hist'
      '               where id in (select pr_check_hist_id '
      '                              from pr_check_dd_hist) )'
      '   and SubStr(NVL(check_status, '#39' '#39'), 1, 4) <> '#39'VOID'#39
      'order by check_date')
    Left = 120
    Top = 46
    object QryDate2CHECK_DATE: TDateTimeField
      FieldName = 'CHECK_DATE'
      EditMask = '!99/99/0000;1; '
    end
  end
  object ds_Date1: TDataSource
    DataSet = QryDate1
    Left = 40
  end
  object ds_Date2: TDataSource
    DataSet = QryDate2
    Left = 224
  end
end
