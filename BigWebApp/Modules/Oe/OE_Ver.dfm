object FrmOE_VerControl: TFrmOE_VerControl
  Left = 328
  Top = 257
  HelpContext = 1069271
  ClientHeight = 114
  ClientWidth = 326
  Caption = 'Sales Order Version Control'
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 326
    Height = 114
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 131
      Top = 1
      Width = 6
      Height = 112
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 130
      Height = 112
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label2: TUniLabel
        Left = 8
        Top = 36
        Width = 40
        Height = 13
        Hint = ''
        Caption = 'Revision'
        TabOrder = 1
      end
      object Label4: TUniLabel
        Left = 8
        Top = 12
        Width = 39
        Height = 13
        Hint = ''
        Caption = 'Order #'
        TabOrder = 2
      end
      object Label1: TUniLabel
        Left = 8
        Top = 60
        Width = 73
        Height = 13
        Hint = ''
        Caption = 'Version Control'
        TabOrder = 3
      end
      object Label3: TUniLabel
        Left = 8
        Top = 84
        Width = 112
        Height = 13
        Hint = ''
        Caption = 'Enable Revision History'
        TabOrder = 4
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 137
      Top = 1
      Width = 188
      Height = 112
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object DBEdit2: TUniDBEdit
        Left = 0
        Top = 32
        Width = 64
        Height = 21
        Hint = ''
        DataField = 'REV'
        DataSource = OE_DM.SrcOrders
        TabOrder = 0
        TabStop = False
        ReadOnly = True
      end
      object DBEdit4: TUniDBEdit
        Left = 0
        Top = 8
        Width = 64
        Height = 21
        Hint = ''
        DataField = 'ORDERNO'
        DataSource = OE_DM.SrcOrders
        TabOrder = 1
        TabStop = False
        ReadOnly = True
      end
      object DBEdit1: TUniDBEdit
        Left = 0
        Top = 56
        Width = 185
        Height = 21
        Hint = ''
        DataField = 'OE_CONTROL'
        DataSource = OE_DM.SrcOrders
        TabOrder = 2
        TabStop = False
        ReadOnly = True
      end
      object cbRevHist: TUniCheckBox
        Left = 5
        Top = 83
        Width = 20
        Height = 17
        Hint = ''
        Caption = ''
        TabOrder = 3
        OnClick = cbRevHistClick
      end
      object BitBtnRevHist: TUniBitBtn
        Left = 31
        Top = 79
        Width = 154
        Height = 25
        Hint = ''
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFCCCCCCCCCCCCCCCCCCCCCCCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFCCCCCCAFA5A3958987867270887572A09897C5C2C2CCCC
          CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCC7C6725F5D755D5294
          876DDDC0B7A68E89C99E937E5B55705F5DC3BBBAFF00FFFF00FFFF00FFFF00FF
          FF00FFBCC1BB5B5B4C465C321D5A1C71916DF8F1EFEBDDD9D1ACA28B625A8E4D
          425B423EC6C2C1FF00FFC4C8C4357C362C882C1F7B1E2689262E912D206820D1
          D5CCF5EFEDE4D0CBC99E92B17467995549673C35796967FF00FFFF00FF9BB09C
          2C832E34CD3435B63530963032622FE6D9D6E2D0CBD1B1A8AA7E747D5851A264
          578F5A505F4440C7C1C0FF00FFBBC2BB2F8C2F37C63735B1342F8E2F4C6B44DC
          C6C0D3B7AF8168634F403E66504CBB8578BA8477825F576B5855FF00FF4C874C
          38CD3837C2372A952A2491256C7F5ED9C0B9796764514543AA8379C49C91CEA9
          9FB090898068644B3E3CABB9AC30AD3039CD3934B2336081574A8946879978DF
          CBC6C4AFAA786A68C9ACA5D8BEB7E2CCC6DFC8C393827F837170598E5A3AD53A
          38C6382380238B8A80EDE8E1D2D7CAF2EBEAEDE7E59B8F8EEFE5E3F7EDEBF4EA
          E7B4A8A6766A69CFCDCD3D8C3E39D13937BE361F6F1F8D8D88FFFEFDFEFCFCF8
          F7F6F3F1F09E9494F9F7F6FFFFFFFFFFFFA59E9DA6A1A0FF00FF408C4134CD35
          34B3342677252B4729D8D7D7CEC9C9F7F7F7CCC8C88A8181F7F7F7BFB9B9E9E7
          E7827B7BD0D0D0FF00FF8BA78C21B32330AE302D882D1C531C223D217C7C7AC9
          C8C8D9D9D9AAA6A6DEDDDD898383908A8AD3D3D3FF00FFFF00FFFF00FF719972
          238D252099212391251D6B1F144C151C341B646362656262908B8BCBC9C9CDCD
          CDFF00FFFF00FFFF00FFFF00FFFF00FFC8CAC8799B7B467B483F77415482559C
          B09CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = 'Revision History'
        TabOrder = 4
        OnClick = BitBtnRevHistClick
      end
    end
  end
end
