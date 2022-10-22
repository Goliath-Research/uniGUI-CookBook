inherited SndBL: TSndBL
  Left = 300
  Top = 172
  HelpContext = 2840
  ClientHeight = 374
  Caption = 'Blend Operations'
  ExplicitWidth = 320
  ExplicitHeight = 433
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TUniSplitter
    Top = 194
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitTop = 194
  end
  inherited PageControlHeader: TUniPageControl
    Height = 167
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheetTable
    ExplicitHeight = 167
    inherited TabSheetForm: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitHeight = 139
      inherited PnlHeader01: TUniPanel
        Width = 1025
        Height = 139
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ExplicitWidth = 1025
        ExplicitHeight = 139
        inherited SplitterHeader01: TUniSplitter
          Height = 139
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitHeight = 139
        end
        inherited PnlHeaderLeft01: TUniPanel
          Height = 137
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitHeight = 137
          inherited Label2: TUniLabel
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          inherited Label7: TUniLabel
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          inherited Label1: TUniLabel
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          object lblSPG: TUniLabel
            Left = 8
            Top = 76
            Width = 19
            Height = 13
            Hint = ''
            Caption = 'SPG'
            TabOrder = 4
          end
        end
        inherited PnlHeaderClient01: TUniPanel
          Width = 938
          Height = 137
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 938
          ExplicitHeight = 137
          DesignSize = (
            938
            137)
          object DBCheckBox1: TUniDBCheckBox [0]
            Left = 1
            Top = 111
            Width = 177
            Height = 17
            Hint = ''
            DataField = 'ATPRESS'
            DataSource = SndDM.SrcSndOp
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Blended at Work Center'
            TabOrder = 7
          end
          object DBCheckUseLetDown: TUniDBCheckBox [1]
            Left = 1
            Top = 128
            Width = 207
            Height = 17
            Hint = 'Check to use Let Down Ratio method for blend materials'
            ShowHint = True
            ParentShowHint = False
            DataField = 'USE_LET_DOWN_RATIO'
            DataSource = SndDM.SrcSndOp
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Define Blend by LD Ratio'
            TabOrder = 5
          end
          inherited dbeOpNo: TUniDBEdit
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          inherited dbeClass: TUniDBEdit
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          inherited dbeOpDesc: TUniDBEdit
            Width = 939
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitWidth = 939
          end
          inherited dbchkPkHide: TUniDBCheckBox
            Top = 143
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 6
            ExplicitTop = 143
          end
          inherited dbchkSupermarket: TUniDBCheckBox
            Top = 95
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitTop = 95
          end
          object wwDBComboDlgSPG: TUniEdit
            Left = 1
            Top = 72
            Width = 100
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 3
            ReadOnly = True
          end
        end
      end
    end
    inherited TabSheetTable: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitHeight = 139
      inherited dbgOperHeader: TIQUniGridControl
        Height = 139
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        IQComponents.Grid.Height = 53
        IQComponents.HiddenPanel.Height = 53
        IQComponents.HiddenPanel.ExplicitHeight = 53
        IQComponents.FormTab.ExplicitLeft = 0
        IQComponents.FormTab.ExplicitTop = 0
        IQComponents.FormTab.ExplicitWidth = 256
        IQComponents.FormTab.ExplicitHeight = 82
        Columns = <
          item
            FieldName = 'OP_CLASS'
            Title.Caption = 'Class'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'OPNO'
            Title.Caption = 'Oper #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'OPDESC'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER1'
            Title.Caption = 'CUSER1'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER2'
            Title.Caption = 'CUSER2'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER3'
            Title.Caption = 'CUSER3'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER4'
            Title.Caption = 'CUSER4'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER5'
            Title.Caption = 'CUSER5'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER6'
            Title.Caption = 'CUSER6'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER7'
            Title.Caption = 'CUSER7'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER8'
            Title.Caption = 'CUSER8'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER9'
            Title.Caption = 'CUSER9'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER10'
            Title.Caption = 'CUSER10'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER1'
            Title.Caption = 'NUSER1'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER2'
            Title.Caption = 'NUSER2'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER3'
            Title.Caption = 'NUSER3'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER4'
            Title.Caption = 'NUSER4'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER5'
            Title.Caption = 'NUSER5'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER6'
            Title.Caption = 'NUSER6'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER7'
            Title.Caption = 'NUSER7'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER8'
            Title.Caption = 'NUSER8'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER9'
            Title.Caption = 'NUSER9'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER10'
            Title.Caption = 'NUSER10'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'IS_SUPERMARKET'
            Title.Caption = 'Supermarket'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        ExplicitHeight = 139
        Marker = 0
      end
    end
  end
  inherited PageControlDetails: TUniPageControl
    Top = 197
    Height = 177
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheetOpInfo
    ExplicitTop = 197
    ExplicitHeight = 177
    inherited TabSheetOpInfo: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Inventory Item'
      ExplicitHeight = 149
      object Splitter3: TUniSplitter
        Left = 850
        Top = 0
        Width = 2
        Height = 149
        Hint = ''
        Align = alRight
        ParentColor = False
        Color = clBtnFace
      end
      object Panel5: TUniPanel
        Left = 852
        Top = 0
        Width = 173
        Height = 149
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = 'Panel5'
        object Panel4: TUniPanel
          Left = 1
          Top = 1
          Width = 171
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object SBCalc: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Calculate Blend Price Breaks'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              CDB6A88068608060507058407058407050407050406050406050306050307050
              40B89A83FF00FFFF00FFFF00FFFF00FFB5B5B568686860606056565656565650
              50505050504E4E4E4C4C4C4C4C4C505050989898FF00FFFF00FFFF00FFFF00FF
              877766D0C0B0D0B8B0D0B0A0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A090B098
              90775E46FF00FFFF00FFFF00FFFF00FF757575BEBEBEB8B8B8AFAFAFAEAEAEA8
              A8A8A8A8A8A0A0A0A0A0A09E9E9E9999995C5C5CFF00FFFF00FFFF00FFFF00FF
              967E66F0E0D0D0C0B0D0B8B0D0B0B0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A0
              90775E46FF00FFFF00FFFF00FFFF00FF7B7B7BDEDEDEBEBEBEB8B8B8B3B3B3AE
              AEAEA8A8A8A8A8A8A0A0A0A0A0A09E9E9E5C5C5CFF00FFFF00FFFF00FFFF00FF
              967E75F0E0D0C08870B07050D0B8B0C08870B07050C0B0A0C08870B07050C0A0
              90775E46FF00FFFF00FFFF00FFFF00FF7E7E7EDEDEDE898989717171B8B8B889
              8989717171AEAEAE898989717171A0A0A05C5C5CFF00FFFF00FFFF00FFFF00FF
              968675F0E0E0FFC8B0C08870D0C0B0F0C8B0C08870C0B0A0F0C8B0C08070C0A8
              90775E46FF00FFFF00FFFF00FFFF00FF848484E2E2E2C8C8C8898989BEBEBEC7
              C7C7898989AEAEAEC7C7C7838383A5A5A55C5C5CFF00FFFF00FFFF00FFFF00FF
              968D85F0E8E0E0D0C0D0C8C0D0C0C0D0C0B0D0B8B0D0B8B0C0B0A0C0B0A0C0A8
              A0776655FF00FFFF00FFFF00FFFF00FF8C8C8CE7E7E7CECECEC7C7C7C2C2C2BE
              BEBEB8B8B8B8B8B8AEAEAEAEAEAEA8A8A8646464FF00FFFF00FFFF00FFFF00FF
              A58D85FFE8E0C09070B07050E0C8C0C09080B07050D0B8B0C09070B07050C0B0
              A0866655FF00FFFF00FFFF00FFFF00FF8D8D8DE9E9E98E8E8E717171C9C9C991
              9191717171B8B8B88E8E8E717171AEAEAE666666FF00FFFF00FFFF00FFFF00FF
              A59585FFF0F0FFC8B0C08870E0D0C0F0C8B0C08870D0C0B0F0C8B0C08870D0B0
              A0866D55FF00FFFF00FFFF00FFFF00FF939393F2F2F2C8C8C8898989CECECEC7
              C7C7898989BEBEBEC7C7C7898989AFAFAF6B6B6BFF00FFFF00FFFF00FFFF00FF
              A59C94FFF0F0E0E0E0E0D8D0E0D0D0E0D0D0E0C8C0D0C8C0D0C0B0D0C0B0D0B8
              B0866D55FF00FFFF00FFFF00FFFF00FF9B9B9BF2F2F2E0E0E0D7D7D7D2D2D2D2
              D2D2C9C9C9C7C7C7BEBEBEBEBEBEB8B8B86B6B6BFF00FFFF00FFFF00FFFF00FF
              B4A494FFF8F09080D04030A0E0D8D09080D04030A0E0C8C09080D04030A0D0C0
              B0867564FF00FFFF00FFFF00FFFF00FFA2A2A2F7F7F7979797595959D7D7D797
              9797595959C9C9C9979797595959BEBEBE737373FF00FFFF00FFFF00FFFF00FF
              B4A4A3FFF8F0C0C0E09080D0E0E0E0C0C0E09080D0E0D0D0C0C0E09080D0D0C0
              C0957564FF00FFFF00FFFF00FFFF00FFA6A6A6F7F7F7C8C8C8979797E0E0E0C8
              C8C8979797D2D2D2C8C8C8979797C2C2C2757575FF00FFFF00FFFF00FFFF00FF
              B4ABA3FFF8FFFFE0D0FFD0B0FFD0B0FFC090F0B890D0A080D0A080D0B0A0D0C8
              C0957C73FF00FFFF00FFFF00FFFF00FFAAAAAAFAFAFAE0E0E0CECECECECECEBD
              BDBDB6B6B69E9E9E9E9E9EAFAFAFC7C7C77C7C7CFF00FFFF00FFFF00FFFF00FF
              B4ABA3FFFFFFFF9860FFA060FFA060FFA060FFA060FFA060FFA060B06850C0A8
              90958473FF00FFFF00FFFF00FFFF00FFAAAAAAFFFFFF9A9A9A9F9F9F9F9F9F9F
              9F9F9F9F9F9F9F9F9F9F9F6B6B6BA5A5A5828282FF00FFFF00FFFF00FFFF00FF
              B4B3A3FFFFFFE07840F0D8D0F0D8D0F0C8B0E0B0A0E0A080E08050A05830D0A0
              90958473FF00FFFF00FFFF00FFFF00FFB0B0B0FFFFFF7B7B7BD9D9D9D9D9D9C7
              C7C7B1B1B1A0A0A08282825A5A5AA1A1A1828282FF00FFFF00FFFF00FFFF00FF
              DAC7C0BEB3A9F0B8A0D09070D08860D08050D07040D06830C06030D08060A088
              80C6A891FF00FFFF00FFFF00FFFF00FFC7C7C7B2B2B2B8B8B890909088888880
              80807373736C6C6C646464838383888888A6A6A6FF00FFFF00FFFF00FFFF00FF
              FF00FFCCC4B3B0A8A0B0A8A0B0A090B09890B09890A09890A09080A08880C9AE
              98FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1A7A7A7A7A7A79E9E9E99
              99999999999797978E8E8E888888ACACACFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = SBCalcClick
          end
          object NavBlendQtyBreaks: TUniDBNavigator
            Left = 46
            Top = 1
            Width = 125
            Height = 25
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataSource = SndDM.SrcBlendArinvt_Breaks
            VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
        object GridBlendQtyBreaks: TUniDBGrid
          Left = 1
          Top = 27
          Width = 171
          Height = 122
          Hint = ''
          DataSource = SndDM.SrcBlendArinvt_Breaks
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgTabs, dgCancelOnExit]
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Columns = <
            item
              FieldName = 'QUAN'
              Title.Caption = 'Qty'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QPRICE'
              Title.Caption = 'Price Break'
              Width = 66
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object Panel3: TUniPanel
        Left = 0
        Top = 0
        Width = 850
        Height = 149
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object PnlItem01: TUniPanel
          Left = 1
          Top = 1
          Width = 848
          Height = 147
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter4: TUniSplitter
            Left = 81
            Top = 0
            Width = 6
            Height = 147
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlItemLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 81
            Height = 145
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label3: TUniLabel
              Left = 4
              Top = 6
              Width = 33
              Height = 13
              Hint = ''
              Caption = 'Item #'
              TabOrder = 1
            end
            object Label4: TUniLabel
              Left = 4
              Top = 28
              Width = 40
              Height = 13
              Hint = ''
              Caption = 'Revision'
              TabOrder = 2
            end
            object Label5: TUniLabel
              Left = 4
              Top = 50
              Width = 53
              Height = 13
              Hint = ''
              Caption = 'Description'
              TabOrder = 3
            end
            object Label6: TUniLabel
              Left = 4
              Top = 94
              Width = 19
              Height = 13
              Hint = ''
              Caption = 'Unit'
              TabOrder = 4
            end
            object Label8: TUniLabel
              Left = 4
              Top = 72
              Width = 62
              Height = 13
              Hint = ''
              Caption = 'Ext. Descrip.'
              TabOrder = 5
            end
          end
          object PnlItemClient01: TUniPanel
            Left = 87
            Top = 1
            Width = 761
            Height = 145
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              761
              145)
            object dbeItemNo: TUniDBEdit
              Left = 1
              Top = 1
              Width = 120
              Height = 24
              Hint = ''
              DataField = 'ItemNo'
              DataSource = SndDM.SrcSndOp
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -12
              TabOrder = 0
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
            end
            object dbeRev: TUniDBEdit
              Left = 1
              Top = 22
              Width = 120
              Height = 24
              Hint = ''
              DataField = 'Rev'
              DataSource = SndDM.SrcSndOp
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -12
              TabOrder = 1
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
            end
            object dbeDescrip: TUniDBEdit
              Left = 1
              Top = 44
              Width = 755
              Height = 24
              Hint = ''
              DataField = 'Descrip'
              DataSource = SndDM.SrcSndOp
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -12
              TabOrder = 2
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
            end
            object dbeUnit: TUniDBEdit
              Left = 1
              Top = 88
              Width = 120
              Height = 24
              Hint = ''
              DataField = 'Unit'
              DataSource = SndDM.SrcSndOp
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -12
              TabOrder = 3
              TabStop = False
              Color = clBtnFace
            end
            object bbtnEditBlendInv: TUniBitBtn
              Left = 1
              Top = 120
              Width = 97
              Height = 25
              Hint = ''
              Caption = 'Edit'
              TabOrder = 4
              OnClick = bbtnEditBlendInvClick
            end
            object DBExt: TUniDBEdit
              Left = 1
              Top = 66
              Width = 755
              Height = 24
              Hint = ''
              DataField = 'ExtDescrip'
              DataSource = SndDM.SrcSndOp
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -12
              TabOrder = 5
              TabStop = False
              Color = clBtnFace
            end
          end
        end
      end
    end
    inherited TabSheetMaterials: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitHeight = 149
      inherited Splitter2: TUniSplitter
        Left = 860
        Width = 3
        Height = 149
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitLeft = 860
        ExplicitWidth = 3
        ExplicitHeight = 149
      end
      inherited pnlMaterials: TUniPanel
        Width = 860
        Height = 149
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 860
        ExplicitHeight = 149
        object Bevel1: TUniPanel [0]
          Left = 1
          Top = 27
          Width = 858
          Height = 3
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Caption = ''
        end
        inherited GridMaterials: TUniDBGrid
          Top = 30
          Width = 858
          Height = 119
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Columns = <
            item
              FieldName = 'ItemNo'
              Title.Caption = 'Item #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PTSPER_DISP'
              Title.Caption = 'Blend %'
              Width = 54
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LET_DOWN_RATIO'
              Title.Caption = 'LD Ratio'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Class'
              Title.Caption = 'Class'
              Width = 33
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Descrip'
              Title.Caption = 'Description'
              Width = 98
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Uom'
              Title.Caption = 'Native UOM'
              Width = 124
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Descrip2'
              Title.Caption = 'Ext Description'
              Width = 214
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Rev'
              Title.Caption = 'Rev'
              Width = 94
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Spg'
              Title.Caption = 'SPG'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        inherited Panel1: TUniPanel
          Width = 858
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 858
          inherited navMaterials: TUniDBNavigator
            Left = 633
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 633
          end
        end
      end
      inherited pnlMatQPB: TUniPanel
        Height = 149
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitHeight = 149
        object Bevel2: TUniPanel [0]
          Left = 1
          Top = 27
          Width = 160
          Height = 3
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Caption = ''
        end
        inherited GridQtyBreaks: TUniDBGrid
          Top = 30
          Height = 119
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Columns = <
            item
              FieldName = 'QUAN'
              Title.Caption = 'Quantity'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QPRICE'
              Title.Caption = 'Price Break'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        inherited Panel2: TUniPanel
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          inherited navMatQPB: TUniDBNavigator
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
        end
      end
    end
    inherited TabSheet1: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitHeight = 149
      inherited PageControl1: TUniPageControl
        Height = 149
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ActivePage = tabDocExternal
        ExplicitHeight = 149
        inherited tabDocInternal: TUniTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 256
          ExplicitHeight = 121
          inherited IQDocs1: TIQWebDocs
            Height = 121
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitHeight = 121
          end
        end
        inherited tabDocExternal: TUniTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 256
          ExplicitHeight = 121
          inherited IQExtDoc1: TIQWebExtDoc
            Height = 121
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitHeight = 121
          end
        end
      end
    end
  end
  inherited pnlToolBar: TUniPanel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    inherited sbtnSearch: TUniSpeedButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited sbtnTableForm: TUniSpeedButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited sbtnOpCost: TUniSpeedButton
      Left = 106
      Width = 28
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 106
      ExplicitWidth = 28
    end
    object SBCalcAll: TUniSpeedButton [3]
      Left = 56
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Calculate All Blends Price Breaks'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        CDB6A88068608060507058407058407050407050406050406050306050307050
        40B89A83FF00FFFF00FFFF00FFFF00FFB5B5B568686860606056565656565650
        50505050504E4E4E4C4C4C4C4C4C505050989898FF00FFFF00FFFF00FFFF00FF
        877766D0C0B0D0B8B0D0B0A0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A090B098
        90775E46FF00FFFF00FFFF00FFFF00FF757575BEBEBEB8B8B8AFAFAFAEAEAEA8
        A8A8A8A8A8A0A0A0A0A0A09E9E9E9999995C5C5CFF00FFFF00FFFF00FFFF00FF
        967E66F0E0D0D0C0B0D0B8B0D0B0B0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A0
        90775E46FF00FFFF00FFFF00FFFF00FF7B7B7BDEDEDEBEBEBEB8B8B8B3B3B3AE
        AEAEA8A8A8A8A8A8A0A0A0A0A0A09E9E9E5C5C5CFF00FFFF00FFFF00FFFF00FF
        967E75F0E0D0C08870B07050D0B8B0C08870B07050C0B0A0C08870B07050C0A0
        90775E46FF00FFFF00FFFF00FFFF00FF7E7E7EDEDEDE898989717171B8B8B889
        8989717171AEAEAE898989717171A0A0A05C5C5CFF00FFFF00FFFF00FFFF00FF
        968675F0E0E0FFC8B0C08870D0C0B0F0C8B0C08870C0B0A0F0C8B0C08070C0A8
        90775E46FF00FFFF00FFFF00FFFF00FF848484E2E2E2C8C8C8898989BEBEBEC7
        C7C7898989AEAEAEC7C7C7838383A5A5A55C5C5CFF00FFFF00FFFF00FFFF00FF
        968D85F0E8E0E0D0C0D0C8C0D0C0C0D0C0B0D0B8B0D0B8B0C0B0A0C0B0A0C0A8
        A0776655FF00FFFF00FFFF00FFFF00FF8C8C8CE7E7E7CECECEC7C7C7C2C2C2BE
        BEBEB8B8B8B8B8B8AEAEAEAEAEAEA8A8A8646464FF00FFFF00FFFF00FFFF00FF
        A58D85FFE8E0C09070B07050E0C8C0C09080B07050D0B8B0C09070B07050C0B0
        A0866655FF00FFFF00FFFF00FFFF00FF8D8D8DE9E9E98E8E8E717171C9C9C991
        9191717171B8B8B88E8E8E717171AEAEAE666666FF00FFFF00FFFF00FFFF00FF
        A59585FFF0F0FFC8B0C08870E0D0C0F0C8B0C08870D0C0B0F0C8B0C08870D0B0
        A0866D55FF00FFFF00FFFF00FFFF00FF939393F2F2F2C8C8C8898989CECECEC7
        C7C7898989BEBEBEC7C7C7898989AFAFAF6B6B6BFF00FFFF00FFFF00FFFF00FF
        A59C94FFF0F0E0E0E0E0D8D0E0D0D0E0D0D0E0C8C0D0C8C0D0C0B0D0C0B0D0B8
        B0866D55FF00FFFF00FFFF00FFFF00FF9B9B9BF2F2F2E0E0E0D7D7D7D2D2D2D2
        D2D2C9C9C9C7C7C7BEBEBEBEBEBEB8B8B86B6B6BFF00FFFF00FFFF00FFFF00FF
        B4A494FFF8F09080D04030A0E0D8D09080D04030A0E0C8C09080D04030A0D0C0
        B0867564FF00FFFF00FFFF00FFFF00FFA2A2A2F7F7F7979797595959D7D7D797
        9797595959C9C9C9979797595959BEBEBE737373FF00FFFF00FFFF00FFFF00FF
        B4A4A3FFF8F0C0C0E09080D0E0E0E0C0C0E09080D0E0D0D0C0C0E09080D0D0C0
        C0957564FF00FFFF00FFFF00FFFF00FFA6A6A6F7F7F7C8C8C8979797E0E0E0C8
        C8C8979797D2D2D2C8C8C8979797C2C2C2757575FF00FFFF00FFFF00FFFF00FF
        B4ABA3FFF8FFFFE0D0FFD0B0FFD0B0FFC090F0B890D0A080D0A080D0B0A0D0C8
        C0957C73FF00FFFF00FFFF00FFFF00FFAAAAAAFAFAFAE0E0E0CECECECECECEBD
        BDBDB6B6B69E9E9E9E9E9EAFAFAFC7C7C77C7C7CFF00FFFF00FFFF00FFFF00FF
        B4ABA3FFFFFFFF9860FFA060FFA060FFA060FFA060FFA060FFA060B06850C0A8
        90958473FF00FFFF00FFFF00FFFF00FFAAAAAAFFFFFF9A9A9A9F9F9F9F9F9F9F
        9F9F9F9F9F9F9F9F9F9F9F6B6B6BA5A5A5828282FF00FFFF00FFFF00FFFF00FF
        B4B3A3FFFFFFE07840F0D8D0F0D8D0F0C8B0E0B0A0E0A080E08050A05830D0A0
        90958473FF00FFFF00FFFF00FFFF00FFB0B0B0FFFFFF7B7B7BD9D9D9D9D9D9C7
        C7C7B1B1B1A0A0A08282825A5A5AA1A1A1828282FF00FFFF00FFFF00FFFF00FF
        DAC7C0BEB3A9F0B8A0D09070D08860D08050D07040D06830C06030D08060A088
        80C6A891FF00FFFF00FFFF00FFFF00FFC7C7C7B2B2B2B8B8B890909088888880
        80807373736C6C6C646464838383888888A6A6A6FF00FFFF00FFFF00FFFF00FF
        FF00FFCCC4B3B0A8A0B0A8A0B0A090B09890B09890A09890A09080A08880C9AE
        98FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1A7A7A7A7A7A79E9E9E99
        99999999999797978E8E8E888888ACACACFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SBCalcAllClick
    end
    inherited sbtnEquip: TUniSpeedButton
      Left = 159
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 159
    end
    inherited sbtnQtyPrice: TUniSpeedButton
      Left = 134
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 134
    end
    inherited bvToolbarBreak1: TUniPanel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited bbtnRouteNote: TUniSpeedButton
      Left = 81
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 81
    end
    inherited NavMain: TUniDBNavigator
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 300
    Top = 1
    inherited View1: TUniMenuItem
      inherited Generic1: TUniMenuItem
        Caption = 'Process / Standard Operation'
      end
    end
    inherited Options1: TUniMenuItem
      Visible = False
    end
  end
  inherited IQAbout1: TIQWebAbout
    ModuleName = 'Blend Operations'
    Left = 364
    Top = 1
  end
  inherited IQRepDef1: TIQWebRepDef
    Left = 328
    Top = 1
  end
  inherited PrinterSetupDialog1: TPrinterSetupDialog
    Left = 272
    Top = 1
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'New1'
      'Edit1'
      'Delete1'
      'ToggleTableForm1'
      'Reports1'
      'sbtnTableForm'
      'sbCalcAll'
      'navblendQtyBreaks'
      'dbcheckbox1'
      'DBCheckUseLetDown'
      'DBChkPKHide'
      'navMaterials'
      'navMatQPB'
      'bbtnRouteNote'
      'bbtnEditBlendInv'
      'SBCalc'
      'TblSndOp'
      'TblArinvt_Breaks'
      'TblBlendArinvt_Breaks'
      'IQDocs1'
      'IQExtDoc1'
      'TblOpMat'
      'wwDBComboDlgSPG')
    Left = 228
    Top = 1
  end
  object pmBlends: TUniPopupMenu
    OnPopup = pmBlendsPopup
    Left = 238
    Top = 172
  end
  object procCheckCircularRef: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.BLENDS.CHECKCIRCULARREF'
    Left = 266
    Top = 174
    ParamData = <
      item
        Name = 'V_ARINVT_ID_PARENT'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_ARINVT_ID_CHILD'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
end
