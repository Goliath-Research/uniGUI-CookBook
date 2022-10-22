object FrmPmSelectTask: TFrmPmSelectTask
  Left = 281
  Top = 138
  HelpContext = 1000572
  ClientHeight = 552
  ClientWidth = 1165
  Caption = 'Equipment And Tasks'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 176
    Width = 1165
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitWidth = 584
  end
  object PnlEquipmentGrid: TUniPanel
    Left = 0
    Top = 47
    Width = 1165
    Height = 129
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 584
    object GridHeader: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 1163
      Height = 127
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 946
      IQComponents.Grid.Height = 41
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcEquipment
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
      IQComponents.Navigator.DataSource = SrcEquipment
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 946
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 41
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitLeft = 365
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitWidth = 574
      DataSource = SrcEquipment
      Columns = <
        item
          FieldName = 'EQNO'
          Title.Caption = 'Equipment #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MODEL'
          Title.Caption = 'Model'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SERIALNO'
          Title.Caption = 'Serial #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INST_DATE'
          Title.Caption = 'Installation Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TOTAL_UNITS'
          Title.Caption = 'Total Units'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UOM'
          Title.Caption = 'UOM'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOCATION'
          Title.Caption = 'Location'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMPANY'
          Title.Caption = 'Owner'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_NAME'
          Title.Caption = 'EPlant'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitWidth = 582
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 179
    Width = 1165
    Height = 332
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 584
    ExplicitHeight = 222
    object Bevel1: TUniPanel
      Left = 1
      Top = 47
      Width = 1163
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
      ExplicitWidth = 582
    end
    object Panel8: TUniPanel
      Left = 1
      Top = 50
      Width = 1163
      Height = 282
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitWidth = 582
      ExplicitHeight = 172
      object GridDetail: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 1161
        Height = 280
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 944
        IQComponents.Grid.Height = 194
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcTasks
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
        IQComponents.Navigator.DataSource = SrcTasks
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 944
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 194
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.HiddenPanel.ExplicitLeft = 363
        IQComponents.HiddenPanel.ExplicitHeight = 84
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        IQComponents.FormTab.ExplicitWidth = 572
        IQComponents.FormTab.ExplicitHeight = 113
        DataSource = SrcTasks
        Columns = <
          item
            FieldName = 'TASKNO'
            Title.Caption = 'Task #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Task Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PERFORM_EVERY'
            Title.Caption = 'Perform Every'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'HOURS4TSK'
            Title.Caption = 'Hours for Task'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TOTAL_UNITS'
            Title.Caption = 'Total Units'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'UOM'
            Title.Caption = 'UOM'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Status'
            Title.Caption = 'Status'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANT_NAME'
            Title.Caption = 'EPlant'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANT_ID'
            Title.Caption = 'EPlant ID'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'INCOMPLETE'
            Title.Caption = 'Incomplete?'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'WO_OPEN'
            Title.Caption = 'WO Open?'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        ExplicitWidth = 580
        ExplicitHeight = 170
        Marker = 0
      end
    end
    object PnlToolbar: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 1163
      Height = 47
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 582
      object PnlToolbarCaption: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 1161
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        ExplicitWidth = 580
        object lblCaptionLabel: TUniLabel
          Left = 1
          Top = 1
          Width = 56
          Height = 13
          Hint = ''
          Caption = 'Job Tasks'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object lblDash: TUniLabel
          Left = 56
          Top = 1
          Width = 10
          Height = 13
          Hint = ''
          Caption = ' - '
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 2
        end
        object DBText1: TUniDBText
          Left = 66
          Top = 1
          Width = 41
          Height = 13
          Hint = ''
          DataField = 'EQNO'
          DataSource = SrcEquipment
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
        end
      end
      object PnlToolbarInner: TUniPanel
        Tag = 1999
        Left = 1
        Top = 20
        Width = 1161
        Height = 27
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitWidth = 580
        object sbtnApplyTask: TUniSpeedButton
          Left = 129
          Top = 1
          Width = 25
          Height = 23
          Hint = 'Apply Task to Work Order'
          Visible = False
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD0000000
            000DDDDD0FFFFFFFFFF0DDDD0FFFB8FFFFF0DDDD0FF848BFFFF0DDDD0FB4448B
            FFF0DDDD0F44F448FFF0DDDD0FFFFF478FF0DDDD0FFFFFF48BF0DDDD0FFFFFFF
            48F0DDDD0FFFFFFFF4F00DDD0FFFFFFFFFF000DD0FF000000FF0000DD000F888
            000D000DDDDD0000DDDD00DDDDDDDDDDDDDD0DDDDDDDDDDDDDDD}
          Caption = ''
          ParentColor = False
          Color = clWindow
        end
        object sbtnFilterMisc: TUniSpeedButton
          Left = 1
          Top = 1
          Width = 25
          Height = 23
          Hint = 'Hide miscellaneous tasks'
          ShowHint = True
          ParentShowHint = False
          GroupIndex = 2
          AllowAllUp = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            1800000000000006000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            D08050D08050D08050D08050FF00FFD08060D08860D08860D08860FF00FFD088
            60D08860D08860D08860FF00FFFF00FF808080808080808080808080FF00FF83
            8383888888888888888888FF00FF888888888888888888888888FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            000000000000000000000000FF00FF000000000000000000000000FF00FF0000
            00000000000000000000FF00FFFF00FF000000000000000000000000FF00FF00
            0000000000000000000000FF00FF000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            D08050D08050D08050D08050FF00FFD08060D08060D08860D08860FF00FFD088
            60D08860D08860D08860FF00FFFF00FF808080808080808080808080FF00FF83
            8383838383888888888888FF00FF888888888888888888888888FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF707070404040000800FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070404040050505FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF707070505050100810FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070705050500B0B0BFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF707070707070404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070404040FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF707070909890504850E3CCB8FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070709696964A4A4ACA
            CACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFD3C8B9909090D0C8C0505850BAA69CFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C6909090C7C7C7555555A6
            A6A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            DACBBF808880F0F0F0E0D8D0909890404840D0BCACFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA868686F0F0F0D7D7D796969646
            4646BABABAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE5D3C9
            707070F0E8F0FFF8FFF0E8E0D0D0D0707070404840D9C1AEFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFD3D3D3707070EBEBEBFAFAFAE7E7E7D0D0D070
            7070464646BFBFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFCFC7707070
            C0C8C0FFFFFFF0F8F0F0F0F0D0D8D0B0A8B0606060404840CDB5A2FF00FFFF00
            FFFF00FFFF00FFFF00FFCFCFCF707070C6C6C6FFFFFFF6F6F6F0F0F0D6D6D6AB
            ABAB606060464646B4B4B4FF00FFFF00FFFF00FFFF00FFFF00FFC0B8C0C0C0C0
            D0C8D0C0C0C0B0B8B0B0B0B0B0B0B0A0A0A0808080606060404840FF00FFFF00
            FFFF00FFFF00FFFF00FFBBBBBBC0C0C0CBCBCBC0C0C0B6B6B6B0B0B0B0B0B0A0
            A0A0808080606060464646FF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbtnFilterMiscClick
        end
        object Panel7: TUniPanel
          Left = 1081
          Top = 1
          Width = 80
          Height = 25
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          ExplicitLeft = 375
          object shpOpen: TUniPanel
            Left = 1
            Top = 7
            Width = 10
            Height = 11
            Hint = 'Task is Open on a Work Order'
            TabOrder = 1
            Caption = ''
          end
          object shpClosed: TUniPanel
            Left = 14
            Top = 7
            Width = 10
            Height = 11
            Hint = 'Task is Closed on a Work Order'
            TabOrder = 2
            Caption = ''
          end
          object shpUnassigned: TUniPanel
            Left = 40
            Top = 7
            Width = 10
            Height = 11
            Hint = 'Task is not assigned to a Work Order'
            TabOrder = 3
            Caption = ''
          end
          object shpIncomplete: TUniPanel
            Left = 27
            Top = 7
            Width = 10
            Height = 11
            Hint = 'Task is Closed, but Incomplete'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 4
            Caption = ''
          end
        end
      end
    end
  end
  object Panel5: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 1165
    Height = 47
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    ExplicitWidth = 584
    object Panel6: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 1163
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      Color = clBtnShadow
      ExplicitWidth = 582
      object lblEquipment: TUniLabel
        Left = 1
        Top = 1
        Width = 60
        Height = 13
        Hint = ''
        Caption = 'Equipment'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object Panel9: TUniPanel
      Tag = 1999
      Left = 1
      Top = 20
      Width = 1163
      Height = 27
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 582
      object SBSearch: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 23
        Hint = 'Search...'
        Visible = False
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
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
          90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
          40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
          00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
          90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
          F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
          A068509050308048308048208038108F4C26B08870A068509058309048308040
          20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
          4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
          FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
          50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
          B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
          F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
          50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
          57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
          C09880B08060A068509050309058409D6842B07860B08870A070508048308048
          20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
          67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
          C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
          20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
          00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
          CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
          37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
          00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
          00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
          00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = SBSearchClick
      end
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 511
    Width = 1165
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    ExplicitTop = 401
    ExplicitWidth = 584
    object PnlModalButtons: TUniPanel
      Tag = 1999
      Left = 956
      Top = 1
      Width = 209
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 375
      object btnOk: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
    object btnApply: TUniButton
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Hint = 'Apply Task to Work Order'
      ShowHint = True
      ParentShowHint = False
      Caption = 'Apply'
      TabOrder = 2
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 168
    object File1: TUniMenuItem
      Caption = '&File'
      object Search1: TUniMenuItem
        Caption = 'Search'
        Visible = False
        OnClick = SBSearchClick
      end
      object N2: TUniMenuItem
        Caption = '-'
        Visible = False
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
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
  object PkEquip: TIQWebHpick
    BeforeOpen = DoEquipmentBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '     p.id, '
      '     p.eqno, '
      '     p.class, '
      '     p.descrip,'
      '     p.model,'
      '     p.serialno,'
      '     p.inst_date,'
      '     p.total_units,'
      '     p.uom,'
      '     p.location,'
      '     a.company,'
      '     p.eplant_id,'
      '     e.name as eplant_name'
      'from'
      '     pmeqmt p,'
      '     arcusto a,'
      '     eplant e'
      'where'
      '     p.arcusto_id = a.id(+)'
      '     and e.id(+) = p.eplant_id'
      
        '     and (p.arcusto_id = :ARCUSTO_ID and :BY_ARCUSTO_ID = 1 or :' +
        'BY_ARCUSTO_ID = 0)'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 319
    Top = 1
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'BY_ARCUSTO_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object PKEquipID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkEquipEQNO: TStringField
      DisplayLabel = 'Equipment #'
      DisplayWidth = 10
      FieldName = 'EQNO'
      Size = 25
    end
    object PKEquipCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PKEquipDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PKEquipMODEL: TStringField
      DisplayLabel = 'Model'
      FieldName = 'MODEL'
      Size = 25
    end
    object PKEquipSERIALNO: TStringField
      DisplayLabel = 'Serial#'
      FieldName = 'SERIALNO'
      Size = 25
    end
    object PkEquipLOCATION: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 10
      FieldName = 'LOCATION'
      Size = 30
    end
    object PKEquipINST_DATE: TDateTimeField
      DisplayLabel = 'Inst. Date'
      FieldName = 'INST_DATE'
    end
    object PKEquipTOTAL_UNITS: TBCDField
      DisplayLabel = 'Total Units'
      FieldName = 'TOTAL_UNITS'
      Size = 0
    end
    object PkEquipUOM: TStringField
      FieldName = 'UOM'
      Size = 10
    end
    object PKEquipCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkEquipEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object PkEquipEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'MRO Add From Equipment Tasks'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192939 $'
    BuildVersion = '176554'
    Left = 263
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'GridHeader'
      'GridDetail')
    SecurityCode = 'FRMPMVIEW'
    Left = 231
  end
  object SrcEquipment: TDataSource
    DataSet = QryEquipment
    Left = 85
    Top = 1
  end
  object QryEquipment: TFDQuery
    BeforeOpen = DoEquipmentBeforeOpen
    OnCalcFields = QryEquipmentCalcFields
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT p.id AS id, '
      '       p.eqno AS eqno, '
      '       p.class AS class, '
      '       p.descrip AS descrip,'
      '       p.model AS model, '
      '       p.serialno AS serialno, '
      '       p.inst_date AS inst_date,'
      '       p.total_units AS total_units, '
      '       p.uom AS uom, '
      '       p.location AS location,'
      '       a.company AS company, '
      '       p.eplant_id AS eplant_id, '
      '       e.name AS eplant_name'
      'FROM pmeqmt p, arcusto a, eplant e'
      'WHERE p.arcusto_id = a.id(+) AND'
      '      e.id(+) = p.eplant_id AND'
      '      NVL(p.pk_hide, '#39'N'#39') <> '#39'Y'#39' AND'
      '      misc.eplant_filter(p.eplant_id) = 1 AND'
      '      (:BY_ARCUSTO_ID = 0 OR'
      '       :BY_ARCUSTO_ID = 1 AND p.arcusto_id = :ARCUSTO_ID) AND'
      '      (:BY_CLASS = 0 OR'
      '       :BY_CLASS = 1 AND p.class = :CLASS)')
    Left = 93
    Top = 6
    ParamData = <
      item
        Name = 'BY_ARCUSTO_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'BY_CLASS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CLASS'
        DataType = ftFixedChar
        ParamType = ptInput
      end>
    object QryEquipmentEQNO: TStringField
      DisplayLabel = 'Equipment #'
      DisplayWidth = 14
      FieldName = 'EQNO'
      Origin = 'p.eqno'
      Size = 25
    end
    object QryEquipmentCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      Origin = 'p.class'
      Size = 2
    end
    object QryEquipmentDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'p.descrip'
      Size = 50
    end
    object QryEquipmentMODEL: TStringField
      DisplayLabel = 'Model'
      DisplayWidth = 10
      FieldName = 'MODEL'
      Origin = 'p.model'
      Size = 25
    end
    object QryEquipmentSERIALNO: TStringField
      DisplayLabel = 'Serial #'
      DisplayWidth = 10
      FieldName = 'SERIALNO'
      Origin = 'p.serialno'
      Size = 25
    end
    object QryEquipmentINST_DATE: TDateTimeField
      DisplayLabel = 'Installation Date'
      DisplayWidth = 12
      FieldName = 'INST_DATE'
      Origin = 'p.inst_date'
    end
    object QryEquipmentTOTAL_UNITS: TBCDField
      DisplayLabel = 'Total Units'
      DisplayWidth = 10
      FieldName = 'TOTAL_UNITS'
      Origin = 'p.total_units'
      Size = 0
    end
    object QryEquipmentUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Origin = 'p.uom'
      Size = 10
    end
    object QryEquipmentLOCATION: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 10
      FieldName = 'LOCATION'
      Size = 30
    end
    object QryEquipmentCOMPANY: TStringField
      DisplayLabel = 'Owner'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Origin = 'a.company'
      Size = 60
    end
    object QryEquipmentEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 7
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object QryEquipmentID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'p.id'
      Visible = False
      Size = 0
    end
    object QryEquipmentEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryEquipmentHIDE_MISC: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'HIDE_MISC'
      Visible = False
      Calculated = True
    end
  end
  object PSearch: TUniPopupMenu
    Left = 200
  end
  object SrcTasks: TDataSource
    DataSet = QryTasks
    OnDataChange = SrcTasksDataChange
    Left = 125
    Top = 2
  end
  object QryTasks: TFDQuery
    BeforeOpen = QryTasksBeforeOpen
    OnCalcFields = QryTasksCalcFields
    MasterSource = SrcEquipment
    MasterFields = 'ID;HIDE_MISC;HIDE_MISC'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT a.id AS id,'
      '       a.pmeqmt_id AS pmeqmt_id,'
      '       a.taskno AS taskno,'
      '       a.descrip AS descrip,'
      '       a.wo_open AS wo_open,'
      '       a.incomplete AS incomplete,'
      '       a.total_units AS total_units,'
      '       a.hours4tsk AS hours4tsk,'
      '       a.perform_every AS perform_every,'
      '       a.uom AS uom,'
      '       a.pmtasks_id AS pmtasks_id,'
      '       a.eplant_id AS eplant_id,'
      '       a.eplant_name AS eplant_name'
      '  FROM v_pmjob_list a'
      ' WHERE a.pmeqmt_id = :ID AND'
      '       (:HIDE_MISC = 0 OR'
      '        :HIDE_MISC = 1 AND NVL(a.pmtasks_id, 0) > 0) AND'
      '       (NVL(a.archived, '#39'N'#39') = '#39'N'#39') AND'
      '       misc.eplant_filter_include_nulls(a.eplant_id) = 1')
    Left = 131
    Top = 8
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'HIDE_MISC'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object QryTasksTASKNO: TStringField
      DisplayLabel = 'Task #'
      DisplayWidth = 25
      FieldName = 'TASKNO'
      Origin = 'a.taskno'
      Size = 50
    end
    object QryTasksDESCRIP: TStringField
      DisplayLabel = 'Task Description'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 250
    end
    object QryTasksPERFORM_EVERY: TBCDField
      DisplayLabel = 'Perform Every'
      DisplayWidth = 12
      FieldName = 'PERFORM_EVERY'
      Origin = 'a.perform_every'
      Size = 2
    end
    object QryTasksHOURS4TSK: TBCDField
      DisplayLabel = 'Hours for Task'
      DisplayWidth = 12
      FieldName = 'HOURS4TSK'
      Origin = 'a.hours4tsk'
      Size = 2
    end
    object QryTasksTOTAL_UNITS: TBCDField
      DisplayLabel = 'Total Units'
      DisplayWidth = 10
      FieldName = 'TOTAL_UNITS'
      Origin = 'a.total_units'
    end
    object QryTasksUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Origin = 'a.uom'
      Size = 10
    end
    object QryTasksStatus: TStringField
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'Status'
      Size = 50
      Calculated = True
    end
    object QryTasksEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 7
      FieldName = 'EPLANT_NAME'
      Origin = 'a.eplant_name'
      Size = 30
    end
    object QryTasksEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 18
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Size = 0
    end
    object QryTasksINCOMPLETE: TStringField
      DisplayLabel = 'Incomplete?'
      DisplayWidth = 18
      FieldName = 'INCOMPLETE'
      Origin = 'a.incomplete'
      Size = 1
    end
    object QryTasksWO_OPEN: TStringField
      DisplayLabel = 'WO Open?'
      DisplayWidth = 18
      FieldName = 'WO_OPEN'
      Origin = 'a.wo_open'
      Size = 1
    end
    object QryTasksID: TBCDField
      DisplayWidth = 18
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object QryTasksPMTASKS_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'PMTASKS_ID'
      Origin = 'a.pmtasks_id'
      Visible = False
      Size = 0
    end
  end
end
