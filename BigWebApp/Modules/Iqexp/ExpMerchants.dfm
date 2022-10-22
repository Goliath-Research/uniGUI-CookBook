object FrmMerchants: TFrmMerchants
  Left = 56
  Top = 189
  HelpContext = 14823
  ClientHeight = 292
  ClientWidth = 487
  Caption = 'Merchants'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search'
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
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SBSearchClick
    end
    object sbtnTableForm2: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Table / Form View'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000A0860100A08601000001000000000000000000001212
        1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
        0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
        0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
        6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
        9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
        B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
        C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
        FB00FFFFFF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001D1D1D1D0505
        050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
        29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
        2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
        2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
        2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
        35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
        1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
        191919191919191919061E3838382120202020202020202020021E3939391A17
        1513110F0D0B090807061E393939211E050403030303030202021E393331392D
        2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
        2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
        19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnTableForm2Click
    end
  end
  object PC: TUniPageControl
    Left = 0
    Top = 27
    Width = 487
    Height = 224
    Hint = ''
    ActivePage = TabGrid
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabForm: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'TabForm'
      DesignSize = (
        479
        196)
      object Label1: TUniLabel
        Left = 16
        Top = 41
        Width = 98
        Height = 13
        Hint = ''
        Caption = 'GL Expense Account'
        TabOrder = 4
      end
      object Label2: TUniLabel
        Left = 16
        Top = 14
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Description'
        TabOrder = 5
      end
      object Label3: TUniLabel
        Left = 16
        Top = 71
        Width = 141
        Height = 13
        Hint = ''
        Caption = 'Std. Industry/Merchant Code'
        TabOrder = 6
      end
      object wwDBGlacctForm: TUniEdit
        Left = 168
        Top = 38
        Width = 300
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object DBDescrip: TUniDBEdit
        Left = 168
        Top = 11
        Width = 300
        Height = 21
        Hint = ''
        DataField = 'DESCRIPTION'
        DataSource = SrcHdr
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object DBSic: TUniDBEdit
        Left = 168
        Top = 68
        Width = 300
        Height = 21
        Hint = ''
        DataField = 'SIC_MCC'
        DataSource = SrcHdr
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object DBInactive: TUniDBCheckBox
        Left = 16
        Top = 97
        Width = 169
        Height = 17
        Hint = ''
        DataField = 'PK_HIDE'
        DataSource = SrcHdr
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Inactive'
        TabOrder = 3
      end
    end
    object TabGrid: TUniTabSheet
      Hint = ''
      TabVisible = False
      ImageIndex = 1
      Caption = 'TabGrid'
      object IQSearch1: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 479
        Height = 196
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 262
        IQComponents.Grid.Height = 110
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcHdr
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
        IQComponents.Navigator.DataSource = SrcHdr
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.Navigator.BeforeAction = NavHdrBeforeAction
        IQComponents.HiddenPanel.Left = 262
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 110
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcHdr
        Columns = <
          item
            FieldName = 'ACCT'
            Title.Caption = 'GL Expense Account'
            Width = 121
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIPTION'
            Title.Caption = 'Description'
            Width = 131
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SIC_MCC'
            Title.Caption = 'Std. Industry/Merchant Code'
            Width = 61
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PK_HIDE'
            Title.Caption = 'Inactive'
            Width = 43
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
        object wwDBGlAccount: TUniEdit
          Left = 272
          Top = 128
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 2
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 251
    Width = 487
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel3: TUniPanel
      Left = 212
      Top = 1
      Width = 274
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnCancel: TUniButton
        Left = 183
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 1
        OnClick = BtnCancelClick
      end
      object BtnSelect: TUniButton
        Left = 102
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Select'
        TabOrder = 2
        OnClick = BtnSelectClick
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 136
    Top = 72
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = '&New'
        Default = True
        Visible = False
        OnClick = New1Click
      end
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
  object PKAcct: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       acct,'
      '       descrip,'
      '       type,'
      '       eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      ' where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      '    and misc.eplant_filter(eplant_id) = 1'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 320
    object PKAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKAcctACCT: TStringField
      DisplayLabel = 'Account'
      FieldName = 'ACCT'
      Size = 50
    end
    object PKAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PKAcctTYPE: TStringField
      DisplayLabel = 'Account Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object PKAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.EPLANT_ID'
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Merchants'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194013 $'
    BuildVersion = '176554'
    Left = 248
    Top = 65531
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMMERCHANTS'
    Left = 280
    Top = 65531
  end
  object SrcHdr: TDataSource
    DataSet = QryHdr
    Left = 120
    Top = 65531
  end
  object QryHdr: TFDQuery
    BeforePost = QryHdrBeforePost
    AfterPost = QryHdrAfterPost
    AfterDelete = QryHdrAfterPost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'exp_merchant'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select m.id,'
      '       m.description,'
      '       m.sic_mcc,'
      '       m.glacct_id_expense,'
      '      m.pk_hide,'
      '       a.acct'
      '  from exp_merchant m,'
      '       glacct a'
      ' where m.glacct_id_expense = a.id(+)')
    Left = 144
    object QryHdrACCT: TStringField
      DisplayLabel = 'GL Expense Account'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'a.acct'
      Size = 50
    end
    object QryHdrDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIPTION'
      Origin = 'm.DESCRIPTION'
      Size = 60
    end
    object QryHdrSIC_MCC: TBCDField
      DisplayLabel = 'Std. Industry/Merchant Code'
      DisplayWidth = 10
      FieldName = 'SIC_MCC'
      Origin = 'm.SIC_MCC'
      Size = 0
    end
    object QryHdrPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = ' m.pk_hide'
      Size = 1
    end
    object QryHdrID: TBCDField
      FieldName = 'ID'
      Origin = 'm.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryHdrGLACCT_ID_EXPENSE: TBCDField
      FieldName = 'GLACCT_ID_EXPENSE'
      Origin = 'm.GLACCT_ID_EXPENSE'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into exp_merchant'
      '  (ID, DESCRIPTION, SIC_MCC, GLACCT_ID_EXPENSE, PK_HIDE)'
      'values'
      '  (:ID, :DESCRIPTION, :SIC_MCC, :GLACCT_ID_EXPENSE, :PK_HIDE)')
    ModifySQL.Strings = (
      'update exp_merchant'
      'set'
      '  ID = :ID,'
      '  DESCRIPTION = :DESCRIPTION,'
      '  SIC_MCC = :SIC_MCC,'
      '  GLACCT_ID_EXPENSE = :GLACCT_ID_EXPENSE,'
      '  PK_HIDE = :PK_HIDE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from exp_merchant'
      'where'
      '  ID = :OLD_ID')
    Left = 168
  end
  object PkMerchants: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select m.id as id,'
      '       m.description as description,'
      '       m.sic_mcc as sic_mcc,'
      '       m.glacct_id_expense as glacct_id_expense,'
      '       a.acct as acct,'
      '       m.pk_hide as pk_hide'
      '  from exp_merchant m,'
      '       glacct a'
      ' where m.glacct_id_expense = a.id(+)')
    OnIQModify = PkMerchantsIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 376
    object PkMerchantsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkMerchantsDESCRIPTION: TStringField
      DisplayLabel = 'Merchant'
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object PkMerchantsSIC_MCC: TBCDField
      DisplayLabel = 'Std. Industry/Merchant Code'
      FieldName = 'SIC_MCC'
      Size = 0
    end
    object PkMerchantsGLACCT_ID_EXPENSE: TBCDField
      FieldName = 'GLACCT_ID_EXPENSE'
      Visible = False
      Size = 0
    end
    object PkMerchantsACCT: TStringField
      DisplayLabel = 'GL Expense Account'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkMerchantsPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      FieldName = 'PK_HIDE'
      Size = 1
    end
  end
end
