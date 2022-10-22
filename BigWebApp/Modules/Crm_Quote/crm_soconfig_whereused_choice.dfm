object FrmCRMSalesChoiceWhereUsed: TFrmCRMSalesChoiceWhereUsed
  Left = 542
  Top = 324
  ClientHeight = 328
  ClientWidth = 618
  Caption = 'Where Used'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 287
    Width = 618
    Height = 41
    Hint = ''
    Visible = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 408
      Top = 1
      Width = 210
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
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlToolbar: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 618
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object sbtnModify: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Replace'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000232E0000232E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9933009933009933
        00993300993300C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF808080808080808080808080808080C0C0C0FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC13F00FF8000CC66
        00CC6600993300C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF808080FFFFFF808080808080808080C0C0C0FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC13F00FF8000CC66
        00CC6600993300C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF808080FFFFFF808080808080808080C0C0C0FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC13F00FF8000FF80
        00FF8000993300C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF808080FFFFFFFFFFFFFFFFFF808080C0C0C0FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC13F00C13F00C13F
        00C13F00993300FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF808080808080808080808080808080FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
        00C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000
        00000000C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF808080808080808080FFFFFFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000
        00000000000000C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF808080808080808080808080808080FFFFFFFF00FFFF00FF
        FF00FF006600C0C0C0FF00FFFF00FFFF00FFFF00FF0000000000000000000000
        00000000000000000000FF00FFFF00FFFF00FF808080FFFFFFFF00FFFF00FFFF
        00FFFF00FF808080808080808080808080808080808080808080FF00FFFF00FF
        006600148E14006600C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FF0000000000
        00000000C0C0C0FF00FFFF00FFFF00FF8080807A7A7A808080FFFFFFFF00FFFF
        00FFFF00FFFF00FFFF00FF808080808080808080FFFFFFFF00FFFF00FF006600
        148E1470B066148E14006600C0C0C0FF00FFFF00FFFF00FFFF00FF0000000000
        00000000C0C0C0FF00FFFF00FF8080807A7A7AA0A0A07A7A7A808080FFFFFFFF
        00FFFF00FFFF00FFFF00FF808080808080808080FFFFFFFF00FF00840066FF99
        7ABA7275B56C70B066148E14006600FF00FFFF00FFFF00FF0000000000000000
        00C0C0C0FF00FFFF00FF808080FFFFFFAAAAAAA5A5A5A0A0A07A7A7A808080FF
        00FFFF00FFFF00FF808080808080808080FFFFFFFF00FFFF00FFFF00FF008400
        66FF997ABA7275B56C006600FF00FF000000000000000000000000000000C0C0
        C0FF00FFFF00FFFF00FFFF00FF808080FFFFFFAAAAAAA5A5A5808080FF00FF80
        8080808080808080808080808080FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
        00840066FF99006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFF808080FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF008400FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnModifyClick
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 27
    Width = 618
    Height = 260
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 616
      Height = 258
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 399
      IQComponents.Grid.Height = 172
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
      IQComponents.HiddenPanel.Left = 399
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 172
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
          FieldName = 'TEMPLATE_DESCRIP'
          Title.Caption = 'Template'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SALES_OPTION_DESCRIP'
          Title.Caption = 'Sales Option'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRICE'
          Title.Caption = 'Price'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object SrcData: TDataSource
    DataSet = QryData
    OnDataChange = SrcDataDataChange
    Left = 240
    Top = 131
  end
  object QryData: TFDQuery
    BeforeOpen = QryDataBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'SELECT a.descrip AS template_descrip, e.descrip AS template_item' +
        '_type,'
      
        '       d.descrip AS sales_option_descrip, h.code, h.descrip, c.p' +
        'rice,'
      '       f.descrip AS choice_item_type, g.acct AS choice_gl_acct,'
      
        '       g.descrip AS choice_gl_acct_descrip, c.markup, c.markup_t' +
        'ype,'
      '       c.id'
      
        '  FROM sales_config a, sales_config_option b, sales_option_choic' +
        'e c,'
      
        '       sales_option d, item_type e, item_type f, glacct g, sales' +
        '_choice h'
      ' WHERE c.sales_choice_id = :ID AND'
      '       b.id = c.sales_config_option_id AND'
      '       a.id = b.sales_config_id AND'
      '       NVL(a.pk_hide, '#39'N'#39') = '#39'N'#39' AND'
      '       NVL(c.pk_hide, '#39'N'#39') = '#39'N'#39' AND'
      '       d.id(+) = b.sales_option_id AND'
      '       e.id(+) = a.item_type_id AND'
      '       f.id(+) = c.item_type_id AND'
      '       g.id(+) = c.glacct_id_sales AND'
      '       h.id(+) = c.sales_choice_id')
    Left = 248
    Top = 144
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDataTEMPLATE_DESCRIP: TStringField
      DisplayLabel = 'Template'
      DisplayWidth = 29
      FieldName = 'TEMPLATE_DESCRIP'
      Origin = 'a.descrip'
      Size = 60
    end
    object QryDataSALES_OPTION_DESCRIP: TStringField
      DisplayLabel = 'Sales Option'
      DisplayWidth = 22
      FieldName = 'SALES_OPTION_DESCRIP'
      Origin = 'd.descrip'
      Size = 60
    end
    object QryDataPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'PRICE'
      Origin = 'c.price'
      Size = 6
    end
    object QryDataCODE: TStringField
      DisplayLabel = 'Choice Code'
      DisplayWidth = 26
      FieldName = 'CODE'
      Origin = 'h.code'
      Visible = False
      Size = 30
    end
    object QryDataDESCRIP: TStringField
      DisplayLabel = 'Choice Description'
      DisplayWidth = 31
      FieldName = 'DESCRIP'
      Origin = 'h.descrip'
      Visible = False
      Size = 60
    end
    object QryDataCHOICE_ITEM_TYPE: TStringField
      DisplayLabel = 'Choice Teir Type'
      DisplayWidth = 20
      FieldName = 'CHOICE_ITEM_TYPE'
      Origin = 'f.descrip'
      Visible = False
      Size = 50
    end
    object QryDataTEMPLATE_ITEM_TYPE: TStringField
      DisplayLabel = 'Template Tier Type'
      DisplayWidth = 19
      FieldName = 'TEMPLATE_ITEM_TYPE'
      Origin = 'e.descrip'
      Visible = False
      Size = 50
    end
    object QryDataCHOICE_GL_ACCT: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 17
      FieldName = 'CHOICE_GL_ACCT'
      Origin = 'g.acct'
      Visible = False
      Size = 50
    end
    object QryDataCHOICE_GL_ACCT_DESCRIP: TStringField
      DisplayLabel = 'GL Account Description'
      DisplayWidth = 23
      FieldName = 'CHOICE_GL_ACCT_DESCRIP'
      Origin = 'g.descrip'
      Visible = False
      Size = 50
    end
    object QryDataMARKUP: TFMTBCDField
      DisplayLabel = 'Mark Up'
      DisplayWidth = 10
      FieldName = 'MARKUP'
      Origin = 'c.markup'
      Visible = False
      Size = 6
    end
    object QryDataMARKUP_TYPE: TBCDField
      Tag = 1
      DisplayLabel = 'Mark Up Type'
      DisplayWidth = 11
      FieldName = 'MARKUP_TYPE'
      Origin = 'c.markup_type'
      Visible = False
      Size = 0
    end
    object QryDataID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'c.id'
      Visible = False
      Size = 0
    end
  end
  object PMain: TUniPopupMenu
    OnPopup = PMainPopup
    Left = 312
    Top = 131
    object JumptoTemplate1: TUniMenuItem
      Caption = 'Jump to Template'
      OnClick = JumptoTemplate1Click
    end
    object Replace1: TUniMenuItem
      Caption = 'Replace'
      OnClick = sbtnModifyClick
    end
  end
end
