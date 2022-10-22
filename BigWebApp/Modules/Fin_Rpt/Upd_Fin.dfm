object FrmUpdate_Fin_Rpt: TFrmUpdate_Fin_Rpt
  Left = 243
  Top = 174
  HelpContext = 1100802
  ClientHeight = 412
  ClientWidth = 514
  Caption = 'Update Financial Reports'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 108
    Width = 514
    Height = 4
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
  end
  object PnlToolbarMain: TUniPanel
    Left = 0
    Top = 81
    Width = 514
    Height = 27
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ShowHint = True
    ParentShowHint = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnCheckAll: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Check All'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
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
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnCheckAllClick
    end
    object sbtnUncheckAll: TUniSpeedButton
      Left = 25
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Uncheck All'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
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
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnUncheckAllClick
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 393
    Width = 514
    Height = 19
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 112
    Width = 514
    Height = 237
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 0
      Top = 192
      Width = 514
      Height = 4
      Cursor = crVSplit
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      ParentColor = False
      Color = clBtnFace
    end
    object chklstReports: TCheckListBox
      Left = 0
      Top = 0
      Width = 514
      Height = 192
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
    object RichEdit1: TRichEdit
      Left = 0
      Top = 196
      Width = 514
      Height = 41
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
      WordWrap = False
      Zoom = 100
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 514
    Height = 81
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 121
      Top = 0
      Width = 6
      Height = 81
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 121
      Height = 79
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 11
        Width = 53
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Account  #'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 35
        Width = 53
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Description'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 8
        Top = 59
        Width = 66
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Account Type'
        TabOrder = 3
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 127
      Top = 1
      Width = 387
      Height = 79
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        387
        79)
      object dbeAcctNumber: TUniDBEdit
        Left = 1
        Top = 8
        Width = 332
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'ACCT'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object dbeDescription: TUniDBEdit
        Left = 1
        Top = 32
        Width = 332
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'DESCRIP'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object dblcAcctType: TUniDBEdit
        Left = 1
        Top = 56
        Width = 332
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataField = 'SubAcctType'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 349
    Width = 514
    Height = 44
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 308
      Top = 1
      Width = 206
      Height = 42
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Update'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object DataSource1: TDataSource
    Left = 85
    Top = 15
  end
end
