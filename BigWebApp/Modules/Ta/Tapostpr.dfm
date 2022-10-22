object FrmTAPostPayroll: TFrmTAPostPayroll
  Left = 404
  Top = 201
  ClientHeight = 224
  ClientWidth = 460
  Caption = 'Post To Payroll'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TUniPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 33
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SbEmp: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 31
      Height = 31
      Hint = 'Select by Employee'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00C5CAC6007CAE7F0045914E00297D37001E762E0019742C002A7C
        34003B88400061A06700B9C5B900FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C8C8C8009B9B9B00808080008080800080808000808080008080
        80008080800089898900C0C0C000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00297C3100005C180000631E000068200000662000025B1D00126B
        1D00106B1B00005F1D00136F2000CACBCA00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        8000808080008080800080808000CBCBCB00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00257D2C0009701D000C7D24000C7524001070200015791E001A79
        2500177B2300097020001B7A2700FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        8000808080008080800080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF004A964F0023812C002C8B3A00257A2B001D8021003C8B47007BAC
        820020802300287E340041934700FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080009A9A
        9A00808080008080800080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0087AF8A00328B3700366F36002F5320005C744700BEB1A5007983
        68002F601B00448C4A004F5726008848360095605300B9A5A100FF00FF00FF00
        FF00FF00FF00A0A0A00080808000808080008080800080808000AFAFAF008080
        80008080800080808000808080008080800080808000A6A6A600FF00FF00B7A3
        9100A57C5C00625F5C0022463C000E2C440020324F00D5CAC500A8B2B6008986
        6C0015342F0027513A00764017007E3C17007E3C170069322100FF00FF00A0A0
        A0008080800080808000808080008080800080808000CACACA00B2B2B2008080
        8000808080008080800080808000808080008080800080808000935F3A008737
        09008C40090070665E00282F3D0007285C0007295B003784BA00339AE100205D
        8E000525540076768500A9897E009D725D008B54290062434200808080008080
        800080808000808080008080800080808000808080008C8C8C00A5A5A5008080
        800080808000808080008989890080808000808080008080800092552B009D44
        10009F53100068534500544B48002F436900093272003C8ECF0058C4FF0027A7
        F900074B9600C1CDDC00F9FDFF00F7FAFD00875336005F546F00808080008080
        8000808080008080800080808000808080008080800099999900CBCBCB00B3B3
        B30080808000D0D0D000FF00FF00FF00FF008080800080808000A47D5F009F56
        2700A35A2300C8B1A000AC978C00496D9E000C3C7F0065B1E60064D7FF002DB8
        FF00076FC8004E94C2004499CE009C8C8C00603A30007C89A800808080008080
        800080808000AEAEAE00969696008080800080808000B9B9B900D8D8D800BFBF
        BF00808080009B9B9B00A0A0A0008E8E8E008080800091919100CAC8C6009767
        4500A5593300C3AA9B0073A0B90047638A001044890083B2D90081E9FF002DB8
        FF00076CC10057CAFF002CA4F100152C4F0015355C00FF00FF00C8C8C8008080
        800080808000A8A8A800A3A3A3008080800080808000B9B9B900E5E5E500BFBF
        BF0080808000CECECE00AFAFAF008080800080808000FF00FF00FF00FF00FF00
        FF00C1AFA3004881B70038A1EE002575B500104F9900124D90002E76B10029A8
        FA00075DA6003CA6F50038B1FF00095CAE0066819F00FF00FF00FF00FF00FF00
        FF00ADADAD008C8C8C00AEAEAE0080808000808080008080800080808000B4B4
        B40080808000B3B3B300BCBCBC008080800087878700FF00FF00FF00FF00FF00
        FF007FB4D60037A4FF005CC7FF004FBFFC001861A40012579F001359A5001053
        9700103F750072D0FF004ACEFF000E93F5009CB0C000FF00FF00FF00FF00FF00
        FF00B9B9B900B4B4B400CDCDCD00C6C6C6008080800080808000808080008080
        800080808000D5D5D500D0D0D000A3A3A300B3B3B300FF00FF00FF00FF00FF00
        FF006DAEE10085D0FF007CD9FF004FC0FB002189D3003B86BB006689A8002960
        9D000C428E0065ACEB00299FF200077EDC006E99C300FF00FF00FF00FF00FF00
        FF00B7B7B700D7D7D700DBDBDB00C6C6C600959595008E8E8E008F8F8F008080
        800080808000B8B8B800ACACAC008E8E8E00A1A1A100FF00FF00FF00FF00FF00
        FF0078AED700A5DBFF0095E1FF003A8DC500124883007CA4BF00FF00FF002A83
        D9000E81E00005A0EA0025C3F9003ACBF9001E91D800BEC5CC00FF00FF00FF00
        FF00B5B5B500E0E0E000E2E2E2009696960080808000A8A8A800FF00FF009494
        940092929200A7A7A700C3C3C300CACACA009B9B9B00C6C6C600FF00FF00FF00
        FF00728EA8004F86BC002C629D000E47950023518D00C4C7C900FF00FF003B8A
        D60035B7FF001791F4001895F700077DE90083A9CE00FF00FF00FF00FF00FF00
        FF009393930091919100808080008080800080808000C7C7C700FF00FF009999
        9900C0C0C000A2A2A200A6A6A60092929200B0B0B000FF00FF00FF00FF00FF00
        FF00FF00FF005D81A00030679E005A83A600BAC0C500FF00FF00FF00FF00B8C3
        CD004693D9004596E600348AE1005396DC00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00878787008080800089898900C1C1C100FF00FF00FF00FF00C5C5
        C500A0A0A000A6A6A6009C9C9C00A4A4A400FF00FF00FF00FF00}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SbEmpClick
    end
    object SbDept: TUniSpeedButton
      Left = 32
      Top = 1
      Width = 31
      Height = 31
      Hint = 'Select by Department'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        B6060000424DB606000000000000360000002800000022000000100000000100
        1800000000008006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFF0000FF00FFC6B3A4
        403830AD9E92FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFBFA189403830A48671FF00FFFF00FF808080808080808080FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF808080808080838383FFFFFF
        0000FF00FF504030FFE8E0403830FF00FF805840805840805840604830805840
        503820503820FF00FF504030FFE8E0403830FF00FFFF00FF808080E8E8E88080
        80FFFFFF808080808080808080808080808080808080808080FF00FF808080E8
        E8E8808080FFFFFF0000FF00FF9B897A504030C6B2A1FF00FFFF00FFFF00FF70
        5840E0C6B0705840FF00FFFF00FFFF00FF967D68504030BD9A80FF00FFFF00FF
        868686808080808080FF00FFFF00FFFF00FF808080C2C2C2808080FFFFFFFF00
        FFFF00FF808080808080808080FF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF805840FF00FF805840FF00FF805840FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFF808080FFFFFF808080
        FFFFFF808080FFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF00FF0000FF00FFFF00FF
        C6B3A3403830AD9D90FF00FFFF00FFFF00FF805840FF00FFFF00FFFF00FFC1A4
        8D403830A58976FF00FFFF00FFFF00FFFF00FF808080808080808080FFFFFFFF
        00FFFF00FF808080FFFFFFFF00FFFF00FF808080808080808080FFFFFFFF00FF
        0000FF00FFFF00FF504030FFE8E0403830FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF504030FFE8E0403830FF00FFFF00FFFF00FFFF00FF808080E8E8
        E8808080FFFFFFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFF00FF808080E8E8E880
        8080FFFFFFFF00FF0000FF00FFFF00FF9B8979504030C6B19FFF00FFFF00FFC6
        AF9B403830AC9A8BFF00FFFF00FF977F6B504030BE9E85FF00FFFF00FFFF00FF
        FF00FF868686808080808080FF00FFFF00FF808080808080808080FFFFFFFF00
        FF808080808080808080FF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF504030FFE8E0403830FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080E8E8E8
        808080FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF9A8674504030C6AE9AFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF838383808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SbDeptClick
    end
    object sbAll: TUniSpeedButton
      Left = 63
      Top = 1
      Width = 31
      Height = 31
      Hint = 'Select All'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
      OnClick = sbAllClick
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 205
    Width = 460
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
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 155
    Width = 460
    Height = 50
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 204
      Top = 1
      Width = 256
      Height = 48
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 1
        Top = 10
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 128
        Top = 10
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 101
    Width = 460
    Height = 39
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 159
      Top = 0
      Width = 6
      Height = 39
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
      Width = 159
      Height = 37
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblTimeCardDate: TUniLabel
        Left = 60
        Top = 5
        Width = 74
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Time Card Date'
        TabOrder = 1
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 165
      Top = 1
      Width = 295
      Height = 37
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object dtDate: TUniDateTimePicker
        Left = 1
        Top = 1
        Width = 110
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DateTime = 42660.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 0
      end
    end
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 33
    Width = 460
    Height = 68
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Caption = ''
    object RBIncremental: TUniRadioButton
      Left = 10
      Top = 10
      Width = 154
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Checked = True
      Caption = 'By Production Date'
      TabOrder = 0
      OnClick = RBIncrementalClick
    end
    object RBSummary: TUniRadioButton
      Left = 10
      Top = 39
      Width = 103
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Summary'
      TabOrder = 1
      OnClick = RBSummaryClick
    end
  end
  object PkShift: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '          descrip'
      '  from ta_shift'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 109
    Top = 1
    object PkShiftID: TBCDField
      FieldName = 'ID'
      Origin = 'TA_SHIFT.ID'
      Visible = False
      Size = 0
    end
    object PkShiftDESCRIP: TStringField
      DisplayLabel = 'Shift'
      FieldName = 'DESCRIP'
      Origin = 'TA_SHIFT.DESCRIP'
      Size = 100
    end
  end
  object PkDept: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '          description'
      '  from pr_department')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 141
    Top = 1
    object PkDeptID: TBCDField
      FieldName = 'ID'
      Origin = 'PR_DEPARTMENT.ID'
      Visible = False
      Size = 0
    end
    object PkDeptDESCRIPTION: TStringField
      DisplayLabel = 'Department'
      FieldName = 'DESCRIPTION'
      Origin = 'PR_DEPARTMENT.DESCRIPTION'
      Size = 100
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'SbEmp'
      'SbDept'
      'sbAll'
      'BtnOk')
    SecurityItems.Strings = (
      'SbEmp'
      'SbDept'
      'sbAll'
      'BtnCancel'
      'BtnOk')
    SecurityCode = 'FRMTAPOSTPAYROLL'
    Left = 181
  end
end