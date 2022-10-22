object FrmPMCapacity: TFrmPMCapacity
  Left = 209
  Top = 196
  ClientHeight = 313
  ClientWidth = 659
  Caption = 'MRO Capacity Schedule'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 118
    Top = 0
    Width = 6
    Height = 313
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 124
    Top = 0
    Width = 535
    Height = 313
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object wwDBGridPlan: TIQUniGridControl
      Left = 1
      Top = 27
      Width = 533
      Height = 286
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 316
      IQComponents.Grid.Height = 200
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcCapacityPlan
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
      IQComponents.Navigator.DataSource = SrcCapacityPlan
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 316
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 200
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcCapacityPlan
      Columns = <
        item
          FieldName = 'MFGCELL'
          Title.Caption = 'MRO Cell'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PAST_DUE'
          Title.Caption = 'Past Due'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Period1'
          Title.Caption = 'Period 1'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Period2'
          Title.Caption = 'Period 2'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Period3'
          Title.Caption = 'Period 3'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Period4'
          Title.Caption = 'Period 4'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Period5'
          Title.Caption = 'Period 5'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object PnlToolbar2: TUniPanel
      Left = 1
      Top = 1
      Width = 533
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object sbtnBack: TUniSpeedButton
        Left = 34
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Move Back'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5
          C1AD303830FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFD5C2AF304030304030FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD8C8B760786050
          8060304030FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFD8C9B850605060987070A8804048403040303038302028202020
          20FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCDC2AE50685070A88090D8A070
          C09060A880609870509060408050303830FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF90B8A0C0F0D0B0F0C090E0B090D8A080C89070B88060B0705088603040
          30FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFDAC3A0D0B0C0F8D0B0E8C090
          E0B0A0E0C0A0D8B090C8A090C090404840FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFDFD8C1A0C8B0C0F8D0B0E8C040584090A89080A09080A0908098
          80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFD8C0A0C8B0C0
          F0D0505850FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFDFD7BEA0C0A0507060FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF
          D6BCA0C0A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnBackClick
      end
      object sbtnForward: TUniSpeedButton
        Left = 59
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Move Forward'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80
          9080D5C1ADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF809080202020B4A690FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80
          9080407850202020B8A791FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF809880202820303830304030404840509060407850202020B7A48DFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80A090B0E8C070B08070A88060
          A07060987060A870407850202020B5A189FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF90A890B0F0C090E0B090D8A080D0A070C09070B88060A8705090606078
          60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90B8A0B0F0D0B0F0C0B0E8C0A0
          E8C0A0E0B070C09070B080809880CDC2ABFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF90C0A090B8A090A89080A090809880B0E8C080C890809880CEC5AEFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80
          A090A0E0C0809880D0C8B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF90A890809880D1CBB6FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
          B8A0DFD6BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnForwardClick
      end
      object bbtnSearch: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Search...'
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
        OnClick = bbtnSearchClick
      end
      object Bevel1: TUniPanel
        Left = 29
        Top = 3
        Width = 2
        Height = 21
        Hint = ''
        TabOrder = 5
        Caption = ''
      end
      object sbtnAddWorkorder: TUniSpeedButton
        Tag = 1
        Left = 91
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Add Workorder'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFBCC3B86F965B3B75252665122664133B75256E955ABCC3B7FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF769B63185F0607580203790701
          8401018504027A0B055605155906749A61FF00FFFF00FFFF00FFFF00FFFF00FF
          5E8E470A590105861800C41D02BC0B01C30101C10101D11600C72D05831D0854
          015B8B44FF00FFFF00FFFF00FF83A2720A5B0105982C00D43C00D12010BD1CDD
          EDE2C6D5D103AF1501D43201D54C0998340A54017E9F6DFF00FFC5C8C31F6D10
          0E812505D65D00D34200D22812C025FFFFFFFFFFFF02B11801D43301D54D0ED7
          67108127176109C4C7C281A17007711221C15E05D55901CE3D01D53009C824FF
          FFFFFFFFFF03B11D00DC3D00D65309D76621C4620569107C9E6A4F914B078124
          22DD7027AB5122933C28A13E35B149FFFFFFFFFFFF2CA3424FB4695AB2762F9E
          541ED571057E204886383D8E4908932F0CDF6473D28FC8E4CDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF73AF820ED467099B32397F2D3F904E048F2B
          01D75A60C179E7FBE7F7FFF7FFFFFFFFFFFFFFFFFFFFFFFFF9FFFCF1FBF174B7
          8300D46009962C3B7F2C599C6407802701D35203AC3302B73A0AC14A21BA58FF
          FFFFC8E4CD23AF5223C96215C15B05C15102D560057410538A3B92AC8B0D8E40
          05A83701CD490DCA5430D07054C383FFFFFFFFFFFF40AF684DDB8D2ED87809D7
          6707BA49096D028CA77BFF00FF2B9257077F2702C84C18CC5D41CC786DBC90FF
          FFFFFFFFFF5CB77E5EDC9737D88010D5670778172A7512FF00FFFF00FFA0B49B
          149156067D2213C45548CE814CAE6A65AE7A67B37C51B7715AD99420D26C0783
          21146E0D9FB293FF00FFFF00FFFF00FF8BAC8B1491590673250B9B3430CF6E50
          D9894DDD8B31D8760CA63C056F15146F1988A679FF00FFFF00FFFF00FFFF00FF
          FF00FFA3B7A13699670D8B56077333057128057025076D250A722E35843EA1B4
          99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF85AA884296631D
          91591D8D513F905584A781FF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnAddWorkorderClick
      end
      object Bevel2: TUniPanel
        Left = 87
        Top = 3
        Width = 2
        Height = 21
        Hint = ''
        TabOrder = 7
        Caption = ''
      end
      object sbtnViewWorkorders: TUniSpeedButton
        Left = 116
        Top = 1
        Width = 25
        Height = 25
        Hint = 'View Workorders'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
          FF00FFFF00FF8F9FBE1B4D8E3368A2A9BBD3FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF7F8FA2348871A579517589919
          5DA1648AB7E8EDF0CCE0E7A4D2E090CFE296CBDFAACCDDDAE6EBFF00FFFF00FF
          FF00FFB2BED313488D6E8DAAC0CAD37DA0BE94C0D87FC4DFA7E6F499EEFD7DE8
          FE6FDEFD59CEFA45B2EAFF00FFFF00FFFF00FF5572A4205D9BC8D1D89DC4DA49
          A3D447AEE373CFF567D5F750D2F350D3F653DEFC59E2FE5BD3FAFF00FFFF00FF
          E3E7EE2050954F7EA862A6CD38A1DF2BA3E940B1E633B0E531B4EA3B93C47E8B
          C79AB3E55FAAE83FC7F2FF00FFFF00FF8B9FC22D6AABA7BBCC53A4D137C1F758
          C0E84FC5E747DAFC4CDEFE49D2F37AA5CEC9D4F653A7E79AC7D9FF00FFFAFAFC
          3B65A44983B6EFF0F291CADF63D0F647D3FB5BE4FE7EEDFE8EF0FE7CECFD6ED5
          EE7CC1F361BAE4D9E4EAFF00FFBFCADD3671B787AAC5FFFFFFA7C9D841BCEB4B
          DEFE77E3FB99EDFDAEF3FD98E9FB6DE9FE71DFFB73BED9EAF0F3FF00FF6989BB
          4E8EC8CFD9E1FFFFFFE5ECEF61B6D852D8F986DBF7B4F5FEACEDFB9AE8FB7DE6
          FB71CCEBB2D3E0FF00FFE8EBF23970B871A5CBFCFBFBFFFFFFFFFFFFC7DBE568
          B5D678D8EFA1EDFBB0EAFAA5E5F27DC1DABDD7E1FCFDFEFF00FF99AED05093D4
          B1C8D8FFFFFFFFFFFFFFFFFFFFFFFFF6F8F8B4D5E3A1D1E39FCEDFCBDCE5F5F5
          F6FF00FFFF00FFFF00FF527DBB6FB9F1B4B8C2D9B5A3F8F3F3FFFFFFFFFFFFFF
          FFFFFFFEFEC6D7E6DEE4EDFF00FFFF00FFFF00FFFF00FFFF00FFC6D1E36596CF
          6993BBD28230D18740DAAE89F1E6E1FEFEFEFBFAF8A3BDD6FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFDFDFEC9D3E4A5786DE59A5DEBA457E6A04FE0
          AD7BD6DBE0B7CAE0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB88A80BB6E5EBA685C9C71716978965295D2F3F5F8FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCDB3ACB48B70D7BFB6FAFBFCCF
          D7E5F2F4F7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = ViewWorkorders1Click
      end
      object Panel3: TUniPanel
        Left = 476
        Top = 1
        Width = 57
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitLeft = 351
        object shpAvailable: TUniPanel
          Left = 2
          Top = 8
          Width = 10
          Height = 11
          Hint = 'Available'
          ShowHint = True
          TabOrder = 1
          Caption = ''
        end
        object shpOverBooked: TUniPanel
          Left = 29
          Top = 8
          Width = 10
          Height = 11
          Hint = 'Over-booked'
          ShowHint = True
          TabOrder = 2
          Caption = ''
        end
        object shpBooked: TUniPanel
          Left = 15
          Top = 8
          Width = 10
          Height = 11
          Hint = 'Booked'
          ShowHint = True
          TabOrder = 3
          Caption = ''
        end
      end
    end
  end
  object pnlCriteria: TUniPanel
    Left = 0
    Top = 0
    Width = 118
    Height = 313
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 5
      Top = 38
      Width = 50
      Height = 13
      Hint = ''
      Caption = 'Start Date'
      TabOrder = 4
    end
    object Label2: TUniLabel
      Left = 5
      Top = 87
      Width = 55
      Height = 13
      Hint = ''
      Caption = 'View Period'
      TabOrder = 5
    end
    object PnlToolbar1: TUniPanel
      Left = 1
      Top = 1
      Width = 116
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnApply: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Apply Criteria'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034464034464FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF0344640ED1FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A14D3FF03
          4464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF0099CC1BD5FF1BD5FF034464FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A22
          D7FF22D7FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00669A00669A00669A29DAFF034464034464034464FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A30DCFF30
          DCFF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF00669A37DEFF37DEFF034464FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A3D
          E0FF3DE0FF3DE0FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00669A00669A00669A00669A44E3FF034464034464034464034464FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A4BE5FF4BE5FF4B
          E5FF4BE5FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00669A5CEBFE5CEBFE5CEBFE5CEBFE034464FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0099CC00669A70
          F1FE70F1FE70F1FE70F1FE034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF0099CC0344640344640344640344640344640344
          64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnApplyClick
      end
    end
    object wwDBDateTimePickerStartDate: TUniDBDateTimePicker
      Left = 5
      Top = 54
      Width = 106
      Height = 21
      Hint = ''
      DateTime = 42663.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object wwDBComboBoxViewType: TUniDBComboBox
      Left = 5
      Top = 103
      Width = 106
      Height = 21
      Hint = ''
      Style = csDropDownList
      Items.Strings = (
        'Monthly'#9'M'
        'Weekly'#9'W'
        'Daily'#9'D')
      TabOrder = 2
      OnChange = wwDBComboBoxViewTypeChange
    end
  end
  object SrcCapacityPlan: TDataSource
    DataSet = QryMonthly
    Left = 245
    Top = 97
  end
  object QryMonthly: TFDQuery
    Tag = 1
    BeforeOpen = QryMonthlyBeforeOpen
    BeforeInsert = AbortOnInsert
    CachedUpdates = True
    OnUpdateRecord = QryMonthlyUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '
      '       m.mfgtype,'
      '       m.mfgcell,'
      '       m.descrip as mfgcell_descrip,'
      '       m.id as mfgcell_id,'
      ''
      '       ( select sum( h.prod_hrs ) '
      '           from pm_day_hrs h'
      '          where nvl(m.id,0) = NVL(h.mfgcell_id,0)'
      
        '            and h.week_start between :start_date and :start_date' +
        ' + 140'
      
        '            and trunc(h.prod_date) < trunc(sysdate)) as past_due' +
        ',               '
      '       '
      '       -- period 1'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start, 4 ),'
      '                    1, r.hrs_week_req,'
      '                    0 )) as hrs_req_1,'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start, 4 ),'
      '                    1, a.hrs_week_avail,'
      '                    0 )) as hrs_avail_1,'
      ''
      '       -- period 2'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start, 4 ),'
      '                    2, r.hrs_week_req,'
      '                    0 )) as hrs_req_2,'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start, 4 ),'
      '                    2, a.hrs_week_avail,'
      '                    0 )) as hrs_avail_2,'
      ''
      '       -- period 3'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start, 4 ),'
      '                    3, r.hrs_week_req,'
      '                    0 )) as hrs_req_3,'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start, 4 ),'
      '                    3, a.hrs_week_avail,'
      '                    0 )) as hrs_avail_3,'
      ''
      '       -- period 4'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start, 4 ),'
      '                    4, r.hrs_week_req,'
      '                    0 )) as hrs_req_4,'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start, 4 ),'
      '                    4, a.hrs_week_avail,'
      '                    0 )) as hrs_avail_4,'
      ''
      '       -- period 5'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start, 4 ),'
      '                    5, r.hrs_week_req,'
      '                    0 )) as hrs_req_5,'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start, 4 ),'
      '                    5, a.hrs_week_avail,'
      '                    0 )) as hrs_avail_5'
      ''
      '  from '
      '       mfgcell m,'
      '       v_pm_hrs_week_req r, '
      '       v_pm_hrs_week_avail a'
      ' where'
      '       mfg.is_mfgtype_pm( m.mfgtype ) = 1'
      '   and misc.eplant_filter(m.eplant_id) = 1'
      '   and nvl(m.id,0) = NVL(a.mfgcell_id,0)'
      '   and NVL(a.mfgcell_id, 0) = NVL( r.mfgcell_id(+), 0)'
      '   and a.week_start = r.week_start(+)'
      ''
      'group by '
      '       m.mfgtype,'
      '       m.mfgcell,'
      '       m.descrip,'
      '       m.id'
      ''
      'order by'
      '       m.mfgcell,'
      '       m.mfgtype')
    Left = 249
    Top = 134
    ParamData = <
      item
        Name = 'START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryMonthlyPAST_DUE: TFMTBCDField
      DisplayLabel = 'Past Due'
      DisplayWidth = 11
      FieldName = 'PAST_DUE'
      ReadOnly = True
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryMonthlyPeriod1: TBCDField
      DisplayWidth = 27
      FieldKind = fkCalculated
      FieldName = 'Period1'
      ReadOnly = True
      Size = 0
      Calculated = True
    end
    object QryMonthlyPeriod2: TBCDField
      DisplayWidth = 27
      FieldKind = fkCalculated
      FieldName = 'Period2'
      ReadOnly = True
      Size = 0
      Calculated = True
    end
    object QryMonthlyPeriod3: TBCDField
      DisplayWidth = 27
      FieldKind = fkCalculated
      FieldName = 'Period3'
      ReadOnly = True
      Size = 0
      Calculated = True
    end
    object QryMonthlyPeriod4: TBCDField
      DisplayWidth = 27
      FieldKind = fkCalculated
      FieldName = 'Period4'
      ReadOnly = True
      Size = 0
      Calculated = True
    end
    object QryMonthlyPeriod5: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Period5'
      Size = 0
      Calculated = True
    end
    object QryMonthlyMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 9
      FieldName = 'MFGTYPE'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QryMonthlyMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      DisplayWidth = 9
      FieldName = 'MFGCELL'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 15
    end
    object QryMonthlyHRS_REQ_1: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'HRS_REQ_1'
      ReadOnly = True
      Visible = False
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryMonthlyHRS_AVAIL_1: TFMTBCDField
      DisplayWidth = 11
      FieldName = 'HRS_AVAIL_1'
      ReadOnly = True
      Visible = False
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryMonthlyHRS_REQ_2: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'HRS_REQ_2'
      ReadOnly = True
      Visible = False
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryMonthlyHRS_AVAIL_2: TFMTBCDField
      DisplayWidth = 11
      FieldName = 'HRS_AVAIL_2'
      ReadOnly = True
      Visible = False
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryMonthlyHRS_REQ_3: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'HRS_REQ_3'
      ReadOnly = True
      Visible = False
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryMonthlyHRS_AVAIL_3: TFMTBCDField
      DisplayWidth = 11
      FieldName = 'HRS_AVAIL_3'
      ReadOnly = True
      Visible = False
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryMonthlyHRS_REQ_4: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'HRS_REQ_4'
      ReadOnly = True
      Visible = False
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryMonthlyHRS_REQ_5: TFMTBCDField
      FieldName = 'HRS_REQ_5'
      Size = 38
    end
    object QryMonthlyHRS_AVAIL_5: TFMTBCDField
      FieldName = 'HRS_AVAIL_5'
      Size = 38
    end
    object QryMonthlyMFGCELL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MFGCELL_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryMonthlyHRS_AVAIL_4: TFMTBCDField
      DisplayWidth = 11
      FieldName = 'HRS_AVAIL_4'
      ReadOnly = True
      Visible = False
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryMonthlyMFGCELL_DESCRIP: TStringField
      FieldName = 'MFGCELL_DESCRIP'
      FixedChar = True
      Size = 25
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 324
    Top = 97
    object File1: TUniMenuItem
      Caption = 'File'
      object UpdateCapacitySchedule1: TUniMenuItem
        Caption = 'Update Capacity Schedule'
        OnClick = UpdateCapacitySchedule1Click
      end
      object PMCapacityParameters1: TUniMenuItem
        Caption = 'MRO Capacity Parameters'
        OnClick = PMCapacityParameters1Click
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
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmPMCapacity'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192918 $'
    BuildVersion = '176554'
    Left = 356
    Top = 98
  end
  object QryWeekly: TFDQuery
    Tag = 1
    BeforeOpen = QryMonthlyBeforeOpen
    BeforeInsert = AbortOnInsert
    CachedUpdates = True
    OnUpdateRecord = QryMonthlyUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '
      '       m.mfgtype,'
      '       m.mfgcell,'
      '       m.descrip as mfgcell_descrip,'
      '       m.id as mfgcell_id,'
      ''
      '       ( select sum( h.prod_hrs ) '
      '           from pm_day_hrs h'
      '          where nvl(m.id,0) = NVL(h.mfgcell_id,0)'
      
        '            and h.week_start between :start_date and :start_date' +
        ' + 35'
      '            and h.late = '#39'Y'#39') as past_due,'
      '       '
      '       -- period 1'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start ),'
      '                    1, r.hrs_week_req,'
      '                    0 )) as hrs_req_1,'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start ),'
      '                    1, a.hrs_week_avail,'
      '                    0 )) as hrs_avail_1,'
      ''
      '       -- period 2'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start ),'
      '                    2, r.hrs_week_req,'
      '                    0 )) as hrs_req_2,'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start ),'
      '                    2, a.hrs_week_avail,'
      '                    0 )) as hrs_avail_2,'
      ''
      '       -- period 3'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start ),'
      '                    3, r.hrs_week_req,'
      '                    0 )) as hrs_req_3,'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start ),'
      '                    3, a.hrs_week_avail,'
      '                    0 )) as hrs_avail_3,'
      ''
      '       -- period 4'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start ),'
      '                    4, r.hrs_week_req,'
      '                    0 )) as hrs_req_4,'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start ),'
      '                    4, a.hrs_week_avail,'
      '                    0 )) as hrs_avail_4,'
      '                    '
      '       -- period 5'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start ),'
      '                    5, r.hrs_week_req,'
      '                    0 )) as hrs_req_5,'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start ),'
      '                    5, a.hrs_week_avail,'
      '                    0 )) as hrs_avail_5'
      '                    '
      ''
      '  from '
      '       mfgcell m,'
      '       v_pm_hrs_week_req r, '
      '       v_pm_hrs_week_avail a'
      ' where'
      '       mfg.is_mfgtype_pm( m.mfgtype ) = 1'
      '   and misc.eplant_filter(m.eplant_id) = 1'
      '   and nvl(m.id,0) = NVL(a.mfgcell_id,0)'
      '   and nvl(a.mfgcell_id, 0) = NVL( r.mfgcell_id(+), 0)'
      '   and a.week_start = r.week_start(+)'
      ''
      'group by '
      '       m.mfgtype,'
      '       m.mfgcell,'
      '       m.descrip,'
      '       m.id'
      ''
      'order by'
      '       m.mfgcell,'
      '       m.mfgtype'
      '             ')
    Left = 278
    Top = 134
    ParamData = <
      item
        Name = 'START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryWeeklyMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object QryWeeklyMFGCELL: TStringField
      FieldName = 'MFGCELL'
      FixedChar = True
      Size = 15
    end
    object QryWeeklyMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Size = 0
    end
    object QryWeeklyPAST_DUE: TFMTBCDField
      FieldName = 'PAST_DUE'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWeeklyHRS_REQ_1: TFMTBCDField
      FieldName = 'HRS_REQ_1'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWeeklyHRS_AVAIL_1: TFMTBCDField
      FieldName = 'HRS_AVAIL_1'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWeeklyHRS_REQ_2: TFMTBCDField
      FieldName = 'HRS_REQ_2'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWeeklyHRS_AVAIL_2: TFMTBCDField
      FieldName = 'HRS_AVAIL_2'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWeeklyHRS_REQ_3: TFMTBCDField
      FieldName = 'HRS_REQ_3'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWeeklyHRS_AVAIL_3: TFMTBCDField
      FieldName = 'HRS_AVAIL_3'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWeeklyHRS_REQ_4: TFMTBCDField
      FieldName = 'HRS_REQ_4'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWeeklyHRS_AVAIL_4: TFMTBCDField
      FieldName = 'HRS_AVAIL_4'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWeeklyHRS_REQ_5: TFMTBCDField
      FieldName = 'HRS_REQ_5'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWeeklyHRS_AVAIL_5: TFMTBCDField
      FieldName = 'HRS_AVAIL_5'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWeeklyPeriod1: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Period1'
      Size = 0
      Calculated = True
    end
    object QryWeeklyPeriod2: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Period2'
      Size = 0
      Calculated = True
    end
    object QryWeeklyPeriod3: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Period3'
      Size = 0
      Calculated = True
    end
    object QryWeeklyPeriod4: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Period4'
      Size = 0
      Calculated = True
    end
    object QryWeeklyPeriod5: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Period5'
      Size = 0
      Calculated = True
    end
    object QryWeeklyMFGCELL_DESCRIP: TStringField
      FieldName = 'MFGCELL_DESCRIP'
      FixedChar = True
      Size = 25
    end
  end
  object QryDaily: TFDQuery
    Tag = 1
    BeforeOpen = QryMonthlyBeforeOpen
    BeforeInsert = AbortOnInsert
    CachedUpdates = True
    OnUpdateRecord = QryMonthlyUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '
      '       m.mfgtype,'
      '       m.mfgcell,'
      '       m.descrip as mfgcell_descrip,'
      '       m.id as mfgcell_id,'
      ''
      '       ( select sum( h.prod_hrs ) '
      '           from day_hrs h'
      '          where nvl(m.id,0) = NVL(h.mfgcell_id,0)'
      
        '            and trunc(h.prod_date) between trunc(:start_date) an' +
        'd trunc(:start_date) + 5 - 1'
      '            and h.late = '#39'Y'#39') as past_due,'
      '       '
      '       -- period 1'
      '       sum( decode( trunc(a.prod_date) - trunc(:start_date) + 1,'
      '                    1, r.hrs_day_req,'
      '                    0 )) as hrs_req_1,'
      '       sum( decode( trunc(a.prod_date) - trunc(:start_date) + 1,'
      '                    1, a.prod_hrs,'
      '                    0 )) as hrs_avail_1,'
      ''
      '       -- period 2'
      '       sum( decode( trunc(a.prod_date) - trunc(:start_date) + 1,'
      '                    2, r.hrs_day_req,'
      '                    0 )) as hrs_req_2,'
      '       sum( decode( trunc(a.prod_date) - trunc(:start_date) + 1,'
      '                    2, a.prod_hrs,'
      '                    0 )) as hrs_avail_2,'
      ''
      '       -- period 3'
      '       sum( decode( trunc(a.prod_date) - trunc(:start_date) + 1,'
      '                    3, r.hrs_day_req,'
      '                    0 )) as hrs_req_3,'
      '       sum( decode( trunc(a.prod_date) - trunc(:start_date) + 1,'
      '                    3, a.prod_hrs,'
      '                    0 )) as hrs_avail_3,'
      ''
      '       -- period 4'
      '       sum( decode( trunc(a.prod_date) - trunc(:start_date) + 1,'
      '                    4, r.hrs_day_req,'
      '                    0 )) as hrs_req_4,'
      '       sum( decode( trunc(a.prod_date) - trunc(:start_date) + 1,'
      '                    4, a.prod_hrs,'
      '                    0 )) as hrs_avail_4,'
      '                    '
      '       -- period 5'
      '       sum( decode( trunc(a.prod_date) - trunc(:start_date) + 1,'
      '                    5, r.hrs_day_req,'
      '                    0 )) as hrs_req_5,'
      '       sum( decode( trunc(a.prod_date) - trunc(:start_date) + 1,'
      '                    5, a.prod_hrs,'
      '                    0 )) as hrs_avail_5'
      '  from '
      '       mfgcell m,'
      '       v_pm_hrs_day_req r, '
      '       pm_hrs_day_avail a'
      ' where'
      '       mfg.is_mfgtype_pm( m.mfgtype ) = 1'
      '   and misc.eplant_filter(m.eplant_id) = 1'
      '   and nvl(m.id,0) = NVL(a.mfgcell_id,0)'
      '   and nvl(a.mfgcell_id, 0) = NVL( r.mfgcell_id(+), 0)'
      '   and trunc(a.prod_date) = trunc(r.prod_date(+))'
      ''
      'group by '
      '       m.mfgtype,'
      '       m.mfgcell,'
      '       m.descrip,'
      '       m.id'
      ''
      'order by'
      '       m.mfgcell,'
      '       m.mfgtype')
    Left = 308
    Top = 134
    ParamData = <
      item
        Name = 'START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryDailyMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object QryDailyMFGCELL: TStringField
      FieldName = 'MFGCELL'
      FixedChar = True
      Size = 15
    end
    object QryDailyMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Size = 0
    end
    object QryDailyPAST_DUE: TFMTBCDField
      FieldName = 'PAST_DUE'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryDailyHRS_REQ_1: TFMTBCDField
      FieldName = 'HRS_REQ_1'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryDailyHRS_AVAIL_1: TFMTBCDField
      FieldName = 'HRS_AVAIL_1'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryDailyPeriod1: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Period1'
      Size = 0
      Calculated = True
    end
    object QryDailyPeriod2: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Period2'
      Size = 0
      Calculated = True
    end
    object QryDailyPeriod3: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Period3'
      Size = 0
      Calculated = True
    end
    object QryDailyPeriod4: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Period4'
      Size = 0
      Calculated = True
    end
    object QryDailyPeriod5: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Period5'
      Size = 0
      Calculated = True
    end
    object QryDailyHRS_REQ_2: TFMTBCDField
      FieldName = 'HRS_REQ_2'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryDailyHRS_AVAIL_2: TFMTBCDField
      FieldName = 'HRS_AVAIL_2'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryDailyHRS_REQ_3: TFMTBCDField
      FieldName = 'HRS_REQ_3'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryDailyHRS_AVAIL_3: TFMTBCDField
      FieldName = 'HRS_AVAIL_3'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryDailyHRS_REQ_4: TFMTBCDField
      FieldName = 'HRS_REQ_4'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryDailyHRS_AVAIL_4: TFMTBCDField
      FieldName = 'HRS_AVAIL_4'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryDailyHRS_REQ_5: TFMTBCDField
      FieldName = 'HRS_REQ_5'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryDailyHRS_AVAIL_5: TFMTBCDField
      FieldName = 'HRS_AVAIL_5'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryDailyMFGCELL_DESCRIP: TStringField
      FieldName = 'MFGCELL_DESCRIP'
      FixedChar = True
      Size = 25
    end
  end
  object PkMfgCell: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '
      '       mfgcell as mfgcell,'
      '       mfgtype as mfgtype,'
      '       descrip as mfgcell_descrip,'
      '       id as id'
      '  from '
      '       mfgcell'
      ' where mfg.is_mfgtype_pm( mfgtype ) = 1'
      '      '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 389
    Top = 97
    object PkMfgCellMFGCELL: TStringField
      DisplayLabel = 'MRO Cell'
      FieldName = 'MFGCELL'
      Origin = 'IQ.V_WORK_CENTER_TYPE.MFGCELL'
      FixedChar = True
      Size = 15
    end
    object PkMfgCellMFGCELL_DESCRIP: TStringField
      DisplayLabel = 'Cell Description'
      FieldName = 'MFGCELL_DESCRIP'
      FixedChar = True
      Size = 25
    end
    object PkMfgCellMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFGTYPE'
      Origin = 'IQ.V_WORK_CENTER_TYPE.MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object PkMfgCellID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'UpdateCapacitySchedule1'
      'sbtnAddWorkorder'
      'PMCapacityParameters1')
    SecurityCode = 'FRMPMCAPACITY'
    Left = 422
    Top = 98
  end
  object popmMainGrid: TUniPopupMenu
    Left = 244
    Top = 177
    object ViewWorkorders1: TUniMenuItem
      Caption = 'View Workorders'
      OnClick = ViewWorkorders1Click
    end
  end
end
