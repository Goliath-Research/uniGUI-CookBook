object FrmOeCreateWO: TFrmOeCreateWO
  Left = 0
  Top = 0
  HelpContext = 16666
  ClientHeight = 328
  ClientWidth = 608
  Caption = 'Create Firm Work Order'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 19
    Width = 608
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 291
    Width = 608
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 432
      Top = 1
      Width = 175
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 8
        Top = 5
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 89
        Top = 5
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 22
    Width = 608
    Height = 269
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 391
    IQComponents.Grid.Height = 183
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcReleases
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
    IQComponents.Navigator.DataSource = SrcReleases
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 391
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 183
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcReleases
    Columns = <
      item
        FieldName = 'SEQ'
        Title.Caption = '#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QUAN'
        Title.Caption = 'Quantity'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LEFT_TO_SHIP'
        Title.Caption = 'Left To Ship'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REQUEST_DATE'
        Title.Caption = 'Requested'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROMISE_DATE'
        Title.Caption = 'Promised'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MUST_SHIP_DATE'
        Title.Caption = 'Must Ship Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RELEASED'
        Title.Caption = 'Quantity Shipped'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 608
    Height = 19
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Alignment = taLeftJustify
    Caption = ''
  end
  object MainMenu1: TUniMainMenu
    Left = 72
    Top = 64
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'Create Firm Work Order'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197438 $'
    BuildVersion = '176554'
    Left = 128
    Top = 64
  end
  object QryReleases: TFDQuery
    Filtered = True
    OnFilterRecord = QryReleasesFilterRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    SQL.Strings = (
      'select r1.ord_detail_id,'
      '       r1.request_date,'
      '       r1.promise_date,'
      '       r1.seq,'
      '       r1.quan,'
      '       r1.orig_quan,'
      '       r1.forecast,'
      '       r1.ship_date,'
      '       r1.cuser1,'
      '       r1.unit_price,'
      '       r1.ecode,'
      '       r1.ID,'
      '       r1.user_date,'
      '       r1.user_date_2,'
      '       r1.user_date_3,'
      '       r1.ran,'
      '       r1.ship_to_id,'
      
        '       (select attn from ship_to where id = r1.ship_to_id) as sh' +
        'ip_to_attn,'
      '       r1.shipped_quan,'
      '       r1.date_type,'
      '       r1.cuser2,'
      '       r1.cuser3,'
      '       r1.batch_no,'
      '       r1.job_seq,'
      '       r1.must_ship_date,'
      '       r1.ack,'
      '       r1.internal_update_type,'
      '       r1.lock_must_ship_date,'
      '       r1.request_date as rel_date,'
      '       r1.freight_id,'
      
        '       (select descrip from freight where id = r1.freight_id) as' +
        ' shipvia,'
      '       r1.wo_note,'
      ''
      '       case'
      '         when ship_date is not null then 0'
      
        '         when nvl(shipped_quan,0) > 0 then greatest(0, nvl(quan,' +
        '0) - nvl(shipped_quan,0))'
      '         else quan'
      '       end as left_to_ship,'
      ''
      '       case'
      '         when ship_date is not null then quan'
      '         when nvl(shipped_quan,0) > 0 then nvl(shipped_quan,0)'
      '         else 0'
      '       end as released,'
      ''
      '       nvl( r1.ship_to_id, '
      
        '            (select o.ship_to_id from orders o, ord_detail d whe' +
        're d.id = r1.ord_detail_id and d.orders_id = o.id)) as ship_to_i' +
        'd_ex'
      '       '
      '  from releases r1'
      ' where r1.ord_detail_id = :AID'
      '')
    Left = 232
    Top = 78
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryReleasesSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 2
      FieldName = 'SEQ'
      Origin = 'r1.SEQ'
      Required = True
      Size = 0
    end
    object QryReleasesQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 12
      FieldName = 'QUAN'
      Origin = 'r1.QUAN'
      Required = True
    end
    object QryReleasesLEFT_TO_SHIP: TFMTBCDField
      DisplayLabel = 'Left To Ship'
      DisplayWidth = 14
      FieldName = 'LEFT_TO_SHIP'
      Origin = 
        'case when ship_date is not null then 0 when nvl(shipped_quan,0) ' +
        '> 0 then greatest(0, nvl(quan,0) - nvl(shipped_quan,0)) else qua' +
        'n end'
      Size = 38
    end
    object QryReleasesREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Requested'
      DisplayWidth = 14
      FieldName = 'REQUEST_DATE'
      Origin = 'r1.REQUEST_DATE'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QryReleasesPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Promised'
      DisplayWidth = 14
      FieldName = 'PROMISE_DATE'
      Origin = 'r1.PROMISE_DATE'
      EditMask = '!99/99/0000;1;_'
    end
    object QryReleasesMUST_SHIP_DATE: TDateTimeField
      DisplayLabel = 'Must Ship Date'
      DisplayWidth = 15
      FieldName = 'MUST_SHIP_DATE'
      Origin = 'r1.must_ship_date'
    end
    object QryReleasesRELEASED: TFMTBCDField
      DisplayLabel = 'Quantity Shipped'
      DisplayWidth = 19
      FieldName = 'RELEASED'
      Origin = 
        'case when ship_date is not null then quan when nvl(shipped_quan,' +
        '0) > 0 then nvl(shipped_quan,0) else 0 end '
      Size = 38
    end
    object QryReleasesSHIP_DATE: TDateTimeField
      DisplayLabel = 'Ship Date'
      DisplayWidth = 10
      FieldName = 'SHIP_DATE'
      Origin = 'r1.SHIP_DATE'
      ReadOnly = True
      Visible = False
      EditMask = '!99/99/0000;1;_'
    end
    object QryReleasesFORECAST: TStringField
      DisplayLabel = 'Forecast'
      DisplayWidth = 9
      FieldName = 'FORECAST'
      Origin = 'r1.FORECAST'
      Visible = False
      Size = 1
    end
    object QryReleasesORIG_QUAN: TBCDField
      DisplayLabel = 'Original Quantity'
      DisplayWidth = 10
      FieldName = 'ORIG_QUAN'
      Visible = False
    end
    object QryReleasesRAN: TStringField
      DisplayLabel = 'R.A.N. / KanBan'
      DisplayWidth = 15
      FieldName = 'RAN'
      Visible = False
      Size = 30
    end
    object QryReleasesSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 20
      FieldName = 'SHIP_TO_ATTN'
      Visible = False
      Size = 60
    end
    object QryReleasesDATE_TYPE: TStringField
      DisplayLabel = 'Date Type'
      DisplayWidth = 9
      FieldName = 'DATE_TYPE'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object QryReleasesBATCH_NO: TStringField
      DisplayLabel = 'Batch #'
      DisplayWidth = 30
      FieldName = 'BATCH_NO'
      Visible = False
      Size = 30
    end
    object QryReleasesJOB_SEQ: TBCDField
      DisplayLabel = 'Job Sequence'
      DisplayWidth = 10
      FieldName = 'JOB_SEQ'
      Visible = False
      Size = 0
    end
    object QryReleasesLOCK_MUST_SHIP_DATE: TStringField
      DisplayLabel = 'Lock Must Ship Date'
      DisplayWidth = 1
      FieldName = 'LOCK_MUST_SHIP_DATE'
      Visible = False
      Size = 1
    end
    object QryReleasesACK: TStringField
      DisplayLabel = 'Acknowledged'
      DisplayWidth = 14
      FieldName = 'ACK'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryReleasesCUSER1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 10
      FieldName = 'CUSER1'
      Origin = 'r1.CUSER1'
      Visible = False
      Size = 255
    end
    object QryReleasesCUSER2: TStringField
      DisplayLabel = 'Comment 2'
      DisplayWidth = 60
      FieldName = 'CUSER2'
      Visible = False
      Size = 255
    end
    object QryReleasesUSER_DATE: TDateTimeField
      DisplayLabel = 'User Date 1'
      DisplayWidth = 10
      FieldName = 'USER_DATE'
      Origin = 'r1.USER_DATE'
      Visible = False
      EditMask = '!99/99/0000;1;_'
    end
    object QryReleasesUSER_DATE_2: TDateTimeField
      DisplayLabel = 'User Date 2'
      DisplayWidth = 18
      FieldName = 'USER_DATE_2'
      Visible = False
    end
    object QryReleasesUSER_DATE_3: TDateTimeField
      DisplayLabel = 'User Date 3'
      DisplayWidth = 18
      FieldName = 'USER_DATE_3'
      Visible = False
    end
    object QryReleasesECODE: TStringField
      DisplayLabel = 'E. Code'
      DisplayWidth = 10
      FieldName = 'ECODE'
      Origin = 'r1.ECODE'
      ReadOnly = True
      Visible = False
      Size = 10
    end
    object QryReleasesUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Origin = 'r1.UNIT_PRICE'
      Visible = False
      currency = True
      Size = 6
    end
    object QryReleasesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'r1.ID'
      Visible = False
      Size = 0
    end
    object QryReleasesORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Origin = 'r1.ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryReleasesSHIP_TO_ID: TBCDField
      FieldName = 'SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object QryReleasesSHIPPED_QUAN: TBCDField
      FieldName = 'SHIPPED_QUAN'
      Origin = 'r1.shipped_quan'
      Visible = False
    end
    object QryReleasesINTERNAL_UPDATE_TYPE: TStringField
      FieldName = 'INTERNAL_UPDATE_TYPE'
      Visible = False
      Size = 10
    end
    object QryReleasesREL_DATE: TDateTimeField
      FieldName = 'REL_DATE'
      Visible = False
    end
    object QryReleasesCUSER3: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER3'
      Visible = False
      Size = 60
    end
    object QryReleasesFREIGHT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FREIGHT_ID'
      Visible = False
      Size = 0
    end
    object QryReleasesSHIPVIA: TStringField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 60
      FieldName = 'SHIPVIA'
      Visible = False
      Size = 60
    end
    object QryReleasesWO_NOTE: TStringField
      DisplayLabel = 'WO Note'
      DisplayWidth = 255
      FieldName = 'WO_NOTE'
      Visible = False
      Size = 255
    end
    object QryReleasesSHIP_TO_ID_EX: TFMTBCDField
      FieldName = 'SHIP_TO_ID_EX'
      Visible = False
      Size = 38
    end
  end
  object SrcReleases: TDataSource
    DataSet = QryReleases
    Left = 232
    Top = 56
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'BtnOk')
    SecurityCode = 'FRMOECREATEWO'
    Left = 176
    Top = 64
  end
end
