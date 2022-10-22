object FrmTransLog: TFrmTransLog
  Left = 107
  Top = 161
  HelpContext = 1448919
  ClientHeight = 225
  ClientWidth = 516
  Caption = 'Transaction Log'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object BevelSpacerToolBar: TUniPanel
    Left = 0
    Top = 27
    Width = 516
    Height = 4
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object DBGridTransLog: TIQUniGridControl
    Left = 0
    Top = 31
    Width = 516
    Height = 175
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 299
    IQComponents.Grid.Height = 89
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcTransLog
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
    IQComponents.Navigator.DataSource = SrcTransLog
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 299
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 89
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcTransLog
    Columns = <
      item
        FieldName = 'TRANS_DATE'
        Title.Caption = 'Date'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_IN_OUT'
        Title.Caption = 'In/Out'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_TYPE'
        Title.Caption = 'Trans Type'
        Width = 95
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_QUAN'
        Title.Caption = 'Tran Qty'
        Width = 48
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_QUAN'
        Title.Caption = 'Start Qty'
        Width = 48
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RG_QUAN'
        Title.Caption = 'Tran RG'
        Width = 48
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_RG_QUAN'
        Title.Caption = 'Start RG'
        Width = 48
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOC_DESC'
        Title.Caption = 'Location'
        Width = 78
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOTNO'
        Title.Caption = 'Lot #'
        Width = 73
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ACT_COST'
        Title.Caption = 'Act Cost'
        Width = 51
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STD_COST'
        Title.Caption = 'Std Cost'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_REASON'
        Title.Caption = 'Reason'
        Width = 111
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'User'
        Width = 49
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FG_LOTNO'
        Title.Caption = 'FG Lot #'
        Width = 103
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FGMULTI_CUSER1'
        Title.Caption = 'User Text 1'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FGMULTI_CUSER2'
        Title.Caption = 'User Text 2'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FGMULTI_CUSER3'
        Title.Caption = 'User Text 3'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_CODE'
        Title.Caption = 'Tran Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_DESCRIP'
        Title.Caption = 'Tran Description'
        Width = 120
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RECEIPTNO'
        Title.Caption = 'Receipt #'
        Width = 119
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DIVISION_NAME'
        Title.Caption = 'Division'
        Width = 79
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOCATION_DESCRIP'
        Title.Caption = 'Location Description'
        Width = 181
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_QUAN_TOTAL'
        Title.Caption = 'Total Start Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_RG_QUAN_TOTAL'
        Title.Caption = 'Total Start RG'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'POSTED'
        Title.Caption = 'Posted'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SYSTEM_DATE'
        Title.Caption = 'System Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WORKORDER_ID'
        Title.Caption = 'WO #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 38
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 101
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 106
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Extended Description'
        Width = 122
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Revision'
        Width = 72
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'MFG #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RECEIPT_COMMENT'
        Title.Caption = 'Comment'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FGMULTI_ID'
        Title.Caption = 'Location ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'END_QUAN'
        Title.Caption = 'End Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'END_RQ_QUAN'
        Title.Caption = 'End RG Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PO_RECEIPTS_UNIT_PRICE'
        Title.Caption = 'PO Receipt Cost'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    OnMouseDown = DBGridTransLogMouseDown
    Marker = 0
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      516
      27)
    object IQUserDefLabel1: TIQWebUserDefLabel
      Left = 337
      Top = 7
      Width = 35
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'CUser1'
      TabOrder = 3
      ParentAppName = 'IQWIN32.EXE'
    end
    object IQUserDefLabel2: TIQWebUserDefLabel
      Left = 377
      Top = 7
      Width = 35
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'CUser2'
      TabOrder = 4
      ParentAppName = 'IQWIN32.EXE'
    end
    object IQUserDefLabel3: TIQWebUserDefLabel
      Left = 417
      Top = 7
      Width = 35
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'CUser3'
      TabOrder = 5
      ParentAppName = 'IQWIN32.EXE'
    end
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
        90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
        40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
        00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
        90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
        F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
        A068509050308048308048208038108F4C26B08870A068509058309048308040
        20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
        4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
        FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
        50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
        B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
        F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
        50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
        57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
        C09880B08060A068509050309058409D6842B07860B08870A070508048308048
        20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
        67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
        C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
        20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
        00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
        CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
        37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
        00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
        00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
        00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSearchClick
    end
    object BevelToolBar: TUniPanel
      Left = 27
      Top = 3
      Width = 4
      Height = 20
      Hint = ''
      TabOrder = 7
      Caption = ''
    end
    object lblFilterTransType: TUniLabel
      Left = 41
      Top = 7
      Width = 81
      Height = 13
      Hint = ''
      Caption = 'Trans Type Filter'
      TabOrder = 8
    end
    object sbtnApplyTransType: TUniSpeedButton
      Left = 291
      Top = 3
      Width = 23
      Height = 22
      Hint = 'Apply Trans Type Filter'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034464034464FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0344640ED1FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A14D3FF03
        4464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0099CC1BD5FF1BD5FF034464FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A22
        D7FF22D7FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00669A00669A00669A29DAFF034464034464034464FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A30DCFF30
        DCFF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF00669A37DEFF37DEFF034464FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A3D
        E0FF3DE0FF3DE0FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00669A00669A00669A00669A44E3FF034464034464034464034464FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A4BE5FF4BE5FF4B
        E5FF4BE5FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00669A5CEBFE5CEBFE5CEBFE5CEBFE034464FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0099CC00669A70
        F1FE70F1FE70F1FE70F1FE034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0099CC0344640344640344640344640344640344
        64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnApplyTransTypeClick
    end
    object NavTransLog: TUniDBNavigator
      Left = 416
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      DataSource = SrcTransLog
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
    object edTransTypeFilter: TUniEdit
      Left = 129
      Top = 3
      Width = 160
      Height = 21
      Hint = ''
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Color = clBtnFace
      ReadOnly = True
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 206
    Width = 516
    Height = 19
    Hint = ''
    Visible = False
    Panels = <
      item
        Width = 500
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object QryTransLog: TFDQuery
    OnCalcFields = QryTransLogCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'TRANSLOG'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select id                  as id                 ,'
      '       class               as class              ,'
      '       itemno              as itemno             ,'
      '       rev                 as rev                ,'
      '       descrip             as descrip            ,'
      '       descrip2            as descrip2           ,'
      '       trans_date          as trans_date         ,'
      '       trans_in_out        as trans_in_out       ,'
      '       trans_quan          as trans_quan         ,'
      '       rg_quan             as rg_quan            ,'
      '       trans_type          as trans_type         ,'
      '       loc_desc            as loc_desc           ,'
      '       lotno               as lotno              ,'
      '       fg_lotno            as fg_lotno           ,'
      '       act_cost            as act_cost           ,'
      '       std_cost            as std_cost           ,'
      '       trans_reason        as trans_reason       ,'
      '       userid              as userid             ,'
      '       begin_quan          as begin_quan         ,'
      '       begin_rg_quan       as begin_rg_quan      ,'
      '       batch               as batch              ,'
      '       cost_element        as cost_element       ,'
      '       parent_arinvt_id    as parent_arinvt_id   ,'
      '       arinvt_id           as arinvt_id          ,'
      '       fgmulti_id          as fgmulti_id         ,'
      '       fgmulti_cuser1      as fgmulti_cuser1     ,'
      '       fgmulti_cuser2      as fgmulti_cuser2     ,'
      '       fgmulti_cuser3      as fgmulti_cuser3     ,'
      '       receiptno           as receiptno          ,'
      '       division_name       as division_name      ,'
      '       trans_code          as trans_code         ,'
      '       trans_descrip       as trans_descrip      ,'
      '       location_descrip    as location_descrip   ,'
      '       exclude_rpt         as exclude_rpt        ,'
      '       workorder_id        as workorder_id       ,'
      '       source              as source             ,'
      '       source_id           as source_id          ,'
      '       begin_quan_total    as begin_quan_total   ,'
      '       begin_rg_quan_total as begin_rg_quan_total,'
      '       mfgno               as mfgno              ,'
      '       eplant_id           as eplant_id          ,'
      '       posted              as posted             ,'
      '       day_part_id         as day_part_id        ,'
      '       act_date            as system_date        ,'
      '       receipt_comment     as receipt_comment    ,'
      '       po_receipts_unit_price     as po_receipts_unit_price    ,'
      '                                             '
      '       case '
      
        '         when nvl(non_conform_id,0) = 0 or nvl(non_conform_alloc' +
        'atable, '#39'N'#39') = '#39'Y'#39' then '
      
        '              decode(NVL(trim(trans_in_out), '#39'IN'#39'), '#39'IN'#39', 1, (-1' +
        ')) * NVL(trans_quan, 0) + NVL(begin_quan_total, 0) '
      '         else NVL(begin_quan_total, 0)'
      '       end as end_quan,'
      '       '
      '       case '
      
        '         when nvl(non_conform_id,0) = 0 or nvl(non_conform_alloc' +
        'atable, '#39'N'#39') = '#39'Y'#39' then '
      
        '              decode(NVL(trim(trans_in_out), '#39'IN'#39'), '#39'IN'#39', 1, (-1' +
        ')) * NVL(rg_quan, 0) + NVL(begin_rg_quan_total, 0)'
      '         else NVL(begin_rg_quan_total, 0)'
      '       end as end_rg_quan'
      '  from translog      '
      ' where '
      ''
      '/* START TRANS_TYPE FILTER */'
      '   1=1   '
      '/* END TRANS_TYPE FILTER */'
      ''
      ''
      '-- HPICK_PROPAGATE_SORT_START'
      '-- do not remove these comments'
      '-- HPICK_PROPAGATE_SORT_END'
      ''
      '')
    Left = 32
    Top = 92
    object QryTransLogTRANS_DATE: TDateTimeField
      DisplayLabel = 'Date'
      FieldName = 'TRANS_DATE'
    end
    object QryTransLogTRANS_IN_OUT: TStringField
      DisplayLabel = 'In/Out'
      FieldName = 'TRANS_IN_OUT'
      Size = 3
    end
    object QryTransLogTRANS_QUAN: TFMTBCDField
      DisplayLabel = 'Tran Qty'
      FieldName = 'TRANS_QUAN'
      Size = 6
    end
    object QryTransLogRG_QUAN: TFMTBCDField
      DisplayLabel = 'Tran RG'
      FieldName = 'RG_QUAN'
      Size = 6
    end
    object QryTransLogTRANS_TYPE: TStringField
      DisplayLabel = 'Trans Type'
      FieldName = 'TRANS_TYPE'
      Size = 30
    end
    object QryTransLogLOC_DESC: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object QryTransLogLOTNO: TStringField
      DisplayLabel = 'Lot #'
      FieldName = 'LOTNO'
      Size = 25
    end
    object QryTransLogACT_COST: TFMTBCDField
      DisplayLabel = 'Act Cost'
      FieldName = 'ACT_COST'
      Size = 6
    end
    object QryTransLogTRANS_REASON: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 35
      FieldName = 'TRANS_REASON'
      Size = 50
    end
    object QryTransLogBEGIN_QUAN: TFMTBCDField
      DisplayLabel = 'Start Qty'
      FieldName = 'BEGIN_QUAN'
      Size = 6
    end
    object QryTransLogBEGIN_RG_QUAN: TFMTBCDField
      DisplayLabel = 'Start RG'
      FieldName = 'BEGIN_RG_QUAN'
      Size = 6
    end
    object QryTransLogSTD_COST: TFMTBCDField
      DisplayLabel = 'Std Cost'
      FieldName = 'STD_COST'
      Size = 6
    end
    object QryTransLogFG_LOTNO: TStringField
      DisplayLabel = 'FG Lot #'
      FieldName = 'FG_LOTNO'
      Origin = 'TRANSLOG.FG_LOTNO'
      Size = 25
    end
    object QryTransLogBATCH: TBCDField
      FieldName = 'BATCH'
      Origin = 'TRANSLOG.BATCH'
      Visible = False
      Size = 0
    end
    object QryTransLogPARENT_ARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'PARENT_ARINVT_ID'
      Origin = 'TRANSLOG.PARENT_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryTransLogARINVT_ID: TBCDField
      Tag = 1
      FieldName = 'ARINVT_ID'
      Origin = 'TRANSLOG.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryTransLogUSERID: TStringField
      DisplayLabel = 'User'
      FieldName = 'USERID'
      Origin = 'TRANSLOG.USERID'
      Size = 35
    end
    object QryTransLogFGMULTI_CUSER1: TStringField
      DisplayLabel = 'User Text 1'
      FieldName = 'FGMULTI_CUSER1'
      Origin = 'TRANSLOG.FGMULTI_CUSER1'
      Size = 25
    end
    object QryTransLogFGMULTI_CUSER2: TStringField
      DisplayLabel = 'User Text 2'
      FieldName = 'FGMULTI_CUSER2'
      Origin = 'TRANSLOG.FGMULTI_CUSER2'
      Size = 25
    end
    object QryTransLogFGMULTI_CUSER3: TStringField
      DisplayLabel = 'User Text 3'
      FieldName = 'FGMULTI_CUSER3'
      Origin = 'TRANSLOG.FGMULTI_CUSER3'
      Size = 25
    end
    object QryTransLogRECEIPTNO: TStringField
      DisplayLabel = 'Receipt #'
      FieldName = 'RECEIPTNO'
      Origin = 'TRANSLOG.RECEIPTNO'
      Size = 50
    end
    object QryTransLogDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Origin = 'TRANSLOG.DIVISION_NAME'
      Size = 25
    end
    object QryTransLogTRANS_CODE: TStringField
      DisplayLabel = 'Tran Code'
      FieldName = 'TRANS_CODE'
      Origin = 'TRANSLOG.TRANS_CODE'
      Size = 10
    end
    object QryTransLogTRANS_DESCRIP: TStringField
      DisplayLabel = 'Tran Description'
      FieldName = 'TRANS_DESCRIP'
      Origin = 'TRANSLOG.TRANS_DESCRIP'
      Size = 25
    end
    object QryTransLogLOCATION_DESCRIP: TStringField
      DisplayLabel = 'Location Description'
      FieldName = 'LOCATION_DESCRIP'
      Origin = 'TRANSLOG.LOCATION_DESCRIP'
      Size = 50
    end
    object QryTransLogEXCLUDE_RPT: TStringField
      FieldName = 'EXCLUDE_RPT'
      Origin = 'TRANSLOG.EXCLUDE_RPT'
      Visible = False
      Size = 1
    end
    object QryTransLogWORKORDER_ID: TBCDField
      Tag = 1
      DisplayLabel = 'WO #'
      FieldName = 'WORKORDER_ID'
      Origin = 'TRANSLOG.WORKORDER_ID'
      Size = 0
    end
    object QryTransLogParent_ItemNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Parent_ItemNo'
      LookupDataSet = Query1
      LookupKeyFields = 'ARINVT_ID'
      LookupResultField = 'ITEMNO'
      KeyFields = 'PARENT_ARINVT_ID'
      Calculated = True
    end
    object QryTransLogSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'TRANSLOG.SOURCE'
      Visible = False
      Size = 50
    end
    object QryTransLogSOURCE_ID: TBCDField
      Tag = 1
      FieldName = 'SOURCE_ID'
      Origin = 'TRANSLOG.SOURCE_ID'
      Visible = False
      Size = 0
    end
    object QryTransLogBEGIN_QUAN_TOTAL: TFMTBCDField
      DisplayLabel = 'Total Start Qty'
      FieldName = 'BEGIN_QUAN_TOTAL'
      Origin = 'TRANSLOG.BEGIN_QUAN_TOTAL'
      Size = 6
    end
    object QryTransLogBEGIN_RG_QUAN_TOTAL: TFMTBCDField
      DisplayLabel = 'Total Start RG'
      FieldName = 'BEGIN_RG_QUAN_TOTAL'
      Origin = 'TRANSLOG.BEGIN_RG_QUAN_TOTAL'
      Size = 6
    end
    object QryTransLogEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.TRANSLOG.EPLANT_ID'
      Size = 0
    end
    object QryTransLogPOSTED: TStringField
      DisplayLabel = 'Posted'
      FieldName = 'POSTED'
      Origin = 'IQ.TRANSLOG.POSTED'
      FixedChar = True
      Size = 1
    end
    object QryTransLogID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'TRANSLOG.ID'
      Visible = False
      Size = 0
    end
    object QryTransLogSYSTEM_DATE: TDateTimeField
      DisplayLabel = 'System Date'
      FieldName = 'SYSTEM_DATE'
      Origin = 'IQ.TRANSLOG.ACT_DATE'
    end
    object QryTransLogCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'IQ.TRANSLOG.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryTransLogITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'IQ.TRANSLOG.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryTransLogREV: TStringField
      DisplayLabel = 'Revision'
      FieldName = 'REV'
      Origin = 'IQ.TRANSLOG.REV'
      FixedChar = True
      Size = 15
    end
    object QryTransLogDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.TRANSLOG.DESCRIP'
      Size = 100
    end
    object QryTransLogDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      FieldName = 'DESCRIP2'
      Origin = 'IQ.TRANSLOG.DESCRIP2'
      Size = 100
    end
    object QryTransLogCOST_ELEMENT: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'COST_ELEMENT'
      Origin = 'IQ.TRANSLOG.COST_ELEMENT'
      FixedChar = True
      Size = 30
    end
    object QryTransLogMFGNO: TStringField
      DisplayLabel = 'MFG #'
      FieldName = 'MFGNO'
      Origin = 'IQ.TRANSLOG.MFGNO'
      Size = 50
    end
    object QryTransLogDAY_PART_ID: TBCDField
      Tag = 1
      FieldName = 'DAY_PART_ID'
      Origin = 'IQ.TRANSLOG.DAY_PART_ID'
      Size = 0
    end
    object QryTransLogRECEIPT_COMMENT: TStringField
      DisplayLabel = 'Comment'
      FieldName = 'RECEIPT_COMMENT'
      Origin = 'IQ.TRANSLOG.RECEIPT_COMMENT'
      Size = 250
    end
    object QryTransLogFGMULTI_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Location ID'
      FieldName = 'FGMULTI_ID'
      Origin = 'IQ.TRANSLOG.FGMULTI_ID'
      Size = 0
    end
    object QryTransLogEND_QUAN: TFMTBCDField
      DisplayLabel = 'End Qty'
      FieldName = 'END_QUAN'
      Size = 38
    end
    object QryTransLogEND_RG_QUAN: TFMTBCDField
      DisplayLabel = 'End RG Qty'
      FieldName = 'END_RG_QUAN'
      Size = 38
    end
    object QryTransLogPO_RECEIPTS_UNIT_PRICE: TFMTBCDField
      FieldName = 'PO_RECEIPTS_UNIT_PRICE'
      Origin = 'PO_RECEIPTS_UNIT_PRICE'
      Precision = 15
      Size = 6
    end
  end
  object SrcTransLog: TDataSource
    DataSet = QryTransLog
    Left = 32
    Top = 112
  end
  object Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select arinvt_ID, '
      '       itemno'
      '  from translog')
    Left = 92
    Top = 88
    object Query1ARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'TRANSLOG.ARINVT_ID'
      Size = 0
    end
    object Query1ITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'TRANSLOG.ITEMNO'
      Size = 50
    end
  end
  object pmenuColTitle: TUniPopupMenu
    Left = 136
    Top = 88
    object DefineColumnTitle1: TUniMenuItem
      Caption = 'Define Column Title'
      OnClick = DefineColumnTitle1Click
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'pmenuColTitle'
      'QryTransLogACT_COST'
      'QryTransLogSTD_COST'
      'ExcludeFromReport1'
      'EditItemLot1'
      'JumptoVendorRMA1')
    SecurityCode = 'FRMTRANSLOG'
    Left = 176
    Top = 88
  end
  object popmTranslog: TUniPopupMenu
    OnPopup = popmTranslogPopup
    Left = 230
    Top = 86
    object ExcludeFromReport1: TUniMenuItem
      Caption = 'Exclude from Report'
      OnClick = ExcludeFromReport1Click
    end
    object ParentItem1: TUniMenuItem
      Caption = 'Parent &Item'
      OnClick = ParentItem1Click
    end
    object ConsumedVMISN1: TUniMenuItem
      Caption = 'Consumed &VMI SN#'
      OnClick = ConsumedVMISN1Click
    end
    object EditItemLot1: TUniMenuItem
      Caption = 'Edit Item Lot #'
      OnClick = EditItemLot1Click
    end
    object ShowSerialNumbers1: TUniMenuItem
      Caption = 'Show Serial Numbers'
      OnClick = ShowSerialNumbers1Click
    end
    object CountryOfOrigin1: TUniMenuItem
      Caption = 'Country Of Origin'
      OnClick = CountryOfOrigin1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object JumptoPO1: TUniMenuItem
      Caption = 'Jump to &PO'
      OnClick = JumptoPO1Click
    end
    object JumptoPackSlip1: TUniMenuItem
      Caption = 'Jump to Pack&Slip'
      OnClick = JumptoPO1Click
    end
    object JumptoRMA1: TUniMenuItem
      Caption = 'Jump to Customer &RMA'
      OnClick = JumptoPO1Click
    end
    object JumptoVendorRMA1: TUniMenuItem
      Caption = 'Jump to &Vendor RMA'
      OnClick = JumptoPO1Click
    end
    object JumpToProductionReporting1: TUniMenuItem
      Caption = 'Jump To P&roduction Reporting'
      OnClick = JumpToProductionReporting1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object About1: TUniMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmTransLog'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192568 $'
    BuildVersion = '176554'
    Left = 263
    Top = 86
  end
  object PkTranslog: TIQWebHpick
    ConnectionName = 'IQFD'
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = SrcTransLog
    ForceShowWaitForPrompt = False
    Left = 94
    Top = 123
  end
end
