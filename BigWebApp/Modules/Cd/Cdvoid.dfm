object FrmCDVoid: TFrmCDVoid
  Left = 382
  Top = 236
  HelpContext = 1006312
  ClientHeight = 117
  ClientWidth = 400
  Caption = 'Void Check'
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TUniPanel
    Left = 0
    Top = 76
    Width = 400
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TUniPanel
      Left = 191
      Top = 0
      Width = 209
      Height = 41
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 400
    Height = 76
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 65
      Top = 0
      Width = 6
      Height = 76
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 65
      Height = 74
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label9: TUniLabel
        Left = 8
        Top = 12
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Period'
        TabOrder = 1
      end
      object Label3: TUniLabel
        Left = 8
        Top = 36
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'Reason'
        TabOrder = 2
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 71
      Top = 1
      Width = 329
      Height = 74
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        329
        74)
      object SBPeriod: TUniSpeedButton
        Left = 93
        Top = 8
        Width = 22
        Height = 22
        Hint = 'Find period'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FF94949C
          736B5A848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF969696686868848484FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADA5B56B738C
          A584946B636B847B84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFA9A9A97878788B8B8B6666667E7E7EFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF94ADCE5A8CCE
          7373AD9C8C9C736373847B84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFB3B3B39B9B9B8282829191916868687E7E7EFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB5DEFF4AB5FF
          4284D6947B949C8C9C73636B848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFE4E4E4C3C3C3989898838383919191666666848484FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB5DEFF
          4AB5F74284D6737BA5B58C8C736B63A59CA5FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFE4E4E4C2C2C29898988585859090906A6A6A9F
          9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          9CD6FF52B5FF4A84D67373AD947B94848494ADA5B56B7B7B6B63637363637373
          6BB5ADADFF00FFFF00FFFF00FFFF00FFDDDDDDC4C4C498989882828283838388
          8888A9A9A97A7A7A646464646464717171AEAEAEFF00FFFF00FFFF00FFFF00FF
          FF00FF8CCEF74AB5FF5A94CE8C8C949C7B73B5948CCEAD9CDEC6ADCEB5A58C84
          73736363949494FF00FFFF00FFFF00FFFF00FFD4D4D4C3C3C3A0A0A08E8E8E7C
          7C7C959595ACACACC3C3C3B4B4B4818181646464949494FF00FFFF00FFFF00FF
          FF00FFFF00FFA5DEF7BDC6DEAD8C84F7CEADFFF7C6FFFFCEFFFFDEFFF7E7F7EF
          DE9C8C846B6363B5B5B5FF00FFFF00FFFF00FFFF00FFE1E1E1CBCBCB8D8D8DCB
          CBCBEFEFEFEDEDEDEDEDEDEDEDEDEDEDED8C8C8C646464B5B5B5FF00FFFF00FF
          FF00FFFF00FFFF00FFEFD6CEE7C6A5FFF7C6F7F7BDFFFFDEFFFFE7FFFFFFFFFF
          F7F7E7DE7B6B637B7B73FF00FFFF00FFFF00FFFF00FFFF00FFD6D6D6C3C3C3EF
          EFEFECECECEDEDEDEDEDEDEDEDEDEDEDEDE7E7E76A6A6A797979FF00FFFF00FF
          FF00FFFF00FFFF00FFDEBDB5F7EFC6F7E7ADFFF7C6FFFFDEFFFFE7F7FFFFFFFF
          F7FFF7E7B59C8C6B6B63FF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEE8E8E8DE
          DEDEEFEFEFEDEDEDEDEDEDEDEDEDEDEDEDEDEDED9B9B9B696969FF00FFFF00FF
          FF00FFFF00FFFF00FFEFB5A5FFF7C6FFD6A5FFFFCEFFFFD6F7FFDEFFFFEFFFFF
          E7FFFFDECEAD9C5A635AFF00FFFF00FFFF00FFFF00FFFF00FFB7B7B7EDEDEDD1
          D1D1EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDACACAC606060FF00FFFF00FF
          FF00FFFF00FFFF00FFDEBDA5FFF7C6FFE7BDF7E7BDFFFFCEFFFFDEFFFFD6FFFF
          D6FFF7CECEAD94737B73FF00FFFF00FFFF00FFFF00FFFF00FFBBBBBBEDEDEDE1
          E1E1E1E1E1EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDABABAB787878FF00FFFF00FF
          FF00FFFF00FFFF00FFCEC6ADFFF7CEFFEFD6F7DEBDFFF7BDFFF7BDF7FFB5FFF7
          BDFFEFCEB59484BDB5ADFF00FFFF00FFFF00FFFF00FFFF00FFC2C2C2EDEDEDEC
          ECECDADADAEDEDEDEDEDEDEDEDEDEDEDEDEAEAEA949494B4B4B4FF00FFFF00FF
          FF00FFFF00FFFF00FFF7D6D6E7CEC6FFFFF7F7F7DEF7EFBDFFDEADF7E7ADFFE7
          BDEFCEB59C847BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD9D9D9CFCFCFED
          EDEDF2F2F2E6E6E6D8D8D8DEDEDEE1E1E1CCCCCC848484FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFCEBDBDEFE7E7FFF7E7FFFFCEFFEFB5FFEFCEEFCE
          B5AD948CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFE8
          E8E8EDEDEDEDEDEDE6E6E6EAEAEACCCCCC959595FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFDEC6C6D6ADADC6A58CE7BD9CCEADA5DEC6
          BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8
          C8C8B1B1B1A3A3A3BBBBBBAEAEAEC7C7C7FF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = SBPeriodClick
      end
      object DBEditPeriod: TUniDBEdit
        Left = 1
        Top = 8
        Width = 89
        Height = 21
        Cursor = crArrow
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataField = 'PERIOD'
        DataSource = SrcGlPeriods
        TabOrder = 0
        Color = clBtnFace
        ReadOnly = True
      end
      object edReason: TUniEdit
        Left = 1
        Top = 32
        Width = 312
        Height = 21
        Hint = ''
        MaxLength = 50
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
  end
  object SrcGlPeriods: TDataSource
    DataSet = TblGlPeriods
    Left = 48
    Top = 72
  end
  object TblGlPeriods: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLPERIODS'
    TableName = 'GLPERIODS'
    Left = 88
    Top = 72
    object TblGlPeriodsID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblGlPeriodsGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Required = True
      Size = 0
    end
    object TblGlPeriodsPERIOD: TBCDField
      FieldName = 'PERIOD'
      Required = True
      Size = 0
    end
    object TblGlPeriodsSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      Required = True
    end
    object TblGlPeriodsEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
      Required = True
    end
    object TblGlPeriodsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 2
    end
  end
end
