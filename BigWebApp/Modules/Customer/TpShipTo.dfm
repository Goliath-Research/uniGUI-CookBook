object FrmTPShipTo: TFrmTPShipTo
  Left = 55
  Top = 166
  ClientHeight = 343
  ClientWidth = 453
  Caption = 'Trading Partner Profile Ship To Quick Add'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  ActiveControl = Edit1
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 307
    Width = 453
    Height = 36
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 220
      Top = 1
      Width = 232
      Height = 34
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnCancel: TUniBitBtn
        Left = 147
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        Caption = 'Cancel'
        TabOrder = 0
        OnClick = Exit1Click
      end
      object BtnSelect: TUniBitBtn
        Left = 64
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFBFC7C1A4BDAA89B39389B393A4BDAABFC7C1FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB9C5BC6DA97C469A5C4B9B6054
          9F6957A16C529F674A9C5F6DA97CB9C5BCFF00FFFF00FFFF00FFFF00FFFF00FF
          ABC0B04F9E64489D5E55A46965AD7872B38374B48572B38369AE7B56A46A519F
          64ACC0B1FF00FFFF00FFFF00FFBBC6BE4D9E6241A45655B36857AB6B58A56B52
          A66664B5756DBD7D6DBD7D68BB7955AE69519F64BBC6BEFF00FFFF00FF6DA97C
          39A84F46BB5955B16867AD79F0F7F1BDDBC5489C5E63C27366C77667C67662C5
          724BB05E6FAA7EFF00FFB7C5BB3FA15632C1484EB66258A56BEBF4EEFFFFFFFF
          FFFFA5CEAF52B06665D07665D07665D0764FCA6343A159B9C5BC95B89E3AAF54
          3BC35553A268E2F0E6FFFFFFFFFFFFFFFFFFFFFFFF91C49E53B56966DA7B5DD8
          734CD4653FB15895B89E87B3933EBB5C43B25EBBDAC3FFFFFFFFFFFFA7CFB1D5
          E8DAFFFFFFFFFFFF86BE9450B96A58E1794EDF7042BD6087B39387B39350C470
          57D87B5CA76FE9F3ECB2D5BB52BC6F4FA064DCECE0FFFFFFFBFDFB7DB98C50BF
          6F5CEA854EC36F87B39397B9A05CC17880F4A364C9814D9F625BBE7771E39364
          CF8353A268E5F1E8FFFFFFF6FAF7489C5E77F19B53BD7197B9A0BDC6C0479B5D
          91F6B097F7B494F3B098F7B598F7B598F7B572CD8C58A56BE0EEE482BB906CC5
          8591F6AF459A5BBFC7C1FF00FF74AC8279CC90ABF9C2ABF9C2ACF9C1ACF8C3AD
          F9C3ADF9C380D19755AA6B7ED094A9F9C07ACD9175AC83FF00FFFF00FFBFC7C1
          529F6591D8A5BDFBCFBDFACEBDFBCEBDFBCEBCFBCEBBFACDB9FACBB9F9CC90D7
          A354A167BFC7C1FF00FFFF00FFFF00FFB3C3B759A16B85C897CAF9D8CFFBDCCE
          FBDCCEFBDBCDFBDBCEFBDB8FCFA0529F65B1C2B5FF00FFFF00FFFF00FFFF00FF
          FF00FFC7CAC881B08D51A2667CBE8E8FCA9F8FCB9F7EBF9054A46979AD86BFC7
          C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C8C29CBAA48D
          B5978DB5979CBAA4C1C8C2FF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = 'Ok'
        TabOrder = 1
        OnClick = BtnSelectClick
      end
    end
  end
  object PnlShipTo01: TUniPanel
    Left = 0
    Top = 0
    Width = 453
    Height = 307
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter27: TUniSplitter
      Left = 130
      Top = 1
      Width = 6
      Height = 305
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlShipToLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 129
      Height = 305
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label36: TUniLabel
        Left = 8
        Top = 6
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Company'
        TabOrder = 1
      end
      object Label37: TUniLabel
        Left = 8
        Top = 29
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Address 1'
        TabOrder = 2
      end
      object Label38: TUniLabel
        Left = 8
        Top = 54
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Address 2'
        TabOrder = 3
      end
      object Label39: TUniLabel
        Left = 8
        Top = 78
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Address 3'
        TabOrder = 4
      end
      object Label40: TUniLabel
        Left = 8
        Top = 100
        Width = 19
        Height = 13
        Hint = ''
        Caption = 'City'
        TabOrder = 5
      end
      object Label41: TUniLabel
        Left = 8
        Top = 123
        Width = 75
        Height = 13
        Hint = ''
        Caption = 'State or Region'
        TabOrder = 6
      end
      object Label42: TUniLabel
        Left = 8
        Top = 147
        Width = 87
        Height = 13
        Hint = ''
        Caption = 'Postal or Zip Code'
        TabOrder = 7
      end
      object Label56: TUniLabel
        Left = 8
        Top = 172
        Width = 39
        Height = 13
        Hint = ''
        Caption = 'Country'
        TabOrder = 8
      end
      object Label1: TUniLabel
        Left = 8
        Top = 196
        Width = 49
        Height = 13
        Hint = ''
        Caption = 'Ship To ID'
        TabOrder = 9
      end
      object Label2: TUniLabel
        Left = 8
        Top = 221
        Width = 44
        Height = 13
        Hint = ''
        Caption = 'EPlant ID'
        TabOrder = 10
      end
      object Label3: TUniLabel
        Left = 8
        Top = 245
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'Division'
        TabOrder = 11
      end
      object Label4: TUniLabel
        Left = 8
        Top = 272
        Width = 63
        Height = 13
        Hint = ''
        Caption = 'Ship To Code'
        TabOrder = 12
      end
    end
    object PnlShipToClient01: TUniPanel
      Left = 136
      Top = 1
      Width = 316
      Height = 305
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        316
        305)
      object dbeShipCity: TUniDBEdit
        Left = 3
        Top = 99
        Width = 309
        Height = 19
        Hint = ''
        DataField = 'CITY'
        DataSource = SrcShip_to
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Color = clBtnFace
        ReadOnly = True
      end
      object dbeShipAddr3: TUniDBEdit
        Left = 3
        Top = 75
        Width = 309
        Height = 19
        Hint = ''
        DataField = 'ADDR3'
        DataSource = SrcShip_to
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Color = clBtnFace
        ReadOnly = True
      end
      object dbeShipAddr2: TUniDBEdit
        Left = 3
        Top = 51
        Width = 309
        Height = 19
        Hint = ''
        DataField = 'ADDR2'
        DataSource = SrcShip_to
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clBtnFace
        ReadOnly = True
      end
      object dbeShipAddr1: TUniDBEdit
        Left = 3
        Top = 27
        Width = 309
        Height = 19
        Hint = ''
        DataField = 'ADDR1'
        DataSource = SrcShip_to
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clBtnFace
        ReadOnly = True
      end
      object dbeShipCompany: TUniDBEdit
        Left = 3
        Top = 3
        Width = 309
        Height = 19
        Hint = ''
        DataField = 'ATTN'
        DataSource = SrcShip_to
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Color = clBtnFace
        ReadOnly = True
      end
      object dbeShipZIP: TUniDBEdit
        Left = 3
        Top = 147
        Width = 309
        Height = 19
        Hint = ''
        DataField = 'ZIP'
        DataSource = SrcShip_to
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        Color = clBtnFace
        ReadOnly = True
      end
      object dbeState: TUniDBEdit
        Left = 3
        Top = 123
        Width = 309
        Height = 19
        Hint = ''
        DataField = 'STATE'
        DataSource = SrcShip_to
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        Color = clBtnFace
        ReadOnly = True
      end
      object dbeCountry: TUniDBEdit
        Left = 3
        Top = 170
        Width = 309
        Height = 19
        Hint = ''
        DataField = 'COUNTRY'
        DataSource = SrcShip_to
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        Color = clBtnFace
        ReadOnly = True
      end
      object dbeID: TUniDBEdit
        Left = 3
        Top = 193
        Width = 309
        Height = 19
        Hint = ''
        DataField = 'ID'
        DataSource = SrcShip_to
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        Color = clBtnFace
        ReadOnly = True
      end
      object dbeEplant: TUniDBEdit
        Left = 3
        Top = 217
        Width = 309
        Height = 19
        Hint = ''
        DataField = 'EPLANT_ID'
        DataSource = SrcShip_to
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        Color = clBtnFace
        ReadOnly = True
      end
      object dbeDivision: TUniDBEdit
        Left = 3
        Top = 242
        Width = 309
        Height = 19
        Hint = ''
        DataField = 'DIVISION'
        DataSource = SrcShip_to
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 10
        Color = clBtnFace
        ReadOnly = True
      end
      object Edit1: TUniEdit
        Left = 3
        Top = 268
        Width = 309
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 11
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 240
    Top = 32
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'Trading Partner Profile Ship To Quick Add'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 280
    Top = 32
  end
  object SrcShip_to: TDataSource
    DataSet = QryShipTo
    Left = 156
    Top = 172
  end
  object QryShipTo: TFDQuery
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select s.id,'
      '       s.arcusto_id,'
      '       s.attn,'
      '       s.addr1,'
      '       s.addr2,'
      '       s.addr3,'
      '       s.city,'
      '       s.state,'
      '       s.country,'
      '       s.zip,'
      '       s.eplant_id,'
      '       s.division_id,'
      '       d.descrip as division'
      '  from ship_to s,'
      '       division d'
      ' where s.id = :AID'
      '   and s.division_id = d.id(+)'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 220
    Top = 165
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryShipToID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryShipToARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object QryShipToATTN: TStringField
      FieldName = 'ATTN'
      Size = 60
    end
    object QryShipToADDR1: TStringField
      FieldName = 'ADDR1'
      Size = 60
    end
    object QryShipToADDR2: TStringField
      FieldName = 'ADDR2'
      Size = 60
    end
    object QryShipToADDR3: TStringField
      FieldName = 'ADDR3'
      Size = 60
    end
    object QryShipToCITY: TStringField
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object QryShipToSTATE: TStringField
      FieldName = 'STATE'
    end
    object QryShipToCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 30
    end
    object QryShipToZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object QryShipToEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryShipToDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Size = 0
    end
    object QryShipToDIVISION: TStringField
      FieldName = 'DIVISION'
      Size = 50
    end
  end
end
