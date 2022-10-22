object FrmForeOvrCapWhiteboard: TFrmForeOvrCapWhiteboard
  Left = 96
  Top = 203
  HelpContext = 17901
  ClientHeight = 470
  ClientWidth = 1088
  Caption = 'Forecast Whiteboard Capacity Plan'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  Font.Height = -14
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Splitter1: TUniSplitter
    Left = 242
    Top = 0
    Width = 4
    Height = 470
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 246
    Top = 0
    Width = 842
    Height = 470
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object wwDBGridPlan: TIQUniGridControl
      Left = 1
      Top = 36
      Width = 840
      Height = 434
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Height = -14
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 623
      IQComponents.Grid.Height = 348
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
      IQComponents.HiddenPanel.Left = 623
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 348
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
      DataSource = SrcCapacityPlan
      Columns = <
        item
          FieldName = 'CNTR_TYPE'
          Title.Caption = 'Work Center Type'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Period1'
          Title.Caption = 'Period1'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Period2'
          Title.Caption = 'Period2'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Period3'
          Title.Caption = 'Period3'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Period4'
          Title.Caption = 'Period4'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Period5'
          Title.Caption = 'Period5'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'HRS_REQ_FUTURE'
          Title.Caption = 'Future Hours'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 840
      Height = 36
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object sbtnBack: TUniSpeedButton
        Left = 47
        Top = 1
        Width = 32
        Height = 32
        Hint = 'Move Back'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
        Left = 79
        Top = 1
        Width = 32
        Height = 32
        Hint = 'Move Forward'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
        Width = 32
        Height = 32
        Hint = 'Search...'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
        Left = 39
        Top = 1
        Width = 3
        Height = 32
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 5
        Caption = ''
      end
      object Panel3: TUniPanel
        Left = 770
        Top = 1
        Width = 70
        Height = 34
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ShowHint = True
        ParentShowHint = False
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitLeft = 592
        object Shape1: TUniPanel
          Left = 2
          Top = 10
          Width = 13
          Height = 13
          Hint = 'Available'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ShowHint = True
          TabOrder = 1
          Caption = ''
        end
        object Shape4: TUniPanel
          Left = 36
          Top = 10
          Width = 12
          Height = 13
          Hint = 'Over-booked'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ShowHint = True
          TabOrder = 2
          Caption = ''
        end
        object Shape3: TUniPanel
          Left = 18
          Top = 10
          Width = 13
          Height = 13
          Hint = 'Booked'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
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
    Width = 242
    Height = 470
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 5
      Top = 47
      Width = 66
      Height = 17
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Begin Date'
      TabOrder = 4
    end
    object Label2: TUniLabel
      Left = 5
      Top = 81
      Width = 69
      Height = 17
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'View Period'
      TabOrder = 5
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 240
      Height = 36
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnApply: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 32
        Height = 32
        Hint = 'Apply Criteria'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
      Left = 98
      Top = 42
      Width = 131
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DateTime = 42646.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object wwDBComboBoxViewType: TUniDBComboBox
      Left = 98
      Top = 76
      Width = 131
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
      'select w.cntr_type,'
      '       w.mfgtype,'
      '       w.mfgcell,'
      '       w.mfgcell_descrip,'
      '       w.mfgcell_id,'
      ''
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
      '                    0 )) as hrs_avail_5,'
      '                    '
      '       -- outside'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start, 4 ),'
      '                    -1, r.hrs_week_req,'
      '                    0 )) as hrs_req_future'
      ''
      '  from '
      '       v_work_center_type_ex w,'
      
        '       (select * from v_fore_hrs_week_req where fore_head_id = :' +
        'fore_head_id) r, '
      '       v_hrs_week_avail a'
      ' where'
      '       w.cntr_type = a.cntr_type'
      '   and nvl(w.mfgcell_id,0) = NVL(a.mfgcell_id,0)'
      '   and rtrim(a.cntr_type) = rtrim(r.cntr_type(+))'
      '   and a.week_start = r.week_start(+)'
      '   and NVL(a.mfgcell_id, 0) = NVL( r.mfgcell_id(+), 0)'
      '   and mfg.lookup_mfgtype(w.mfgtype) <> '#39'OUTSOURCE'#39
      ''
      'group by '
      '       w.cntr_type,'
      '       w.mfgtype,'
      '       w.mfgcell,'
      '       w.mfgcell_descrip,'
      '       w.mfgcell_id'
      ''
      'order by'
      '       w.cntr_type, '
      '       w.mfgcell_id,'
      '       w.mfgtype'
      '')
    Left = 245
    Top = 134
    ParamData = <
      item
        Name = 'start_date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'fore_head_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMonthlyCNTR_TYPE: TStringField
      DisplayLabel = 'Work Center Type'
      DisplayWidth = 22
      FieldName = 'CNTR_TYPE'
      ReadOnly = True
    end
    object QryMonthlyPeriod1: TFloatField
      DisplayWidth = 27
      FieldKind = fkCalculated
      FieldName = 'Period1'
      ReadOnly = True
      Calculated = True
    end
    object QryMonthlyPeriod2: TFloatField
      DisplayWidth = 27
      FieldKind = fkCalculated
      FieldName = 'Period2'
      ReadOnly = True
      Calculated = True
    end
    object QryMonthlyPeriod3: TFloatField
      DisplayWidth = 27
      FieldKind = fkCalculated
      FieldName = 'Period3'
      ReadOnly = True
      Calculated = True
    end
    object QryMonthlyPeriod4: TFloatField
      DisplayWidth = 27
      FieldKind = fkCalculated
      FieldName = 'Period4'
      ReadOnly = True
      Calculated = True
    end
    object QryMonthlyPeriod5: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period5'
      Calculated = True
    end
    object QryMonthlyHRS_REQ_FUTURE: TFMTBCDField
      DisplayLabel = 'Future Hours'
      DisplayWidth = 17
      FieldName = 'HRS_REQ_FUTURE'
      ReadOnly = True
      DisplayFormat = '########0.00'
      Size = 38
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
      object Close1: TUniMenuItem
        Caption = 'Exit'
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
    ModuleName = 'FrmForeOvrCapWhiteboard'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191836 $'
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
      'select w.cntr_type, '
      '       w.mfgtype,'
      '       w.mfgcell,'
      '       w.mfgcell_descrip,'
      '       w.mfgcell_id,'
      ''
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
      '                    0 )) as hrs_avail_5,'
      '                    '
      '       -- outside'
      
        '       sum( decode( iqcalendar.belongs_to_week_period( :start_da' +
        'te, a.week_start ),'
      '                    -1, r.hrs_week_req,'
      '                    0 )) as hrs_req_future'
      ''
      '  from '
      '       v_work_center_type_ex w,'
      
        '       (select * from v_fore_hrs_week_req where fore_head_id = :' +
        'fore_head_id) r, '
      '       v_hrs_week_avail a'
      ' where'
      '       w.cntr_type = a.cntr_type'
      '   and nvl(w.mfgcell_id,0) = NVL(a.mfgcell_id,0)'
      '   and rtrim(a.cntr_type)  = rtrim(r.cntr_type(+))'
      '   and a.week_start = r.week_start(+)'
      '   and NVL(a.mfgcell_id, 0) = NVL( r.mfgcell_id(+), 0)'
      '   and mfg.lookup_mfgtype(w.mfgtype) <> '#39'OUTSOURCE'#39
      ''
      'group by '
      '       w.cntr_type, '
      '       w.mfgtype,'
      '       w.mfgcell,'
      '       w.mfgcell_descrip,'
      '       w.mfgcell_id'
      ''
      'order by'
      '       w.cntr_type, '
      '       w.mfgcell_id,'
      '       w.mfgtype'
      '               ')
    Left = 276
    Top = 134
    ParamData = <
      item
        Name = 'start_date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'fore_head_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryWeeklyCNTR_TYPE: TStringField
      FieldName = 'CNTR_TYPE'
    end
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
    object QryWeeklyHRS_REQ_FUTURE: TFMTBCDField
      FieldName = 'HRS_REQ_FUTURE'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWeeklyPeriod1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period1'
      Calculated = True
    end
    object QryWeeklyPeriod2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period2'
      Calculated = True
    end
    object QryWeeklyPeriod3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period3'
      Calculated = True
    end
    object QryWeeklyPeriod4: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period4'
      Calculated = True
    end
    object QryWeeklyPeriod5: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period5'
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
      'select w.cntr_type, '
      '       w.mfgtype,'
      '       w.mfgcell,'
      '       w.mfgcell_descrip,'
      '       w.mfgcell_id,'
      ''
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
      '                    0 )) as hrs_avail_5,'
      '                    '
      '       -- outside'
      
        '       sum( decode( Sign(trunc(a.prod_date) - trunc(:start_date)' +
        ' + 1 - 6),'
      '                    +1, r.hrs_day_req,'
      '                    0 )) as hrs_req_future'
      ''
      '  from '
      '       v_work_center_type_ex w,'
      
        '       (select * from v_fore_hrs_day_req where fore_head_id = :f' +
        'ore_head_id) r, '
      '       hrs_day_avail a'
      ' where'
      '       w.cntr_type = a.cntr_type'
      '   and nvl(w.mfgcell_id,0) = NVL(a.mfgcell_id,0)'
      '   and rtrim(a.cntr_type)  = rtrim(r.cntr_type(+))'
      '   and trunc(a.prod_date) = trunc(r.prod_date(+))'
      '   and NVL(a.mfgcell_id, 0) = NVL( r.mfgcell_id(+), 0)'
      '   and mfg.lookup_mfgtype(w.mfgtype) <> '#39'OUTSOURCE'#39
      ''
      'group by '
      '       w.cntr_type, '
      '       w.mfgtype,'
      '       w.mfgcell,'
      '       w.mfgcell_descrip,'
      '       w.mfgcell_id'
      ''
      'order by'
      '       w.cntr_type, '
      '       w.mfgcell_id,'
      '       w.mfgtype'
      '')
    Left = 308
    Top = 134
    ParamData = <
      item
        Name = 'start_date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'fore_head_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDailyCNTR_TYPE: TStringField
      FieldName = 'CNTR_TYPE'
      Origin = 'CNTR_TYPE'
    end
    object QryDailyMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      Origin = 'MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object QryDailyMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Origin = 'MFGCELL'
      FixedChar = True
      Size = 15
    end
    object QryDailyMFGCELL_DESCRIP: TStringField
      FieldName = 'MFGCELL_DESCRIP'
      Origin = 'MFGCELL_DESCRIP'
      FixedChar = True
      Size = 25
    end
    object QryDailyMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Origin = 'MFGCELL_ID'
      Precision = 15
      Size = 0
    end
    object QryDailyHRS_REQ_1: TFMTBCDField
      FieldName = 'HRS_REQ_1'
      Origin = 'HRS_REQ_1'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_AVAIL_1: TFMTBCDField
      FieldName = 'HRS_AVAIL_1'
      Origin = 'HRS_AVAIL_1'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_REQ_2: TFMTBCDField
      FieldName = 'HRS_REQ_2'
      Origin = 'HRS_REQ_2'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_AVAIL_2: TFMTBCDField
      FieldName = 'HRS_AVAIL_2'
      Origin = 'HRS_AVAIL_2'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_REQ_3: TFMTBCDField
      FieldName = 'HRS_REQ_3'
      Origin = 'HRS_REQ_3'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_AVAIL_3: TFMTBCDField
      FieldName = 'HRS_AVAIL_3'
      Origin = 'HRS_AVAIL_3'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_REQ_4: TFMTBCDField
      FieldName = 'HRS_REQ_4'
      Origin = 'HRS_REQ_4'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_AVAIL_4: TFMTBCDField
      FieldName = 'HRS_AVAIL_4'
      Origin = 'HRS_AVAIL_4'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_REQ_5: TFMTBCDField
      FieldName = 'HRS_REQ_5'
      Origin = 'HRS_REQ_5'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_AVAIL_5: TFMTBCDField
      FieldName = 'HRS_AVAIL_5'
      Origin = 'HRS_AVAIL_5'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_REQ_FUTURE: TFMTBCDField
      FieldName = 'HRS_REQ_FUTURE'
      Origin = 'HRS_REQ_FUTURE'
      Precision = 38
      Size = 38
    end
    object QryDailyPeriod1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period1'
      Calculated = True
    end
    object QryDailyPeriod2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period2'
      Calculated = True
    end
    object QryDailyPeriod3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period3'
      Calculated = True
    end
    object QryDailyPeriod4: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period4'
      Calculated = True
    end
    object QryDailyPeriod5: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period5'
      Calculated = True
    end
  end
  object PkCenterType: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select w.cntr_type, '
      '       w.mfgtype,'
      '       w.mfgcell,'
      '       w.mfgcell_id'
      '  from '
      '       v_work_center_type_ex w'
      ' where mfg.lookup_mfgtype(w.mfgtype) <> '#39'OUTSOURCE'#39
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 389
    Top = 97
    object PkCenterTypeCNTR_TYPE: TStringField
      DisplayLabel = 'Work Center Type'
      FieldName = 'CNTR_TYPE'
      Origin = 'IQ.V_WORK_CENTER_TYPE.CNTR_TYPE'
    end
    object PkCenterTypeMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFGTYPE'
      Origin = 'IQ.V_WORK_CENTER_TYPE.MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object PkCenterTypeMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      FieldName = 'MFGCELL'
      Origin = 'IQ.V_WORK_CENTER_TYPE.MFGCELL'
      FixedChar = True
      Size = 15
    end
    object PkCenterTypeMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Origin = 'IQ.V_WORK_CENTER_TYPE.MFGCELL_ID'
      Visible = False
      Size = 0
    end
  end
end