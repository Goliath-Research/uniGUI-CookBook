object FrmReprintLabels: TFrmReprintLabels
  Left = 0
  Top = 0
  ClientHeight = 209
  ClientWidth = 392
  Caption = 'Confirm'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CaptionPanel1: TIQWebCaptionPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 57
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = 'Reprint Labels'
    ParentColor = True
    Text = 'About to reprint selected labels - please confirm to continue'
    Picture.Data = {
      07544269746D617036030000424D360300000000000036000000280000001000
      000010000000010018000000000000030000120B0000120B0000000000000000
      0000FF00FFFF00FFFF00FFFF00FFCBCACAA67D78824136733325733325814135
      A47B76CAC8C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAB85816725
      106729007F39009545009646007E390067290062230FA9827EFF00FFFF00FFFF
      00FFFF00FFFF00FF9E6D675D2002944300E07347DF4307DD4002DC4002DC440C
      E081599F4A0056200197635CFF00FFFF00FFFF00FFAB8682602102B66400E04C
      10E44A09D44509BB917DAA8371C14B1AE04909DF541DCB6F00602301AA847FFF
      00FFCBCACA6F260FAA5E07E25517E75715E75715CF4F15F9F6F5D8D8D8B65629
      E25615E25615DF5C23BA6B0F66250ECAC8C8A77C76784000E07847E96820E968
      20EA6820D25E1EFAF7F6DBDBDBB76131E46620E36420E36420E39069844603A4
      78739B6141AC7106E46421EA772CEC782CEE792CD76E29FAF9F7DBDBDBBA6E3A
      E8762CE6752CE3742CDD692BAA67038C4936996F32CE880AE8792FED8737EE87
      37F08939DA7D34FAF9F7DBDBDBBC7841EA8637E88537E68336E06C25C7760088
      44259B7732C87F00E98337EE9441F09642F49844DF924AFAF9F9E0E0E0BF864B
      EE9643E99241E79040E0732CBE6F00864125A17E489D6D00E77D35EF9F4DF1A3
      4FF7A954EAA95DE2D2BCE0CFB7D79F5CF3A955EDA04FE89B4CE07C3B9E59008C
      4636AD8E7E957E00DC8655F0A658F4AD5DF9B664F7B867C19F71B89A71EEB264
      F5B666F0AD60ECA558E89D757F3500A47873CBCACAA19115A26700E98B4AF6B6
      6CFABD72DCAB6DF1F1F0D6D6D6C6A373F6BB71F3B66EE4884CAF5E0071260ECA
      C7C7FF00FFB297879B9601BA6B00EC9153FABF7BEEB776F4F0ECF2EFEBE0B074
      F6BC78E88F54B6742C713001A9807CFF00FFFF00FFFF00FFA88D6B999801A263
      00DB9167EA8B4EE69153E28D52E88C51E098729E5503733C009C655BFF00FFFF
      00FFFF00FFFF00FFFF00FFB29988A1A2158A8700896500A16800A06800835900
      765800845A18AF847AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCAC8
      C7B3A47AA99D41A298289F9328A18A40AB8B77CAC6C6FF00FFFF00FFFF00FFFF
      00FF}
    PictureLayout = plImageRight
    LayoutStyle = lsBasic
    DesignSize = (
      392
      57)
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 166
    Width = 392
    Height = 43
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 173
      Top = 1
      Width = 219
      Height = 41
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 57
    Width = 392
    Height = 109
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 89
      Top = 0
      Width = 4
      Height = 109
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 89
      Height = 107
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblPrinter: TUniLabel
        Left = 8
        Top = 38
        Width = 32
        Height = 13
        Hint = ''
        Caption = 'Printer'
        TabOrder = 1
      end
      object Label5: TUniLabel
        Left = 8
        Top = 14
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'Label'
        TabOrder = 2
      end
    end
    object Panel5: TUniPanel
      Left = 93
      Top = 1
      Width = 299
      Height = 107
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        299
        107)
      object wwDBComboPrinter: TUniDBComboBox
        Left = 1
        Top = 35
        Width = 288
        Height = 21
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object wwLabels: TUniDBLookupComboBox
        Left = 1
        Top = 11
        Width = 288
        Height = 21
        Hint = ''
        ListField = 'LABEL_MENU_NAME'
        ListSource = SrcLabels
        KeyField = 'ID'
        ListFieldIndex = 0
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clWindow
        OnChange = wwLabelsChange
      end
    end
  end
  object SrcLabels: TDataSource
    DataSet = QryLabels
    Left = 125
    Top = 133
  end
  object QryLabels: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       label_menu_name,'
      '       label_type'
      '  from lm_labels'
      ' where'
      '       misc.eplant_filter(eplant_id) = 1'
      '  and ( RTrim(report_name) is not NULL'
      '        or'
      '        label_template_id is not null'
      '        or'
      
        '        exists ( select 1 from lm_labels_detail where lm_labels_' +
        'id = lm_labels.id ))'
      'order by '
      '       label_menu_name')
    Left = 45
    Top = 121
    object QryLabelsLABEL_MENU_NAME: TStringField
      DisplayLabel = 'Label'
      DisplayWidth = 25
      FieldName = 'LABEL_MENU_NAME'
      Origin = 'LABEL_MENU_NAME'
      Required = True
      Size = 25
    end
    object QryLabelsLABEL_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 25
      FieldName = 'LABEL_TYPE'
      Origin = 'LABEL_TYPE'
      Required = True
      Size = 25
    end
    object QryLabelsID: TBCDField
      DisplayWidth = 16
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
end
