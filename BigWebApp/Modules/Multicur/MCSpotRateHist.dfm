object FrmSpotRateHist: TFrmSpotRateHist
  Left = 37
  Top = 167
  HelpContext = 1111719
  ClientHeight = 313
  ClientWidth = 406
  Caption = 'Spot Rate History'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 406
    Height = 313
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 189
    IQComponents.Grid.Height = 227
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcSpotRate
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SrcSpotRate
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 189
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 227
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 200
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 229
    DataSource = SrcSpotRate
    Columns = <
      item
        FieldName = 'EFFECTIVE_DATE'
        Title.Caption = 'Effective Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SPOT_RATE'
        Title.Caption = 'Spot Rate'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TIMESTAMP'
        Title.Caption = 'Time Stamp'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'User ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 27
    ExplicitHeight = 286
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 112
    Top = 24
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
      object N1: TUniMenuItem
        Caption = '-'
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Spot Rate History'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 152
    Top = 24
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMSPOTRATEHIST'
    Left = 192
    Top = 24
  end
  object SrcSpotRate: TDataSource
    DataSet = QrySpotRate
    Left = 56
    Top = 107
  end
  object QrySpotRate: TFDQuery
    BeforePost = QrySpotRateBeforePost
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CURRANCY_RATE_HIST'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       currency_id,'
      '       effective_date,'
      '       spot_rate,'
      '       timestamp,'
      '       userid'
      '  from currency_rate_hist'
      ' where currency_id = :ID')
    Left = 72
    Top = 112
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QrySpotRateEFFECTIVE_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECTIVE_DATE'
      Origin = 'EFFECTIVE_DATE'
    end
    object QrySpotRateSPOT_RATE: TFMTBCDField
      DisplayLabel = 'Spot Rate'
      DisplayWidth = 10
      FieldName = 'SPOT_RATE'
      Origin = 'SPOT_RATE'
      Size = 6
    end
    object QrySpotRateTIMESTAMP: TDateTimeField
      DisplayLabel = 'Time Stamp'
      DisplayWidth = 18
      FieldName = 'TIMESTAMP'
      Origin = 'TIMESTAMP'
      ReadOnly = True
    end
    object QrySpotRateUSERID: TStringField
      DisplayLabel = 'User ID'
      DisplayWidth = 35
      FieldName = 'USERID'
      Origin = 'USERID'
      ReadOnly = True
      Size = 35
    end
    object QrySpotRateID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QrySpotRateCURRENCY_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CURRENCY_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into currency_rate_hist'
      
        '  (ID, CURRENCY_ID, EFFECTIVE_DATE, SPOT_RATE, TIMESTAMP, USERID' +
        ')'
      'values'
      
        '  (:ID, :CURRENCY_ID, :EFFECTIVE_DATE, :SPOT_RATE, :TIMESTAMP, :' +
        'USERID)')
    ModifySQL.Strings = (
      'update currency_rate_hist'
      'set'
      '  ID = :ID,'
      '  CURRENCY_ID = :CURRENCY_ID,'
      '  EFFECTIVE_DATE = :EFFECTIVE_DATE,'
      '  SPOT_RATE = :SPOT_RATE,'
      '  TIMESTAMP = :TIMESTAMP,'
      '  USERID = :USERID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from currency_rate_hist'
      'where'
      '  ID = :OLD_ID')
    Left = 72
    Top = 128
  end
end
