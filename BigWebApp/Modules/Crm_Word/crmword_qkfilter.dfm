object FrmCRMWordQuickFilter: TFrmCRMWordQuickFilter
  Left = 201
  Top = 163
  ClientHeight = 369
  ClientWidth = 546
  Caption = 'Filtering Options'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 546
    Height = 369
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 1
      Top = 332
      Width = 544
      Height = 37
      Hint = ''
      Constraints.MinWidth = 361
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel2: TUniPanel
        Left = 324
        Top = 1
        Width = 220
        Height = 35
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnOk: TUniBitBtn
          Left = 10
          Top = 7
          Width = 97
          Height = 25
          Hint = ''
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
          Caption = '&OK'
          ModalResult = 1
          TabOrder = 0
          OnClick = btnOkClick
        end
        object btnCancel: TUniBitBtn
          Left = 114
          Top = 7
          Width = 97
          Height = 25
          Hint = ''
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          Caption = '&Cancel'
          ModalResult = 2
          TabOrder = 1
        end
      end
    end
    object PnlGrid: TUniPanel
      Left = 1
      Top = 131
      Width = 544
      Height = 201
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object bvGridSpacer2: TUniPanel
        Left = 536
        Top = 1
        Width = 8
        Height = 199
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 2
        Caption = ''
      end
      object bvGridSpacer1: TUniPanel
        Left = 1
        Top = 1
        Width = 8
        Height = 199
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 3
        Caption = ''
      end
      object PnlGridInner: TUniPanel
        Left = 8
        Top = 1
        Width = 528
        Height = 199
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Bevel1: TUniPanel
          Left = 1
          Top = 27
          Width = 526
          Height = 3
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Caption = ''
        end
        object PnlToolbar: TUniPanel
          Left = 1
          Top = 1
          Width = 526
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object sbtnClear: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Clear "To" and "From" Values'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000C21E0000C21E00000001000000000000473E7D005050
              500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
              5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
              650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
              7B0070707000717171007272720076767600473C800049388200533D8F004B40
              84004C448500534F83005655810059568D005B568D0054449700554598005D54
              93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
              B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
              A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
              8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
              910093939300959595009696960097979700949C9B0098989800999999009B9B
              9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
              B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
              B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
              A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
              B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
              BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
              CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
              D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
              E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
              E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
              F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
              C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
              D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
              D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
              E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
              F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
              FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
              FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
              E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
              EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
              FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
              F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
              3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
              4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
              343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
              9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
              9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
              C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
              E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
              F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
              9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
              9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
              CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
              DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
              0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
              3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
              3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
              3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnClearClick
          end
          object sbtnPreview: TUniSpeedButton
            Left = 26
            Top = 1
            Width = 80
            Height = 25
            Hint = 'Preview data'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000610F0000610F00000001000000000000252525002A2A
              2A002D2D2D003333330060200000602800007028000070301000704020006046
              320063493500684E3A004040400045454500484848004D4D4D004F4F4F005757
              57005A5A5A005F5F5F0067676700696969006F6F6F0070707000777777007979
              79007D7D7D007F7F7F008048200080503000CC643000D26C3800E27239008058
              4000905840009060400090685000A0685000A0705000A0786000B0786000E37B
              4700A0806000B0806000B0807000B0887000B0907000E5855500E68C6000E68F
              6300E7946B00E8997100E89C7700E9A27E00F8A67C00FF00FF00818181008787
              87008D8D8D008E8E8E008F8F8F00919191009595950097979700999999009A9A
              9A009D9D9D009E9E9E00B0908000B8A39400A0A0A000A2A2A200A7A7A700A8A8
              A800A9A9A900AAAAAA00ABABAB00ACACAC00B0B0B000B5B5B500B6B6B600B7B7
              B700B9B9B900BABABA00BBBBBB00BEBEBE00BFBFBF00C0908000C0988000D098
              8000D0A08000C0A09000D0A89000E9A28100EAA88900EAA98900EAAA8B00EAAA
              8C00EBAC8D00F9AB8300FAB08B00FBB69200FCBB9800FEBF9D00CCB6A700D3BC
              AF00E0B8A000E1BBA200D6C0B300D8C4B900DAC8BD00FFC3A200E0C8B000E6CC
              BB00F0C0B000F0C8B000F0D0B000C1C1C100C2C2C200C4C4C400C5C5C500C7C7
              C700CACACA00CBCBCB00CDCDCD00CECECE00DBCAC000D0D0D000D7D7D700D9D9
              D900E0D0C000F0D0C000E0D8D000F0D8D000FAF3EB00FBF5EF00F0F0F000F2F2
              F200F5F5F500F6F6F600F7F7F700FBF6F100FBF8F300FFF8F000FBF9F400FBF9
              F500FBFAF600FBFAF700FCFBF700F8F8F800F9F9F900FAFAFA00FBFBFB00FCFC
              F900FCFDFA00FCFDFB00FCFCFC00FDFDFD00FCFEFC00FEFEFE00FFFFFF000000
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
              0000000000000000000000000000000000000000000000000000373737373726
              0707070637060504040437373737371603030302370201000000373737373727
              85A0742537236A825A0437373737371881A07C153713517D430037373737372B
              83A0742637257084590837373737371B7FA07C1637157880400C373737373758
              2C2D27270725582A242137373737373F3839181803153F1A1411373737373737
              44A0742307238F721D373737373737373CA07C1303138C751037373737373737
              58A074281C23A0731D373737373737373FA07C190E13A0791037373737373737
              5B582B57262D58272437373737373737463F1B3D16393F18143745090A0A0A0A
              715B8457575888236B37470D0E0E0E0E7B46803D3D3F88135237689B99928E87
              865CA05C375CA02237374F9D9C97958A8948A0483748A0123737689E7E6E9369
              6C582E2D37582E2D37374F9F7A799754563F3A39373F3A393737689E9E9E9A94
              908D0B373737373737374F9F9F9F9D98968B0F37373737373737689E7E7E9E6D
              6D910B373737373737374F9F7A7A9F7777960F37373737373737689E9E9E9E9E
              9B990B373737373737374F9F9F9F9F9F9D9C0F3737373737373762615F353331
              2F291E373737373737374D4B4A47413D391B1537373737373737626F67666564
              63361F373737373737374D765553504E4C4817373737373737376260605E5D34
              323020373737373737374D4B4B4947423E3B1837373737373737}
            Caption = 'Preview'
            ParentColor = False
            Color = clWindow
            OnClick = sbtnPreviewClick
          end
        end
        object PnlSelectionCriteriaGrid: TUniPanel
          Left = 1
          Top = 30
          Width = 526
          Height = 169
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object GridSelectionCriteria: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 524
            Height = 167
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 307
            IQComponents.Grid.Height = 81
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = CRMWORD_DM.SrcCRMWordCriteria_QK
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
            IQComponents.Navigator.DataSource = CRMWORD_DM.SrcCRMWordCriteria_QK
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 307
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 81
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = CRMWORD_DM.SrcCRMWordCriteria_QK
            Columns = <
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Field'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'RANGE_START'
                Title.Caption = 'From'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'UNARY_OPERATOR'
                Title.Caption = '=?'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'RANGE_END'
                Title.Caption = 'To'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'BINARY_OPERATOR'
                Title.Caption = 'And/Or'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'INCLUDE_NULLS'
                Title.Caption = 'Include Empty ~Values?'
                Width = 64
                CheckBoxField.FieldValues = 'Y;N'
              end>
            Marker = 0
          end
          object cmbUniaryOperator: TUniDBComboBox
            Left = 112
            Top = 25
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'UNARY_OPERATOR'
            DataSource = CRMWORD_DM.SrcCRMWordCriteria
            Style = csDropDownList
            Items.Strings = (
              '='
              '<'
              '>'
              '<>')
            ItemIndex = 0
            ParentFont = False
            Font.Color = clNavy
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object cmbBinaryOperator: TUniDBComboBox
            Left = 112
            Top = 48
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'BINARY_OPERATOR'
            DataSource = CRMWORD_DM.SrcCRMWordCriteria
            Style = csDropDownList
            Items.Strings = (
              'AND'
              'OR')
            ItemIndex = 0
            ParentFont = False
            Font.Color = clMaroon
            Font.Style = [fsBold]
            TabOrder = 2
          end
        end
      end
    end
    object PnlOption: TUniPanel
      Left = 1
      Top = 32
      Width = 544
      Height = 99
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      DesignSize = (
        544
        99)
      object rbCurrentRecord: TUniRadioButton
        Left = 8
        Top = 3
        Width = 537
        Height = 17
        Hint = ''
        Caption = 'Show record(s) for current context only'
        TabOrder = 0
        OnClick = RadioButtonClick
      end
      object rbSelectionCriteria: TUniRadioButton
        Left = 8
        Top = 80
        Width = 537
        Height = 17
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Filter by field data'
        TabOrder = 1
        OnClick = RadioButtonClick
      end
      object PnlCurrentRecordDisplay: TUniPanel
        Tag = 1999
        Left = 8
        Top = 24
        Width = 525
        Height = 46
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
        Color = clWindow
        object lblPrinciple: TUniLabel
          Left = 102
          Top = 12
          Width = 3
          Height = 13
          Hint = ''
          Caption = ''
          TabOrder = 1
        end
        object lblPrincipleContact: TUniLabel
          Left = 102
          Top = 37
          Width = 3
          Height = 13
          Hint = ''
          Caption = ''
          TabOrder = 2
        end
        object lblCurrentContext1: TUniLabel
          Left = 8
          Top = 8
          Width = 92
          Height = 13
          Hint = ''
          Caption = 'lblCurrentContext1'
          TabOrder = 3
        end
        object lblCurrentContext2: TUniLabel
          Left = 8
          Top = 24
          Width = 92
          Height = 13
          Hint = ''
          Caption = 'lblCurrentContext2'
          TabOrder = 4
        end
      end
    end
    object PnlPrompt: TUniPanel
      Left = 1
      Top = 1
      Width = 544
      Height = 32
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
      object lblPrompt: TUniLabel
        Left = 8
        Top = 8
        Width = 204
        Height = 13
        Hint = ''
        Caption = 'How do you want to filter the merge data?'
        TabOrder = 1
      end
    end
  end
end
