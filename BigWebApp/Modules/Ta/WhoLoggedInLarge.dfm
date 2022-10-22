object FrmWhoLoggedInLarge: TFrmWhoLoggedInLarge
  Left = 0
  Top = 0
  ClientHeight = 745
  ClientWidth = 1366
  Caption = 'Employees Currently Logged Into'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Height = -14
  PixelsPerInch = 96
  TextHeight = 17
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 1366
    Height = 105
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnSearch: TUniSpeedButton
      Left = 5
      Top = 14
      Width = 79
      Height = 79
      Hint = 'Search...'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
      Caption = 'Search'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -17
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSearchClick
    end
    object SpeedButton1: TUniSpeedButton
      Left = 106
      Top = 14
      Width = 78
      Height = 79
      Hint = 'Toggle'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
      Caption = 'Toggle'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnText
      Font.Height = -17
      ParentColor = False
      Color = clWindow
      OnClick = SpeedButton1Click
    end
    object Nav: TUniDBNavigator
      Left = 973
      Top = 1
      Width = 393
      Height = 103
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = Src
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 649
    Width = 1366
    Height = 96
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 1049
      Top = 1
      Width = 317
      Height = 94
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnMainCancel: TUniBitBtn
        Left = 124
        Top = 8
        Width = 169
        Height = 78
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666668666666666666666666666666666666
          0000666608866666666666666686666666666666000066691086666688666666
          6888666666666666000066691088666008866666688866666886666600006669
          1108869110866666688886668888666600006666911089111066666666888868
          8888666600006666911191110666666666888888888666660000666669111110
          6666666666688888886666660000666666911108866666666666888886666666
          0000666666911110866666666666888888666666000066666911011088666666
          6668888888666666000066666910691108866666666888688886666600006666
          9106669110886666668886668888666600006666910666691108666666888666
          6888866600006666696666669106666666686666668886660000666666666666
          6966666666666666666866660000666666666666666666666666666666666666
          0000}
        Caption = 'Close'
        ModalResult = 2
        TabOrder = 0
        OnClick = btnMainCancelClick
      end
    end
  end
  object PC: TUniPageControl
    Left = 0
    Top = 105
    Width = 1366
    Height = 544
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabForm
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabForm: TUniTabSheet
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabVisible = False
      Caption = 'TabForm'
      DesignSize = (
        1358
        512)
      object Label1: TUniLabel
        Left = 9
        Top = 14
        Width = 108
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Employee #'
        ParentFont = False
        Font.Height = -20
        TabOrder = 9
      end
      object Label2: TUniLabel
        Left = 9
        Top = 93
        Width = 52
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Name'
        ParentFont = False
        Font.Height = -20
        TabOrder = 10
      end
      object Label3: TUniLabel
        Left = 9
        Top = 173
        Width = 108
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Task Source'
        ParentFont = False
        Font.Height = -20
        TabOrder = 11
      end
      object Label4: TUniLabel
        Left = 9
        Top = 251
        Width = 53
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'WO #'
        ParentFont = False
        Font.Height = -20
        TabOrder = 12
      end
      object Label5: TUniLabel
        Left = 9
        Top = 331
        Width = 67
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Process'
        ParentFont = False
        Font.Height = -20
        TabOrder = 13
      end
      object Label6: TUniLabel
        Left = 9
        Top = 409
        Width = 69
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Time In'
        ParentFont = False
        Font.Height = -20
        TabOrder = 14
      end
      object Label7: TUniLabel
        Left = 9
        Top = 489
        Width = 120
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Elapsed Time'
        ParentFont = False
        Font.Height = -20
        TabOrder = 15
      end
      object Label8: TUniLabel
        Left = 9
        Top = 568
        Width = 132
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Work Center #'
        ParentFont = False
        Font.Height = -20
        TabOrder = 16
      end
      object Label9: TUniLabel
        Left = 9
        Top = 647
        Width = 147
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Manufacturing #'
        ParentFont = False
        Font.Height = -20
        TabOrder = 17
      end
      object DBEdit1: TUniDBEdit
        Left = 158
        Top = 10
        Width = 1316
        Height = 32
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'EMPNO'
        DataSource = Src
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -20
        Font.Style = [fsBold]
        TabOrder = 0
        ReadOnly = True
      end
      object DBEdit2: TUniDBEdit
        Left = 158
        Top = 247
        Width = 1316
        Height = 32
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'WORKORDER_ID'
        DataSource = Src
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -20
        Font.Style = [fsBold]
        TabOrder = 1
        ReadOnly = True
      end
      object DBEdit3: TUniDBEdit
        Left = 158
        Top = 327
        Width = 1316
        Height = 32
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'PROCESSNUM'
        DataSource = Src
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -20
        Font.Style = [fsBold]
        TabOrder = 2
        ReadOnly = True
      end
      object DBEdit4: TUniDBEdit
        Left = 158
        Top = 405
        Width = 1316
        Height = 32
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'TIME_IN'
        DataSource = Src
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -20
        Font.Style = [fsBold]
        TabOrder = 3
        ReadOnly = True
      end
      object DBEdit5: TUniDBEdit
        Left = 158
        Top = 89
        Width = 1316
        Height = 32
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'EMP_NAME'
        DataSource = Src
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -20
        Font.Style = [fsBold]
        TabOrder = 4
        ReadOnly = True
      end
      object DBEdit6: TUniDBEdit
        Left = 158
        Top = 169
        Width = 1316
        Height = 32
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'SOURCE'
        DataSource = Src
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -20
        Font.Style = [fsBold]
        TabOrder = 5
        ReadOnly = True
      end
      object DBEdit7: TUniDBEdit
        Left = 158
        Top = 485
        Width = 1316
        Height = 32
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'ELAPSED_TIME_STR'
        DataSource = Src
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -20
        Font.Style = [fsBold]
        TabOrder = 6
        ReadOnly = True
      end
      object DBEdit8: TUniDBEdit
        Left = 158
        Top = 564
        Width = 1316
        Height = 32
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'EQNO'
        DataSource = Src
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -20
        Font.Style = [fsBold]
        TabOrder = 7
        ReadOnly = True
      end
      object DBEdit9: TUniDBEdit
        Left = 158
        Top = 643
        Width = 1316
        Height = 32
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'MFGNO'
        DataSource = Src
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -20
        Font.Style = [fsBold]
        TabOrder = 8
        ReadOnly = True
      end
    end
    object TabGrid: TUniTabSheet
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabVisible = False
      ImageIndex = 1
      Caption = 'TabGrid'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
    end
  end
  object Src: TDataSource
    DataSet = QryEmpl
    Left = 192
    Top = 32
  end
  object QryEmpl: TFDQuery
    OnCalcFields = QryEmplCalcFields
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select ta_labor_id,'
      '       eplant_id,'
      '       pr_emp_id,'
      '       source,'
      '       source_id,'
      '       To_Char(workorder_id) as workorder_id,'
      '       time_in,'
      '       elapsed_days,'
      '       elapsed_hours,'
      '       elapsed_minutes,'
      '       elapsed_time_str,'
      '       elapsed_time,'
      '       emp_name,'
      '       empno,'
      '       sndop_id,'
      '       process as processnum,'
      '       eqno,'
      '       mfgno '
      '  from v_who_logged_in'
      ' where misc.eplant_filter(eplant_id) = 1'
      '')
    Left = 224
    Top = 31
    object QryEmplELAPSED_TIME_STR: TStringField
      DisplayLabel = 'Elapsed Time'
      DisplayWidth = 30
      FieldName = 'ELAPSED_TIME_STR'
      Size = 141
    end
    object QryEmplEMP_NAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 30
      FieldName = 'EMP_NAME'
      Size = 255
    end
    object QryEmplEMPNO: TStringField
      DisplayLabel = 'Emp #'
      DisplayWidth = 25
      FieldName = 'EMPNO'
      Size = 25
    end
    object QryEmplSOURCE: TStringField
      DisplayLabel = 'Task Source'
      DisplayWidth = 10
      FieldName = 'SOURCE'
      Size = 10
    end
    object QryEmplTIME_IN: TDateTimeField
      DisplayLabel = 'Time In'
      DisplayWidth = 18
      FieldName = 'TIME_IN'
    end
    object QryEmplWORKORDER_ID: TStringField
      DisplayLabel = 'WO #'
      DisplayWidth = 40
      FieldName = 'WORKORDER_ID'
      Size = 40
    end
    object QryEmplPROCESSNUM: TStringField
      DisplayLabel = 'Process'
      DisplayWidth = 15
      FieldName = 'PROCESSNUM'
      Size = 15
    end
    object QryEmplEQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 20
      FieldName = 'EQNO'
      FixedChar = True
      Size = 60
    end
    object QryEmplMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Size = 50
    end
    object QryEmplEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryEmplPR_EMP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      Visible = False
      Size = 0
    end
    object QryEmplSOURCE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Visible = False
      Size = 0
    end
    object QryEmplELAPSED_DAYS: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'ELAPSED_DAYS'
      Visible = False
      Size = 38
    end
    object QryEmplELAPSED_HOURS: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'ELAPSED_HOURS'
      Visible = False
      Size = 38
    end
    object QryEmplELAPSED_MINUTES: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'ELAPSED_MINUTES'
      Visible = False
      Size = 38
    end
    object QryEmplELAPSED_TIME: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'ELAPSED_TIME'
      Visible = False
      Size = 38
    end
    object QryEmplTA_LABOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TA_LABOR_ID'
      Visible = False
      Size = 0
    end
    object QryEmplSNDOP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SNDOP_ID'
      Visible = False
      Size = 0
    end
  end
  object PkEmpl: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select ta_labor_id as ta_labor_id,'
      '       eplant_id as eplant_id,'
      '       pr_emp_id as pr_emp_id,'
      '       source as source,'
      '       source_id as source_id,'
      '       To_Char(workorder_id) as workorder_id,'
      '       time_in as time_in,'
      '       elapsed_days as elapsed_days,'
      '       elapsed_hours as elapsed_hours,'
      '       elapsed_minutes as elapsed_minutes,'
      '       elapsed_time_str as elapsed_time_str,'
      '       elapsed_time as elapsed_time,'
      '       emp_name as emp_name,'
      '       empno as empno,'
      '       sndop_id as sndop_id,'
      '       process as process '
      '  from v_who_logged_in'
      ' where misc.eplant_filter(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 272
    Top = 32
    object PkEmplSOURCE: TStringField
      DisplayLabel = 'Task Source'
      FieldName = 'SOURCE'
      Size = 10
    end
    object PkEmplWORKORDER_ID: TStringField
      DisplayLabel = 'WO #'
      FieldName = 'WORKORDER_ID'
      Size = 40
    end
    object PkEmplTIME_IN: TDateTimeField
      DisplayLabel = 'Time In'
      FieldName = 'TIME_IN'
    end
    object PkEmplELAPSED_TIME_STR: TStringField
      DisplayLabel = 'Elapsed Time'
      FieldName = 'ELAPSED_TIME_STR'
      Size = 141
    end
    object PkEmplEMP_NAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'EMP_NAME'
      Size = 255
    end
    object PkEmplEMPNO: TStringField
      DisplayLabel = 'Emp #'
      FieldName = 'EMPNO'
      Size = 25
    end
    object PkEmplTA_LABOR_ID: TBCDField
      FieldName = 'TA_LABOR_ID'
      Visible = False
      Size = 0
    end
    object PkEmplPROCESS: TStringField
      DisplayLabel = 'Process'
      FieldName = 'PROCESS'
      Size = 15
    end
  end
end
