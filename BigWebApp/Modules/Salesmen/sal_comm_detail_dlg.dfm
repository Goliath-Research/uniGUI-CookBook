object FrmSalesCommDetailDlg: TFrmSalesCommDetailDlg
  Left = 0
  Top = 0
  ClientHeight = 290
  ClientWidth = 554
  Caption = 'Commissions Group Detail'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object cpMain: TIQWebCaptionPanel
    Left = 0
    Top = 0
    Width = 554
    Height = 60
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = 'Edit Commission Percentage'
    ParentColor = True
    Text = 
      'The following Salesperson(s) are in the selected group.  Please ' +
      'modify commission percentages.'
    PictureLayout = plImageRight
    LayoutStyle = lsBasic
    DesignSize = (
      554
      60)
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 249
    Width = 554
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 440
      Top = 1
      Width = 114
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Done'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
    end
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 60
    Width = 554
    Height = 189
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 552
      Height = 187
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 335
      IQComponents.Grid.Height = 101
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcCommissionsDetail
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
      IQComponents.Navigator.DataSource = SrcCommissionsDetail
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 335
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 101
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 76
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 105
      DataSource = SrcCommissionsDetail
      Columns = <
        item
          FieldName = 'FIRST_NAME'
          Title.Caption = 'First Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LAST_NAME'
          Title.Caption = 'Last Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMMISSION_PERCENT'
          Title.Caption = 'Commission %'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RATIO'
          Title.Caption = 'Ratio'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SALES_CODE'
          Title.Caption = 'Sales Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitTop = 27
      ExplicitHeight = 162
      Marker = 0
    end
  end
  object SrcCommissionsDetail: TDataSource
    DataSet = QryCommissionsDetail
    Left = 320
    Top = 120
  end
  object QryCommissionsDetail: TFDQuery
    BeforeOpen = QryCommissionsDetailBeforeOpen
    AfterOpen = QryCommissionsDetailAfterOpen
    OnNewRecord = QryCommissionsDetailNewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.UpdateTableName = 'COMMISSIONS_DETAIL'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      '  SELECT a.id,'
      '         a.commissions_id,'
      '         a.salespeople_id,'
      '         a.commission_percent,'
      '         a.ratio,'
      '         b.sales_code,'
      '         b.first_name,'
      '         b.last_name'
      '    FROM commissions_detail a, salespeople b'
      '   WHERE b.id = a.salespeople_id AND'
      '         a.commissions_id = :ID'
      'ORDER BY a.id')
    Left = 280
    Top = 160
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryCommissionsDetailFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 18
      FieldName = 'FIRST_NAME'
      Origin = 'b.first_name'
      Size = 30
    end
    object QryCommissionsDetailLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 18
      FieldName = 'LAST_NAME'
      Origin = 'b.last_name'
      Size = 30
    end
    object QryCommissionsDetailCOMMISSION_PERCENT: TFMTBCDField
      DisplayLabel = 'Commission %'
      DisplayWidth = 16
      FieldName = 'COMMISSION_PERCENT'
      Origin = 'a.commission_percent'
      Precision = 15
      Size = 6
    end
    object QryCommissionsDetailRATIO: TBCDField
      DisplayLabel = 'Ratio'
      DisplayWidth = 8
      FieldName = 'RATIO'
      Origin = 'a.ratio'
      Precision = 7
    end
    object QryCommissionsDetailSALES_CODE: TStringField
      DisplayLabel = 'Sales Code'
      DisplayWidth = 12
      FieldName = 'SALES_CODE'
      Origin = 'b.sales_code'
      Size = 25
    end
    object QryCommissionsDetailID: TBCDField
      FieldName = 'ID'
      Origin = 'a.id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryCommissionsDetailCOMMISSIONS_ID: TBCDField
      FieldName = 'COMMISSIONS_ID'
      Origin = 'a.commissions_id'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryCommissionsDetailSALESPEOPLE_ID: TBCDField
      FieldName = 'SALESPEOPLE_ID'
      Origin = 'a.salespeople_id'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO COMMISSIONS_DETAIL'
      '(ID, COMMISSIONS_ID, SALESPEOPLE_ID, COMMISSION_PERCENT, '
      '  RATIO)'
      
        'VALUES (:NEW_ID, :NEW_COMMISSIONS_ID, :NEW_SALESPEOPLE_ID, :NEW_' +
        'COMMISSION_PERCENT, '
      '  :NEW_RATIO)'
      
        'RETURNING ID, COMMISSIONS_ID, SALESPEOPLE_ID, COMMISSION_PERCENT' +
        ', RATIO INTO :NEW_ID, :NEW_COMMISSIONS_ID, :NEW_SALESPEOPLE_ID, ' +
        ':NEW_COMMISSION_PERCENT, :NEW_RATIO')
    ModifySQL.Strings = (
      'UPDATE COMMISSIONS_DETAIL'
      'SET SALESPEOPLE_ID = :NEW_SALESPEOPLE_ID, '
      
        '  COMMISSION_PERCENT = :NEW_COMMISSION_PERCENT, RATIO = :NEW_RAT' +
        'IO'
      'WHERE ID = :OLD_ID'
      
        'RETURNING ID, COMMISSIONS_ID, SALESPEOPLE_ID, COMMISSION_PERCENT' +
        ', RATIO INTO :NEW_ID, :NEW_COMMISSIONS_ID, :NEW_SALESPEOPLE_ID, ' +
        ':NEW_COMMISSION_PERCENT, :NEW_RATIO')
    DeleteSQL.Strings = (
      'DELETE FROM COMMISSIONS_DETAIL'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, COMMISSIONS_ID, SALESPEOPLE_ID, COMMISSION_PERCENT, R' +
        'ATIO'
      'FROM COMMISSIONS_DETAIL'
      'WHERE ID = :ID')
    Left = 352
    Top = 168
  end
end
