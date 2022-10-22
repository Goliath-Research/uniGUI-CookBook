object FrmInvoice: TFrmInvoice
  Left = 0
  Top = 0
  Width = 1117
  Height = 807
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  Layout = 'fit'
  LayoutConfig.Region = 'center'
  ParentAlignmentControl = False
  Font.Height = -13
  TabOrder = 0
  ParentFont = False
  object PCMain: TUniPageControl
    Left = 0
    Top = 29
    Width = 1117
    Height = 778
    Hint = ''
    ActivePage = TabInv
    TabBarVisible = False
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    LayoutConfig.Region = 'center'
    TabOrder = 0
    ExplicitTop = 27
    ExplicitWidth = 1118
    ExplicitHeight = 616
    object TabInv: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'TabInv'
      Layout = 'fit'
      LayoutConfig.Region = 'center'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object PnlBottom: TUniPanel
        Left = 0
        Top = 622
        Width = 1109
        Height = 125
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ParentAlignmentControl = False
        Layout = 'fit'
        LayoutConfig.Split = True
        LayoutConfig.Region = 'south'
        object Panel10: TUniPanel
          Left = 1
          Top = 1
          Width = 930
          Height = 123
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          Layout = 'fit'
          LayoutConfig.Split = True
          LayoutConfig.Region = 'center'
          object PageControl2: TUniPageControl
            Left = 1
            Top = 1
            Width = 928
            Height = 121
            Hint = ''
            ActivePage = TabPOOrderNo
            TabBarVisible = True
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            LayoutConfig.Region = 'center'
            TabOrder = 0
            OnChange = PageControl2Change
            object TabSheet1: TUniTabSheet
              Hint = ''
              ParentAlignmentControl = False
              Caption = 'Invoice Note'
              Layout = 'fit'
              LayoutConfig.Region = 'center'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 256
              ExplicitHeight = 128
              object DBMemoNotes: TUniDBMemo
                Left = 0
                Top = 0
                Width = 920
                Height = 90
                Hint = ''
                DataField = 'NOTES'
                DataSource = SrcArPrePost
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
              end
            end
            object TabSheet2: TUniTabSheet
              Hint = ''
              ParentAlignmentControl = False
              Caption = 'Sales Order Note'
              Layout = 'fit'
              LayoutConfig.Region = 'center'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 256
              ExplicitHeight = 128
              object DBMemo1: TUniDBMemo
                Left = 0
                Top = 0
                Width = 920
                Height = 90
                Hint = ''
                DataField = 'ORDER_DTL_COMMENT'
                DataSource = SrcComments
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
              end
            end
            object TabSheet3: TUniTabSheet
              Hint = ''
              ParentAlignmentControl = False
              Caption = 'Shipment Note'
              Layout = 'fit'
              LayoutConfig.Region = 'center'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 256
              ExplicitHeight = 128
              object DBMemo2: TUniDBMemo
                Left = 0
                Top = 0
                Width = 920
                Height = 90
                Hint = ''
                DataField = 'SHIPMENT_DTL_COMMENT'
                DataSource = SrcComments
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
              end
            end
            object TabPOOrderNo: TUniTabSheet
              Hint = ''
              ImageIndex = 3
              ParentAlignmentControl = False
              Caption = 'PO #, Order #, Packing Slip #'
              Layout = 'fit'
              LayoutConfig.Region = 'center'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 256
              ExplicitHeight = 128
              object Label12: TUniLabel
                Left = 8
                Top = 4
                Width = 29
                Height = 16
                Hint = ''
                Caption = 'PO #'
                TabOrder = 4
              end
              object Label15: TUniLabel
                Left = 8
                Top = 28
                Width = 46
                Height = 16
                Hint = ''
                Caption = 'Order #'
                TabOrder = 5
              end
              object Label17: TUniLabel
                Left = 6
                Top = 52
                Width = 81
                Height = 16
                Hint = ''
                Caption = 'Packing Slip #'
                TabOrder = 6
              end
              object Label18: TUniLabel
                Left = 8
                Top = 75
                Width = 79
                Height = 16
                Hint = ''
                Caption = 'Misc. Order #'
                TabOrder = 7
              end
              object dbPoNo: TUniDBEdit
                Left = 120
                Top = 0
                Width = 121
                Height = 21
                Cursor = crArrow
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataField = 'APono'
                DataSource = SrcQryOrder
                TabOrder = 0
                Color = clBtnFace
                ReadOnly = True
              end
              object dbOrderrNo: TUniDBEdit
                Left = 120
                Top = 24
                Width = 121
                Height = 21
                Cursor = crArrow
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataField = 'ORDERNO'
                DataSource = SrcQryOrder
                TabOrder = 1
                Color = clBtnFace
                ReadOnly = True
              end
              object DBPackSlipno: TUniDBEdit
                Left = 120
                Top = 48
                Width = 121
                Height = 21
                Cursor = crArrow
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataField = 'PACKSLIPNO'
                DataSource = SrcShipment
                TabOrder = 2
                Color = clBtnFace
                ReadOnly = True
              end
              object DBMiscorderno: TUniDBEdit
                Left = 120
                Top = 72
                Width = 121
                Height = 21
                Cursor = crArrow
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataField = 'ORDERNO'
                DataSource = SrcArPrePostDetail
                TabOrder = 3
                Color = clBtnFace
                ReadOnly = True
              end
            end
          end
        end
        object PnlTotals: TUniPanel
          Left = 930
          Top = 1
          Width = 179
          Height = 123
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          Layout = 'fit'
          LayoutConfig.Split = True
          LayoutConfig.Region = 'east'
          object PnlForeignCurrency: TUniPanel
            Left = 1
            Top = 1
            Width = 177
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            Layout = 'fit'
            LayoutConfig.Region = 'north'
            object btnCurrency2: TUniSpeedButton
              Left = 1
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Foreign Currency rates'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000A0860100A08601000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                09760B54AB5CFF00FFCFCFECBFBFE6BFBFE6BFBFE6BFBFE6F3F3FAFF00FFECD9
                CFEDDCD3FF00FFFF00FFFF00FFFF00FF3D3D3D727272FF00FFAEAEAEA1A1A1A1
                A1A1A1A1A1A1A1A1CDCDCDFF00FFB1B1B1B4B4B4FF00FFFF00FF9CCA9F499B4C
                0C7B0F2A8B2CDEEFDE4752C0132CB81127B51125B30C1AACCFCFECFF00FFB569
                40BA7550FF00FFFF00FF979797626262424242515151C3C3C34D4D4D39393937
                37373535352F2F2FAEAEAEFF00FF4242424E4E4EFF00FFFF00FF138519138519
                0B7A0F128516489B4AA9A9DD060FA48686CFBFBFE6BFBFE6E0CDCAB66B40A649
                10A64914B46840F0E2DB4B4B4B4B4B4B4141414A4A4A6262628E8E8E29292971
                7171A1A1A1A1A1A1A6A6A6444444262626262626414141BABABA91CE97E3F4E5
                0D7B110D7C111184167070C60C1EAE2E35B24040B3DBDBF0ECD9CFB66B40A74A
                10A64A14B46840F0E2DB999999C8C8C84242424343434A4A4A6060603131313A
                3A3A3F3F3FB8B8B8B1B1B1444444272727272727414141BABABAA6D2AA15891E
                178C2015891C4EA5534040B30C1EAE0917AA00009ACFCFECFF00FFF7EFEBA94D
                15AC5520FF00FFFF00FFA0A0A04E4E4E5151514E4E4E6C6C6C3F3F3F3131312D
                2D2D222222AEAEAEFF00FFC7C7C7292929303030FF00FFFF00FF1B91261C9327
                09740C219C2C90CD95CFCFEC243EBE4352C1BFBFE6FF00FFFF00FFCA9477A442
                00A44100D3A68FFF00FF5656565757573B3B3B5F5F5F979797AEAEAE4343434D
                4D4DA1A1A1FF00FFFF00FF6B6B6B2020202020207D7D7DFF00FF219A30219B2F
                12821915891D15881CFF00FF3247BF2B43C0B2B2E0BFBFE6E1CAB9AB4A00B86D
                3EB76A3AA44100FAF5F35E5E5E5F5F5F4848484E4E4E4E4E4EFF00FF47474745
                4545959595A1A1A1A1A1A1272727454545424242202020CDCDCDCEF0D554AB5C
                14851C168A2057B361FF00FFC3C6E91231BB2B43BF1B2AB19E6257AF4F00F3E7
                E1EEDED5A44100C78E6FC1C1C17272724B4B4B4F4F4F797979FF00FFA6A6A63C
                3C3C4545453636363E3E3E2B2B2BBFBFBFB6B6B6202020666666FF00FFFF00FF
                14861E54AB5CFF00FFFF00FFFF00FFEEEEF8BBBBE4D5D5EEE7D0C6EBD7CDFF00
                FFFF00FFE9D4C9EAD5CBFF00FFFF00FF4C4C4C727272FF00FFFF00FFFF00FFC8
                C8C89D9D9DB3B3B3A8A8A8AFAFAFFF00FFFF00FFACACACADADADFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = btnCurrency2Click
            end
          end
          object Panel8: TUniPanel
            Left = 1
            Top = 27
            Width = 177
            Height = 96
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            Layout = 'fit'
            LayoutConfig.Region = 'center'
            object PnlTotalsLabels: TUniPanel
              Left = 1
              Top = 1
              Width = 65
              Height = 94
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              Layout = 'fit'
              LayoutConfig.Split = True
              LayoutConfig.Region = 'west'
              object Label6: TUniLabel
                Left = 1
                Top = 32
                Width = 21
                Height = 16
                Hint = ''
                Caption = 'Tax'
                TabOrder = 1
              end
              object Label7: TUniLabel
                Left = 1
                Top = 8
                Width = 47
                Height = 16
                Hint = ''
                Caption = 'Subtotal'
                TabOrder = 2
              end
              object Label8: TUniLabel
                Left = 1
                Top = 56
                Width = 40
                Height = 16
                Hint = ''
                Caption = 'Freight'
                TabOrder = 3
              end
              object Label11: TUniLabel
                Left = 1
                Top = 80
                Width = 29
                Height = 16
                Hint = ''
                Caption = 'Total'
                TabOrder = 4
              end
              object SBTaxBreakdown: TUniSpeedButton
                Left = 40
                Top = 29
                Width = 25
                Height = 25
                Hint = 'Tax Breakdown'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFC9CACBA1B4C585ACC67CA9C780A8C48AA9C1A9B9C6FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACAB7B7B7B0B0B0AEAEAEAC
                  ACACADADADBBBBBBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  9EB2C455A1CE26B9EA0CB9EB159FDD319CD82D8ACC2E77B95E90BBAFBCC7FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFB5B5B5A8A8A8C0C0C0C0C0C0AAAAAAA7
                  A7A7989898868686989898BEBEBEFF00FFFF00FFFF00FFFF00FFC7C9CB719BBD
                  0086CE02AEFA01BEFA00C5FF06D3FD1CE5FF40E9FF3ECAF20E9DEA047ECF9EB1
                  C2FF00FFFF00FFFF00FFC9C9C9A1A1A1959595BDBDBDC7C7C7CECECED7D7D7E4
                  E4E4E7E7E7CECECEADADAD919191B4B4B4FF00FFFF00FFFF00FFA6B6C52382C0
                  129AD70873BA027CD003A0EF00BFF200C8F92AD8FD67F9FF29C1FF0093FD039C
                  ED96B1C5FF00FFFF00FFB9B9B98F8F8FA5A5A5838383909090B0B0B0C6C6C6CE
                  CECEDADADAF4F4F4CBCBCBADADADADADADB4B4B4FF00FFFF00FFABBAC6438DC2
                  1B85C5007CC500A2E607B8E725C8F441C3EF21A5EA038CE512A9E517CAFD0CB4
                  FF267EBFFF00FFFF00FFBCBCBC9797979292928C8C8CAFAFAFBEBEBECDCDCDC8
                  C8C8B2B2B2A0A0A0B3B3B3D1D1D1C3C3C38C8C8CFF00FFFF00FFBAC2C94686B8
                  0081CF00B1FE06D6FF0AD5F728CCEC52CEEA2BB1F10080EF0091E80B9DDD1D8A
                  D2246AAFFF00FFFF00FFC4C4C4909090939393C0C0C0D9D9D9D7D7D7CDCDCDCF
                  CFCFBCBCBC9D9D9DA5A5A5A9A9A99A9A9A7B7B7BFF00FFFF00FF7A9FBE0678BE
                  0FB4F015B5EE0C9FE906A4E902ACE716B6E941C1EC26ABE90086E40166BF154B
                  9C6693BCFF00FFFF00FFA4A4A4878787BEBEBEBEBEBEAEAEAEB1B1B1B6B6B6BD
                  BDBDC6C6C6B6B6B69D9D9D7D7D7D6262629A9A9AFF00FFFF00FF6393BB1C86C8
                  18A0DC0286D305B1FA08DEFF09EAFF20ECFF4CF9FF43E5FF0997F20098F1168F
                  D0C7C9CBFF00FFFF00FF9A9A9A949494AAAAAA979797BFBFBFDFDFDFE8E8E8E9
                  E9E9F3F3F3E5E5E5ACACACACACAC9C9C9CC9C9C9FF00FFFF00FF99B1C42972B2
                  096DB616C3F415D9FF10C3EF09BAF115B6F60AAAF104AAEA11D2F90EE1FF09C0
                  FD92ADC3FF00FFFF00FFB4B4B48080807E7E7EC9C9C9DCDCDCC8C8C8C2C2C2C1
                  C1C1B7B7B7B5B5B5D5D5D5E1E1E1CACACAB0B0B0FF00FFFF00FFFF00FFA6B4C4
                  15BEEE0ECEF80085CF00A0E80BB9EF33BCEA2BA9E50088E600A0F103FFFF0DFA
                  FF81A3C1FF00FFFF00FFFF00FFB7B7B7C4C4C4D2D2D2959595AEAEAEC1C1C1C2
                  C2C2B3B3B39F9F9FB1B1B1F7F7F7F4F4F4A8A8A8FF00FFFF00FFFF00FFFF00FF
                  309DCD0088D40391DB08AAE12EAEE11F97DC0084DD0AC0F40ABCF400D4FF0FD2
                  F3AFBBC7FF00FFFF00FFFF00FFFF00FFA4A4A4999999A0A0A0B3B3B3B6B6B6A5
                  A5A5999999C7C7C7C4C4C4D8D8D8D4D4D4BDBDBDFF00FFFF00FFFF00FFFF00FF
                  4985B7067EC6038EE103ACE920C3EC43C2EC0A84E40092E913B6DF659DC2BCC2
                  C9FF00FFFF00FFFF00FFFF00FFFF00FF8F8F8F8E8E8EA0A0A0B6B6B6C7C7C7C7
                  C7C79C9C9CA6A6A6BABABAA3A3A3C4C4C4FF00FFFF00FFFF00FFFF00FFFF00FF
                  3880B70F8DCD0BCEF706E5FF0BCEFF15CFFF0DC9FD09BEF95191C1FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF8B8B8B9A9A9AD2D2D2E4E4E4D4D4D4D4
                  D4D4D0D0D0C7C7C79A9A9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  8AA4BF0BCDFA01FFFF00FFFF00B9FF00BCFF00FFFF03FFFF4B9FC8FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D2D2D2F7F7F7F7F7F7C5C5C5C7
                  C7C7F7F7F7F7F7F7A5A5A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF66A1C51CC1E401D4FA00B9FF01B5FD0CBDEE45ABD1AEBCC7FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A6A6C4C4C4D7D7D7C5C5C5C2
                  C2C2C3C3C3B0B0B0BEBEBEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF97B0C471A9C65DA4CA67A6C784AAC4BAC1C8FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3B3B3ADADADAAAAAAAA
                  AAAAAEAEAEC3C3C3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = SBTaxBreakdownClick
              end
              object SBCalcTax: TUniSpeedButton
                Left = 40
                Top = 29
                Width = 25
                Height = 25
                Hint = 'Calculate Taxes'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  CDB6A8806860806050705840FF00FFBAC2CA8DB2CA7AAAC876A4C486A4C2B1BC
                  C8FF00FFFF00FFFF00FFFF00FFFF00FF877766D0C0B0D0B8B0D0B0A0A2B5CD41
                  9CD112ADE204AAE002A6DF0C94D23686C283A3C2FF00FFFF00FFFF00FFFF00FF
                  967E66F0E0D0D0C0B081BDE80097E0009FE400B0EF00BCF223CEF600BBF3008D
                  E476A5C7BFC5CAFF00FFFF00FFFF00FF967E75F0E0D0C08870007CBE0079CF00
                  A9E600C1F217BFEA00AEEA00A7EF00B8FB0082D1759ABFFF00FFFF00FFFF00FF
                  968675F0E0E0FFC8B00075C10098E200B0EA00BBEC1ACBEC12B6E80087E20066
                  BB004FA7759BC0FF00FFFF00FFFF00FF968D85F0E8E0E0D0C0237BCA0080CC00
                  98E200BAE600CBF32BD1ED00A9E60072D8538ABFBEC5CAFF00FFFF00FFFF00FF
                  A58D85FFE8E0C0907073B2E700B4EF00EFFF00E3FF00BDFF00BEFF00D4FF00F5
                  FF41A9D4BFC4CAC3C3C3FF00FFFF00FFA59585FFF0F0FFC8B0D0E4DD00D5FF00
                  FFFF00F0FF00BFFF00C1FF00EFFF00FFFF47A6C9BEC3CAFF00FFFF00FFFF00FF
                  A59C94FFF0F0E0E0E0FFFFFFBADCE523D6F600D3F900A5CE00A6D40FB9C266A3
                  CAC0C5CBFF80FFFF00FFFF00FFFF00FFB4A494FFF8F09080D04030A0E0D8D090
                  80D04030A0E0C8C09080D04030A0D0C0B0867564FF00FFFF00FFFF00FFFF00FF
                  B4A4A3FFF8F0C0C0E09080D0E0E0E0C0C0E09080D0E0D0D0C0C0E09080D0D0C0
                  C0957564FF00FFFF00FFFF00FFFF00FFB4ABA3FFF8FFFFE0D0FFD0B0FFD0B0FF
                  C090F0B890D0A080D0A080D0B0A0D0C8C0957C73FF00FFFF00FFFF00FFFF00FF
                  B4ABA3FFFFFFFF9860FFA060FFA060FFA060FFA060FFA060FFA060B06850C0A8
                  90958473FF00FFFF00FFFF00FFFF00FFB4B3A3FFFFFFE07840F0D8D0F0D8D0F0
                  C8B0E0B0A0E0A080E08050A05830D0A090958473FF00FFFF00FFFF00FFFF00FF
                  DAC7C0BEB3A9F0B8A0D09070D08860D08050D07040D06830C06030D08060A088
                  80C6A891FF00FFFF00FFFF00FFFF00FFFF00FFCCC4B3B0A8A0B0A8A0B0A090B0
                  9890B09890A09890A09080A08880C9AE98FF00FFFF00FFFF00FF}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = SBCalcTaxClick
              end
            end
            object PnlTotalsDBEdit: TUniPanel
              Left = 65
              Top = 1
              Width = 112
              Height = 94
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              Layout = 'fit'
              LayoutConfig.Split = True
              LayoutConfig.Region = 'center'
              DesignSize = (
                112
                94)
              object DBSubTotal: TUniDBEdit
                Left = 1
                Top = 4
                Width = 110
                Height = 21
                Cursor = crArrow
                Hint = ''
                DataField = 'TOTAL_BEFORE_TAX'
                DataSource = SrcViewArPrePostDetailTotals
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBTax: TUniDBEdit
                Left = 1
                Top = 28
                Width = 110
                Height = 21
                Cursor = crArrow
                Hint = ''
                DataField = 'NET_TAX'
                DataSource = SrcViewArPrePostDetailTotals
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBFreight: TUniDBEdit
                Left = 1
                Top = 52
                Width = 110
                Height = 21
                Cursor = crArrow
                Hint = ''
                DataField = 'FREIGHT'
                DataSource = SrcViewArPrePostDetailTotals
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBTotal: TUniDBEdit
                Left = 1
                Top = 76
                Width = 110
                Height = 21
                Cursor = crArrow
                Hint = ''
                DataField = 'TOTAL'
                DataSource = SrcViewArPrePostDetailTotals
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
            end
          end
        end
      end
      object Panel3: TUniPanel
        Left = 0
        Top = 0
        Width = 1109
        Height = 622
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        Layout = 'fit'
        LayoutConfig.Split = True
        LayoutConfig.Region = 'center'
        ExplicitWidth = 1110
        ExplicitHeight = 477
        object PnlDetail: TUniPanel
          Left = 1
          Top = 231
          Width = 1107
          Height = 391
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          Layout = 'fit'
          LayoutConfig.Split = True
          LayoutConfig.Region = 'center'
          object Bevel1: TUniPanel
            Left = 1
            Top = 27
            Width = 1105
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = ''
            Layout = 'fit'
            LayoutConfig.Region = 'north'
            ExplicitWidth = 0
          end
          object PnlToolbarDetail: TUniPanel
            Left = 1
            Top = 1
            Width = 1105
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Alignment = taLeftJustify
            Caption = ''
            Layout = 'fit'
            LayoutConfig.Region = 'north'
            ExplicitWidth = 0
            object sbComm: TUniSpeedButton
              Left = 408
              Top = 1
              Width = 19
              Height = 19
              Cursor = crArrow
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              Caption = '...'
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -12
              Font.Style = [fsBold]
              ParentColor = False
              Color = clWindow
              OnClick = Commissions1Click
            end
            object SBPO: TUniSpeedButton
              Left = 1
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Customer supplied material, available to credit'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000A0860100A086010000010000000000002E183D00312C
                34003131310034343400353636003939390000334D00263F4D004C194D000066
                4D0045454500464646004B4C4C004C4C4D004E425500574C5E00584D5E00584E
                5E00595959005A5A5A005A5B5D0063586A006C547C0060606000686868007172
                74007173740074757800AD551E00BE6E270021802100288F280058A358007DCB
                7D00C58557002F33B30065398200683B87006C3C8B00713F9200783DA200783D
                A3001079A9007B459F007B45A0007E46A3004551CC004954CC005F7FFF008649
                AF00982DE200A448E400A549E400AA47EC00B868ED00BA6AEE00BC74EC00C17F
                ED003595BD003996BE004080800088888800999999009D89A900AF97BD00AAAC
                AC00B2B2B300B2B3B300B3B4B500B7B7B700EBC28200B283D100C9AEDC00CCAF
                DF00CCB3DC00C180EC00C181EC00C180ED00C182EC00C283EC00C385ED00C487
                ED00C486EE00C888F300D094F500D299F600D29AF700D3B7E200D6B6E800D7A5
                F700D9A5F900DDAFF900DEB2FA00E3BBFA00E4BEFB00E4BFFB00E5BFFB009FD9
                EB00C0C0C000D1D1D100D4D4D400E2CCF000E5C1FB00E6C2FB00E8C8FB00E8C9
                FB00EACCFC00EBCDFC00EBCFFC00EDD7FB00EED7FB00ECD0FC00ECD1FC00ECD2
                FC00EDD3FC00EDD5FC00EED5FC00EED9FB00EFD8FD00EFD9FD00F0DAFD00F0DC
                FD00F0DDFD00F0DEFD00F1DEFD00F2DFFD00E0E0E000E2E2E200E8E8E800ECEC
                EC00EDEDED00F3E1FD00F3E2FD00F3E3FD00F4E5FD00F5E6FD00F4E5FE00F5E6
                FE00F5E7FE00F8EEFE00F0F0F000F9F1FE00FBF6FF00FCF8FF00FCF9FF00FDF9
                FF00FDFAFF00FDFBFF00FDFDFD00000000000000000000000000000000000000
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
                00000000000000000000000000000000000000000000000000003C3C3C421943
                3C3C3C3C3C4219433C3C3C3C3C4219433C3C3C3C3C4219433C3C3C3C3C1A451B
                3C3C3C3C3C1A451B3C3C3C3C3C1A453C3C3C3C3C3C1A453C3C3C3C8282411402
                1212121213040C443C3C3C82824113021212121213040C443C3C322D2C2B2B27
                242425261605643C3C3C3D1818181814121212121705643C3C3C327B756D6501
                1111100F00033C3C3C3C3D803C3C3C020D0D0D0D01033C3C3C3C32887873153F
                1E1F093B2A17623C3C3C3D813C3C140B191B143E3D17623C3C3C32856F400E5F
                202109613A630B3C3C3C3D803C0B0B633E4514643E630B3C3C3C328A7057585E
                0606070D0D8118623C3C3D823C0B0B3C05050A0C0C8118623C3C328B847C7774
                2F3008461D817F0A7E803D8C3C3C3C3C1B41024518817F0A7E80328B7C76716A
                232E08221C813C3E173D3D8C3C3C3C3C171B023D12813C3E173D328B7D77726B
                68675D8728813C3C3C3C3D8C3C3C3C3C3C3C3C3C17813C3C3C3C328D89837A86
                7869606C29813C3C3C3C3D8C3C3C3C3C3C3C3C3C17813C3C3C3C328B79746C8E
                32322929318C3C3C3C3C3D8C3C3C3C3C3D3D1717198C3C3C3C3C32919191918F
                326C6C324A3C3C3C3C3C3D943C3C3C3C3D7E7E1B623C3C3C3C3C329193939290
                328B3748943C3C3C3C3C3D94949494943D8C3E45943C3C3C3C3C323232323232
                323849943C3C3C3C3C3C3D3D3D3D3D3D3D3E62943C3C3C3C3C3C}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = SBPOClick
            end
            object btnCurrency1: TUniSpeedButton
              Left = 26
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Foreign Currency rates'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000A0860100A08601000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                09760B54AB5CFF00FFCFCFECBFBFE6BFBFE6BFBFE6BFBFE6F3F3FAFF00FFECD9
                CFEDDCD3FF00FFFF00FFFF00FFFF00FF3D3D3D727272FF00FFAEAEAEA1A1A1A1
                A1A1A1A1A1A1A1A1CDCDCDFF00FFB1B1B1B4B4B4FF00FFFF00FF9CCA9F499B4C
                0C7B0F2A8B2CDEEFDE4752C0132CB81127B51125B30C1AACCFCFECFF00FFB569
                40BA7550FF00FFFF00FF979797626262424242515151C3C3C34D4D4D39393937
                37373535352F2F2FAEAEAEFF00FF4242424E4E4EFF00FFFF00FF138519138519
                0B7A0F128516489B4AA9A9DD060FA48686CFBFBFE6BFBFE6E0CDCAB66B40A649
                10A64914B46840F0E2DB4B4B4B4B4B4B4141414A4A4A6262628E8E8E29292971
                7171A1A1A1A1A1A1A6A6A6444444262626262626414141BABABA91CE97E3F4E5
                0D7B110D7C111184167070C60C1EAE2E35B24040B3DBDBF0ECD9CFB66B40A74A
                10A64A14B46840F0E2DB999999C8C8C84242424343434A4A4A6060603131313A
                3A3A3F3F3FB8B8B8B1B1B1444444272727272727414141BABABAA6D2AA15891E
                178C2015891C4EA5534040B30C1EAE0917AA00009ACFCFECFF00FFF7EFEBA94D
                15AC5520FF00FFFF00FFA0A0A04E4E4E5151514E4E4E6C6C6C3F3F3F3131312D
                2D2D222222AEAEAEFF00FFC7C7C7292929303030FF00FFFF00FF1B91261C9327
                09740C219C2C90CD95CFCFEC243EBE4352C1BFBFE6FF00FFFF00FFCA9477A442
                00A44100D3A68FFF00FF5656565757573B3B3B5F5F5F979797AEAEAE4343434D
                4D4DA1A1A1FF00FFFF00FF6B6B6B2020202020207D7D7DFF00FF219A30219B2F
                12821915891D15881CFF00FF3247BF2B43C0B2B2E0BFBFE6E1CAB9AB4A00B86D
                3EB76A3AA44100FAF5F35E5E5E5F5F5F4848484E4E4E4E4E4EFF00FF47474745
                4545959595A1A1A1A1A1A1272727454545424242202020CDCDCDCEF0D554AB5C
                14851C168A2057B361FF00FFC3C6E91231BB2B43BF1B2AB19E6257AF4F00F3E7
                E1EEDED5A44100C78E6FC1C1C17272724B4B4B4F4F4F797979FF00FFA6A6A63C
                3C3C4545453636363E3E3E2B2B2BBFBFBFB6B6B6202020666666FF00FFFF00FF
                14861E54AB5CFF00FFFF00FFFF00FFEEEEF8BBBBE4D5D5EEE7D0C6EBD7CDFF00
                FFFF00FFE9D4C9EAD5CBFF00FFFF00FF4C4C4C727272FF00FFFF00FFFF00FFC8
                C8C89D9D9DB3B3B3A8A8A8AFAFAFFF00FFFF00FFACACACADADADFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = btnCurrency1Click
            end
            object CBMisc: TUniCheckBox
              Left = 85
              Top = 5
              Width = 92
              Height = 17
              Hint = ''
              Caption = 'Miscellaneous'
              TabOrder = 0
              OnClick = CBMiscClick
            end
            object Panel1: TUniPanel
              Left = 1070
              Top = 1
              Width = 35
              Height = 25
              Hint = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              Layout = 'fit'
              LayoutConfig.Region = 'east'
            end
            object cbCustComm: TUniCheckBox
              Left = 181
              Top = 5
              Width = 140
              Height = 17
              Hint = ''
              Caption = 'Apply Cust. Commissions'
              TabOrder = 2
            end
          end
          object PnlGridDetail: TUniPanel
            Left = 1
            Top = 30
            Width = 1105
            Height = 361
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            Layout = 'fit'
            LayoutConfig.Region = 'center'
            ExplicitWidth = 0
            object GridInvoiceDetail: TIQUniGridControl
              Left = 1
              Top = 1
              Width = 1103
              Height = 359
              Layout = 'fit'
              LayoutConfig.Region = 'center'
              ParentAlignmentControl = False
              AlignmentControl = uniAlignmentClient
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              Font.Height = -13
              TabOrder = 0
              IQComponents.Grid.Left = 0
              IQComponents.Grid.Top = 29
              IQComponents.Grid.Width = 886
              IQComponents.Grid.Height = 273
              IQComponents.Grid.Hint = ''
              IQComponents.Grid.TitleFont.Height = -13
              IQComponents.Grid.DataSource = SrcArPrePostDetail
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
              IQComponents.Navigator.DataSource = SrcArPrePostDetail
              IQComponents.Navigator.LayoutConfig.Region = 'east'
              IQComponents.Navigator.TabOrder = 3
              IQComponents.HiddenPanel.Left = 886
              IQComponents.HiddenPanel.Top = 29
              IQComponents.HiddenPanel.Width = 209
              IQComponents.HiddenPanel.Height = 273
              IQComponents.HiddenPanel.Hint = ''
              IQComponents.HiddenPanel.Visible = True
              IQComponents.HiddenPanel.Align = alRight
              IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
              IQComponents.FormTab.Hint = ''
              IQComponents.FormTab.ImageIndex = 1
              IQComponents.FormTab.Caption = 'Form'
              IQComponents.FormTab.Layout = 'border'
              IQComponents.FormTab.ExplicitLeft = 0
              IQComponents.FormTab.ExplicitTop = 0
              IQComponents.FormTab.ExplicitWidth = 256
              IQComponents.FormTab.ExplicitHeight = 128
              DataSource = SrcArPrePostDetail
              Columns = <
                item
                  FieldName = 'DISPDESCRIP'
                  Title.Caption = 'Description'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DISPITEMNO'
                  Title.Caption = 'Item #'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DISPCLASS'
                  Title.Caption = 'Class'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DISPREV'
                  Title.Caption = 'Revision'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'MISC_COMMENT'
                  Title.Caption = 'Miscellaneous Description'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'INVOICE_QTY'
                  Title.Caption = 'Quantity'
                  Title.Font.Height = -13
                  Width = 96
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'UNIT_PRICE'
                  Title.Caption = 'Unit Price'
                  Title.Font.Height = -13
                  Width = 88
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'SalesPerson'
                  Title.Caption = 'Salesperson(s)'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'GLACCT'
                  Title.Caption = 'Sales GL Account'
                  Title.Font.Height = -13
                  Width = 200
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TOTAL_BEFORE_TAX'
                  Title.Caption = 'Total Before Tax'
                  Title.Font.Height = -13
                  Width = 112
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TOTAL_AFTER_TAX'
                  Title.Caption = 'Total After Tax'
                  Title.Font.Height = -13
                  Width = 112
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TAX_RATE'
                  Title.Caption = 'Tax Rate %'
                  Title.Font.Height = -13
                  Width = 80
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'FREIGHT_COMP'
                  Title.Caption = 'Freight Comp.'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'FREIGHT_PRICE'
                  Title.Caption = 'Freight Charge'
                  Title.Font.Height = -13
                  Width = 112
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'REFERENCE'
                  Title.Caption = 'Reference'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'REFCODE'
                  Title.Caption = 'Reference Code Description'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'REFCODE_CODE'
                  Title.Caption = 'Reference Code'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'PRICE_PER_1000'
                  Title.Caption = 'Price/1000'
                  Title.Font.Height = -13
                  Width = 80
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'PRICE_PER_1000_YN'
                  Title.Caption = 'Include Price/1000?'
                  Title.Font.Height = -13
                  Width = 8
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'Y;N'
                end
                item
                  FieldName = 'CommPrcnt'
                  Title.Caption = 'Commission %'
                  Title.Font.Height = -13
                  Width = 80
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TotalComm'
                  Title.Caption = 'Total Commissions'
                  Title.Font.Height = -13
                  Width = 80
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'COST_SOURCE'
                  Title.Caption = 'Cost Source'
                  Title.Font.Height = -13
                  Width = 80
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'MISC_PO'
                  Title.Caption = 'Miscellaneous PO'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TAX_CODE'
                  Title.Caption = 'Tax Code'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'VMI_REFERENCE'
                  Title.Caption = 'VMI Reference'
                  Title.Font.Height = -13
                  Width = 260
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'NO_POST_STD_COST'
                  Title.Caption = 'No Post Standard Cost'
                  Title.Font.Height = -13
                  Width = 8
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'Y;N'
                end
                item
                  FieldName = 'GLACCT_DESCRIP'
                  Title.Caption = 'GL Account Description'
                  Title.Font.Height = -13
                  Width = 400
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'ARINVTDESCRIP2'
                  Title.Caption = 'Ext. Description'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'GL_FR_ACCT'
                  Title.Caption = 'Freight GL Account'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'FREIGHT_REV_AMOUNT'
                  Title.Caption = 'Freight Revenue'
                  Title.Font.Height = -13
                  Width = 80
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'FREIGHT_REV_PCNT'
                  Title.Caption = 'Freight Revenue %'
                  Title.Font.Height = -13
                  Width = 80
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'GL_FR_ACCT_REV'
                  Title.Caption = 'Freight revenue GL account'
                  Title.Font.Height = -13
                  Width = 400
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'FOB'
                  Title.Caption = 'FOB'
                  Title.Font.Height = -13
                  Width = 160
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'ORIG_FREIGHT_PRICE'
                  Title.Caption = 'PS Freight Charge'
                  Title.Font.Height = -13
                  Width = 80
                  Font.Height = -13
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'UNIT'
                  Title.Caption = 'UOM'
                  Title.Font.Height = -13
                  Width = 80
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DISCOUNT'
                  Title.Caption = 'Discount %'
                  Title.Font.Height = -13
                  Width = 80
                  Font.Height = -13
                  CheckBoxField.FieldValues = 'true;false'
                end>
              TabsVisible = False
              Marker = 0
            end
          end
        end
        object PnlTop: TUniPanel
          Left = 1
          Top = 1
          Width = 1107
          Height = 231
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          ParentAlignmentControl = False
          Layout = 'fit'
          LayoutConfig.Split = True
          LayoutConfig.Region = 'north'
          object PC1: TUniPageControl
            Left = 1
            Top = 1
            Width = 1105
            Height = 229
            Hint = ''
            ActivePage = TabGeneral
            TabBarVisible = True
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            LayoutConfig.Region = 'center'
            TabOrder = 0
            ExplicitWidth = 1110
            object TabGeneral: TUniTabSheet
              Hint = ''
              ParentAlignmentControl = False
              Caption = 'General'
              Layout = 'fit'
              LayoutConfig.Region = 'center'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 256
              ExplicitHeight = 128
              object PageControl1: TUniPageControl
                Left = 0
                Top = 0
                Width = 1097
                Height = 198
                Hint = ''
                ActivePage = TabForm
                TabBarVisible = True
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                ExplicitWidth = 1102
                ExplicitHeight = 203
                object TabGrid: TUniTabSheet
                  Hint = ''
                  TabVisible = False
                  ParentAlignmentControl = False
                  Caption = 'TabGrid'
                  Layout = 'fit'
                  LayoutConfig.Region = 'center'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 256
                  ExplicitHeight = 128
                  object GridInvoice: TUniDBGrid
                    Left = 0
                    Top = 0
                    Width = 1089
                    Height = 167
                    Hint = ''
                    TitleFont.Height = -13
                    DataSource = SrcArPrePost
                    LoadMask.Message = 'Loading data...'
                    LayoutConfig.Region = 'center'
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    ParentColor = False
                    Color = clBtnFace
                    Columns = <
                      item
                        FieldName = 'INVOICE_NO'
                        Title.Caption = 'Inv#'
                        Title.Font.Height = -13
                        Width = 154
                        Font.Height = -13
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'PERIOD'
                        Title.Caption = 'A/R Period'
                        Title.Font.Height = -13
                        Width = 72
                        Font.Height = -13
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'CUSTNO'
                        Title.Caption = 'Customer#'
                        Title.Font.Height = -13
                        Width = 75
                        Font.Height = -13
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'BILLTOCOMP'
                        Title.Caption = 'Bill To '
                        Title.Font.Height = -13
                        Width = 364
                        Font.Height = -13
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'INVOICE_DATE'
                        Title.Caption = 'Inv. Date'
                        Title.Font.Height = -13
                        Width = 119
                        Font.Height = -13
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'TERMS'
                        Title.Caption = 'Terms'
                        Title.Font.Height = -13
                        Width = 364
                        Font.Height = -13
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'DUE_DATE'
                        Title.Caption = 'Due Date'
                        Title.Font.Height = -13
                        Width = 112
                        Font.Height = -13
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'ARACCT'
                        Title.Caption = 'A/R G/L Acct.'
                        Title.Font.Height = -13
                        Width = 304
                        Font.Height = -13
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'INV_PREFIX'
                        Title.Caption = 'Code'
                        Title.Font.Height = -13
                        Width = 74
                        Font.Height = -13
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'FXACCT'
                        Title.Caption = 'FX Acct'
                        Title.Font.Height = -13
                        Width = 304
                        Font.Height = -13
                        CheckBoxField.FieldValues = 'true;false'
                      end>
                  end
                end
                object TabForm: TUniTabSheet
                  Hint = ''
                  TabVisible = False
                  ParentAlignmentControl = False
                  Caption = 'TabForm'
                  Layout = 'fit'
                  LayoutConfig.Region = 'center'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 256
                  ExplicitHeight = 128
                  object PnlHeader: TUniPanel
                    Left = 0
                    Top = 0
                    Width = 1089
                    Height = 167
                    Hint = ''
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    Caption = ''
                    Layout = 'fit'
                    LayoutConfig.Region = 'north'
                    ExplicitWidth = 1094
                    ExplicitHeight = 193
                    object PnlHeader01: TUniPanel
                      Left = 1
                      Top = 1
                      Width = 607
                      Height = 165
                      Hint = ''
                      Align = alClient
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 0
                      Caption = ''
                      Layout = 'fit'
                      LayoutConfig.Split = True
                      LayoutConfig.Region = 'north'
                      ExplicitLeft = 6
                      ExplicitWidth = 601
                      object PnlHeaderLeft01: TUniPanel
                        Left = 1
                        Top = 1
                        Width = 86
                        Height = 163
                        Hint = ''
                        Align = alLeft
                        Anchors = [akLeft, akTop, akBottom]
                        TabOrder = 0
                        Caption = ''
                        Layout = 'vbox'
                        LayoutConfig.Split = True
                        LayoutConfig.Region = 'west'
                        object Label14: TUniLabel
                          Left = 2
                          Top = 4
                          Width = 53
                          Height = 16
                          Hint = ''
                          Caption = 'Invoice #'
                          TabOrder = 1
                        end
                        object Label5: TUniLabel
                          Left = 2
                          Top = 28
                          Width = 68
                          Height = 16
                          Hint = ''
                          Caption = 'Customer #'
                          TabOrder = 2
                        end
                        object Label1: TUniLabel
                          Left = 2
                          Top = 52
                          Width = 35
                          Height = 16
                          Hint = ''
                          Caption = 'Bill To'
                          TabOrder = 3
                        end
                        object Label16: TUniLabel
                          Left = 2
                          Top = 75
                          Width = 42
                          Height = 16
                          Hint = ''
                          Caption = 'User ID'
                          TabOrder = 4
                        end
                        object Labelsupdoc: TUniLabel
                          Left = 2
                          Top = 98
                          Width = 77
                          Height = 16
                          Hint = ''
                          Caption = '# Supp. Docs'
                          TabOrder = 5
                        end
                      end
                      object Panel19: TUniPanel
                        Left = 92
                        Top = 1
                        Width = 515
                        Height = 163
                        Hint = ''
                        Align = alClient
                        Anchors = [akLeft, akTop, akRight, akBottom]
                        TabOrder = 1
                        Caption = ''
                        Layout = 'fit'
                        LayoutConfig.Split = True
                        LayoutConfig.Region = 'center'
                        ExplicitLeft = 87
                        ExplicitWidth = 574
                        DesignSize = (
                          515
                          163)
                        object DBEditInvoice: TUniDBEdit
                          Tag = 1
                          Left = 10
                          Top = 1
                          Width = 491
                          Height = 21
                          Hint = ''
                          DataField = 'INVOICE_NO'
                          DataSource = SrcArPrePost
                          MaxLength = 15
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 0
                          ExplicitWidth = 485
                        end
                        object DBEditCustNo: TUniDBEdit
                          Tag = 1
                          Left = 10
                          Top = 24
                          Width = 491
                          Height = 21
                          Cursor = crArrow
                          Hint = ''
                          ShowHint = True
                          ParentShowHint = False
                          DataField = 'CustNo'
                          DataSource = SrcArPrePost
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          TabStop = False
                          Color = clBtnFace
                          ReadOnly = True
                          ExplicitWidth = 485
                        end
                        object dbWWBillTo: TUniDBLookupComboBox
                          Tag = 1
                          Left = 10
                          Top = 48
                          Width = 491
                          Height = 24
                          Hint = ''
                          ShowHint = True
                          ParentShowHint = False
                          ListFieldIndex = 0
                          DataField = 'BILL_TO_ID'
                          DataSource = SrcArPrePost
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          Color = clWindow
                          OnDropDown = dbWWBillToDropDown
                          ExplicitWidth = 485
                        end
                        object dbeUserId: TUniDBEdit
                          Left = 10
                          Top = 72
                          Width = 491
                          Height = 21
                          Hint = ''
                          DataField = 'USERID'
                          DataSource = SrcArPrePost
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 3
                          TabStop = False
                          Color = clBtnFace
                          ExplicitWidth = 485
                        end
                        object DBSuppDocs: TUniDBEdit
                          Left = 10
                          Top = 96
                          Width = 491
                          Height = 21
                          Hint = ''
                          DataField = 'NUM_OF_SUPP_DOCS'
                          DataSource = SrcArPrePost
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 4
                          ExplicitWidth = 485
                        end
                        object DBUser1: TUniDBEdit
                          Left = 10
                          Top = 120
                          Width = 491
                          Height = 21
                          Hint = ''
                          DataField = 'CUSER1'
                          DataSource = SrcArPrePost
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 5
                          ExplicitWidth = 485
                        end
                        object DBUser2: TUniDBEdit
                          Left = 10
                          Top = 142
                          Width = 491
                          Height = 21
                          Hint = ''
                          DataField = 'CUSER2'
                          DataSource = SrcArPrePost
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 6
                          ExplicitWidth = 485
                        end
                        object DBUser3: TUniDBEdit
                          Left = 10
                          Top = 165
                          Width = 491
                          Height = 21
                          Hint = ''
                          DataField = 'CUSER3'
                          DataSource = SrcArPrePost
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 7
                        end
                      end
                      object UniSplitter1: TUniSplitter
                        Left = 86
                        Top = 0
                        Width = 6
                        Height = 165
                        Hint = ''
                        Align = alLeft
                        ParentColor = False
                        Color = clBtnFace
                      end
                    end
                    object Panel2: TUniPanel
                      Left = 607
                      Top = 1
                      Width = 482
                      Height = 165
                      Hint = ''
                      Align = alRight
                      Anchors = [akTop, akRight, akBottom]
                      TabOrder = 1
                      Caption = ''
                      Layout = 'fit'
                      LayoutConfig.Split = True
                      LayoutConfig.Region = 'center'
                      object Panel4: TUniPanel
                        Left = 1
                        Top = 1
                        Width = 480
                        Height = 106
                        Hint = ''
                        Align = alTop
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 0
                        Caption = ''
                        Layout = 'fit'
                        LayoutConfig.Split = True
                        LayoutConfig.Region = 'north'
                        ExplicitWidth = 426
                        object PnlHeader02: TUniPanel
                          Left = 1
                          Top = 1
                          Width = 295
                          Height = 104
                          Hint = ''
                          Align = alClient
                          Anchors = [akLeft, akTop, akRight, akBottom]
                          TabOrder = 0
                          Caption = ''
                          Layout = 'fit'
                          LayoutConfig.Split = True
                          LayoutConfig.Region = 'center'
                          object PnlHeaderLeft02: TUniPanel
                            Left = 1
                            Top = 1
                            Width = 75
                            Height = 102
                            Hint = ''
                            Align = alLeft
                            Anchors = [akLeft, akTop, akBottom]
                            TabOrder = 0
                            Caption = ''
                            Layout = 'fit'
                            LayoutConfig.Split = True
                            LayoutConfig.Region = 'west'
                            object Label13: TUniLabel
                              Left = 1
                              Top = 76
                              Width = 29
                              Height = 16
                              Hint = ''
                              Caption = 'Code'
                              TabOrder = 1
                            end
                            object Label2: TUniLabel
                              Left = 1
                              Top = 4
                              Width = 26
                              Height = 16
                              Hint = ''
                              Caption = 'Date'
                              TabOrder = 2
                            end
                            object Label4: TUniLabel
                              Left = 1
                              Top = 28
                              Width = 37
                              Height = 16
                              Hint = ''
                              Caption = 'Terms'
                              TabOrder = 3
                            end
                            object Label3: TUniLabel
                              Left = 1
                              Top = 52
                              Width = 22
                              Height = 16
                              Hint = ''
                              Caption = 'Due'
                              TabOrder = 4
                            end
                          end
                          object Panel17: TUniPanel
                            Left = 75
                            Top = 1
                            Width = 220
                            Height = 102
                            Hint = ''
                            Align = alClient
                            Anchors = [akLeft, akTop, akRight, akBottom]
                            TabOrder = 1
                            Caption = ''
                            Layout = 'fit'
                            LayoutConfig.Split = True
                            LayoutConfig.Region = 'center'
                            DesignSize = (
                              220
                              102)
                            object dbPrefix: TUniDBLookupComboBox
                              Left = 10
                              Top = 72
                              Width = 205
                              Height = 24
                              Hint = ''
                              ListFieldIndex = 0
                              DataField = 'INV_PREFIX'
                              DataSource = SrcArPrePost
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 3
                              Color = clWindow
                            end
                            object DBEditInvDate: TUniDBDateTimePicker
                              Left = 10
                              Top = 1
                              Width = 205
                              Height = 21
                              Hint = ''
                              DataField = 'INVOICE_DATE'
                              DataSource = SrcArPrePost
                              DateTime = 42605.000000000000000000
                              DateFormat = 'dd/MM/yyyy'
                              TimeFormat = 'HH:mm:ss'
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 0
                              OnEnter = DBEditInvDateEnter
                              OnExit = DBEditInvDateExit
                            end
                            object DBTerms: TUniDBLookupComboBox
                              Left = 10
                              Top = 25
                              Width = 205
                              Height = 24
                              Hint = ''
                              ListFieldIndex = 0
                              DataField = 'TERMS_ID'
                              DataSource = SrcArPrePost
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 1
                              Color = clWindow
                            end
                            object DBEditDueDate1: TUniDBDateTimePicker
                              Left = 10
                              Top = 48
                              Width = 205
                              Height = 21
                              Hint = ''
                              DataField = 'DUE_DATE'
                              DataSource = SrcArPrePost
                              DateTime = 42605.000000000000000000
                              DateFormat = 'dd/MM/yyyy'
                              TimeFormat = 'HH:mm:ss'
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 2
                            end
                            object UniSplitter2: TUniSplitter
                              Left = 0
                              Top = 0
                              Width = 6
                              Height = 102
                              Hint = ''
                              Align = alLeft
                              ParentColor = False
                              Color = clBtnFace
                            end
                          end
                        end
                        object PnlHeader03: TUniPanel
                          Left = 295
                          Top = 1
                          Width = 185
                          Height = 104
                          Hint = ''
                          Align = alRight
                          Anchors = [akTop, akRight, akBottom]
                          TabOrder = 1
                          Caption = ''
                          Layout = 'fit'
                          LayoutConfig.Split = True
                          LayoutConfig.Region = 'east'
                          object PnlHeaderLeft03: TUniPanel
                            Left = 1
                            Top = 1
                            Width = 75
                            Height = 102
                            Hint = ''
                            Align = alLeft
                            Anchors = [akLeft, akTop, akBottom]
                            TabOrder = 0
                            Caption = ''
                            Layout = 'fit'
                            LayoutConfig.Split = True
                            LayoutConfig.Region = 'west'
                            object LblCurrency: TUniLabel
                              Left = 1
                              Top = 76
                              Width = 51
                              Height = 16
                              Hint = ''
                              Caption = 'Currency'
                              TabOrder = 1
                            end
                            object Label10: TUniLabel
                              Left = 1
                              Top = 4
                              Width = 65
                              Height = 16
                              Hint = ''
                              Caption = 'AR Account'
                              TabOrder = 2
                            end
                            object Label9: TUniLabel
                              Left = 1
                              Top = 28
                              Width = 36
                              Height = 16
                              Hint = ''
                              Caption = 'Period'
                              TabOrder = 3
                            end
                            object lblEPlant: TUniLabel
                              Left = 1
                              Top = 52
                              Width = 35
                              Height = 16
                              Hint = ''
                              Caption = 'EPlant'
                              TabOrder = 4
                            end
                          end
                          object Panel15: TUniPanel
                            Left = 81
                            Top = 1
                            Width = 104
                            Height = 102
                            Hint = ''
                            Align = alClient
                            Anchors = [akLeft, akTop, akRight, akBottom]
                            TabOrder = 1
                            Caption = ''
                            Layout = 'fit'
                            LayoutConfig.Split = True
                            LayoutConfig.Region = 'center'
                            DesignSize = (
                              104
                              102)
                            object SBAccount: TUniSpeedButton
                              Left = 82
                              Top = 1
                              Width = 22
                              Height = 22
                              Hint = 'Search/Replace Account'
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
                              Anchors = [akTop, akRight]
                              ParentColor = False
                              Color = clWindow
                              OnClick = SBAcctClick
                            end
                            object SBPeriod: TUniSpeedButton
                              Left = 82
                              Top = 24
                              Width = 22
                              Height = 22
                              Hint = 'Find period'
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
                              Anchors = [akTop, akRight]
                              ParentColor = False
                              Color = clWindow
                              OnClick = SBPeriodClick
                            end
                            object DBacct: TUniDBEdit
                              Left = 1
                              Top = 1
                              Width = 80
                              Height = 21
                              Cursor = crArrow
                              Hint = ''
                              ShowHint = True
                              ParentShowHint = False
                              DataField = 'ARACCT'
                              DataSource = SrcArPrePost
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 0
                              TabStop = False
                              Color = clBtnFace
                              ReadOnly = True
                            end
                            object DBEditPeriod: TUniDBEdit
                              Left = 1
                              Top = 24
                              Width = 80
                              Height = 21
                              Cursor = crArrow
                              Hint = ''
                              ShowHint = True
                              ParentShowHint = False
                              DataField = 'Period'
                              DataSource = SrcArPrePost
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 1
                              TabStop = False
                              Color = clBtnFace
                              ReadOnly = True
                            end
                            object dbePlant: TUniDBEdit
                              Left = 1
                              Top = 48
                              Width = 100
                              Height = 21
                              Hint = ''
                              DataField = 'EPlant_Name'
                              DataSource = SrcArPrePost
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 2
                              TabStop = False
                              Color = clBtnFace
                            end
                            object cbCurrency2: TUniDBEdit
                              Left = 1
                              Top = 72
                              Width = 100
                              Height = 21
                              Hint = ''
                              DataField = 'CURRENCYCODE'
                              DataSource = SrcArPrePost
                              Anchors = [akLeft, akTop, akRight]
                              TabOrder = 3
                              TabStop = False
                              Color = clBtnFace
                              ReadOnly = True
                            end
                          end
                          object UniSplitter3: TUniSplitter
                            Left = 75
                            Top = 0
                            Width = 6
                            Height = 104
                            Hint = ''
                            Align = alLeft
                            ParentColor = False
                            Color = clBtnFace
                            ExplicitLeft = 88
                            ExplicitTop = 40
                            ExplicitHeight = 32
                          end
                        end
                      end
                      object GroupBox1: TUniGroupBox
                        Left = 1
                        Top = 106
                        Width = 480
                        Height = 59
                        Hint = ''
                        Caption = '  Customer Invoice Note  '
                        Align = alClient
                        Anchors = [akLeft, akTop, akRight, akBottom]
                        LayoutConfig.Split = True
                        LayoutConfig.Region = 'center'
                        TabOrder = 1
                        ExplicitTop = 109
                        ExplicitWidth = 426
                        ExplicitHeight = 84
                        object DBMemo3: TUniDBMemo
                          Left = 2
                          Top = 18
                          Width = 476
                          Height = 39
                          Hint = ''
                          DataField = 'INFO_AR'
                          DataSource = SrcArPrePost
                          Align = alClient
                          Anchors = [akLeft, akTop, akRight, akBottom]
                          ReadOnly = True
                          TabOrder = 0
                          LayoutConfig.Region = 'center'
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    object TabDoc: TUniTabSheet
      Hint = ''
      TabVisible = False
      ImageIndex = 1
      Caption = 'TabDoc'
      Layout = 'fit'
      LayoutConfig.Region = 'center'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object UniSplitter5: TUniSplitter
        Left = 0
        Top = 0
        Width = 6
        Height = 747
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
        ExplicitLeft = 248
        ExplicitTop = 616
        ExplicitHeight = 32
      end
    end
  end
  object pnlToolBarMain: TUniPanel
    Left = 0
    Top = 0
    Width = 1117
    Height = 29
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    Layout = 'border'
    LayoutConfig.Region = 'north'
    object FlowPanel1: TUniPanel
      Left = 616
      Top = 1
      Width = 276
      Height = 27
      Hint = ''
      CreateOrder = 1
      TabOrder = 14
      Caption = ''
      ParentColor = True
      ParentBackground = True
      Layout = 'hbox'
      LayoutConfig.BodyPadding = '0px 0px 0px 5px'
      LayoutConfig.Region = 'east'
      object DBOnHold: TUniDBCheckBox
        Left = 1
        Top = 5
        Width = 75
        Height = 17
        Hint = ''
        DataField = 'ON_HOLD'
        DataSource = SrcArPrePost
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'On Hold'
        TabOrder = 0
      end
      object DBDoNotEmailUponPost: TUniDBCheckBox
        Left = 84
        Top = 5
        Width = 170
        Height = 17
        Hint = ''
        DataField = 'DO_NOT_EMAIL_UPON_POST'
        DataSource = SrcArPrePost
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Do not Email upon Posting'
        TabOrder = 1
      end
    end
    object Nav: TUniDBNavigator
      Left = 892
      Top = 1
      Width = 225
      Height = 27
      Hint = ''
      CreateOrder = 2
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcArPrePost
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      LayoutConfig.Region = 'east'
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 7
    end
    object SBSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 27
      Hint = 'Search...'
      ShowHint = True
      ParentShowHint = False
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      Images = ImageListNavTree
      ImageIndex = 1
      LayoutConfig.Region = 'west'
      OnClick = SBSearchClick
    end
    object SBToggle: TUniSpeedButton
      Left = 25
      Top = 1
      Width = 25
      Height = 27
      Hint = 'Toggle Grid/Form'
      ShowHint = True
      ParentShowHint = False
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      Images = ImageListNavTree
      ImageIndex = 2
      LayoutConfig.Region = 'west'
      OnClick = SBToggleClick
    end
    object SBSaveAll: TUniSpeedButton
      Left = 50
      Top = 1
      Width = 25
      Height = 27
      Hint = 'Post  All Invoices'
      ShowHint = True
      ParentShowHint = False
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      Images = ImageListNavTree
      ImageIndex = 3
      LayoutConfig.Region = 'west'
      OnClick = SBSaveAllClick
    end
    object SBSave: TUniSpeedButton
      Left = 75
      Top = 1
      Width = 25
      Height = 27
      Hint = 'Post Invoice'
      ShowHint = True
      ParentShowHint = False
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      Images = ImageListNavTree
      ImageIndex = 4
      LayoutConfig.Region = 'west'
      OnClick = SBSaveClick
    end
    object SBView: TUniSpeedButton
      Left = 100
      Top = 1
      Width = 25
      Height = 27
      Hint = 'View Posted Invoices'
      ShowHint = True
      ParentShowHint = False
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      Images = ImageListNavTree
      ImageIndex = 5
      LayoutConfig.Region = 'west'
      OnClick = SBViewClick
    end
    object SbViewVoided: TUniSpeedButton
      Left = 125
      Top = 1
      Width = 25
      Height = 27
      Hint = 'View Voided Invoices'
      ShowHint = True
      ParentShowHint = False
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      Images = ImageListNavTree
      ImageIndex = 6
      LayoutConfig.Region = 'west'
      OnClick = SbViewVoidedClick
    end
    object sbPendingEdi: TUniSpeedButton
      Left = 150
      Top = 1
      Width = 25
      Height = 27
      Hint = 'Pending EDI'#39's'
      ShowHint = True
      ParentShowHint = False
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      Images = ImageListNavTree
      ImageIndex = 7
      LayoutConfig.Region = 'west'
      OnClick = PendingEdis1Click
    end
    object SBPrint: TUniSpeedButton
      Left = 175
      Top = 1
      Width = 25
      Height = 27
      Hint = 'Print Invoice'
      ShowHint = True
      ParentShowHint = False
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      Images = ImageListNavTree
      ImageIndex = 8
      LayoutConfig.Region = 'west'
      OnClick = SBPrintClick
    end
    object SBScan: TUniSpeedButton
      Left = 200
      Top = 1
      Width = 25
      Height = 27
      Hint = 'Scan'
      ShowHint = True
      ParentShowHint = False
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      Images = ImageListNavTree
      ImageIndex = 9
      LayoutConfig.Region = 'west'
      OnClick = SBScanClick
    end
    object sbtnAttachCreditCard: TUniSpeedButton
      Left = 225
      Top = 1
      Width = 25
      Height = 27
      Hint = 'Attached Credit Card'
      ShowHint = True
      ParentShowHint = False
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      Images = ImageListNavTree
      ImageIndex = 10
      LayoutConfig.Region = 'west'
      OnClick = DoAttachedCreditCards
    end
    object sbtnCreditCardCharge: TUniSpeedButton
      Left = 250
      Top = 1
      Width = 25
      Height = 27
      Hint = 'Charge Credit Card'
      ShowHint = True
      ParentShowHint = False
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      Images = ImageListNavTree
      ImageIndex = 11
      LayoutConfig.Region = 'west'
      OnClick = ChargeCreditCard1Click
    end
    object SBCarryOver: TUniSpeedButton
      Left = 275
      Top = 1
      Width = 25
      Height = 27
      Hint = 'Carry customer information to the next record'
      ShowHint = True
      ParentShowHint = False
      GroupIndex = 1
      AllowAllUp = True
      Down = True
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      Images = ImageListNavTree
      ImageIndex = 12
      LayoutConfig.Region = 'west'
      OnClick = Customercarryover1Click
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 577
    Top = 349
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = '&New'
        OnClick = New1Click
      end
      object Delete1: TUniMenuItem
        Caption = '&Delete'
        OnClick = Delete1Click
      end
      object N4: TUniMenuItem
        Caption = '-'
      end
      object ViewPostedInvoices1: TUniMenuItem
        Caption = '&View Posted Invoices'
        OnClick = ViewPostedInvoices1Click
      end
      object PostInvoice1: TUniMenuItem
        Caption = 'Post &Invoice'
        OnClick = PostInvoice1Click
      end
      object PostAllInvoices1: TUniMenuItem
        Caption = 'Post &All Invoices'
        OnClick = SBSaveAllClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object ViewVoidedInvoices1: TUniMenuItem
        Caption = 'View V&oided Invoices'
        OnClick = SbViewVoidedClick
      end
      object ViewCreditMemos1: TUniMenuItem
        Caption = 'View &Credit Memos'
        OnClick = ViewCreditMemos1Click
      end
      object BrowseGLBatches1: TUniMenuItem
        Caption = '&Browse GL Batches'
        OnClick = BrowseGLBatches1Click
      end
      object N11: TUniMenuItem
        Caption = '-'
      end
      object PendingEdis1: TUniMenuItem
        Caption = 'Pending EDI'#39's'
        OnClick = PendingEdis1Click
      end
      object N22: TUniMenuItem
        Caption = '-'
      end
      object ChargeCreditCard1: TUniMenuItem
        Caption = 'Charge Credit Card'
        OnClick = ChargeCreditCard1Click
      end
      object N5: TUniMenuItem
        Caption = '-'
      end
      object Status1: TUniMenuItem
        Caption = 'S&tatus'
        OnClick = Status1Click
      end
      object Search1: TUniMenuItem
        Caption = '&Search...'
        OnClick = SBSearchClick
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      OnClick = Options1Click
      object Freight1: TUniMenuItem
        Caption = '&Ship Via Maintenance'
        OnClick = Freight1Click
      end
      object Terms1: TUniMenuItem
        Caption = '&Terms'
        OnClick = Terms1Click
      end
      object TaxCodes1: TUniMenuItem
        Caption = 'Tax &Codes'
        OnClick = TaxCodes1Click
      end
      object N12: TUniMenuItem
        Caption = '-'
      end
      object AutoInvoice1: TUniMenuItem
        Caption = '&Auto Invoicing'
        HelpContext = 1097493
        OnClick = AutoInvoice1Click
      end
      object N14: TUniMenuItem
        Caption = '-'
      end
      object InvoiceCodes1: TUniMenuItem
        Caption = '&Invoice Codes'
        OnClick = InvoiceCodes1Click
      end
      object N10: TUniMenuItem
        Caption = '-'
      end
      object ExternalExefile1: TUniMenuItem
        Caption = '&External Program File (.EXE)'
        OnClick = ExternalExefile1Click
      end
      object N17: TUniMenuItem
        Caption = '-'
      end
      object Customercarryover1: TUniMenuItem
        Caption = 'C&ustomer carry over'
        OnClick = Customercarryover1Click
      end
      object PostallforindividualUserID1: TUniMenuItem
        Caption = 'Post All for Individual &User'
        GroupIndex = 1
        RadioItem = True
        OnClick = PostallforindividualUserID1Click
      end
      object PostallforallUsersID1: TUniMenuItem
        Caption = '&Post All for All Users'
        GroupIndex = 1
        RadioItem = True
        OnClick = PostallforallUsersID1Click
      end
      object MultiselectDetail1: TUniMenuItem
        Caption = 'Multiselect Detail'
        GroupIndex = 1
        OnClick = MultiselectDetail1Click
      end
      object N20: TUniMenuItem
        Caption = '-'
        GroupIndex = 1
      end
      object AttachedCreditCard1: TUniMenuItem
        Caption = 'Attached Credit Card'
        GroupIndex = 1
        OnClick = DoAttachedCreditCards
      end
      object CustomerPickListDate1: TUniMenuItem
        Caption = 'Customer pick list Date'
        GroupIndex = 1
        OnClick = CustomerPickListDate1Click
      end
      object BuildUnitPriceAccountSplit1: TUniMenuItem
        Caption = 'Build Unit Price Account Split'
        GroupIndex = 2
        RadioItem = True
        OnClick = BuildUnitPriceAccountSplit1Click
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
      object N6: TUniMenuItem
        Caption = '-'
      end
      object InvoiceReport1: TUniMenuItem
        Caption = '&Invoice Report'
        OnClick = PrintInvoice1Click
      end
      object Rangeofinvoices1: TUniMenuItem
        Caption = 'Range of Invoices '
        OnClick = Printrangeofinvoices1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object N7: TUniMenuItem
        Caption = '-'
      end
      object About1: TUniMenuItem
        Caption = 'About'
      end
    end
    object Debug1: TUniMenuItem
      Caption = 'Debug'
      Visible = False
      object Show1: TUniMenuItem
        Caption = 'Show'
      end
      object Clear1: TUniMenuItem
        Caption = 'Clear'
      end
    end
  end
  object SrcArPrePost: TDataSource
    DataSet = QryArPrePost
    OnDataChange = SrcArPrePostDataChange
    Left = 248
    Top = 162
  end
  object QryOrd: TFDQuery
    Tag = 1
    BeforeOpen = QryOrdBeforeOpen
    OnCalcFields = QryShipCalcFields
    Filtered = True
    MasterSource = SrcArPrePost
    MasterFields = 'ARCUSTO_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.descrip as description,'
      '       v.itemno,'
      '       v.packslipno,'
      '       v.orderno,'
      '       v.shipdate,'
      '       v.custno,'
      '       v.qtyshipped,'
      '       v.total_qty_ord,'
      '       v.unit_price,'
      '       v.price_per_1000,'
      '       v.tax_code_id,'
      '       v.arinvt_id,'
      '       v.misc_item,'
      '       v.descrip,'
      '       v.descrip2,'
      '       v.ord_detail_id,'
      '       v.shipment_dtl_id,'
      '       v.backorder_qty,'
      '       v.comm_pct,'
      '       v.class,'
      '       v.rev,'
      '       v.salespeople_id,'
      '       v.acct_id_sales,'
      '       v.cumm_shipped,'
      '       v.invoice_qty,'
      '       v.invoiced_qty,'
      '       a.invoiced_qty as ar_invoiced_qty,'
      '       v.pending_invoiced_qty,'
      '       0 as shippedsofar,'
      '       v.orders_id,'
      '       v.pono,'
      '       v.eplant_id,'
      
        '       substrB(iqeval.substrW63Max(AR.GetAka_Kind_Price_per_1000' +
        '(ar.price_per_1000, v.arcusto_id, v.arinvt_id, v.ship_to_id, v.a' +
        'ka_kind), 1, 1), 1, 1) as price_per_1000YN,'
      '       v.vmi,'
      '       NVL(ar.phantom, '#39'N'#39') as phantom,'
      '       NVL(ar.phantom_components_on_so, '#39'N'#39') as phantom_on_so, '
      
        '       decode(NVL(v.PHANTOM_ORD_DETAIL_ID, 0), 0, '#39'N'#39', '#39'Y'#39') as p' +
        'hantom_child,'
      
        '       decode(NVL(v.PHANTOM_ORD_DETAIL_ID, 0), 0, v.itemno, '#39'   ' +
        '  '#39' || v.itemno) as phantom_itemno'
      '       '
      '  from v_ord_ord v,'
      '       ship_to s,'
      '       c_arinvoice_ship_sum a,'
      '        arinvt ar'
      
        '  where v.invoice_qty + (select NVL(sum(invoice_qty), 0) from ar' +
        'invoice_detail where ord_detail_id = v.ord_detail_id and rma_det' +
        'ail_id is not null) > 0'
      '    and v.arcusto_id = :ARCUSTO_ID'
      '    and v.shipment_dtl_id = a.shipment_dtl_id(+)'
      '    and NVL(v.pending_invoiced_qty, 0) < NVL(v.invoice_qty, 0)'
      
        '    and (NVL(v.qtyshipped, 0) > NVL(a.invoiced_qty, 0) or NVL(v.' +
        'qtyshipped, 0) = 0)'
      '    and v.arinvt_id = ar.id(+)'
      '    and v.ship_to_id = s.id(+)'
      '    and v.to_invoice = '#39'Y'#39
      '    and v.phantom_ps_ticket_dtl_id is null'
      
        '    and (v.vmi = '#39'N'#39' or (v.vmi = '#39'Y'#39' and NVL(s.vmi_invoice_on_sh' +
        'ip, '#39'N'#39')  = '#39'Y'#39') )'
      '    and NVL(v.shipment_type, '#39'***'#39') <> '#39'CUM SHIP ADJUSTMENT'#39
      '    and NVL(v.PHANTOM_ORD_DETAIL_ID, 0) = 0')
    Left = 166
    Top = 378
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryOrdQTYSHIPPED: TBCDField
      DisplayLabel = 'Qty.Shipped'
      DisplayWidth = 10
      FieldName = 'QTYSHIPPED'
      Origin = 'V.QTYSHIPPED'
    end
    object QryOrdSHIPDATE: TDateTimeField
      DisplayLabel = 'Ship Date'
      DisplayWidth = 8
      FieldName = 'SHIPDATE'
      Origin = 'V.SHIPDATE'
    end
    object QryOrdAR_INVOICED_QTY: TBCDField
      DisplayLabel = 'Qty. Invoiced'
      DisplayWidth = 10
      FieldName = 'AR_INVOICED_QTY'
      Origin = 'A.INVOICED_QTY'
    end
    object QryOrdREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'V.REV'
      Size = 15
    end
    object QryOrdUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Origin = 'V.UNIT_PRICE'
      Size = 6
    end
    object QryOrdCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'V.CLASS'
      Size = 2
    end
    object QryOrdCUMM_SHIPPED: TBCDField
      DisplayLabel = 'Total Releases'
      DisplayWidth = 14
      FieldName = 'CUMM_SHIPPED'
      Origin = 'V.CUMM_SHIPPED'
    end
    object QryOrdINVOICED_QTY: TFMTBCDField
      DisplayLabel = 'Invoiced Qty.'
      DisplayWidth = 13
      FieldName = 'INVOICED_QTY'
      Origin = 'V.INVOICED_QTY'
      Size = 38
    end
    object QryOrdINVOICE_QTY: TFMTBCDField
      DisplayLabel = 'Left to Invoice'
      DisplayWidth = 11
      FieldName = 'INVOICE_QTY'
      Origin = 'V.INVOICE_QTY'
      Size = 38
    end
    object QryOrdPENDING_INVOICED_QTY: TFMTBCDField
      DisplayLabel = 'Pending to be Invoiced'
      DisplayWidth = 22
      FieldName = 'PENDING_INVOICED_QTY'
      Origin = 'V.PENDING_INVOICED_QTY'
      Size = 38
    end
    object QryOrdPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 20
      FieldName = 'PONO'
      Origin = 'V.PONO'
      Size = 35
    end
    object QryOrdDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      Origin = 'LTrim(RTrim(NVL(v.misc_item, '#39' '#39') || NVL(v.descrip, '#39' '#39')))'
      Size = 100
    end
    object QryOrdVMI: TStringField
      DisplayWidth = 1
      FieldName = 'VMI'
      Size = 1
    end
    object QryOrdORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 'v.orderno'
      Size = 15
    end
    object QryOrdPACKSLIPNO: TStringField
      DisplayLabel = 'PackSlip#'
      DisplayWidth = 15
      FieldName = 'PACKSLIPNO'
      Origin = 'V.PACKSLIPNO'
      Size = 15
    end
    object QryOrdDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryOrdITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'V.ITEMNO'
      Size = 50
    end
    object QryOrdPRICE_PER_1000: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'PRICE_PER_1000'
      Size = 6
    end
    object QryOrdPHANTOM_ITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 30
      FieldName = 'PHANTOM_ITEMNO'
      Visible = False
      Size = 55
    end
    object QryOrdSHIPPEDSOFAR: TFMTBCDField
      DisplayLabel = 'Shipped so far'
      DisplayWidth = 13
      FieldName = 'SHIPPEDSOFAR'
      Origin = 'V.SHIPPEDSOFAR'
      Visible = False
      Size = 38
    end
    object QryOrdCUSTNO: TStringField
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'V.CUSTNO'
      Visible = False
      Size = 10
    end
    object QryOrdTOTAL_QTY_ORD: TBCDField
      DisplayWidth = 10
      FieldName = 'TOTAL_QTY_ORD'
      Origin = 'V.TOTAL_QTY_ORD'
      Visible = False
    end
    object QryOrdTAX_CODE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TAX_CODE_ID'
      Visible = False
      Size = 0
    end
    object QryOrdARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryOrdMISC_ITEM: TStringField
      DisplayWidth = 50
      FieldName = 'MISC_ITEM'
      Visible = False
      Size = 250
    end
    object QryOrdTax: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Tax'
      Visible = False
      Calculated = True
    end
    object QryOrdORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryOrdSHIPMENT_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENT_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryOrdBACKORDER_QTY: TBCDField
      DisplayWidth = 10
      FieldName = 'BACKORDER_QTY'
      Origin = 'V.BACKORDER_QTY'
      Visible = False
    end
    object QryOrdCOMM_PCT: TBCDField
      DisplayWidth = 10
      FieldName = 'COMM_PCT'
      Visible = False
      Size = 3
    end
    object QryOrdSALESPEOPLE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SALESPEOPLE_ID'
      Visible = False
      Size = 0
    end
    object QryOrdACCT_ID_SALES: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'ACCT_ID_SALES'
      Visible = False
      Size = 38
    end
    object QryOrdDESCRIP: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Visible = False
      Size = 100
    end
    object QryOrdORDERS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORDERS_ID'
      Visible = False
      Size = 0
    end
    object QryOrdPRICE_PER_1000YN: TStringField
      DisplayWidth = 1
      FieldName = 'PRICE_PER_1000YN'
      Visible = False
      Size = 1
    end
    object QryOrdEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryOrdPHANTOM: TStringField
      DisplayWidth = 1
      FieldName = 'PHANTOM'
      Visible = False
      Size = 1
    end
    object QryOrdPHANTOM_CHILD: TStringField
      DisplayWidth = 1
      FieldName = 'PHANTOM_CHILD'
      Visible = False
      Size = 1
    end
    object QryOrdPHANTOM_ON_SO: TStringField
      DisplayWidth = 1
      FieldName = 'PHANTOM_ON_SO'
      Visible = False
      Size = 1
    end
  end
  object QryShip: TFDQuery
    Tag = 1
    BeforeOpen = QryShipBeforeOpen
    OnCalcFields = QryShipCalcFields
    Filtered = True
    MasterSource = SrcArPrePost
    MasterFields = 'ARCUSTO_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select substrB(iqeval.substrW63Max(LTrim(RTrim(NVL(v.misc_item, ' +
        #39' '#39') || NVL(v.descrip, '#39' '#39'))), 1, 255), 1, 255) as description,'
      '       v.shipments_id,'
      
        '       decode( v.itemno, NULL, v.misc_itemno, v.itemno ) as item' +
        'no,'
      '       v.packslipno,'
      '       v.orderno,'
      '       v.shipdate,'
      '       v.custno,'
      '       v.qtyshipped,'
      '       v.total_qty_ord,'
      '       v.unit_price,'
      '       v.price_per_1000,'
      '       v.tax_code_id,'
      '       v.arinvt_id,'
      '       v.misc_item,'
      '       v.descrip2,'
      '       v.descrip,'
      '       v.ord_detail_id,'
      '       v.shipment_dtl_id,'
      '       v.backorder_qty,'
      '       v.comm_pct,'
      '       v.class,'
      '       v.rev,'
      '       v.salespeople_id,'
      '       v.vmi_fgmulti_id,'
      '--       v.price_per_1000YN,'
      
        '       substrB(iqeval.substrW63Max(AR.GetAka_Kind_Price_per_1000' +
        '(ar.price_per_1000, v.arcusto_id, v.arinvt_id, v.ship_to_id, NVL' +
        '(d.aka_kind, hd.aka_kind)), 1, 1), 1, 1) as price_per_1000YN,'
      ''
      '--       decode(NVL(aka.price_per_1000, '#39' '#39'), '#39'Y'#39', '#39'Y'#39','
      '--         decode(NVL(aka.price_per_1000, '#39' '#39'), '#39'N'#39', '#39'N'#39','
      
        '--         decode(ar.price_per_1000, '#39'Y'#39', '#39'Y'#39', '#39'N'#39'))) as price_p' +
        'er_1000YN,'
      ''
      
        '         Decode(NVL(NVL(d.glacct_id, NVL(hd.glacct_id, v.acct_id' +
        '_sales)), 0), 0,'
      
        '                    plugins.get_glacct_no_name( iq_arinvoice.Get' +
        'Sales_acct_id(NVL(d.id, hd.id)), misc.geteplantid),'
      
        '                    plugins.get_glacct_no_name( NVL(d.glacct_id,' +
        ' NVL(hd.glacct_id, v.acct_id_sales)), misc.geteplantid)) as acct' +
        '_id_sales,'
      ''
      
        '--       NVL(d.glacct_id, NVL(hd.glacct_id, v.acct_id_sales)) as' +
        ' acct_id_sales,'
      '       v.cumm_shipped,'
      '       decode(v.vmi, '#39'N'#39', NVl(v.qtyshipped, 0),'
      
        '              decode(NVL(s.vmi_invoice_on_ship, '#39'N'#39'), '#39'N'#39', v.vmi' +
        '_consumed, NVl(v.qtyshipped, 0) )) -'
      
        '         NVL(v.invoiced_qty, 0) - NVL(v.pending_invoiced_qty, 0)' +
        ' as invoice_qty,'
      '--       v.invoice_qty,'
      '       v.invoiced_qty,'
      '       NVL(v.eplant_id, v.SHIPMENTS_EPLANT_ID) as eplant_id,'
      '       NVL(a.invoiced_qty, 0) as ar_invoiced_qty,'
      '       NVL(b.invoiced_qty, 0) as ar_ord_invoiced_qty,'
      
        '       decode(NVL(v.shipment_dtl_id, 0), 0, NVL(pb.invoiced_qty,' +
        ' 0), NVL(pb.invoiced_qty, 0)) as pending_qty,'
      '       0 as shippedsofar,'
      
        '       decode(NVL(v.shipment_dtl_id, 0), 0, NVL(a.invoiced_qty, ' +
        '0), NVL(b.invoiced_qty, 0))  as total_qty_invoiced,'
      
        '       v.cumm_shipped - ( decode(NVL(v.shipment_dtl_id, 0), 0, N' +
        'VL(a.invoiced_qty, 0), NVL(b.invoiced_qty, 0)) ) -'
      
        '                      ( decode(NVL(v.shipment_dtl_id, 0), 0, NVL' +
        '(pb.invoiced_qty, 0), NVL(pb.invoiced_qty, 0))  ) as left_to_inv' +
        'oice,'
      '       v.vmi,'
      '       NVL(ar.phantom, '#39'N'#39') as phantom,'
      '       NVL(ar.phantom_components_on_so, '#39'N'#39') as phantom_on_so, '
      
        '       decode(NVL(d.PHANTOM_ORD_DETAIL_ID, 0), 0, '#39'N'#39', '#39'Y'#39') as p' +
        'hantom_child,'
      
        '       decode(NVL(d.PHANTOM_ORD_DETAIL_ID, 0), 0, v.itemno, '#39'   ' +
        '  '#39' || v.itemno) as phantom_itemno'
      '  from c_ship_hist v,'
      '       ship_to s,'
      '       ord_detail d,'
      '       hist_ord_detail hd,'
      '       arinvt ar,  '
      '--       aka aka,'
      '       C_ARINVOICE_SHIP_SUM a,'
      '       C_ARINVOICE_ORD_SUM b,'
      '       C_ARPREPOST_SHIP_SUM pa,'
      '       C_ARPREPOST_ORD_SUM pb'
      '-- where v.invoice_qty > 0'
      ' where '
      '   decode(v.vmi_fgmulti_id, null, NVl(v.qtyshipped, 0),'
      
        '              decode(NVL(s.vmi_invoice_on_ship, '#39'N'#39'), '#39'N'#39', v.vmi' +
        '_consumed, NVl(v.qtyshipped, 0) )) -'
      
        '         NVL(v.invoiced_qty, 0) - NVL(v.pending_invoiced_qty, 0)' +
        ' > 0'
      '   and NVL(v.to_invoice, '#39'Y'#39') = '#39'Y'#39
      '   and v.shipment_dtl_id = a.shipment_dtl_id(+)'
      '   and v.ord_detail_id = b.ord_detail_id(+)'
      '   and v.ord_detail_id = d.id(+)'
      '   and v.ord_detail_id = hd.id(+)'
      '   and v.shipment_dtl_id = pa.shipment_dtl_id(+)'
      '   and v.ord_detail_id = pb.ord_detail_id(+)'
      '   and NVL(v.pending_invoiced_qty, 0) = 0'
      
        '   and v.qtyshipped > NVL(a.invoiced_qty, 0) - (select NVL(sum(i' +
        'nvoice_qty), 0) from arinvoice_detail where shipment_dtl_id = v.' +
        'shipment_dtl_id and rma_detail_id is not null)'
      '   and v.arcusto_id = :ARCUSTO_ID'
      '   and v.ship_to_id = s.id(+)'
      '   and v.arinvt_id = ar.id(+)'
      '--   and v.arinvt_id = aka.arinvt_id(+)'
      '--   and v.arcusto_id = aka.arcusto_id(+)'
      
        '--   and (v.ship_to_id = aka.ship_to_id or NVL(aka.ship_to_id, 0' +
        ') = 0) '
      
        '--   and (aka.kind is null or (aka.kind is not null and aka.kind' +
        ' = NVL(d.aka_kind, hd.aka_kind)))'
      '--   and v.ship_to_id = aka.ship_to_id(+)   '
      '   and v.phantom_ps_ticket_dtl_id is null'
      '   and NVL(d.PHANTOM_ORD_DETAIL_ID, 0) = 0'
      '   and NVL(hd.PHANTOM_ORD_DETAIL_ID, 0) = 0'
      '                                    '
      
        '--   and (v.vmi = '#39'N'#39' or (v.vmi = '#39'Y'#39' and NVL(s.vmi_invoice_on_s' +
        'hip, '#39'N'#39')  = '#39'Y'#39') )'
      
        '--   and v.qtyshipped - ( decode(NVL(v.shipment_dtl_id, 0), 0, N' +
        'VL(a.invoiced_qty, 0), NVL(b.invoiced_qty, 0)) ) -'
      
        '--                      ( decode(NVL(v.shipment_dtl_id, 0), 0, N' +
        'VL(pb.invoiced_qty, 0), NVL(pb.invoiced_qty, 0))  ) > 0'
      
        '     and ((v.vmi_fgmulti_id is null) or (v.vmi_fgmulti_id is not' +
        ' null and NVL(s.vmi_invoice_on_ship, '#39'N'#39')  = '#39'Y'#39'))'
      ''
      '')
    Left = 214
    Top = 376
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryShipPACKSLIPNO: TStringField
      DisplayLabel = 'PackSlip#'
      DisplayWidth = 10
      FieldName = 'PACKSLIPNO'
      Origin = 'V.PACKSLIPNO'
      Size = 15
    end
    object QryShipQTYSHIPPED: TBCDField
      DisplayLabel = 'Qty.Shipped'
      DisplayWidth = 10
      FieldName = 'QTYSHIPPED'
      Origin = 'V.QTYSHIPPED'
    end
    object QryShipAR_INVOICED_QTY: TFMTBCDField
      DisplayLabel = 'Shipped Qty. Invoiced'
      DisplayWidth = 17
      FieldName = 'AR_INVOICED_QTY'
      Origin = 'A.INVOICED_QTY'
      Size = 38
    end
    object QryShipITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Size = 200
    end
    object QryShipSHIPDATE: TDateTimeField
      DisplayLabel = 'Ship Date'
      DisplayWidth = 9
      FieldName = 'SHIPDATE'
      Origin = 'V.SHIPDATE'
    end
    object QryShipAR_ORD_INVOICED_QTY: TFMTBCDField
      DisplayLabel = 'Qty. Invoiced'
      DisplayWidth = 18
      FieldName = 'AR_ORD_INVOICED_QTY'
      Origin = 'b.invoiced_qty'
      Size = 38
    end
    object QryShipPHANTOM_ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 30
      FieldName = 'PHANTOM_ITEMNO'
      Visible = False
      Size = 55
    end
    object QryShipDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 100
      FieldName = 'DESCRIP2'
      Visible = False
      Size = 100
    end
    object QryShipSHIPMENTS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENTS_ID'
      Visible = False
      Size = 0
    end
    object QryShipCUSTNO: TStringField
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Visible = False
      Size = 10
    end
    object QryShipTOTAL_QTY_ORD: TBCDField
      DisplayWidth = 10
      FieldName = 'TOTAL_QTY_ORD'
      Visible = False
    end
    object QryShipUNIT_PRICE: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Visible = False
      Size = 6
    end
    object QryShipTAX_CODE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TAX_CODE_ID'
      Visible = False
      Size = 0
    end
    object QryShipARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryShipMISC_ITEM: TStringField
      DisplayWidth = 50
      FieldName = 'MISC_ITEM'
      Visible = False
      Size = 250
    end
    object QryShipTax: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Tax'
      Visible = False
      Calculated = True
    end
    object QryShipORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryShipSHIPMENT_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENT_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryShipBACKORDER_QTY: TBCDField
      DisplayWidth = 10
      FieldName = 'BACKORDER_QTY'
      Visible = False
    end
    object QryShipCOMM_PCT: TBCDField
      DisplayWidth = 10
      FieldName = 'COMM_PCT'
      Visible = False
      Size = 3
    end
    object QryShipCLASS: TStringField
      DisplayWidth = 2
      FieldName = 'CLASS'
      Visible = False
      Size = 2
    end
    object QryShipREV: TStringField
      DisplayWidth = 15
      FieldName = 'REV'
      Visible = False
      Size = 15
    end
    object QryShipSALESPEOPLE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SALESPEOPLE_ID'
      Visible = False
      Size = 0
    end
    object QryShipACCT_ID_SALES: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'ACCT_ID_SALES'
      Visible = False
      Size = 38
    end
    object QryShipCUMM_SHIPPED: TBCDField
      DisplayWidth = 10
      FieldName = 'CUMM_SHIPPED'
      Visible = False
    end
    object QryShipINVOICE_QTY: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'INVOICE_QTY'
      Visible = False
      Size = 38
    end
    object QryShipINVOICED_QTY: TBCDField
      DisplayWidth = 10
      FieldName = 'INVOICED_QTY'
      Visible = False
    end
    object QryShipSHIPPEDSOFAR: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'SHIPPEDSOFAR'
      Visible = False
      Size = 38
    end
    object QryShipDESCRIP: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Visible = False
      Size = 100
    end
    object QryShipPENDING_QTY: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'PENDING_QTY'
      Visible = False
      Size = 38
    end
    object QryShipTOTAL_QTY_INVOICED: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'TOTAL_QTY_INVOICED'
      Visible = False
      Size = 38
    end
    object QryShipLEFT_TO_INVOICE: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'LEFT_TO_INVOICE'
      Visible = False
      Size = 38
    end
    object QryShipPRICE_PER_1000YN: TStringField
      DisplayWidth = 1
      FieldName = 'PRICE_PER_1000YN'
      Visible = False
      Size = 1
    end
    object QryShipDESCRIPTION: TStringField
      DisplayWidth = 85
      FieldName = 'DESCRIPTION'
      Origin = 'LTrim(RTrim(NVL(v.misc_item, '#39' '#39') || NVL(v.descrip, '#39' '#39')))'
      Visible = False
      Size = 255
    end
    object QryShipVMI: TStringField
      FieldName = 'VMI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryShipORDERNO: TStringField
      FieldName = 'ORDERNO'
      Origin = 'v.orderno'
      Visible = False
      Size = 15
    end
    object QryShipPHANTOM: TStringField
      DisplayWidth = 1
      FieldName = 'PHANTOM'
      Visible = False
      Size = 1
    end
    object QryShipPHANTOM_CHILD: TStringField
      DisplayWidth = 1
      FieldName = 'PHANTOM_CHILD'
      Visible = False
      Size = 1
    end
    object QryShipPHANTOM_ON_SO: TStringField
      DisplayWidth = 1
      FieldName = 'PHANTOM_ON_SO'
      Visible = False
      Size = 1
    end
    object QryShipPRICE_PER_1000: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'PRICE_PER_1000'
      Visible = False
      Size = 6
    end
    object QryShipVMI_FGMULTI_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VMI_FGMULTI_ID'
      Visible = False
      Size = 0
    end
    object QryShipEPLANT_ID: TFMTBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 38
      Size = 38
    end
  end
  object SrcQryOrd: TDataSource
    DataSet = QryOrd
    Left = 142
    Top = 378
  end
  object PkCustomer: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as arcusto_id, custno, company, addr1, addr2, '
      'city, state, zip, cust_group, pk_hide from v_arcusto'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 625
    Top = 277
    object PkCustomerARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkCustomerCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkCustomerCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkCustomerADDR1: TStringField
      DisplayLabel = 'Addr1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkCustomerADDR2: TStringField
      DisplayLabel = 'Addr2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PkCustomerCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkCustomerSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PkCustomerZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkCustomerCUST_GROUP: TStringField
      DisplayLabel = 'Group ID'
      FieldName = 'CUST_GROUP'
      Origin = 'V_ARCUSTO.CUST_GROUP'
      Size = 30
    end
    object PkCustomerPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARCUSTO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkArPrePost: TIQWebHpick
    BeforeOpen = PkArPrePostBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select     p.id as id,'
      '           p.invoice_no as invoice_no,'
      '           p.invoice_date as invoice_date,'
      '           p.due_date as due_date,'
      '           p.eplant_id as eplant_id,'
      '           p.PRIOR_ENTRY as PRIOR_ENTRY,'
      '           a.custno as custno,'
      '           a.company as company,'
      '           b.attn as attn,'
      '           g.start_date as start_date,'
      '           g.end_date as end_date,'
      '           l.acct as acct,'
      '           p.cuser1 as cuser1,'
      '           p.cuser2 as cuser2,'
      '           p.cuser3 as cuser3,'
      '           p.inv_prefix as inv_prefix,'
      '           v.pono as pono,'
      '           d.ord_detail_id as ord_detail_id,'
      '           p.userid as userid'
      ' from arprepost p,'
      '      arcusto a,'
      '      bill_to b,'
      '      glperiods g,'
      '      glacct l,'
      '      arprepost_detail d,'
      '      v_ord_hist_pono v     '
      'where p.arcusto_id = a.id'
      '  and p.bill_to_id = b.id       '
      '  and p.glperiods_id_ar = g.id    '
      '  and p.glacct_id_ar = l.id'
      '  and d.arprepost_id(+) = p.id'
      '  and d.ord_detail_id = v.id(+)'
      '  and misc.eplant_filter(p.eplant_id) = 1'
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = SrcArPrePost
    ForceShowWaitForPrompt = False
    Left = 597
    Top = 277
    object PkArPrePostID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArPrePostINVOICE_NO: TStringField
      DisplayLabel = 'Invoice#'
      FieldName = 'INVOICE_NO'
      Size = 25
    end
    object PkArPrePostINVOICE_DATE: TDateTimeField
      DisplayLabel = 'Invoice Date'
      FieldName = 'INVOICE_DATE'
    end
    object PkArPrePostDUE_DATE: TDateTimeField
      DisplayLabel = 'Due Date'
      FieldName = 'DUE_DATE'
    end
    object PkArPrePostCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArPrePostCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArPrePostATTN: TStringField
      DisplayLabel = 'Bill To'
      FieldName = 'ATTN'
      Size = 60
    end
    object PkArPrePostSTART_DATE: TDateTimeField
      DisplayLabel = 'Period Start date'
      FieldName = 'START_DATE'
    end
    object PkArPrePostEND_DATE: TDateTimeField
      DisplayLabel = 'Period End date'
      FieldName = 'END_DATE'
    end
    object PkArPrePostACCT: TStringField
      DisplayLabel = 'G/L Acct'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkArPrePostEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'ARPREPOST.EPLANT_ID'
      Size = 0
    end
    object PkArPrePostPRIOR_ENTRY: TStringField
      FieldName = 'PRIOR_ENTRY'
      Origin = 'ARPREPOST.PRIOR_ENTRY'
      Visible = False
      Size = 1
    end
    object PkArPrePostCUSER1: TStringField
      DisplayLabel = 'Note 1'
      FieldName = 'CUSER1'
      Origin = 'IQ.ARPREPOST.CUSER1'
      Size = 60
    end
    object PkArPrePostCUSER2: TStringField
      DisplayLabel = 'Note 2'
      FieldName = 'CUSER2'
      Origin = 'IQ.ARPREPOST.CUSER2'
      Size = 60
    end
    object PkArPrePostCUSER3: TStringField
      DisplayLabel = 'Note 3'
      FieldName = 'CUSER3'
      Origin = 'IQ.ARPREPOST.CUSER3'
      Size = 60
    end
    object PkArPrePostINV_PREFIX: TStringField
      DisplayLabel = 'Inv. Code'
      FieldName = 'INV_PREFIX'
      Origin = 'IQ.ARPREPOST.INV_PREFIX'
      Size = 10
    end
    object PkArPrePostPONO: TStringField
      DisplayLabel = 'PO#'
      FieldName = 'PONO'
      Size = 35
    end
    object PkArPrePostORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object PkArPrePostUSERID: TStringField
      DisplayLabel = 'User ID'
      FieldName = 'USERID'
      Origin = 'USERID'
      Size = 35
    end
  end
  object ViewArPrepostDetailTotals: TFDQuery
    MasterSource = SrcArPrePost
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'V_ARPREPOST_DETAIL_TOTAL3'
    SQL.Strings = (
      'SELECT arprepost_id,'
      '       total_before_tax,'
      '       total_after_tax,'
      '       net_tax,'
      '       freight,'
      '       total'
      '  FROM v_arprepost_detail_total3'
      ' WHERE arprepost_id = :ID')
    Left = 334
    Top = 378
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object ViewArPrepostDetailTotalsARPREPOST_ID: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ARPREPOST_ID'
      ProviderFlags = []
      Required = True
      Precision = 15
      Size = 0
    end
    object ViewArPrepostDetailTotalsTOTAL_BEFORE_TAX: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_BEFORE_TAX'
      ProviderFlags = []
      currency = True
      Precision = 38
      Size = 38
    end
    object ViewArPrepostDetailTotalsTOTAL_AFTER_TAX: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_AFTER_TAX'
      ProviderFlags = []
      currency = True
      Precision = 38
      Size = 38
    end
    object ViewArPrepostDetailTotalsNET_TAX: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NET_TAX'
      ProviderFlags = []
      currency = True
      Precision = 38
      Size = 38
    end
    object ViewArPrepostDetailTotalsFREIGHT: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FREIGHT'
      ProviderFlags = []
      currency = True
      Precision = 38
      Size = 38
    end
    object ViewArPrepostDetailTotalsTOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      ProviderFlags = []
      currency = True
      Precision = 38
      Size = 38
    end
  end
  object SrcViewArPrePostDetailTotals: TDataSource
    DataSet = ViewArPrepostDetailTotals
    OnDataChange = SrcViewArPrePostDetailTotalsDataChange
    Left = 318
    Top = 378
  end
  object PkAcct: TIQWebHpick
    BeforeOpen = PkAcctBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '          type,'
      '          eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39' '
      '   and NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39' '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 653
    Top = 277
    object PkAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAcctACCT: TStringField
      DisplayLabel = 'Acct#'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkAcctTYPE: TStringField
      DisplayLabel = 'Acct. Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object PkAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.EPLANT_ID'
      Size = 0
    end
  end
  object PkAllInvoices: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'Select distinct a.glperiods_id_ar,'
      '                p.period,'
      '                p.start_date,'
      '                p.end_date'
      ' from arprepost a,'
      '      glperiods p'
      'where a.glperiods_id_ar = p.id                     ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 681
    Top = 277
    object PkAllInvoicesGLPERIODS_ID_AR: TBCDField
      FieldName = 'GLPERIODS_ID_AR'
      Visible = False
      Size = 0
    end
    object PkAllInvoicesPERIOD: TBCDField
      DisplayLabel = 'Period'
      FieldName = 'PERIOD'
      Size = 0
    end
    object PkAllInvoicesSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      FieldName = 'START_DATE'
    end
    object PkAllInvoicesEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      FieldName = 'END_DATE'
    end
  end
  object SrcArPrePostDetail: TDataSource
    DataSet = QryARPrepostDetail
    OnDataChange = SrcArPrePostDetailDataChange
    Left = 16
    Top = 298
  end
  object wwTblSalesPeople: TFDTable
    IndexName = 'PK_SALESPEOPLE'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SALESPEOPLE'
    TableName = 'SALESPEOPLE'
    Left = 422
    Top = 171
  end
  object QryInsArinvoice: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into arinvoice (id,'
      '                       glacct_id_ar,'
      '                       arcusto_id,'
      '                       bill_to_id,'
      '                       invoice_no,'
      '                       invoice_date,'
      '                       terms_id,'
      '                       due_date,'
      '                       notes,'
      '                       glperiods_id_ar,'
      '                       prior_entry,'
      '                       glbatchid_id,'
      '                       arcusto_custno,'
      '                       arcusto_company,'
      '                       arcusto_addr1,'
      '                       arcusto_addr2,'
      '                       arcusto_addr3,'
      '                       arcusto_city,'
      '                       arcusto_state,'
      '                       arcusto_country,'
      '                       arcusto_zip,'
      '                       bill_to_attn,'
      '                       bill_to_addr1,'
      '                       bill_to_addr2,'
      '                       bill_to_addr3,'
      '                       bill_to_city,'
      '                       bill_to_state,'
      '                       bill_to_country,'
      '                       bill_to_zip,'
      '                       terms_descrip,'
      '                       terms_days,'
      '                       terms_discount,'
      '                       terms_discount_days,'
      '                       ecode,'
      '                       eid,'
      '                       edate_time,'
      '                       ecopy,'
      '                       inv_prefix,'
      '                       GLACCT_ID_FX,'
      '                       CURRENCY_ID,'
      '                       CURRENCY_DESCRIP,'
      '                       FX_RATE,'
      '                       arinvoice_id,'
      '                       eplant_id,'
      '                       ctrl_eplant_id,'
      '                       print_count,'
      '                       print_last_user,'
      '                       print_last_date,'
      '                       EXCLUDE_FROM_FIN_CHARGE,'
      '                       arcusto_credit_card_id,'
      '                       arcusto_credit_card_acctno,'
      '                       arcusto_credit_card_name_on,'
      '                       arcusto_credit_card_exp_mmyy)'
      '                select :nId,'
      '                       p.glacct_id_ar,'
      '                       p.arcusto_id,'
      '                       p.bill_to_id,'
      '                       p.invoice_no,'
      '                       p.invoice_date,'
      '                       p.terms_id,'
      '                       p.due_date,'
      '                       p.notes,'
      '                       p.glperiods_id_ar,'
      '                       p.prior_entry,'
      '                       :nGlbatchid_id,'
      '                       a.custno,'
      '                       a.company,'
      '                       a.addr1,'
      '                       a.addr2,'
      '                       a.addr3,'
      '                       a.city,'
      '                       a.state,'
      '                       a.country,'
      '                       a.zip,'
      '                       b.attn,'
      '                       b.addr1,'
      '                       b.addr2,'
      '                       b.addr3,'
      '                       b.city,'
      '                       b.state,'
      '                       b.country,'
      '                       b.zip,'
      '                       t.description,'
      '                       t.days,'
      '                       t.discount,'
      '                       t.discount_days,'
      '                       p.ecode,'
      '                       p.eid,'
      '                       p.edate_time,'
      '                       p.ecopy,'
      '                       p.inv_prefix,'
      '                       p.GLACCT_ID_FX,'
      '                       p.CURRENCY_ID,'
      '                       c.descrip,'
      '                       :nFxRate,'
      '                       p.arinvoice_id,'
      '                       p.eplant_id,'
      '                       p.ctrl_eplant_id,'
      '                       p.print_count,'
      '                       p.print_last_user,'
      '                       p.print_last_date,'
      '                       p.EXCLUDE_FROM_FIN_CHARGE,'
      '                       p.arcusto_credit_card_id,'
      '                       r.acctno,'
      '                       r.name_on,'
      '                       r.exp_mmyy'
      '                  from arprepost p,'
      '                       arcusto a,'
      '                       bill_to b,'
      '                       currency c,'
      '                       terms t,'
      '                       arcusto_credit_card r'
      '                 where p.arcusto_id = a.id(+)'
      '                   and p.bill_to_id = b.id(+)'
      '                   and p.terms_id = t.id(+)'
      '                   and p.id = :nArPrePost_id'
      '                   and p.currency_id = c.id(+)'
      '                   and p.arcusto_credit_card_id = r.id(+)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    Left = 248
    Top = 219
    ParamData = <
      item
        Name = 'nId'
        DataType = ftFloat
      end
      item
        Name = 'nGlbatchid_id'
        DataType = ftFloat
      end
      item
        Name = 'nFxRate'
        DataType = ftFloat
      end
      item
        Name = 'nArPrePost_id'
        DataType = ftFloat
      end>
  end
  object QryInsArinvoice_detail: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into arinvoice_detail (id,'
      '                              arinvoice_id,'
      '                              shipment_dtl_id,'
      '                              ord_detail_id,'
      '                              invoice_qty,'
      '                              unit_price,'
      '                              glacct_id_sales,'
      '                              freight_id,'
      '                              tax_code_id,'
      '                              salespeople_id,'
      '                              freight_price,'
      '                              arinvt_id,'
      '                              misc_comment,'
      '                              comm_pcnt,'
      '                              salespeople_sales_code,'
      '                              arinvt_class,'
      '                              arinvt_itemno,'
      '                              arinvt_rev,'
      '                              arinvt_descrip,'
      '                              arinvt_descrip2,'
      '                              freight_descrip,'
      '                              reference,'
      '                              ref_code_descrip,'
      '                              ref_code_category,'
      '                              ref_code,'
      '                              ref_code_id,'
      '                              price_per_1000,'
      '                              price_per_1000_YN,'
      '                              misc_po,'
      '                              cost_object_id,'
      '                              cost_object_source,'
      '                              eplant_id,'
      '                              po_detail_id,'
      '                              rma_detail_id,'
      '                              cm_arinvoice_id,'
      '                              vmi_reference,'
      '                              NO_POST_STD_COST,'
      '                              PO_RECEIPTS_ID)'
      '                       select :nArInvoiceDtl_Id,'
      '                              :nArinvoice_Id,'
      '                              d.shipment_dtl_id,'
      '                              d.ord_detail_id,'
      '                              d.invoice_qty,'
      '                              d.unit_price,'
      '                              d.glacct_id_sales,'
      '                              d.freight_id,'
      '                              d.tax_code_id,'
      '                              d.salespeople_id,'
      '                              d.freight_price,'
      '                              d.arinvt_id,'
      '                              d.misc_comment,'
      '                              d.comm_pcnt,'
      '                              s.sales_code,'
      '                              a.class,'
      '                              a.itemno,'
      '                              a.rev,'
      '                              a.descrip,'
      '                              a.descrip2,'
      '                              f.descrip,'
      '                              d.reference,'
      '                              r.descrip,'
      '                              c.descrip,'
      '                              r.ref_code,'
      '                              d.ref_code_id,'
      '                              d.price_per_1000,'
      '                              d.price_per_1000_YN,'
      '                              d.misc_po,'
      '                              d.cost_object_id,'
      '                              d.cost_object_source,'
      '                              d.eplant_id,'
      '                              d.po_detail_id,'
      '                              d.rma_detail_id,'
      '                              d.cm_arinvoice_id,'
      '                              d.vmi_reference,'
      '                              d.NO_POST_STD_COST,'
      '                              d.PO_RECEIPTS_ID'
      '                         from arprepost_detail d,'
      '                              salespeople s,'
      '                              arinvt a,'
      '                              freight f,'
      '                              ref_code r,'
      '                              rc_category c'
      '                        where d.id = :nArPrePostDtl_Id'
      '                          and d.salespeople_id = s.id(+)'
      '                          and d.arinvt_id = a.id(+)'
      '                          and d.freight_id = f.id(+)'
      '                          and d.ref_code_id = r.id(+)'
      '                          and r.rc_category_id = c.id(+)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 208
    Top = 211
    ParamData = <
      item
        Name = 'nArInvoiceDtl_Id'
        DataType = ftFloat
      end
      item
        Name = 'nArinvoice_Id'
        DataType = ftFloat
      end
      item
        Name = 'nArPrePostDtl_Id'
        DataType = ftFloat
      end>
  end
  object QryOrder: TFDQuery
    Tag = 1
    OnCalcFields = QryOrderCalcFields
    MasterSource = SrcArPrePostDetail
    MasterFields = 'ORD_DETAIL_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from v_ord_comb_all'
      '  where ord_detail_id = :ORD_DETAIL_ID'
      ' ')
    Left = 384
    Top = 251
    ParamData = <
      item
        Name = 'ORD_DETAIL_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryOrderPONO: TStringField
      FieldName = 'PONO'
      Origin = 'V_ORD_COMB_ALL.PONO'
      Size = 35
    end
    object QryOrderORDERNO: TStringField
      FieldName = 'ORDERNO'
      Origin = 'V_ORD_COMB_ALL.ORDERNO'
      Size = 15
    end
    object QryOrderAPono: TStringField
      FieldKind = fkCalculated
      FieldName = 'APono'
      Calculated = True
    end
  end
  object SrcQryShip: TDataSource
    DataSet = QryShip
    Left = 198
    Top = 378
  end
  object QryCurrency: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from currency')
    Left = 313
    Top = 163
  end
  object tblInvCode: TFDTable
    BeforePost = tblInvCodeBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'INVOICE_CODE'
    TableName = 'INVOICE_CODE'
    Left = 352
    Top = 163
    object tblInvCodeINV_PREFIX: TStringField
      FieldName = 'INV_PREFIX'
      Size = 10
    end
    object tblInvCodeDESCRIP: TStringField
      FieldName = 'DESCRIP'
    end
    object tblInvCodeID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
  end
  object TblComm: TFDTable
    BeforeEdit = TblCommBeforeEdit
    AfterPost = TblCommAfterPost
    AfterDelete = TblCommAfterPost
    IndexFieldNames = 'ARPREPOST_DETAIL_ID'
    MasterSource = SrcArPrePostDetail
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ARPREPOST_COMM'
    TableName = 'ARPREPOST_COMM'
    Left = 192
    Top = 168
    object TblCommID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblCommSALESPEOPLE_ID: TBCDField
      FieldName = 'SALESPEOPLE_ID'
      Size = 0
    end
    object TblCommCOMMISSION_PERCENT: TFMTBCDField
      FieldName = 'COMMISSION_PERCENT'
      Size = 6
    end
    object TblCommFirstName: TStringField
      FieldKind = fkLookup
      FieldName = 'FIRST_NAME'
      LookupDataSet = TblSales
      LookupKeyFields = 'ID'
      LookupResultField = 'FIRST_NAME'
      KeyFields = 'SALESPEOPLE_ID'
      Lookup = True
    end
    object TblCommLastName: TStringField
      FieldKind = fkLookup
      FieldName = 'LAST_NAME'
      LookupDataSet = TblSales
      LookupKeyFields = 'ID'
      LookupResultField = 'LAST_NAME'
      KeyFields = 'SALESPEOPLE_ID'
      Lookup = True
    end
    object TblCommSalesCode: TStringField
      FieldKind = fkLookup
      FieldName = 'SALES_CODE'
      LookupDataSet = TblSales
      LookupKeyFields = 'ID'
      LookupResultField = 'SALES_CODE'
      KeyFields = 'SALESPEOPLE_ID'
      Lookup = True
    end
    object TblCommARPREPOST_DETAIL_ID: TBCDField
      FieldName = 'ARPREPOST_DETAIL_ID'
      Size = 0
    end
    object TblCommAMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Size = 2
    end
    object TblCommMIDDLE_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'MIDDLE_NAME'
      LookupDataSet = TblSales
      LookupKeyFields = 'ID'
      LookupResultField = 'MIDDLE_NAME'
      KeyFields = 'SALESPEOPLE_ID'
      Lookup = True
    end
  end
  object SrcComm: TDataSource
    DataSet = TblComm
    Left = 120
    Top = 232
  end
  object TblSales: TFDTable
    IndexName = 'PK_SALESPEOPLE'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SALESPEOPLE'
    TableName = 'SALESPEOPLE'
    Left = 176
    Top = 217
    object TblSalesFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 15
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object TblSalesLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 15
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object TblSalesID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblSalesEMPLOYEE_ID: TBCDField
      FieldName = 'EMPLOYEE_ID'
      Visible = False
      Size = 0
    end
    object TblSalesSALES_CODE: TStringField
      FieldName = 'SALES_CODE'
      Visible = False
      Size = 25
    end
    object TblSalesVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object TblSalesMIDDLE_NAME: TStringField
      FieldName = 'MIDDLE_NAME'
      Size = 30
    end
  end
  object SrcComments: TDataSource
    DataSet = QryComments
    OnDataChange = SrcCommentsDataChange
    Left = 368
    Top = 379
  end
  object QryComments: TFDQuery
    MasterSource = SrcArPrePostDetail
    MasterFields = 'SHIPMENT_DTL_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select shipment_dtl_id,'
      '       comment1 as order_dtl_comment,'
      '       cmtline as shipment_dtl_comment'
      '  from v_shipments'
      ' where shipment_dtl_id = :shipment_dtl_id')
    Left = 384
    Top = 379
    ParamData = <
      item
        Name = 'SHIPMENT_DTL_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryCommentsSHIPMENT_DTL_ID: TBCDField
      FieldName = 'SHIPMENT_DTL_ID'
      Origin = 'V_SHIPMENTS.SHIPMENT_DTL_ID'
      Size = 0
    end
    object QryCommentsORDER_DTL_COMMENT: TStringField
      FieldName = 'ORDER_DTL_COMMENT'
      Origin = 'V_SHIPMENTS.COMMENT1'
      Size = 2000
    end
    object QryCommentsSHIPMENT_DTL_COMMENT: TStringField
      FieldName = 'SHIPMENT_DTL_COMMENT'
      Origin = 'V_SHIPMENTS.CMTLINE'
      Size = 2000
    end
  end
  object wwMemo: TwwMemoDialog
    DataSource = SrcArPrePostDetail
    DataField = 'MISC_COMMENT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Caption = 'Misc. Description'
    DlgLeft = 0
    DlgTop = 0
    DlgWidth = 561
    DlgHeight = 396
    Left = 350
    Top = 321
  end
  object wwQryGLAcct: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, eplant_id, acct, descrip from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39' '
      'and acct > '#39' '#39
      'and (NVL(eplant_id, 0) = :AID or :ADummy = 1)'
      'order by acct'
      '')
    Left = 280
    Top = 219
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ADummy'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object wwQryGLAcctACCT: TStringField
      DisplayLabel = 'Account'
      DisplayWidth = 30
      FieldName = 'ACCT'
      Size = 50
    end
    object wwQryGLAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 50
    end
    object wwQryGLAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object wwQryGLAcctID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryTax: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from V_TAX_CODES order by tax_code')
    Left = 316
    Top = 219
    object wwQryTaxTAX_CODE: TStringField
      DisplayLabel = 'Tax Code'
      DisplayWidth = 20
      FieldName = 'TAX_CODE'
      Origin = 'V_TAX_CODES.TAX_CODE'
    end
    object wwQryTaxTAX_CODE_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'TAX_CODE_DESC'
      Origin = 'V_TAX_CODES.TAX_CODE_DESC'
      Size = 50
    end
    object wwQryTaxTAX_RATE: TFMTBCDField
      DisplayLabel = 'Tax rate'
      DisplayWidth = 10
      FieldName = 'TAX_RATE'
      Origin = 'V_TAX_CODES.TAX_RATE'
      Size = 38
    end
    object wwQryTaxID: TBCDField
      FieldName = 'ID'
      Origin = 'V_TAX_CODES.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryFreight: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from FREIGHT')
    Left = 352
    Top = 219
    object wwQryFreightDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'FREIGHT.DESCRIP'
      Size = 60
    end
    object wwQryFreightID: TBCDField
      FieldName = 'ID'
      Origin = 'FREIGHT.ID'
      Visible = False
      Size = 0
    end
    object wwQryFreightGLACCT_ID_FREIGHT: TBCDField
      FieldName = 'GLACCT_ID_FREIGHT'
      Origin = 'FREIGHT.GLACCT_ID_FREIGHT'
      Visible = False
      Size = 0
    end
    object wwQryFreightSCAC_IATA_CODE: TStringField
      FieldName = 'SCAC_IATA_CODE'
      Origin = 'FREIGHT.SCAC_IATA_CODE'
      Visible = False
      Size = 17
    end
    object wwQryFreightCODE_QUALIFIER: TStringField
      FieldName = 'CODE_QUALIFIER'
      Origin = 'FREIGHT.CODE_QUALIFIER'
      Visible = False
      Size = 6
    end
    object wwQryFreightTRANSPORT_CODE: TStringField
      FieldName = 'TRANSPORT_CODE'
      Origin = 'FREIGHT.TRANSPORT_CODE'
      Visible = False
      Size = 6
    end
    object wwQryFreightECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'FREIGHT.ECODE'
      Visible = False
      Size = 10
    end
    object wwQryFreightEID: TBCDField
      FieldName = 'EID'
      Origin = 'FREIGHT.EID'
      Visible = False
      Size = 0
    end
    object wwQryFreightEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'FREIGHT.EDATE_TIME'
      Visible = False
    end
    object wwQryFreightECOPY: TStringField
      FieldName = 'ECOPY'
      Origin = 'FREIGHT.ECOPY'
      Visible = False
      Size = 1
    end
  end
  object wwQryCurrency: TFDQuery
    BeforeOpen = wwQryCurrencyBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from CURRENCY')
    Left = 380
    Top = 219
    object wwQryCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Origin = 'CURRENCY.CURR_CODE'
      Size = 10
    end
    object wwQryCurrencyDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'CURRENCY.DESCRIP'
      Size = 50
    end
    object wwQryCurrencySPOT_RATE: TFMTBCDField
      DisplayLabel = 'Spot Rate'
      DisplayWidth = 10
      FieldName = 'SPOT_RATE'
      Origin = 'CURRENCY.SPOT_RATE'
      Size = 6
    end
    object wwQryCurrencyCURR_SYMBOL: TStringField
      DisplayLabel = 'Symbol'
      DisplayWidth = 3
      FieldName = 'CURR_SYMBOL'
      Origin = 'CURRENCY.CURR_SYMBOL'
      Size = 10
    end
    object wwQryCurrencyID: TBCDField
      FieldName = 'ID'
      Origin = 'CURRENCY.ID'
      Visible = False
      Size = 0
    end
    object wwQryCurrencyGLVALUE: TStringField
      FieldName = 'GLVALUE'
      Origin = 'CURRENCY.GLVALUE'
      Visible = False
      Size = 50
    end
    object wwQryCurrencyECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'CURRENCY.ECODE'
      Visible = False
      Size = 10
    end
    object wwQryCurrencyEID: TBCDField
      FieldName = 'EID'
      Origin = 'CURRENCY.EID'
      Visible = False
      Size = 0
    end
    object wwQryCurrencyEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'CURRENCY.EDATE_TIME'
      Visible = False
    end
    object wwQryCurrencyECOPY: TStringField
      FieldName = 'ECOPY'
      Origin = 'CURRENCY.ECOPY'
      Visible = False
      Size = 1
    end
    object wwQryCurrencyNATIVE_CURR: TStringField
      FieldName = 'NATIVE_CURR'
      Origin = 'IQ.CURRENCY.NATIVE_CURR'
      Size = 3
    end
  end
  object SrcQryOrder: TDataSource
    DataSet = QryOrder
    Left = 368
    Top = 251
  end
  object PKCustomer2: TIQWebHpick
    BeforeOpen = PKCustomer2BeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select arcusto_id,'
      '       custno,          '
      '       company,         '
      '       addr1,           '
      '       addr2,           '
      '       city,            '
      '       state,'
      '       zip,'
      '       eplant_id,'
      '       cust_group'
      '  from c_ship_hist'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 541
    Top = 277
    object FloatField1: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object StringField1: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object StringField2: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object StringField3: TStringField
      DisplayLabel = 'Addr1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object StringField4: TStringField
      DisplayLabel = 'Addr2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object StringField5: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object StringField6: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object StringField7: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Size = 10
    end
    object PKCustomer2EPLANT_ID: TBCDField
      DisplayLabel = 'EPlantID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_SHIP_HIST.EPLANT_ID'
      Size = 0
    end
    object PKCustomer2CUST_GROUP: TStringField
      DisplayLabel = 'Group ID'
      FieldName = 'CUST_GROUP'
      Origin = 'C_SHIP_HIST.CUST_GROUP'
      Size = 30
    end
  end
  object QryShipment: TFDQuery
    Tag = 1
    MasterSource = SrcArPrePostDetail
    MasterFields = 'SHIPMENT_DTL_ID2;SHIPMENT_DTL_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select packslipno from'
      '  shipments s,'
      '  shipment_dtl d'
      ' where d.shipments_id = s.id'
      
        '   and (d.id = NVL(:SHIPMENT_DTL_ID2, 0)  or d.id = :SHIPMENT_DT' +
        'L_ID)'
      '')
    Left = 440
    Top = 251
    ParamData = <
      item
        Name = 'SHIPMENT_DTL_ID2'
        DataType = ftFloat
        Size = 8
      end
      item
        Name = 'SHIPMENT_DTL_ID'
        DataType = ftFloat
        Size = 8
      end>
  end
  object SrcShipment: TDataSource
    DataSet = QryShipment
    Left = 424
    Top = 251
  end
  object QryARPrepostDetail: TFDQuery
    BeforeInsert = QryARPrepostDetailBeforeInsert
    BeforeEdit = QryARPrepostDetailBeforeEdit
    BeforePost = QryARPrepostDetailBeforePost
    AfterPost = QryARPrepostDetailAfterPost
    AfterCancel = QryARPrepostDetailAfterCancel
    BeforeDelete = QryARPrepostDetailBeforeDelete
    AfterDelete = QryARPrepostDetailAfterDelete
    AfterScroll = QryARPrepostDetailAfterScroll
    OnCalcFields = QryARPrepostDetailCalcFields
    OnNewRecord = QryARPrepostDetailNewRecord
    MasterSource = SrcArPrePost
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'ARPREPOST_DETAIL'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL2
    SQL.Strings = (
      'select d.id,'
      '       d.arprepost_id,'
      '       d.ord_detail_id,'
      '       d.invoice_qty,'
      '       d.unit_price,'
      '       d.glacct_id_sales,'
      '       d.tax_code_id,'
      '       d.salespeople_id,'
      '       d.comm_pcnt,'
      '       d.freight_id,'
      '       d.shipment_dtl_id,'
      '       d.shipment_dtl_id2,'
      '       d.freight_price,'
      '       d.arinvt_id,'
      '       d.misc_comment,'
      '       d.ref_code_id,'
      '       d.reference,'
      '       d.price_per_1000,'
      '       d.price_per_1000_yn,'
      '       d.from_order,'
      '       d.cost_object_id,'
      '       d.cost_object_source,'
      
        '       iqms.cost_source.get_cost_object_display(d.cost_object_so' +
        'urce,d.cost_object_id) as cost_source,'
      '       d.misc_po,'
      '       d.eplant_id,'
      '       d.rma_detail_id,'
      '       d.VMI_REFERENCE,'
      '       d.no_post_std_cost,'
      '       d.GLACCT_ID_FREIGHT,'
      '       tc.tax_code,'
      '       d.tax_rate,'
      '       gl_fr.acct as Gl_FR_Acct,'
      '       gl_fr_rev.acct as Gl_FR_Acct_rev,'
      '       gl.acct as GlAcct,   '
      '       gl.descrip as GlAcct_Descrip,'
      '       fr.descrip as Freight_Comp,'
      '       vr.REF_CODE_DESCRIP as RefCode,'
      '       vr.REF_CODE as RefCode_Code,'
      
        '       substrB(iqeval.substrW63Max(va.description, 1, 255), 1, 2' +
        '55) as description,'
      '       va.itemno,'
      '       va.rev,'
      '       va.class,'
      '       va.terms_Id as termsId,'
      '       va.arinvt_id as OrdArinvtId,'
      '       ar.descrip2 as ArinvtDescrip2,'
      '       ar.descrip as ArinvtDescrip,'
      '       ar.itemno as ArinvtItemno,'
      '       ar.class as ArinvtClass,'
      '       ar.rev as ArinvtRev,'
      
        '       substrB(iqeval.substrW63Max(NVL(va.description, ar.descri' +
        'p), 1, 255), 1, 255) as DispDescrip,'
      
        '       decode(NVL(od.PHANTOM_ORD_DETAIL_ID, 0), 0, NVL(va.itemno' +
        ', ar.itemno), '#39'     '#39' || NVL(va.itemno, ar.itemno)) as DispItemn' +
        'o,'
      '       NVL(va.rev, ar.rev) as DispRev,'
      '       NVL(va.class, ar.class) as DispClass,'
      
        '       Round(NVL(d.invoice_qty, 0) * NVL(d.unit_price, 0), 2) as' +
        ' Total_before_tax,'
      
        '       Round(Round(NVL(d.invoice_qty, 0) * NVL(d.unit_price, 0) ' +
        '+ decode(NVL(vt.include_freight, '#39'N'#39'), '#39'Y'#39', NVL(d.freight_price,' +
        ' 0), 0), 2) * NVL(d.tax_rate, 0)/100, 2) +'
      
        '          Round(NVL(d.invoice_qty, 0) * NVL(d.unit_price, 0), 2)' +
        ' as Total_after_tax,'
      '       NVL(d.arinvt_id, va.arinvt_id) as absarinvtid,'
      '       NVL(ar.phantom, '#39'N'#39') as phantom,'
      '       NVL(ar.phantom_components_on_so, '#39'N'#39') as phantom_on_so,'
      '       d.freight_rev_amount,'
      '       d.freight_rev_pcnt,'
      '       d.acct_id_freight_rev,'
      '       d.ORIG_FREIGHT_PRICE,'
      '       NVL(NVL(od.unit, sd.uom), ar.unit) as unit,'
      '       d.ship_to_id,'
      '       d.MISC_ORDERS_ID,'
      '       o.orderno,'
      '       d.discount,'
      '       d.list_unit_price,'
      '       d.phantom_ord_detail_id,'
      '       d.phantom_dtl_modified'
      '       --,d.is_credit_memo'
      '  from arprepost_detail d,'
      '       TAX_CODES tc,'
      '       glacct gl,'
      '       glacct gl_fr,'
      '       glacct gl_fr_rev,'
      '       v_tax_codes vt,'
      '       freight fr,'
      '       v_ref_code vr,'
      '       v_arprepost_detail va,'
      '       arinvt ar,'
      '       ord_detail od,'
      '       shipment_dtl sd,'
      '       orders o,'
      '       (select sum(NVL(tax_rate, 0)) as tax_rate, '
      '               arprepost_detail_id'
      '          from arprepost_tax t'
      '         group by arprepost_detail_id) t '
      ' where d.tax_code_id = tc.id(+)'
      '   and d.glacct_id_sales = gl.id(+)'
      '   and d.tax_code_id = vt.id(+)'
      '   and d.freight_id = fr.id(+)'
      '   and d.REF_CODE_ID = vr.REF_CODE_ID(+)'
      '   and d.id = va.id(+)'
      '   and d.arinvt_id = ar.id(+)'
      '   and d.acct_id_freight_rev = gl_fr_rev.id(+)'
      '   and d.GLACCT_ID_FREIGHT = gl_fr.id(+)'
      '   and d.ord_detail_id = od.id(+)'
      '   and d.shipment_dtl_id = sd.id(+)'
      '   and d.arprepost_id = :ID'
      '   and t.arprepost_detail_id(+) = d.id'
      '   and d.misc_orders_id = o.id(+)'
      'order by decode(d.ord_detail_id, 0, null, d.ord_detail_id), id')
    Left = 708
    Top = 419
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 134270000c
      end>
    object QryARPrepostDetailDISPDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DISPDESCRIP'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 255
    end
    object QryARPrepostDetailDISPITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 20
      FieldName = 'DISPITEMNO'
      ReadOnly = True
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 55
    end
    object QryARPrepostDetailDISPCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 20
      FieldName = 'DISPCLASS'
      ReadOnly = True
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 2
    end
    object QryARPrepostDetailDISPREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 20
      FieldName = 'DISPREV'
      ReadOnly = True
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 15
    end
    object QryARPrepostDetailMISC_COMMENT: TStringField
      DisplayLabel = 'Miscellaneous Description'
      DisplayWidth = 20
      FieldName = 'MISC_COMMENT'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 4000
    end
    object QryARPrepostDetailINVOICE_QTY: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 12
      FieldName = 'INVOICE_QTY'
      OnChange = QryARPrepostDetailINVOICE_QTYChange
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
    end
    object QryARPrepostDetailUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 11
      FieldName = 'UNIT_PRICE'
      DisplayFormat = '###,###,##0.######'
      Size = 6
    end
    object QryARPrepostDetailSalesPerson: TStringField
      DisplayLabel = 'Salesperson(s)'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'SalesPerson'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Calculated = True
    end
    object QryARPrepostDetailGLACCT: TStringField
      DisplayLabel = 'Sales GL Account'
      DisplayWidth = 25
      FieldName = 'GLACCT'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 50
    end
    object QryARPrepostDetailTOTAL_BEFORE_TAX: TFMTBCDField
      DisplayLabel = 'Total Before Tax'
      DisplayWidth = 14
      FieldName = 'TOTAL_BEFORE_TAX'
      ReadOnly = True
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      DisplayFormat = '$#,##0.00'
      currency = True
      Size = 38
    end
    object QryARPrepostDetailTOTAL_AFTER_TAX: TFMTBCDField
      DisplayLabel = 'Total After Tax'
      DisplayWidth = 14
      FieldName = 'TOTAL_AFTER_TAX'
      ReadOnly = True
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      DisplayFormat = '$#,##0.00'
      currency = True
      Size = 38
    end
    object QryARPrepostDetailTAX_RATE: TFMTBCDField
      DisplayLabel = 'Tax Rate %'
      DisplayWidth = 10
      FieldName = 'TAX_RATE'
      ReadOnly = True
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 6
    end
    object QryARPrepostDetailFREIGHT_COMP: TStringField
      DisplayLabel = 'Freight Comp.'
      DisplayWidth = 20
      FieldName = 'FREIGHT_COMP'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 60
    end
    object QryARPrepostDetailFREIGHT_PRICE: TBCDField
      DisplayLabel = 'Freight Charge'
      DisplayWidth = 14
      FieldName = 'FREIGHT_PRICE'
      OnSetText = QryARPrepostDetailFREIGHT_PRICESetText
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      currency = True
      Size = 2
    end
    object QryARPrepostDetailREFERENCE: TStringField
      DisplayLabel = 'Reference'
      DisplayWidth = 20
      FieldName = 'REFERENCE'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
    end
    object QryARPrepostDetailREFCODE: TStringField
      DisplayLabel = 'Reference Code Description'
      DisplayWidth = 20
      FieldName = 'REFCODE'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 60
    end
    object QryARPrepostDetailREFCODE_CODE: TStringField
      DisplayLabel = 'Reference Code'
      DisplayWidth = 20
      FieldName = 'REFCODE_CODE'
      ReadOnly = True
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 10
    end
    object QryARPrepostDetailPRICE_PER_1000: TFMTBCDField
      DisplayLabel = 'Price/1000'
      DisplayWidth = 10
      FieldName = 'PRICE_PER_1000'
      Size = 6
    end
    object QryARPrepostDetailPRICE_PER_1000_YN: TStringField
      DisplayLabel = 'Include Price/1000?'
      DisplayWidth = 1
      FieldName = 'PRICE_PER_1000_YN'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 1
    end
    object QryARPrepostDetailCommPrcnt: TFloatField
      DisplayLabel = 'Commission %'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'CommPrcnt'
      ReadOnly = True
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Calculated = True
    end
    object QryARPrepostDetailTotalComm: TFloatField
      DisplayLabel = 'Total Commissions'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'TotalComm'
      ReadOnly = True
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Calculated = True
    end
    object QryARPrepostDetailCOST_SOURCE: TStringField
      DisplayLabel = 'Cost Source'
      DisplayWidth = 10
      FieldName = 'COST_SOURCE'
      ReadOnly = True
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 60
    end
    object QryARPrepostDetailMISC_PO: TStringField
      DisplayLabel = 'Miscellaneous PO'
      DisplayWidth = 20
      FieldName = 'MISC_PO'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 50
    end
    object QryARPrepostDetailTAX_CODE: TStringField
      DisplayLabel = 'Tax Code'
      DisplayWidth = 20
      FieldName = 'TAX_CODE'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
    end
    object QryARPrepostDetailVMI_REFERENCE: TStringField
      DisplayLabel = 'VMI Reference'
      DisplayWidth = 35
      FieldName = 'VMI_REFERENCE'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 50
    end
    object QryARPrepostDetailNO_POST_STD_COST: TStringField
      DisplayLabel = 'No Post Standard Cost'
      DisplayWidth = 1
      FieldName = 'NO_POST_STD_COST'
      ReadOnly = True
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      FixedChar = True
      Size = 1
    end
    object QryARPrepostDetailGLACCT_DESCRIP: TStringField
      DisplayLabel = 'GL Account Description'
      DisplayWidth = 50
      FieldName = 'GLACCT_DESCRIP'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 50
    end
    object QryARPrepostDetailARINVTDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 20
      FieldName = 'ARINVTDESCRIP2'
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 100
    end
    object QryARPrepostDetailGL_FR_ACCT: TStringField
      DisplayLabel = 'Freight GL Account'
      DisplayWidth = 20
      FieldName = 'GL_FR_ACCT'
      Size = 50
    end
    object QryARPrepostDetailFREIGHT_REV_AMOUNT: TBCDField
      DisplayLabel = 'Freight Revenue'
      DisplayWidth = 10
      FieldName = 'FREIGHT_REV_AMOUNT'
      ReadOnly = True
      Size = 2
    end
    object QryARPrepostDetailFREIGHT_REV_PCNT: TBCDField
      DisplayLabel = 'Freight Revenue %'
      DisplayWidth = 10
      FieldName = 'FREIGHT_REV_PCNT'
      ReadOnly = True
      Size = 2
    end
    object QryARPrepostDetailGL_FR_ACCT_REV: TStringField
      DisplayLabel = 'Freight revenue GL account'
      DisplayWidth = 50
      FieldName = 'GL_FR_ACCT_REV'
      Size = 50
    end
    object QryARPrepostDetailFOB: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'FOB'
      Calculated = True
    end
    object QryARPrepostDetailORIG_FREIGHT_PRICE: TBCDField
      DisplayLabel = 'PS Freight Charge'
      DisplayWidth = 10
      FieldName = 'ORIG_FREIGHT_PRICE'
      ReadOnly = True
      currency = True
      Size = 2
    end
    object QryARPrepostDetailUNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Size = 10
    end
    object QryARPrepostDetailDISCOUNT: TBCDField
      DisplayLabel = 'Discount %'
      DisplayWidth = 10
      FieldName = 'DISCOUNT'
      Size = 2
    end
    object QryARPrepostDetailACCT_ID_FREIGHT_REV: TBCDField
      DisplayLabel = 'Freight Revenue GL account'
      DisplayWidth = 10
      FieldName = 'ACCT_ID_FREIGHT_REV'
      Visible = False
      Size = 0
    end
    object QryARPrepostDetailTAX_CODE_ID: TBCDField
      DisplayLabel = 'Tax Code'
      DisplayWidth = 10
      FieldName = 'TAX_CODE_ID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailITEMNO: TStringField
      FieldName = 'ITEMNO'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 50
    end
    object QryARPrepostDetailREV: TStringField
      FieldName = 'REV'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 15
    end
    object QryARPrepostDetailCLASS: TStringField
      FieldName = 'CLASS'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 2
    end
    object QryARPrepostDetailCOST_OBJECT_ID: TBCDField
      FieldName = 'COST_OBJECT_ID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailCOST_OBJECT_SOURCE: TStringField
      FieldName = 'COST_OBJECT_SOURCE'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 50
    end
    object QryARPrepostDetailARPREPOST_ID: TBCDField
      FieldName = 'ARPREPOST_ID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailSHIPMENT_DTL_ID: TBCDField
      FieldName = 'SHIPMENT_DTL_ID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailGLACCT_ID_SALES: TBCDField
      FieldName = 'GLACCT_ID_SALES'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailSALESPEOPLE_ID: TBCDField
      FieldName = 'SALESPEOPLE_ID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailTERMSID: TFMTBCDField
      FieldName = 'TERMSID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 38
    end
    object QryARPrepostDetailARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailORDARINVTID: TFMTBCDField
      FieldName = 'ORDARINVTID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 38
    end
    object QryARPrepostDetailABSARINVTID: TFMTBCDField
      FieldName = 'ABSARINVTID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 38
    end
    object QryARPrepostDetailREF_CODE_ID: TBCDField
      FieldName = 'REF_CODE_ID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailCOMM_PCNT: TBCDField
      FieldName = 'COMM_PCNT'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 3
    end
    object QryARPrepostDetailFROM_ORDER: TStringField
      FieldName = 'FROM_ORDER'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 1
    end
    object QryARPrepostDetailARINVTDESCRIP: TStringField
      FieldName = 'ARINVTDESCRIP'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 100
    end
    object QryARPrepostDetailARINVTITEMNO: TStringField
      FieldName = 'ARINVTITEMNO'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 50
    end
    object QryARPrepostDetailARINVTCLASS: TStringField
      FieldName = 'ARINVTCLASS'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 2
    end
    object QryARPrepostDetailARINVTREV: TStringField
      FieldName = 'ARINVTREV'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 15
    end
    object QryARPrepostDetailEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailRMA_DETAIL_ID: TBCDField
      FieldName = 'RMA_DETAIL_ID'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 0
    end
    object QryARPrepostDetailDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Visible = False
      OnValidate = QryARPrepostDetailDISPDESCRIPValidate
      Size = 255
    end
    object QryARPrepostDetailGLACCT_ID_FREIGHT: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_FREIGHT'
      Visible = False
      Size = 0
    end
    object QryARPrepostDetailSHIPMENT_DTL_ID2: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENT_DTL_ID2'
      Visible = False
      Size = 0
    end
    object QryARPrepostDetailPHANTOM: TStringField
      DisplayWidth = 1
      FieldName = 'PHANTOM'
      Visible = False
      Size = 1
    end
    object QryARPrepostDetailPHANTOM_ON_SO: TStringField
      DisplayWidth = 1
      FieldName = 'PHANTOM_ON_SO'
      Visible = False
      Size = 1
    end
    object QryARPrepostDetailSHIP_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object QryARPrepostDetailMISC_ORDERS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MISC_ORDERS_ID'
      Visible = False
      Size = 0
    end
    object QryARPrepostDetailORDERNO: TStringField
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Visible = False
      Size = 15
    end
    object QryARPrepostDetailLIST_UNIT_PRICE: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'LIST_UNIT_PRICE'
      Visible = False
      Size = 6
    end
    object QryARPrepostDetailPHANTOM_ORD_DETAIL_ID: TBCDField
      Tag = 1
      FieldName = 'PHANTOM_ORD_DETAIL_ID'
      Origin = 'PHANTOM_ORD_DETAIL_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryARPrepostDetailPHANTOM_DTL_MODIFIED: TStringField
      FieldName = 'PHANTOM_DTL_MODIFIED'
      Origin = 'PHANTOM_DTL_MODIFIED'
      Visible = False
      Size = 1
    end
  end
  object QryArPrePost: TFDQuery
    BeforeOpen = QryArPrePostBeforeOpen
    AfterInsert = QryArPrePostAfterInsert
    BeforePost = QryArPrePostBeforePost
    AfterPost = QryArPrePostAfterPost
    BeforeCancel = QryArPrePostBeforeCancel
    BeforeDelete = QryArPrePostBeforeDelete
    AfterDelete = QryArPrePostAfterDelete
    AfterScroll = QryArPrePostAfterScroll
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ARPREPOST'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'select a.id,'
      '       a.glperiods_id_ar,'
      '       a.arcusto_id,'
      '       a.bill_to_id,'
      '       a.invoice_no,'
      '       a.invoice_date,'
      '       a.terms_id,'
      '       a.due_date,'
      '       a.glacct_id_ar,'
      '       a.notes,'
      '       a.prior_entry,'
      '       a.on_hold,'
      '       a.inv_prefix,'
      '       a.currency_id,'
      '       a.glacct_id_fx,'
      '       a.from_order,'
      '       a.arinvoice_id,'
      '       a.userid,'
      '       a.eplant_id,'
      '       a.ctrl_eplant_id,'
      '       a.arcusto_credit_card_id,'
      '       t.description as terms,'
      '       t.days as termdays,'
      '       NVL(t.based_on, '#39'I'#39') as TermsBasedOn,'
      '       t.day_of_month as day_of_month,'
      '       t.end_of_month as end_of_month,'
      '       g.acct as aracct,'
      '       p.period,'
      '       p.start_date,'
      '       p.end_date,'
      '       c.company,'
      '       c.custno,'
      '       f.acct as fxacct,'
      '       r.curr_code as CurrencyCode,'
      '       e.descrip as EPlant_Name,'
      '       ba.attn as billtocomp,'
      '       a.NUM_OF_SUPP_DOCS,'
      '       a.cuser1,'
      '       a.cuser2,'
      '       a.cuser3,'
      '       c.info_ar,'
      '      a.DO_NOT_EMAIL_UPON_POST,'
      '      a.ecode'
      '  from arprepost a,'
      '       terms t,'
      '       glacct g,'
      '       glperiods p,'
      '       arcusto c,'
      '       glacct f,'
      '       currency r,'
      '       (select id,'
      '               name,'
      '               '#39'['#39' || ID || '#39']  '#39' || name as descrip'
      '          from eplant) e,'
      '       bill_to ba'
      ' where a.terms_id = t.id(+)'
      '   and a.glacct_id_ar = g.id(+)'
      '   and a.glperiods_id_ar = p.id(+)'
      '   and a.arcusto_id = c.id(+)'
      '   and a.glacct_id_fx = f.id(+)'
      '   and a.currency_id = r.id(+)'
      '   and a.eplant_id = e.id(+)'
      '   and a.bill_to_id = ba.id(+)'
      ''
      '   '
      '-- HPICK_PROPAGATE_SORT_START'
      '  order by INVOICE_NO'
      '-- HPICK_PROPAGATE_SORT_END'
      ' '
      ' '
      ' ')
    Left = 148
    Top = 339
    object QryArPrePostID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object QryArPrePostGLPERIODS_ID_AR: TBCDField
      FieldName = 'GLPERIODS_ID_AR'
      Size = 0
    end
    object QryArPrePostARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object QryArPrePostBILL_TO_ID: TBCDField
      FieldName = 'BILL_TO_ID'
      Size = 0
    end
    object QryArPrePostINVOICE_NO: TStringField
      FieldName = 'INVOICE_NO'
      Size = 25
    end
    object QryArPrePostINVOICE_DATE: TDateTimeField
      FieldName = 'INVOICE_DATE'
      OnChange = QryArPrePostINVOICE_DATEChange
      EditMask = '!99/99/####;1; '
    end
    object QryArPrePostTERMS_ID: TBCDField
      FieldName = 'TERMS_ID'
      OnChange = QryArPrePostTERMS_IDChange
      Size = 0
    end
    object QryArPrePostDUE_DATE: TDateTimeField
      FieldName = 'DUE_DATE'
      EditMask = '!99/99/####;1; '
    end
    object QryArPrePostGLACCT_ID_AR: TBCDField
      FieldName = 'GLACCT_ID_AR'
      Size = 0
    end
    object QryArPrePostTERMS: TStringField
      FieldName = 'TERMS'
      Size = 60
    end
    object QryArPrePostARACCT: TStringField
      FieldName = 'ARACCT'
      Size = 50
    end
    object QryArPrePostPERIOD: TBCDField
      FieldName = 'PERIOD'
      Size = 0
    end
    object QryArPrePostTERMDAYS: TBCDField
      FieldName = 'TERMDAYS'
      Size = 0
    end
    object QryArPrePostSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
    end
    object QryArPrePostEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object QryArPrePostCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryArPrePostCUSTNO: TStringField
      FieldName = 'CUSTNO'
      Size = 10
    end
    object QryArPrePostPRIOR_ENTRY: TStringField
      FieldName = 'PRIOR_ENTRY'
      Size = 1
    end
    object QryArPrePostON_HOLD: TStringField
      FieldName = 'ON_HOLD'
      Size = 1
    end
    object QryArPrePostINV_PREFIX: TStringField
      FieldName = 'INV_PREFIX'
      Size = 10
    end
    object QryArPrePostCURRENCY_ID: TBCDField
      FieldName = 'CURRENCY_ID'
      Size = 0
    end
    object QryArPrePostGLACCT_ID_FX: TBCDField
      FieldName = 'GLACCT_ID_FX'
      Size = 0
    end
    object QryArPrePostFXACCT: TStringField
      FieldName = 'FXACCT'
      Size = 50
    end
    object QryArPrePostCURRENCYCODE: TStringField
      FieldName = 'CURRENCYCODE'
      Size = 10
    end
    object QryArPrePostFROM_ORDER: TStringField
      FieldName = 'FROM_ORDER'
      Size = 1
    end
    object QryArPrePostARINVOICE_ID: TBCDField
      FieldName = 'ARINVOICE_ID'
      Size = 0
    end
    object QryArPrePostUSERID: TStringField
      FieldName = 'USERID'
      Size = 35
    end
    object QryArPrePostEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryArPrePostEPLANT_NAME: TStringField
      FieldName = 'EPLANT_NAME'
      Size = 74
    end
    object QryArPrePostCTRL_EPLANT_ID: TBCDField
      FieldName = 'CTRL_EPLANT_ID'
      Size = 0
    end
    object QryArPrePostTERMSBASEDON: TStringField
      FieldName = 'TERMSBASEDON'
      Size = 1
    end
    object QryArPrePostBILLTOCOMP: TStringField
      FieldName = 'BILLTOCOMP'
      Size = 60
    end
    object QryArPrePostARCUSTO_CREDIT_CARD_ID: TBCDField
      FieldName = 'ARCUSTO_CREDIT_CARD_ID'
      Size = 0
    end
    object QryArPrePostDAY_OF_MONTH: TBCDField
      FieldName = 'DAY_OF_MONTH'
      Size = 0
    end
    object QryArPrePostEND_OF_MONTH: TStringField
      FieldName = 'END_OF_MONTH'
      FixedChar = True
      Size = 1
    end
    object QryArPrePostNUM_OF_SUPP_DOCS: TBCDField
      FieldName = 'NUM_OF_SUPP_DOCS'
      Size = 0
    end
    object QryArPrePostCUSER1: TStringField
      FieldName = 'CUSER1'
      Size = 60
    end
    object QryArPrePostCUSER2: TStringField
      FieldName = 'CUSER2'
      Size = 60
    end
    object QryArPrePostCUSER3: TStringField
      FieldName = 'CUSER3'
      Size = 60
    end
    object QryArPrePostNOTES: TStringField
      FieldName = 'NOTES'
      Size = 2000
    end
    object QryArPrePostDO_NOT_EMAIL_UPON_POST: TStringField
      FieldName = 'DO_NOT_EMAIL_UPON_POST'
      Size = 1
    end
    object QryArPrePostINFO_AR: TStringField
      FieldName = 'INFO_AR'
      Size = 2000
    end
    object QryArPrePostECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'ECODE'
      Size = 10
    end
  end
  object PkAllAcct: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '          type,'
      '          eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE  '
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39' '
      '  and NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39' '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 513
    Top = 277
    object FloatField2: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object StringField8: TStringField
      DisplayLabel = 'Acct#'
      FieldName = 'ACCT'
      Size = 50
    end
    object StringField9: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object StringField10: TStringField
      DisplayLabel = 'Acct. Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object FloatField3: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.EPLANT_ID'
      Size = 0
    end
  end
  object QryRefCode: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select r.id as category_id, '
      '       r.descrip as category_descrip, '
      '       r.eplant_id as eplant_id,'
      '       c.id as ref_code_id, '
      '       c.descrip as ref_code_descrip, '
      '       c.ref_code as ref_code '
      '  from RC_CATEGORY r, '
      '       REF_CODE c '
      ' where c.rc_category_id = r.id'
      '   and misc.Eplant_Filter_Include_nulls(r.eplant_id) = 1'
      ' order by r.descrip'
      ' ')
    Left = 416
    Top = 219
  end
  object PkTooling: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '       tool_rfq.id as tool_rfq_id,'
      '       tool_rfq.workorderno as workorderno,'
      '       tool_rfq.rfq,'
      '       tool_rfq.project as project,'
      '       tool_rfq.buyerid as buyerid,'
      '       arcusto.custno as custno,  '
      '       arcusto.company as company'
      '  from '
      '       tool_rfq,'
      '       arcusto'
      ' where '
      '   tool_rfq.arcusto_id = arcusto.id(+)'
      '   and tool_rfq.open_wo = '#39'Y'#39
      '   and tool_rfq.archived is NULL')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 569
    Top = 277
    object PkToolingTOOL_RFQ_ID: TBCDField
      FieldName = 'TOOL_RFQ_ID'
      Visible = False
      Size = 0
    end
    object PkToolingWORKORDERNO: TStringField
      DisplayLabel = 'WO #'
      DisplayWidth = 10
      FieldName = 'WORKORDERNO'
    end
    object PkToolingRFQ: TStringField
      DisplayLabel = 'RFQ #'
      DisplayWidth = 10
      FieldName = 'RFQ'
    end
    object PkToolingPROJECT: TStringField
      DisplayLabel = 'Project'
      DisplayWidth = 10
      FieldName = 'PROJECT'
      Size = 255
    end
    object PkToolingBUYERID: TStringField
      DisplayLabel = 'Buyer ID'
      DisplayWidth = 10
      FieldName = 'BUYERID'
      Size = 35
    end
    object PkToolingCUSTNO: TStringField
      DisplayLabel = 'CUST #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkToolingCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY'
      Size = 60
    end
  end
  object QryBillTo: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '          attn,'
      '          addr1,'
      '          addr2,'
      '          city,'
      '          state,'
      '          country'
      '  from bill_to'
      ' where arcusto_id = :nID'
      '    and NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39)
    Left = 448
    Top = 219
    ParamData = <
      item
        Name = 'nID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryBillToATTN: TStringField
      DisplayLabel = 'Attn.'
      DisplayWidth = 15
      FieldName = 'ATTN'
      Origin = 'BILL_TO.ATTN'
      Size = 30
    end
    object QryBillToADDR1: TStringField
      DisplayLabel = 'Addr1.'
      DisplayWidth = 15
      FieldName = 'ADDR1'
      Origin = 'BILL_TO.ADDR1'
      Size = 30
    end
    object QryBillToADDR2: TStringField
      DisplayLabel = 'Addr2.'
      DisplayWidth = 15
      FieldName = 'ADDR2'
      Origin = 'BILL_TO.ADDR2'
      Size = 30
    end
    object QryBillToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'BILL_TO.CITY'
      Size = 30
    end
    object QryBillToSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
      Origin = 'BILL_TO.STATE'
      Size = 2
    end
    object QryBillToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      Origin = 'IQ.BILL_TO.COUNTRY'
      FixedChar = True
      Size = 100
    end
    object QryBillToID: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object QryGlAcct: TFDQuery
    Tag = 1
    BeforeOpen = QryGlAcctBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select id, eplant_id, acct, descrip from glacct where NVL(PK_HID' +
        'E, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct'
      ''
      ' ')
    Left = 216
    Top = 327
    object QryGlAcctACCT: TStringField
      DisplayLabel = 'Account'
      DisplayWidth = 15
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object QryGlAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object QryGlAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object QryGlAcctID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object QryVMI: TFDQuery
    Tag = 1
    BeforeOpen = QryShipBeforeOpen
    OnCalcFields = QryShipCalcFields
    Filtered = True
    MasterSource = SrcArPrePost
    MasterFields = 'ARCUSTO_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select description,'
      '       itemno,'
      '       packslipno,'
      '       orderno,'
      '       shipdate,'
      '       custno,'
      '       total_qty_ord,'
      '       unit_price,'
      '       price_per_1000,'
      '       tax_code_id,'
      '       arinvt_id,'
      '       misc_item,'
      '       descrip,'
      '       descrip2,'
      '       ord_detail_id,'
      '       shipment_dtl_id,'
      '       backorder_qty,'
      '       comm_pct,'
      '       class,'
      '       rev,'
      '       salespeople_id,'
      '       price_per_1000YN,'
      '       acct_id_sales,'
      '       qtyshipped,'
      '       invoice_qty,'
      '       invoiced_qty,'
      '       eplant_id,'
      '       ar_invoiced_qty,'
      '       ar_ord_invoiced_qty,'
      '       pending_qty,'
      '       shippedsofar,'
      '       total_qty_invoiced,'
      '       left_to_invoice,'
      '       phantom,'
      '       phantom_on_so,'
      '       phantom_child,'
      '       phantom_itemno,'
      '       vmi_consumption_id,'
      '       ref_number'
      'from ('
      ''
      ''
      
        'select substrB(iqeval.substrW63Max(LTrim(RTrim(NVL(v.misc_item, ' +
        #39' '#39') || NVL(v.descrip, '#39' '#39'))), 1, 255), 1, 255) as description,'
      '       v.itemno,'
      '       v.packslipno,'
      '       v.orderno,'
      '       v.shipdate,'
      '       v.custno,'
      '       v.total_qty_ord,'
      '       v.unit_price,'
      '       d.price_per_1000,'
      '       v.tax_code_id,'
      '       v.arinvt_id,'
      '       v.misc_item,'
      '       v.descrip,'
      '       v.descrip2,'
      '       v.ord_detail_id,'
      '       v.shipment_dtl_id,'
      '       v.backorder_qty,'
      '       v.comm_pct,'
      '       v.class,'
      '       v.rev,'
      '       v.salespeople_id,'
      '       v.price_per_1000YN,'
      '       NVL(d.glacct_id, v.acct_id_sales) as acct_id_sales,'
      
        '      (select v.vmi_consumed - NVL(sum(qty), 0) from vmi_consump' +
        'tion where shipment_dtl_id = v.shipment_dtl_id) as qtyshipped,'
      '       v.invoice_qty,'
      '       v.invoiced_qty,'
      '       v.eplant_id,'
      
        '       vmi_misc.GetTotalInvoiceQtyShipNoVmi(NVL(v.shipment_dtl_i' +
        'd, 0)) as ar_invoiced_qty,'
      
        '       vmi_misc.GetTotalInvoiceQtyOrdNoVmi(NVL(v.ord_detail_id, ' +
        '0)) as ar_ord_invoiced_qty,'
      
        '       vmi_misc.GetTotalPreInvoiceQty(NVL(v.ord_detail_id, 0), N' +
        'VL(v.shipment_dtl_id, 0)) as pending_qty,'
      '       0 as shippedsofar,'
      
        '       vmi_misc.GetTotalInvoiceQty(NVL(v.ord_detail_id, 0), NVL(' +
        'v.shipment_dtl_id, 0))  as total_qty_invoiced,'
      
        '       vmi_misc.GetLeftToInvoice(NVL(v.ord_detail_id, 0), NVL(v.' +
        'shipment_dtl_id, 0)) as left_to_invoice,'
      '       NVL(v.phantom, '#39'N'#39') as phantom,'
      '       NVL(v.phantom_components_on_so, '#39'N'#39') as phantom_on_so,'
      
        '       decode(NVL(d.PHANTOM_ORD_DETAIL_ID, 0), 0, '#39'N'#39', '#39'Y'#39') as p' +
        'hantom_child,'
      
        '       decode(NVL(d.PHANTOM_ORD_DETAIL_ID, 0), 0, v.itemno, '#39'   ' +
        '  '#39' || v.itemno) as phantom_itemno,'
      '       null as vmi_consumption_id,'
      '        null as ref_number'
      ''
      '  from v_shipments_short v,'
      '       ship_to s,'
      '       ord_detail d,'
      '       C_ARINVOICE_SHIP_SUM a,'
      '       C_ARINVOICE_ORD_SUM b,'
      '       C_ARPREPOST_SHIP_SUM pa,'
      '       C_ARPREPOST_ORD_SUM pb'
      ' where v.invoice_qty > 0'
      '   and NVL(v.to_invoice, '#39'Y'#39') = '#39'Y'#39
      '   and v.shipment_dtl_id = a.shipment_dtl_id(+)'
      '   and v.ord_detail_id = b.ord_detail_id(+)'
      '   and v.ord_detail_id = d.id(+)'
      '   and v.shipment_dtl_id = pa.shipment_dtl_id(+)'
      '   and v.ord_detail_id = pb.ord_detail_id(+)'
      
        '   and NVL(v.vmi_consumed, 0) - NVL(v.pending_invoiced_qty, 0) >' +
        ' 0'
      '   and v.arcusto_id = :ARCUSTO_ID'
      '   and v.vmi = '#39'Y'#39
      '   and v.ship_to_id = s.id(+)'
      '   and NVL(d.PHANTOM_ORD_DETAIL_ID, 0) = 0'
      
        '   and not exists (select id from vmi_consumption where shipment' +
        '_dtl_id = v.shipment_dtl_id)'
      ''
      'union all'
      ''
      
        'select substrB(iqeval.substrW63Max(LTrim(RTrim(NVL(v.misc_item, ' +
        #39' '#39') || NVL(v.descrip, '#39' '#39'))), 1, 255), 1, 255) as description,'
      '       v.itemno,'
      '       v.packslipno,'
      '       v.orderno,'
      '       v.shipdate,'
      '       v.custno,'
      '       v.total_qty_ord,'
      '       v.unit_price,'
      '       d.price_per_1000,'
      '       v.tax_code_id,'
      '       v.arinvt_id,'
      '       v.misc_item,'
      '       v.descrip,'
      '       v.descrip2,'
      '       v.ord_detail_id,'
      '       v.shipment_dtl_id,'
      '       v.backorder_qty,'
      '       v.comm_pct,'
      '       v.class,'
      '       v.rev,'
      '       v.salespeople_id,'
      '       v.price_per_1000YN,'
      '       NVL(d.glacct_id, v.acct_id_sales) as acct_id_sales,'
      '       n.running_qty as qtyshipped,'
      '       v.invoice_qty,'
      '       v.invoiced_qty,'
      '       v.eplant_id,'
      
        '       (select sum(invoice_qty) from arinvoice_detail where vmi_' +
        'consumption_id = n.id) as ar_invoiced_qty,'
      
        '       vmi_misc.GetTotalInvoiceQtyOrdVmi(NVL(v.ord_detail_id, 0)' +
        ', n.id) as ar_ord_invoiced_qty,'
      
        '       vmi_misc.GetTotalPreInvoiceQty(NVL(v.ord_detail_id, 0), N' +
        'VL(v.shipment_dtl_id, 0)) as pending_qty,'
      '       0 as shippedsofar,'
      
        '       vmi_misc.GetTotalInvoiceQty(NVL(v.ord_detail_id, 0), NVL(' +
        'v.shipment_dtl_id, 0))  as total_qty_invoiced,'
      
        '       vmi_misc.GetLeftToInvoice(NVL(v.ord_detail_id, 0), NVL(v.' +
        'shipment_dtl_id, 0), n.id) as left_to_invoice,'
      '       NVL(v.phantom, '#39'N'#39') as phantom,'
      '       NVL(v.phantom_components_on_so, '#39'N'#39') as phantom_on_so,'
      
        '       decode(NVL(d.PHANTOM_ORD_DETAIL_ID, 0), 0, '#39'N'#39', '#39'Y'#39') as p' +
        'hantom_child,'
      
        '       decode(NVL(d.PHANTOM_ORD_DETAIL_ID, 0), 0, v.itemno, '#39'   ' +
        '  '#39' || v.itemno) as phantom_itemno,'
      '       n.id as vmi_consumption_id,'
      '       n.ref_number'
      '  from v_shipments_short v,'
      '       ship_to s,'
      '       ord_detail d,'
      '       C_ARINVOICE_SHIP_SUM a,'
      '       C_ARINVOICE_ORD_SUM b,'
      '       C_ARPREPOST_SHIP_SUM pa,'
      '       C_ARPREPOST_ORD_SUM pb,'
      '       vmi_consumption n'
      ' where v.invoice_qty > 0'
      '   and NVL(v.to_invoice, '#39'Y'#39') = '#39'Y'#39
      '   and v.shipment_dtl_id = a.shipment_dtl_id(+)'
      '   and v.ord_detail_id = b.ord_detail_id(+)'
      '   and v.ord_detail_id = d.id(+)'
      '   and v.shipment_dtl_id = pa.shipment_dtl_id(+)'
      '   and v.ord_detail_id = pb.ord_detail_id(+)'
      '   and v.arcusto_id = :ARCUSTO_ID'
      '   and v.vmi = '#39'Y'#39
      '   and v.ship_to_id = s.id(+)'
      '   and NVL(d.PHANTOM_ORD_DETAIL_ID, 0) = 0'
      '   and v.shipment_dtl_id = n.shipment_dtl_id'
      '   and NVL(n.voided, '#39'N'#39') = '#39'N'#39
      
        '   and NVL(n.id, 0) not in (select NVL(vmi_consumption_id, 0) fr' +
        'om arprepost_detail)'
      
        '   and NVL(n.running_qty, 0) > (select NVL(sum(NVL(invoice_qty, ' +
        '0)), 0) from arinvoice_detail where vmi_consumption_id = n.id)'
      ')'
      'where NVL(qtyshipped, 0) > = 0'
      '')
    Left = 270
    Top = 376
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object StringField11: TStringField
      DisplayLabel = 'PackSlip#'
      DisplayWidth = 10
      FieldName = 'PACKSLIPNO'
      Origin = 'PACKSLIPNO'
      Size = 15
    end
    object QryVMIQTYSHIPPED: TFMTBCDField
      DisplayLabel = 'Qty.Consumed'
      DisplayWidth = 10
      FieldName = 'QTYSHIPPED'
      Precision = 14
    end
    object FloatField5: TFMTBCDField
      DisplayLabel = 'Consumed Qty. Invoiced'
      DisplayWidth = 17
      FieldName = 'AR_INVOICED_QTY'
      Origin = 'INVOICED_QTY'
      Size = 38
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Ship Date'
      DisplayWidth = 9
      FieldName = 'SHIPDATE'
      Origin = 'V.SHIPDATE'
    end
    object FloatField6: TFMTBCDField
      DisplayLabel = 'Qty. Invoiced (w/o PS)'
      DisplayWidth = 18
      FieldName = 'AR_ORD_INVOICED_QTY'
      Origin = 'invoiced_qty'
      Size = 38
    end
    object StringField12: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryVMIREF_NUMBER: TStringField
      DisplayLabel = 'Reference #'
      DisplayWidth = 35
      FieldName = 'REF_NUMBER'
      Size = 35
    end
    object QryVMIVMI_CONSUMPTION_ID: TFMTBCDField
      DisplayWidth = 39
      FieldName = 'VMI_CONSUMPTION_ID'
      Origin = 'VMI_CONSUMPTION_ID'
      Visible = False
      Precision = 38
      Size = 38
    end
    object QryVMIPHANTOM_ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 30
      FieldName = 'PHANTOM_ITEMNO'
      Visible = False
      Size = 55
    end
    object QryVMIPRICE_PER_1000: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'PRICE_PER_1000'
      Visible = False
      Size = 6
    end
    object StringField13: TStringField
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Visible = False
      Size = 10
    end
    object FloatField7: TBCDField
      DisplayWidth = 10
      FieldName = 'TOTAL_QTY_ORD'
      Visible = False
    end
    object FloatField8: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Visible = False
      Size = 6
    end
    object FloatField9: TBCDField
      DisplayWidth = 10
      FieldName = 'TAX_CODE_ID'
      Visible = False
      Size = 0
    end
    object FloatField10: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object StringField14: TStringField
      DisplayWidth = 50
      FieldName = 'MISC_ITEM'
      Visible = False
      Size = 250
    end
    object FloatField11: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Tax'
      Visible = False
      Calculated = True
    end
    object FloatField12: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object FloatField13: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENT_DTL_ID'
      Visible = False
      Size = 0
    end
    object FloatField14: TBCDField
      DisplayWidth = 10
      FieldName = 'BACKORDER_QTY'
      Visible = False
    end
    object FloatField15: TBCDField
      DisplayWidth = 10
      FieldName = 'COMM_PCT'
      Visible = False
      Size = 3
    end
    object StringField15: TStringField
      DisplayWidth = 2
      FieldName = 'CLASS'
      Visible = False
      Size = 2
    end
    object StringField16: TStringField
      DisplayWidth = 15
      FieldName = 'REV'
      Visible = False
      Size = 15
    end
    object FloatField16: TBCDField
      DisplayWidth = 10
      FieldName = 'SALESPEOPLE_ID'
      Visible = False
      Size = 0
    end
    object FloatField17: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'ACCT_ID_SALES'
      Visible = False
      Size = 38
    end
    object FloatField19: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'INVOICE_QTY'
      Visible = False
      Size = 38
    end
    object FloatField20: TBCDField
      DisplayWidth = 10
      FieldName = 'INVOICED_QTY'
      Visible = False
    end
    object StringField17: TStringField
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Visible = False
      Size = 15
    end
    object FloatField21: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'SHIPPEDSOFAR'
      Visible = False
      Size = 38
    end
    object StringField18: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Visible = False
      Size = 100
    end
    object FloatField22: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'PENDING_QTY'
      Visible = False
      Size = 38
    end
    object FloatField23: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'TOTAL_QTY_INVOICED'
      Visible = False
      Size = 38
    end
    object FloatField24: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'LEFT_TO_INVOICE'
      Visible = False
      Size = 38
    end
    object StringField19: TStringField
      DisplayWidth = 1
      FieldName = 'PRICE_PER_1000YN'
      Visible = False
      Size = 1
    end
    object FloatField25: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object StringField20: TStringField
      DisplayWidth = 85
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Visible = False
      Size = 255
    end
    object QryVMIDESCRIP2: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRIP2'
      Visible = False
      Size = 100
    end
    object QryVMIPHANTOM: TStringField
      DisplayWidth = 1
      FieldName = 'PHANTOM'
      Visible = False
      Size = 1
    end
    object QryVMIPHANTOM_CHILD: TStringField
      DisplayWidth = 1
      FieldName = 'PHANTOM_CHILD'
      Visible = False
      Size = 1
    end
    object QryVMIPHANTOM_ON_SO: TStringField
      DisplayWidth = 1
      FieldName = 'PHANTOM_ON_SO'
      Visible = False
      Size = 1
    end
  end
  object SrcVMI: TDataSource
    DataSet = QryVMI
    Left = 254
    Top = 378
  end
  object SrcDtlAcct: TDataSource
    DataSet = TblDtlAcct
    Left = 48
    Top = 219
  end
  object TblDtlAcct: TFDTable
    BeforeInsert = TblDtlAcctBeforeEdit
    BeforeEdit = TblDtlAcctBeforeEdit
    BeforePost = TblDtlAcctBeforePost
    OnCalcFields = TblDtlAcctCalcFields
    CachedUpdates = True
    IndexFieldNames = 'ARPREPOST_DETAIL_ID'
    MasterSource = SrcArPrePostDetail
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'ARPREPOST_DETAIL_SALES'
    TableName = 'ARPREPOST_DETAIL_SALES'
    Left = 616
    Top = 432
    object TblDtlAcctPERCENTAGE: TFMTBCDField
      DisplayLabel = 'Percentage'
      DisplayWidth = 10
      FieldName = 'PERCENTAGE'
      Required = True
      Size = 6
    end
    object TblDtlAcctAcct: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Acct'
      LookupDataSet = wwQryGLAcctDtlSales
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'GLACCT_ID'
      Required = True
      Lookup = True
    end
    object TblDtlAcctAmount: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Amount'
      Calculated = True
    end
    object TblDtlAcctdescrip: TStringField
      DisplayLabel = 'GL Account Description'
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'descrip'
      LookupDataSet = wwQryGLAcctDtlSales
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'GLACCT_ID'
      Size = 50
      Lookup = True
    end
    object TblDtlAcctSPLIT_AMOUNT: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'SPLIT_AMOUNT'
      Visible = False
      Size = 6
    end
    object TblDtlAcctID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblDtlAcctARPREPOST_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARPREPOST_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object TblDtlAcctGLACCT_ID: TBCDField
      DisplayLabel = 'Gl Account'
      DisplayWidth = 10
      FieldName = 'GLACCT_ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object wwQryGLAcctDtlSales: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, eplant_id, acct, descrip from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39
      'and acct > '#39' '#39
      'and (NVL(eplant_id, 0) = :AID or :ADummy = 1)'
      'order by acct')
    Left = 88
    Top = 235
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ADummy'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object StringField21: TStringField
      DisplayLabel = 'Account'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Size = 50
    end
    object StringField22: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Size = 50
    end
    object FloatField18: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object FloatField26: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL3: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ARPREPOST_DETAIL_SALES'
      '  (ID, ARPREPOST_DETAIL_ID, GLACCT_ID, PERCENTAGE)'
      'values'
      '  (:ID, :ARPREPOST_DETAIL_ID, :GLACCT_ID, :PERCENTAGE)')
    ModifySQL.Strings = (
      'update ARPREPOST_DETAIL_SALES'
      'set'
      '  ID = :ID,'
      '  ARPREPOST_DETAIL_ID = :ARPREPOST_DETAIL_ID,'
      '  GLACCT_ID = :GLACCT_ID,'
      '  PERCENTAGE = :PERCENTAGE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ARPREPOST_DETAIL_SALES'
      'where'
      '  ID = :OLD_ID')
    Left = 88
    Top = 312
  end
  object PkFreight: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       scac_iata_code,'
      '       code_qualifier,'
      '       transport_code,'
      '       equip_owners_code,'
      '       pk_hide,'
      '       eplant_id'
      '  from freight'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1  ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 56
    Top = 320
    object PkFreightID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FREIGHT.ID'
      Visible = False
      Size = 0
    end
    object PkFreightDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.FREIGHT.DESCRIP'
      Size = 60
    end
    object PkFreightSCAC_IATA_CODE: TStringField
      DisplayLabel = 'SCAC IATA'
      FieldName = 'SCAC_IATA_CODE'
      Origin = 'IQ.FREIGHT.SCAC_IATA_CODE'
      FixedChar = True
      Size = 17
    end
    object PkFreightCODE_QUALIFIER: TStringField
      DisplayLabel = 'Code Qualifier'
      FieldName = 'CODE_QUALIFIER'
      Origin = 'IQ.FREIGHT.CODE_QUALIFIER'
      Size = 6
    end
    object PkFreightTRANSPORT_CODE: TStringField
      DefaultExpression = 'Transportation Method Code'
      DisplayLabel = 'Transportation Method Code'
      FieldName = 'TRANSPORT_CODE'
      Origin = 'IQ.FREIGHT.TRANSPORT_CODE'
      Size = 6
    end
    object PkFreightEQUIP_OWNERS_CODE: TStringField
      DisplayLabel = 'Equipment Owners Code'
      FieldName = 'EQUIP_OWNERS_CODE'
      Origin = 'IQ.FREIGHT.EQUIP_OWNERS_CODE'
      Size = 4
    end
    object PkFreightPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.FREIGHT.PK_HIDE'
      Visible = False
      Size = 1
    end
    object PkFreightEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkRefCode: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select r.id as category_id,'
      '       r.descrip as category_descrip,'
      '       r.eplant_id as eplant_id,'
      '       c.id as ref_code_id,'
      '       c.descrip as ref_code_descrip,'
      '       c.ref_code as ref_code'
      '  from RC_CATEGORY r,'
      '       REF_CODE c'
      ' where c.rc_category_id = r.id'
      '   and misc.Eplant_Filter_Include_nulls(r.eplant_id) = 1'
      '   and NVL(c.pk_hide, '#39'N'#39') = '#39'N'#39
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 16
    Top = 246
    object PkRefCodeCATEGORY_ID: TBCDField
      FieldName = 'CATEGORY_ID'
      Visible = False
      Size = 0
    end
    object PkRefCodeCATEGORY_DESCRIP: TStringField
      DisplayLabel = 'Category'
      FieldName = 'CATEGORY_DESCRIP'
      Size = 30
    end
    object PkRefCodeEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkRefCodeREF_CODE_ID: TBCDField
      FieldName = 'REF_CODE_ID'
      Visible = False
      Size = 0
    end
    object PkRefCodeREF_CODE_DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'REF_CODE_DESCRIP'
      Size = 60
    end
    object PkRefCodeREF_CODE: TStringField
      DisplayLabel = 'Ref Code'
      FieldName = 'REF_CODE'
      Size = 10
    end
  end
  object ProcCommod: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.IQ_COMMODITY.AMOUNT_SUR_RATE'
    Left = 496
    Top = 374
    ParamData = <
      item
        Name = 'v_arcusto_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_arinvt_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_arpprepost_detail_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_aka_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
  object SrcDtlAcctSplit: TDataSource
    DataSet = TblDtlAcctSplit
    Left = 24
    Top = 347
  end
  object TblDtlAcctSplit: TFDTable
    BeforeInsert = TblDtlAcctBeforeEdit
    BeforeEdit = TblDtlAcctBeforeEdit
    BeforePost = TblDtlAcctBeforePost
    IndexFieldNames = 'ARPREPOST_DETAIL_ID'
    MasterSource = SrcArPrePostDetail
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'ARPREPOST_DETAIL_SALES'
    TableName = 'ARPREPOST_DETAIL_SALES'
    Left = 24
    Top = 368
    object TblDtlAcctSplitAcct: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Acct'
      LookupDataSet = wwQryGLAcctDtlSales
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'GLACCT_ID'
      Required = True
      Lookup = True
    end
    object TblDtlAcctSplitDescrip: TStringField
      DisplayLabel = 'GL Account Description'
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'descrip'
      LookupDataSet = wwQryGLAcctDtlSales
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'GLACCT_ID'
      Size = 50
      Lookup = True
    end
    object FloatField29: TFMTBCDField
      DisplayLabel = 'Amount'
      DisplayWidth = 10
      FieldName = 'SPLIT_AMOUNT'
      DisplayFormat = '###,###,##0.######'
      Size = 6
    end
    object FloatField27: TFMTBCDField
      DisplayLabel = 'Percentage'
      DisplayWidth = 10
      FieldName = 'PERCENTAGE'
      Visible = False
      Size = 6
    end
    object FloatField30: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object FloatField31: TBCDField
      DisplayWidth = 10
      FieldName = 'ARPREPOST_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object FloatField32: TBCDField
      DisplayLabel = 'Gl Account'
      DisplayWidth = 10
      FieldName = 'GLACCT_ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object wwQryGLAcct_Freight: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, eplant_id, acct, descrip from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39' '
      'and acct > '#39' '#39
      'and (NVL(eplant_id, 0) = :AID or :ADummy = 1)'
      'order by acct'
      '')
    Left = 488
    Top = 219
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ADummy'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object wwQryGLAcct_FreightID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object wwQryGLAcct_FreightEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object wwQryGLAcct_FreightACCT: TStringField
      FieldName = 'ACCT'
      Size = 50
    end
    object wwQryGLAcct_FreightDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
  end
  object QryInvCode: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select inv_prefix,'
      '       descrip,'
      '       id'
      '  from INVOICE_CODE'
      '  order by  inv_prefix')
    Left = 292
    Top = 328
    object QryInvCodeINV_PREFIX: TStringField
      FieldName = 'INV_PREFIX'
      Origin = 'IQ.INVOICE_CODE.INV_PREFIX'
      Size = 10
    end
    object QryInvCodeDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.INVOICE_CODE.DESCRIP'
    end
    object QryInvCodeID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.INVOICE_CODE.ID'
      Size = 0
    end
  end
  object PkGlAcct: TIQWebHpick
    BeforeOpen = PkAcctBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '          type,'
      '          eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39' '
      '   and NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39' '
      ' and misc.eplant_filter(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 725
    Top = 277
    object PkGlAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkGlAcctACCT: TStringField
      DisplayLabel = 'Acct#'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkGlAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkGlAcctTYPE: TStringField
      DisplayLabel = 'Acct. Type'
      FieldName = 'TYPE'
      Size = 35
    end
    object PkGlAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkTaxCode: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       tax_code,'
      '       tax_code_desc,'
      '       tot_tax_rate'
      '  from tax_codes')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 64
    Top = 424
    object PkTaxCodeTAX_CODE: TStringField
      DisplayLabel = 'Tax Code'
      DisplayWidth = 20
      FieldName = 'TAX_CODE'
      Origin = 'IQ.TAX_CODES.TAX_CODE'
    end
    object PkTaxCodeTAX_CODE_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'TAX_CODE_DESC'
      Origin = 'IQ.TAX_CODES.TAX_CODE_DESC'
      Size = 50
    end
    object PkTaxCodeTOT_TAX_RATE: TFMTBCDField
      DisplayLabel = 'Rate'
      DisplayWidth = 10
      FieldName = 'TOT_TAX_RATE'
      Origin = 'IQ.TAX_CODES.TOT_TAX_RATE'
      Size = 6
    end
    object PkTaxCodeID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.TAX_CODES.ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL2: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO ARPREPOST_DETAIL'
      '(ID, ARPREPOST_ID, ORD_DETAIL_ID, INVOICE_QTY, '
      '  UNIT_PRICE, GLACCT_ID_SALES, TAX_CODE_ID, '
      '  SALESPEOPLE_ID, COMM_PCNT, FREIGHT_ID, SHIPMENT_DTL_ID, '
      '  FREIGHT_PRICE, ARINVT_ID, MISC_COMMENT, REF_CODE_ID, '
      '  REFERENCE, PRICE_PER_1000, PRICE_PER_1000_YN, '
      '  FROM_ORDER, COST_OBJECT_ID, COST_OBJECT_SOURCE, '
      '  MISC_PO, EPLANT_ID, RMA_DETAIL_ID, VMI_REFERENCE, '
      '  NO_POST_STD_COST, GLACCT_ID_FREIGHT, SHIPMENT_DTL_ID2, '
      '  LIST_UNIT_PRICE, DISCOUNT, FREIGHT_REV_AMOUNT, '
      '  FREIGHT_REV_PCNT, ACCT_ID_FREIGHT_REV, ORIG_FREIGHT_PRICE, '
      '  TAX_RATE, SHIP_TO_ID, MISC_ORDERS_ID, IS_CREDIT_MEMO)'
      
        'VALUES (:NEW_ID, :NEW_ARPREPOST_ID, :NEW_ORD_DETAIL_ID, :NEW_INV' +
        'OICE_QTY, '
      '  :NEW_UNIT_PRICE, :NEW_GLACCT_ID_SALES, :NEW_TAX_CODE_ID, '
      
        '  :NEW_SALESPEOPLE_ID, :NEW_COMM_PCNT, :NEW_FREIGHT_ID, :NEW_SHI' +
        'PMENT_DTL_ID, '
      
        '  :NEW_FREIGHT_PRICE, :NEW_ARINVT_ID, :NEW_MISC_COMMENT, :NEW_RE' +
        'F_CODE_ID, '
      '  :NEW_REFERENCE, :NEW_PRICE_PER_1000, :NEW_PRICE_PER_1000_YN, '
      
        '  :NEW_FROM_ORDER, :NEW_COST_OBJECT_ID, :NEW_COST_OBJECT_SOURCE,' +
        ' '
      
        '  :NEW_MISC_PO, decode(NVL(:NEW_EPLANT_ID, 0), 0, NULL, :NEW_EPL' +
        'ANT_ID), :NEW_RMA_DETAIL_ID, :NEW_VMI_REFERENCE, '
      
        '  :NEW_NO_POST_STD_COST, :NEW_GLACCT_ID_FREIGHT, :NEW_SHIPMENT_D' +
        'TL_ID2, '
      '  :NEW_LIST_UNIT_PRICE, :NEW_DISCOUNT, :NEW_FREIGHT_REV_AMOUNT, '
      
        '  :NEW_FREIGHT_REV_PCNT, :NEW_ACCT_ID_FREIGHT_REV, :NEW_ORIG_FRE' +
        'IGHT_PRICE, '
      
        '  :NEW_TAX_RATE, :NEW_SHIP_TO_ID, :NEW_MISC_ORDERS_ID, :IS_CREDI' +
        'T_MEMO)')
    ModifySQL.Strings = (
      'UPDATE ARPREPOST_DETAIL'
      
        'SET ID = :NEW_ID, ARPREPOST_ID = :NEW_ARPREPOST_ID, ORD_DETAIL_I' +
        'D = :NEW_ORD_DETAIL_ID, '
      '  INVOICE_QTY = :NEW_INVOICE_QTY, UNIT_PRICE = :NEW_UNIT_PRICE, '
      
        '  GLACCT_ID_SALES = :NEW_GLACCT_ID_SALES, TAX_CODE_ID = :NEW_TAX' +
        '_CODE_ID, '
      
        '  SALESPEOPLE_ID = :NEW_SALESPEOPLE_ID, COMM_PCNT = :NEW_COMM_PC' +
        'NT, '
      
        '  FREIGHT_ID = :NEW_FREIGHT_ID, SHIPMENT_DTL_ID = :NEW_SHIPMENT_' +
        'DTL_ID, '
      
        '  FREIGHT_PRICE = :NEW_FREIGHT_PRICE, ARINVT_ID = :NEW_ARINVT_ID' +
        ', '
      
        '  MISC_COMMENT = :NEW_MISC_COMMENT, REF_CODE_ID = :NEW_REF_CODE_' +
        'ID, '
      
        '  REFERENCE = :NEW_REFERENCE, PRICE_PER_1000 = :NEW_PRICE_PER_10' +
        '00, '
      
        '  PRICE_PER_1000_YN = :NEW_PRICE_PER_1000_YN, FROM_ORDER = :NEW_' +
        'FROM_ORDER, '
      
        '  COST_OBJECT_ID = :NEW_COST_OBJECT_ID, COST_OBJECT_SOURCE = :NE' +
        'W_COST_OBJECT_SOURCE, '
      
        '  MISC_PO = :NEW_MISC_PO, EPLANT_ID = decode(NVL(:NEW_EPLANT_ID,' +
        ' 0), 0, NULL, :NEW_EPLANT_ID), RMA_DETAIL_ID = :NEW_RMA_DETAIL_I' +
        'D, '
      
        '  VMI_REFERENCE = :NEW_VMI_REFERENCE, NO_POST_STD_COST = :NEW_NO' +
        '_POST_STD_COST, '
      
        '  GLACCT_ID_FREIGHT = :NEW_GLACCT_ID_FREIGHT, SHIPMENT_DTL_ID2 =' +
        ' :NEW_SHIPMENT_DTL_ID2, '
      
        '  LIST_UNIT_PRICE = :NEW_LIST_UNIT_PRICE, DISCOUNT = :NEW_DISCOU' +
        'NT, '
      
        '  FREIGHT_REV_AMOUNT = :NEW_FREIGHT_REV_AMOUNT, FREIGHT_REV_PCNT' +
        ' = :NEW_FREIGHT_REV_PCNT, '
      
        '  ACCT_ID_FREIGHT_REV = :NEW_ACCT_ID_FREIGHT_REV, ORIG_FREIGHT_P' +
        'RICE = :NEW_ORIG_FREIGHT_PRICE, '
      '  TAX_RATE = :NEW_TAX_RATE, SHIP_TO_ID = :NEW_SHIP_TO_ID, '
      '  MISC_ORDERS_ID = :NEW_MISC_ORDERS_ID'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM ARPREPOST_DETAIL'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ARPREPOST_ID, ORD_DETAIL_ID, INVOICE_QTY, UNIT_PRICE,' +
        ' GLACCT_ID_SALES, '
      
        '  TAX_CODE_ID, SALESPEOPLE_ID, COMM_PCNT, FREIGHT_ID, SHIPMENT_D' +
        'TL_ID, '
      
        '  FREIGHT_PRICE, ARINVT_ID, MISC_COMMENT, REF_CODE_ID, REFERENCE' +
        ', '
      
        '  PRICE_PER_1000, PRICE_PER_1000_YN, FROM_ORDER, COST_OBJECT_ID,' +
        ' '
      
        '  COST_OBJECT_SOURCE, MISC_PO, EPLANT_ID, PO_DETAIL_ID, RMA_DETA' +
        'IL_ID, '
      
        '  VMI_REFERENCE, CM_ARINVOICE_ID, NO_POST_STD_COST, PO_RECEIPTS_' +
        'ID, '
      '  SHIPMENTS_AUTODED_ID, GLACCT_ID_FREIGHT, SAC_SHIPMENT_DTL_ID, '
      '  SHIPMENT_DTL_ID2, PONO_FROM_SO, LIST_UNIT_PRICE, DISCOUNT, '
      '  FREIGHT_REV_AMOUNT, FREIGHT_REV_PCNT, ACCT_ID_FREIGHT_REV, '
      '  ORIG_FREIGHT_PRICE, TAX_RATE, SHIP_TO_ID, MISC_ORDERS_ID, '
      '  VMI_CONSUMPTION_ID, SAC_DISCOUNT, SAC_ORD_DETAIL_ID'
      'FROM ARPREPOST_DETAIL'
      'WHERE ID = :ID')
    Left = 76
    Top = 377
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO ARPREPOST'
      '(ID, GLPERIODS_ID_AR, ARCUSTO_ID, BILL_TO_ID, '
      '  INVOICE_NO, INVOICE_DATE, TERMS_ID, DUE_DATE, '
      '  GLACCT_ID_AR, NOTES, PRIOR_ENTRY, ON_HOLD, '
      '  ECODE, INV_PREFIX, CURRENCY_ID, GLACCT_ID_FX, '
      '  FROM_ORDER, ARINVOICE_ID, USERID, EPLANT_ID, '
      '  CTRL_EPLANT_ID, ARCUSTO_CREDIT_CARD_ID, NUM_OF_SUPP_DOCS, '
      '  CUSER1, CUSER2, CUSER3, DO_NOT_EMAIL_UPON_POST)'
      
        'VALUES (:NEW_ID, :NEW_GLPERIODS_ID_AR, :NEW_ARCUSTO_ID, :NEW_BIL' +
        'L_TO_ID, '
      
        '  :NEW_INVOICE_NO, :NEW_INVOICE_DATE, :NEW_TERMS_ID, :NEW_DUE_DA' +
        'TE, '
      
        '  :NEW_GLACCT_ID_AR, :NEW_NOTES, :NEW_PRIOR_ENTRY, :NEW_ON_HOLD,' +
        ' '
      
        '  :NEW_ECODE, :NEW_INV_PREFIX, :NEW_CURRENCY_ID, :NEW_GLACCT_ID_' +
        'FX, '
      
        '  :NEW_FROM_ORDER, :NEW_ARINVOICE_ID, :NEW_USERID, :NEW_EPLANT_I' +
        'D, '
      
        '  :NEW_CTRL_EPLANT_ID, :NEW_ARCUSTO_CREDIT_CARD_ID, :NEW_NUM_OF_' +
        'SUPP_DOCS, '
      
        '  :NEW_CUSER1, :NEW_CUSER2, :NEW_CUSER3, :NEW_DO_NOT_EMAIL_UPON_' +
        'POST)')
    ModifySQL.Strings = (
      'UPDATE ARPREPOST'
      
        'SET GLPERIODS_ID_AR = :NEW_GLPERIODS_ID_AR, ARCUSTO_ID = :NEW_AR' +
        'CUSTO_ID, '
      '  BILL_TO_ID = :NEW_BILL_TO_ID, INVOICE_NO = :NEW_INVOICE_NO, '
      '  INVOICE_DATE = :NEW_INVOICE_DATE, TERMS_ID = :NEW_TERMS_ID, '
      '  DUE_DATE = :NEW_DUE_DATE, GLACCT_ID_AR = :NEW_GLACCT_ID_AR, '
      
        '  NOTES = :NEW_NOTES, PRIOR_ENTRY = :NEW_PRIOR_ENTRY, ON_HOLD = ' +
        ':NEW_ON_HOLD, '
      
        '  ECODE = :NEW_ECODE, INV_PREFIX = :NEW_INV_PREFIX, CURRENCY_ID ' +
        '= :NEW_CURRENCY_ID, '
      
        '  GLACCT_ID_FX = :NEW_GLACCT_ID_FX, FROM_ORDER = :NEW_FROM_ORDER' +
        ', '
      '  ARINVOICE_ID = :NEW_ARINVOICE_ID, USERID = :NEW_USERID, '
      
        '  EPLANT_ID = decode(NVL(:NEW_EPLANT_ID, 0), 0, NULL, :NEW_EPLAN' +
        'T_ID) , CTRL_EPLANT_ID = :NEW_CTRL_EPLANT_ID, '
      
        '  ARCUSTO_CREDIT_CARD_ID = :NEW_ARCUSTO_CREDIT_CARD_ID, NUM_OF_S' +
        'UPP_DOCS = :NEW_NUM_OF_SUPP_DOCS, '
      
        '  CUSER1 = :NEW_CUSER1, CUSER2 = :NEW_CUSER2, CUSER3 = :NEW_CUSE' +
        'R3, '
      '  DO_NOT_EMAIL_UPON_POST = :NEW_DO_NOT_EMAIL_UPON_POST'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM ARPREPOST'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, GLPERIODS_ID_AR, ARCUSTO_ID, BILL_TO_ID, INVOICE_NO, ' +
        'INVOICE_DATE, '
      
        '  TERMS_ID, DUE_DATE, GLACCT_ID_AR, NOTES, PRIOR_ENTRY, ON_HOLD,' +
        ' '
      '  ECODE, EID, EDATE_TIME, ECOPY, INV_PREFIX, CURRENCY_ID, '
      '  GLACCT_ID_FX, FROM_ORDER, ARINVOICE_ID, USERID, EPLANT_ID, '
      
        '  CTRL_EPLANT_ID, PRINT_COUNT, PRINT_LAST_USER, PRINT_LAST_DATE,' +
        ' '
      
        '  EXCLUDE_FROM_FIN_CHARGE, ARCUSTO_CREDIT_CARD_ID, NUM_OF_SUPP_D' +
        'OCS, '
      '  CUSER1, CUSER2, CUSER3, DO_NOT_EMAIL_UPON_POST, CIA_INVOICE, '
      '  TAX_DOC_UPLOADED'
      'FROM ARPREPOST'
      'WHERE ID = :ID')
    Left = 112
    Top = 328
  end
  object ImageListNavTree: TUniNativeImageList
    Left = 416
    Top = 28
    Images = {
      18000000FFFFFF1F057E04000000000100010010100000010020006804000016
      0000002800000010000000200000000100200000000000000000000000000000
      0000000000000000000000E6DFD469B49C7BE9B39B79E9B39B79E9B39B79E9B4
      9D7CE8EBE5DD5DD5C7B5ABB8A283DBC3B096B7DFD4C695AB906AFBDCD1C391FE
      FEFE030000000000000000D0C0AB986F4101FF6F4101FF6F4101FF6F4101FF6F
      4101FFD8CCBB8FA98E68FC6F4101FF6F4101FF704203FF6F4101FF7F561DFFDA
      CFBE9DFFFFFF0400000000D0C0AB986F4101FF6F4101FF6F4101FF6F4101FF6F
      4101FFD8CCBB8FA98E68FC6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF7C
      5219FFD5C8B5A500000000D0C0AB986F4101FF6F4101FF6F4101FF6F4101FF6F
      4101FFD8CCBB8FA98E68FC6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F
      4101FF7B5016FFFFFFFF07D0C0AB986E4100FF6E4100FF6E4100FF6E4100FF6E
      4100FFD8CCBB8FA98E68FC6E4100FF6E4100FF6E4100FF6E4100FF6E4100FF6E
      4100FFA3865EF4ECE6DE6FD0C0AB986F4100FF6E4100FF6E4100FF6E4100FF6F
      4100FFD8CCBB8FD9CDBD9DA2855CF46F4101FF6E4100FF6F4100FF6E4100FF6E
      4100FFA58860F8F9F7F532D0C0AB986F4100FF6F4100FF6F4100FF6F4100FF6F
      4100FFD8CCBB8F00000000F6F4F02B9E7F54FA6F4100FF6F4100FF6F4100FF6F
      4100FF88632EFFFFFFFF12D0C0AB986E4100FF764B0EFF825A23FF75490CFF6E
      4100FFD8CCBB8F00000000FEFEFE04B49C7BEB6E4100FF6E4100FF6E4100FF6E
      4100FF825A23FFFFFFFF3AE8E0D756C5B299BEF6F3EF9CF4F1ECA1F3F0EBA7C6
      B39AC8ECE7DF50F9F7F52CD8CCBB9D7E551BFF6E4100FF6E4100FF6E4100FF6E
      4100FF937141FFFFFFFF44FEFEFE04D7CAB9A88B6632FF74480AFF88622EFFD2
      C4B0B3FEFEFE07B9A283F1714405FF6E4100FF6E4100FF6E4100FF6E4100FF6E
      4100FFB7A181E1FFFFFF29EFEAE3617D541BFF6E4100FF6E4100FF6E4100FF7A
      4F14FFEAE4DB6EA98E68FC6F4100FF6E4100FF6E4100FF6F4100FF6E4100FF79
      4E13FFE3DBCE79FEFEFE05D1C3AF966F4100FF6F4100FF6F4100FF6F4100FF6F
      4100FFC8B79EA4A98E68FC6F4100FF6F4100FF6F4100FF6F4100FF714405FFC7
      B59CCCFFFFFF0800000000E7DFD57475490CFF6F4101FF6F4101FF6F4101FF73
      4608FFE0D7C981A98E68FC6F4101FF6F4101FF6F4101FF784D11FFC7B59CCDFF
      FFFF190000000000000000FFFFFF10C5B39AD275490CFF6E4101FF74480AFFC1
      AD91DAFFFFFF15B39B79F4734608FF865F2AFFB19876EAE4DBCF7FFFFFFF0A00
      000000000000000000000000000000FFFFFF0EEAE3DA70CEBFA99AE8E1D774FF
      FFFF1100000000FBFAF93AF7F4F162FFFFFF3DFFFFFF08000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000003AC410001AC410001AC410000AC410000AC4100
      00AC410100AC410100AC410000AC410000AC410000AC410001AC410003AC4100
      07AC41821FAC41FFFFAC41FFFFFF1F057E040000000001000100101000000100
      2000680400001600000028000000100000002000000001002000000000000004
      0000130B0000130B00000000000000000000000000006F4101086F4101206F41
      01206F4101206F4101206F4101206F4101206F4101206F4101206F4101206F41
      01206F4101206F4101206F41010800000000000000006F4101976F4101FF8C68
      35FF937141FF937141FF937141FF937141FF937141FF937141FF937141FF9371
      41FF8F6B39FF6F4101FF6F41019700000000000000006F41019FA58860FF9E7F
      54FFF3EFEBFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFF1ED
      E7FFA18258FFA78B64FF6F41019F00000000000000006F41019FC9B79FFFEFEA
      E3FF9C7C51FFE6DED3FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFE6DED3FF9C7C
      51FFEFEAE3FFC9B79FFF6F41019F00000000000000006F41019FC9B79FFFFEFE
      FEFFF8F5F2FFA58860FFD4C6B3FFFEFEFEFFFEFEFEFFD4C6B3FFA3865DFFF8F5
      F2FFFEFEFEFFC9B79FFF6F41019F00000000000000006F41019FC9B79FFFFEFE
      FEFFFEFEFEFFBBA688FF916E3EFFB7A080FFBBA688FF967546FFB7A080FFFEFE
      FEFFFEFEFEFFC9B79FFF6F41019F00000000000000006F41019FC9B79FFFF1ED
      E7FFA18258FFD0C0ACFFFEFEFEFFD0C1ACFFD7CAB9FFFEFEFEFFD0C0ACFFA182
      58FFF1EDE7FFC9B79FFF6F41019F00000000000000006F41019FA18258FF7A50
      15FFE1D8CBFFFEFEFEFFFEFEFEFFF1ECE6FFECE6DEFFFEFEFEFFFEFEFEFFE1D8
      CBFF7A5015FF9E7F54FF6F41019F00000000000000006F4101886F4101FF6F41
      01FFEDE7DFFFFEFEFEFFCDBDA7FF937040FF916D3CFFE8E0D6FFFEFEFEFFEDE7
      DFFF6F4101FF6F4101FF6F41018C00000000000000006F4101106F4101B86F41
      01FFEDE7DFFFFEFEFEFFAB916CFFB69F7FFF7F561DFF937040FFFEFEFEFFEDE7
      DFFF6F4101FF6F4101B86F4101140000000000000000000000006F41010C6F41
      01EFEDE7DFFFFEFEFEFFDACFBFFF855E28FF6F4101FFB69F7FFFFEFEFEFFEDE7
      DFFF6F4101EF6F41011000000000000000000000000000000000000000006F41
      01DFEDE7DFFFFEFEFEFF937040FF815820FFBFAB8FFFE5DED2FFFEFEFEFFEDE7
      DFFF6F4101DF0000000000000000000000000000000000000000000000006F41
      01DFEDE7DFFFFEFEFEFFC8B79FFF7A5015FF764A0DFFB29977FFFEFEFEFFEDE7
      DFFF6F4101DF0000000000000000000000000000000000000000000000006F41
      01DFEDE7DFFFFEFEFEFFFEFEFEFFEAE3DAFFE3DBCFFFFEFEFEFFFEFEFEFFEDE7
      DFFF6F4101DF0000000000000000000000000000000000000000000000006F41
      019C987648FFA58860FFA58860FFA58860FFA58860FFA58860FFA58860FF9876
      48FF6F4101B70000000000000000000000000000000000000000000000006F41
      01046F4101206F4101206F4101206F4101206F4101206F4101206F4101206F41
      01206F4101040000000000000000000000008001000080010000800100008001
      0000800100008001000080010000800100008001000080010000C0030000E007
      0000E0070000E0070000E0070000E0070000FFFFFF1F057E0400000000010001
      0010100000010020006804000016000000280000001000000020000000010020
      000000000000040000130B0000130B0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000006F41012C6F4101
      2400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000006F4101606F4101
      FB6F4101946F4101180000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000006F4101606F4101
      FF6F4101FF6F4101F36F41019B6F4101686F4101606F4101606F41017F6F4101
      7F6F41014000000000000000000000000000000000000000006F4101606F4101
      FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101
      F36F4101FF6F4101B76F4101300000000000000000000000006F4101046F4101
      546F4101BF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101DF6F4101
      DF6F4101D86F4101FB6F4101FF6F4101AF6F4101340000000000000000000000
      00000000006F4101406F4101D76F4101FF6F4101FF6F4101EF6F4101CB6F4101
      B76F4101786F4101586F4101B76F4101F36F4101FF6F41014800000000000000
      0000000000000000006F4101086F41013C6F41012000000000000000006F4101
      206F41011800000000000000006F4101086F41011C0000000000000000000000
      000000000000000000000000000000000000000000000000006F41016C6F4101
      CB6F4101A86F4101180000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000006F4101E36F4101
      A36F4101E76F4101B30000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000006F4101346F4101
      B76F4101FF6F4101A00000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000006F4101E76F4101
      DF6F4101686F4101100000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000006F4101C36F4101
      F36F4101F76F4101A30000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000006F4101046F4101
      786F4101686F41010C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FFFF00003FFF00
      000FFF0000001F00000007000000010000E0000000F1990000FF0F0000FF0F00
      00FF0F0000FF0F0000FF0F0000FF0F0000FFFF0000FFFF0000FFFFFF1F057E04
      0000000001000100101000000100200068040000160000002800000010000000
      20000000010020000000000000040000130B0000130B00000000000000000000
      00000000000000000000000000000000000000006F41012C6F4101606F410160
      6F4101586F410124000000000000000000000000000000000000000000000000
      0000000000000000000000006F41013C6F4101CF6F4101FF6F4101FF6F4101FF
      6F4101FF6F4101FF6F4101BF6F41012800000000000000000000000000000000
      00000000000000006F41016C6F4101FB6F4101FF6F4101FF6F4101FF6F4101FF
      6F4101FF6F4101FF6F4101FF6F4101F36F41013C000000000000000000000000
      000000006F4101406F4101F76F4101D36F4101FF6F4101FF6F4101FF6F4101FF
      6F4101FF6F4101FF6F4101FF6F4101FF6F4101EF6F4101200000000000000000
      000000006F4101CC6F4101586F4101B76F4101FF6F4101FF6F4101FF6F4101FF
      6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101A00000000000000000
      6F4101286F4101586F4101AC6F4101FB6F4101786F4101FF6F4101FF6F4101FF
      6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101F76F41010C00000000
      6F4101046F4101AC6F4101FB6F4101606F4101C46F4101F36F4101D36F4101FF
      6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F41013400000000
      6F41015C6F4101FB6F4101606F4101C46F4101F36F4101546F4101DB6F4101BF
      6F41017F6F41017F6F41017F6F41017F6F41017F6F41017F6F41011C00000000
      6F4101506F4101606F4101C46F4101F36F4101546F4101D76F4101E76F410124
      6F4101346F41017F6F41017F6F41017F6F41017F6F41017F6F41017F6F41012C
      000000006F4101C06F4101F36F4101546F4101D76F4101E76F4101506F41015C
      6F41017F6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F41015C
      000000006F41019C6F4101546F4101D76F4101E76F4101506F4101E76F41017F
      6F41017F6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F41012C
      00000000000000006F4101C36F4101E76F4101506F4101E76F4101E76F410124
      6F41017F6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101CF00000000
      00000000000000006F4101386F4101446F4101E76F4101E76F4101486F410164
      6F41017F6F4101FF6F4101FF6F4101FF6F4101FF6F4101FB6F41014000000000
      0000000000000000000000006F4101146F4101906F4101406F4101D76F41017F
      6F41017F6F4101FF6F4101FF6F4101FF6F4101FB6F4101600000000000000000
      00000000000000000000000000000000000000006F4101086F4101346F41011C
      6F41017F6F4101FF6F4101FF6F4101CF6F410138000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6F41012C6F4101606F41012C0000000000000000000000000000000000000000
      F83F0000E00F0000C00700008003000080030000000100000001000000010000
      000000008000000080000000C0010000C0010000E0030000F8070000FF1F0000
      FFFFFF1F057E0400000000010001001010000001002000680400001600000028
      0000001000000020000000010020000000000000040000130B0000130B000000
      0000000000000000000000000000006F4101246F4101506F4101686F41017F6F
      41017F6F41017F6F41017F6F4101746F4101586F4101346F4101080000000000
      000000000000006F4101146F4101DB6F4101FF6F4101FF6F4101FF6F4101FF6F
      4101E16F4101C46F4101FF6F4101FF6F4101FF6F4101FF6F4101F36F41015800
      000000000000006F4101106F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F
      4101BA6F4101C76F4101EF6F4101FF6F4101FF6F4101FF6F4101FF6F41017000
      00000000000000000000006F4101C36F4101FF6F4101FF6F4101FF6F4101EB6F
      4101546F4101976F4101946F4101FF6F4101FF6F4101FF6F4101FF6F4101406F
      41015C00000000000000006F4101346F4101EF6F4101FF6F4101FF6F41019B6F
      41015C6F4101B06F41013C6F4101FF6F4101FF6F4101FF6F4101886F41019C6F
      4101FF6F41012000000000000000006F4101206F41019C6F4101F76F4101506F
      4101486F4101686F4101106F4101EF6F4101C76F4101586F4101846F4101FF6F
      4101E700000000000000000000000000000000000000006F4101146F4101806F
      4101FF6F4101FF6F4101D76F410128000000006F4101B76F4101FF6F4101FB6F
      41016000000000000000000000000000000000000000006F4101246F4101F76F
      4101FF6F4101FF6F4101FF6F41017C000000006F4101746F4101C76F41014400
      00000000000000000000000000000000000000000000006F4101A36F4101FF6F
      4101FF6F4101FF6F4101FF6F4101F76F4101546F4101A56F4101806F41010C00
      00000000000000000000000000000000000000000000006F4101A76F4101FF6F
      4101FF6F4101FF6F4101FF6F4101FB6F41016C6F4101FF6F4101FF6F41019000
      00000000000000000000000000000000000000000000006F41017F6F4101FF6F
      4101FF6F4101FF6F4101FF6F4101DB6F41017F6F4101FF6F4101CB6F41011000
      00000000000000000000000000000000000000000000006F4101546F4101FF6F
      4101FF6F4101FF6F4101FF6F4101906F4101AB6F4101FF6F4101480000000000
      00000000000000000000000000000000000000000000006F4101046F4101B06F
      4101FF6F4101FF6F4101D36F4101386F4101FB6F4101FF6F4101200000000000
      000000000000000000000000000000000000000000000000000000000000006F
      4101346F4101606F41016C6F4101F36F4101FF6F4101FF6F4101140000000000
      000000000000000000000000000000000000000000000000000000000000006F
      4101246F4101F36F4101FF6F4101FF6F4101FF6F4101C3000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006F4101346F4101A36F4101BF6F4101886F41010C000000000000000000
      00000000000000C007000000030000000300008001000080000000C0010000F0
      210000F0230000F0030000F0030000F0030000F0070000F0070000FC070000FC
      0F0000FE0F0000FFFFFF1F057E04000000000100010010100000010020006804
      000016000000280000001000000020000000010020000000000000040000130B
      0000130B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006F41
      01286F4101746F41019F6F410194865F291E74470AAC6F41010875480B3E774B
      0F9C00000000000000000000000000000000000000006F41010C6F4101A06F41
      01FF764A0DFF6F4101FF6F4101C46F410110764A0DB66F4101407246075D7144
      0594000000000000000000000000000000006F41010C6F4101C47D5319FDD3C5
      B2F7AF9672FA6F41017C000000006F4101A06F4101FF6F4101FF6F4101FF6F41
      01FF6F41014C0000000000000000000000006F41019C7D5319FDF2EEE8FAF8F5
      F2F874480AE36F410104000000006F4101DF6F4101FF6F4101FF6F4101FF6F41
      01FF6F41018F00000000000000006F41011C6F4101FB7F561DFB957445EF8963
      2EF76F4101F76F4101DC6F4101286F4101FF6F4101FF6F4101FF6F4101FF6F41
      01FF6F4101CF00000000000000006F410168764A0DFFFEFEFDFDFFFFFFFFAE95
      71F56F4101746F41011C6F4101686F4101FF6F4101FF6F4101FF6F4101FF6F41
      01FF6F4101FF6F410110000000006F41018F815921FDC9B8A0FFC9B8A0FF8F6C
      3AF86F41019F6F4101746F4101306F41019F6F41019F6F41019F6F41019F6F41
      019F6F4101E76F410154000000006F41018F815921FDC9B8A0FFC9B8A0FF926F
      3FF76F41019F6F41017F6F4101386F4101146F41018C00000000000000006F41
      01546F4101786F4101FF6F41016C6F410168764A0DFFFEFEFDFDFFFFFFFFAE95
      71F56F4101746F4101206F4101206F4101586F4101DF6F4101206F4101246F41
      01F36F41013C00000000000000006F41011C6F4101FB7F561DFB957445EF8963
      2EF7825922F9957445EF957445EF86602AF9845D26F9957445EF845D26F96F41
      01FF6F4101380000000000000000000000006F41019C7D5319FDEDE7DFFBF8F5
      F2F89B7C50F5FFFFFFFFFFFFFFFFA78B63F8EAE4DBF7F4F0EBFA865F29FA6F41
      01B4000000000000000000000000000000006F41010C6F4101D37D5319FDD3C5
      B2F7B29977F9DCD1C2F8E6DED3FAA2845BFADED3C4F9845C25FA6F4101D76F41
      011800000000000000000000000000000000000000006F41010C6F41019C6F41
      01FB764A0DFF764A0DFF7A5015FC764A0DFF6F4101FF6F4101B06F4101180000
      0000000000000000000000000000000000000000000000000000000000006F41
      01206F4101706F41019F6F41019F6F41017C6F41013000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000F0070000C0070000810300008103
      0000000300000001000000010000003000000003000000030000800700008007
      0000C00F0000F03F0000FFFF0000FFFFFF1F057E040000000001000100101000
      0001002000680400001600000028000000100000002000000001002000000000
      0000040000130B0000130B000000000000000000000000000000000000000000
      006F4101306F41017F6F41017F6F41017F6F41017F6F41017F6F41017F6F4101
      7F6F41017F6F41013800000000000000000000000000000000000000006F4101
      206F4101F76F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101
      FF6F4101FF6F4101F36F41011C000000000000000000000000000000006F4101
      686F4101FFC7B59CFFC7B59CFF7A5015FFC7B59CFFC7B59CFF784D11FFC9B8A0
      FFC5B39AFF6F4101FF6F41016C000000000000000000000000000000006F4101
      7F6F4101FFEAE3D9FFEEE9E1FF815921FFEEE9E1FFEAE3D9FF7A5015FFEFEAE2
      FFE8E0D6FF6F4101FF6F41017F000000000000000000000000000000006F4101
      7F6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101
      FF6F4101FF6F4101FF6F41017F000000000000000000000000000000006F4101
      7F6F4101FFFDFDFCFFFEFDFDFF865F29FFFEFDFDFFFDFDFCFF7F561DFFFFFFFF
      FFF8F6F2FF6F4101FF6F41017F000000000000000000000000000000006F4101
      7F6F4101FFB59E7DFFB69E7EFF744709FFB69E7EFFB59E7DFF744709FFB7A080
      FFB09773FF6F4101FF6F41017F000000000000000000000000000000006F4101
      7F6F4101FFA68A62FFA78B63FF6F4101FFA78B63FFA68A62FF744709FFA78B63
      FFA08157FF6F4101FF6F41017F000000000000000000000000000000006F4101
      7F6F4101FFFFFFFFFFFFFFFFFF8A6531FFFFFFFFFFFFFFFFFF815921FFFFFFFF
      FFFEFDFDFF6F4101FF6F41017F000000000000000000000000000000006F4101
      7F6F4101FF7F561DFF7F561DFF6F4101FF7F561DFF7F561DFF6F4101FF815921
      FF7D5319FF6F4101FF6F41017F000000000000000000000000000000006F4101
      7F6F4101FFAD926EFBC9B8A0FFC9B8A0FFC9B8A0FFC9B8A0FFC9B8A0FFC9B8A0
      FFA2845AFA6F4101FF6F41017F000000000000000000000000000000006F4101
      7F7D5319FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF6F4101FF6F41017F000000000000000000000000000000006F4101
      7F7B5116FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFEFEFDFD6F4101FF6F41017F000000000000000000000000000000006F4101
      6C6F4101FF9D7E52FAB7A080FFB7A080FFB7A080FFB7A080FFB7A080FFB7A080
      FF947242FA6F4101FF6F410168000000000000000000000000000000006F4101
      246F4101F76F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101
      FF6F4101FF6F4101F76F41012000000000000000000000000000000000000000
      006F4101306F41017F6F41017F6F41017F6F41017F6F41017F6F41017F6F4101
      7F6F41017C6F410130000000000000000000000000E0070000C0030000C00300
      00C0030000C0030000C0030000C0030000C0030000C0030000C0030000C00300
      00C0030000C0030000C0030000C0030000E0070000FFFFFF1F057E0400000000
      0100010010100000010020006804000016000000280000001000000020000000
      010020000000000000040000130B0000130B0000000000000000000000000000
      A4875F469F8056609F8056609F8056609F8056609F8056609F805660A2845C57
      000000006F4101146F41013C6F41011C00000000000000000000000089632E8C
      6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF714304FF8A64317B
      6F4101AC6F4101FF6F4101FF6F4101FF6F4101BF6F41012000000000845C26DF
      74480AFD88622D798B6633778B6633778B663377845C2679896330586F4101C3
      6F4101FF6F4101FF784D11FF6F4101FF6F4101FF6F4101DF6F410110845C26DF
      7D5319F700000000AD926E38AD926E38AD926E38AF95712B6F4101506F4101FF
      6F4101FFBEA98DF7F7F4F0FA7F561DFD6F4101FF6F4101FF6F410178845C26DF
      7D5319F7AE9470326F4101FF6F4101FF6F4101FF845C25D16F4101876F4101FF
      B49C7AFAFFFFFFFFFFFFFFFFDFD5C7FB714405FF6F4101FF6F4101B3845C26DF
      7D5319F700000000AD926E38AD926E38AD926E38AF95712B6F4101836F4101FF
      A3865DFCBCA689F698774AFBFFFFFFFFBCA688F86F4101FF6F4101AF845C26DF
      7D5319F7AD926E386F4101FF6F4101FF6F4101FF74480AFD7B5117536F4101FF
      6F4101FF6F4101FF6F4101FFB49D7BF9C4B197F36F4101FF6F41016C845C26DF
      7D5319F70000000000000000000000000000000000000000B49D7C086F4101B0
      6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101CF6F410108845C26DF
      7D5319F7AE9470326F4101FF6F4101FF6F4101FF6F4101FF774B0FF98D68366F
      6F4101886F4101EB6F4101FF6F4101F76F4101A06F41011000000000845C26DF
      7D5319F700000000AD926E38AD926E38AD926E38AD926E38AD926E38AF95712B
      00000000000000009877495FA4865E3F000000000000000000000000845C26DF
      764A0DFB6F41017F6F41017F8D68355B00000000000000000000000000000000
      00000000000000006F4101FF825A22B7000000000000000000000000835B24CB
      6F4101FF6F4101FF6F4101FF734608FE00000000825A23AA6F4101FF6F4101FF
      815820B1000000006F4101FF825A22B700000000000000000000000097754737
      784D11F66F4101FF6F4101FF6F4101FF00000000AD926E1CAD926E38AD926E38
      AD926E1C000000006F4101FF825A22B700000000000000000000000000000000
      97754737774B0FF56F4101FF6F4101FF8B6633778B6633778B6633778B663377
      8B66337787612C826F4101FF825A22B700000000000000000000000000000000
      00000000A68A6327784D12E66F4101FF6F4101FF6F4101FF6F4101FF6F4101FF
      6F4101FF6F4101FF6F4101FF8A65317600000000000000000000000000000000
      0000000000000000B49D7C08A183595C9F8056609F8056609F8056609F805660
      9F8056609F805660A78B643B0000000000000000000000000000000080470000
      0001000000000000200000000000000020000000000000003E00000000010000
      2067000007E70000042700000427000080070000C0070000E00F0000FFFFFF1F
      057E040000000001000100101000000100200068040000160000002800000010
      00000020000000010020000000000000040000130B0000130B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006F41017F6F4101FF6F4101FF6F4101FF9F8056607D5319F76F
      4101FF6F4101FF7D5319F79F8056606F4101FF6F4101FF6F4101FF6F41017F00
      000000000000006F41017F6F4101FF6F4101FF6F4101FF9F8056607D5319F76F
      4101FF6F4101FF7D5319F79F8056606F4101FF6F4101FF6F4101FF6F41017F00
      000000000000006F41017F6F4101FF6F4101FF6F4101FF9F8056607D5319F76F
      4101FF6F4101FF7D5319F79F8056606F4101FF6F4101FF6F4101FF6F41017F00
      0000006F410128A68A6327784D12E66F4101FF6F4101FF9F8056607D5319F76F
      4101FF714304FF7D5319F79F8056606F4101FF6F4101FF6F4101FF6F41017F00
      0000006F41019F75490C79A68A6327784D12E66F4101FF9F8056607F551DF790
      6C3B7C8E69386B7D5319F79F8056606F4101FF6F4101FF6F4101FF6F41017F00
      000000724405886F4202FF75490C79A68A6327784D12E69F8056609C7C51577A
      50151D74470A2B99794D729F8056606F4101FF6F4101FF6F4101FF6F41017F00
      0000006F410104724507B46F4202FF75490C79A68A6327A2845B387A50151D71
      4405DB704304EA74470A2BA4875F46714304FF6F4101FF6F4101FF6F41017F00
      000000000000006F410104724507B46F4202FF75490C797A50151D714405DB72
      4506EF714304FA704304EA74470A2B8E69386B714304FF6F4101FF6F41017F00
      00000000000000000000006F410104724507B46F4202FF714404EC724506EF7A
      4F143075490C43714405FA704304EA74470A2B8E69386B714304FF6F41017F00
      0000000000000000000000000000006F410104724507B4714406EF7A4F143000
      0000000000000073460840714304F7704304EA74470A2B8E69386B7346087F00
      000000000000000000000000000000000000006F4101046F4101180000000000
      000000000000000000000073460840714304F7704304EA74470A2BAF9673166F
      41010C0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007A4F1430724506EF704304EA75480B6A72
      44069B0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007A4F1430714405F26F4102FF6F
      41019F0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000704304576F4202FE6F4101FF6F
      41019F0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006F4101386F4101406F4101406F
      410128FFFF000080010000800100008001000000010000000100000001000000
      01000080010000C0010000E1810000F3C00000FFE00000FFF00000FFF00000FF
      F00000FFFFFF1F057E0400000000010001001010000001002000680400001600
      0000280000001000000020000000010020000000000000040000130B0000130B
      0000000000000000000000000000000000006F41010C6F4101546F41017F6F41
      017F6F4101746F41013400000000000000000000000000000000000000000000
      00000000000000000000000000006F4101546F4101EB6F4101BF6F41018B6F41
      017F6F4101A36F4101E36F4101BB6F4101100000000000000000000000000000
      00000000000000000000000000006F4101AF6F4101806F4101B36F4101DF6F41
      01DF6F4101CF6F4101906F4101876F4101800000000000000000000000000000
      00000000000000000000000000006F4101A86F4101BF6F4101606F4101306F41
      01206F4101486F4101886F4101E76F41015E6F4101946F4101BF6F41019B6F41
      01400000000000000000000000006F41018C6F41017C6F4101CF6F4101FB6F41
      01FF6F4101EF6F4101AB6F4101646F4101806F4101486F4101686F41017C6F41
      01D36F41017400000000000000006F4101BF6F4101FF6F4101FF6F4101FF6F41
      01FF6F4101FF6F4101FF6F4101FB6F41014B6F4101A86F4101EB6F4101F36F41
      01A36F41019C00000000000000006F4101FF6F4101FF6F4101FF6F4101FF6F41
      01FF6F4101FF6F4101FF6F4101FF6F41018F6F41016C6F41017F6F4101706F41
      018C6F4101B600000000000000006F41018C6F4101FF6F4101FF6F4101FF6F41
      01FF6F4101FF6F4101FF6F4101DB6F41012C6F41017F6F41018B6F4101BF6F41
      01EB6F41018E0000000000000000000000006F41013C6F4101976F4101BF6F41
      01BF6F4101B36F4101906F4101946F4101CF6F4101DF6F4101DF6F4101B36F41
      01806F4101B00000000000000000000000000000000000000000000000000000
      00006F41012C6F4101DB6F4101886F4101446F4101206F4101306F4101606F41
      01C36F4101AE0000000000000000000000000000000000000000000000000000
      00006F41016C6F41014C6F4101AF6F4101EF6F4101FF6F4101FB6F4101CF6F41
      017C6F4101A00000000000000000000000000000000000000000000000000000
      00006F41014F6F4101F76F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F41
      01FF6F4101BE0000000000000000000000000000000000000000000000000000
      00006F4101976F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F41
      01FF6F4101FB0000000000000000000000000000000000000000000000000000
      00006F4101306F4101EB6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F41
      01FF6F4101700000000000000000000000000000000000000000000000000000
      0000000000006F4101146F4101746F4101B36F4101BF6F4101BF6F4101936F41
      013C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0FF0000803F0000803F000080030000800100008001
      00008001000080010000C0010000FC010000FC010000FC010000FC010000FC01
      0000FE030000FFFF0000FFFFFF1F057E04000000000100010010100000010020
      0068040000160000002800000010000000200000000100200000000000000400
      00130B0000130B00000000000000000000633A0124653B01C4653B01C9653B01
      C9653B01C9653B01C9653B01C9653B01C9653B01C9653B01C9653B01C9653B01
      C9653B01C9653B01C9683D01B06F41010C5632014C6F4101FF6F4101FF6F4101
      FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101
      FF6F4101FF6F4101FF6F4101FF6F4101206F41010C6F4101FF6F4101FF6F4101
      FF744709FF784D11FF6F4101FF6F4101FF7D5319FF6F4101FF6F4101FF784D11
      FF764A0DFF6F4101FF6F4101FF6F410120000000006A3E01FC6F4101FF6F4101
      FFC3B196FFE8E1D8FF6F4101FF8D6936FFFDFDFDFF8B6733FF6F4101FFEBE5DE
      FFB69F7EFF6F4101FF6F4101FF6F41012000000000683D01F36F4101FF6F4101
      FFC9B8A0FFE8E1D8FF6F4101FF8F6B39FFFFFFFFFF8F6B39FF6F4101FFECE7E0
      FFB7A080FF6F4101FF6F4101FF6F41012000000000683D01E86F4101FF6F4101
      FF8B6733FF957446FF6F4101FF744709FFA98E68FF744709FF6F4101FF9A7A4E
      FF8C6735FF6F4101FF6F4101FF6F41012000000000663C01C76F4101FF6F4101
      FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101
      FF6F4101FF6F4101FF6F4101FF6F410120000000006F41018B6F4101FF6F4101
      FF683D01F3653B01996E4001FE6F4101FF623901B06B3E01EE6F4101FF663C01
      DA683D01BA6E4101FF6F4101FF6F41012000000000653B017C6F4101FF6F4101
      FF683D01EF00000000653A013E6A3E01E15F38016E5633010F673C01AC643A01
      C900000000643A015D6B3F01F56F41011800000000603801746F4101FF6F4101
      FF683D01EF000000000000000000000000000000000000000000000000523001
      1A00000000000000006F41010800000000000000005F3801696F4101FF6F4101
      FF683D01EF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000573301476F4101FF6F4101
      FF683D01EF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000006F4101045F3701765F3701
      795E3601895431014A5431014A6F41010C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00683D01AE6F4101FF6F4101FF6E4001FE673C01B80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0061390116693D0190673C01D0673C01EE6E4001FE5F37016A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000006339014D683D014A00000000000000
      0000000000000000000000000000000000000000000000000000000000800000
      00800000008000000080000000800000008408000087ED000087FF000087FF00
      0080FF0000F07F0000F03F0000FF3F0000FFFFFF1F057E040000000001000100
      1010000001002000680400001600000028000000100000002000000001002000
      0000000000040000130B0000130B000000000000000000000000000000000000
      0000000000000000000000006F4101086F41018C6F41019F6F41019F6F41019F
      6F41019F6F41019F6F41019F6F4101936F410124000000000000000000000000
      000000000000000000000000000000006F4101346F4101406F4101406F410140
      6F4101406F4101406F4101406F4101986F41019B000000000000000000000000
      000000000000000000000000000000006F4101206F41014C000000006F41017A
      6F41019F6F41019F6F4101816F4101406F41019F000000000000000000000000
      0000000000000000000000006F4101346F4101C06F41015B000000006F410152
      6F4101606F4101606F4101586F4101406F41019F000000000000000000000000
      0000000000000000000000006F4101DB6F4101FF6F41019B6F4101506F41019F
      6F41019F6F41019F6F4101946F4101406F41019F000000000000000000000000
      00000000000000006F4101406F4101FF6F4101FF6F41017C6F4101366F41017F
      6F41017F6F41017F6F4101716F4101406F41019F000000000000000000000000
      00000000000000006F4101A76F4101FF6F4101FB6F41011C0000000000000000
      6F41016B6F41019F6F4101956F4101406F41019F000000000000000000000000
      000000006F4101106F4101F76F4101FF6F4101B3000000000000000000000000
      6F41014A6F41017F6F41016E6F4101406F41019F000000000000000000000000
      000000006F4101386F4101EB6F4101FF6F4101506F4101706F41017F6F41017F
      6F41017F6F41017F6F41017F6F4101CB6F410190000000000000000000000000
      6F4101086F4101DF6F4101AE6F4101846F4101186F4101606F4101606F410160
      6F4101606F4101606F4101606F41015C6F41010C000000000000000000000000
      6F4101586F4101FF6F4101FF6F4101A700000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6F4101BB6F4101FF6F4101FF6F41014C00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000006F410120
      6F4101FF6F4101FF6F4101E36F41010400000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000006F410184
      6F4101FF6F4101FF6F4101840000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000006F410197
      6F4101FF6F4101FB6F4101200000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000006F410118
      6F4101936F410154000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000F8010000FC010000
      FC810000F8810000F8010000F0010000F0C10000E1C10000E0010000C0010000
      C3FF0000C3FF000083FF000087FF000087FF00008FFF0000FFFFFF1F057E0400
      0000000100010010100000010020006804000016000000280000001000000020
      000000010020000000000000040000130B0000130B0000000000000000000000
      000000000000000000000000000000000000006F41011C6F4101BF6F41010400
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000006F4101286F4101E36F4101DB6F4101FF6F4101D76F
      4101E76F41011000000000000000000000000000000000000000000000000000
      00000000000000000000006F41010C6F4101F76F4101F36F4101AB6F4101FB6F
      4101E30000000000000000000000000000000000000000000000000000000000
      00000000000000000000006F4101E76F4101FF6F410170000000006F4101976F
      4101FF6F4101C4000000006F410154000000006F410124000000000000000000
      00000000000000000000006F4101546F4101FF6F4101CB6F4101606F4101DF6F
      4101EF6F4101446F4101406F4101FF6F4101E76F4101E700000000000000006F
      41012B6F4101D3000000006F4101206F4101F76F4101FF6F4101FF6F4101FF6F
      4101EB6F4101586F4101FF6F4101E76F4101B76F4101FF6F4101D36F41010C6F
      4101386F4101EF6F4101576F41017C6F41013C6F4101446F4101FF6F4101246F
      41013C6F4101346F4101FF6F4101786F4101046F4101F36F410197000000006F
      4101276F4101CC6F4101706F41019F6F4101B16F41014F6F41011C0000000000
      0000006F4101586F4101DB6F4101F36F4101D76F4101FF6F4101D30000000000
      000000000000006F4101706F41019F6F4101CF6F4101606F4101EB6F41011C6F
      4101F2000000006F4101646F4101D36F4101DB6F4101906F41010C0000000000
      000000000000006F4101346F4101496F4101CF6F4101606F4101EF6F4101206F
      4101F700000000000000006F41010C6F41011C6F410114000000000000000000
      0000000000000000000000000000006F4101CF6F4101606F4101EF6F4101206F
      4101F70000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000006F4101CF6F4101606F4101EF6F4101206F
      4101F70000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000006F4101B16F41014F6F4101EF6F4101186F
      4101DD0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006F4101EF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006F4101EF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006F4101CC0000000000
      00000000000000000000000000000000000000000000000000000000000000F8
      FF0000E03F0000E07F0000E22B0000E0030000200000000001000001810000C0
      410000C0630000F07F0000F07F0000F07F0000FDFF0000FDFF0000FDFF0000FF
      FFFF1F057E040000000001000100101000000100200068040000160000002800
      00001000000020000000010020000000000000040000130B0000130B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006F4101346F4101406F4101386F4101040000000000000000000000000000
      000000000000000000000000000000000000000000006F4101086F4101606F41
      01D76F4101FF6F4101FF6F4101FF6F4101D36F41011400000000000000000000
      00000000000000000000000000006F4101146F4101786F4101E76F4101FF6F41
      01FF6F4101C36F4101106F4101346F4101EF6F4101A000000000000000000000
      000000000000000000006F4101646F4101F76F4101FF6F4101FF6F4101FF6F41
      01FF6F41016C00000000000000006F4101706F4101FF6F410128000000000000
      0000000000006F41011C6F4101FB6F4101FF6F4101FF6F4101FF6F4101F76F41
      019F6F41011000000000000000006F4101086F4101EF6F41018C000000000000
      0000000000006F4101406F4101FF6F4101FF6F4101D36F41016C6F4101100000
      00006F41013C6F4101986F4101D36F41011C6F4101946F4101E76F4101040000
      0000000000006F4101206F4101936F4101386F4101206F4101086F4101506F41
      01446F4101FB6F4101BB6F410164000000006F4101346F4101FF6F4101500000
      0000000000000000000000000000000000006F4101C36F4101806F4101846F41
      01186F4101086F4101106F4101606F4101906F41010C6F4101DB6F4101AB0000
      0000000000000000000000000000000000006F41017C6F4101DB000000006F41
      01306F4101446F4101F76F4101F36F4101A06F4101046F41017C6F4101F76F41
      010C000000000000000000000000000000006F41011C6F4101FF6F4101446F41
      01AC6F4101246F4101486F4101086F4101086F4101246F4101246F4101FF6F41
      015C00000000000000000000000000000000000000006F4101BF6F41019B0000
      0000000000006F4101286F4101B76F4101F76F4101EF6F41010C6F4101CF6F41
      01AB00000000000000000000000000000000000000006F4101646F4101EF6F41
      01186F4101CC6F4101306F41018F6F4101546F410110000000006F41017C6F41
      01F36F410108000000000000000000000000000000006F41010C6F4101F76F41
      01546F41010C0000000000000000000000006F4101086F4101346F4101986F41
      01FF6F41013800000000000000000000000000000000000000006F4101AB6F41
      01BF6F4101386F41016C6F41019B6F4101CF6F4101FB6F4101FF6F4101FF6F41
      01D36F41012400000000000000000000000000000000000000006F4101486F41
      01FF6F4101FF6F4101FF6F4101D36F4101A36F4101706F41013C6F41010C0000
      0000000000000000000000000000000000000000000000000000000000006F41
      01386F4101306F41010800000000000000000000000000000000000000000000
      000000000000FE1F0000F00F0000C00F000080C7000000C70000020300000023
      0000E0030000E4010000E0010000F3010000F0080000F0E00000F8000000F803
      0000FC7F0000FFFFFF1F057E0400000000010001001010000001002000680400
      0016000000280000001000000020000000010020000000000000040000130B00
      00130B00000000000000000000000000000000000000000000000000006F4101
      206F410118000000006F4101346F4101DB6F4101300000000000000000000000
      00000000000000000000000000000000000000000000000000000000006F4101
      D76F4101D76F41010C6F4101846F4101FF6F4101646F4101046F4101986F4101
      70000000000000000000000000000000000000000000000000000000006F4101
      AF6F4101FF6F4101FB6F4101FF6F4101FF6F4101EF6F4101BF6F4101FF6F4101
      A7000000000000000000000000000000006F4101646F4101BF6F4101646F4101
      E76F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101
      58000000000000000000000000000000006F4101786F4101FF6F4101FF6F4101
      FF6F4101CF6F4101446F4101046F4101046F4101446F4101CF6F4101FF6F4101
      E76F4101BB6F4101EB6F41011000000000000000006F4101B76F4101FF6F4101
      D76F41010C6F41010C6F4101806F41010C000000006F41010C6F4101D76F4101
      FF6F4101FF6F4101CB6F41010C6F4101306F4101646F4101E36F4101FF6F4101
      4C6F41010C6F4101C46F4101FF6F4101C46F41010C000000006F41014C6F4101
      FF6F4101E76F410104000000006F4101D36F4101FF6F4101FF6F4101FF6F4101
      086F4101C46F4101FF6F4101DF6F4101FF6F4101C46F41010C6F4101086F4101
      FF6F4101FF6F4101806F41012C6F4101346F4101786F4101FF6F4101FF6F4101
      086F4101BF6F41018C6F4101046F4101AC6F4101FF6F4101C46F4101106F4101
      FF6F4101FF6F4101FF6F4101C7000000006F4101046F4101E76F4101FF6F4101
      4C0000000000000000000000006F4101046F4101AC6F4101D76F4101546F4101
      FF6F4101E76F4101606F4101306F41010C6F4101CB6F4101FF6F4101FF6F4101
      D76F41010C000000000000000000000000000000006F41010C6F4101D76F4101
      FF6F4101B700000000000000006F41010C6F4101EB6F4101BF6F4101E76F4101
      FF6F4101CF6F4101446F4101046F4101046F4101446F4101CF6F4101FF6F4101
      FF6F4101FF6F410178000000000000000000000000000000006F4101546F4101
      FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101E76F4101
      686F4101BF6F410164000000000000000000000000000000006F4101AB6F4101
      FF6F4101BB6F4101EF6F4101FF6F4101FF6F4101F76F4101FF6F4101B3000000
      000000000000000000000000000000000000000000000000006F4101706F4101
      986F4101046F4101646F4101FF6F4101886F41010C6F4101D76F4101E3000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000006F4101346F4101DF6F410138000000006F4101186F410120000000
      00000000000000000000000000F23F0000F0070000F007000080070000800000
      00C04000000021000000000000000000008700000003C3000000010000E00100
      00E00F0000E00F0000FC4F0000FFFFFF1F057E04000000000100010010100000
      0100200068040000160000002800000010000000200000000100200000000000
      00040000130B0000130B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000006F4101146F4101206F4101206F4101206F4101206F4101206F410120
      6F41011400000000000000000000000000000000000000000000000000000000
      000000006F4101806F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF
      6F41018000000000000000000000000000000000000000006F4101306F410140
      6F4101406F4101446F41018C6F4101CF6F4101FF6F4101FF6F4101CF6F410190
      6F4101406F4101406F4101406F410130000000006F41015C6F4101FF6F4101FF
      6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF
      6F4101FF6F4101FF6F4101FF6F4101FF6F41015C6F41017F7A5015FFF2EEE8F1
      F6F2EEEFF6F2EEEFF6F2EEEFF6F2EEEFF6F2EEEFF6F2EEEFF6F2EEEFF6F2EEEF
      F6F2EEEFF6F2EEEFF2EEE8F17A5015FF6F41017F6F41017F815921FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99794CF4DFD4C5F8FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF815921FF6F41017F6F41017F815921FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFE3DBCEFA6F4101FF9F8056FBFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF815921FF6F41017F6F41017F815921FFFFFFFFFF
      D1C3AEFDA58860FFB39B79FAAD936EFD9A7A4DFB704203FDEFEAE3FDB39B79FA
      A58860FFD1C3AEFDFFFFFFFF815921FF6F41017F6F41017F815921FFFFFFFFFF
      DFD4C6FAB7A080FF825A23FD704203FDE1D7CAF9947243F88E6937F37C5218FA
      B7A080FFDFD4C6FAFFFFFFFF815921FF6F41017F6F41017F815921FFFFFFFFFF
      FFFFFFFFFFFFFFFFE1D8CAFA9B7B4EF7FFFFFFFFD3C5B1F86F4101FFBAA485F9
      FFFFFFFFFFFFFFFFFFFFFFFF815921FF6F41017F6F41017F815921FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBFFA58961FAF1EDE7FD
      FFFFFFFFFFFFFFFFFFFFFFFF815921FF6F41017F6F41017F784D11FFDED4C5F3
      E2D9CCEFE2D9CCEFE2D9CCEFE2D9CCEFE2D9CCEFE2D9CCEFE2D9CCEFE2D9CCEF
      E2D9CCEFE2D9CCEFDED4C5F3784D11FF6F41017F6F41014C6F4101FB6F4101FF
      6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF
      6F4101FF6F4101FF6F4101FF6F4101FB6F41014C000000006F4101146F410120
      6F4101206F4101206F4101206F4101206F4101206F4101206F4101206F410120
      6F4101206F4101206F4101206F41011400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FFFF0000F00F0000F00F0000
      8001000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000080010000FFFF0000FFFFFF1F057E040000000001
      0001001010000001002000680400001600000028000000100000002000000001
      0020000000000000040000130B0000130B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006F4101406F41015C6F41011000000000000000000000000000
      000000000000006F4101306F4101606F41011C00000000000000000000000000
      0000006F4101686F4101EB6F4101C76F4101D36F410104000000000000000000
      0000006F41013C6F4101F36F4101B76F4101EF6F410118000000006F4101286F
      41017F6F4101DB6F41016C000000006F4101EF6F41018F6F41017F6F4101286F
      4101506F4101BF6F410193000000006F4101CB6F4101AB6F4101386F41019F6F
      4101FF6F4101FF6F4101DF6F4101B76F4101FF6F4101FF6F4101FF6F41019F6F
      4101BF6F4101FF6F4101F36F4101A76F4101FB6F4101FF6F41019F6F41019F6F
      4101FF6F4101FF744709FF865F29FF6F4101FF6F4101FF6F4101FF6F41019F6F
      4101BF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F41019F6F41019F6F
      4101FF8A6531FFC5B298FFE6DFD4FF8F6B39FF6F4101FF6F4101FF6F41019F6F
      4101BF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F41019F6F41019F6F
      4101FFAC916CFFC5B298FFDED3C4FFF2EDE7FF6F4101FF6F4101FF6F41019F6F
      4101BF6F4101FF6F4101886F4101606F4101646F4101F36F4101786F41019F6F
      4101FF7F561DFFD9CDBCFFFFFFFFFFD0C1ACFF6F4101FF6F4101FF6F41019F6F
      4101BF6F4101FF6F410140000000006F4101806F4101CF6F4101046F41019F6F
      4101FFB7A080FFFBF9F7FFB7A181FF987749FF6F4101FF6F4101FF6F41019F6F
      4101BF6F4101FF6F4101706F4101546F4101F76F410130000000006F41019F6F
      4101FF8A6531FFE4DCD0FFF8F6F3FFD0C1ACFF6F4101FF6F4101FF6F41019F6F
      4101BB6F4101FF6F4101FF6F4101FF6F41018000000000000000006F41019F6F
      4101FF6F4101FF764A0DFF916E3DFF6F4101FF6F4101FF6F4101FF6F41019F6F
      4101106F4101206F4101206F4101200000000000000000000000006F4101186F
      4101606F4101606F4101606F4101606F4101606F4101606F4101606F41012400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000E3E30000C1C10000080800000000000000000000000000000000000000
      080000000100000003000000070000007F0000FFFF0000FFFF0000FFFFFF1F05
      7E04000000000100010010100000010020006804000016000000280000001000
      000020000000010020000000000000040000130B0000130B0000000000000000
      00000000000000000000B29A780F000000000000000000000000000000000000
      000000000000000000000000000000000000A4865E3FA4865E52000000000000
      000000000000000000007B5015E67F551DC1AA8E692200000000000000000000
      00000000000000000000000000008D69378E6F4101FF744709FF815922C10000
      0000000000000000000087602BA76F4101FF774B0FF98B653263000000000000
      000000000000000000008D69378E6F4101FFB59E7DFFDACFBEFF6F4101FFAF94
      71240000000000000000B29A780F7B5116EB6F4101FF784C10FBB49D7C080000
      0000000000008E69386B714304FF6F4101FF7E551BFF916E3DFF784D12F30000
      0000000000000000000000000000906C3B4380571EEF6F4101FF88622DAE0000
      00009371415B714304FF6F4101FF6F4101FF6F4101FF74480AFD8E6B394D0000
      000000000000000000000000000000000000000000008D69378E6F4101FF8057
      1FBE74480AFD6F4101FF6F4101FF6F4101FF74480AFD8E6B394D000000000000
      000000000000000000000000000000000000000000000000000086602BA26F41
      01FF6F4101FF6F4101FF6F4101FF784D11F69775473700000000000000000000
      00000000000000000000000000000000000000000000A68A6327784D12F36F41
      01FF6F4101FFBDA88BFFB19875FF805820B50000000000000000000000000000
      000000000000AF967316845D26B2764A0DFB6F4101FF764A0DFB6F4101FF6F41
      01FFCCBBA4FFA78B63FFE0D7C9FFB19875FF88622DAE00000000000000000000
      0000000000007E551CD26F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F41
      01FF7E551BFFE9E2D8FFAD946FFFE8E1D6FFB19875FF88622DAE000000000000
      00009E7F54596F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF774B
      0FF993704075835C25FDE9E2D8FFA88D66FFE1D7C9FFB19875FF88622DAE0000
      00008B6633776F4101FF8D693792AD926E38835B24B46F4101FF6F4101FF845C
      26DF000000008E6B394D835C25FDE9E2D8FFA78B63FFE9E2D8FF9E7F54FF9674
      4663957445678D69378E00000000000000008B6633776F4101FF6F4101FF835B
      24DD00000000000000008E6B394D835C25FDE9E2D8FF99784BFF744709FF916D
      3D73000000000000000000000000AF9673167A5015D46F4101FF6F4101FF8C67
      34730000000000000000000000008E6B394D7E551BF9744709FF7A4F15E1AF96
      73160000000000000000B29A780F7A5015D46F4101FF734608FE8A6531980000
      000000000000000000000000000000000000B29A780FAD926E38B49D7C080000
      0000000000000000000000000000A4875F4C9F805660AD926E1C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DFF30000C7E10000C3C00000C1810000E1010000F8030000FC070000F80F
      00008007000080030000000100000080000030C00000E0E00000C1F10000E3FF
      0000FFFFFF1F057E040000000001000100101000000100200068040000160000
      00280000001000000020000000010020000000000000040000130B0000130B00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000006F4101086F4101646F4101975B3501886F4101
      3000000000000000000000000000000000000000000000000000000000000000
      0000000000000000006F4101186F4101D3A4875FF9C9B8A0FFBCA78AFD825922
      F76F410170000000000000000000000000000000000000000000000000000000
      0000000000000000006F4101A8BBA688F8FFFFFFFFFFFFFFFFFFFFFFFFF4F0EB
      FA825922F76F4101306F4101386F4101BB6F4101BF6F4101BF6F4101BF6F4101
      BF6F4101BF6F410118764A0DF7FDFCFBFBEFEAE3FB906C3BF38C6734EFC6B49B
      FCBFAA8EFD683D01876F41019F6F4101AB6F4101406F4101406F4101406F4101
      406F4101406F4101087F561DFFFFFFFFFFD9CCBBEF754A0CF2D9CCBBEFEFEAE3
      FBC7B59CFF6F4101976F41019F6F41017F6F4101806F4101DF6F41012C6F4101
      B86F4101DB6F4101146F4101DBEAE3D9F9E0D7C9F5815921F2FFFFFFFFFFFFFF
      FFA4875FF96F4101646F41019F6F41017F6F41019B6F4101FF6F41013C6F4101
      DB6F4101FF6F41011C6F41015C865F29FAEAE3D9F9F8F6F3FFFEFEFEFDBEA98D
      F76F4101D36F4101086F41019F6F41017F6F41010C6F410120000000006F4101
      146F41011C00000000000000006F41015C6F4101DB7F561DFF764A0DFB6F4101
      AC6F410118000000006F41019F6F41017F6F4101B36F4101FF6F41013C6F4101
      D36F4101FB6F4101186F4101FB6F4101DB000000006F4101186F41011C000000
      0000000000000000006F41019F6F41017F6F41019C6F4101DF6F4101346F4101
      B86F4101DB6F4101146F4101DB6F4101C0000000006F4101406F4101BF000000
      0000000000000000006F41019F6F41019F6F4101406F4101406F4101406F4101
      406F4101406F4101406F4101406F4101406F4101406F4101706F4101BF000000
      0000000000000000006F41019F6F4101FF6F4101FF6F4101FF6F4101FF6F4101
      FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F4101BF000000
      0000000000000000006F41019B6F4101FF6F4101D16F4101B76F4101FF6F4101
      FF6F4101FF6F4101FF6F4101FF6F4101DF6F4101A36F4101FB6F4101BB000000
      0000000000000000006F41012C6F4101AF6F4101BE6F41018C6F4101BF6F4101
      BF6F4101BF6F4101BF6F4101BF6F4101806F4101DF6F41017C6F410140000000
      00000000000000000000000000000000006F4101BF6F41016000000000000000
      000000000000000000000000006F4101286F4101DF0000000000000000000000
      00000000000000000000000000000000006F4101546F41011C00000000000000
      000000000000000000000000006F4101086F41016C0000000000000000000000
      000000000000000000FF830000FF010000FF0000000000000000000000000000
      0000000000098100000027000000270000000700000007000000070000000700
      00CF9F0000CF9F0000FFFFFF1F057E0400000000010001001010000001002000
      6804000016000000280000001000000020000000010020000000000000040000
      130B0000130B000000000000000000000000000000000000000000006F410118
      00000000000000000000000000000000000000006F41010C6F41010800000000
      00000000000000000000000000000000000000006F4101046F4101B86F4101FF
      6F4101DB6F41012400000000000000006F4101786F4101FB6F4101F76F41015C
      000000000000000000000000000000006F4101306F4101706F4101FFB9A283FA
      7A5015FF6F4101936F41018C6F4101506F4101FB9D7D52FD8F6C3AFA6F4101DB
      6F4101646F41019F6F41019F6F4101686F41019B6F4101886F4101FF9B7B4FF9
      714405FF6F4101906F4101F36F4101936F4101EF8F6C3AFA865F29FA6F4101CF
      6F4101B06F4101DF6F4101E36F4101AC6F4101C76F4101C76F4101906F4101DF
      6F4101B36F4101A86F4101FF6F4101F36F41017B6F4101D76F4101CF6F410196
      6F4101DF0000000000000000000000006F4101D76F4101FF6F4101E76F4101A3
      6F4101D36F4101FF6F4101FF6F4101FF6F4101F76F4101AB6F4101B76F4101FB
      6F4101DF0000000000000000000000006F4101AB6F4101FF6F4101FF6F4101FF
      6F4101FF6F4101FF744709FF957445EF957344F36F4101FF6F4101FF6F4101FB
      6F4101DF0000000000000000000000006F4101506F4101FF6F4101FF6F4101FF
      6F4101FF6F4101FFAE936FF9FFFFFFFFDED4C5F86F4101FF6F4101CB6F41019F
      6F4101DF000000000000000000000000000000006F4101306F4101886F4101FF
      B09673F9F7F4F0F1FFFFFFFFFFFFFFFFA98E68F76F4101FF6F4101706F41019F
      6F4101DF00000000000000000000000000000000000000006F4101606F4101FF
      B7A080FFFFFFFFFFFFFFFFFFFDFCFBFB764A0DFF6F4101FB6F4101146F41019F
      6F4101DF00000000000000000000000000000000000000006F4101606F4101FF
      B7A080FFFFFFFFFFFFFFFFFFCDBDA7FB6F4101FF6F4101AF000000006F41019F
      6F4101DF00000000000000000000000000000000000000006F4101606F4101FF
      987749FDE2D9CCEFDED4C5F38D6836FA6F4101FF6F410154000000006F41019F
      6F4101DF00000000000000000000000000000000000000006F4101506F4101FF
      6F4101FF6F4101FF6F4101FF6F4101FF6F4101DF6F410108000000006F41019F
      6F4101DF00000000000000000000000000000000000000006F4101046F41017C
      6F41019F6F41019F6F41019F6F41018C6F41011C00000000000000006F41019F
      6F4101DF00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000006F410188
      6F4101C700000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000006F410104
      6F41010C000000000000000000000000EF9F0000830F00000000000000000000
      0007000000070000000700000007000080070000C0070000C0270000C0270000
      C0270000C0670000FFE70000FFE70000FFFFFF1F057E04000000000100010010
      1000000100200068040000160000002800000010000000200000000100200000
      00000000040000130B0000130B00000000000000000000000000000000000000
      00000000000000000000006F4101106F41017F6F41017F6F41017F6F41017F00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000006F4101206F4101FF6F4101FF6F4101FF6F4101FF00
      0000000000000000000000000000000000000000000000000000006F4101906F
      4101B76F41019F6F4101506F4101206F4101FF6F4101FF6F4101FF6F4101FF00
      0000006F4101706F4101DF6F4101DF6F4101C400000000000000006F4101BF6F
      4101FF6F4101FF6F41017F6F4101206F4101FF6F4101FF6F4101FF6F4101FF00
      0000006F41017F6F4101FF6F4101FF6F4101DF00000000000000006F4101BF6F
      4101FF6F4101FF6F41017F6F4101206F4101FF6F4101FF6F4101FF6F4101FF00
      0000006F41017F6F4101FF6F4101FF6F4101CB00000000000000006F4101BF6F
      4101FF6F4101FB6F4101586F4101AB6F4101FF6F4101FF6F4101FF6F4101FF6F
      4101B36F4101346F4101F76F4101FF6F4101CB000000006F4101306F4101FB6F
      4101FF6F4101C76F41017F6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F
      4101FF6F4101746F4101DF6F4101FF6F4101FF6F41015C6F41019B6F4101FF6F
      4101FF6F4101BF6F41017F6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F
      4101FF6F41017F6F4101DF6F4101FF6F4101FF6F41019F6F41019F6F4101FF6F
      4101FF6F4101BF6F41017F6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F
      4101FF6F41017F6F4101DF6F4101FF6F4101FF6F41019F6F41019F6F4101FF6F
      4101FF6F4101BF6F41017F6F4101FF6F4101FF6F4101FF6F4101FF6F4101FF6F
      4101FF6F41017F6F4101E36F4101FF6F4101FF6F41019F6F4101976F4101FF6F
      4101FF6F4101D76F4101786F4101FF6F4101FF6F4101B86F4101C36F4101FF6F
      4101FF6F4101786F4101FF6F4101FF6F4101FF6F4101746F4101146F4101606F
      4101786F4101706F4101146F41015C6F4101606F4101106F4101186F4101606F
      41015C6F4101086F4101306F41013C6F41011C00000000000000006F41015C6F
      4101FF6F4101F36F410120000000006F41014C6F4101EB6F4101E76F41013800
      0000006F4101206F4101F36F4101FF6F41015400000000000000006F4101936F
      4101FF6F4101FF6F41013C000000006F4101BB6F4101FF6F4101FF6F4101B700
      0000006F4101446F4101FF6F4101FF6F41019300000000000000006F4101246F
      4101AF6F4101906F410104000000006F4101A46F4101FF6F4101FF6F41019800
      0000006F4101046F4101906F4101AB6F41011C00000000000000000000000000
      0000000000000000000000000000006F41010C6F4101786F4101706F41010C00
      0000000000000000000000000000000000000000000000F83F0000F83F000080
      2100008021000080210000800100000000000000000000000000000000000000
      00000000010000842100008421000084210000FC3F0000FFFFFF1F057E040000
      0000010001001010000001002000680400001600000028000000100000002000
      0000010020000000000000040000232E0000232E000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009A9EB14062729DBF364C90FF0A217CFF0A217CFF39478BFF626593BFABAB
      B97F00000000000000000000000000000000000000000000000000000000667A
      9D7F115FA5FF0071C9FF006DCFFF0066CEFF0060CAFF0053BFFF0044A2FF0834
      83FF6D6D93BF0000000000000000000000000000000000000000000000006978
      9C7F0794D3FF1DB3F1FF08A3EDFF0091E5FF008BE3FF0080DCFF0067B7FF0052
      9DFF393975FF0000000000000000000000000000000000000000000000000000
      0000429BCAFF6DD4FDFF38A3DBFF0073B7FF0098DAFF0096DBFF0079C9FF003D
      91FF3E3E797F0000000000000000000000000000000000000000000000000000
      00007DA0BBBF52BCE9FF00408DFF1E93CEFF2CB1F1FF046AB2FF0069ACFF1E42
      82FFB4B4BD400000000000000000000000000000000000000000000000000000
      0000000000006994B6BF1A64A5FF50C1FAFF2EB6F5FF1192DBFF3A71A0FF6E74
      9740000000007D7D7D40727272FF636363FF9595957F00000000000000000000
      000000000000A6B4C94082C6E5FF6EE1FFFF46C9FEFF1CA8EBFF4093D17F0000
      0000D4D4D47F353535FF2B2B2BFF494848FF82A1A4FF766B6940000000000000
      0000000000005E9FD47F62BBEAFF6DA7CFFF288DCAFF0492D9FF2D79B7FF9292
      9DFF69615AFF1A1A1AFF242424FF2F3131FF6B8D90FF726E6EFFB1B0B0400000
      000000000000363E7C7F003A86FF001A71FF003D88FF0065A2FF4F7EA4FFDFC3
      C1FF988180FF242828FF4B3E3BFF9B6656FFCF7359FFAEA6A0FFC1CACB7F0000
      0000000000008F8FA37F031B75FF003D8CFF0069A9FF0176B3FFBEBCC8FFEACA
      CAFF9B8B8CFF6D5953FFFFCBB0FF9F8377FFEAAB93FFCE9881FF5757577F0000
      00000000000000000000757B9BBF1B4C8CFF1268A0FF8AA9C1FFFAE5E6FFE4C5
      C5FFE0CECFFF343230FF4E4D4DFF34393AFF877971FFB6A79FFF7D7D7D7F0000
      00000000000000000000BAA89A7FF3E6E0FFFFFFFFFFFFFDFEFFF9E4E5FFF0D7
      D8FFFBF3F4FFD3D2D2FF717274FF343636FF4E4F4FFF6F6E6EBF000000000000
      00000000000000000000B8A2927FDFCCC1FFF2E1DEFFF8E4E8FFF8E1E5FFF8E9
      E8FFE8D8CDFFE0D1C5FFDCD1C8FFB1A69EBFC9C9C94000000000000000000000
      0000000000000000000000000000CBCBCB40BCAA9C7FC3A28B7FBB9B857FB8A2
      927FC7C2BE7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000807F0000003F0000003F0000803F0000803F0000C0430000C0810000C000
      0000C0000000C0000000E0000000E0010000E0030000F03F0000FFFF0000FFFF
      FF1F057E04000000000100010010100000010020006804000016000000280000
      001000000020000000010020000000000000040000232E0000232E0000000000
      0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF
      00FF00FF00FF00FF00A3B9D4FF5B86B9FF98AFC8FFFF00FF00FF00FF00FF00FF
      00FF00FF0039552CFF1C1A1CFF1B1C1CFF1B1C1CFF1B1C1CFF323435FF3C4B5D
      FF60A3CDFF6B9DD6FF6BA3E1FF6699D4FF487CB8FF5483B9FF456082FF2B6F4F
      FF1D762EFF357E31FF1A2B1EFF1E1D1EFF1E1E1EFF1E1E1EFF515E6EFF76A8E0
      FF7EB3EDFF7CB1ECFF7CB1EBFF72A6E2FF5791D6FF5A94D7FF5B94D6FF5B8FCC
      FF558771FF36862EFF057F1DFF17381EFF1E1B1EFF1E1E1EFF4E5C6EFF85B6EB
      FF90C0F6FF8FBFF6FF90C0F7FF80B3EAFF67A1E4FF69A2E4FF69A2E4FF629BDD
      FF568678FF368A2CFF06861AFF07871AFF0F621BFF1C281DFF4F5B6EFF90C0EE
      FF9CCAFEFF9CCAFEFF9CCBFEFF8DBDF3FF79B0EEFF7AB0EDFF7AB0EDFF72A9E6
      FF558778FF379129FF098F16FF098F15FF099015FF098D15FF488C6BFF92C1EF
      FF9ECCFEFF9DCAFBFF9ECAF8FF99C6F4FF76A4D7FF82B4E7FF8FC1F6FF84B6EC
      FF558977FF379626FF0B9811FF0B9811FF0C9711FF0B9811FF4D9F69FF92BEE5
      FFA9D9FBFFAADFFEFFA8E0FFFFA4DAFBFF98CAF1FF6C96BAFF7EAAD7FF84B1E0
      FF578A76FF399D23FF0EA10DFF0EA00DFF0EA10DFF146B14FF2B4C2DFF5A6873
      FF789BB4FF92C5E3FF94C9EFFFA4DBFAFF9ACCEBFF96C1E1FF71AFAAFF5CA180
      FF359637FF3AA220FF10A809FF10A809FF14850EFF1E151FFF1E1D1EFF1E1B1A
      FF176A72FF232023FF4D575EFF42A165FF48AE53FF18AA15FF15AA0FFF10A809
      FF229B19FF3CA61EFF12AF06FF12AF06FF12AE06FF186711FF1B4317FF1D2D19
      FF174E51FF1A3940FF1B3638FF195A13FF149D09FF12AF06FF12AF06FF12AF06
      FF249F17FF3DAB1CFF14B502FF14B603FF14B502FF14B702FF14BB02FF14B802
      FF15AB03FF178707FF1B3A2AFF16585DFF1E221BFF15B303FF14B603FF14B602
      FF25A416FF5CAE33FF3BB921FF3BB921FF3BB921FF3BB921FF3BB921FF3BB921
      FF3BB921FF3BB921FF405734FF3C6853FF3E8624FF3BBA21FF3BB921FF3BB921
      FF44A82FFFEEC695FFFFD5A1FFFFD5A1FFFFD5A1FFFFD5A2FFFFD5A2FFFFD4A2
      FFFFD5A2FFFFD5A2FFFFD5A2FFFFD4A2FFFFD4A2FFE8D2A9FFB0DBCCFFDDD2AF
      FFE0C397FFEEC99AFFFFD8A8FFFFD8A9FFFFD8A9FFFFD8A9FFFFD8A8FFFFD8A9
      FFFFD8A9FFFFD7A9FFFFD7A8FFFFD8A9FFFBD6A8FF67DDEFFF13DAFFFF4FDFF8
      FFD6C3A0FFEECC9EFFFFDBAFFFFFDBAFFFFFDAAFFFFFDBAFFFFFDAAFFFFFDBAF
      FFFFDBAFFFFFDAAFFFFFDBAFFFFFDAAFFFFBDAAEFF64D6F2FF11C3FFFF4CD4FA
      FFD6C5A5FFE3C297FFEECCA2FFEECCA1FFEECCA2FFEECCA2FFEECCA2FFEECCA2
      FFEECCA2FFEECCA1FFEECCA2FFEECCA1FFEECCA1FFD5C9AAFF8AC3C9FFCAC8AF
      FFDAC39EFFFF8F00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FFFFFF1F047501000089504E470D0A1A0A0000000D494844520000
      00100000001008060000001FF3FF61000000097048597300000EC300000EC301
      C76FA8640000012749444154388D9593BF51C33018C57F4E47156782B0018C60
      2A55086F803241C200BACBA1054C434B32013955A8F308C90619012630853FFB
      9458F6C1BB73F1BD7B7ADF5F674DD3700DED420954C01278F156550391204B19
      884905AC255C78ABBE53BA59E2E141BB507AAB36117D3F56C1C000C8814FEDC2
      39E2CA5103ED4225DFAD705DBFCB4867B40BC92A6692710D6C01BC550760013C
      006FA29B0375CA247B7CFDEA269E0385B7EA180BB40B06F890F0E75AD36F41BB
      B0912AFE6572B146115640413B79E3AD2AA64C067720C277E006D87BABCC5425
      A935228F019EB50BBB8EF456ED80958473A04E196C817D144F999CA74EF908DC
      45D4453B1DC65A807690A728B39133CFFF64203F4F019CBC559976A1019E68EF
      A5C7680B1D24634DDBCE4A66D0E317E91487000187C6AF0000000049454E44AE
      426082}
  end
end
