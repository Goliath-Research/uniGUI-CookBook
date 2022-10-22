object FrmRevDepr: TFrmRevDepr
  Left = 99
  Top = 193
  HelpContext = 15680
  ClientHeight = 463
  ClientWidth = 626
  Caption = 'Review Depreciation History for all Assets / Books'
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
    Top = 219
    Width = 626
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitTop = 185
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 30
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      626
      30)
    object Shape1: TUniPanel
      Left = 460
      Top = 9
      Width = 10
      Height = 11
      Hint = 'Posted To GL'
      ShowHint = True
      ParentShowHint = False
      Anchors = [akTop, akRight]
      TabOrder = 1
      Caption = ''
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 30
    Width = 626
    Height = 189
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 624
      Height = 187
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 407
      IQComponents.Grid.Height = 101
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcHdr
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
      IQComponents.Navigator.DataSource = SrcHdr
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.Navigator.BeforeAction = DBNavigator1BeforeAction
      IQComponents.HiddenPanel.Left = 407
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 101
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 67
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitLeft = 0
      IQComponents.FormTab.ExplicitTop = 0
      IQComponents.FormTab.ExplicitWidth = 256
      IQComponents.FormTab.ExplicitHeight = 96
      DataSource = SrcHdr
      Columns = <
        item
          FieldName = 'POST_DATE'
          Title.Caption = 'Posting Date'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BEG_BALANCE'
          Title.Caption = 'Beg. balance'
          Width = 7
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'PERIOD'
          Title.Caption = 'GL Period'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'YEAR'
          Title.Caption = 'GL Year'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BOOK_DESCRIP'
          Title.Caption = 'Book Description'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BOOK_TYPE'
          Title.Caption = 'Book Type'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitHeight = 153
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 222
    Width = 626
    Height = 241
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitTop = 188
    ExplicitHeight = 275
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 624
      Height = 30
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object SbToggle: TUniSpeedButton
        Left = 0
        Top = 3
        Width = 25
        Height = 25
        Hint = 'Toggle Selection'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000232E0000232E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF6078D01038B01038B01030B01028A01028A000209000
          2090FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6080D09098FF
          5060FF5060FF3048F03048E02040D01028A0FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF7088E0A0A8FF9090FF7080FF5068FF3058F02048F010
          38B0B3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977D7088E07088E0
          6080D06078D05070C05060C04058B04058B0F0E5D6F0E4D5EFE4D3EFE3D2EFE2
          D1EFE2D0EEE1CFB3977DFF00FFFF00FFB3977DF7F1EAF7F1E9F6F0E7F5EFE6F6
          EEE4F5EEE2F4ECE1F3EBE0F3EADEF3EADDF2E9DBF2E8DAB3977DFF00FFFF00FF
          B3977D9393928787857E7D7C7978767978777F7E7C888685908F8D9796939796
          949796949D9A98B3977DFF00FFFF00FFB3977D25B9FF28BEFF2CC4FF31CBFF36
          D2FF3DD8FF46DFFF51E3FF63E8FF77EEFF8EF1FFA3F5FFB3977DFF00FFFF00FF
          50805040704030503020382031CBFF36D1FF3DD9FF45DEFF52E4FF63E9FF78ED
          FF8EF2FFA3F5FFB3977DFF00FFFF00FF50905060A860508850305030ADADADA0
          A0A09292918686867D7D7D7A7A7A7B7A7A838281929190B3977D70A88060A070
          60986070B070509850407040305030203820FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFEFEFDB3977D80B090A0D8A070C08070B87060A06050905040884030
          5030FFFDFAFFFDFBFFFEFCFFFFFDFFFFFEFFFFFEFFFFFFB3977D90B8A0B0D8B0
          A0D8A090D0A070B87060A860509850407040A17A57A17A57A17A57A17A57A17A
          57A17A57A17A57A17A5790C0A090B8A080B090A0D8A070C08060986050905050
          8050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          90B8A0B0D8B0A0D8A060A070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF90C0A090B8A080B09070A880FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = SbToggleClick
      end
      object BtnSelectAll: TUniSpeedButton
        Left = 24
        Top = 3
        Width = 25
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
        OnClick = BtnSelectAllClick
      end
      object BtnClearAll: TUniSpeedButton
        Left = 48
        Top = 3
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
        OnClick = BtnClearAllClick
      end
    end
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 31
      Width = 624
      Height = 209
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 407
      IQComponents.Grid.Height = 123
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcDtl
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
      IQComponents.Navigator.DataSource = SrcDtl
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 407
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 123
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 116
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitLeft = 0
      IQComponents.FormTab.ExplicitTop = 0
      IQComponents.FormTab.ExplicitWidth = 256
      IQComponents.FormTab.ExplicitHeight = 145
      DataSource = SrcDtl
      Columns = <
        item
          FieldName = 'ASSET_NO'
          Title.Caption = 'Asset #'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AMOUNT'
          Title.Caption = 'Amount'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitLeft = 2
      ExplicitTop = 35
      ExplicitHeight = 243
      Marker = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 344
    Top = 24
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'Review Depreciation History for all Assets / Books'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193784 $'
    BuildVersion = '176554'
    Left = 280
    Top = 32
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'DBNavigator1'
      'DBNavigator2')
    SecurityCode = 'FRMREVDEPR'
    Left = 248
    Top = 30
  end
  object SrcHdr: TDataSource
    DataSet = QryHdr
    Left = 96
    Top = 70
  end
  object QryHdr: TFDQuery
    AfterScroll = QryHdrAfterScroll
    CachedUpdates = True
    OnUpdateRecord = QryHdrUpdateRecord
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select distinct f.post_date,'
      '                NVL(f.beg_balance, '#39'N'#39') as beg_balance,'
      '                p.period as period,'
      '                NVL(y.descrip, '#39' '#39') as year,'
      '                b.descrip as book_descrip,'
      '                b.book_type,'
      '                NVL(f.glbatchid_id, 0) as glbatchid_id'
      '           from FA_DEPR_POSTING f,'
      '                glperiods p,'
      '                glyear y,'
      '                fa_book b'
      '          where f.glperiods_id = p.id(+)'
      '            and p.glyear_id = y.id(+)'
      '            and f.fa_book_id = b.id')
    Left = 112
    Top = 80
    object QryHdrPOST_DATE: TDateTimeField
      DisplayLabel = 'Posting Date'
      DisplayWidth = 18
      FieldName = 'POST_DATE'
      Origin = 'f.POST_DATE'
    end
    object QryHdrBEG_BALANCE: TStringField
      DisplayLabel = 'Beg. balance'
      DisplayWidth = 1
      FieldName = 'BEG_BALANCE'
      Origin = 'NVL(f.BEG_BALANCE, '#39'N'#39')'
      FixedChar = True
      Size = 1
    end
    object QryHdrPERIOD: TBCDField
      DisplayLabel = 'GL Period'
      DisplayWidth = 10
      FieldName = 'PERIOD'
      Origin = 'p.period'
      Size = 0
    end
    object QryHdrYEAR: TStringField
      DisplayLabel = 'GL Year'
      DisplayWidth = 25
      FieldName = 'YEAR'
      Origin = 'NVL(y.descrip, '#39' '#39')'
      Size = 25
    end
    object QryHdrBOOK_DESCRIP: TStringField
      DisplayLabel = 'Book Description'
      DisplayWidth = 20
      FieldName = 'BOOK_DESCRIP'
      Origin = 'b.descrip'
      Size = 60
    end
    object QryHdrBOOK_TYPE: TStringField
      DisplayLabel = 'Book Type'
      DisplayWidth = 15
      FieldName = 'BOOK_TYPE'
      Origin = 'b.BOOK_TYPE'
      Size = 15
    end
    object QryHdrGLBATCHID_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'GLBATCHID_ID'
      Visible = False
      Size = 38
    end
  end
  object SrcDtl: TDataSource
    DataSet = QryDtl
    Left = 176
    Top = 78
  end
  object QryDtl: TFDQuery
    MasterSource = SrcHdr
    MasterFields = 
      'YEAR;PERIOD;BOOK_DESCRIP;BOOK_TYPE;POST_DATE;BEG_BALANCE;GLBATCH' +
      'ID_ID'
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select h.id,'
      '       h.asset_no,'
      '       h.descrip,'
      '       b.id as fa_book_id,'
      '       f.amount,'
      '       y.descrip as year,'
      '       p.period,'
      '       b.descrip as book_descrip,'
      '       b.book_type,'
      '       f.id as FA_DEPR_POSTING_ID,'
      '       f.glbatchid_id'
      'from fa_main h,'
      '     fa_book b,'
      '     FA_DEPR_POSTING f,'
      '     glperiods p,'
      '     glyear y'
      '  where b.fa_main_id = h.id'
      '    and f.fa_book_id = b.id'
      '    and f.glperiods_id = p.id(+)'
      '    and p.glyear_id = y.id(+)'
      '    and NVL(y.descrip, '#39' '#39') = NVL(:YEAR, '#39' '#39')'
      '    and NVL(p.period, 0) = NVL(:PERIOD, 0)'
      '    and b.descrip = :BOOK_DESCRIP'
      '    and b.book_type = :BOOK_TYPE'
      '    and f.post_date = :POST_DATE'
      '    and NVL(f.beg_balance, '#39'N'#39') = :BEG_BALANCE'
      '    and NVL(f.glbatchid_id, 0) = :GLBATCHID_ID')
    Left = 192
    Top = 88
    ParamData = <
      item
        Name = 'YEAR'
        DataType = ftString
        ParamType = ptInput
        Size = 26
      end
      item
        Name = 'PERIOD'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'BOOK_DESCRIP'
        DataType = ftString
        ParamType = ptInput
        Size = 61
      end
      item
        Name = 'BOOK_TYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Name = 'POST_DATE'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'BEG_BALANCE'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'GLBATCHID_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDtlASSET_NO: TStringField
      DisplayLabel = 'Asset #'
      DisplayWidth = 15
      FieldName = 'ASSET_NO'
      Size = 15
    end
    object QryDtlDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryDtlAMOUNT: TBCDField
      DisplayLabel = 'Amount'
      DisplayWidth = 10
      FieldName = 'AMOUNT'
      Size = 2
    end
    object QryDtlFA_DEPR_POSTING_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_DEPR_POSTING_ID'
      Visible = False
      Size = 0
    end
    object QryDtlID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryDtlFA_BOOK_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FA_BOOK_ID'
      Visible = False
      Size = 0
    end
    object QryDtlYEAR: TStringField
      DisplayWidth = 25
      FieldName = 'YEAR'
      Visible = False
      Size = 25
    end
    object QryDtlPERIOD: TBCDField
      DisplayWidth = 10
      FieldName = 'PERIOD'
      Visible = False
      Size = 0
    end
    object QryDtlBOOK_DESCRIP: TStringField
      DisplayWidth = 60
      FieldName = 'BOOK_DESCRIP'
      Visible = False
      Size = 60
    end
    object QryDtlBOOK_TYPE: TStringField
      DisplayWidth = 15
      FieldName = 'BOOK_TYPE'
      Visible = False
      Size = 15
    end
    object QryDtlGLBATCHID_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLBATCHID_ID'
      Visible = False
      Size = 0
    end
  end
end
