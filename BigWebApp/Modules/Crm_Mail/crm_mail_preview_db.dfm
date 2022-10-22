object FrmCRMMassMailPreviewDB: TFrmCRMMassMailPreviewDB
  Left = 0
  Top = 0
  ClientHeight = 709
  ClientWidth = 1004
  Caption = 'Preview Email'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 337
    Top = 27
    Width = 6
    Height = 682
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object PnlToolbar: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 1004
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object NavMain: TUniDBNavigator
      Left = 904
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcData
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object PnlPreview: TUniPanel
    Tag = 1999
    Left = 343
    Top = 27
    Width = 661
    Height = 682
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    Color = clWhite
  end
  object PnlList: TUniPanel
    Left = 0
    Top = 27
    Width = 337
    Height = 682
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 2
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 25
      Top = 26
      Width = 312
      Height = 656
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 95
      IQComponents.Grid.Height = 570
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcData
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
      IQComponents.Navigator.DataSource = SrcData
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 95
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 570
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcData
      Columns = <
        item
          FieldName = 'SEQ'
          Title.Caption = '#'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRINCIPLE_COMPANY'
          Title.Caption = 'Company'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRINCIPLE_FIRST_NAME'
          Title.Caption = 'First Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRINCIPLE_LAST_NAME'
          Title.Caption = 'Last Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object PnlSideBar: TUniPanel
      Tag = 1999
      Left = 1
      Top = 26
      Width = 25
      Height = 656
      Hint = ''
      Visible = False
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      ShowCaption = False
      Caption = ''
      object bvSideBar1: TUniPanel
        Left = 1
        Top = 23
        Width = 23
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
      end
      object PnlExpandPane: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 23
        Height = 23
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ShowCaption = False
        Caption = ''
        DesignSize = (
          23
          23)
        object sbtnExpandPane: TUniSpeedButton
          Tag = 1999
          Left = 2
          Top = 1
          Width = 20
          Height = 22
          Hint = 'Show'
          ShowHint = True
          ParentShowHint = False
          Caption = #187
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = clGrayText
          Font.Name = 'System'
          ParentColor = False
          Color = clWindow
          OnClick = sbtnExpandPaneClick
        end
      end
    end
    object PnlCloseList: TUniPanel
      Left = 1
      Top = 1
      Width = 335
      Height = 26
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      DesignSize = (
        335
        26)
      object PnlCollapseStatistics: TUniPanel
        Tag = 1999
        Left = 312
        Top = 1
        Width = 25
        Height = 25
        Hint = ''
        Anchors = [akTop, akRight]
        TabOrder = 0
        ShowCaption = False
        Caption = ''
        ParentColor = True
        object sbtnCollapsePane: TUniSpeedButton
          Tag = 1999
          Left = 1
          Top = 1
          Width = 20
          Height = 22
          Hint = 'Hide'
          ShowHint = True
          ParentShowHint = False
          Caption = #171
          ParentFont = False
          Font.Color = clGrayText
          Font.Name = 'System'
          ParentColor = False
          Color = clWindow
          OnClick = sbtnCollapsePaneClick
        end
      end
    end
  end
  object SrcData: TDataSource
    DataSet = QryData
    Left = 216
    Top = 184
  end
  object QryData: TFDQuery
    Active = True
    BeforeOpen = QryDataBeforeOpen
    AfterScroll = QryDataAfterScroll
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT b.id AS id,'
      '         b.seq AS seq,'
      '         a.description AS subject,'
      '         a.message_format AS message_format,'
      '         a.sender_name AS sender_name,'
      '         a.sender_address AS sender_address,'
      '         b.principle_contact_email AS recipient_address,'
      '         b.principle_first_name AS principle_first_name,'
      '         b.principle_last_name AS principle_last_name,'
      '         b.principle_company AS principle_company'
      '    FROM crm_mailing a, crm_mailing_recipient b'
      '   WHERE a.id = :CRM_MAILING_ID AND'
      '         b.crm_mailing_id = a.id AND'
      '         b.principle_contact_email IS NOT NULL AND'
      '         NVL(b.principle_pk_hide, '#39'N'#39') <> '#39'Y'#39
      'ORDER BY b.seq')
    Left = 240
    Top = 192
    ParamData = <
      item
        Name = 'CRM_MAILING_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDataID: TBCDField
      FieldName = 'ID'
      Origin = 'b.id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryDataSEQ: TBCDField
      FieldName = 'SEQ'
      Origin = 'b.seq'
      Precision = 15
      Size = 0
    end
    object QryDataSUBJECT: TStringField
      FieldName = 'SUBJECT'
      Origin = 'b.subject'
      Visible = False
      Size = 250
    end
    object QryDataMESSAGE_FORMAT: TStringField
      FieldName = 'MESSAGE_FORMAT'
      Origin = 'b.message_format'
      Visible = False
      Size = 12
    end
    object QryDataSENDER_NAME: TStringField
      FieldName = 'SENDER_NAME'
      Origin = 'a.sender_name'
      Visible = False
      Size = 255
    end
    object QryDataSENDER_ADDRESS: TStringField
      FieldName = 'SENDER_ADDRESS'
      Origin = 'a.sender_address'
      Visible = False
      Size = 255
    end
    object QryDataRECIPIENT_ADDRESS: TStringField
      FieldName = 'RECIPIENT_ADDRESS'
      Origin = 'b.principle_contact_email'
      Visible = False
      Size = 250
    end
    object QryDataPRINCIPLE_FIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_FIRST_NAME'
      Origin = 'b.principle_first_name'
      Size = 30
    end
    object QryDataPRINCIPLE_LAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_LAST_NAME'
      Origin = 'b.principle_last_name'
      Size = 30
    end
    object QryDataPRINCIPLE_COMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 12
      FieldName = 'PRINCIPLE_COMPANY'
      Origin = 'b.principle_company'
      Size = 60
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 496
    Top = 360
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
  end
end
