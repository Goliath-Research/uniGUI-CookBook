object FrmUserFieldsPicklistEditor: TFrmUserFieldsPicklistEditor
  Left = 0
  Top = 0
  ClientHeight = 357
  ClientWidth = 466
  Caption = 'User Defined Picklist SQL'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 317
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 464
      Height = 315
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel5: TUniPanel
        Left = 1
        Top = 1
        Width = 462
        Height = 266
        Hint = ''
        Margins.Left = 5
        Margins.Right = 9
        Margins.Bottom = 0
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Panel6: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 460
          Height = 28
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = ''
          object Label3: TUniLabel
            Left = 4
            Top = 7
            Width = 25
            Height = 13
            Hint = ''
            Caption = ' SQL '
            TabOrder = 2
            OnMouseDown = Label3MouseDown
          end
          object Panel9: TUniPanel
            Left = 432
            Top = 1
            Width = 28
            Height = 26
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object sbtnVerifySQL: TUniSpeedButton
              Left = 1
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Verify SQL'
              ShowHint = True
              ParentShowHint = False
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
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = sbtnVerifySQLClick
            end
          end
        end
        object Panel8: TUniPanel
          Left = 1
          Top = 28
          Width = 460
          Height = 238
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object RichEdit1: TUniMemo
            Left = 1
            Top = 1
            Width = 458
            Height = 236
            Hint = ''
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Height = -12
            Font.Name = 'Courier New'
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            WordWrap = False
          end
        end
      end
      object Panel3: TUniPanel
        Left = 1
        Top = 266
        Width = 462
        Height = 49
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          462
          49)
        object Label1: TUniLabel
          Left = 4
          Top = 10
          Width = 55
          Height = 13
          Hint = ''
          Caption = 'Result Field'
          TabOrder = 2
        end
        object wwDBComboBoxResultField: TUniDBComboBox
          Left = 108
          Top = 7
          Width = 345
          Height = 21
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          Style = csDropDownList
          TabOrder = 0
          OnDropDown = wwDBComboBoxResultFieldDropDown
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 317
    Width = 466
    Height = 40
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel7: TUniPanel
      Left = 242
      Top = 1
      Width = 224
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 114
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object popmSQLExample: TUniPopupMenu
    Left = 180
    Top = 104
    object SeeExample1: TUniMenuItem
      Caption = 'See Example'
      OnClick = SeeExample1Click
    end
  end
end
