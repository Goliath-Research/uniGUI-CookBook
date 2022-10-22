object FrmSetupTemplateChecklist: TFrmSetupTemplateChecklist
  Left = 0
  Top = 0
  HelpContext = 18338
  ClientHeight = 387
  ClientWidth = 534
  Caption = 'Checklist Templates'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 177
    Width = 534
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object PnlHeader: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 534
    Height = 177
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object PnlToolbarHeader: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 532
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnSearch: TUniSpeedButton
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
        OnClick = Search1Click
      end
    end
    object PnlHeaderGrid: TUniPanel
      Tag = 1999
      Left = 1
      Top = 27
      Width = 532
      Height = 150
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object GridHeader: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 530
        Height = 148
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 313
        IQComponents.Grid.Height = 62
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
        IQComponents.HiddenPanel.Left = 313
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 62
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcHeader
        Columns = <
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Checklist Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NOTES'
            Title.Caption = 'Note'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANT_NAME'
            Title.Caption = 'EPlant'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object cmbGridHeaderNote: TUniEdit
        Left = 296
        Top = 88
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
      end
      object cmbGridEplantID: TUniEdit
        Left = 296
        Top = 115
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
        ReadOnly = True
      end
    end
  end
  object PnlDetail: TUniPanel
    Tag = 1999
    Left = 0
    Top = 180
    Width = 534
    Height = 207
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlToolbarDetail: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 532
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnMoveUp: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Move Up'
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
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF809880404840304030303830202020FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4646463B
          3B3B353535202020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF80A09090C090508860408050202820FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9BB4B4B47D
          7D7D747474252525FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF80A09090C8A060B070509060303830FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9BBDBDBDA1
          A1A1848484353535FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF90A890A0D8B070B880609870304030FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA2A2A2CDCDCDAA
          AAAA8D8D8D3B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          A0C0A0507060505850405840A0E0C080C89060A8804048403040303040303038
          30FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B86A6A6A555555525252D6D6D6BA
          BABA9C9C9C4646463B3B3B3B3B3B353535FF00FFFF00FFFF00FFFF00FFFF00FF
          DFD6BCA0C0A0C0F0D0B0E8C090E0B090D8A070C09070A880508060304030D5C1
          ADFF00FFFF00FFFF00FFFF00FFFF00FFD2D2D2B8B8B8E7E7E7DDDDDDD2D2D2C9
          C9C9B3B3B39D9D9D7777773B3B3BBFBFBFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFDFD7BEA0C8B0C0F8D0B0E8C090E0B090D8A0609870607860D5C2AFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3D3D3C1C1C1EDEDEDDDDDDDD2
          D2D2C9C9C98D8D8D717171C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFDFD8C0A0C8B0C0F8D0B0F0C070A880506050D8C8B7FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4D4D4C1C1C1EDEDEDE3
          E3E39D9D9D5B5B5BC6C6C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFDFD8C1A0D0B0C0F0D0506850D8C9B8FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4D4D4C7C7C7E7
          E7E7626262C7C7C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFDFDAC390B8A0CDC2AEFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6D6D6B1
          B1B1BFBFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
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
        OnClick = sbtnMoveUpClick
      end
      object sbtnMoveDown: TUniSpeedButton
        Left = 26
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Move Down'
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
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFCDC2AB607860B5A189FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBF71
          71719E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFCEC5AE809880509060202020B7A48DFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C191919184
          8484202020A1A1A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFD0C8B280988070B08060A870407850202020B8A791FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5C5C5919191A3A3A39A
          9A9A6E6E6E202020A4A4A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFD1CBB680988080C89070C09070B88060A870407850202020B4A690FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8919191BABABAB3B3B3AA
          AAAA9A9A9A6E6E6E202020A3A3A3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          DFD6BD809880A0E0C0B0E8C0A0E0B070C090609870509060407850202020D5C1
          ADFF00FFFF00FFFF00FFFF00FFFF00FFD2D2D2919191D6D6D6DDDDDDD3D3D3B3
          B3B38D8D8D8484846E6E6E202020BFBFBFFF00FFFF00FFFF00FFFF00FFFF00FF
          90B8A090A89080A090809880A0E8C080D0A060A0704048408090808090808090
          80FF00FFFF00FFFF00FFFF00FFFF00FF808080808080808080808080DCDCDCC2
          C2C29494944646468C8C8C8C8C8C8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF80A090B0E8C090D8A070A880304030FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080DDDDDDC9
          C9C99D9D9D3B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF90A890B0F0C090E0B070B080303830FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080E3E3E3D2
          D2D2A3A3A3353535FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF90B8A0B0F0D0B0F0C0B0E8C0202820FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080E6E6E6E3
          E3E3DDDDDD252525FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF90C0A090B8A090A89080A090809880FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808080808080
          8080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
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
        OnClick = sbtnMoveDownClick
      end
    end
    object PnlDetailGrid: TUniPanel
      Tag = 1999
      Left = 1
      Top = 27
      Width = 532
      Height = 180
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object GridDetail: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 530
        Height = 178
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 313
        IQComponents.Grid.Height = 92
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
        IQComponents.HiddenPanel.Left = 313
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 92
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcDetail
        Columns = <
          item
            FieldName = 'SEQ'
            Title.Caption = '#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CHECK_TEXT'
            Title.Caption = 'Text'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CRITICAL'
            Title.Caption = 'Critical'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end
          item
            FieldName = 'NOTES'
            Title.Caption = 'Note'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object cmbGridDetailNote: TIQWebUDComboBox
        Left = 296
        Top = 58
        Width = 121
        Height = 21
        Hint = 'Right click to edit the list'
        ShowHint = True
        ParentShowHint = False
        TabOrder = 1
        KeyTableName = 'SETUP_TEMPL_CHKLIST_DTL'
        KeyFieldName = 'NOTES'
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 160
    object File1: TUniMenuItem
      Caption = '&File'
      object Search1: TUniMenuItem
        Caption = 'Search'
        OnClick = Search1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
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
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 248
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmSetupTemplChklist'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 189263 $'
    Left = 275
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmSetupTemplChklist'
    WebUse = False
    TouchScreen = False
    Left = 303
  end
  object SrcHeader: TDataSource
    DataSet = QryHeader
    Left = 120
    Top = 88
  end
  object SrcDetail: TDataSource
    DataSet = QryDetail
    Left = 168
    Top = 88
  end
  object QryHeader: TFDQuery
    BeforeOpen = QryHeaderBeforeOpen
    AfterPost = DoApplyUpdates
    BeforeDelete = QryHeaderBeforeDelete
    OnNewRecord = QryHeaderNewRecord
    CachedUpdates = True
    OnUpdateRecord = QryHeaderUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      '  SELECT a.id, '
      '         a.descrip, '
      '         a.notes, '
      '         a.source,'
      '         a.eplant_id, '
      '         b.name AS eplant_name'
      '    FROM setup_templ_chklist a, '
      '         eplant b'
      '   WHERE a.source = :source'
      '     and misc.eplant_filter_include_nulls( a.eplant_id ) = 1'
      '     and a.eplant_id = b.id(+)'
      '   '
      'ORDER BY a.id')
    Left = 128
    Top = 104
    ParamData = <
      item
        Name = 'source'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryHeaderDESCRIP: TStringField
      DisplayLabel = 'Checklist Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Required = True
      Size = 150
    end
    object QryHeaderNOTES: TStringField
      DisplayLabel = 'Note'
      DisplayWidth = 25
      FieldName = 'NOTES'
      Size = 255
    end
    object QryHeaderEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 30
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object QryHeaderID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryHeaderEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryHeaderSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      Size = 30
    end
  end
  object QryDetail: TFDQuery
    AfterPost = DoApplyUpdates
    BeforeDelete = QryDetailBeforeDelete
    OnNewRecord = QryDetailNewRecord
    CachedUpdates = True
    MasterSource = SrcHeader
    MasterFields = 'ID'
    OnUpdateRecord = QryDetailUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      '  SELECT a.id, '
      '         a.setup_templ_chklist_id,'
      '         a.seq, '
      '         a.check_text, '
      '         a.critical,'
      '         a.notes'
      '    FROM setup_templ_chklist_dtl a'
      '   WHERE a.setup_templ_chklist_id = :ID'
      'ORDER BY a.seq')
    Left = 176
    Top = 104
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDetailSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 5
      FieldName = 'SEQ'
      Origin = 'IQ.PMTEMPLATE_CHECKLIST_DTL.SEQ'
      Size = 0
    end
    object QryDetailCHECK_TEXT: TStringField
      DisplayLabel = 'Text'
      DisplayWidth = 34
      FieldName = 'CHECK_TEXT'
      Origin = 'IQ.PMTEMPLATE_CHECKLIST_DTL.CHECK_TEXT'
      Size = 150
    end
    object QryDetailCRITICAL: TStringField
      DisplayLabel = 'Critical'
      DisplayWidth = 12
      FieldName = 'CRITICAL'
      Origin = 'IQ.PMTEMPLATE_CHECKLIST_DTL.CRITICAL'
      Size = 1
    end
    object QryDetailNOTES: TStringField
      DisplayLabel = 'Note'
      DisplayWidth = 29
      FieldName = 'NOTES'
      Origin = 'IQ.PMTEMPLATE_CHECKLIST_DTL.NOTES'
      Size = 255
    end
    object QryDetailID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'IQ.PMTEMPLATE_CHECKLIST_DTL.ID'
      Visible = False
      Size = 0
    end
    object QryDetailSETUP_TEMPL_CHKLIST_ID: TBCDField
      FieldName = 'SETUP_TEMPL_CHKLIST_ID'
      Origin = 'IQ.SETUP_TEMPL_CHKLIST_DTL.SETUP_TEMPL_CHKLIST_ID'
      Visible = False
      Size = 0
    end
  end
  object PkTemplate: TIQWebHpick
    BeforeOpen = QryHeaderBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      '  SELECT a.id as id, '
      '         a.descrip as descrip, '
      '         a.notes as notes, '
      '         a.eplant_id as eplant_id,'
      '         b.name AS eplant_name'
      '    FROM setup_templ_chklist a, '
      '         eplant b'
      '   WHERE b.id(+) = a.eplant_id'
      '     and a.source = :source'
      '     and misc.eplant_filter_include_nulls( a.eplant_id ) = 1'
      ''
      '')
    OnIQModify = PkTemplateIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 216
    Top = 88
    ParamData = <
      item
        Name = 'source'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkTemplateID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkTemplateDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 150
    end
    object PkTemplateNOTES: TStringField
      DisplayLabel = 'Note'
      DisplayWidth = 40
      FieldName = 'NOTES'
      Size = 255
    end
    object PkTemplateEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant Name'
      DisplayWidth = 30
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
  end
end
