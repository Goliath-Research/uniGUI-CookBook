object FrmCCManual: TFrmCCManual
  Left = 233
  Top = 171
  HelpContext = 5668
  ClientHeight = 402
  ClientWidth = 625
  Caption = 'Manual Transaction'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 348
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 623
      Height = 346
      Hint = ''
      ActivePage = TabTransaction
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabCustomer: TUniTabSheet
        Hint = ''
        ImageIndex = 2
        Caption = 'Customer'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object PnlClient01: TUniPanel
          Tag = 1999
          Left = 0
          Top = 60
          Width = 615
          Height = 258
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter3: TUniSplitter
            Left = 127
            Top = 0
            Width = 6
            Height = 258
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 127
            Height = 256
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label13: TUniLabel
              Left = 8
              Top = 12
              Width = 57
              Height = 13
              Hint = ''
              Caption = 'Customer #'
              TabOrder = 1
            end
            object Label22: TUniLabel
              Left = 8
              Top = 36
              Width = 45
              Height = 13
              Hint = ''
              Caption = 'Company'
              TabOrder = 2
            end
            object Label3: TUniLabel
              Left = 8
              Top = 60
              Width = 97
              Height = 13
              Hint = ''
              Caption = 'Shipping Destination'
              TabOrder = 3
            end
            object lblCurrency: TUniLabel
              Left = 8
              Top = 84
              Width = 44
              Height = 13
              Hint = ''
              Caption = 'Currency'
              TabOrder = 4
            end
            object lblEPlant: TUniLabel
              Left = 8
              Top = 108
              Width = 30
              Height = 13
              Hint = ''
              Caption = 'EPlant'
              TabOrder = 5
            end
          end
          object PnlClient02: TUniPanel
            Left = 133
            Top = 1
            Width = 482
            Height = 256
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitLeft = 130
            ExplicitWidth = 487
            ExplicitHeight = 258
            DesignSize = (
              482
              256)
            object sbtnSelectEPlant: TUniSpeedButton
              Left = 200
              Top = 104
              Width = 23
              Height = 22
              Hint = 'Select'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFDDDDD00000000
                00DDDDDD7777777777FDDDDD0FFFFFFFF0DDDDDD7FDDDDDDD7FDDDDD0FFFFFFF
                F0DDDDDD7FDDDDDDD7FDDDDD0FF80FFFF0DDDDDD7FD87FDDD7FDDDDD0F800FFF
                F0DDDDDD7F877FDDD7FDDDDD080B0FFFF0DDDDDD787F7DDDD7FDDDDD00B0FFFF
                F0DDDDDD77F7DDDDD7FDDDDD0B0FFFFFF0DDDDDD7F7DDDDDD7FDDDD0B0FFFFFF
                F0DDDDD7F7DDDDDDD7FDDD0B0FFFFFFFF0DDDD7F7FDDDDDDD7FDD0B07FFFFFFF
                F0DDD7F77FFFFFFFF7FDD90D0000000000DDD77D7777777777DDDDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
              Caption = ''
              ParentColor = False
              Color = clWindow
            end
            object dbeCustno: TUniEdit
              Left = 1
              Top = 8
              Width = 185
              Height = 21
              Hint = ''
              MaxLength = 30
              Text = ''
              TabOrder = 0
              ReadOnly = True
            end
            object txtArcustoCompany: TUniEdit
              Left = 1
              Top = 32
              Width = 481
              Height = 21
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Color = clBtnFace
              ReadOnly = True
            end
            object edtShipTo: TUniEdit
              Left = 1
              Top = 56
              Width = 197
              Height = 21
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              Text = ''
              TabOrder = 2
              Color = clBtnFace
              ReadOnly = True
            end
            object btnShipTo: TIQWebDropDownButton
              Left = 200
              Top = 56
              Width = 37
              Height = 25
              Hint = ''
              Caption = ''
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
              TabOrder = 7
              OnClick = DoSelectShipToByCustomer
            end
            object cmbCurrency: TUniDBLookupComboBox
              Left = 1
              Top = 80
              Width = 193
              Height = 21
              Hint = ''
              ListFieldIndex = 0
              TabOrder = 4
              Color = clWindow
            end
            object edtEPlantName: TUniEdit
              Left = 1
              Top = 104
              Width = 193
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 5
              Color = clBtnFace
              ReadOnly = True
            end
          end
        end
        object CaptionPanel1: TIQWebCaptionPanel
          Left = 0
          Top = 0
          Width = 615
          Height = 60
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = 'Customer'
          ParentColor = True
          Text = 
            'Please select a customer.  Although you can skip this step, a cu' +
            'stomer is required for certain fields.'
          PictureLayout = plImageRight
          LayoutStyle = lsBasic
          DesignSize = (
            615
            60)
        end
      end
      object TabCreditCard: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Credit Card'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object PnlFormCarrierCC: TUniPanel
          Tag = 1999
          Left = 0
          Top = 60
          Width = 615
          Height = 258
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 127
            Top = 41
            Width = 6
            Height = 217
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft02: TUniPanel
            Tag = 1999
            Left = 1
            Top = 41
            Width = 127
            Height = 217
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label14: TUniLabel
              Left = 8
              Top = 4
              Width = 95
              Height = 13
              Hint = ''
              Caption = 'Credit Card Number'
              TabOrder = 1
            end
            object lblExpDate: TUniLabel
              Left = 8
              Top = 52
              Width = 74
              Height = 13
              Hint = ''
              Caption = 'Expiration Date'
              TabOrder = 2
            end
            object Label17: TUniLabel
              Left = 8
              Top = 76
              Width = 94
              Height = 13
              Hint = ''
              Caption = 'Card Billing Address'
              TabOrder = 3
            end
            object lblCardBillingPostalCode: TUniLabel
              Left = 8
              Top = 100
              Width = 112
              Height = 13
              Hint = ''
              Caption = 'Card Billing Postal Code'
              TabOrder = 4
            end
            object lblType: TUniLabel
              Left = 8
              Top = 28
              Width = 24
              Height = 13
              Hint = ''
              Caption = 'Type'
              TabOrder = 5
            end
          end
          object PnlFormCarrierCCClient: TUniPanel
            Tag = 1999
            Left = 133
            Top = 41
            Width = 482
            Height = 217
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitLeft = 130
            ExplicitWidth = 487
            ExplicitHeight = 219
            DesignSize = (
              482
              217)
            object lblMMYY: TUniLabel
              Left = 48
              Top = 52
              Width = 40
              Height = 13
              Hint = ''
              Caption = '(MM/YY)'
              TabOrder = 7
            end
            object txtCardNumber: TUniEdit
              Left = 1
              Top = 1
              Width = 186
              Height = 21
              Hint = ''
              MaxLength = 20
              Text = ''
              TabOrder = 0
              OnExit = txtCardNumberExit
            end
            object edtCustomerAddress: TUniEdit
              Left = 1
              Top = 72
              Width = 480
              Height = 21
              Hint = ''
              MaxLength = 250
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object cmbCreditCardType: TUniDBLookupComboBox
              Left = 1
              Top = 24
              Width = 186
              Height = 21
              Hint = ''
              ListFieldIndex = 0
              TabOrder = 1
              Color = clWindow
            end
            object mskExpDate: TUniEdit
              Left = 1
              Top = 48
              Width = 38
              Height = 21
              Hint = ''
              MaxLength = 5
              Text = '  /  '
              TabOrder = 2
              OnChange = mskExpDateChange
            end
            object edtCustomerZip: TUniEdit
              Left = 1
              Top = 96
              Width = 121
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 4
            end
            object chkUpdateExpDate: TUniCheckBox
              Left = 106
              Top = 50
              Width = 97
              Height = 17
              Hint = 'Update the expiration date on the customer record.'
              ShowHint = True
              ParentShowHint = False
              Checked = True
              Caption = 'Update'
              TabOrder = 5
            end
          end
          object PnlEntryOption: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 613
            Height = 41
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Caption = ''
            object Bevel2: TUniPanel
              Left = 1
              Top = 38
              Width = 611
              Height = 3
              Hint = ''
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 2
              Caption = ''
            end
            object rgEntryOption: TUniRadioGroup
              Left = 1
              Top = 1
              Width = 611
              Height = 38
              Hint = ''
              Items.Strings = (
                'Customer Record'
                'Manual')
              ItemIndex = 0
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              Caption = ' Entry Option '
              TabOrder = 0
              Columns = 2
              OnClick = rgEntryOptionClick
            end
          end
        end
        object CaptionPanel2: TIQWebCaptionPanel
          Left = 0
          Top = 0
          Width = 615
          Height = 60
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = 'Credit Card'
          ParentColor = True
          Text = 
            'Either select credit card information from the pick list, or ent' +
            'er credit card data manually.'
          PictureLayout = plImageRight
          LayoutStyle = lsBasic
          DesignSize = (
            615
            60)
        end
      end
      object TabSpecial: TUniTabSheet
        Hint = ''
        ImageIndex = 3
        Caption = 'Special Fields'
        object PnlSpecialFieldsMain: TUniPanel
          Tag = 1999
          Left = 0
          Top = 60
          Width = 615
          Height = 258
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter4: TUniSplitter
            Left = 127
            Top = 0
            Width = 6
            Height = 258
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft03: TUniPanel
            Left = 1
            Top = 1
            Width = 127
            Height = 256
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label1: TUniLabel
              Left = 8
              Top = 4
              Width = 46
              Height = 13
              Hint = ''
              Caption = 'Invoice #'
              TabOrder = 1
            end
            object Label2: TUniLabel
              Left = 8
              Top = 28
              Width = 39
              Height = 13
              Hint = ''
              Caption = 'Order #'
              TabOrder = 2
            end
            object Label10: TUniLabel
              Left = 8
              Top = 52
              Width = 25
              Height = 13
              Hint = ''
              Caption = 'PO #'
              TabOrder = 3
            end
            object lblTransactionDescription: TUniLabel
              Left = 8
              Top = 76
              Width = 112
              Height = 13
              Hint = ''
              Caption = 'Transaction Description'
              TabOrder = 4
            end
          end
          object PnlSpecialFieldsClient: TUniPanel
            Left = 133
            Top = 1
            Width = 482
            Height = 256
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object sbtnClearTransactionDescription: TUniSpeedButton
              Left = 192
              Top = 72
              Width = 22
              Height = 22
              Hint = 'Clear'
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
              OnClick = sbtnClearTransactionDescriptionClick
            end
            object dbeInvoiceNo: TUniEdit
              Left = 1
              Top = 1
              Width = 186
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 0
              Color = clBtnFace
              ReadOnly = True
            end
            object dbeOrderNo: TUniEdit
              Left = 1
              Top = 24
              Width = 186
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 1
              Color = clBtnFace
              ReadOnly = True
            end
            object dbePONO: TUniEdit
              Left = 1
              Top = 48
              Width = 186
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 2
              Color = clBtnFace
              ReadOnly = True
            end
            object edtTransactionDescription: TUniEdit
              Left = 1
              Top = 72
              Width = 186
              Height = 21
              Hint = ''
              MaxLength = 125
              Text = ''
              TabOrder = 3
            end
            object btnTSysLevelAddendum: TUniButton
              Left = 1
              Top = 96
              Width = 137
              Height = 25
              Hint = ''
              Caption = 'Level 3 Addendum'
              TabOrder = 6
              OnClick = btnTSysLevelAddendumClick
            end
          end
        end
        object cpSpecial: TIQWebCaptionPanel
          Left = 0
          Top = 0
          Width = 615
          Height = 60
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = 'Special Fields'
          ParentColor = True
          Text = 'Select optional data for this transaction.'
          PictureLayout = plImageRight
          LayoutStyle = lsBasic
          DesignSize = (
            615
            60)
        end
      end
      object TabTransaction: TUniTabSheet
        Hint = ''
        Caption = 'Transaction'
        object PnlTransactionMain: TUniPanel
          Tag = 1999
          Left = 0
          Top = 60
          Width = 615
          Height = 258
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 147
            Top = 0
            Width = 6
            Height = 258
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft04: TUniPanel
            Left = 1
            Top = 1
            Width = 147
            Height = 256
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              147
              256)
            object Label4: TUniLabel
              Left = 8
              Top = 12
              Width = 92
              Height = 13
              Hint = ''
              Caption = 'Authorized Amount'
              TabOrder = 1
            end
            object Label5: TUniLabel
              Left = 8
              Top = 108
              Width = 78
              Height = 13
              Hint = ''
              Caption = 'Date Authorized'
              TabOrder = 2
            end
            object Label6: TUniLabel
              Left = 8
              Top = 132
              Width = 67
              Height = 13
              Hint = ''
              Caption = 'Authorized By'
              TabOrder = 3
            end
            object Bevel10: TUniPanel
              Left = 8
              Top = 154
              Width = 138
              Height = 3
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
              Caption = ''
            end
            object lblTransactionID: TUniLabel
              Left = 8
              Top = 164
              Width = 121
              Height = 13
              Hint = ''
              Caption = 'Transaction/Reference #'
              TabOrder = 5
            end
            object lblApprovalCode: TUniLabel
              Left = 8
              Top = 188
              Width = 71
              Height = 13
              Hint = ''
              Caption = 'Approval Code'
              TabOrder = 6
            end
            object lblTax: TUniLabel
              Left = 8
              Top = 36
              Width = 18
              Height = 13
              Hint = ''
              Caption = 'Tax'
              TabOrder = 7
            end
            object lblFreight: TUniLabel
              Left = 8
              Top = 84
              Width = 34
              Height = 13
              Hint = 'Shipping and Handling'
              ShowHint = True
              ParentShowHint = False
              Caption = 'Freight'
              TabOrder = 8
            end
          end
          object PnlTransactionClient: TUniPanel
            Left = 153
            Top = 1
            Width = 462
            Height = 256
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              462
              256)
            object Bevel4: TUniPanel
              Left = 1
              Top = 154
              Width = 410
              Height = 3
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 11
              Caption = ''
            end
            object sbtnSelectEmployee: TUniSpeedButton
              Left = 200
              Top = 128
              Width = 23
              Height = 22
              Hint = 'Select Employee'
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
              OnClick = DoSelectEmployee
            end
            object Label7: TUniLabel
              Left = 1
              Top = 208
              Width = 340
              Height = 13
              Hint = ''
              Caption = 
                'Has this transaction already been settled (captured) by the proc' +
                'essor?'
              TabOrder = 13
            end
            object edtAmount: TUniEdit
              Left = 1
              Top = 8
              Width = 96
              Height = 21
              Hint = ''
              Text = '0.00'
              TabOrder = 0
              OnExit = edtAmountExit
            end
            object cmbDate: TUniDateTimePicker
              Left = 1
              Top = 104
              Width = 93
              Height = 21
              Hint = ''
              DateTime = 42677.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              TabOrder = 4
            end
            object dbeAuthorizedBy: TUniEdit
              Left = 1
              Top = 128
              Width = 193
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 6
              Color = clBtnFace
              ReadOnly = True
            end
            object edtTransactionID: TUniEdit
              Left = 1
              Top = 160
              Width = 193
              Height = 21
              Hint = ''
              MaxLength = 30
              Text = ''
              TabOrder = 7
            end
            object edtApprovalCode: TUniEdit
              Left = 1
              Top = 184
              Width = 193
              Height = 21
              Hint = ''
              MaxLength = 30
              Text = ''
              TabOrder = 8
            end
            object cmbTime: TUniDateTimePicker
              Left = 96
              Top = 104
              Width = 105
              Height = 21
              Hint = ''
              DateTime = 42677.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              TabOrder = 5
            end
            object edtTax: TUniEdit
              Left = 1
              Top = 32
              Width = 96
              Height = 21
              Hint = ''
              Text = '0.00'
              TabOrder = 1
              OnExit = edtTaxExit
            end
            object chkTaxExempt: TUniCheckBox
              Left = 1
              Top = 56
              Width = 81
              Height = 17
              Hint = 
                'Check this box if the purchasing card qualifies for tax exempt s' +
                'tatus.'
              ShowHint = True
              ParentShowHint = False
              Caption = 'Tax Exempt'
              TabOrder = 2
            end
            object edtFreight: TUniEdit
              Left = 1
              Top = 80
              Width = 96
              Height = 21
              Hint = ''
              Text = '0.00'
              TabOrder = 3
              OnExit = edtFreightExit
            end
            object chkSettled: TUniCheckBox
              Left = 1
              Top = 224
              Width = 118
              Height = 17
              Hint = ''
              Caption = 'Yes, flag transaction as settled.'
              TabOrder = 9
            end
          end
        end
        object CaptionPanel4: TIQWebCaptionPanel
          Left = 0
          Top = 0
          Width = 615
          Height = 60
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = 'Transaction'
          ParentColor = True
          Text = 
            'Enter transaction information.  You will need to obtain transact' +
            'ion codes from your gateway.'
          PictureLayout = plImageRight
          LayoutStyle = lsBasic
          DesignSize = (
            615
            60)
        end
      end
      object TabFinish: TUniTabSheet
        Hint = ''
        ImageIndex = 4
        Caption = 'TabFinish'
        object CaptionPanel5: TIQWebCaptionPanel
          Left = 0
          Top = 0
          Width = 615
          Height = 60
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = 'Done.'
          ParentColor = True
          Text = 'Click Finish to complete the process.'
          PictureLayout = plImageRight
          LayoutStyle = lsBasic
          DesignSize = (
            615
            60)
        end
        object PnlFinish: TUniPanel
          Tag = 1999
          Left = 0
          Top = 60
          Width = 615
          Height = 258
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
        end
      end
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 348
    Width = 625
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsRight: TUniPanel
      Left = 196
      Top = 1
      Width = 429
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnClose: TUniBitBtn
        Left = 4
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Close'
        Cancel = True
        TabOrder = 0
        OnClick = btnCloseClick
      end
      object btnBack: TUniBitBtn
        Left = 115
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Glyph.Data = {
          46010000424D460100000000000076000000280000001A0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888800000088888808888888888887F88888000000888880088888
          88888877F8888800000088880608888888888787FFFFF8000000888066000008
          888878877777F8000000880666666608888788888887F8000000806666666608
          8878F8888887F800000088066666660888878F88FFF7F8000000888066000008
          888878F777778800000088880608888888888787F88888000000888880088888
          88888877F8888800000088888808888888888887888888000000888888888888
          88888888888888000000}
        Caption = '&Back'
        TabOrder = 1
        OnClick = DoWizardBtnClick
      end
      object btnNext: TUniBitBtn
        Tag = 1
        Left = 220
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Glyph.Data = {
          46010000424D460100000000000076000000280000001A0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888F8888800000088888808888888888887FF8888000000888888008888
          8888888778F8880000008888880608888888FFF7F78F88000000880000066088
          888777778878F80000008806666666088887F88888878F000000880666666660
          8887F8888888780000008806666666088887FFFFF88788000000880000066088
          88877777F8788800000088888806088888888887F78888000000888888008888
          8888888778888800000088888808888888888887888888000000888888888888
          88888888888888000000}
        Caption = '&Next'
        TabOrder = 2
        OnClick = DoWizardBtnClick
      end
      object btnFinish: TUniBitBtn
        Tag = 2
        Left = 324
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Finish'
        TabOrder = 3
        Default = True
        OnClick = DoWizardBtnClick
      end
    end
  end
  object StatusBar: TUniStatusBar
    Left = 0
    Top = 383
    Width = 625
    Height = 19
    Hint = ''
    Panels = <
      item
        Width = 400
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object CardTypeImageList: TUniImageList
    Left = 128
    Top = 352
    Bitmap = {
      494C01010D001100080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008060400080202000802020008040
      2000C0402000C040200080402000802020008020200080204000402060004020
      6000400020004000000040000000804040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008040200080202000C0402000C040
      2000C0402000C0402000C0402000C04020004020A0004020E0004020E0000020
      E0000020E0004000800040000000802020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080404000C0402000C0602000C060
      2000C0602000C0602000C0602000804060008020A0004020E0004020E0000020
      E0000020E0000020E00000008000802020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0604000C0602000C0602000C060
      2000C0602000C0602000C060400080408000804080004020C0004020E0004020
      E0000020E0000020E0000020E000402040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0604000C0602000C0C0A000C0C0
      A000C0DCC000C0DCC000C0C0A000C0C0A000C0A08000C0C0C0008080C0008080
      C00080A0C00080A0C0000020E000404080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0604000C0602000C0DCC000C0C0
      A000C0DCC000C0C0A000C0A08000C0C0A000C0A080008080800080A0C00080A0
      C00080A0C0008080C0000020E000402080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080402000C0602000C0604000C060
      2000C0804000C0602000C040400080408000802080004020C0004020E0000020
      E0000020E0000020E0000020E000402040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080404000C0402000C0602000C060
      2000C0602000C0402000C0402000804060004020A0004020E0004020E0000020
      E0000020E0000020E00000008000802020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008040400080402000C0402000C060
      2000C0602000C0602000C0602000C0402000802080004020E0004020E0004020
      E0004020E0004000800040000000802020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C080600080604000C0604000C060
      4000C0604000C0604000C0604000C04040008040200080404000804060008040
      6000802020008020200080200000804040000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080808000FFFFFF00C0C0
      C000406060008080800080A08000406060008060600040606000406060004060
      6000FFFFFF00FFFFFF00808080000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C0404000C0404000C0404000C040
      6000806060008060800080606000C06060008060600080606000808080008060
      6000806040008040400080404000C08080000000000080808000FFFFFF00FFFF
      FF00808080008080600080A08000406060008080600080806000C0C0C00080A0
      8000FFFFFF00FFFFFF00808080000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C040400080202000802040004020
      C0000020E0000020E0000020E0004020A00040A0A00040E0E00040E0E00040E0
      E00040A0A0004020200040000000804040000000000080808000FFFFFF00F0FB
      FF0080E0E000C0DCC000C0DCC000C0DCC000F0FBFF00C0C0C000C0C0C000F0FB
      FF00FFFFFF00FFFFFF00808080000000000000000000C6C6C600C6C6C600C6C6
      C600840000008400000084000000840000008400000084000000840000008400
      0000C6C6C600C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C0404000802020004020C0004020
      E0004020E0004020E0000020E0004060E00040A0E00040E0E00040E0E00040E0
      E00040E0E00040A0A00040000000804040000000000080808000FFFFFF00C0DC
      C000C0600000C06000008080E0004040C0004040C00080806000808000008080
      0000FFFFFF00FFFFFF00808080000000000000000000C6C6C600C6C6C6008400
      0000FFFFFF00FFFFFF00FFFFFF00840000008400000084000000840000008400
      000084000000C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C0404000802060004040E0004040
      E0004040E0004040E0004040E0004080E0004080E00080C0E00080E0E00080E0
      E00040E0E00040E0E00040404000804040000000000080808000FFFFFF00C0DC
      C000C0600000C0600000808060004040C0004040C00080806000808000008080
      0000F0FBFF00FFFFFF00808080000000000000000000C6C6C60084000000FFFF
      FF0084000000FFFFFF0084000000FFFFFF008400000084000000840000008400
      00008400000084000000C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C040400080208000C0C0C000C0C0
      C000C0C0C000C0A0C000C080C000C0A0C000C0A0C000C0C0C000C0DCC000C0DC
      C000C0DCC000C0DCC00040606000804040000000000080808000FFFFFF00C0DC
      C000C0600000C0600000808060004040C0004040C00080806000808000008080
      0000F0FBFF00FFFFFF00808080000000000000000000C6C6C60084000000FFFF
      FF0084000000FFFFFF0084000000FFFFFF008400000084000000840000008400
      00008400000084000000C6C6C60000000000000000000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF0000000000C040400080208000C0A0E000C0A0
      E0008060E0008060E0008080E0008080E0008080E000C0C0C000C0DCC00080E0
      E00080E0E000C0DCC00040606000804040000000000080808000FFFFFF00C0DC
      C000C0C0A000FFFFFF0080806000FFFFFF004040C00080A0800040800000FFFF
      FF00F0FBFF00FFFFFF00808080000000000000000000C6C6C60084000000FFFF
      FF0084000000FFFFFF0084000000FFFFFF008400000084000000840000008400
      00008400000084000000C6C6C60000000000000000000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0000000000C0404000802040000020E0000020
      E0000020E0000020E0000020E0004080E0004080E00040E0E00040E0E00040E0
      E00040E0E00040E0E00040202000804040000000000080808000FFFFFF00C0DC
      C000C0600000C0A0800080A08000FFFFFF004060C00080A0800040802000FFFF
      FF00F0FBFF00FFFFFF00808080000000000000000000C6C6C600C6C6C6008400
      0000FFFFFF00FFFFFF00FFFFFF00840000008400000084000000840000008400
      000084000000C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF00FFFFFF0000000000C040200080202000402080004020
      E0004020E0000020E0000020E0000040E00040C0E00040E0E00040E0E00040E0
      E00040E0E0004060600040000000804040000000000080808000FFFFFF00C0DC
      C000C0600000C0600000808060004040C0004040C00080806000808000008080
      0000F0FBFF00FFFFFF00808080000000000000000000C6C6C600C6C6C600C6C6
      C600840000008400000084000000840000008400000084000000840000008400
      0000C6C6C600C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C040200080202000802020008020
      60008020A0004020C0004020A000802040008040400080A0A00080C0C00040A0
      A000404040004000000040000000804040000000000080808000FFFFFF00C0DC
      C000C0600000C0600000808060004040C0004040C00080806000808000008080
      0000F0FBFF00FFFFFF00808080000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C0404000C0402000C0808000C060
      6000C0806000C0606000C0606000C0606000C0606000C0606000C0606000C060
      6000C0606000C060400080202000804040000000000080808000FFFFFF00F0FB
      FF00C0600000C0600000808060004040C0004040C00080A08000808000008080
      0000F0FBFF00FFFFFF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0806000C0604000C0808000C080
      6000C0808000C0808000C0808000C0806000C0806000C0606000C0606000C080
      6000C0806000C060600080202000C0606000000000000000000080808000FFFF
      FF00F0FBFF00C0DCC000C0DCC000F0FBFF00C0DCC000F0FBFF00C0DCC000C0DC
      C000FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      8400000084000000840000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000848400008484000000840000C6C6C6000000000000000000000084000000
      FF000000FF000000FF000000FF000000FF000000FF0000008400000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000808080008080800000000000FFFFFF00840084008484
      8400848484008484840000840000008400000084000084840000848484000084
      0000008400008484000000840000C6C6C6000000000000000000000084000000
      FF00000084000000000000000000000084000000FF0000008400000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF0080808000F0FBFF008060E0004000
      C000C0A0E000F0FBFF0040C0E00000A0E000F0FBFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0A0A000806020008080600000000000C6C6C600000000000000
      0000000000000000000084000000840000008400840084848400008400000084
      0000008400000000000000840000C6C6C6000000000000000000000084000000
      FF00000084000000000000000000000084000000FF0000008400000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00808080008080E0008060E0008060
      E00080A0E00040C0E00000A0E00000A0E000F0FBFF00FFFFFF00FFFFFF00F0CA
      A600808040008040000080400000808060000000000084008400000084000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000840084008484000084848400C6C6C6000000000000000000000084000000
      FF00000084000000000000000000000084000000FF0000008400000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF0080808000FFFFFF0080E0E00040C0
      E00000A0E00000A0E00000A0E00000A0E000F0FBFF00F0FBFF00C0A060008040
      0000804000008040000080400000808060000000000084008400000084000000
      8400000084000000FF0000008400008400000000FF0000000000000000000000
      0000000000000000000084008400C6C6C6000000000000000000000084000000
      FF000000840000008400000084000000FF000000FF0000008400000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF008080800080C0E00040C0E00040C0
      E00040C0E00040C0E00040C0E00040C0E000C0C0A00080602000804000008040
      0000804000008040000080400000808060000000000000000000000084000000
      8400000084000000840000008400008484000084840000008400000084000000
      8400000084000000840084840000C6C6C6000000000000000000000084000000
      FF00000084000000FF000000FF000000FF000000840000000000000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF0080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F0FBFF00808040008040000080400000804000008040
      0000804000008040000080400000808060000000000084848400000000000000
      0000000000000000000000000000000000000000840000008400000084000000
      84000000840000008400C6C6C600C6C6C6000000000000000000000084000000
      FF00000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00848484008484
      8400C6C6C60084848400848484008484840084848400FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF000000FF0080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0A08000C0804000C080600080804000C0806000C08060008060
      4000C0804000C0804000C08060008080600000000000FFFFFF00FFFFFF00FFFF
      FF00C6C6C600C6C6C60084848400840000000000000000000000000000000000
      00000000840000000000FFFFFF00C6C6C6000000000000000000000084000000
      FF00000084008484840084840000848400008484840084848400848400008484
      8400848400000084000000000000000000000000FF00FFFFFF00848484008484
      8400C6C6C600C6C6C60084848400C6C6C600C6C6C600FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF000000FF0080808000FFFFFF00FFFFFF00C0C0
      A0008060400080400000C0806000C0A08000C0806000C0A08000C08060008060
      0000C0A0800080602000C08060008080600000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6008400
      84008400840000000000FFFFFF00C6C6C6000000000000000000000084000000
      FF00000084000084000000848400848484008484000000848400848400000084
      0000008484008484000000840000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF0080808000F0FBFF00C08060008040
      0000804000008040000080400000804000008040000080400000804000008040
      0000804000008040000080400000808060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
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
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0DCC000C0DCC000C0DCC000C0DC
      C000C0DCC000C0DCC000C0DCC000C0DCC000C0DCC000C0DCC000C0DCC000C0DC
      C000C0DCC000C0DCC000C0DCC000C0DCC0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004080C00000A0E00000A0E00000A0
      E00000A0E00000A0E00000A0E00000A0E00000A0E00000A0E00000A0E00000A0
      E00000A0E00000A0E00000A0E0004080C0004040200040200000402000004020
      0000402020004020200040200000402000004020000040200000404020004020
      200040200000402000004020000040402000C0DCC00040402000404020004040
      2000404020004040200040402000404020004040200040402000404020004040
      2000404020004040200040402000404020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004080C00000C0E00000C0E00000C0
      E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0
      E00000C0E00000C0E00000C0E0004080C0004040200040200000402040004000
      A0004000C0004000C0004000C00040008000406080000080E00000A0E00000A0
      E0000080C000404060004020000040402000C0DCC00040402000808020008080
      6000000000004040200080A0600080A0400080A0600080A06000808040008080
      400080A0400080A0400080A06000404000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000F0FBFF00F0FBFF00C0C0
      C000C0DCC000F0FBFF00C0C0C000C0C0C000C0A08000C0DCC000C0C0C000F0FB
      FF00C0C0C000F0FBFF00F0FBFF008080800040402000402040004000C0004000
      C0004000C0004000C0004000C0004020C0000060E00000A0E00000A0E00000A0
      E00000A0E00000A0E0004060600040402000C0DCC0004040200080A0400080A0
      400080A0400080A0400080A0600040400000000000004040200080A0600080C0
      600080A0400080A0400080A04000404040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF008080
      4000C0804000C0DCC00080602000F0CAA600F0CAA60080602000C0804000C0A0
      600080602000FFFFFF00FFFFFF0080808000404020004040A0004040C0008060
      C0008060C0008060C0008060C00080A0C0004080C0004080C00080A0E00080A0
      C00040A0E00080A0E00040A0E00040402000C0DCC00040402000808020008080
      2000808040008080400040604000404000004060400040402000808040004040
      200080A0400080A0400080A04000404020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF008060
      4000C0A06000C0C0A00080602000C0DCC00080602000C0806000F0CAA600C0A0
      600080604000FFFFFF00FFFFFF0080808000404020008060C000C0C0C000C0C0
      C000C0C0C000C0A0C000C0A0C000C0C0C000C0A0C000C0C0C00040A0E000C0DC
      C000C0C0C00080C0E00080C0E00040404000C0DCC0004040200080A040008080
      20004060400080A040000000000000000000C0C08000C0C08000808060004040
      2000404020004040200080C06000404040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF008060
      2000C0DCC000C0804000C0806000C0A0800080602000F0CAA600F0FBFF00C080
      600080804000FFFFFF00FFFFFF0080808000404020004020A0004040C0004040
      C0004000C0004000C0004020C0004040E0004040E0004080E00040A0E00000A0
      E00000A0E00000A0E00040A0E00040402000C0DCC0004040000080C0600080A0
      400080C0600080C060008080400000000000406040004040400080A0400080C0
      600080A040008080200040402000404020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000F0FBFF00C0DCC000C0C0
      A000F0FBFF00F0CAA600F0CAA600F0CAA600C0C0A000C0A08000F0CAA600F0CA
      A600F0CAA600F0FBFF00F0FBFF008080800040402000402040004000C0004000
      C0004000C0004000C0004000C0004020C0000060E00000A0E00000A0E00000A0
      E00000A0E00000A0E0004040600040402000C0DCC0004040200080A0400080C0
      600080A0400080A0400080C060008080400040604000808060008080400080A0
      400080C0600080A0600080C06000404040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080400000804000008040
      0000804000008040000080400000804000008040000080400000804000008040
      0000804000008040000080400000800000004040200040200000402020004000
      80004000C0004000C0004000A00040206000404060000080C00000A0E0000080
      E0000080C000404040004020000040402000C0DCC0004040200080A0600080A0
      40008080400080A0400080A04000808040008080400080A0400080A0400080A0
      6000808060008080400080804000404020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080400000804000008040
      0000804000008040000080400000804000008040000080400000804000008040
      0000804000008040000080400000800000004040200040200000402000004020
      0000402000004020200040200000402000004020000040200000402020004020
      000040200000402000004020000040402000C0DCC0004040400080A0600080A0
      40008080400080A040008080400080A0400080A0400080A0400080A0400080A0
      40008080400080A0400080804000404040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0DCC00040402000404020004040
      2000404020004040200040402000404020004040200040402000404020004040
      2000404020004040200040404000404040000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFF000000000000FFFFFFFFFFFFE007FFFFFFFFFFFFC003
      8001800100008001000000000000800100000000000080010000000000008001
      0000000000008001000000000000800100000000000080010000000000008001
      000000000000800100000000000080010000000000008001800180010000C003
      FFFFFFFF0000E007FFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000008001FFFF000000000000000000000000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080010000
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object QryCredCardLookup: TFDQuery
    OnCalcFields = QryCredCardLookupCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, descrip'
      'from credit_card'
      'order by descrip')
    Left = 80
    Top = 352
    object QryCredCardLookupDESCRIP: TStringField
      DisplayLabel = 'Card Type'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'IQ.CREDIT_CARD.DESCRIP'
      Size = 25
    end
    object QryCredCardLookupImageIndex: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = ' '
      DisplayWidth = 4
      FieldKind = fkCalculated
      FieldName = 'ImageIndex'
      Calculated = True
    end
    object QryCredCardLookupID: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
      Precision = 15
      Size = 0
    end
  end
  object QryCurrency: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT id,'
      '         curr_code,'
      '         descrip,'
      '         glvalue,'
      '         spot_rate,'
      '         curr_symbol'
      '    FROM currency'
      'ORDER BY curr_code')
    Left = 48
    Top = 352
    object QryCurrencyDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'CURRENCY.DESCRIP'
      Size = 50
    end
    object QryCurrencySPOT_RATE: TFMTBCDField
      DisplayLabel = 'Spot Rate'
      DisplayWidth = 10
      FieldName = 'SPOT_RATE'
      Origin = 'CURRENCY.SPOT_RATE'
      Size = 6
    end
    object QryCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Origin = 'CURRENCY.CURR_CODE'
      Size = 10
    end
    object QryCurrencyGLVALUE: TStringField
      DisplayLabel = 'GL Value'
      DisplayWidth = 50
      FieldName = 'GLVALUE'
      Origin = 'CURRENCY.GLVALUE'
      Size = 50
    end
    object QryCurrencyCURR_SYMBOL: TStringField
      DisplayLabel = 'Currency Symbol'
      DisplayWidth = 10
      FieldName = 'CURR_SYMBOL'
      Origin = 'CURRENCY.CURR_SYMBOL'
      Size = 10
    end
    object QryCurrencyID: TBCDField
      FieldName = 'ID'
      Origin = 'CURRENCY.ID'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMCCMANUAL'
    Left = 16
    Top = 352
  end
  object PShipTo: TUniPopupMenu
    Left = 292
    Top = 206
    object SelectShipToSubmenu1: TUniMenuItem
      Caption = 'Select'
      object CustomerShippingLocations2: TUniMenuItem
        Caption = 'Customer Shipping Locations'
        OnClick = DoSelectShipToByCustomer
      end
      object InvoiceShippingLocations2: TUniMenuItem
        Caption = 'On Invoice'
        OnClick = DoSelectShipToByInvoice
      end
      object SalesOrderShippingLocations2: TUniMenuItem
        Caption = 'On Sales Order'
        OnClick = DoSelectShipToBySalesOrder
      end
    end
    object ClearShipTo1: TUniMenuItem
      Caption = 'Clear'
      OnClick = ClearShipTo1Click
    end
  end
  object PEplant: TUniPopupMenu
    Left = 326
    Top = 204
    object SelectEPlant1: TUniMenuItem
      Caption = 'Select'
      OnClick = SelectEPlant1Click
    end
    object ClearEPlant1: TUniMenuItem
      Caption = 'Clear'
      OnClick = ClearEPlant1Click
    end
  end
end
