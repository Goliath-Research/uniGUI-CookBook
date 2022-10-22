object FrmInvTransPlanBase: TFrmInvTransPlanBase
  Left = 0
  Top = 0
  ClientHeight = 548
  ClientWidth = 918
  Caption = 'Inventory Transaction Location Plan'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TUniSplitter
    Left = 0
    Top = 89
    Width = 918
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Splitter3: TUniSplitter
    Left = 0
    Top = 307
    Width = 918
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 918
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object FlowPanel1: TUniPanel
      Left = 1
      Top = 1
      Width = 916
      Height = 26
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object sbtnRecalculate: TUniSpeedButton
        Left = 0
        Top = 0
        Width = 25
        Height = 25
        Hint = 'Recalculate'
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
        OnClick = sbtnRecalculateClick
      end
    end
  end
  object pnlItem: TUniPanel
    Left = 0
    Top = 93
    Width = 918
    Height = 214
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Splitter4: TUniSplitter
      Left = 650
      Top = 29
      Width = 4
      Height = 184
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel7: TUniPanel
      Left = 1
      Top = 1
      Width = 916
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object NavInvTransItem: TUniDBNavigator
        Left = 682
        Top = 1
        Width = 233
        Height = 26
        Hint = ''
        DataSource = SrcInvTransItem
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object wwDBComboDlgNote: TUniEdit
      Left = 244
      Top = 89
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 1
      ReadOnly = True
    end
    object pnlInvPlanItem: TUniPanel
      Left = 1
      Top = 29
      Width = 649
      Height = 184
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      Caption = ''
      object gridInvPlanItem: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 647
        Height = 182
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 430
        IQComponents.Grid.Height = 96
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcInvTransItem
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
        IQComponents.Navigator.DataSource = SrcInvTransItem
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 430
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 96
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcInvTransItem
        Columns = <
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QTY'
            Title.Caption = 'Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DivisionName'
            Title.Caption = 'Division'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TransRule'
            Title.Caption = 'Rule Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'UNITS'
            Title.Caption = 'Pk Units'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NOTE1'
            Title.Caption = 'Note'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Item Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REV'
            Title.Caption = 'Item Rev '
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CLASS'
            Title.Caption = 'Item Class'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP2'
            Title.Caption = 'Item Ext Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
    object pnlInvPlanItemRight: TUniPanel
      Left = 654
      Top = 29
      Width = 263
      Height = 184
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      Caption = ''
      object diItem: TwwDataInspector
        Left = 1
        Top = 1
        Width = 261
        Height = 182
        DisableThemes = False
        Align = alClient
        PopupMenu = popmItemDetails
        TabOrder = 0
        DataSource = SrcInvTransItem
        Items = <
          item
            DataSource = SrcInvTransItem
            DataField = 'MOVE_CLASS_DESCRIP'
            Caption = 'Move Class'
            WordWrap = False
          end
          item
            DataSource = SrcInvTransItem
            DataField = 'PK_UNIT_TYPE_DISP'
            Caption = 'Pk Unit Type'
            WordWrap = False
          end
          item
            DataSource = SrcInvTransItem
            DataField = 'PTSPER'
            Caption = 'Items Per Pk Unit'
            WordWrap = False
          end
          item
            DataSource = SrcInvTransItem
            DataField = 'VOLUME'
            Caption = 'Volume'
            WordWrap = False
          end
          item
            DataSource = SrcInvTransItem
            DataField = 'ARINVT_GROUP_NAME'
            Caption = 'Inventory Group'
            WordWrap = False
          end
          item
            DataSource = SrcInvTransItem
            DataField = 'WMS_GROUP_CODE'
            Caption = 'WMS Inventory Group'
            WordWrap = False
          end>
        DefaultRowHeight = 19
        CaptionWidth = 127
        Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        LineStyleCaption = ovDottedLine
        LineStyleData = ovDottedLine
        ReadOnly = True
        OnDrawCaptionCell = diItemDrawCaptionCell
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 311
    Width = 918
    Height = 237
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 402
      Top = 1
      Width = 4
      Height = 235
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object pnlDetails: TUniPanel
      Left = 1
      Top = 1
      Width = 401
      Height = 235
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel8: TUniPanel
        Left = 1
        Top = 29
        Width = 399
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = ''
        object NavInvTransDetail: TUniDBNavigator
          Left = 198
          Top = 1
          Width = 200
          Height = 26
          Hint = ''
          DataSource = SrcInvTransDetail
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object gridDetails: TIQUniGridControl
        Left = 1
        Top = 57
        Width = 399
        Height = 177
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 182
        IQComponents.Grid.Height = 91
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcInvTransDetail
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
        IQComponents.Navigator.DataSource = SrcInvTransDetail
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 182
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 91
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcInvTransDetail
        Columns = <
          item
            FieldName = 'SOURCE_NAME'
            Title.Caption = 'Origin'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SOURCE_DESCRIP'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QTY'
            Title.Caption = 'Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LOTNO'
            Title.Caption = 'Lot #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object Panel13: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 399
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = '  Transaction Origin'
        Color = clWindow
      end
    end
    object Panel2: TUniPanel
      Left = 406
      Top = 1
      Width = 511
      Height = 235
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel5: TUniPanel
        Left = 1
        Top = 1
        Width = 509
        Height = 233
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Panel4: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 507
          Height = 28
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = '  Rule Sequences && Locations'
          Color = clWindow
        end
        object pgctrlPlanLoc: TUniPageControl
          Left = 1
          Top = 29
          Width = 507
          Height = 203
          Hint = ''
          ActivePage = TabSheet1
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          object TabSheet1: TUniTabSheet
            Hint = ''
            Caption = 'Master Locations'
            object Panel9: TUniPanel
              Left = 0
              Top = 0
              Width = 499
              Height = 28
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Alignment = taLeftJustify
              Caption = ''
              object NavInvPlanLocations: TUniDBNavigator
                Left = 382
                Top = 1
                Width = 116
                Height = 26
                Hint = ''
                DataSource = SrcInvTransLoc
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 0
              end
            end
            object gridLoc: TIQUniGridControl
              Left = 0
              Top = 28
              Width = 499
              Height = 147
              Layout = 'border'
              ParentAlignmentControl = False
              AlignmentControl = uniAlignmentClient
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              IQComponents.Grid.Left = 0
              IQComponents.Grid.Top = 29
              IQComponents.Grid.Width = 282
              IQComponents.Grid.Height = 61
              IQComponents.Grid.Hint = ''
              IQComponents.Grid.DataSource = SrcInvTransLoc
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
              IQComponents.Navigator.DataSource = SrcInvTransLoc
              IQComponents.Navigator.LayoutConfig.Region = 'east'
              IQComponents.Navigator.TabOrder = 3
              IQComponents.HiddenPanel.Left = 282
              IQComponents.HiddenPanel.Top = 29
              IQComponents.HiddenPanel.Width = 209
              IQComponents.HiddenPanel.Height = 61
              IQComponents.HiddenPanel.Hint = ''
              IQComponents.HiddenPanel.Visible = True
              IQComponents.HiddenPanel.Align = alRight
              IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
              IQComponents.FormTab.Hint = ''
              IQComponents.FormTab.ImageIndex = 1
              IQComponents.FormTab.Caption = 'Form'
              IQComponents.FormTab.Layout = 'border'
              DataSource = SrcInvTransLoc
              Columns = <
                item
                  FieldName = 'TransRuleDetailSeq'
                  Title.Caption = 'Rule ~Seq #'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'LOCATIONS_ID'
                  Title.Caption = 'ID'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'LocDesc'
                  Title.Caption = 'Description'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'QTY'
                  Title.Caption = 'Qty'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'UNITS'
                  Title.Caption = 'Pk Units'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'CAPACITY'
                  Title.Caption = 'Unit ~Capacity'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end>
              Marker = 0
            end
          end
        end
      end
    end
  end
  object pnlPlan: TUniPanel
    Left = 0
    Top = 28
    Width = 918
    Height = 61
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    object diPlan: TwwDataInspector
      Left = 1
      Top = 1
      Width = 916
      Height = 59
      DisableThemes = False
      Align = alClient
      TabOrder = 0
      DataSource = SrcInvTransPlan
      Items = <
        item
          DataSource = SrcInvTransPlan
          DataField = 'ID'
          Caption = 'Plan ID'
          WordWrap = False
        end
        item
          DataSource = SrcInvTransPlan
          DataField = 'SOURCE_MODULE'
          Caption = 'Source Module'
          Items = <
            item
              DataSource = SrcInvTransPlan
              DataField = 'KIND'
              Caption = 'Kind'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcInvTransPlan
          DataField = 'LAST_UPDATE'
          Caption = 'Last Update'
          WordWrap = False
        end>
      DefaultRowHeight = 19
      CaptionWidth = 100
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      CaptionIndent = 18
    end
  end
  object wwDBComboBoxPlanSrcModule: TUniDBComboBox
    Left = 106
    Top = 50
    Width = 179
    Height = 19
    Hint = ''
    Visible = False
    DataField = 'SOURCE_MODULE'
    DataSource = SrcInvTransPlan
    TabStop = False
    TabOrder = 4
    ReadOnly = True
  end
  object MainMenu1: TUniMainMenu
    Left = 304
    Top = 32
    object File1: TUniMenuItem
      Caption = 'File'
      object InventoryTransactionRules1: TUniMenuItem
        Caption = 'Inventory Transaction Rules'
        OnClick = InventoryTransactionRules1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object QryInvTransPlan: TFDQuery
    BeforeOpen = QryInvTransPlanBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       source_module,'
      '       source,'
      '       source_id,'
      '       kind,'
      '       last_update'
      '  from inv_trans_plan'
      ' where id = :id')
    Left = 16
    Top = 184
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryInvTransPlanID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.INV_TRANS_PLAN.ID'
      Size = 0
    end
    object QryInvTransPlanSOURCE_MODULE: TStringField
      FieldName = 'SOURCE_MODULE'
      Origin = 'IQ.INV_TRANS_PLAN.SOURCE_MODULE'
    end
    object QryInvTransPlanSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'IQ.INV_TRANS_PLAN.SOURCE'
      Size = 30
    end
    object QryInvTransPlanSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.INV_TRANS_PLAN.SOURCE_ID'
      Size = 0
    end
    object QryInvTransPlanKIND: TStringField
      FieldName = 'KIND'
      Origin = 'IQ.INV_TRANS_PLAN.KIND'
      Size = 10
    end
    object QryInvTransPlanLAST_UPDATE: TDateTimeField
      FieldName = 'LAST_UPDATE'
      Origin = 'IQ.INV_TRANS_PLAN.LAST_UPDATE'
    end
  end
  object QryInvTransItem: TFDQuery
    OnCalcFields = QryInvTransItemCalcFields
    CachedUpdates = True
    MasterSource = SrcInvTransPlan
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select i.id,'
      '       i.inv_trans_plan_id,'
      '       i.arinvt_id,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.rev,'
      '       a.class,'
      '       a.descrip2,'
      '       i.qty,'
      '       i.pk_unit_type,'
      '       case i.pk_unit_type'
      '         when '#39'E'#39' then '#39'Loose'#39
      '         when '#39'C'#39' then '#39'Case'#39
      '         when '#39'P'#39' then '#39'Pallet'#39
      '       end as pk_unit_type_disp,'
      '       i.inv_move_class_id,'
      '       i.inv_trans_rule_id,'
      '       i.division_id,'
      '       i.note1,'
      '       i.units,'
      '       m.descrip as move_class_descrip,'
      '       i.ptsper,'
      '       case nvl(i.pk_unit_type, '#39'*'#39')'
      '         when '#39'E'#39' then a.loose_volume'
      '         when '#39'P'#39' then a.pallet_volume'
      '         else a.volume'
      '       end as volume,'
      '       ag.code as arinvt_group_name,'
      '       wg.code as wms_group_code'
      '       '
      '  from inv_trans_item i,       '
      '       arinvt a,'
      '       inv_move_class m,'
      '       arinvt_group ag,'
      '       wms_inv_group wg'
      ' where '
      '       i.inv_trans_plan_id = :id'
      '   and i.arinvt_id = a.id'
      '   and i.inv_move_class_id = m.id(+)'
      ''
      '   and a.arinvt_group_id = ag.id(+)'
      '   and a.wms_inv_group_id = wg.id(+)'
      ' order by id')
    Left = 60
    Top = 184
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryInvTransItemITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 23
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryInvTransItemQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 12
      FieldName = 'QTY'
      Origin = 'IQ.INV_TRANS_ITEM.QTY'
      Size = 6
    end
    object QryInvTransItemPK_UNIT_TYPE: TStringField
      DisplayLabel = 'Unit Type'
      DisplayWidth = 9
      FieldName = 'PK_UNIT_TYPE'
      Origin = 'IQ.INV_TRANS_ITEM.PK_UNIT_TYPE'
      Size = 1
    end
    object QryInvTransItemDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
    end
    object QryInvTransItemREV: TStringField
      DisplayLabel = 'Item Rev '
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object QryInvTransItemCLASS: TStringField
      DisplayLabel = 'Item Class'
      DisplayWidth = 8
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryInvTransItemDESCRIP2: TStringField
      DisplayLabel = 'Item Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
    object QryInvTransItemNOTE1: TStringField
      DisplayLabel = 'Note'
      DisplayWidth = 46
      FieldName = 'NOTE1'
      Origin = 'IQ.INV_TRANS_ITEM.NOTE1'
      Size = 255
    end
    object QryInvTransItemDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Origin = 'IQ.INV_TRANS_ITEM.DIVISION_ID'
      Visible = False
      Size = 0
    end
    object QryInvTransItemID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.INV_TRANS_ITEM.ID'
      Visible = False
      Size = 0
    end
    object QryInvTransItemINV_TRANS_PLAN_ID: TBCDField
      FieldName = 'INV_TRANS_PLAN_ID'
      Origin = 'IQ.INV_TRANS_ITEM.INV_TRANS_PLAN_ID'
      Visible = False
      Size = 0
    end
    object QryInvTransItemARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.INV_TRANS_ITEM.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryInvTransItemINV_MOVE_CLASS_ID: TBCDField
      FieldName = 'INV_MOVE_CLASS_ID'
      Origin = 'IQ.INV_TRANS_ITEM.INV_MOVE_CLASS_ID'
      Visible = False
      Size = 0
    end
    object QryInvTransItemINV_TRANS_RULE_ID: TBCDField
      FieldName = 'INV_TRANS_RULE_ID'
      Origin = 'IQ.INV_TRANS_ITEM.INV_TRANS_RULE_ID'
      Visible = False
      Size = 0
    end
    object QryInvTransItemDivisionName: TStringField
      FieldKind = fkCalculated
      FieldName = 'DivisionName'
      Visible = False
      Size = 25
      Calculated = True
    end
    object QryInvTransItemTransRule: TStringField
      FieldKind = fkCalculated
      FieldName = 'TransRule'
      Visible = False
      Size = 10
      Calculated = True
    end
    object QryInvTransItemUNITS: TBCDField
      DisplayLabel = 'Units'
      FieldName = 'UNITS'
      Origin = 'IQ.INV_TRANS_ITEM.UNITS'
      Size = 2
    end
    object QryInvTransItemPK_UNIT_TYPE_DISP: TStringField
      FieldName = 'PK_UNIT_TYPE_DISP'
      Size = 6
    end
    object QryInvTransItemMOVE_CLASS_DESCRIP: TStringField
      FieldName = 'MOVE_CLASS_DESCRIP'
      Visible = False
    end
    object QryInvTransItemPTSPER: TFMTBCDField
      FieldName = 'PTSPER'
      Size = 6
    end
    object QryInvTransItemVOLUME: TFMTBCDField
      FieldName = 'VOLUME'
      Visible = False
      Size = 38
    end
    object QryInvTransItemARINVT_GROUP_NAME: TStringField
      FieldName = 'ARINVT_GROUP_NAME'
      Visible = False
      Size = 25
    end
    object QryInvTransItemWMS_GROUP_CODE: TStringField
      FieldName = 'WMS_GROUP_CODE'
      Visible = False
      Size = 25
    end
  end
  object QryInvTransDetail: TFDQuery
    AfterPost = AppyUpdate
    AfterDelete = AppyUpdate
    CachedUpdates = True
    MasterSource = SrcInvTransItem
    MasterFields = 'ID'
    OnUpdateRecord = QryInvTransDetailUpdateRecord
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select d.id,'
      '       d.inv_trans_item_id,'
      '       d.qty,'
      
        '       substrB(iqeval.substrW63Max( inv_trans_misc.get_source_na' +
        'me( d.source, d.source_id ),   1, 255), 1, 255) as source_name,'
      
        '       substrB(iqeval.substrW63Max( inv_trans_misc.get_source_de' +
        'scrip( d.source, d.source_id), 1, 255), 1, 255) as source_descri' +
        'p,'
      '       d.source,'
      '       d.source_id,'
      '       d.lotno'
      '  from inv_trans_detail d'
      ' where '
      '       d.inv_trans_item_id = :id'
      ' order by '
      '       source_id')
    Left = 140
    Top = 184
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryInvTransDetailSOURCE: TStringField
      DisplayWidth = 30
      FieldName = 'SOURCE'
      Origin = 'IQ.INV_TRANS_DETAIL.SOURCE'
      Size = 30
    end
    object QryInvTransDetailSOURCE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.INV_TRANS_DETAIL.SOURCE_ID'
      Size = 0
    end
    object QryInvTransDetailLOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 15
      FieldName = 'LOTNO'
      Origin = 'IQ.INV_TRANS_DETAIL.LOTNO'
      Size = 25
    end
    object QryInvTransDetailID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.INV_TRANS_DETAIL.ID'
      Visible = False
      Size = 0
    end
    object QryInvTransDetailINV_TRANS_ITEM_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'INV_TRANS_ITEM_ID'
      Origin = 'IQ.INV_TRANS_DETAIL.INV_TRANS_ITEM_ID'
      Visible = False
      Size = 0
    end
    object QryInvTransDetailSOURCE_NAME: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 30
      FieldName = 'SOURCE_NAME'
      Size = 255
    end
    object QryInvTransDetailSOURCE_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'SOURCE_DESCRIP'
      Size = 255
    end
    object QryInvTransDetailQTY: TFMTBCDField
      FieldName = 'QTY'
      Size = 6
    end
  end
  object QryInvTransLoc: TFDQuery
    OnCalcFields = QryInvTransLocCalcFields
    MasterSource = SrcInvTransDetail
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       inv_trans_item_id,'
      '       inv_trans_detail_id,'
      '       locations_id,'
      '       inv_trans_rule_detail_id,'
      '       qty,'
      '       units,'
      '       capacity'
      '  from inv_trans_locations'
      ' where inv_trans_detail_id = :id'
      ' ')
    Left = 176
    Top = 184
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryInvTransLocLocDesc: TStringField
      DisplayLabel = 'Master Location'
      DisplayWidth = 27
      FieldKind = fkCalculated
      FieldName = 'LocDesc'
      Size = 30
      Calculated = True
    end
    object QryInvTransLocLOCATIONS_ID: TBCDField
      DisplayLabel = 'Master Location ~ID'
      DisplayWidth = 13
      FieldName = 'LOCATIONS_ID'
      Origin = 'IQ.INV_TRANS_LOCATIONS.LOCATIONS_ID'
      Size = 0
    end
    object QryInvTransLocID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.INV_TRANS_LOCATIONS.ID'
      Visible = False
      Size = 0
    end
    object QryInvTransLocINV_TRANS_ITEM_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'INV_TRANS_ITEM_ID'
      Origin = 'IQ.INV_TRANS_LOCATIONS.INV_TRANS_ITEM_ID'
      Visible = False
      Size = 0
    end
    object QryInvTransLocINV_TRANS_RULE_DETAIL_ID: TBCDField
      FieldName = 'INV_TRANS_RULE_DETAIL_ID'
      Origin = 'IQ.INV_TRANS_LOCATIONS.INV_TRANS_RULE_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryInvTransLocTransRuleDetailSeq: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TransRuleDetailSeq'
      Calculated = True
    end
    object QryInvTransLocUNITS: TBCDField
      DisplayLabel = 'Units'
      FieldName = 'UNITS'
      Origin = 'IQ.INV_TRANS_LOCATIONS.UNITS'
      Size = 2
    end
    object QryInvTransLocCAPACITY: TBCDField
      DisplayLabel = 'Capacity'
      FieldName = 'CAPACITY'
      Origin = 'IQ.INV_TRANS_LOCATIONS.CAPACITY'
      Size = 0
    end
    object QryInvTransLocINV_TRANS_DETAIL_ID: TBCDField
      FieldName = 'INV_TRANS_DETAIL_ID'
      Origin = 'IQ.INV_TRANS_LOCATIONS.INV_TRANS_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryInvTransLocQTY: TFMTBCDField
      FieldName = 'QTY'
      Origin = 'IQ.INV_TRANS_LOCATIONS.QTY'
      Size = 6
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmInvTransPlanBase'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196090 $'
    BuildVersion = '176554'
    Left = 336
    Top = 32
  end
  object SrcInvTransPlan: TDataSource
    DataSet = QryInvTransPlan
    Left = 16
    Top = 212
  end
  object SrcInvTransItem: TDataSource
    DataSet = QryInvTransItem
    Left = 60
    Top = 212
  end
  object SrcInvTransDetail: TDataSource
    DataSet = QryInvTransDetail
    Left = 140
    Top = 212
  end
  object SrcInvTransLoc: TDataSource
    DataSet = QryInvTransLoc
    Left = 176
    Top = 212
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'InventoryTransactionRules1'
      'BOLDataMovementClass1')
    SecurityCode = 'FRMINVTRANSPLANBASE'
    Left = 368
    Top = 32
  end
  object popmPlanItem: TUniPopupMenu
    Left = 424
    Top = 188
    object JumpToInventory1: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumpToInventory1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcInvTransItem
    JumpTo = jtInventory
    Left = 456
    Top = 188
  end
  object popmItemDetails: TUniPopupMenu
    Left = 712
    Top = 244
    object BOLDataMovementClass1: TUniMenuItem
      Caption = 'BOL Data / Movement Class'
      OnClick = BOLDataMovementClass1Click
    end
  end
  object popmMasterLocation: TUniPopupMenu
    Left = 488
    Top = 456
    object JumptoInventoryByLocation1: TUniMenuItem
      Caption = 'Jump to Inventory By Location'
      OnClick = JumptoInventoryByLocation1Click
    end
    object JumptoInventoryRuleSet1: TUniMenuItem
      Caption = 'Jump to Inventory Rule Set'
      OnClick = JumptoInventoryRuleSet1Click
    end
    object JumptoLocation1: TUniMenuItem
      Caption = 'Jump to Location'
      OnClick = JumptoLocation1Click
    end
  end
end
