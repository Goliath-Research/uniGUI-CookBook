object FrmStatAlloc: TFrmStatAlloc
  Left = 0
  Top = 0
  ClientHeight = 640
  ClientWidth = 920
  Caption = 'Statistical / Allocation Account Definition '
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 249
    Width = 920
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitTop = 201
    ExplicitWidth = 897
  end
  object Splitter2: TUniSplitter
    Left = 0
    Top = 433
    Width = 920
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitTop = 374
    ExplicitWidth = 897
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 249
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 918
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      ExplicitWidth = 895
      object SBGridView: TUniSpeedButton
        Left = 26
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Toggle Table/Form View'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000A0860100A08601000001000000000000000000001212
          1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
          0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
          0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
          6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
          9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
          B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
          C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
          FB00FFFFFF000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001D1D1D1D0505
          050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
          29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
          2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
          2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
          2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
          35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
          1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
          191919191919191919061E3838382120202020202020202020021E3939391A17
          1513110F0D0B090807061E393939211E050403030303030202021E393331392D
          2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
          39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
          2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
          39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
          1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
          19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
          1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = SBGridViewClick
      end
      object sbtnSearch1: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Search'
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
        OnClick = sbtnSearch1Click
      end
    end
    object PC: TUniPageControl
      Left = 1
      Top = 28
      Width = 918
      Height = 220
      Hint = ''
      ActivePage = TabGrid
      TabBarVisible = False
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      ExplicitWidth = 895
      ExplicitHeight = 172
      object TabForm: TUniTabSheet
        Hint = ''
        Caption = 'TabForm'
        ExplicitWidth = 887
        ExplicitHeight = 144
        DesignSize = (
          910
          192)
        object Label1: TUniLabel
          Left = 8
          Top = 14
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Description'
          TabOrder = 4
        end
        object Label2: TUniLabel
          Left = 9
          Top = 63
          Width = 118
          Height = 13
          Hint = ''
          Caption = 'Statistical Account Name'
          TabOrder = 5
        end
        object Label3: TUniLabel
          Left = 8
          Top = 92
          Width = 129
          Height = 13
          Hint = ''
          Caption = 'Procedure/Function to Run'
          TabOrder = 6
        end
        object DBDescrip: TUniDBEdit
          Left = 157
          Top = 11
          Width = 751
          Height = 21
          Hint = ''
          DataField = 'DESCRIP'
          DataSource = SrcHdr
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitWidth = 728
        end
        object DBCheckBox1: TUniDBCheckBox
          Tag = 1999
          Left = 8
          Top = 38
          Width = 162
          Height = 17
          Hint = ''
          DataField = 'STAT_ACCOUNT'
          DataSource = SrcHdr
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Statistical Account'
          TabOrder = 1
        end
        object DBEdit1: TUniDBEdit
          Left = 158
          Top = 60
          Width = 751
          Height = 21
          Hint = ''
          DataField = 'STAT_DESCRIP'
          DataSource = SrcHdr
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ExplicitWidth = 728
        end
        object wwDBProcToRunForm: TUniEdit
          Left = 157
          Top = 88
          Width = 751
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          ExplicitWidth = 728
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'TabGrid'
        ExplicitWidth = 887
        ExplicitHeight = 144
        object GridHdr: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 910
          Height = 192
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 693
          IQComponents.Grid.Height = 106
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcHdr
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
          IQComponents.Navigator.DataSource = SrcHdr
          IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.Navigator.BeforeAction = NavHdrBeforeAction
          IQComponents.HiddenPanel.Left = 693
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 106
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.HiddenPanel.ExplicitLeft = 670
          IQComponents.HiddenPanel.ExplicitHeight = 58
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          IQComponents.FormTab.ExplicitWidth = 879
          IQComponents.FormTab.ExplicitHeight = 87
          DataSource = SrcHdr
          Columns = <
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 229
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STAT_ACCOUNT'
              Title.Caption = 'Statistical Account'
              Width = 102
              CheckBoxField.FieldValues = 'Y;N'
            end
            item
              FieldName = 'STAT_DESCRIP'
              Title.Caption = 'Statistical Account Name'
              Width = 248
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PROCEDURE_TO_RUN'
              Title.Caption = 'Procedure to Run'
              Width = 158
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          ExplicitTop = -1
          Marker = 0
        end
        object wwDBProcToRun: TUniEdit
          Left = 513
          Top = 55
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 1
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 252
    Width = 920
    Height = 181
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 918
      Height = 179
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 701
      IQComponents.Grid.Height = 93
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcDtl
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
      IQComponents.Navigator.DataSource = SrcDtl
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.Navigator.BeforeAction = NavDtlBeforeAction
      IQComponents.HiddenPanel.Left = 701
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 93
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitLeft = 678
      IQComponents.HiddenPanel.ExplicitHeight = 82
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitWidth = 887
      IQComponents.FormTab.ExplicitHeight = 111
      DataSource = SrcDtl
      Columns = <
        item
          FieldName = 'GLACCT_SEGMENT'
          Title.Caption = 'Segment'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SEGMENT_VALUE_FROM'
          Title.Caption = 'From Value'
          Width = 109
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SEGMENT_VALUE_TO'
          Title.Caption = 'To Value'
          Width = 97
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'USE_RANGE'
          Title.Caption = 'Use From-To Range'
          Width = 107
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'BALANCE_TYPE'
          Title.Caption = 'Balance Type'
          Width = 78
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SEGMENT_TYPE'
          Title.Caption = 'Segment Type'
          Width = 88
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'GLACCT_DIST'
          Title.Caption = 'Distribution GL Acct'
          Width = 104
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CONSTANT_VALUE'
          Title.Caption = 'Constant'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      ExplicitWidth = 895
      ExplicitHeight = 168
      Marker = 0
    end
    object wwDBGlAcct: TUniEdit
      Left = 162
      Top = 48
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object wwDBSegment: TUniEdit
      Left = 26
      Top = 48
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 3
    end
    object wwDBSegmentFrom: TUniEdit
      Left = 153
      Top = 75
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 4
    end
    object wwDBSegmentTo: TUniEdit
      Left = 26
      Top = 75
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 5
    end
  end
  object Panel5: TUniPanel
    Left = 0
    Top = 436
    Width = 920
    Height = 204
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitTop = 377
    ExplicitWidth = 897
    ExplicitHeight = 168
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 918
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = '  Individual Segment Values'
      ExplicitWidth = 895
    end
    object IQSearch2: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 918
      Height = 175
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 701
      IQComponents.Grid.Height = 89
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcSeg
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
      IQComponents.Navigator.DataSource = SrcSeg
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.Navigator.BeforeAction = NavSegBeforeAction
      IQComponents.HiddenPanel.Left = 701
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 89
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitLeft = 678
      IQComponents.HiddenPanel.ExplicitHeight = 53
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitWidth = 887
      IQComponents.FormTab.ExplicitHeight = 82
      DataSource = SrcSeg
      Columns = <
        item
          FieldName = 'SEGMENT_VALUE'
          Title.Caption = 'Value'
          Width = 350
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      ExplicitWidth = 895
      ExplicitHeight = 139
      Marker = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 88
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = 'New'
        Visible = False
        OnClick = New1Click
      end
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
  object SrcHdr: TDataSource
    DataSet = QryHdr
    Left = 216
    Top = 56
  end
  object QryHdr: TFDQuery
    BeforePost = QryHdrBeforePost
    AfterPost = QryHdrAfterPost
    AfterDelete = QryHdrAfterPost
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'S_ACCOUNT_HDR'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select ID,'
      '       DESCRIP,'
      '       stat_account,'
      '       stat_descrip,'
      '       procedure_to_run'
      '  from S_ACCOUNT_HDR'
      '')
    Left = 176
    Top = 56
    object QryHdrDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Required = True
      Size = 250
    end
    object QryHdrSTAT_ACCOUNT: TStringField
      DisplayLabel = 'Statistical Account'
      DisplayWidth = 1
      FieldName = 'STAT_ACCOUNT'
      Origin = 'STAT_ACCOUNT'
      Size = 1
    end
    object QryHdrSTAT_DESCRIP: TStringField
      DisplayLabel = 'Statistical Account Name'
      DisplayWidth = 50
      FieldName = 'STAT_DESCRIP'
      Origin = 'STAT_DESCRIP'
      Size = 50
    end
    object QryHdrPROCEDURE_TO_RUN: TStringField
      DisplayLabel = 'Procedure to Run'
      DisplayWidth = 30
      FieldName = 'PROCEDURE_TO_RUN'
      Origin = 'PROCEDURE_TO_RUN'
      Size = 30
    end
    object QryHdrID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into S_ACCOUNT_HDR'
      '  (ID, DESCRIP,'
      '   stat_account,'
      '   stat_descrip,'
      '   procedure_to_run'
      '  )'
      'values'
      '  (:ID, :DESCRIP,'
      '        :stat_account,'
      '        :stat_descrip,'
      '        :procedure_to_run'
      '  )')
    ModifySQL.Strings = (
      'update S_ACCOUNT_HDR'
      'set'
      '  ID = :ID,'
      '  DESCRIP = :DESCRIP,'
      '  stat_account     :stat_account,'
      '  stat_descrip     :stat_descrip,'
      '  procedure_to_run :procedure_to_run'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from S_ACCOUNT_HDR'
      'where'
      '  ID = :OLD_ID')
    Left = 160
  end
  object PkHdr: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select ID as ID,'
      '       DESCRIP as DESCRIP'
      ' from S_ACCOUNT_HDR')
    OnIQModify = PkHdrIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 212
    Top = 1
    object PkHdrID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.S_ACCOUNT_HDR.ID'
      Visible = False
      Size = 0
    end
    object PkHdrDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.S_ACCOUNT_HDR.DESCRIP'
      Size = 250
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Statistical / Allocation Account Definition '
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195931 $'
    BuildVersion = '176554'
    Left = 256
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMSTATALLOC'
    Left = 296
  end
  object QryDtl: TFDQuery
    BeforeInsert = QryDtlBeforeInsert
    BeforeEdit = QryDtlBeforeInsert
    BeforePost = QryDtlBeforePost
    AfterPost = QryDtlAfterPost
    AfterDelete = QryDtlAfterPost
    OnNewRecord = QryDtlNewRecord
    MasterSource = SrcHdr
    MasterFields = 'ID'
    DetailFields = 'ID'
    ConnectionName = 'IQFD'
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'S_ACCOUNT_DTL '
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL2
    SQL.Strings = (
      'select d.id,'
      '       d.s_account_hdr_id,'
      '       d.glacct_id_dist,'
      '       d.glacct_segment,'
      '       d.segment_value_from,'
      '       d.segment_value_to,'
      '       d.use_range,'
      '       d.balance_type,'
      '       d.segment_type,'
      '       d.CONSTANT_VALUE,'
      '       a.acct as glacct_dist'
      '  from S_ACCOUNT_DTL d,'
      '       glacct a'
      ' where d.S_ACCOUNT_HDR_ID = :ID'
      '   and d.glacct_id_dist = a.id(+)'
      '     ')
    Left = 96
    Top = 144
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 120000c
      end>
    object QryDtlGLACCT_SEGMENT: TStringField
      DisplayLabel = 'Segment'
      DisplayWidth = 30
      FieldName = 'GLACCT_SEGMENT'
      Origin = 'd.GLACCT_SEGMENT'
      Size = 30
    end
    object QryDtlSEGMENT_VALUE_FROM: TStringField
      DisplayLabel = 'From Value'
      DisplayWidth = 20
      FieldName = 'SEGMENT_VALUE_FROM'
      Origin = 'd.SEGMENT_VALUE_FROM'
      Size = 50
    end
    object QryDtlSEGMENT_VALUE_TO: TStringField
      DisplayLabel = 'To Value'
      DisplayWidth = 20
      FieldName = 'SEGMENT_VALUE_TO'
      Origin = 'd.SEGMENT_VALUE_TO'
      Size = 50
    end
    object QryDtlUSE_RANGE: TStringField
      DisplayLabel = 'Use From-To Range'
      DisplayWidth = 1
      FieldName = 'USE_RANGE'
      Origin = 'd.USE_RANGE'
      Size = 1
    end
    object QryDtlBALANCE_TYPE: TStringField
      DisplayLabel = 'Balance Type'
      DisplayWidth = 15
      FieldName = 'BALANCE_TYPE'
      Origin = 'd.BALANCE_TYPE'
      Size = 15
    end
    object QryDtlSEGMENT_TYPE: TStringField
      DisplayLabel = 'Segment Type'
      DisplayWidth = 15
      FieldName = 'SEGMENT_TYPE'
      Origin = 'd.SEGMENT_TYPE'
      Size = 30
    end
    object QryDtlGLACCT_DIST: TStringField
      DisplayLabel = 'Distribution GL Acct'
      DisplayWidth = 20
      FieldName = 'GLACCT_DIST'
      Origin = 'a.acct'
      Size = 50
    end
    object QryDtlCONSTANT_VALUE: TBCDField
      DisplayLabel = 'Constant'
      DisplayWidth = 10
      FieldName = 'CONSTANT_VALUE'
      Origin = 'd.CONSTANT_VALUE'
      Size = 2
    end
    object QryDtlID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'd.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryDtlS_ACCOUNT_HDR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'S_ACCOUNT_HDR_ID'
      Origin = 'd.S_ACCOUNT_HDR_ID'
      Visible = False
      Size = 0
    end
    object QryDtlGLACCT_ID_DIST: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_DIST'
      Origin = 'd.GLACCT_ID_DIST'
      Visible = False
      Size = 0
    end
  end
  object SrcDtl: TDataSource
    DataSet = QryDtl
    Left = 72
    Top = 144
  end
  object UpdateSQL2: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into S_ACCOUNT_DTL'
      
        '  (ID, S_ACCOUNT_HDR_ID, GLACCT_ID_DIST, GLACCT_SEGMENT, SEGMENT' +
        '_VALUE_FROM, '
      
        '   SEGMENT_VALUE_TO, USE_RANGE, BALANCE_TYPE, SEGMENT_TYPE, CONS' +
        'TANT_VALUE)'
      'values'
      
        '  (:ID, :S_ACCOUNT_HDR_ID, :GLACCT_ID_DIST, :GLACCT_SEGMENT, :SE' +
        'GMENT_VALUE_FROM, '
      
        '   :SEGMENT_VALUE_TO, :USE_RANGE, :BALANCE_TYPE, :SEGMENT_TYPE, ' +
        ':CONSTANT_VALUE)')
    ModifySQL.Strings = (
      'update S_ACCOUNT_DTL'
      'set'
      '  ID = :ID,'
      '  S_ACCOUNT_HDR_ID = :S_ACCOUNT_HDR_ID,'
      '  GLACCT_ID_DIST = :GLACCT_ID_DIST,'
      '  GLACCT_SEGMENT = :GLACCT_SEGMENT,'
      '  SEGMENT_VALUE_FROM = :SEGMENT_VALUE_FROM,'
      '  SEGMENT_VALUE_TO = :SEGMENT_VALUE_TO,'
      '  USE_RANGE = :USE_RANGE,'
      '  BALANCE_TYPE = :BALANCE_TYPE,'
      '  SEGMENT_TYPE = :SEGMENT_TYPE,'
      '  CONSTANT_VALUE = :CONSTANT_VALUE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from S_ACCOUNT_DTL'
      'where'
      '  ID = :OLD_ID')
    Left = 120
    Top = 144
  end
  object PkSeg: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select column_name as segment,'
      '       segment_type as segment_type'
      '  from v_glacct_segs_glsub_scct_type')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 172
    Top = 161
    object PkSegSEGMENT: TStringField
      DisplayLabel = 'Segment'
      FieldName = 'SEGMENT'
      Size = 35
    end
    object PkSegSEGMENT_TYPE: TStringField
      DisplayLabel = 'Segment Type'
      FieldName = 'SEGMENT_TYPE'
      Size = 15
    end
  end
  object PkAcct: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '          type'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      ' where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 216
    Top = 161
    object PkAcctACCT: TStringField
      DisplayLabel = 'Acct#'
      FieldName = 'ACCT'
      Visible = False
      Size = 50
    end
    object PkAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkAcctTYPE: TStringField
      DisplayLabel = 'Acct. Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object PkAcctID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Precision = 15
      Size = 0
    end
  end
  object PkSegRange: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select distinct account as segment from v_glacct')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 256
    Top = 161
    object PkSegRangeSEGMENT: TStringField
      FieldName = 'SEGMENT'
      Size = 4
    end
  end
  object PkSubAcctType: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select distinct descrip as descrip'
      ' from glsub_acct_type')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 336
    Top = 169
    object PkSubAcctTypeDESCRIP: TStringField
      DisplayLabel = 'Sub Account Type'
      FieldName = 'DESCRIP'
      Origin = 'IQ.GLSUB_ACCT_TYPE.DESCRIP'
      Size = 35
    end
  end
  object QrySeg: TFDQuery
    BeforeInsert = QrySegBeforeInsert
    BeforeEdit = QrySegBeforeEdit
    BeforePost = QrySegBeforePost
    AfterPost = QrySegAfterPost
    AfterDelete = QrySegAfterPost
    OnNewRecord = QrySegNewRecord
    MasterSource = SrcDtl
    MasterFields = 'ID'
    DetailFields = 'ID'
    ConnectionName = 'IQFD'
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'S_ACCOUNT_DTL_VALUES'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL3
    SQL.Strings = (
      'select id,'
      '       s_account_dtl_id,'
      '       segment_value '
      '  from S_ACCOUNT_DTL_VALUES'
      ' where s_account_dtl_id = :ID'
      '  ')
    Left = 104
    Top = 336
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 120000c
      end>
    object QrySegSEGMENT_VALUE: TStringField
      DisplayLabel = 'Value'
      DisplayWidth = 50
      FieldName = 'SEGMENT_VALUE'
      Origin = 'SEGMENT_VALUE'
      Size = 50
    end
    object QrySegID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QrySegS_ACCOUNT_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'S_ACCOUNT_DTL_ID'
      Origin = 'S_ACCOUNT_DTL_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcSeg: TDataSource
    DataSet = QrySeg
    Left = 80
    Top = 336
  end
  object UpdateSQL3: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into S_ACCOUNT_DTL_VALUES'
      '  (ID, S_ACCOUNT_DTL_ID, SEGMENT_VALUE)'
      'values'
      '  (:ID, :S_ACCOUNT_DTL_ID, :SEGMENT_VALUE)')
    ModifySQL.Strings = (
      'update S_ACCOUNT_DTL_VALUES'
      'set'
      '  ID = :ID,'
      '  S_ACCOUNT_DTL_ID = :S_ACCOUNT_DTL_ID,'
      '  SEGMENT_VALUE = :SEGMENT_VALUE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from S_ACCOUNT_DTL_VALUES'
      'where'
      '  ID = :OLD_ID')
    Left = 136
    Top = 336
  end
  object PkProcStat: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select distinct object_name as object_name'
      '  from all_arguments '
      ' where '
      '       owner = '#39'IQMS'#39' '
      '   and package_name = '#39'STAT_ACCOUNT'#39
      '   and SubStr(object_name, 1, 4) = '#39'STAT'#39
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 328
    Top = 65535
    object PkProcStatOBJECT_NAME: TStringField
      DisplayLabel = 'Procedure'
      FieldName = 'OBJECT_NAME'
      Origin = 'IQ.ALL_ARGUMENTS.OBJECT_NAME'
      Size = 30
    end
  end
  object PkProcAlloc: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select distinct object_name as object_name'
      '  from all_arguments '
      ' where '
      '       owner = '#39'IQMS'#39' '
      '   and package_name = '#39'STAT_ACCOUNT'#39
      '   and SubStr(object_name, 1, 5) = '#39'ALLOC'#39
      '   '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 384
    Top = 65535
    object StringField1: TStringField
      DisplayLabel = 'Procedure'
      FieldName = 'OBJECT_NAME'
      Origin = 'IQ.ALL_ARGUMENTS.OBJECT_NAME'
      Size = 30
    end
  end
end
