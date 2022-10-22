object FrmPO_ReApproval_Rules: TFrmPO_ReApproval_Rules
  Left = 250
  Top = 147
  HelpContext = 999448
  ClientHeight = 432
  ClientWidth = 863
  Caption = 'PO Re-Approval Rules'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 863
    Height = 3
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object wwDataInspector1: TwwDataInspector
    Left = 0
    Top = 30
    Width = 863
    Height = 381
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DisableThemes = False
    Align = alClient
    CaptionColor = 14671839
    DataColumns = 5
    IndicatorRow.Enabled = True
    IndicatorRow.Caption = 'Parameters'
    IndicatorRow.Height = 20
    ScrollBars = ssBoth
    TabOrder = 0
    DataSource = SrcPoRarParams
    Items = <
      item
        DataSource = SrcPoRarParams
        DataField = 'SOURCE_NAME'
        Caption = 'System Default / EPlant'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = SrcPoRarParams
        DataField = 'SOURCE_ID'
        Caption = 'ID'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = SrcPoRarParams
        Caption = 'PO Re-Approval Rules'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcPoRarParams
            Caption = 'Unit Price Change'
            ReadOnly = True
            Expanded = True
            Items = <
              item
                DataSource = SrcPoRarParams
                DataField = 'PO_RAR_UNITPRICE_HIGHER'
                Caption = 'Higher'
                Expanded = True
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end
              item
                DataSource = SrcPoRarParams
                DataField = 'PO_RAR_UNITPRICE_LOWER'
                Caption = 'Lower'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcPoRarParams
            Caption = 'Unit Quantity Change'
            ReadOnly = True
            Expanded = True
            Items = <
              item
                DataSource = SrcPoRarParams
                DataField = 'PO_RAR_UNITQTY_HIGHER'
                Caption = 'Higher'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end
              item
                DataSource = SrcPoRarParams
                DataField = 'PO_RAR_UNITQTY_LOWER'
                Caption = 'Lower'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcPoRarParams
            Caption = 'Line Items'
            ReadOnly = True
            Expanded = True
            Items = <
              item
                DataSource = SrcPoRarParams
                DataField = 'PO_RAR_LINEITEMS_ADDED'
                Caption = 'Added'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end
              item
                DataSource = SrcPoRarParams
                DataField = 'PO_RAR_LINEITEMS_DELETED'
                Caption = 'Deleted'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcPoRarParams
            Caption = 'Releases'
            ReadOnly = True
            Expanded = True
            Items = <
              item
                DataSource = SrcPoRarParams
                DataField = 'PO_RAR_RELEASES_ADDED'
                Caption = 'Added'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end
              item
                DataSource = SrcPoRarParams
                DataField = 'PO_RAR_RELEASES_DELETED'
                Caption = 'Deleted'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcPoRarParams
            DataField = 'PO_RAR_GL_ACCT_CHANGED'
            Caption = 'GL Account Change'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            WordWrap = False
          end
          item
            DataSource = SrcPoRarParams
            DataField = 'PO_RAR_TERMS_CHANGED'
            Caption = 'Terms Change'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            WordWrap = False
          end>
        WordWrap = False
      end>
    DefaultRowHeight = 19
    CaptionWidth = 261
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert, ovFillNonCellArea]
    PaintOptions.ActiveRecordColor = clCream
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovLight3DLine
    LineStyleData = ovLight3DLine
    CaptionIndent = 16
    OnAfterSelectCell = wwDataInspector1AfterSelectCell
    OnDrawCaptionCell = wwDataInspector1DrawCaptionCell
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 863
    Height = 27
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object sbtnCopyFromDefault: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Assign from System Default parameters'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC07040B05830B05830A05020A050209048209048
        20904020804020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7171715C
        5C5C5C5C5C5353535353534A4A4A4A4A4A454545424242FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC07850FFF8F0D0B0A0D0B0A0D0B0A0C0B0A0C0A8
        A0C0A890904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979F7
        F7F7AFAFAFAFAFAFAFAFAFAEAEAEA8A8A8A5A5A5454545FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFD08860FFFFFFE09060D08050D08050D08050D080
        50C0A8A0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888FF
        FFFF909090808080808080808080808080A8A8A84A4A4AFF00FFB0A090604830
        604830604830604830604830D09070FFFFFFFFFFFFFFF0F0F0E0D0F0D0C0F0C0
        B0C0B0A0904820FF00FF9E9E9E464646464646464646464646464646909090FF
        FFFFFFFFFFF2F2F2DEDEDED0D0D0C1C1C1AEAEAE4A4A4AFF00FFB0A090FFF0F0
        F0E0D0E0D8D0E0D0C0E0C8C0E0A080FFFFFFF0A880E09870E09060D08050D080
        50D0B0A0A04820FF00FF9E9E9EF2F2F2DEDEDED7D7D7CECECEC9C9C9A0A0A0FF
        FFFFA8A8A8989898909090808080808080AFAFAF4D4D4DFF00FFB0A090FFF8F0
        E0B080E0A070E0A070D09870E0A890FFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0D0
        C0D0B0A0A05020FF00FF9E9E9EF7F7F7ACACAC9E9E9E9E9E9E969696A9A9A9FF
        FFFFFFFFFFFFFFFFF7F7F7E7E7E7D0D0D0AFAFAF535353FF00FFC0A890FFFFFF
        FFF8F0F0F0F0F0E8E0F0E0D0E0B8A0FFFFFFFFB090FFB090F0D8D0E09060B058
        30B05830A05020FF00FFA5A5A5FFFFFFF7F7F7F0F0F0E7E7E7DEDEDEB7B7B7FF
        FFFFB1B1B1B1B1B1D9D9D99090905C5C5C5C5C5C535353FF00FFC0A8A0FFFFFF
        FFC8A0F0B890E0B080E0A070F0C0A0FFFFFFFFFFFFFFFFFFFFFFFFF09870F0C8
        B0B05830E8BFA4FF00FFA8A8A8FFFFFFC6C6C6B6B6B6ACACAC9E9E9EBEBEBEFF
        FFFFFFFFFFFFFFFFFFFFFF9A9A9AC7C7C75C5C5CBEBEBEFF00FFC0B0A0FFFFFF
        FFFFFFFFF8FFFFF0F0F0E8E0F0C8B0FFFFFFFFFFFFFFFFFFFFFFFFF0A880C068
        30ECC4A6FF00FFFF00FFAEAEAEFFFFFFFFFFFFFAFAFAF2F2F2E7E7E7C7C7C7FF
        FFFFFFFFFFFFFFFFFFFFFFA8A8A86A6A6AC2C2C2FF00FFFF00FFD0B8B0FFFFFF
        FFD8C0FFD0B0F0E0D0B0A090F0C8B0F0C0B0F0C0B0F0B8A0F0B090F0B090F4CE
        B3FF00FFFF00FFFF00FFB8B8B8FFFFFFD7D7D7CECECEDEDEDE9E9E9EC7C7C7C1
        C1C1C1C1C1B8B8B8B0B0B0B0B0B0CCCCCCFF00FFFF00FFFF00FFD0C0B0FFFFFF
        FFFFFFFFFFFFFFFFFFC0A890D0C8C0907060DEC7B2FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFA5A5A5C7C7C770
        7070C5C5C5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0C0B0FFFFFF
        FFFFFFFFFFFFFFFFFFC0B0A0A08060DFC8B4FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFAEAEAE7D7D7DC6
        C6C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0C0B0E0C0B0
        D0C0B0D0C0B0D0B8B0D0B0A0E4CEBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFC0C0C0C0C0C0BEBEBEBEBEBEB8B8B8AFAFAFCDCDCDFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnCopyFromDefaultClick
    end
    object NavMain: TUniDBNavigator
      Left = 688
      Top = 1
      Width = 175
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcPoRarParams
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 411
    Width = 863
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object SrcPoRarParams: TDataSource
    DataSet = QryPoRarParams
    Left = 401
    Top = 127
  end
  object QryPoRarParams: TFDQuery
    AfterPost = QryPoRarParamsAfterPost
    CachedUpdates = True
    OnUpdateRecord = QryPoRarParamsUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      #9'source_name,'
      #9'source_table,'
      #9'source_id,'
      #9'PO_RAR_UNITPRICE_HIGHER,'
      #9'PO_RAR_UNITPRICE_LOWER,'
      #9'PO_RAR_UNITQTY_HIGHER,'
      #9'PO_RAR_UNITQTY_LOWER,'
      #9'PO_RAR_LINEITEMS_ADDED,'
      #9'PO_RAR_LINEITEMS_DELETED,'
      #9'PO_RAR_RELEASES_ADDED,'
      #9'PO_RAR_RELEASES_DELETED,'
      #9'PO_RAR_GL_ACCT_CHANGED,'
      #9'PO_RAR_TERMS_CHANGED'
      'from V_PO_RAR_PARAMS'
      'where'
      '    (source_id = 0)  or (misc.eplant_filter( source_id ) = 1)')
    Left = 401
    Top = 177
    object QryPoRarParamsSOURCE_NAME: TStringField
      FieldName = 'SOURCE_NAME'
      Size = 30
    end
    object QryPoRarParamsSOURCE_TABLE: TStringField
      FieldName = 'SOURCE_TABLE'
      FixedChar = True
      Size = 6
    end
    object QryPoRarParamsSOURCE_ID: TFMTBCDField
      FieldName = 'SOURCE_ID'
    end
    object QryPoRarParamsPO_RAR_UNITPRICE_HIGHER: TStringField
      FieldName = 'PO_RAR_UNITPRICE_HIGHER'
      Size = 1
    end
    object QryPoRarParamsPO_RAR_UNITPRICE_LOWER: TStringField
      FieldName = 'PO_RAR_UNITPRICE_LOWER'
      Size = 1
    end
    object QryPoRarParamsPO_RAR_UNITQTY_HIGHER: TStringField
      FieldName = 'PO_RAR_UNITQTY_HIGHER'
      Size = 1
    end
    object QryPoRarParamsPO_RAR_UNITQTY_LOWER: TStringField
      FieldName = 'PO_RAR_UNITQTY_LOWER'
      Size = 1
    end
    object QryPoRarParamsPO_RAR_LINEITEMS_ADDED: TStringField
      FieldName = 'PO_RAR_LINEITEMS_ADDED'
      Size = 1
    end
    object QryPoRarParamsPO_RAR_LINEITEMS_DELETED: TStringField
      FieldName = 'PO_RAR_LINEITEMS_DELETED'
      Size = 1
    end
    object QryPoRarParamsPO_RAR_RELEASES_ADDED: TStringField
      FieldName = 'PO_RAR_RELEASES_ADDED'
      Size = 1
    end
    object QryPoRarParamsPO_RAR_RELEASES_DELETED: TStringField
      FieldName = 'PO_RAR_RELEASES_DELETED'
      Size = 1
    end
    object QryPoRarParamsPO_RAR_GL_ACCT_CHANGED: TStringField
      FieldName = 'PO_RAR_GL_ACCT_CHANGED'
      Size = 1
    end
    object QryPoRarParamsPO_RAR_TERMS_CHANGED: TStringField
      FieldName = 'PO_RAR_TERMS_CHANGED'
      Size = 1
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 389
    Top = 73
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About ...'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmPO_ReApproval_Rules'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191696 $'
    BuildVersion = '176554'
    Left = 330
    Top = 73
  end
  object PKEplant: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       name'
      '  from eplant'
      ' where misc.eplant_filter( id ) = 1'
      '   and nvl(use_eplant_pk_tkt_params, '#39'N'#39') = '#39'N'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 453
    Top = 71
    object PKEplantID: TFloatField
      DisplayLabel = 'Eplant ID'
      FieldName = 'ID'
      Origin = 'IQ.EPLANT.ID'
    end
    object PKEplantNAME: TStringField
      DisplayLabel = 'Descrip'
      FieldName = 'NAME'
      Origin = 'IQ.EPLANT.NAME'
      Size = 30
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryPO_RAR_UNITPRICE_HIGHER'
      'QryPO_RAR_UNITPRICE_LOWER'
      'QryPO_RAR_UNITQTY_HIGHER'
      'QryPO_RAR_UNITQTY_LOWER'
      'QryPO_RAR_LINEITEMS_ADDED'
      'QryPO_RAR_LINEITEMS_DELETED'
      'QryPO_RAR_RELEASES_ADDED'
      'QryPO_RAR_RELEASES_DELETED'
      'QryPO_RAR_GL_ACCT_CHANGED'
      'QryPO_RAR_TERMS_CHANGED'
      'sbtnCopyFromDefault'
      'NavMain')
    SecurityCode = 'FRMPORARPARAM'
    Left = 496
    Top = 72
  end
end
