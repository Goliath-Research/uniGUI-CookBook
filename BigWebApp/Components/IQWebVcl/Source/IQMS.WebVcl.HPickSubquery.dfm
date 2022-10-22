object FrmHPickSubquery: TFrmHPickSubquery
  Left = 0
  Top = 0
  ClientHeight = 512
  ClientWidth = 608
  Caption = 'Select Component Where Used Filter'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  ActiveControl = IQSearch1
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 470
    Top = 0
    Width = 138
    Height = 490
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object btnOK: TUniBitBtn
      Left = 8
      Top = 16
      Width = 120
      Height = 25
      Hint = 'Apply selected filter'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFB6BCB76E7780E2CCBDFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBBBBBB78
        7878CBCBCBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFAAB0B710B8F02080B0D3C0B1FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B2B2C0
        C0C0888888BEBEBEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBEC5C0A0F0FF90E8FF2078A0D1BCACFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC4C4C4EF
        EFEFE9E9E97E7E7EBBBBBBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFA6BEC3E0FFFF80E8FF207090D2B9A7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBE
        BEBEFDFDFDE8E8E8747474B8B8B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9DBCCFE0FFFF60E0FF206890C6AE
        A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFBEBEBEFDFDFDE2E2E26F6F6FADADADFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF7C929B7A8592626A737C837FD0FFFF50D8FF3050
        70CFB3A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93939387
        87876B6B6B828282FDFDFDDBDBDB565656B2B2B2FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF70707040404070A0B0C0F8FFD0FFFFC0FFFFB0F8FF80E8FF70E0
        FF304860CEAF9BFF00FFFF00FFFF00FFFF00FFFF00FF707070404040A1A1A1F7
        F7F7FDFDFDFCFCFCF6F6F6E8E8E8E2E2E24D4D4DAEAEAEFF00FFFF00FFFF00FF
        FF00FFFF00FF707070505050304850A0D8E0E0FFFFC0FFFF40D0FF598CA1CAAE
        99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070505050484848D7
        D7D7FDFDFDFCFCFCD6D6D68E8E8EACACACFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF707070707070404040A3CCDBC0F8FFD0FFFFB0F8FF20C8FF5078
        80DCB9A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070404040CD
        CDCDF7F7F7FDFDFDF6F6F6D0D0D0777777B7B7B7FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF707070909890504850D4CEC696D1DEE0FFFFC0FFFF80E8FF20C8
        FF596673DBB59BFF00FFFF00FFFF00FFFF00FFFF00FF7070709696964A4A4ACD
        CDCDD1D1D1FDFDFDFCFCFCE8E8E8D0D0D0686868B3B3B3FF00FFFF00FFFF00FF
        FF00FFD3C8B9909090D0C8C0505850BAA69CAACEDAC3EEEDD0FFFFC0FFFF60E0
        FF4AB9DC595655E2B99BFF00FFFF00FFFF00FFC6C6C6909090C7C7C7555555A6
        A6A6CFCFCFECECECFDFDFDFCFCFCE2E2E2BCBCBC565656B7B7B7FF00FFFF00FF
        DACBBF808880F0F0F0E0D8D0909890404840C7C5BAA3D2DA90D0E090D0E080C8
        E080B0D07098B0A7958AFF00FFFF00FFCACACA868686F0F0F0D7D7D796969646
        4646C3C3C3D1D1D1D0D0D0D0D0D0CACACAB5B5B59B9B9B949494FF00FFE5D3C9
        707070F0E8F0FFF8FFF0E8E0D0D0D0707070404840D9C1AEFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFD3D3D3707070EBEBEBFAFAFAE7E7E7D0D0D070
        7070464646BFBFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFCFC7707070
        C0C8C0FFFFFFF0F8F0F0F0F0D0D8D0B0A8B0606060404840CDB5A2FF00FFFF00
        FFFF00FFFF00FFFF00FFCFCFCF707070C6C6C6FFFFFFF6F6F6F0F0F0D6D6D6AB
        ABAB606060464646B4B4B4FF00FFFF00FFFF00FFFF00FFFF00FFC0B8C0C0C0C0
        D0C8D0C0C0C0B0B8B0B0B0B0B0B0B0A0A0A0808080606060404840FF00FFFF00
        FFFF00FFFF00FFFF00FFBBBBBBC0C0C0CBCBCBC0C0C0B6B6B6B0B0B0B0B0B0A0
        A0A0808080606060464646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TUniBitBtn
      Left = 8
      Top = 80
      Width = 120
      Height = 25
      Hint = ''
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FF9494946D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D
        6D6D6D6D6D6D6D949494FF00FFFF00FFFF00FF9494946D6D6D6D6D6D6D6D6D6D
        6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D949494FF00FFFF00FF
        FF00FF727272C9C9C9D6D6D6E2E2E2EDEDEDF4F4F4F8F8F8F6F6F6EFEFEFE5E5
        E5D8D8D8CBCBCB727272FF00FFFF00FFFF00FF727272C9C9C9D6D6D6E2E2E2ED
        EDEDF4F4F4F8F8F8F6F6F6EFEFEFE5E5E5D8D8D8CBCBCB727272FF00FFFF00FF
        FF00FF92949293766D93766D93766D93766D93766D93766D93766D93766D9376
        6D93766D93766D949494FF00FFFF00FFFF00FF94949476767676767676767676
        7676767676767676767676767676767676767676767676949494FF00FFFF00FF
        43996343996393766DFAD0BD262524D9AF9DD2A998CCA393C69E8EC098899376
        6DFAD0BD93766DFF00FFFF00FFFF00FF8B8B8B8B8B8B767676D0D0D0252525AF
        AFAFA9A9A9A3A3A39F9F9F999999767676D0D0D0767676FF00FFFF00FFFF00FF
        4399635AD47E459B5BFAD0BD262524E2B7A5DCB1A0D6AC9ACFA695C9A0909376
        6DFAD0BD93766DFF00FFFF00FFFF00FF8B8B8BBFBFBF8C8C8CD0D0D0252525B7
        B7B7B1B1B1ACACACA6A6A6A1A1A1767676D0D0D0767676FF00FF439963439963
        43996365F19086D99D469B5C262524EABFADDCB8A9DFB4A2D9AF9DD2A9989376
        6DFAD0BD93766DFF00FF8B8B8B8B8B8B8B8B8BDADADAC9C9C98C8C8C252525BF
        BFBFB8B8B8B4B4B4AFAFAFA9A9A9767676D0D0D0767676FF00FF4399631DBB3C
        27D24C65F190A8F9BF9FDAAF469B5C90A8B34B95B88DA4B0E2B7A5DCB1A09376
        6DFAD0BD93766DFF00FF8B8B8BA3A3A3B8B8B8DADADAEAEAEACECECE8C8C8CA9
        A9A99A9A9AA5A5A5B7B7B7B1B1B1767676D0D0D0767676FF00FF4399631DBB3C
        27D24C65F190A8F9BFA4DDB4489C5D4B95B6C9FDFD4B95B8E1BCADE5BAA89376
        6DFAD0BD93766DFF00FF8B8B8BA3A3A3B8B8B8DADADAEAEAEAD2D2D28D8D8D99
        9999FAFAFA9A9A9ABCBCBCBABABA767676D0D0D0767676FF00FF439963439963
        43996365F19088DB9F479C5D26252494ADB94B95B892AAB6F1C6B3EDC2AF9376
        6DFAD0BD93766DFF00FF8B8B8B8B8B8B8B8B8BDADADACBCBCB8D8D8D252525AE
        AEAE9A9A9AABABABC6C6C6C2C2C2767676D0D0D0767676FF00FFFF00FFFF00FF
        4399635AD47E469C5CFAD0BD262524FCD8C7F0D1C1F8D1BEF6CDBAF3C9B69376
        6DF9CFBC93766DFF00FFFF00FFFF00FF8B8B8BBFBFBF8D8D8DD0D0D0252525D8
        D8D8D1D1D1D1D1D1CDCDCDC9C9C9767676CFCFCF767676FF00FFFF00FFFF00FF
        43996343996393766DFAD0BD262524FDDDCDFCDAC9FBD6C5F9D3C0F7CFBC9376
        6DFAD0BD93766DFF00FFFF00FFFF00FF8B8B8B8B8B8B767676D0D0D0252525DD
        DDDDDADADAD6D6D6D3D3D3CFCFCF767676D0D0D0767676FF00FFFF00FFFF00FF
        FF00FFFF00FF93766DFAD0BD262524FDE2D3FDDFCFFDDCCBFCD8C7FAD5C29376
        6DFAD0BD93766DFF00FFFF00FFFF00FFFF00FFFF00FF767676D0D0D0252525E2
        E2E2DFDFDFDCDCDCD8D8D8D5D5D5767676D0D0D0767676FF00FFFF00FFFF00FF
        FF00FFFF00FF93766DFAD0BD262524FEE6D8FDE3D5FDE0D1FDDDCDFCDAC99376
        6DFAD0BD93766DFF00FFFF00FFFF00FFFF00FFFF00FF767676D0D0D0252525E6
        E6E6E3E3E3E0E0E0DDDDDDDADADA767676D0D0D0767676FF00FFFF00FFFF00FF
        FF00FFFF00FF93766DFAD0BD5648432C2A29524C49756B658777709A847B9376
        6DFAD0BD93766DFF00FFFF00FFFF00FFFF00FFFF00FF767676D0D0D04848482A
        2A2A4C4C4C6B6B6B777777848484767676D0D0D0767676FF00FFFF00FFFF00FF
        FF00FFFF00FF93766DFAD0BDFAD0BDFAD0BDFAD0BDFAD0BDFAD0BDFAD0BDFAD0
        BDFAD0BD93766DFF00FFFF00FFFF00FFFF00FFFF00FF767676D0D0D0D0D0D0D0
        D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0767676FF00FFFF00FFFF00FF
        FF00FFFF00FFAA999493766D93766D93766D93766D93766D93766D93766D9376
        6D93766DAA9994FF00FFFF00FFFF00FFFF00FFFF00FF99999976767676767676
        7676767676767676767676767676767676767676999999FF00FF}
      Caption = 'Exit'
      ModalResult = 2
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnClear: TUniBitBtn
      Left = 8
      Top = 48
      Width = 120
      Height = 25
      Hint = 'Clear existing filter'
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
        FF00FFFF00FFFF00FFFF00FFACA8DA1020E0CABACFFF00FFFF00FFFF00FFFF00
        FFA490BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB5B5B572
        7272C0C0C0FF00FFFF00FFFF00FFFF00FF9D9D9DFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0028FF1028F04050D0FF00FFFF00FFFF00FF3B49
        D30010B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8383837C
        7C7C7A7A7AFF00FFFF00FFFF00FF787878575757FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF2C50FB1030FF0028FFFF00FFFF00FF7976D80018
        C06867CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8D8D8D85
        8585838383FF00FFFF00FF939393606060878787FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF7070704040401010203050FF2040FF8B8BDEADA1CE0028F04058
        F0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070704040401414148E
        8E8E898989A1A1A1ADADAD7B7B7B8B8B8BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF707070505050100810DBCAD44A67FB3050FF2040FF3050FFE3C0
        B1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070705050500B0B0BCE
        CECE9797978E8E8E8989898E8E8EC0C0C0FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF707070707070404040FF00FFCEC0D24068FF4060FFC2B0C5FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070404040FF
        00FFC5C5C5989898959595B6B6B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF707070909890504850BBB6D25078FF5078FF647BF64A6EFADABB
        B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070709696964A4A4ABD
        BDBDA0A0A0A0A0A09F9F9F999999BDBDBDFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD3C7B8909090D0C8C05068A05078FF5078FFB8B3D6FF00FF6382F55975
        FAC7ACBCFF00FFFF00FFFF00FFFF00FFFF00FFC5C5C5909090C7C7C7767676A0
        A0A0A0A0A0BCBCBCFF00FFA3A3A39D9D9DB2B2B2FF00FFFF00FFFF00FFFF00FF
        DACBBD808880F0F0F08098F05078FF5078FFB9B0BCFF00FFFF00FFFF00FFAAA5
        D0778AE9FF00FFFF00FFFF00FFFF00FFCACACA868686F0F0F0AFAFAFA0A0A0A0
        A0A0B4B4B4FF00FFFF00FFFF00FFB0B0B0A4A4A4FF00FFFF00FFFF00FFE5D3C7
        707070F0E8F0FFF8FF8098FF6080FF707890404840D7BDA9FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFD2D2D2707070EBEBEBFAFAFAB4B4B4A5A5A57D
        7D7D464646BBBBBBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFCEC6707070
        C0C8C0FFFFFFF0F8F0F0F0F0D0D8D0B0A8B0606060404840CBB19DFF00FFFF00
        FFFF00FFFF00FFFF00FFCECECE707070C6C6C6FFFFFFF6F6F6F0F0F0D6D6D6AB
        ABAB606060464646B0B0B0FF00FFFF00FFFF00FFFF00FFFF00FFC0B8C0C0C0C0
        D0C8D0C0C0C0B0B8B0B0B0B0B0B0B0A0A0A0808080606060404840FF00FFFF00
        FFFF00FFFF00FFFF00FFBBBBBBC0C0C0CBCBCBC0C0C0B6B6B6B0B0B0B0B0B0A0
        A0A0808080606060464646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = 'Clear'
      TabOrder = 1
      OnClick = btnClearClick
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 470
    Height = 490
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 0
      Top = 238
      Width = 470
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 468
      Height = 238
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object IQSearch1: TIQUniGridControl
        Left = 1
        Top = 47
        Width = 466
        Height = 191
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 249
        IQComponents.Grid.Height = 105
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcHeader
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
        IQComponents.Navigator.DataSource = SrcHeader
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 249
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 105
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
        DataSource = SrcHeader
        Columns = <
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Filter Description'
            Width = 525
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object PnlToolbarFilters: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 466
        Height = 47
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object PnlToolbarFiltersCaption: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 464
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object lblFilterCaptionLabel: TUniLabel
            Left = 1
            Top = 1
            Width = 35
            Height = 13
            Hint = ''
            Caption = 'Filters'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object PnlToolbarFiltersInner: TUniPanel
          Tag = 1999
          Left = 1
          Top = 20
          Width = 464
          Height = 27
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object navMain: TUniDBNavigator
            Left = 239
            Top = 1
            Width = 225
            Height = 25
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataSource = SrcHeader
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 241
      Width = 468
      Height = 249
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object wwDBGrid1: TIQUniGridControl
        Left = 1
        Top = 47
        Width = 466
        Height = 202
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 249
        IQComponents.Grid.Height = 116
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcDetail
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
        IQComponents.Navigator.DataSource = SrcDetail
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 249
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 116
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
        DataSource = SrcDetail
        Columns = <
          item
            FieldName = 'ItemNo'
            Title.Caption = 'Item #'
            Width = 175
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BINARY_OPERATOR'
            Title.Caption = 'And ~ Or'
            Width = 77
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Descrip'
            Title.Caption = 'Description'
            Width = 196
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Class'
            Title.Caption = 'Class'
            Width = 28
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Rev'
            Title.Caption = 'Rev'
            Width = 105
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Descrip2'
            Title.Caption = 'Ext Description'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPlant_ID'
            Title.Caption = 'EPlant ID'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object wwDBComboDlgItemNo: TUniEdit
        Left = 64
        Top = 100
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
        ReadOnly = True
      end
      object wwDBComboBoxOperator: TUniDBComboBox
        Left = 64
        Top = 136
        Width = 121
        Height = 21
        Hint = ''
        Style = csDropDownList
        Items.Strings = (
          'AND'
          'OR')
        TabOrder = 2
      end
      object PnlToolbarComponents: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 466
        Height = 47
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Caption = ''
        object PnlToolbarComponentsCaption: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 464
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object lblCaptionComponentsLabel: TUniLabel
            Left = 1
            Top = 1
            Width = 71
            Height = 13
            Hint = ''
            Caption = 'Components'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object PnlToolbarComponentsInner: TUniPanel
          Tag = 1999
          Left = 1
          Top = 20
          Width = 464
          Height = 27
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object navDetail: TUniDBNavigator
            Left = 239
            Top = 1
            Width = 225
            Height = 25
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataSource = SrcDetail
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
  end
  object StatusBar1: TUniStatusBar
    AlignWithMargins = True
    Left = 0
    Top = 493
    Width = 608
    Height = 19
    Hint = ''
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Panels = <
      item
        Width = 500
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object SrcHeader: TDataSource
    DataSet = QryHeader
    Left = 68
    Top = 104
  end
  object SrcDetail: TDataSource
    DataSet = QryDetail
    Left = 108
    Top = 104
  end
  object QryHeader: TFDQuery
    BeforeOpen = QryHeaderBeforeOpen
    BeforePost = QryHeaderBeforePost
    OnNewRecord = QryHeaderNewRecord
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select id,'
      '       module_name,'
      '       descrip'
      '  from hpick_subquery_hdr'
      ' where module_name = :module_name')
    Left = 68
    Top = 132
    ParamData = <
      item
        Name = 'MODULE_NAME'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryHeaderID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryHeaderMODULE_NAME: TStringField
      FieldName = 'MODULE_NAME'
      Origin = 'MODULE_NAME'
      Required = True
      Visible = False
      Size = 30
    end
    object QryHeaderDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Required = True
      Size = 250
    end
  end
  object QryDetail: TFDQuery
    BeforeInsert = PostParentBeforeEdit
    BeforeEdit = PostParentBeforeEdit
    BeforePost = QryDetailBeforePost
    OnCalcFields = QryDetailCalcFields
    OnNewRecord = QryDetailNewRecord
    MasterSource = SrcHeader
    MasterFields = 'ID'
    DetailFields = 'ID'
    ConnectionName = 'IQFD'
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select id,'
      '       hpick_subquery_hdr_id,'
      '       value,'
      '       binary_operator'
      '  from hpick_subquery_dtl '
      ' where hpick_subquery_hdr_id = :id'
      ' order by id'
      '         ')
    Left = 108
    Top = 132
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryDetailID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryDetailHPICK_SUBQUERY_HDR_ID: TBCDField
      FieldName = 'HPICK_SUBQUERY_HDR_ID'
      Origin = 'HPICK_SUBQUERY_HDR_ID'
      Precision = 15
      Size = 0
    end
    object QryDetailVALUE: TBCDField
      DisplayLabel = 'Component ID'
      FieldName = 'VALUE'
      Origin = 'VALUE'
      Required = True
      Precision = 15
      Size = 0
    end
    object QryDetailBINARY_OPERATOR: TStringField
      FieldName = 'BINARY_OPERATOR'
      Origin = 'BINARY_OPERATOR'
      Size = 3
    end
    object QryDetailItemNo: TStringField
      DisplayLabel = 'Item #'
      FieldKind = fkCalculated
      FieldName = 'ItemNo'
      Size = 25
      Calculated = True
    end
    object QryDetailDescrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      Size = 100
      Calculated = True
    end
    object QryDetailRev: TStringField
      FieldKind = fkCalculated
      FieldName = 'Rev'
      Size = 15
      Calculated = True
    end
    object QryDetailClass: TStringField
      FieldKind = fkCalculated
      FieldName = 'Class'
      Size = 2
      Calculated = True
    end
    object QryDetailDescrip2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'Descrip2'
      Size = 100
      Calculated = True
    end
    object QryDetailEPlant_ID: TIntegerField
      DisplayLabel = 'EPlant ID'
      FieldKind = fkCalculated
      FieldName = 'EPlant_ID'
      Calculated = True
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 188
    Top = 104
    object File1: TUniMenuItem
      Caption = 'File'
      object ExcludeSameItemsInOtherEPlants1: TUniMenuItem
        Caption = 'Exclude Same Items in Other EPlants'
        OnClick = ExcludeSameItemsInOtherEPlants1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmHPickSubquery'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191290 $'
    BuildVersion = '176554'
    Left = 220
    Top = 104
  end
end
