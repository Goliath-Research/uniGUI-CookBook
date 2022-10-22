inherited FrmDispoProduction: TFrmDispoProduction
  Left = 86
  Top = 147
  HelpContext = 1064238
  ClientHeight = 415
  ClientWidth = 901
  Caption = 'Production Disposition'
  OnShow = UniFormShow
  FormStyle = fsNormal
  ActiveControl = gridTargetLoc
  ExplicitWidth = 917
  ExplicitHeight = 454
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    Width = 901
    Height = 415
    ExplicitWidth = 901
    ExplicitHeight = 415
    inherited Panel2: TUniPanel
      Top = 375
      Width = 899
      ExplicitTop = 375
      ExplicitWidth = 899
      inherited Panel3: TUniPanel
        Left = 689
        ExplicitLeft = 689
      end
    end
    inherited PnlCarrier: TUniPanel
      Width = 899
      Height = 374
      ExplicitWidth = 899
      ExplicitHeight = 374
      inherited SplitterCarrierLeft01: TUniSplitter
        Height = 372
        ExplicitTop = 1
        ExplicitHeight = 372
      end
      inherited ScrollBoxCarrierLeft01: TUniScrollBox
        Height = 372
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitHeight = 372
        inherited pnlCarrierLeft01: TUniPanel
          Height = 370
          ExplicitHeight = 370
          DesignSize = (
            264
            370)
          inherited Label1: TUniLabel
            TabOrder = 11
          end
          inherited Label2: TUniLabel
            TabOrder = 13
          end
          inherited Label3: TUniLabel
            TabOrder = 14
          end
          object lblEPlant: TUniLabel [4]
            Left = 7
            Top = 149
            Width = 30
            Height = 13
            Hint = ''
            Caption = 'EPlant'
            TabOrder = 18
          end
          object Label6: TUniLabel [5]
            Left = 7
            Top = 172
            Width = 18
            Height = 13
            Hint = ''
            Caption = 'Qty'
            TabOrder = 19
          end
          object lblFloorDispo: TUniLabel [6]
            Left = 7
            Top = 195
            Width = 53
            Height = 13
            Hint = ''
            Caption = 'Floor Dispo'
            TabOrder = 20
          end
          object lblLeftToDispo: TUniLabel [7]
            Left = 7
            Top = 218
            Width = 61
            Height = 13
            Hint = ''
            Caption = 'Left to Dispo'
            TabOrder = 21
          end
          inherited Label4: TUniLabel
            TabOrder = 15
          end
          inherited lblUnit: TUniLabel
            TabOrder = 16
          end
          inherited DBEdit1: TUniDBEdit
            DataField = 'Class'
          end
          inherited DBEdit2: TUniDBEdit
            Width = 181
            DataField = 'ItemNo'
            ExplicitWidth = 181
          end
          inherited DBEdit3: TUniDBEdit
            DataField = 'Rev'
          end
          inherited DBEdit4: TUniDBEdit
            Width = 181
            DataField = 'Descrip'
            ExplicitWidth = 181
          end
          inherited dbeUNIT: TUniDBEdit
            DataField = 'Unit'
          end
          inherited dbeExtDescription: TUniDBEdit
            Width = 181
            DataField = 'Descrip2'
            ExplicitWidth = 181
          end
          object DBEdit8: TUniDBEdit
            Tag = 1
            Left = 94
            Top = 146
            Width = 80
            Height = 19
            Hint = ''
            DataField = 'EPlant_Name'
            DataSource = SrcMaster
            TabOrder = 6
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
          end
          object dbchkDispo: TUniDBCheckBox
            Left = 94
            Top = 239
            Width = 82
            Height = 17
            Hint = ''
            DataField = 'DISPO'
            DataSource = SrcMaster
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Dispositioned'
            TabOrder = 7
            ParentColor = False
            Color = clBtnFace
            ReadOnly = True
          end
          object DBEdit6: TUniDBEdit
            Left = 94
            Top = 169
            Width = 80
            Height = 19
            Hint = ''
            DataField = 'Good_Pts_Disp'
            DataSource = SrcMaster
            TabOrder = 8
            Color = clBtnFace
            ReadOnly = True
          end
          object DBEdit5: TUniDBEdit
            Tag = 1
            Left = 94
            Top = 192
            Width = 80
            Height = 19
            Hint = ''
            DataField = 'Floor_Dispo_Qty_Disp'
            DataSource = SrcMaster
            TabOrder = 9
            Color = clBtnFace
            ReadOnly = True
          end
          object DBEdit7: TUniDBEdit
            Tag = 1
            Left = 94
            Top = 215
            Width = 80
            Height = 19
            Hint = ''
            DataField = 'Left_Dispo_Disp'
            DataSource = SrcMaster
            TabOrder = 10
            Color = clBtnFace
            ReadOnly = True
          end
        end
      end
      inherited pnlCarrierClient01: TUniPanel
        Width = 626
        Height = 372
        ExplicitWidth = 626
        ExplicitHeight = 372
        inherited Splitter1: TUniSplitter
          Top = 160
          Width = 624
          ExplicitLeft = 1
          ExplicitTop = 160
          ExplicitWidth = 624
        end
        inherited PageControl1: TUniPageControl
          Width = 624
          Height = 159
          ExplicitWidth = 624
          ExplicitHeight = 159
          inherited TabSheet1: TUniTabSheet
            ExplicitWidth = 616
            ExplicitHeight = 131
            inherited Panel1: TUniPanel
              Width = 616
              Height = 131
              ExplicitWidth = 616
              ExplicitHeight = 131
              object Label7: TUniLabel [0]
                Left = 144
                Top = 88
                Width = 63
                Height = 13
                Hint = ''
                Caption = 'EPlant_Name'
                TabOrder = 5
              end
              inherited bvAddTo: TUniPanel
                Top = 48
                Width = 614
                ExplicitTop = 48
                ExplicitWidth = 614
              end
              inherited Panel5: TUniPanel
                Top = 21
                Width = 614
                ExplicitTop = 21
                ExplicitWidth = 614
                DesignSize = (
                  614
                  27)
                object Shape1: TUniPanel [0]
                  Left = 470
                  Top = 8
                  Width = 10
                  Height = 11
                  Hint = 'Location does not exist'
                  ShowHint = True
                  ParentShowHint = False
                  Anchors = [akTop, akRight]
                  TabOrder = 2
                  Caption = ''
                end
                inherited DBNavigator1: TUniDBNavigator
                  Left = 488
                  ExplicitLeft = 488
                end
              end
              inherited gridTargetLoc: TUniDBGrid
                Top = 51
                Width = 614
                Height = 79
                Columns = <
                  item
                    FieldName = 'Location'
                    Title.Caption = 'Location'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'LotNo'
                    Title.Caption = 'Lot'
                    Width = 91
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'QUAN'
                    Title.Caption = 'Quantity'
                    Width = 82
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'In_Date'
                    Title.Caption = 'In Date'
                    Width = 97
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'EPlant_Name'
                    Title.Caption = 'EPlant'
                    Width = 70
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end>
              end
              inherited PnlAddToCaption: TUniPanel
                Width = 614
                ExplicitWidth = 614
              end
            end
          end
        end
        inherited Panel4: TUniPanel
          Top = 163
          Width = 624
          Height = 208
          ExplicitTop = 163
          ExplicitWidth = 624
          ExplicitHeight = 208
          inherited Splitter2: TUniSplitter
            Left = 294
            Top = 1
            Height = 206
            ExplicitLeft = 294
            ExplicitTop = 1
            ExplicitHeight = 206
          end
          inherited Panel7: TUniPanel
            Width = 293
            Height = 206
            ExplicitWidth = 293
            ExplicitHeight = 206
            inherited bvMaterialsInvolved: TUniPanel
              Top = 48
              Width = 291
              ExplicitTop = 48
              ExplicitWidth = 291
            end
            inherited gridMatReq: TUniDBGrid
              Top = 51
              Width = 291
              Height = 154
              OnTitleClick = gridMatReqTitleClick
              Columns = <
                item
                  FieldName = 'CLASS'
                  Title.Caption = 'Class'
                  Width = 64
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'ITEMNO'
                  Title.Caption = 'Item #'
                  Width = 67
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DESCRIP'
                  Title.Caption = 'Description'
                  Width = 87
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TOT_MAT_QTY'
                  Title.Caption = 'Quantity'
                  Width = 62
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TOT_RG_QTY'
                  Title.Caption = 'RG Quantity'
                  Width = 68
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'REV'
                  Title.Caption = 'Revision'
                  Width = 24
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'EPlant_Name'
                  Title.Caption = 'EPlant'
                  Width = 88
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'FLOOR_DISPO_QTY'
                  Title.Caption = 'Floor Disposition'
                  Width = 74
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DESCRIP2'
                  Title.Caption = 'Ext Description'
                  Width = 208
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'UNIT'
                  Title.Caption = 'UOM'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'OnHand'
                  Title.Caption = 'On Hand'
                  Width = 93
                  CheckBoxField.FieldValues = 'true;false'
                end>
            end
            inherited Panel11: TUniPanel
              Top = 21
              Width = 291
              ExplicitTop = 21
              ExplicitWidth = 291
              inherited DBNavigator3: TUniDBNavigator
                Left = 165
                ExplicitLeft = 165
              end
              object ddbtnAlternateItem: TIQWebDropDownButton
                Left = 128
                Top = 1
                Width = 37
                Height = 25
                Hint = 'Alternate Items [ One Time ]'
                ShowHint = True
                ParentShowHint = False
                Caption = ''
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD0000000DDDDDDDDD0FF
                  FFF0DDDDDDDDD0FFFFF0DDDDDDDDD0FFFFF0DDDDDDDDD0CCCCC00000000DD000
                  00000FFFFF0DDDDD0DDD0FFFFF0DDDD000DD0FFFFF0DDDDD0DDD0CCCCC000000
                  0DDD0000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 2
                OnClick = ReplacewithAlternateOneTime1Click
              end
            end
            inherited PnlMaterialsInvolvedCaption: TUniPanel
              Width = 291
              ExplicitWidth = 291
            end
          end
          inherited Panel9: TUniPanel
            Left = 327
            Width = 296
            Height = 206
            ExplicitLeft = 327
            ExplicitWidth = 296
            ExplicitHeight = 206
            inherited bvRelieve: TUniPanel
              Top = 48
              Width = 294
              ExplicitTop = 48
              ExplicitWidth = 294
            end
            inherited Panel10: TUniPanel
              Top = 21
              Width = 294
              ExplicitTop = 21
              ExplicitWidth = 294
              inherited DBNavigator2: TUniDBNavigator
                Left = 168
                ExplicitLeft = 168
              end
              object pnlLegendRelieve: TUniPanel
                Left = 143
                Top = 1
                Width = 25
                Height = 25
                Hint = ''
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                DesignSize = (
                  25
                  25)
                object Shape2: TUniPanel
                  Left = 1
                  Top = 7
                  Width = 10
                  Height = 11
                  Hint = 'Location does not exist'
                  ShowHint = True
                  ParentShowHint = False
                  Anchors = [akTop]
                  TabOrder = 1
                  Caption = ''
                end
              end
            end
            inherited gridMatLoc: TUniDBGrid
              Top = 51
              Width = 294
              Height = 154
              Columns = <
                item
                  FieldName = 'Location'
                  Title.Caption = 'Location'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'LotNo'
                  Title.Caption = 'Lot'
                  Width = 35
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'QUAN'
                  Title.Caption = 'Quantity'
                  Width = 40
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'RG_QUAN'
                  Title.Caption = 'RG Quantity'
                  Width = 40
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'EPlant_Name'
                  Title.Caption = 'EPlant '
                  Width = 73
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end>
            end
            inherited PnlRelieveCaption: TUniPanel
              Width = 294
              ExplicitWidth = 294
            end
          end
          inherited Panel8: TUniPanel
            Left = 300
            Height = 206
            ExplicitLeft = 300
            ExplicitHeight = 206
            object sbtnRightAll: TUniSpeedButton
              Left = 1
              Top = 124
              Width = 25
              Height = 25
              Hint = 'Relieve all material'
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
                FF00FFFF00FF809080D5C2B1FF00FFFF00FFFF00FFFF00FF809080CFB59EFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C8C8CC0C0C0FF00FFFF
                00FFFF00FFFF00FF8C8C8CB3B3B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF809080202020B6AA96FF00FFFF00FFFF00FF809080202020B09C
                84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C8C8C202020A7A7A7FF
                00FFFF00FFFF00FF8C8C8C202020999999FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF809080407850202020BCAE99FF00FFFF00FF8090804078502020
                20B49E85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C8C8C6E6E6E202020AB
                ABABFF00FFFF00FF8C8C8C6E6E6E2020209B9B9BFF00FFFF00FF809880202820
                303830304030404840509060407850202020958C7D555C4B4048405090604078
                50202020B39A80FF00FFFF00FF2525253535353B3B3B4646468484846E6E6E20
                20208A8A8A5858584646468484846E6E6E202020979797FF00FF80A090B0E8C0
                70B08070A88060A07060987060A87040785020202060886060A07060987060A8
                70407850202020B1977C9B9B9BDDDDDDA3A3A39D9D9D9494948D8D8D9A9A9A6E
                6E6E2020207E7E7E9494948D8D8D9A9A9A6E6E6E20202094949490A890B0F0C0
                90E0B090D8A080D0A070C09070B88060A87050906060786080D0A070C09070B8
                8060A870509060607860A2A2A2E3E3E3D2D2D2C9C9C9C2C2C2B3B3B3AAAAAA9A
                9A9A848484717171C2C2C2B3B3B3AAAAAA9A9A9A84848471717190B8A0B0F0D0
                B0F0C0B0E8C0A0E8C0A0E0B070C09070B080809880A0D8B0A0E8C0A0E0B070C0
                9070B080809880C9B99FB1B1B1E6E6E6E3E3E3DDDDDDDCDCDCD3D3D3B3B3B3A3
                A3A3919191CDCDCDDCDCDCD3D3D3B3B3B3A3A3A3919191B5B5B590C0A090B8A0
                90A89080A090809880B0E8C080C890809880C5C8AD96AB99809880B0E8C080C8
                90809880CBBCA3FF00FFB7B7B7B1B1B1A2A2A29B9B9B919191DDDDDDBABABA91
                9191C3C3C3A6A6A6919191DDDDDDBABABA919191B8B8B8FF00FFFF00FFFF00FF
                FF00FFFF00FF80A090A0E0C0809880D3CEBAFF00FFFF00FF80A090A0E0C08098
                80CCBFA7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9BD6D6D6919191CB
                CBCBFF00FFFF00FF9B9B9BD6D6D6919191BCBCBCFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF90A890809880D3CFBCFF00FFFF00FFFF00FF90A890809880CDC2
                ABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA2A2A2919191CCCCCCFF
                00FFFF00FFFF00FFA2A2A2919191BFBFBFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF90B8A0DFD8C0FF00FFFF00FFFF00FFFF00FF90B8A0DACCB0FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B1D4D4D4FF00FFFF
                00FFFF00FFFF00FFB1B1B1C8C8C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
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
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Style = [fsBold]
              ParentColor = False
              Color = clWindow
              OnClick = sbtnRightAllClick
            end
            object sbtnLeftAll: TUniSpeedButton
              Left = 1
              Top = 158
              Width = 25
              Height = 25
              Hint = 'Remove all material'
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
                FF00FFFF00FFCFB59E809080FF00FFFF00FFFF00FFFF00FFD5C2B1809080FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3B3B38C8C8CFF00FFFF
                00FFFF00FFFF00FFC0C0C08C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFB09C84202020809080FF00FFFF00FFFF00FFB6AA96202020809080FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9999992020208C8C8CFF00FFFF
                00FFFF00FFA7A7A72020208C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B49E85202020407850809080FF00FFFF00FFBCAE99202020407850809080FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9B2020206E6E6E8C8C8CFF00FFFF
                00FFABABAB2020206E6E6E8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFB39A80
                202020407850509060404840555C4B958C7D2020204078505090604048403040
                30303830202820809880FF00FF9797972020206E6E6E8484844646465858588A
                8A8A2020206E6E6E8484844646463B3B3B353535252525919191B1977C202020
                40785060A87060987060A07060886020202040785060A87060987060A07070A8
                8070B080B0E8C080A0909494942020206E6E6E9A9A9A8D8D8D9494947E7E7E20
                20206E6E6E9A9A9A8D8D8D9494949D9D9DA3A3A3DDDDDD9B9B9B607860509060
                60A87070B88070C09080D0A060786050906060A87070B88070C09080D0A090D8
                A090E0B0B0F0C090A8907171718484849A9A9AAAAAAAB3B3B3C2C2C271717184
                84849A9A9AAAAAAAB3B3B3C2C2C2C9C9C9D2D2D2E3E3E3A2A2A2C9B99F809880
                70B08070C090A0E0B0A0E8C0A0D8B080988070B08070C090A0E0B0A0E8C0B0E8
                C0B0F0C0B0F0D090B8A0B5B5B5919191A3A3A3B3B3B3D3D3D3DCDCDCCDCDCD91
                9191A3A3A3B3B3B3D3D3D3DCDCDCDDDDDDE3E3E3E6E6E6B1B1B1FF00FFCBBCA3
                80988080C890B0E8C080988096AB99C5C8AD80988080C890B0E8C080988080A0
                9090A89090B8A090C0A0FF00FFB8B8B8919191BABABADDDDDD919191A6A6A6C3
                C3C3919191BABABADDDDDD9191919B9B9BA2A2A2B1B1B1B7B7B7FF00FFFF00FF
                CCBFA7809880A0E0C080A090FF00FFFF00FFD3CEBA809880A0E0C080A090FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFBCBCBC919191D6D6D69B9B9BFF00FFFF
                00FFCBCBCB919191D6D6D69B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFCDC2AB80988090A890FF00FFFF00FFFF00FFD3CFBC80988090A890FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBF919191A2A2A2FF00FFFF
                00FFFF00FFCCCCCC919191A2A2A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCB090B8A0FF00FFFF00FFFF00FFFF00FFDFD8C090B8A0FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8B1B1B1FF00FFFF
                00FFFF00FFFF00FFD4D4D4B1B1B1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
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
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Style = [fsBold]
              ParentColor = False
              Color = clWindow
              OnClick = sbtnLeftAllClick
            end
          end
        end
      end
    end
  end
  inherited QryFGMulti: TFDQuery [1]
    SQL.Strings = (
      'select f.id as fgmulti_id,'
      '       f.lotno,'
      '       f.onhand,'
      '       loc.loc_desc,'
      '       f.in_date,'
      '       f.eplant_id,'
      
        '       decode( e.id, NULL, '#39#39',  '#39'['#39' || e.ID || '#39']  '#39' || e.name) ' +
        'as EPlant_Name'
      '  from fgmulti f,'
      '       locations loc,'
      '       eplant e'
      ' where f.loc_id = loc.id'
      '   and f.eplant_id = e.id(+)'
      '   and f.id = :fgmulti_id'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 163
    Top = 295
    ParamData = <
      item
        Name = 'fgmulti_id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryFGMultiIN_DATE: TDateTimeField
      FieldName = 'IN_DATE'
      Origin = 'FGMULTI.IN_DATE'
    end
    object QryFGMultiEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'FGMULTI.EPLANT_ID'
      Size = 0
    end
    object QryFGMultiEPLANT_NAME: TStringField
      FieldName = 'EPLANT_NAME'
      Size = 74
    end
  end
  inherited SrcMaster: TDataSource [2]
    Left = 17
    Top = 294
  end
  inherited SrcDetail: TDataSource [3]
    Left = 49
    Top = 294
  end
  inherited TblMaster: TFDTable [4]
    OnCalcFields = TblMasterCalcFields
    IndexFieldNames = 'ID'
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'DAY_PART'
    TableName = 'DAY_PART'
    Left = 17
    Top = 311
    object TblMasterID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblMasterHIST_ILLUM_PART_ID: TBCDField
      FieldName = 'HIST_ILLUM_PART_ID'
      Required = True
      Size = 0
    end
    object TblMasterACTCAV: TFMTBCDField
      FieldName = 'ACTCAV'
      Size = 0
    end
    object TblMasterGOOD_PTS: TBCDField
      FieldName = 'GOOD_PTS'
      Size = 2
    end
    object TblMasterClass: TStringField
      FieldKind = fkCalculated
      FieldName = 'Class'
      LookupDataSet = QryHist_Illum_RT
      LookupKeyFields = 'ID'
      LookupResultField = 'CLASS'
      KeyFields = 'HIST_ILLUM_PART_ID'
      Calculated = True
    end
    object TblMasterItemNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'ItemNo'
      LookupDataSet = QryHist_Illum_RT
      LookupKeyFields = 'ID'
      LookupResultField = 'ITEMNO'
      KeyFields = 'HIST_ILLUM_PART_ID'
      Size = 25
      Calculated = True
    end
    object TblMasterRev: TStringField
      FieldKind = fkCalculated
      FieldName = 'Rev'
      LookupDataSet = QryHist_Illum_RT
      LookupKeyFields = 'ID'
      LookupResultField = 'REV'
      KeyFields = 'HIST_ILLUM_PART_ID'
      Size = 25
      Calculated = True
    end
    object TblMasterDescrip: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      LookupDataSet = QryHist_Illum_RT
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'HIST_ILLUM_PART_ID'
      Size = 100
      Calculated = True
    end
    object TblMasterArinvt_ID: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Arinvt_ID'
      LookupDataSet = QryHist_Illum_RT
      LookupKeyFields = 'ID'
      LookupResultField = 'ARINVT_ID'
      KeyFields = 'HIST_ILLUM_PART_ID'
      Size = 0
      Calculated = True
    end
    object TblMasterDISPO: TStringField
      FieldName = 'DISPO'
      Size = 1
    end
    object TblMasterDAYPROD_ID: TBCDField
      FieldName = 'DAYPROD_ID'
      Required = True
      Size = 0
    end
    object TblMasterStandard_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Standard_ID'
      LookupDataSet = QryHist_Illum_RT
      LookupKeyFields = 'ID'
      LookupResultField = 'STANDARD_ID'
      KeyFields = 'HIST_ILLUM_PART_ID'
      Calculated = True
    end
    object TblMasterFLOOR_DISPO_QTY: TBCDField
      FieldName = 'FLOOR_DISPO_QTY'
      Size = 2
    end
    object TblMasterTRANS_BATCH: TBCDField
      FieldName = 'TRANS_BATCH'
      Size = 0
    end
    object TblMasterLeft_To_Dispo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Left_To_Dispo'
      Calculated = True
    end
    object TblMasterUnit: TStringField
      FieldKind = fkCalculated
      FieldName = 'Unit'
      LookupDataSet = QryHist_Illum_RT
      LookupKeyFields = 'ID'
      LookupResultField = 'UNIT'
      KeyFields = 'HIST_ILLUM_PART_ID'
      Size = 10
      Calculated = True
    end
    object TblMasterPtWt: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PtWt'
      LookupDataSet = QryHist_Illum_RT
      LookupKeyFields = 'ID'
      LookupResultField = 'PTWT'
      KeyFields = 'HIST_ILLUM_PART_ID'
      Calculated = True
    end
    object TblMasterMfg_Type: TStringField
      FieldKind = fkCalculated
      FieldName = 'Mfg_Type'
      LookupDataSet = QryHist_Illum_RT
      LookupKeyFields = 'ID'
      LookupResultField = 'MFG_TYPE'
      KeyFields = 'HIST_ILLUM_PART_ID'
      Size = 10
      Calculated = True
    end
    object TblMasterGood_Pts_Disp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Good_Pts_Disp'
      Calculated = True
    end
    object TblMasterFloor_Dispo_Qty_Disp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Floor_Dispo_Qty_Disp'
      Calculated = True
    end
    object TblMasterLeft_Dispo_Disp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Left_Dispo_Disp'
      Calculated = True
    end
    object TblMasterEPlant_Name: TStringField
      FieldKind = fkCalculated
      FieldName = 'EPlant_Name'
      LookupDataSet = QryHist_Illum_RT
      LookupKeyFields = 'ID'
      LookupResultField = 'EPLANT_NAME'
      KeyFields = 'HIST_ILLUM_PART_ID'
      Calculated = True
    end
    object TblMasterHist_Illum_Rt_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Hist_Illum_Rt_ID'
      Calculated = True
    end
    object TblMasterWork_Center_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Work_Center_ID'
      Calculated = True
    end
    object TblMasterFLOOR_DISPO_QTY_OUT: TBCDField
      FieldName = 'FLOOR_DISPO_QTY_OUT'
      Visible = False
      Size = 2
    end
    object TblMasterWorkorder_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Workorder_ID'
      Calculated = True
    end
    object TblMasterDescrip2: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descrip2'
      Size = 100
      Calculated = True
    end
    object TblMasterPtorder_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Ptorder_ID'
      Calculated = True
    end
  end
  inherited TblDetail: TFDTable [5]
    BeforePost = TblDetailBeforePost
    OnCalcFields = TblDetailCalcFields
    Filtered = True
    Filter = 'ARINVT_ID > 0'
    IndexFieldNames = 'DAY_PART_ID;ID'
    MasterSource = SrcMaster
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'MATPROD'
    TableName = 'MATPROD'
    Left = 48
    Top = 312
    object TblDetailDAY_PART_ID: TBCDField
      FieldName = 'DAY_PART_ID'
      Required = True
      Size = 0
    end
    object TblDetailARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Required = True
      Size = 0
    end
    object TblDetailARINVT_ID_STD: TBCDField
      FieldName = 'ARINVT_ID_STD'
      Size = 0
    end
    object TblDetailDISPO: TStringField
      FieldName = 'DISPO'
      Size = 1
    end
    object TblDetailCLASS: TStringField
      FieldName = 'CLASS'
      Size = 2
    end
    object TblDetailITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object TblDetailREV: TStringField
      FieldName = 'REV'
      Size = 15
    end
    object TblDetailDESCRIP: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object TblDetailTOT_MAT_QTY: TFMTBCDField
      FieldName = 'TOT_MAT_QTY'
      DisplayFormat = '########0.00'
    end
    object TblDetailTOT_RG_QTY: TFMTBCDField
      FieldName = 'TOT_RG_QTY'
      DisplayFormat = '########0.00'
    end
    object TblDetailSTD_MAT_QTY: TFMTBCDField
      FieldName = 'STD_MAT_QTY'
      DisplayFormat = '########0.00'
    end
    object TblDetailSTD_RG_QTY: TFMTBCDField
      FieldName = 'STD_RG_QTY'
      DisplayFormat = '########0.00'
    end
    object TblDetailEPlant_Name: TStringField
      FieldKind = fkCalculated
      FieldName = 'EPlant_Name'
      Calculated = True
    end
    object TblDetailID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblDetailFLOOR_DISPO_QTY: TFMTBCDField
      FieldName = 'FLOOR_DISPO_QTY'
      DisplayFormat = '########0.00'
    end
    object TblDetailIsSerialized: TStringField
      FieldKind = fkCalculated
      FieldName = 'IsSerialized'
      Size = 1
      Calculated = True
    end
    object TblDetailDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object TblDetailSTD_COST: TFMTBCDField
      FieldName = 'STD_COST'
      Visible = False
    end
    object TblDetailIS_REWORK: TStringField
      FieldName = 'IS_REWORK'
      Visible = False
      Size = 1
    end
    object TblDetailUNIT: TStringField
      DisplayLabel = 'UOM'
      FieldName = 'UNIT'
      Size = 10
    end
    object TblDetailOnHand: TBCDField
      DisplayLabel = 'On Hand'
      FieldKind = fkCalculated
      FieldName = 'OnHand'
      Calculated = True
    end
  end
  inherited PkArinvt: TIQWebHpick [6]
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    SQL.Strings = (
      'select id,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip,'
      '       descrip2,'
      '       eplant_id,'
      '       pk_hide,'
      '       std_cost,'
      '       unit'
      '  from arinvt')
    Left = 49
    Top = 341
    object PkArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'ARINVT.EPLANT_ID'
      Size = 0
    end
    object PkArinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'ARINVT.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArinvtSTD_COST: TFMTBCDField
      FieldName = 'STD_COST'
      Origin = 'ARINVT.STD_COST'
      Visible = False
    end
    object PkArinvtUNIT: TStringField
      DisplayLabel = 'UOM'
      FieldName = 'UNIT'
      Origin = 'ARINVT.UNIT'
      Size = 10
    end
  end
  inherited TblDetailLoc: TFDTable [7]
    BeforePost = AssignIDBeforePost
    OnCalcFields = TblDetailLocCalcFields
    OnNewRecord = TblDetailLocNewRecord
    IndexFieldNames = 'MATPROD_ID'
    MasterSource = SrcDetail
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'MATPROD_LOCATION'
    TableName = 'MATPROD_LOCATION'
    Left = 121
    Top = 312
    object TblDetailLocDAY_PART_ID: TBCDField
      FieldName = 'DAY_PART_ID'
      Required = True
      Size = 0
    end
    object TblDetailLocARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Required = True
      Size = 0
    end
    object TblDetailLocFGMULTI_ID: TBCDField
      DisplayLabel = 'Location/Lot#'
      FieldName = 'FGMULTI_ID'
      Required = True
      Size = 0
    end
    object TblDetailLocQUAN: TFMTBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QUAN'
      DisplayFormat = '########0.00'
      EditFormat = '########0.00'
    end
    object TblDetailLocRG_QUAN: TFMTBCDField
      FieldName = 'RG_QUAN'
      DisplayFormat = '########0.00'
      EditFormat = '########0.00'
    end
    object TblDetailLocStringField: TStringField
      FieldKind = fkCalculated
      FieldName = 'Location'
      LookupDataSet = QryFGMulti
      LookupKeyFields = 'FGMULTI_ID'
      LookupResultField = 'LOC_DESC'
      KeyFields = 'FGMULTI_ID'
      Size = 30
      Calculated = True
    end
    object TblDetailLocStringField2: TStringField
      FieldKind = fkCalculated
      FieldName = 'LotNo'
      LookupDataSet = QryFGMulti
      LookupKeyFields = 'FGMULTI_ID'
      LookupResultField = 'LOTNO'
      KeyFields = 'FGMULTI_ID'
      Size = 25
      Calculated = True
    end
    object TblDetailLocEPlant_Name2: TStringField
      FieldKind = fkCalculated
      FieldName = 'EPlant_Name'
      LookupDataSet = QryFGMulti
      LookupKeyFields = 'FGMULTI_ID'
      LookupResultField = 'EPlant_Name'
      KeyFields = 'FGMULTI_ID'
      ReadOnly = True
      Calculated = True
    end
    object TblDetailLocID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblDetailLocMATPROD_ID: TBCDField
      FieldName = 'MATPROD_ID'
      Size = 0
    end
    object TblDetailLocHIST_LOC_DESC: TStringField
      FieldName = 'HIST_LOC_DESC'
      Visible = False
      Size = 30
    end
    object TblDetailLocHIST_LOTNO: TStringField
      FieldName = 'HIST_LOTNO'
      Visible = False
      Size = 25
    end
    object TblDetailLocLocation_Exists: TStringField
      FieldKind = fkCalculated
      FieldName = 'Location_Exists'
      Size = 1
      Calculated = True
    end
  end
  inherited SrcMasterLoc: TDataSource [8]
    Left = 89
    Top = 294
  end
  inherited SrcDetailLoc: TDataSource [9]
    Left = 121
    Top = 294
  end
  inherited PkMasterFGMulti: TIQWebHpick [10]
    Filtered = True
    SQL.Strings = (
      'select f.id as fgmulti_id,'
      '       loc.loc_desc as loc_desc,'
      '       f.lotno as lotno,'
      '       cast(f.onhand as number(15,6)) as onhand,'
      '       f.rg_onhand as rg_onhand,'
      '       nc.descrip as non_conform,'
      '       f.eplant_id as eplant_id,'
      '       f.division_id as division_id,'
      '       loc.VMI as VMI,'
      '       f.in_date as in_date,'
      '       d.name as division_name,'
      ''
      
        '       case (select upper(source) from v_fgmulti_allocated where' +
        ' fgmulti_id = f.id)'
      
        '         when '#39'workorder_bom_mat_loc'#39' then (select '#39'WO# '#39' || b.w' +
        'orkorder_id'
      
        '                                              from workorder_bom' +
        '_mat_loc m, '
      
        '                                                   workorder_bom' +
        ' b'
      
        '                                             where m.fgmulti_id ' +
        '= f.id'
      
        '                                               and m.workorder_b' +
        'om_id = b.id)'
      '         when '#39'fab_lot_mat_loc'#39' then (select '#39'Lot# '#39' || d.lotno '
      '                                         from fab_lot_mat_loc l,'
      '                                              fab_lot_mat a,'
      '                                              fab_lot_process b,'
      '                                              fab_lot_wo c,'
      '                                              fab_lot d'
      
        '                                        where l.fgmulti_id = f.i' +
        'd'
      
        '                                          and l.fab_lot_mat_id =' +
        ' a.id'
      
        '                                          and a.fab_lot_process_' +
        'id = b.id'
      
        '                                          and b.fab_lot_wo_id = ' +
        'c.id'
      
        '                                          and c.fab_lot_id = d.i' +
        'd )'
      '        else'
      '          null '
      '        end as hard_allocated_to,'
      '       '
      
        '       decode( (select source from v_fgmulti_allocated where fgm' +
        'ulti_id = f.id), NULL, '#39'N'#39', '#39'Y'#39' ) as is_hard_alloc,'
      ''
      '       f.non_conform_id as non_conform_id,'
      '       f.non_allocate_id as non_allocate_id,'
      
        '       f.shipment_dtl_id_in_transit as shipment_dtl_id_in_transi' +
        't,'
      '       f.make_to_order_detail_id as make_to_order_detail_id,'
      '       f.lot_date as lot_date,'
      
        '       (select shelf_life from arinvt where id = f.arinvt_id) as' +
        ' shelf_life,'
      ''
      
        '       case (select count(id) from arinvt_lot_docs where arinvt_' +
        'id = f.arinvt_id and trim(lotno) = trim(f.lotno))     '
      '         when 0 then'
      
        '           (select country from vendor where id = :AVendorId and' +
        ' :AVendorId <> 0) '
      '         else'
      
        '           (select country from arinvt_lot_docs where arinvt_id ' +
        '= f.arinvt_id and trim(lotno) = trim(f.lotno) and rownum < 2)   ' +
        '            '
      '         end as country  '
      '       '
      ''
      '-- HPICK_FROM_START'
      '       '
      '  from v_fgmulti_ex f, '
      '       locations loc,'
      '       non_conform nc,'
      '       division d'
      ' where f.loc_id = loc.id'
      '   and arinvt_id = :arinvt_id'
      '   and f.non_conform_id = nc.id(+)'
      '   and ( NVL(loc.VMI, '#39'N'#39')  = :AVMI or 1 = :ADummy)'
      '   and f.division_id = d.id(+)'
      '   and mto.is_dispo_location_valid( :workorder_id, f.id ) = 1'
      ''
      ''
      ' ')
    Left = 89
    Top = 341
    ParamData = <
      item
        Name = 'AVENDORID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'AVMI'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ADummy'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'workorder_id'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object PkMasterFGMultiIN_DATE: TDateTimeField [11]
      DisplayLabel = 'In Date'
      FieldName = 'IN_DATE'
    end
    object PkMasterFGMultiRG_ONHAND: TBCDField
      DisplayLabel = 'RG OnHand'
      FieldName = 'RG_ONHAND'
    end
    object PkMasterFGMultiEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkMasterFGMultiDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
  end
  inherited SR: TIQWebSecurityRegister [11]
    SecurityItems.Strings = (
      'sbtnRightAll'
      'sbtnLeftAll'
      'ddbtnAlternateItem'
      'ReplacewithAlternateOneTime1'
      'ReplacewithAlternateThisWorkOrder1')
    Left = 191
    Top = 77
  end
  inherited QryEPlant: TFDQuery [12]
    Left = 164
    Top = 261
  end
  inherited TblMasterLoc: TFDTable [13]
    OnCalcFields = TblMasterLocCalcFields
    IndexFieldNames = 'DAY_PART_ID'
    MasterSource = SrcMaster
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'DAY_PART_LOCATION'
    UpdateOptions.KeyFields = 'DAY_PART_ID;FGMULTI_ID'
    TableName = 'DAY_PART_LOCATION'
    Left = 89
    Top = 311
    object TblMasterLocDAY_PART_ID: TBCDField
      FieldName = 'DAY_PART_ID'
      Required = True
      Size = 0
    end
    object TblMasterLocFGMULTI_ID: TBCDField
      DisplayLabel = 'Location/Lot#'
      FieldName = 'FGMULTI_ID'
      Required = True
      Size = 0
    end
    object TblMasterLocQUAN: TFMTBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QUAN'
      Required = True
    end
    object TblMasterLocLocation: TStringField
      FieldKind = fkCalculated
      FieldName = 'Location'
      LookupDataSet = QryFGMulti
      LookupKeyFields = 'FGMULTI_ID'
      LookupResultField = 'LOC_DESC'
      KeyFields = 'FGMULTI_ID'
      Size = 30
      Calculated = True
    end
    object TblMasterLocLotNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'LotNo'
      LookupDataSet = QryFGMulti
      LookupKeyFields = 'FGMULTI_ID'
      LookupResultField = 'LOTNO'
      KeyFields = 'FGMULTI_ID'
      Size = 25
      Calculated = True
    end
    object TblMasterLocIn_Date: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'In_Date'
      LookupDataSet = QryFGMulti
      LookupKeyFields = 'FGMULTI_ID'
      LookupResultField = 'IN_DATE'
      KeyFields = 'FGMULTI_ID'
      Calculated = True
    end
    object TblMasterLocEPlant_Name: TStringField
      FieldKind = fkCalculated
      FieldName = 'EPlant_Name'
      LookupDataSet = QryFGMulti
      LookupKeyFields = 'FGMULTI_ID'
      LookupResultField = 'EPLANT_NAME'
      KeyFields = 'FGMULTI_ID'
      ReadOnly = True
      Calculated = True
    end
    object TblMasterLocHIST_LOC_DESC: TStringField
      FieldName = 'HIST_LOC_DESC'
      Visible = False
      Size = 30
    end
    object TblMasterLocHIST_LOTNO: TStringField
      FieldName = 'HIST_LOTNO'
      Visible = False
      Size = 25
    end
    object TblMasterLocLocation_Exists: TStringField
      FieldKind = fkCalculated
      FieldName = 'Location_Exists'
      Size = 1
      Calculated = True
    end
  end
  inherited PkMasterFGMultiRecDef: TIQWebHpick
    Left = 184
    Top = 360
  end
  object QryHist_Illum_RT: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select h.id,'
      '       h.class,'
      '       h.itemno,'
      '       h.rev,'
      '       h.descrip,'
      '       h.descrip2,'
      '       p.arinvt_id,'
      '       p.standard_id,'
      '       -- '#39'EACH'#39' as unit,'
      '       -- i.uom as unit,'
      '       a.unit,'
      '       h.ptwt,'
      '       i.mfg_type,'
      '       i.id as hist_illum_rt_id,'
      
        '       decode( e.id, NULL, '#39#39',  '#39'['#39' || e.ID || '#39']  '#39' || e.name) ' +
        'as EPlant_Name,'
      '       i.work_center_id,'
      '       i.workorder_id,'
      
        '       (select id from ptorder where workorder_id = i.workorder_' +
        'id and partno_id = h.partno_id ) as ptorder_id'
      '  from hist_illum_part h,'
      '       partno p,'
      '       hist_illum_rt i,'
      '       arinvt a,'
      '       eplant e'
      ' where h.partno_id = p.id(+)'
      '   and h.hist_illum_rt_id = i.id'
      '   and p.arinvt_id = a.id'
      '   and a.eplant_id = e.id(+)'
      '   and h.id = :illum_part_id'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 193
    Top = 295
    ParamData = <
      item
        Name = 'illum_part_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryHist_Illum_RTID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryHist_Illum_RTCLASS: TStringField
      FieldName = 'CLASS'
      Size = 2
    end
    object QryHist_Illum_RTITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryHist_Illum_RTREV: TStringField
      FieldName = 'REV'
      Size = 15
    end
    object QryHist_Illum_RTDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryHist_Illum_RTARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object QryHist_Illum_RTSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Size = 0
    end
    object QryHist_Illum_RTUNIT: TStringField
      FieldName = 'UNIT'
      Size = 10
    end
    object QryHist_Illum_RTPTWT: TFMTBCDField
      FieldName = 'PTWT'
      Size = 6
    end
    object QryHist_Illum_RTMFG_TYPE: TStringField
      FieldName = 'MFG_TYPE'
      Size = 10
    end
    object QryHist_Illum_RTEPLANT_NAME: TStringField
      FieldName = 'EPLANT_NAME'
      Size = 74
    end
    object QryHist_Illum_RTHIST_ILLUM_RT_ID: TBCDField
      FieldName = 'HIST_ILLUM_RT_ID'
      Size = 0
    end
    object QryHist_Illum_RTWORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Size = 0
    end
    object QryHist_Illum_RTWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryHist_Illum_RTDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryHist_Illum_RTPTORDER_ID: TFMTBCDField
      FieldName = 'PTORDER_ID'
      Size = 38
    end
  end
  object TransDispo1: TIQWebTransDispo
    Trans_Type = 'DISPOSITION'
    ConfirmError = True
    Trans_Reason = 'DISPOSITION'
    Left = 17
    Top = 341
  end
  object procAppendCostAlloc: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.COST_OPER.APPEND_FROM_PROD'
    Left = 225
    Top = 296
    ParamData = <
      item
        Name = 'v_day_part_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
  object PkMasterFGMultiRelieve: TIQWebHpick
    BeforeOpen = PkMasterFGMultiBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select f.id as fgmulti_id,'
      '       loc.loc_desc as loc_desc,'
      '       f.lotno as lotno,'
      '       f.onhand as onhand,'
      '       f.rg_onhand as rg_onhand,'
      '       nc.descrip as non_conform,'
      '       f.eplant_id as eplant_id,'
      '       f.division_id as division_id,'
      '       loc.VMI as VMI,'
      '       f.in_date as in_date,'
      '       d.name as division_name,'
      
        '       decode( hard_alloc.fgmulti_belongs_same_wo( f.id, :workor' +
        'der_id ), 1, '#39'Y'#39', '#39'N'#39') as hard_alloc_to_wo,'
      ''
      
        '       hard_alloc.get_hard_alloc_to_wo( f.id ) as hard_alloc_to_' +
        'workorder, '
      ''
      
        '       decode( (select source from v_fgmulti_allocated where fgm' +
        'ulti_id = f.id), NULL, '#39'N'#39', '#39'Y'#39' ) as is_hard_alloc,'
      ''
      '       f.non_conform_id as non_conform_id,'
      '       f.non_allocate_id as non_allocate_id,'
      
        '       f.shipment_dtl_id_in_transit as shipment_dtl_id_in_transi' +
        't,'
      '       f.make_to_order_detail_id as make_to_order_detail_id,'
      '       f.lot_date as lot_date,'
      
        '       (select shelf_life from arinvt where id = f.arinvt_id) as' +
        ' shelf_life'
      ''
      '-- HPICK_FROM_START'
      ''
      '  from v_fgmulti_ex f, '
      '       locations loc,'
      '       non_conform nc,'
      '       division d'
      ' where f.loc_id = loc.id'
      '   and f.arinvt_id = :arinvt_id'
      '   and f.non_conform_id = nc.id(+)'
      '   and ( NVL(loc.VMI, '#39'N'#39')  = :AVMI or 1 = :ADummy)'
      '   and f.division_id = d.id(+)'
      '       /* and f.make_to_order_detail_id is null */'
      '   and mto.is_relieve_location_valid( :workorder_id, f.id ) = 1'
      ''
      '   and misc.eplant_filter(f.eplant_id) = 1'
      ''
      
        '   and ( hard_alloc.fgmulti_belongs_same_wo( f.id, 0 ) = 1      ' +
        '                  /* this fgmulti is not hard allocated*/'
      '         or'
      
        '         hard_alloc.fgmulti_belongs_same_wo( f.id, :workorder_id' +
        ' ) = 1)           /* this fgmulti is hard allocated to workorder' +
        '_id */'
      '         '
      '       /* check filter locations assigned to the rework wo */'
      
        '   and workorder_misc.check_rework_wo_has_location( :workorder_i' +
        'd, f.arinvt_id, f.id ) = 1'
      ' ')
    OnIQModify = PkMasterFGMultiRelieveIQModify
    OnIQAfterHPickCreate = PkMasterFGMultiRelieveIQAfterHPickCreate
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 255
    Top = 357
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'AVMI'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ADummy'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'workorder_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkMasterFGMultiRelieveFGMULTI_ID: TBCDField
      FieldName = 'FGMULTI_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiRelieveLOC_DESC: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object PkMasterFGMultiRelieveLOTNO: TStringField
      DisplayLabel = 'Lot#'
      FieldName = 'LOTNO'
      Size = 25
    end
    object PkMasterFGMultiRelieveONHAND: TBCDField
      DisplayLabel = 'OnHand'
      FieldName = 'ONHAND'
    end
    object PkMasterFGMultiRelieveRG_ONHAND: TBCDField
      DisplayLabel = 'RG OnHand'
      FieldName = 'RG_ONHAND'
    end
    object PkMasterFGMultiRelieveNON_CONFORM: TStringField
      DisplayLabel = 'Non Conform'
      FieldName = 'NON_CONFORM'
      Size = 30
    end
    object PkMasterFGMultiRelieveVMI: TStringField
      FieldName = 'VMI'
      Size = 1
    end
    object PkMasterFGMultiRelieveDIVISION_NAME: TStringField
      DisplayLabel = 'Division Name'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
    object PkMasterFGMultiRelieveEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkMasterFGMultiRelieveDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiRelieveIN_DATE: TDateTimeField
      DisplayLabel = 'In Date'
      FieldName = 'IN_DATE'
    end
    object PkMasterFGMultiRelieveHARD_ALLOC_TO_WO: TStringField
      DisplayLabel = 'Hard Allocated'
      FieldName = 'HARD_ALLOC_TO_WO'
      Size = 1
    end
    object PkMasterFGMultiRelieveIS_HARD_ALLOC: TStringField
      FieldName = 'IS_HARD_ALLOC'
      Visible = False
      Size = 1
    end
    object PkMasterFGMultiRelieveNON_CONFORM_ID: TBCDField
      FieldName = 'NON_CONFORM_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiRelieveNON_ALLOCATE_ID: TBCDField
      FieldName = 'NON_ALLOCATE_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiRelieveSHIPMENT_DTL_ID_IN_TRANSIT: TBCDField
      FieldName = 'SHIPMENT_DTL_ID_IN_TRANSIT'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiRelieveMAKE_TO_ORDER_DETAIL_ID: TBCDField
      FieldName = 'MAKE_TO_ORDER_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiRelieveLOT_DATE: TDateTimeField
      FieldName = 'LOT_DATE'
      Visible = False
    end
    object PkMasterFGMultiRelieveSHELF_LIFE: TFMTBCDField
      FieldName = 'SHELF_LIFE'
      Visible = False
      Size = 38
    end
    object PkMasterFGMultiRelieveHARD_ALLOC_TO_WORKORDER: TFMTBCDField
      DisplayLabel = 'Hard Alloc To WO#'
      FieldName = 'HARD_ALLOC_TO_WORKORDER'
      Size = 38
    end
  end
  object popmMaterials: TUniPopupMenu
    Left = 388
    Top = 239
    object JumpToInventory1: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumpToInventory1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcDetail
    JumpTo = jtInventory
    Left = 388
    Top = 274
  end
  object popmDropDownAlternateItem: TUniPopupMenu
    Left = 419
    Top = 238
    object ReplacewithAlternateOneTime1: TUniMenuItem
      Caption = 'Replace with Alternate [ One Time ]'
      OnClick = ReplacewithAlternateOneTime1Click
    end
    object ReplacewithAlternateThisWorkOrder1: TUniMenuItem
      Caption = 'Replace with Alternate [ This Work Order ]'
      OnClick = ReplacewithAlternateThisWorkOrder1Click
    end
  end
end
