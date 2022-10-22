object FrmFAGlPost: TFrmFAGlPost
  Left = 51
  Top = 190
  HelpContext = 5000369
  ClientHeight = 332
  ClientWidth = 407
  Caption = 'FA GL Prepost'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 407
    Height = 32
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      407
      32)
    object Label9: TUniLabel
      Left = 108
      Top = 7
      Width = 30
      Height = 13
      Hint = ''
      Caption = 'Period'
      TabOrder = 2
    end
    object SBPeriod: TUniSpeedButton
      Left = 318
      Top = 2
      Width = 22
      Height = 22
      Hint = 'Find period'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000C21E0000C21E000000010000000000003D3D3D006868
        680099330000CC660000FF00FF0080808000A0A0A000A4A4A400A8A8A800ADAD
        AD00B1B1B100BABABA00FBDBBF00C8C8C800D3D3D300D5D5D500D6D6D600D7D7
        D700D8D8D800D9D9D900EFD4C200E9DAC300ECDAC300EFDBC200E3D8CF00E5D9
        CE00E9DACD00F2D6C200F2DBC200F4D8C100F7D9C000F4DBC100FAE5D100F9E8
        D600F8EADC00E3E3E300E6E6E600E9E9E900EBEBEB00EEEEEE00F7EFE500F8EC
        E000F7F1E900F6F3ED00F0F0F000F3F3F300F6F4F000F5F6F300F4F4F400F5F7
        F600F6F6F600F7F7F700F3F9FA00F4F8F800F2FAFC00F2FAFD00F0FBFE00F1FB
        FE00F0FBFF00F8F8F800F9F9F900FAFAFA00FBFBFB00FCFCFC00000000000000
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
        0000000000000000000000000000000000000000000000000000040404040404
        0404040404040404040404040404040404040404040404040404040402020202
        020202020202020404040404050505050505050505050504040404040518191A
        16171C1F1E0C02040404040405111213111212121113050404040404052B0D0B
        0A090807061E020404040404052D0D0B0A0908070611050404040404052E2B2A
        28292221201D02040404040405302D2C272625242310050404040404052F0D0B
        0A090807061B02040404040405320D0B0A090807060F05040404040405312F2E
        2B2A28292214020404040404053332302D2C2726250E05040404040405350D0B
        0A0908070616020404040404053B0D0B0A090807061105040404040405343531
        2F2E2B2A2815020404040404053C3B3332302D2C271105040404040405360D0B
        0A0908070619020404040404053D0D0B0A090807061205040404040405373634
        35312F2E2B18020404040404053E3D3C3B3332302D1105040404040405390D0B
        0A0931020202020404040404053F0D0B0A093305050505040404040405383937
        363435030D02040404040404053E3F3E3D3C3B050D05040404040404053A3839
        373634030204040404040404053F3E3F3E3D3C05050404040404040405050505
        0505050204040404040404040505050505050505040404040404040404040404
        0404040404040404040404040404040404040404040404040404}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = SBPeriodClick
    end
    object SBPostGL: TUniSpeedButton
      Left = 2
      Top = 1
      Width = 28
      Height = 27
      Hint = 'Post to the GL'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE4A592
        C06860B05850A05050A05050A050509048509048409048408040408038408038
        40703840703830FF00FFFF00FFA7A7A770707060606059595959595959595952
        52524E4E4E4E4E4E4747474242424242424040403D3D3DFF00FFFF00FFD06870
        F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
        30A03830703840FF00FFFF00FF7575759A9A9A8A8A8A5050502E2E2EB7B7B7B7
        B7B7C2C2C2C7C7C75050504A4A4A4A4A4A454545404040FF00FFFF00FFD07070
        FF98A0F08880E08080705850404030907870F0E0E0F0E8E0908070A04030A040
        40A04030803840FF00FFFF00FF7A7A7AA4A4A49292928A8A8A5858583D3D3D78
        7878E2E2E2E7E7E77E7E7E4A4A4A4C4C4C4A4A4A424242FF00FFFF00FFD07870
        FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
        40A04040804040FF00FFFF00FF7F7F7FAAAAAA9A9A9A9292925858580000003D
        3D3DD9D9D9DEDEDE7474745454545454544C4C4C474747FF00FFFF00FFD07880
        FFA8B0FFA0A0F09090705850705850705850705850706050806860C05850B050
        50B04840804040FF00FFFF00FF838383B2B2B2AAAAAA9A9A9A58585858585858
        58585858585E5E5E6868686363635C5C5C545454474747FF00FFFF00FFE08080
        FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
        50B05050904840FF00FFFF00FF8A8A8AB7B7B7B7B7B7AAAAAA9A9A9A9292928A
        8A8A8585857A7A7A7575756B6B6B6363635C5C5C4E4E4EFF00FFFF00FFE08890
        FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020A03810C060
        60C05850904840FF00FFFF00FF929292C0C0C0BDBDBD6E6E6E6868686363635C
        5C5C5757575252524848484242426B6B6B6363634E4E4EFF00FFFF00FFE09090
        FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
        10C06060904850FF00FFFF00FF989898C6C6C6727272E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E74242426B6B6B525252FF00FFFF00FFE098A0
        FFC0C0D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A040
        20D06860A05050FF00FFFF00FFA1A1A1C6C6C67A7A7AE7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7484848727272595959FF00FFFF00FFF0A0A0
        FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
        30D07070A05050FF00FFFF00FFA8A8A8C6C6C6828282E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E75252527A7A7A595959FF00FFFF00FFF0A8A0
        FFC0C0E08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B050
        30E07880A05050FF00FFFF00FFADADADC6C6C68A8A8AE7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7575757858585595959FF00FFFF00FFF0B0B0
        FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
        40603030B05850FF00FFFF00FFB6B6B6C6C6C6959595E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E75C5C5C353535606060FF00FFFF00FFF0B0B0
        FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C058
        50B05860B05860FF00FFFF00FFB6B6B6C6C6C69C9C9CE7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7636363646464646464FF00FFFF00FFF0B8B0
        F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
        80D07870D07070FF00FFFF00FFBCBCBCBCBCBCB6B6B6B6B6B6B0B0B0A8A8A8A1
        A1A19898989898989292928A8A8A8383837F7F7F7A7A7AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SBPostGLClick
    end
    object DBEditPeriod: TUniEdit
      Left = 148
      Top = 4
      Width = 165
      Height = 19
      Cursor = crArrow
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 32
    Width = 407
    Height = 300
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 405
      Height = 298
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 188
      IQComponents.Grid.Height = 212
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcPrepost
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
      IQComponents.Navigator.DataSource = SrcPrepost
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 188
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 212
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcPrepost
      Columns = <
        item
          FieldName = 'POST_DATE'
          Title.Caption = 'Post Date'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AMOUNT'
          Title.Caption = 'Amount'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BOOK_DESCRIP'
          Title.Caption = 'Book'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ASSET_NO'
          Title.Caption = 'Asset#'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ASSET_DESCRIP'
          Title.Caption = 'Asset'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DEPR_ACCOUNT'
          Title.Caption = 'Depr. account'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EXPENCE_ACCOUNT'
          Title.Caption = 'Expense account'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 136
    Top = 88
    object File1: TUniMenuItem
      Caption = '&File'
      object PosttoGL1: TUniMenuItem
        Caption = '&Post to the GL'
        OnClick = SBPostGLClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
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
  object SrcPrepost: TDataSource
    DataSet = QryPrepost
    Left = 32
    Top = 140
  end
  object QryPrepost: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.id,'
      '       p.fa_book_id,'
      '       p.post_date,'
      '       p.glperiods_id,'
      '       p.amount,'
      '       p.beg_balance,'
      '       p.glbatchid_id,'
      '       b.descrip as book_descrip,'
      '       b.fa_main_id,'
      '       m.asset_no,'
      '       m.descrip as asset_descrip,'
      '       m.glacct_id_asset,'
      '       m.glacct_id_depreciation,'
      '       m.glacct_id_expense,'
      '       g1.acct as asset_account,'
      '       g2.acct as depr_account,'
      '       g3.acct as expence_account'
      '  from FA_DEPR_POSTING p,'
      '       fa_book b,'
      '       fa_main m,'
      '       glacct g1,'
      '       glacct g2,'
      '       glacct g3'
      ' where p.fa_book_id = b.id'
      '   and b.fa_main_id = m.id'
      '   and p.glbatchid_id is null'
      '   and NVL(p.beg_balance, '#39'N'#39') = '#39'N'#39
      '   and m.glacct_id_asset = g1.id(+)'
      '   and m.glacct_id_depreciation = g2.id(+)'
      '   and m.glacct_id_expense = g3.id(+)'
      '   and Upper(b.book_type) = '#39'FINANCIAL'#39
      '   and p.glperiods_id = :AID'
      '   and misc.eplant_filter(m.eplant_id) = 1'
      ''
      '')
    Left = 48
    Top = 152
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPrepostPOST_DATE: TDateTimeField
      DisplayLabel = 'Post Date'
      DisplayWidth = 18
      FieldName = 'POST_DATE'
      Origin = 'p.post_date'
    end
    object QryPrepostAMOUNT: TBCDField
      DisplayLabel = 'Amount'
      DisplayWidth = 10
      FieldName = 'AMOUNT'
      Origin = 'p.AMOUNT'
      Size = 2
    end
    object QryPrepostBOOK_DESCRIP: TStringField
      DisplayLabel = 'Book'
      DisplayWidth = 20
      FieldName = 'BOOK_DESCRIP'
      Origin = 'b.DESCRIP'
      Size = 60
    end
    object QryPrepostASSET_NO: TStringField
      DisplayLabel = 'Asset#'
      DisplayWidth = 15
      FieldName = 'ASSET_NO'
      Origin = 'm.ASSET_NO'
      Size = 15
    end
    object QryPrepostASSET_DESCRIP: TStringField
      DisplayLabel = 'Asset'
      DisplayWidth = 20
      FieldName = 'ASSET_DESCRIP'
      Origin = 'm.DESCRIP'
      Size = 60
    end
    object QryPrepostDEPR_ACCOUNT: TStringField
      DisplayLabel = 'Depr. account'
      DisplayWidth = 20
      FieldName = 'DEPR_ACCOUNT'
      Origin = 'g2.acct'
      Size = 50
    end
    object QryPrepostEXPENCE_ACCOUNT: TStringField
      DisplayLabel = 'Expense account'
      DisplayWidth = 20
      FieldName = 'EXPENCE_ACCOUNT'
      Origin = 'g3.acct'
      Size = 50
    end
    object QryPrepostGLACCT_ID_ASSET: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_ASSET'
      Origin = 'm.GLACCT_ID_ASSET'
      Visible = False
      Size = 0
    end
    object QryPrepostGLACCT_ID_DEPRECIATION: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_DEPRECIATION'
      Origin = 'm.GLACCT_ID_DEPRECIATION'
      Visible = False
      Size = 0
    end
    object QryPrepostGLACCT_ID_EXPENSE: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_EXPENSE'
      Origin = 'm.GLACCT_ID_EXPENSE'
      Visible = False
      Size = 0
    end
    object QryPrepostID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'p.id'
      Visible = False
      Size = 0
    end
    object QryPrepostFA_BOOK_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_BOOK_ID'
      Origin = 'p.fa_book_id'
      Visible = False
      Size = 0
    end
    object QryPrepostGLPERIODS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLPERIODS_ID'
      Origin = 'p.GLPERIODS_ID'
      Visible = False
      Size = 0
    end
    object QryPrepostBEG_BALANCE: TStringField
      DisplayWidth = 1
      FieldName = 'BEG_BALANCE'
      Origin = 'p.BEG_BALANCE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryPrepostGLBATCHID_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLBATCHID_ID'
      Origin = 'p.GLBATCHID_ID'
      Visible = False
      Size = 0
    end
    object QryPrepostFA_MAIN_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_MAIN_ID'
      Origin = 'b.fa_main_id'
      Visible = False
      Size = 0
    end
    object QryPrepostASSET_ACCOUNT: TStringField
      DisplayWidth = 50
      FieldName = 'ASSET_ACCOUNT'
      Origin = 'g1.acct'
      Visible = False
      Size = 50
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'SBPostGL'
      'SBPeriod'
      'PosttoGL1'
      'Print1'
      'PrinterSetup1')
    SecurityCode = 'FRMFAGLPOST'
    Left = 176
    Top = 88
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 72
    Top = 89
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmFAGlPost'
    WebUse = False
    TouchScreen = False
    Left = 216
    Top = 88
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FA GL Prepost'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195016 $'
    BuildVersion = '176554'
    Left = 256
    Top = 88
  end
end
