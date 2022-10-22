object FrmPsTkBatchLabels: TFrmPsTkBatchLabels
  Left = 204
  Top = 156
  HelpContext = 1108575
  ClientHeight = 390
  ClientWidth = 604
  Caption = 'Print Batch Labels'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 107
    Width = 604
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 332
    Width = 604
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel7: TUniPanel
      Left = 282
      Top = 1
      Width = 322
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 216
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
      object btnPrintAll: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Print All'
        TabOrder = 2
        OnClick = btnOK1Click
      end
      object btnPrintSel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Print Selected'
        TabOrder = 3
        OnClick = PrintSelected1Click
      end
    end
  end
  object pnlHdrTop: TUniPanel
    Left = 0
    Top = 0
    Width = 604
    Height = 107
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    OnResize = pnlHdrTopResize
    object Splitter2: TUniSplitter
      Left = 295
      Top = 27
      Width = 6
      Height = 80
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 602
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object MainNav: TUniDBNavigator
        Left = 527
        Top = 1
        Width = 75
        Height = 25
        Hint = ''
        DataSource = SrcPsTicket
        VisibleButtons = [nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object pnlHdrLeft1: TUniPanel
      Left = 1
      Top = 27
      Width = 295
      Height = 80
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      OnResize = pnlHdrLeft1Resize
      object Splitter3: TUniSplitter
        Left = 78
        Top = 0
        Width = 6
        Height = 80
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object pnlHdrLeft3: TUniPanel
        Left = 1
        Top = 1
        Width = 78
        Height = 78
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label6: TUniLabel
          Left = 8
          Top = 34
          Width = 46
          Height = 13
          Hint = ''
          Caption = 'Customer'
          TabOrder = 1
        end
        object Label11: TUniLabel
          Left = 8
          Top = 59
          Width = 27
          Height = 13
          Hint = ''
          Caption = 'Bill To'
          TabOrder = 2
        end
        object Label1: TUniLabel
          Left = 8
          Top = 9
          Width = 49
          Height = 13
          Hint = ''
          Caption = 'Pick Ticket'
          TabOrder = 3
        end
      end
      object pnlHdrClient2: TUniPanel
        Left = 84
        Top = 1
        Width = 211
        Height = 78
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitLeft = 81
        ExplicitWidth = 214
        DesignSize = (
          211
          78)
        object wwComboBillTo: TUniDBLookupComboBox
          Left = 1
          Top = 55
          Width = 213
          Height = 21
          Hint = ''
          ListOnlyMode = lmFollowSource
          ListField = 'ATTN;ADDR1;ADDR2;CITY;STATE;ZIP'
          ListSource = SrcBillTo
          KeyField = 'ID'
          ListFieldIndex = 0
          DataField = 'BATCH_LABEL_BILL_TO_ID'
          DataSource = SrcPsTicket
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Color = clWindow
        end
        object dbePickTicket: TUniDBEdit
          Left = 1
          Top = 5
          Width = 213
          Height = 19
          Hint = ''
          DataField = 'ID'
          DataSource = SrcPsTicket
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Color = clBtnFace
          ReadOnly = True
        end
        object dbeCustomer: TUniDBEdit
          Left = 1
          Top = 30
          Width = 213
          Height = 19
          Hint = ''
          DataField = 'COMPANY'
          DataSource = SrcPsTicket
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
    object pnlHdrClient1: TUniPanel
      Left = 301
      Top = 27
      Width = 303
      Height = 80
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object Splitter4: TUniSplitter
        Left = 78
        Top = 0
        Width = 6
        Height = 80
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object pnlHdrLeft4: TUniPanel
        Left = 1
        Top = 1
        Width = 78
        Height = 78
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label3: TUniLabel
          Left = 8
          Top = 9
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'Date'
          TabOrder = 1
        end
        object Label5: TUniLabel
          Left = 8
          Top = 34
          Width = 25
          Height = 13
          Hint = ''
          Caption = 'Label'
          TabOrder = 2
        end
        object Label13: TUniLabel
          Left = 8
          Top = 59
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'First Box #'
          TabOrder = 3
        end
      end
      object Panel6: TUniPanel
        Left = 84
        Top = 1
        Width = 219
        Height = 78
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitLeft = 81
        ExplicitWidth = 225
        DesignSize = (
          219
          78)
        object sbtnLabelsMaintenance: TUniSpeedButton
          Left = 199
          Top = 29
          Width = 22
          Height = 22
          Hint = 'New Label'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000130B0000130B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFCCCBCBCDC5BEC4BBAFC2B9ADC6C1B8CAC9C6FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCBC4
            C4C4B9B9B9B7B7B7C0C0C0C8C8C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFCEA483BB875DBD9872BF9A76B68B63A87B4DA57A
            4AAB875BB7A180FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A184
            84849494949797978888887777777676768282829D9D9DFF00FFFF00FFC6AFA6
            B87E63C38F6EC7A289CEAA8FE79977E3B79BF9F5F0F4EDE7EEE3DAE8DACDE0CD
            BBD8BDA3B0885AFF00FFFF00FFAFAFAF7E7E7E8D8D8DA0A0A0A8A8A89A9A9AB6
            B6B6F5F5F5EDEDEDE2E2E2D9D9D9CBCBCBBABABA838383FF00FFFF00FFB87C5C
            C18660E29252D58349D8926CEDA888EFD8C6FFFFFFFFFFFFFFFFFFFFFFFFFFFD
            FDCBAD8ACFA27EFF00FFFF00FF7C7C7C858585909090838383929292A9A9A9D7
            D7D7FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDA9A9A99F9F9FFF00FFC4A89ACB8654
            C8ADA6FFFDFDC1A08EC58E69E6C1A3FDF9F4FDFDFAFFFFFFFFFFFFFFFDFDCFB2
            91D59671D2BAA5FF00FFA8A8A8848484AEAEAEFDFDFDA0A0A08C8C8CBFBFBFF9
            F9F9FDFDFDFFFFFFFFFFFFFDFDFDAEAEAE959595B8B8B8FF00FFC18D71E6B387
            CBAFA3FFF6EDAB7058AF6E3D9D6C40AF7B4CC8905DD59F72EDBB94CBA37AC89B
            75D08D60CCC6C1FF00FF8D8D8DB0B0B0AFAFAFF5F5F57171716D6D6D6A6A6A78
            78788D8D8D9C9C9CB8B8B89F9F9F9898988C8C8CC6C6C6FF00FFC79477EAD3BE
            D3B19FFDECD5C87055DA683CE67745D27447BA6D44A6633B90562BB1683BF9F0
            E8DBAC8DCCC1B9FF00FF939393D1D1D1B0B0B0E9E9E97575756F6F6F7C7C7C77
            77776E6E6E636363555555686868EFEFEFAAAAAAC0C0C0FF00FFCB9F84E0D3CF
            EAC19DFDE0C1DA6240F4693CFA7244FA7043FA6C3CFA6E3FF77142E7744FFBED
            DDD8A380CCC6C1FF00FF9E9E9ED4D4D4BEBEBEDCDCDC6B6B6B7575757C7C7C7B
            7B7B7777777979797B7B7B7C7C7CEBEBEBA1A1A1C6C6C6FF00FFCAAB9DDAB6A3
            FFCB92E0AA8EC85937E07B56E78B6A6544196544196544196544196544196544
            19654419654419FF00FFABABABB5B5B5C5C5C5AAAAAA6161618080808F8F8F41
            4141414141414141414141414141414141414141414141FF00FFC6AA9ED7A079
            E8B17FC47655C47854BE7754654419EFD6BDEFD6BDEFD6BDEFD6BDEFD6BDEFD6
            BDEFD6BDE4CAB1654419AAAAAA9E9E9EADADAD7878787A7A7A787878414141D3
            D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3C7C7C7414141FF00FFCCC7C3
            CCAF9AB97B58BC7151C27454654419FFEAD5C7B7A6948B820F0F0F55504B948B
            82AFA59AFFEAD5654419FF00FFC7C7C7ADADAD7B7B7B737373767676414141E8
            E8E8B5B5B58A8A8A0F0F0F4F4F4F8A8A8AA4A4A4E8E8E8414141FF00FFFF00FF
            FF00FFCB9877E38C6FD39E7D654419FFF3E6070707D2D2D20F0F0FD2D2D20F0F
            0F7F7C79FFF3E6654419FF00FFFF00FFFF00FF9696969090909C9C9C414141F2
            F2F2070707D2D2D20F0F0FD2D2D20F0F0F7C7C7CF2F2F2414141FF00FFFF00FF
            FF00FFAE7656A3694EB67D5B654419FFF7F0070707D2D2D20F0F0FD2D2D20F0F
            0F7F7E7EFFF7F0654419FF00FFFF00FFFF00FF7676766A6A6A7D7D7D414141F6
            F6F6070707D2D2D20F0F0FD2D2D20F0F0F7E7E7EF6F6F6414141FF00FFFF00FF
            FF00FFCFB197B98862B17C58654419FFFFFF070707D2D2D20F0F0FD2D2D20F0F
            0F7F7F7FFFFFFF654419FF00FFFF00FFFF00FFAFAFAF8686867B7B7B414141FF
            FFFF070707D2D2D20F0F0FD2D2D20F0F0F7F7F7FFFFFFF414141FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF654419FFFFFF2E2922D2D2D20F0F0FD2D2D20F0F
            0F88837CFFFFFF654419FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF414141FF
            FFFF282828D2D2D20F0F0FD2D2D20F0F0F828282FFFFFF414141FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFA38F75A38F75A38F75A38F75A38F75A38F
            75A38F75A38F75FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B
            8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8BFF00FF}
          Caption = ''
          Anchors = [akTop, akRight]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnLabelsMaintenanceClick
        end
        object sbnEditBoxNum: TUniSpeedButton
          Left = 99
          Top = 55
          Width = 22
          Height = 22
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          GroupIndex = 1
          AllowAllUp = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDD0000000000DDDDDD0FFFFFFFF0DDDDDD0FFFFFFF
            F0DDDDDD0FF80FFFF0DDDDDD0F800FFFF0DDDDDD080B0FFFF0DDDDDD00B0FFFF
            F0DDDDDD0B0FFFFFF0DDDDD0B0FFFFFFF0DDDD0B0FFFFFFFF0DDD0B07FFFFFFF
            F0DDD90D0000000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbnEditBoxNumClick
        end
        object wwDBDateTimePickDate: TUniDBDateTimePicker
          Left = 1
          Top = 5
          Width = 205
          Height = 21
          Hint = ''
          DateTime = 42661.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object wwLabels: TUniDBLookupComboBox
          Left = 1
          Top = 30
          Width = 205
          Height = 21
          Hint = ''
          ListOnlyMode = lmFollowSource
          ListField = 'ID;LABEL_KIND;LABEL_TYPE;LABEL_MENU_NAME'
          ListSource = SrcLableCust
          KeyField = 'ID'
          ListFieldIndex = 0
          DataField = 'BATCH_LABEL_LM_LABELS_ID'
          DataSource = SrcPsTicket
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clWindow
        end
        object dbeFirstBox: TUniDBEdit
          Left = 1
          Top = 55
          Width = 97
          Height = 21
          Hint = ''
          DataField = 'BATCH_LABEL_FIRST_BOX'
          DataSource = SrcPsTicket
          TabOrder = 2
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 110
    Width = 604
    Height = 222
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object splitUserFields: TUniSplitter
      Left = 341
      Top = 28
      Width = 6
      Height = 194
      Hint = ''
      Align = alRight
      ParentColor = False
      Color = clBtnFace
    end
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 341
      Height = 194
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 124
      IQComponents.Grid.Height = 108
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcPSTicketDtl
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
      IQComponents.Navigator.DataSource = SrcPSTicketDtl
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 124
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 108
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcPSTicketDtl
      Columns = <
        item
          FieldName = 'BATCH_LABEL_SELECTED'
          Title.Caption = 'Selected'
          Width = 64
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'SEQ'
          Title.Caption = '#'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MfgNo'
          Title.Caption = 'MFG #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OpmatItemno'
          Title.Caption = 'Package'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BATCH_LABEL_QTY'
          Title.Caption = 'Labels Quantity'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BATCH_LABEL_BOX_QTY'
          Title.Caption = 'Parts / Package'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BATCH_LABEL_WEIGHT'
          Title.Caption = 'Weight'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BATCH_LABEL_LOTNO'
          Title.Caption = 'Lot #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OpmatVolume'
          Title.Caption = 'Volume'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORDERNO'
          Title.Caption = 'Order #'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PONO'
          Title.Caption = 'PO #'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIP_QUAN'
          Title.Caption = 'Quantity'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSTNO'
          Title.Caption = 'Customer #'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMPANY'
          Title.Caption = 'Company'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIP_TO_ATTN'
          Title.Caption = 'Ship To'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 602
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object sbtnUserFields: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 26
        Height = 26
        Hint = 'Toggle View User Fields'
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
          FF00FFFF00FFFF00FFFF00FFC07850F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0
          B0F0D0B0904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979D9
          D9D9D5D5D5D0D0D0CDCDCDCDCDCDCDCDCDCDCDCD454545FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFD08860FFF8F0FFF8F0FFF0E0FFF0E0FFE8E0FFE8
          E0F0D0B0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888F7
          F7F7F7F7F7EEEEEEEEEEEEE9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07040
          B05830B05830A05020A05020904820904820904020804020FFF0F0FFE8E0FFE8
          E0F0D0B0904820FF00FFFF00FF7171715C5C5C5C5C5C5353535353534A4A4A4A
          4A4A454545424242F2F2F2E9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07850
          F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0B0F0D0B0904020FFF8F0FFF0E0FFF0
          E0F0D0C0A04820FF00FFFF00FF797979D9D9D9D5D5D5D0D0D0CDCDCDCDCDCDCD
          CDCDCDCDCD454545F7F7F7EEEEEEEEEEEED0D0D04D4D4DFF00FFFF00FFD08860
          FFF8F0E09060D08050D08050D08050D08050F0D0B0904820FFFFFFFFF0F0FFF0
          F0F0D8D0A05020FF00FFFF00FF888888F7F7F790909080808080808080808080
          8080CDCDCD4A4A4AFFFFFFF2F2F2F2F2F2D9D9D9535353FF00FFFF00FFD09070
          FFFFFFFFFFFFFFF0F0FFF0F0FFE8E0FFE8E0F0D0B0904820FFFFFFFFF8F0FFF8
          F0F0E0E0A05020FF00FFFF00FF909090FFFFFFFFFFFFF2F2F2F2F2F2E9E9E9E9
          E9E9CDCDCD4A4A4AFFFFFFF7F7F7F7F7F7E2E2E2535353FF00FFFF00FFE0A080
          FFFFFFF0A880E09870E09060D08050D08050F0D0C0A04820FFFFFFFFFFFFFFFF
          FFFFFFFFA05020FF00FFFF00FFA0A0A0FFFFFFA8A8A898989890909080808080
          8080D0D0D04D4D4DFFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0A890
          FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0F0F0D8D0A05020FFFFFFFFFFFFFFFF
          FFFFFFFFA05020FF00FFFF00FFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F2
          F2F2D9D9D9535353FFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0B8A0
          FFFFFFFFB090F0B090F0A880F09870E09060F0E0E0A05020E0A080D09070D088
          60C07850C07040FF00FFFF00FFB7B7B7FFFFFFB1B1B1B0B0B0A8A8A89A9A9A90
          9090E2E2E2535353A0A0A0909090888888797979717171FF00FFFF00FFF0C0A0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
          F0C0B0F0C0B0F0B8A0E0A080D09070D08860C07850C07040FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFC7C7C7C1C1C1C1C1C1B8B8B8A0A0A090909088
          8888797979717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnUserFieldsClick
      end
      object sbtnSelectAll: TUniSpeedButton
        Left = 27
        Top = 2
        Width = 26
        Height = 25
        Hint = 'Select All'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          B3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
          7DB3977DB3977DB3977DFF00FFFF00FF94949494949494949494949494949494
          9494949494949494949494949494949494949494949494949494FF00FFFF00FF
          B3977D25B9FF28BEFF2CC4FF31CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
          FF8EF1FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D7
          D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F3949494FF00FFFF00FF
          B3977D24B9FF28BEFF2BC4FF31CBFF36D1FF3DD9FF45DEFF52E4FF63E9FF78ED
          FF8EF2FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D6
          D6D6DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F3949494FF00FFFF00FF
          B3977DA1A1A09393928787857E7D7C7978767978777F7E7C888685908F8D9796
          93979694979694B3977DFF00FFFF00FF949494A1A1A19393938787877D7D7D78
          78787878787E7E7E8686868F8F8F959595969696969696949494FF00FFFF00FF
          B3977D25B9FF28BEFF2CC4FF31CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
          FF8EF1FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D7
          D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F3949494FF00FFFF00FF
          B3977D24B9FF28BEFF2BC4FF31CBFF36D1FF3DD9FF45DEFF52E4FF63E9FF78ED
          FF8EF2FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D6
          D6D6DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F3949494FF00FFFF00FF
          508050407040305030203820B9B9B9ADADADA0A0A09292918686867D7D7D7A7A
          7A7B7A7A838281B3977DFF00FFFF00FF757575656565484848323232B9B9B9AD
          ADADA0A0A09292928686867D7D7D7A7A7A7A7A7A828282949494FF00FFFF00FF
          50905060A86050885030503031CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
          FF8EF1FFA3F5FFB3977DFF00FFFF00FF8282829898987B7B7B484848D2D2D2D7
          D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F394949470A88060A070
          60986070B0705098504070403050302038203DD9FF45DEFF52E4FF63E9FF78ED
          FF8EF2FFA3F5FFB3977D9D9D9D9494948B8B8BA2A2A288888865656548484832
          3232DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F394949480B090A0D8A0
          70C08070B87060A060509050408840305030A17A57A17A57A17A57A17A57A17A
          57A17A57A17A57A17A57A7A7A7CACACAB0B0B0A8A8A891919182828279797948
          484877777777777777777777777777777777777777777777777790B8A0B0D8B0
          A0D8A090D0A070B87060A860509850407040FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFB1B1B1CECECECACACAC3C3C3A8A8A898989888888865
          6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90C0A090B8A0
          80B090A0D8A070C080609860509050508050FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFB7B7B7B1B1B1A7A7A7CACACAB0B0B08B8B8B82828275
          7575FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          90B8A0B0D8B0A0D8A060A070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B1CECECECACACA949494FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          90C0A090B8A080B09070A880FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFB7B7B7B1B1B1A7A7A79D9D9DFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnSelectAllClick
      end
      object sbtnUnSelectAll: TUniSpeedButton
        Left = 53
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Unselect All'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000232E0000232E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          B3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
          7DB3977DB3977DB3977DFF00FFFF00FF94949494949494949494949494949494
          9494949494949494949494949494949494949494949494949494FF00FFFF00FF
          B3977DF3EADCF2E8DBF1E8DAF1E6D8F1E5D7F0E5D6F0E4D5EFE4D3EFE3D2EFE2
          D1EFE2D0EEE1CFB3977DFF00FFFF00FF949494E8E8E8E7E7E7E6E6E6E4E4E4E3
          E3E3E3E3E3E2E2E2E2E2E2E1E1E1E0E0E0E0E0E0DFDFDF949494FF00FFFF00FF
          B3977DF7F1EAF7F1E9F6F0E7F5EFE6F6EEE4F5EEE2F4ECE1F3EBE0F3EADEF3EA
          DDF2E9DBF2E8DAB3977DFF00FFFF00FF949494F0F0F0F0F0F0EFEFEFEEEEEEED
          EDEDECECECEBEBEBEAEAEAE9E9E9E9E9E9E7E7E7E6E6E6949494FF00FFFF00FF
          B3977D9393928787857E7D7C7978767978777F7E7C888685908F8D9796939796
          949796949D9A98B3977DFF00FFFF00FF9494949393938787877D7D7D78787878
          78787E7E7E8686868F8F8F9595959696969696969A9A9A949494FF00FFFF00FF
          B3977DFFFEFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFEFEFDB3977DFF00FFFF00FF949494FEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFE949494FF00FFFF00FF
          B3977DFFF9F4FFFAF6FFFBF7FFFBF8FFFCF9FFFDFAFFFDFBFFFEFCFFFFFDFFFF
          FEFFFFFEFFFFFFB3977DFF00FFFF00FF949494F9F9F9FAFAFAFBFBFBFBFBFBFC
          FCFCFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF949494FF00FFFF00FF
          B3977DC2C2C2C1C1C1B9B9B9ADADADA0A0A09292918686867D7D7D7A7A7A7B7A
          7A838281929190B3977DFF00FFFF00FF949494C2C2C2C1C1C1B9B9B9ADADADA0
          A0A09292928686867D7D7D7A7A7A7A7A7A828282919191949494FF00FFFF00FF
          B3977DFFFEFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFEFEFDB3977DFF00FFFF00FF949494FEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFE9494946078D01038B0
          1038B01030B01028A01028A0002090002090FFFDFAFFFDFBFFFEFCFFFFFDFFFF
          FEFFFFFEFFFFFFB3977D8F8F8F6161616161615E5E5E5555555555554A4A4A4A
          4A4AFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF9494946080D09098FF
          5060FF5060FF3048F03048E02040D01028A0A17A57A17A57A17A57A17A57A17A
          57A17A57A17A57A17A57949494B4B4B49696969696968585857E7E7E73737355
          55557777777777777777777777777777777777777777777777777088E0A0A8FF
          9090FF7080FF5068FF3058F02048F01038B0FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF9F9F9FBFBFBFB0B0B0A6A6A69999998B8B8B85858561
          6161FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7088E07088E0
          6080D06078D05070C05060C04058B04058B0FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF9F9F9F9F9F9F9494948F8F8F8585857C7C7C71717171
          7171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnUnSelectAllClick
      end
      object sbtnCalcLabelsQty: TUniSpeedButton
        Left = 78
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Calculate all labels qty'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          CDB6A88068608060507058407058407050407050406050406050306050307050
          40B89A83FF00FFFF00FFFF00FFFF00FFB5B5B568686860606056565656565650
          50505050504E4E4E4C4C4C4C4C4C505050989898FF00FFFF00FFFF00FFFF00FF
          877766D0C0B0D0B8B0D0B0A0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A090B098
          90775E46FF00FFFF00FFFF00FFFF00FF757575BEBEBEB8B8B8AFAFAFAEAEAEA8
          A8A8A8A8A8A0A0A0A0A0A09E9E9E9999995C5C5CFF00FFFF00FFFF00FFFF00FF
          967E66F0E0D0D0C0B0D0B8B0D0B0B0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A0
          90775E46FF00FFFF00FFFF00FFFF00FF7B7B7BDEDEDEBEBEBEB8B8B8B3B3B3AE
          AEAEA8A8A8A8A8A8A0A0A0A0A0A09E9E9E5C5C5CFF00FFFF00FFFF00FFFF00FF
          967E75F0E0D0C08870B07050D0B8B0C08870B07050C0B0A0C08870B07050C0A0
          90775E46FF00FFFF00FFFF00FFFF00FF7E7E7EDEDEDE898989717171B8B8B889
          8989717171AEAEAE898989717171A0A0A05C5C5CFF00FFFF00FFFF00FFFF00FF
          968675F0E0E0FFC8B0C08870D0C0B0F0C8B0C08870C0B0A0F0C8B0C08070C0A8
          90775E46FF00FFFF00FFFF00FFFF00FF848484E2E2E2C8C8C8898989BEBEBEC7
          C7C7898989AEAEAEC7C7C7838383A5A5A55C5C5CFF00FFFF00FFFF00FFFF00FF
          968D85F0E8E0E0D0C0D0C8C0D0C0C0D0C0B0D0B8B0D0B8B0C0B0A0C0B0A0C0A8
          A0776655FF00FFFF00FFFF00FFFF00FF8C8C8CE7E7E7CECECEC7C7C7C2C2C2BE
          BEBEB8B8B8B8B8B8AEAEAEAEAEAEA8A8A8646464FF00FFFF00FFFF00FFFF00FF
          A58D85FFE8E0C09070B07050E0C8C0C09080B07050D0B8B0C09070B07050C0B0
          A0866655FF00FFFF00FFFF00FFFF00FF8D8D8DE9E9E98E8E8E717171C9C9C991
          9191717171B8B8B88E8E8E717171AEAEAE666666FF00FFFF00FFFF00FFFF00FF
          A59585FFF0F0FFC8B0C08870E0D0C0F0C8B0C08870D0C0B0F0C8B0C08870D0B0
          A0866D55FF00FFFF00FFFF00FFFF00FF939393F2F2F2C8C8C8898989CECECEC7
          C7C7898989BEBEBEC7C7C7898989AFAFAF6B6B6BFF00FFFF00FFFF00FFFF00FF
          A59C94FFF0F0E0E0E0E0D8D0E0D0D0E0D0D0E0C8C0D0C8C0D0C0B0D0C0B0D0B8
          B0866D55FF00FFFF00FFFF00FFFF00FF9B9B9BF2F2F2E0E0E0D7D7D7D2D2D2D2
          D2D2C9C9C9C7C7C7BEBEBEBEBEBEB8B8B86B6B6BFF00FFFF00FFFF00FFFF00FF
          B4A494FFF8F09080D04030A0E0D8D09080D04030A0E0C8C09080D04030A0D0C0
          B0867564FF00FFFF00FFFF00FFFF00FFA2A2A2F7F7F7979797595959D7D7D797
          9797595959C9C9C9979797595959BEBEBE737373FF00FFFF00FFFF00FFFF00FF
          B4A4A3FFF8F0C0C0E09080D0E0E0E0C0C0E09080D0E0D0D0C0C0E09080D0D0C0
          C0957564FF00FFFF00FFFF00FFFF00FFA6A6A6F7F7F7C8C8C8979797E0E0E0C8
          C8C8979797D2D2D2C8C8C8979797C2C2C2757575FF00FFFF00FFFF00FFFF00FF
          B4ABA3FFF8FFFFE0D0FFD0B0FFD0B0FFC090F0B890D0A080D0A080D0B0A0D0C8
          C0957C73FF00FFFF00FFFF00FFFF00FFAAAAAAFAFAFAE0E0E0CECECECECECEBD
          BDBDB6B6B69E9E9E9E9E9EAFAFAFC7C7C77C7C7CFF00FFFF00FFFF00FFFF00FF
          B4ABA3FFFFFFFF9860FFA060FFA060FFA060FFA060FFA060FFA060B06850C0A8
          90958473FF00FFFF00FFFF00FFFF00FFAAAAAAFFFFFF9A9A9A9F9F9F9F9F9F9F
          9F9F9F9F9F9F9F9F9F9F9F6B6B6BA5A5A5828282FF00FFFF00FFFF00FFFF00FF
          B4B3A3FFFFFFE07840F0D8D0F0D8D0F0C8B0E0B0A0E0A080E08050A05830D0A0
          90958473FF00FFFF00FFFF00FFFF00FFB0B0B0FFFFFF7B7B7BD9D9D9D9D9D9C7
          C7C7B1B1B1A0A0A08282825A5A5AA1A1A1828282FF00FFFF00FFFF00FFFF00FF
          DAC7C0BEB3A9F0B8A0D09070D08860D08050D07040D06830C06030D08060A088
          80C6A891FF00FFFF00FFFF00FFFF00FFC7C7C7B2B2B2B8B8B890909088888880
          80807373736C6C6C646464838383888888A6A6A6FF00FFFF00FFFF00FFFF00FF
          FF00FFCCC4B3B0A8A0B0A8A0B0A090B09890B09890A09890A09080A08880C9AE
          98FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1A7A7A7A7A7A79E9E9E99
          99999999999797978E8E8E888888ACACACFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnCalcLabelsQtyClick
      end
      object NavDetails: TUniDBNavigator
        Left = 521
        Top = 1
        Width = 81
        Height = 26
        Hint = ''
        DataSource = SrcPSTicketDtl
        VisibleButtons = [nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object wwDataInspectorItemInfo: TwwDataInspector
      Left = 37
      Top = 74
      Width = 316
      Height = 62
      DisableThemes = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      DataSource = SrcPSTicketDtl
      Items = <
        item
          DataSource = SrcPSTicketDtl
          DataField = 'DESCRIP'
          Caption = 'Description'
          WordWrap = False
        end
        item
          DataSource = SrcPSTicketDtl
          DataField = 'PONO'
          Caption = 'Revision'
          WordWrap = False
        end
        item
          DataSource = SrcPSTicketDtl
          DataField = 'CLASS'
          Caption = 'Class'
          WordWrap = False
        end>
      DefaultRowHeight = 19
      CaptionWidth = 100
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      Visible = False
    end
    object wwExpandButtonItemNo: TwwExpandButton
      Left = 90
      Top = 49
      Width = 130
      Height = 16
      DisableThemes = False
      Grid = wwDataInspectorItemInfo
      Caption = 'wwExpandButtonItemNo'
      DataField = 'ITEMNO'
      DataSource = SrcPSTicketDtl
      ShowText = True
      TabOrder = 3
    end
    object wwDBLookupComboMfg: TUniDBLookupComboBox
      Left = 126
      Top = 140
      Width = 121
      Height = 21
      Hint = ''
      ListField = 'MFGNO'
      ListSource = SrcMfg
      KeyField = 'ID'
      ListFieldIndex = 0
      TabOrder = 4
      Color = clWindow
    end
    object wwDBLookupComboPkg: TUniDBLookupComboBox
      Left = 126
      Top = 164
      Width = 121
      Height = 21
      Hint = ''
      ListOnlyMode = lmFollowSource
      ListField = 'ITEMNO;DESCRIP;WEIGHT;PTSPER;SEQ'
      ListSource = SrcPackeging
      KeyField = 'ID'
      ListFieldIndex = 0
      TabOrder = 5
      Color = clWindow
    end
    object wwDBComboDlgLabelQty: TUniEdit
      Left = 262
      Top = 145
      Width = 121
      Height = 21
      Hint = 'Click the button to calculate labels qty'
      ShowHint = True
      ParentShowHint = False
      Text = ''
      TabOrder = 6
    end
    object pnlUserFields: TUniPanel
      Left = 347
      Top = 28
      Width = 257
      Height = 194
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 7
      Caption = ''
      object wwDataInspectorUserFields: TwwDataInspector
        Left = 0
        Top = 19
        Width = 257
        Height = 175
        DisableThemes = False
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        DataSource = SrcPSTicketDtl
        Items = <
          item
            DataSource = SrcPSTicketDtl
            Caption = 'Alphanumeric'
            ReadOnly = True
            Items = <
              item
                DataSource = SrcPSTicketDtl
                DataField = 'CUSER1'
                Caption = 'CUser 1'
                TagString = 'CUSER1'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'CUSER2'
                Caption = 'CUser 2'
                TagString = 'CUSER2'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'CUSER3'
                Caption = 'CUser 3'
                TagString = 'CUSER3'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'CUSER4'
                Caption = 'CUser 4'
                TagString = 'CUSER4'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'CUSER5'
                Caption = 'CUser 5'
                TagString = 'CUSER5'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'CUSER6'
                Caption = 'CUser 6'
                TagString = 'CUSER6'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'CUSER7'
                Caption = 'CUser 7'
                TagString = 'CUSER7'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'CUSER8'
                Caption = 'CUser 8'
                TagString = 'CUSER8'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'CUSER9'
                Caption = 'CUser 9'
                TagString = 'CUSER9'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'CUSER10'
                Caption = 'CUser 10'
                TagString = 'CUSER10'
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcPSTicketDtl
            Caption = 'Numeric'
            ReadOnly = True
            Items = <
              item
                DataSource = SrcPSTicketDtl
                DataField = 'NUSER1'
                Caption = 'NUser 1'
                TagString = 'NUSER1'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'NUSER2'
                Caption = 'NUser 2'
                TagString = 'NUSER2'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'NUSER3'
                Caption = 'NUser 3'
                TagString = 'NUSER3'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'NUSER4'
                Caption = 'NUser 4'
                TagString = 'NUSER4'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'NUSER5'
                Caption = 'NUser 5'
                TagString = 'NUSER5'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'NUSER6'
                Caption = 'NUser 6'
                TagString = 'NUSER6'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'NUSER7'
                Caption = 'NUser 7'
                TagString = 'NUSER7'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'NUSER8'
                Caption = 'NUser 8'
                TagString = 'NUSER8'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'NUSER9'
                Caption = 'NUser 9'
                TagString = 'NUSER9'
                WordWrap = False
              end
              item
                DataSource = SrcPSTicketDtl
                DataField = 'NUSER10'
                Caption = 'NUser 10'
                TagString = 'NUSER10'
                WordWrap = False
              end>
            WordWrap = False
          end>
        DefaultRowHeight = 18
        CaptionWidth = 105
        Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        LineStyleCaption = ovDottedLine
        LineStyleData = ovDottedLine
      end
      object Panel2: TUniPanel
        Left = 1
        Top = 1
        Width = 255
        Height = 19
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = 'User Fields'
      end
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 371
    Width = 604
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object SrcPsTicket: TDataSource
    DataSet = QryPsTicket
    Left = 16
    Top = 179
  end
  object QryPsTicket: TFDQuery
    BeforeOpen = QryPsTicketBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PS_TICKET'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLPS_Ticket
    SQL.Strings = (
      'select tkt.id,'
      '       a.company,'
      '       tkt.bill_to_id,'
      '       tkt.batch_label_bill_to_id,'
      '       b.attn as bill_to_attn, '
      '       batch_label_first_box,'
      '       batch_label_lm_labels_id,'
      '       a.id as arcusto_id'
      '  from '
      '       ps_ticket tkt,'
      '       ship_to s,'
      '       bill_to b,'
      '       arcusto a'
      ' where '
      '       tkt.id = :ps_ticket_id'
      '   and tkt.ship_to_id = s.id(+)'
      '   and s.arcusto_id = a.id(+)'
      '   and tkt.batch_label_bill_to_id = b.id(+)'
      ' ')
    Left = 16
    Top = 195
    ParamData = <
      item
        Name = 'ps_ticket_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPsTicketID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object QryPsTicketCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryPsTicketBILL_TO_ATTN: TStringField
      FieldName = 'BILL_TO_ATTN'
      Size = 60
    end
    object QryPsTicketBATCH_LABEL_FIRST_BOX: TBCDField
      FieldName = 'BATCH_LABEL_FIRST_BOX'
      Size = 0
    end
    object QryPsTicketBATCH_LABEL_LM_LABELS_ID: TBCDField
      FieldName = 'BATCH_LABEL_LM_LABELS_ID'
      Size = 0
    end
    object QryPsTicketARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object QryPsTicketBATCH_LABEL_BILL_TO_ID: TBCDField
      FieldName = 'BATCH_LABEL_BILL_TO_ID'
      Size = 0
    end
    object QryPsTicketBILL_TO_ID: TBCDField
      FieldName = 'BILL_TO_ID'
      Size = 0
    end
  end
  object QryBillTo: TFDQuery
    BeforeOpen = QryBillToBeforeOpen
    MasterSource = SrcPsTicket
    MasterFields = 'ARCUSTO_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       city,'
      '       state,'
      '       zip'
      '  from bill_to '
      ' where arcusto_id = :arcusto_id      '
      '')
    Left = 53
    Top = 179
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryBillToATTN: TStringField
      DisplayLabel = 'Bill To'
      DisplayWidth = 15
      FieldName = 'ATTN'
      Origin = 'IQ.BILL_TO.ATTN'
      Size = 60
    end
    object QryBillToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 15
      FieldName = 'ADDR1'
      Origin = 'IQ.BILL_TO.ADDR1'
      Size = 60
    end
    object QryBillToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 15
      FieldName = 'ADDR2'
      Origin = 'IQ.BILL_TO.ADDR2'
      Size = 60
    end
    object QryBillToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'IQ.BILL_TO.CITY'
      FixedChar = True
      Size = 30
    end
    object QryBillToSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 2
      FieldName = 'STATE'
      Origin = 'IQ.BILL_TO.STATE'
      FixedChar = True
    end
    object QryBillToZIP: TStringField
      DisplayLabel = 'Zip / Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'IQ.BILL_TO.ZIP'
      FixedChar = True
      Size = 10
    end
    object QryBillToID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.BILL_TO.ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLPS_Ticket: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into ps_ticket'
      
        '  (BATCH_LABEL_BILL_TO_ID, BATCH_LABEL_FIRST_BOX, BATCH_LABEL_LM' +
        '_LABELS_ID)'
      'values'
      
        '  (:BATCH_LABEL_BILL_TO_ID, :BATCH_LABEL_FIRST_BOX, :BATCH_LABEL' +
        '_LM_LABELS_ID)')
    ModifySQL.Strings = (
      'update ps_ticket'
      'set'
      '  BATCH_LABEL_BILL_TO_ID = :BATCH_LABEL_BILL_TO_ID,'
      '  BATCH_LABEL_FIRST_BOX = :BATCH_LABEL_FIRST_BOX,'
      '  BATCH_LABEL_LM_LABELS_ID = :BATCH_LABEL_LM_LABELS_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ps_ticket'
      'where'
      '  ID = :OLD_ID')
    Left = 16
    Top = 211
  end
  object QryLabelCust: TFDQuery
    BeforeOpen = QryLabelCustBeforeOpen
    Filtered = True
    MasterSource = SrcPsTicket
    MasterFields = 'ARCUSTO_ID;ID'
    DetailFields = 'ARCUSTO_ID;ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '-- labels based on customer'
      'select id,'
      '       arcusto_id,'
      '       label_file,'
      '       label_menu_name,'
      '       label_type,'
      '       label_kind,'
      '       remote_server,'
      '       eplant_id,'
      '       comm_port,'
      '       report_name,'
      '       upper(label_menu_name) as upper_label_menu_name'
      '  from             '
      '       lm_labels l'
      ' where l.label_type in ('#39'MANUFACTURED'#39', '#39'MIXED'#39')'
      
        '   and (   EXISTS (select 1 from lm_labels_detail d where d.lm_l' +
        'abels_id = l.id)'
      '        or'
      '           RTrim(report_name) is not NULL )'
      '   and ( :arcusto_id = arcusto_id '
      '         or '
      '         arcusto_id is NULL'
      '         or'
      
        '         arcusto_id in (select arcusto_id from ps_ticket_arcusto' +
        ' where ps_ticket_id = :id))'
      ' order by'
      '       decode( arcusto_id, NULL, 2, 1 ),'
      '       label_menu_name')
    Left = 84
    Top = 179
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryLabelCustLABEL_MENU_NAME: TStringField
      DisplayLabel = 'Label Name'
      DisplayWidth = 25
      FieldName = 'LABEL_MENU_NAME'
      Size = 25
    end
    object QryLabelCustLABEL_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 25
      FieldName = 'LABEL_TYPE'
      Size = 25
    end
    object QryLabelCustLABEL_KIND: TStringField
      DisplayLabel = 'Kind'
      DisplayWidth = 10
      FieldName = 'LABEL_KIND'
      Size = 10
    end
    object QryLabelCustID: TBCDField
      DisplayLabel = 'Label ID'
      DisplayWidth = 10
      FieldName = 'ID'
      Size = 0
    end
    object QryLabelCustARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryLabelCustLABEL_FILE: TStringField
      DisplayWidth = 25
      FieldName = 'LABEL_FILE'
      Visible = False
      Size = 25
    end
    object QryLabelCustREMOTE_SERVER: TStringField
      DisplayWidth = 50
      FieldName = 'REMOTE_SERVER'
      Visible = False
      Size = 50
    end
    object QryLabelCustEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryLabelCustCOMM_PORT: TStringField
      DisplayWidth = 10
      FieldName = 'COMM_PORT'
      Visible = False
      Size = 10
    end
    object QryLabelCustREPORT_NAME: TStringField
      DisplayWidth = 100
      FieldName = 'REPORT_NAME'
      Visible = False
      Size = 100
    end
  end
  object SrcPSTicketDtl: TDataSource
    DataSet = QryPSTicketDtl
    OnDataChange = SrcPSTicketDtlDataChange
    Left = 16
    Top = 268
  end
  object QryPSTicketDtl: TFDQuery
    Tag = 1
    BeforePost = QryPSTicketDtlBeforePost
    OnCalcFields = QryPSTicketDtlCalcFields
    MasterSource = SrcPsTicket
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PS_TICKET_DTL'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLPSTicketDtl
    SQL.Strings = (
      'select td.id,'
      '       td.seq,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.rev,'
      '       a.class,'
      '       o.orderno,'
      '       o.pono,'
      '       td.ship_quan * NVL(d.uom_factor,1) as ship_quan,'
      '       td.batch_label_standard_id,'
      '       td.batch_label_lotno,'
      '       td.batch_label_pk_opmat_id,'
      '       td.batch_label_qty,'
      '       td.batch_label_box_qty,'
      '       td.batch_label_weight,'
      '       td.ord_detail_id,'
      '       o.id as orders_id,'
      '       d.arinvt_id,'
      '       td.cuser1,'
      '       td.cuser2,'
      '       td.cuser3,'
      '       td.cuser4,'
      '       td.cuser5,'
      '       td.cuser6,'
      '       td.cuser7,'
      '       td.cuser8,'
      '       td.cuser9,'
      '       td.cuser10,'
      '       td.nuser1,'
      '       td.nuser2,'
      '       td.nuser3,'
      '       td.nuser4,'
      '       td.nuser5,'
      '       td.nuser6,'
      '       td.nuser7,'
      '       td.nuser8,'
      '       td.nuser9,'
      '       td.nuser10,'
      '       td.batch_label_selected,'
      '       c.custno,'
      '       c.company,'
      '       s.attn as ship_to_attn'
      '  from '
      '       ps_ticket_dtl td,'
      '       orders o,'
      '       ord_detail d,'
      '       arinvt a,'
      '       ship_to s,'
      '       arcusto c'
      '  '
      ' where td.ps_ticket_id = :id'
      '   and td.ord_detail_id = d.id(+)'
      '   and d.orders_id = o.id(+)'
      '   and d.arinvt_id = a.id(+)'
      '   and o.ship_to_id = s.id(+)'
      '   and o.arcusto_id = c.id(+)'
      ''
      'order by td.seq'
      '   ')
    Left = 17
    Top = 284
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryPSTicketDtlBATCH_LABEL_SELECTED: TStringField
      DisplayLabel = 'Selected'
      DisplayWidth = 8
      FieldName = 'BATCH_LABEL_SELECTED'
      Size = 1
    end
    object QryPSTicketDtlSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 3
      FieldName = 'SEQ'
      ReadOnly = True
      Size = 0
    end
    object QryPSTicketDtlITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 21
      FieldName = 'ITEMNO'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object QryPSTicketDtlMfgNo: TStringField
      DisplayLabel = 'MFG #'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'MfgNo'
      Size = 25
      Calculated = True
    end
    object QryPSTicketDtlOpmatItemno: TStringField
      DisplayLabel = 'Package'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'OpmatItemno'
      Size = 25
      Calculated = True
    end
    object QryPSTicketDtlBATCH_LABEL_QTY: TBCDField
      DisplayLabel = 'Labels Quantity'
      DisplayWidth = 13
      FieldName = 'BATCH_LABEL_QTY'
      Size = 0
    end
    object QryPSTicketDtlBATCH_LABEL_BOX_QTY: TBCDField
      DisplayLabel = 'Parts / Package'
      DisplayWidth = 10
      FieldName = 'BATCH_LABEL_BOX_QTY'
      Size = 0
    end
    object QryPSTicketDtlBATCH_LABEL_WEIGHT: TFMTBCDField
      DisplayLabel = 'Weight'
      DisplayWidth = 11
      FieldName = 'BATCH_LABEL_WEIGHT'
      Size = 6
    end
    object QryPSTicketDtlBATCH_LABEL_LOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 10
      FieldName = 'BATCH_LABEL_LOTNO'
      Size = 25
    end
    object QryPSTicketDtlOpmatVolume: TFloatField
      DisplayLabel = 'Volume'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'OpmatVolume'
      ReadOnly = True
      Calculated = True
    end
    object QryPSTicketDtlORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 12
      FieldName = 'ORDERNO'
      ReadOnly = True
      Size = 15
    end
    object QryPSTicketDtlPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 12
      FieldName = 'PONO'
      ReadOnly = True
      Size = 35
    end
    object QryPSTicketDtlSHIP_QUAN: TFMTBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'SHIP_QUAN'
      ReadOnly = True
      Size = 38
    end
    object QryPSTicketDtlCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object QryPSTicketDtlCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      ReadOnly = True
      Size = 60
    end
    object QryPSTicketDtlSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_ATTN'
      ReadOnly = True
      Size = 60
    end
    object QryPSTicketDtlOpmatPtsPer: TFloatField
      DisplayLabel = 'Box Qty'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'OpmatPtsPer'
      ReadOnly = True
      Visible = False
      Calculated = True
    end
    object QryPSTicketDtlBATCH_LABEL_STANDARD_ID: TBCDField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 21
      FieldName = 'BATCH_LABEL_STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryPSTicketDtlBATCH_LABEL_PK_OPMAT_ID: TBCDField
      DisplayLabel = 'Package'
      DisplayWidth = 10
      FieldName = 'BATCH_LABEL_PK_OPMAT_ID'
      Visible = False
      Size = 0
    end
    object QryPSTicketDtlARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryPSTicketDtlORD_DETAIL_ID: TBCDField
      DisplayWidth = 14
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryPSTicketDtlORDERS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORDERS_ID'
      Visible = False
      Size = 0
    end
    object QryPSTicketDtlDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      ReadOnly = True
      Visible = False
      Size = 100
    end
    object QryPSTicketDtlREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 15
    end
    object QryPSTicketDtlCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 2
    end
    object QryPSTicketDtlID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryPSTicketDtlOpmatWeight: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'OpmatWeight'
      ReadOnly = True
      Visible = False
      Calculated = True
    end
    object QryPSTicketDtlCUSER1: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER1'
      Visible = False
      Size = 60
    end
    object QryPSTicketDtlCUSER2: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER2'
      Visible = False
      Size = 60
    end
    object QryPSTicketDtlCUSER3: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER3'
      Visible = False
      Size = 60
    end
    object QryPSTicketDtlCUSER4: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER4'
      Visible = False
      Size = 60
    end
    object QryPSTicketDtlCUSER5: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER5'
      Visible = False
      Size = 60
    end
    object QryPSTicketDtlCUSER6: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER6'
      Visible = False
      Size = 60
    end
    object QryPSTicketDtlCUSER7: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER7'
      Visible = False
      Size = 60
    end
    object QryPSTicketDtlCUSER8: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER8'
      Visible = False
      Size = 60
    end
    object QryPSTicketDtlCUSER9: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER9'
      Visible = False
      Size = 60
    end
    object QryPSTicketDtlCUSER10: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER10'
      Visible = False
      Size = 60
    end
    object QryPSTicketDtlNUSER1: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER1'
      Visible = False
      Size = 6
    end
    object QryPSTicketDtlNUSER2: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER2'
      Visible = False
      Size = 6
    end
    object QryPSTicketDtlNUSER3: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER3'
      Visible = False
      Size = 6
    end
    object QryPSTicketDtlNUSER4: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER4'
      Visible = False
      Size = 6
    end
    object QryPSTicketDtlNUSER5: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER5'
      Visible = False
      Size = 6
    end
    object QryPSTicketDtlNUSER6: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER6'
      Visible = False
      Size = 6
    end
    object QryPSTicketDtlNUSER7: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER7'
      Visible = False
      Size = 6
    end
    object QryPSTicketDtlNUSER8: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER8'
      Visible = False
      Size = 6
    end
    object QryPSTicketDtlNUSER9: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER9'
      Visible = False
      Size = 6
    end
    object QryPSTicketDtlNUSER10: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER10'
      Visible = False
      Size = 6
    end
    object QryPSTicketDtlOpmatArinvt_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OpmatArinvt_ID'
      Visible = False
      Calculated = True
    end
  end
  object UpdateSQLPSTicketDtl: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into ps_ticket_dtl'
      
        '  (BATCH_LABEL_STANDARD_ID, BATCH_LABEL_LOTNO, BATCH_LABEL_PK_OP' +
        'MAT_ID, '
      
        '   BATCH_LABEL_QTY, BATCH_LABEL_BOX_QTY, BATCH_LABEL_WEIGHT, CUS' +
        'ER1, CUSER2, '
      
        '   CUSER3, CUSER4, CUSER5, CUSER6, CUSER7, CUSER8, CUSER9, CUSER' +
        '10, NUSER1, '
      
        '   NUSER2, NUSER3, NUSER4, NUSER5, NUSER6, NUSER7, NUSER8, NUSER' +
        '9, NUSER10, '
      '   BATCH_LABEL_SELECTED)'
      'values'
      
        '  (:BATCH_LABEL_STANDARD_ID, :BATCH_LABEL_LOTNO, :BATCH_LABEL_PK' +
        '_OPMAT_ID, '
      
        '   :BATCH_LABEL_QTY, :BATCH_LABEL_BOX_QTY, :BATCH_LABEL_WEIGHT, ' +
        ':CUSER1, '
      
        '   :CUSER2, :CUSER3, :CUSER4, :CUSER5, :CUSER6, :CUSER7, :CUSER8' +
        ', :CUSER9, '
      
        '   :CUSER10, :NUSER1, :NUSER2, :NUSER3, :NUSER4, :NUSER5, :NUSER' +
        '6, :NUSER7, '
      '   :NUSER8, :NUSER9, :NUSER10, :BATCH_LABEL_SELECTED)')
    ModifySQL.Strings = (
      'update ps_ticket_dtl'
      'set'
      '  BATCH_LABEL_STANDARD_ID = :BATCH_LABEL_STANDARD_ID,'
      '  BATCH_LABEL_LOTNO = :BATCH_LABEL_LOTNO,'
      '  BATCH_LABEL_PK_OPMAT_ID = :BATCH_LABEL_PK_OPMAT_ID,'
      '  BATCH_LABEL_QTY = :BATCH_LABEL_QTY,'
      '  BATCH_LABEL_BOX_QTY = :BATCH_LABEL_BOX_QTY,'
      '  BATCH_LABEL_WEIGHT = :BATCH_LABEL_WEIGHT,'
      '  CUSER1 = :CUSER1,'
      '  CUSER2 = :CUSER2,'
      '  CUSER3 = :CUSER3,'
      '  CUSER4 = :CUSER4,'
      '  CUSER5 = :CUSER5,'
      '  CUSER6 = :CUSER6,'
      '  CUSER7 = :CUSER7,'
      '  CUSER8 = :CUSER8,'
      '  CUSER9 = :CUSER9,'
      '  CUSER10 = :CUSER10,'
      '  NUSER1 = :NUSER1,'
      '  NUSER2 = :NUSER2,'
      '  NUSER3 = :NUSER3,'
      '  NUSER4 = :NUSER4,'
      '  NUSER5 = :NUSER5,'
      '  NUSER6 = :NUSER6,'
      '  NUSER7 = :NUSER7,'
      '  NUSER8 = :NUSER8,'
      '  NUSER9 = :NUSER9,'
      '  NUSER10 = :NUSER10,'
      '  BATCH_LABEL_SELECTED = :BATCH_LABEL_SELECTED'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ps_ticket_dtl'
      'where'
      '  ID = :OLD_ID')
    Left = 16
    Top = 302
  end
  object QryMfgNo: TFDQuery
    BeforeOpen = QryMfgNoBeforeOpen
    MasterSource = SrcPSTicketDtl
    MasterFields = 'ARINVT_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select s.mfgno,'
      '       s.id'
      '  from standard s,'
      '       partno p,'
      '       arinvt a'
      ' where p.arinvt_id = :arinvt_id'
      '   and p.standard_id = s.id'
      '   and NVL(s.pk_hide, '#39'N'#39') <> '#39'Y'#39
      ''
      '   and p.arinvt_id = a.id'
      ''
      'order by decode( p.standard_id, a.standard_id, 1, 2 ),'
      '       s.mfgno   ')
    Left = 48
    Top = 268
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryMfgNoMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Size = 50
    end
    object QryMfgNoID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object QryPackaging: TFDQuery
    BeforeOpen = QryPackagingBeforeOpen
    MasterSource = SrcPSTicketDtl
    MasterFields = 'ARINVT_ID'
    DetailFields = 'ARINVT_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       rtrim(a.itemno) as itemno,'
      '       rtrim(a.descrip) as descrip,'
      '       o.weight,'
      '       o.arinvt_id,'
      '       o.ptsper,'
      '       o.seq,'
      '       p.boxno,'
      '       o.id'
      '  from partno p,'
      '       standard std,'
      '       ptoper t,'
      '       sndop s,'
      '       opmat o,'
      '       arinvt a,'
      '       arinvt a2'
      ' where '
      '       p.arinvt_id = :arinvt_id'
      '   and p.standard_id = std.id'
      '   and t.partno_id = p.id       -- ptoper'
      '   and t.sndop_id = s.id        -- sndop'
      '   and s.op_class = '#39'PK'#39'    '
      '   and o.sndop_id = s.id        -- opmat'
      '   and o.arinvt_id = a.id(+)'
      '   '
      '   and a2.id = :arinvt_id'
      '   and NVL(std.pk_hide, '#39'N'#39') = '#39'N'#39
      ' order by '
      '       decode( sign(a2.standard_id - p.standard_id), 0, 1, 2 ),'
      '       o.seq       '
      ''
      '  '
      ''
      ' ')
    Left = 80
    Top = 269
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryPackagingITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryPackagingDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryPackagingWEIGHT: TFMTBCDField
      DisplayLabel = 'Weight'
      DisplayWidth = 10
      FieldName = 'WEIGHT'
      Size = 6
    end
    object QryPackagingPTSPER: TFMTBCDField
      DisplayLabel = 'Pts Per'
      DisplayWidth = 10
      FieldName = 'PTSPER'
      Size = 6
    end
    object QryPackagingSEQ: TBCDField
      DisplayLabel = 'Seq'
      DisplayWidth = 10
      FieldName = 'SEQ'
      Size = 0
    end
    object QryPackagingARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryPackagingBOXNO: TBCDField
      DisplayLabel = 'Box #'
      DisplayWidth = 10
      FieldName = 'BOXNO'
      Visible = False
      Size = 0
    end
    object QryPackagingID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 464
    Top = 1
    object File1: TUniMenuItem
      Caption = 'File'
      object Close1: TUniMenuItem
        Caption = 'Close'
        OnClick = Close1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Pick Ticket Batch Labels'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192741 $'
    BuildVersion = '176554'
    Left = 496
    Top = 1
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryPsTicket'
      'QryPSTicketDtl'
      'sbnEditBoxNum'
      'sbtnLabelsMaintenance'
      'btnOK'
      'PrintAll1'
      'PrintSelected1')
    SecurityCode = 'FRMPSTKBATCHLABELS'
    Left = 432
    Top = 1
  end
  object SrcBillTo: TDataSource
    DataSet = QryBillTo
    Left = 296
    Top = 208
  end
  object SrcLableCust: TDataSource
    DataSet = QryLabelCust
    Left = 424
    Top = 216
  end
  object SrcMfg: TDataSource
    DataSet = QryMfgNo
    Left = 304
    Top = 216
  end
  object SrcPackeging: TDataSource
    DataSet = QryPackaging
    Left = 312
    Top = 224
  end
end
