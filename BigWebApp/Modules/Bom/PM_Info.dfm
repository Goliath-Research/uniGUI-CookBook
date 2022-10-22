object PMinfo: TPMinfo
  Left = 235
  Top = 215
  HelpContext = 1241342
  ClientHeight = 196
  ClientWidth = 388
  Caption = 'MRO'
  OnShow = FormShow
  OnResize = FormResize
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 281
    Height = 196
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 279
      Height = 194
      Hint = ''
      Caption = '  MRO '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object PnlClient01: TUniPanel
        Tag = 1999
        Left = 2
        Top = 15
        Width = 275
        Height = 177
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitWidth = 261
        ExplicitHeight = 163
        object Splitter1: TUniSplitter
          Left = 105
          Top = 0
          Width = 6
          Height = 177
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft01: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 105
          Height = 175
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object lblEquipmentNumber: TUniLabel
            Left = 8
            Top = 12
            Width = 61
            Height = 13
            Hint = ''
            Caption = 'Equipment #'
            TabOrder = 1
          end
          object lblDescription: TUniLabel
            Left = 8
            Top = 36
            Width = 53
            Height = 13
            Hint = ''
            Caption = 'Description'
            TabOrder = 2
          end
          object lblClass: TUniLabel
            Left = 8
            Top = 60
            Width = 25
            Height = 13
            Hint = ''
            Caption = 'Class'
            TabOrder = 3
          end
          object lblLocation: TUniLabel
            Left = 8
            Top = 84
            Width = 40
            Height = 13
            Hint = ''
            Caption = 'Location'
            TabOrder = 4
          end
          object lblServiceDateOut: TUniLabel
            Left = 8
            Top = 108
            Width = 85
            Height = 13
            Hint = ''
            Caption = 'Service Date OUT'
            TabOrder = 5
          end
          object lblServiceDateIn: TUniLabel
            Left = 8
            Top = 132
            Width = 75
            Height = 13
            Hint = ''
            Caption = 'Service Date IN'
            TabOrder = 6
          end
        end
        object PnlClient02: TUniPanel
          Tag = 1999
          Left = 111
          Top = 1
          Width = 164
          Height = 175
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            164
            175)
          object Eqno: TUniDBEdit
            Left = 1
            Top = 8
            Width = 147
            Height = 21
            Hint = ''
            DataField = 'EQNO'
            DataSource = SrcPmEqmt
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object DBEdit2: TUniDBEdit
            Left = 1
            Top = 32
            Width = 147
            Height = 21
            Hint = ''
            DataField = 'DESCRIP'
            DataSource = SrcPmEqmt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object DBComboBox1: TUniDBComboBox
            Left = 1
            Top = 56
            Width = 80
            Height = 21
            Hint = ''
            DataField = 'CLASS'
            DataSource = SrcPmEqmt
            Items.Strings = (
              'TL'
              'MT'
              'QC')
            TabOrder = 2
          end
          object wwDBLookupCombo1: TUniDBLookupComboBox
            Left = 1
            Top = 80
            Width = 147
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            DataField = 'LOCATIONS_ID'
            DataSource = SrcPmEqmt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Color = clWindow
          end
          object wwDateTimeServiceOUT: TUniDBDateTimePicker
            Left = 1
            Top = 104
            Width = 147
            Height = 21
            Hint = ''
            DataField = 'SERVICE_DATE_OUT'
            DataSource = SrcPmEqmt
            DateTime = 42640.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object wwDateTimeServiceIN: TUniDBDateTimePicker
            Left = 1
            Top = 128
            Width = 147
            Height = 21
            Hint = ''
            DataField = 'SERVICE_DATE_IN'
            DataSource = SrcPmEqmt
            DateTime = 42640.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
        end
      end
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 281
    Top = 0
    Width = 107
    Height = 196
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object bbtnOK: TUniBitBtn
      Left = 4
      Top = 11
      Width = 97
      Height = 25
      Hint = ''
      Enabled = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      Caption = 'OK'
      TabOrder = 0
      Default = True
      OnClick = bbtnOKClick
    end
    object bbtnCancel: TUniBitBtn
      Left = 4
      Top = 44
      Width = 97
      Height = 25
      Hint = ''
      Caption = ''
      TabOrder = 1
      OnClick = bbtnCancelClick
    end
    object bbtnNew: TUniBitBtn
      Left = 4
      Top = 78
      Width = 97
      Height = 25
      Hint = ''
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        B0A0906048306048306048306048306048306048306048306048306048306048
        30FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E46464646464646464646464646
        4646464646464646464646464646464646FF00FFFF00FFFF00FFFF00FFFF00FF
        B0A090FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0906048
        30FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EFF00FF9E9E9E9E9E9E9E9E9E9E
        9E9E9E9E9E9E9E9E9E9E9E9E9E9E464646FF00FFFF00FFFF00FFFF00FFFF00FF
        B0A090FFFFFFFFFFFFFFF8FFF0F0F0F0E8E0F0E0D0E0D0D0E0C8C0B0A0906048
        30FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF9E9E9E464646FF00FFFF00FFFF00FFFF00FFFF00FF
        B0A090FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E0E0F0D8D0E0D0C0B0A0906048
        30FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF9E9E9E464646FF00FFFF00FFFF00FFFF00FFFF00FF
        B0A090FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E8E0F0E0E0E0D8D0B0A0906048
        30FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF9E9E9E464646FF00FFFF00FFFF00FFFF00FFFF00FF
        C0A890FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B0A0906048
        30FF00FFFF00FFFF00FFFF00FFFF00FFA5A5A5FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF9E9E9E464646FF00FFFF00FFFF00FFFF00FFFF00FF
        C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0E0E0B0A0906048
        30FF00FFFF00FFFF00FFFF00FFFF00FFA8A8A8FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF9E9E9E464646FF00FFFF00FFFF00FFFF00FFFF00FF
        C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0E8E0B0A0906048
        30FF00FFFF00FFFF00FFFF00FFFF00FFAEAEAEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF9E9E9E464646FF00FFFF00FFFF00FFFF00FFFF00FF
        D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0B0A0906048
        30FF00FFFF00FFFF00FFFF00FFFF00FFAFAFAFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF9E9E9E464646FF00FFFF00FFFF00FFFF00FFFF00FF
        D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090B0A0906048
        30FF00FFFF00FFFF00FFFF00FFFF00FFB5B5B5FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF9E9E9E9E9E9E464646FF00FFFF00FFFF00FFFF00FFFF00FF
        D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
        30FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF9E9E9E464646464646464646FF00FFFF00FFFF00FFFF00FFFF00FF
        D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830E3C7
        B5FF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA5A5A5C7C7C7464646C6C6C6FF00FFFF00FFFF00FFFF00FFFF00FF
        E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E3C7B6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFC0C0C0FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA8A8A8464646C6C6C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E3C7B7FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BE
        BEBEB8B8B8AFAFAFC6C6C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = 'New'
      TabOrder = 2
      OnClick = bbtnNewClick
    end
    object bbtnPick: TUniBitBtn
      Left = 4
      Top = 111
      Width = 97
      Height = 25
      Hint = 'Pick Equipment based on Class (see Drop-Down box on the form)'
      ShowHint = True
      ParentShowHint = False
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
      Caption = 'Pick'
      TabOrder = 3
      OnClick = bbtnPickClick
    end
  end
  object SrcPmEqmt: TDataSource
    DataSet = TblPmEqmt
    OnStateChange = SrcPmEqmtStateChange
    Left = 312
    Top = 136
  end
  object TblPmEqmt: TFDTable
    BeforeOpen = TblPmEqmtBeforeOpen
    AfterInsert = TblPmEqmtAfterInsert
    BeforePost = TblPmEqmtBeforePost
    Filtered = True
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PMEQMT'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'PMEQMT'
    Left = 312
    Top = 152
    object TblPmEqmtID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblPmEqmtEQNO: TStringField
      FieldName = 'EQNO'
      Required = True
      Size = 25
    end
    object TblPmEqmtCLASS: TStringField
      FieldName = 'CLASS'
      Required = True
      Size = 2
    end
    object TblPmEqmtDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object TblPmEqmtLOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 30
    end
    object TblPmEqmtSERVICE_DATE_OUT: TDateTimeField
      DisplayLabel = 'Service Date OUT'
      FieldName = 'SERVICE_DATE_OUT'
      EditMask = '!99/99/0000 99:99:99;1; '
    end
    object TblPmEqmtSERVICE_DATE_IN: TDateTimeField
      DisplayLabel = 'Service Date IN'
      FieldName = 'SERVICE_DATE_IN'
      EditMask = '!99/99/0000 99:99:99;1; '
    end
    object TblPmEqmtUOM: TStringField
      FieldName = 'UOM'
      Size = 10
    end
    object TblPmEqmtLOCATIONS_ID: TBCDField
      FieldName = 'LOCATIONS_ID'
      Size = 0
    end
  end
  object PkEQMT: TIQWebHpick
    BeforeOpen = PkEQMTBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, '
      '       eqno,'
      '       descrip,'
      '       class,'
      '       location,'
      '       eplant_id,'
      '       pk_hide'
      '  from pmeqmt'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 216
    object PkEQMTID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkEQMTEQNO: TStringField
      DisplayLabel = 'Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
    object PkEQMTDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkEQMTCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkEQMTLOCATION: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOCATION'
      Size = 30
    end
    object PkEQMTEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.PMEQMT.EPLANT_ID'
      Size = 0
    end
    object PkEQMTPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.PMEQMT.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object wwQryLocations: TFDQuery
    BeforeOpen = wwQryLocationsBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select l.id,'
      '       l.loc_desc,'
      '       l.descrip,'
      
        '       decode( l.eplant_id, NULL, '#39' '#39', '#39'['#39' || e.id || '#39']'#39' || '#39' '#39 +
        ' || e.name) as eplant_name,'
      '       l.division_id,'
      '       l.eplant_id'
      '  from locations l,'
      '       eplant e'
      ' where l.eplant_id = e.id(+)'
      ' order by'
      '       l.loc_desc')
    Left = 272
    Top = 151
    object wwQryLocationsLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 20
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object wwQryLocationsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Size = 50
    end
    object wwQryLocationsEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 15
      FieldName = 'EPLANT_NAME'
      Size = 73
    end
    object wwQryLocationsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object wwQryLocationsDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object wwQryLocationsEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'PMinfo')
    SecurityItems.Strings = (
      'wwDateTimeServiceIN'
      'wwDateTimeServiceOUT'
      'bbtnOK'
      'bbtnNew'
      'bbtnPick'
      'TblPmEqmt')
    SecurityCode = 'PMINFO'
    Left = 181
    Top = 65533
  end
end
