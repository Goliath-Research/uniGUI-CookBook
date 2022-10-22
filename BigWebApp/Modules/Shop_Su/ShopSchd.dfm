object FrmShopSchedHolidays: TFrmShopSchedHolidays
  Left = 197
  Top = 186
  HelpContext = 1225560
  ClientHeight = 431
  ClientWidth = 522
  Caption = 'Schedule Days Off'
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 0
    Top = 27
    Width = 522
    Height = 385
    Hint = ''
    ActivePage = TabSheet2
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Work Centers'
      object Splitter1: TUniSplitter
        Left = 252
        Top = 0
        Width = 6
        Height = 357
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object pnlWorkCenters: TUniPanel
        Left = 0
        Top = 0
        Width = 252
        Height = 357
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object wwGridWorkCenter: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 250
          Height = 355
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 33
          IQComponents.Grid.Height = 269
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = wwSrcWorkCenter
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
          IQComponents.Navigator.DataSource = wwSrcWorkCenter
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 33
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 269
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = wwSrcWorkCenter
          Columns = <
            item
              FieldName = 'CNTR_DESC'
              Title.Caption = 'Work Center Description'
              Width = 154
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EQNO'
              Title.Caption = 'Work Center'
              Width = 77
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CNTR_TYPE'
              Title.Caption = 'Type'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MFG_TYPE'
              Title.Caption = 'MFG Type'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MFGCELL'
              Title.Caption = 'MFG Cell'
              Width = 105
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
      object Panel3: TUniPanel
        Left = 258
        Top = 0
        Width = 256
        Height = 357
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Panel2: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 254
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object sbtnMultiSelect: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Enable MultiSelect'
            ShowHint = True
            ParentShowHint = False
            GroupIndex = 1
            AllowAllUp = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000232E0000232E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6078D01038B0
              1038B01030B01028A01028A0002090002090FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF8F8F8F6161616161615E5E5E5555555555554A4A4A4A
              4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6080D09098FF
              5060FF5060FF3048F03048E02040D01028A0FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF949494B4B4B49696969696968585857E7E7E73737355
              5555FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7088E0A0A8FF
              9090FF7080FF5068FF3058F02048F01038B0B3977DB3977DB3977DB3977DB397
              7DB3977DB3977DB3977D9F9F9FBFBFBFB0B0B0A6A6A69999998B8B8B85858561
              61619494949494949494949494949494949494949494949494947088E07088E0
              6080D06078D05070C05060C04058B04058B03DD8FF46DFFF51E3FF63E8FF77EE
              FF8EF1FFA3F5FFB3977D9F9F9F9F9F9F9494948F8F8F8585857C7C7C71717171
              7171DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F3949494FF00FFFF00FF
              B3977D25B9FF28BEFF2CC4FF31CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
              FF8EF1FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D7
              D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F3949494FF00FFFF00FF
              B3977D9393928787857E7D7C7978767978777F7E7C888685908F8D9796939796
              949796949D9A98B3977DFF00FFFF00FF9494949393938787877D7D7D78787878
              78787E7E7E8686868F8F8F9595959696969696969A9A9A949494FF00FFFF00FF
              B3977D25B9FF28BEFF2CC4FF31CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
              FF8EF1FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D7
              D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F3949494FF00FFFF00FF
              50805040704030503020382031CBFF36D1FF3DD9FF45DEFF52E4FF63E9FF78ED
              FF8EF2FFA3F5FFB3977DFF00FFFF00FF757575656565484848323232D2D2D2D6
              D6D6DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F3949494FF00FFFF00FF
              50905060A860508850305030ADADADA0A0A09292918686867D7D7D7A7A7A7B7A
              7A838281929190B3977DFF00FFFF00FF8282829898987B7B7B484848ADADADA0
              A0A09292928686867D7D7D7A7A7A7A7A7A82828291919194949470A88060A070
              60986070B070509850407040305030203820FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFEFEFEFEFEFDB3977D9D9D9D9494948B8B8BA2A2A288888865656548484832
              3232FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFE94949480B090A0D8A0
              70C08070B87060A060509050408840305030FFFDFAFFFDFBFFFEFCFFFFFDFFFF
              FEFFFFFEFFFFFFB3977DA7A7A7CACACAB0B0B0A8A8A891919182828279797948
              4848FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF94949490B8A0B0D8B0
              A0D8A090D0A070B87060A860509850407040A17A57A17A57A17A57A17A57A17A
              57A17A57A17A57A17A57B1B1B1CECECECACACAC3C3C3A8A8A898989888888865
              656577777777777777777777777777777777777777777777777790C0A090B8A0
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
            OnClick = sbtnMultiSelectClick
          end
          object sbtnEditPeriod: TUniSpeedButton
            Left = 26
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Edit Start/End time ...'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFB0A0906048306048306048306048306048306048306048
              30604830604830604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E46464646
              4646464646464646464646464646464646464646464646464646FF00FFFF00FF
              FF00FFFF00FFFF00FFB0A090E0C8C0D0B8B0D0B8B0C0B0A0C0B0A0C0A8A0C0A8
              90B0A090B0A090604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EC9C9C9B8
              B8B8B8B8B8AEAEAEAEAEAEA8A8A8A5A5A59E9E9E9E9E9E464646B0A090604830
              604830604830604830B0A090FFFFFFFFF8FFD0B8B0404040E0C8C0C0A8A0F0D8
              D0F0D0B0B0A0906048309E9E9E4646464646464646464646469E9E9EFFFFFFFA
              FAFAB8B8B8404040C9C9C9A8A8A8D9D9D9CDCDCD9E9E9E464646B0A090E0C8C0
              D0B8B0D0B8B0C0B0A0B0A090FFFFFFFFFFFFD0C0B0606060605850C0B0A0FFE0
              D0F0D8C0C0A8906048309E9E9EC9C9C9B8B8B8B8B8B8AEAEAE9E9E9EFFFFFFFF
              FFFFBEBEBE606060575757AEAEAEE0E0E0D5D5D5A5A5A5464646B0A090FFFFFF
              FFF8FFD0B8B0FFF0F0B0A090E0D0D0D0C0C0D0C0B0B0A8A0000000B0A090C0B0
              A0C0A8A0C0A8906048309E9E9EFFFFFFFAFAFAB8B8B8F2F2F29E9E9ED2D2D2C2
              C2C2BEBEBEA7A7A70000009E9E9EAEAEAEA8A8A8A5A5A5464646B0A090FFFFFF
              C0B8C0000000000000C0A890FFFFFFFFFFFFD0C8C0FFFFFF807880504840FFF0
              E0FFE0D0C0A8A06048309E9E9EFFFFFFBBBBBB000000000000A5A5A5FFFFFFFF
              FFFFC7C7C7FFFFFF7B7B7B474747EEEEEEE0E0E0A8A8A8464646B0A090E0D0D0
              403830605850D0C0B0C0A8A0FFFFFFFFFFFFD0C8C0FFFFFFF0E8F0100810E0D8
              D0FFE8E0C0A8A06048309E9E9ED2D2D2373737575757BEBEBEA8A8A8FFFFFFFF
              FFFFC7C7C7FFFFFFEBEBEB0B0B0BD7D7D7E9E9E9A8A8A8464646C0A890FFFFFF
              A098A0302820707870C0B0A0E0D8D0E0D0C0A098907060607060602020206060
              50C0B0A0C0B0A0604830A5A5A5FFFFFF9B9B9B272727757575AEAEAED7D7D7CE
              CECE9797976161616161612020205C5C5CAEAEAEAEAEAE464646C0A8A0FFFFFF
              E0E0E0000000606860D0B0A0FFFFFFFFFFFFA09890808080808080706060C0C0
              C0FFF0F0C0B0A0604830A8A8A8FFFFFFE0E0E0000000656565AFAFAFFFFFFFFF
              FFFF979797808080808080616161C0C0C0F2F2F2AEAEAE464646C0B0A0E0D8D0
              707060302820D0C8C0D0B8A0FFFFFFFFFFFFE0D0C0FFFFFFFFFFFFD0C8C0FFFF
              FFFFF8F0D0B8B0604830AEAEAED7D7D76D6D6D272727C7C7C7B5B5B5FFFFFFFF
              FFFFCECECEFFFFFFFFFFFFC7C7C7FFFFFFF7F7F7B8B8B8464646D0B0A0FFFFFF
              FFFFFF403830000000F0A890F0A890F0A880F0A080E09870E08850E08050E078
              40E07040E07040D06030AFAFAFFFFFFFFFFFFF373737000000AAAAAAAAAAAAA8
              A8A8A2A2A29898988888888282827B7B7B767676767676676767D0B8A0FFFFFF
              FFFFFFE0D0C0FFFFFFF0A890FFC0A0FFC0A0FFB890FFB890FFA880FFA880F0A0
              70F09870F09860D06830B5B5B5FFFFFFFFFFFFCECECEFFFFFFAAAAAAC0C0C0C0
              C0C0B8B8B8B8B8B8A9A9A9A9A9A9A0A0A09A9A9A9898986C6C6CF0A890F0A890
              F0A880F0A080E09870F0A890F0A890F0A890F0A880F0A080E09870E09060E088
              60E07840E07840E07040AAAAAAAAAAAAA8A8A8A2A2A2989898AAAAAAAAAAAAAA
              AAAAA8A8A8A2A2A29898989090908A8A8A7B7B7B7B7B7B767676F0A890FFC0A0
              FFC0A0FFB890FFB890FFA880FFA880F0A070F09870F09860D06830FF00FFFF00
              FFFF00FFFF00FFFF00FFAAAAAAC0C0C0C0C0C0B8B8B8B8B8B8A9A9A9A9A9A9A0
              A0A09A9A9A9898986C6C6CFF00FFFF00FFFF00FFFF00FFFF00FFF0A890F0A890
              F0A890F0A880F0A080E09870E09060E08860E07840E07840E07040FF00FFFF00
              FFFF00FFFF00FFFF00FFAAAAAAAAAAAAAAAAAAA8A8A8A2A2A29898989090908A
              8A8A7B7B7B7B7B7B767676FF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnEditPeriodClick
          end
        end
        object gridCalendar: TIQUniGridControl
          Left = 1
          Top = 27
          Width = 254
          Height = 330
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 37
          IQComponents.Grid.Height = 244
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcCalendar
          IQComponents.Grid.LoadMask.Message = 'Loading data...'
          IQComponents.Grid.Align = alClient
          IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
          IQComponents.Grid.TabOrder = 0
          IQComponents.Grid.OnDrawColumnCell = gridCalendarDBGridDrawColumnCell
          IQComponents.Navigator.Left = 410
          IQComponents.Navigator.Top = 0
          IQComponents.Navigator.Width = 241
          IQComponents.Navigator.Height = 25
          IQComponents.Navigator.Hint = ''
          IQComponents.Navigator.ShowHint = True
          IQComponents.Navigator.DataSource = SrcCalendar
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 37
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 244
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcCalendar
          Columns = <
            item
              FieldName = 'START_TIME'
              Title.Caption = 'Start'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'END_TIME'
              Title.Caption = 'End'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'MFG Cell / MFG Type'
      object Splitter2: TUniSplitter
        Left = 193
        Top = 0
        Width = 6
        Height = 357
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object pnlCenterType: TUniPanel
        Left = 0
        Top = 0
        Width = 193
        Height = 357
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = 'pnlCenterType'
        object dbgridCenterType: TUniDBGrid
          Left = 1
          Top = 1
          Width = 191
          Height = 355
          Hint = ''
          DataSource = SrcGeneralCenterType
          LoadMask.Message = 'Loading data...'
          OnEnter = gridWorkCenterEnter
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'CENTER_TYPE'
              Title.Caption = 'Generic'
              Width = 43
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'MFG Cell'
              Width = 116
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object Panel5: TUniPanel
        Left = 199
        Top = 0
        Width = 315
        Height = 357
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = 'Panel5'
        object wwgridDefault_Calendar: TIQUniGridControl
          Left = 1
          Top = 27
          Width = 313
          Height = 330
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 96
          IQComponents.Grid.Height = 244
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcDefault_Calendar
          IQComponents.Grid.LoadMask.Message = 'Loading data...'
          IQComponents.Grid.Align = alClient
          IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
          IQComponents.Grid.TabOrder = 0
          IQComponents.Grid.OnDrawColumnCell = wwgridDefault_CalendarDBGridDrawColumnCell
          IQComponents.Navigator.Left = 410
          IQComponents.Navigator.Top = 0
          IQComponents.Navigator.Width = 241
          IQComponents.Navigator.Height = 25
          IQComponents.Navigator.Hint = ''
          IQComponents.Navigator.ShowHint = True
          IQComponents.Navigator.DataSource = SrcDefault_Calendar
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 96
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 244
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcDefault_Calendar
          Columns = <
            item
              FieldName = 'START_TIME'
              Title.Caption = 'Start'
              Width = 168
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'END_TIME'
              Title.Caption = 'End'
              Width = 147
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object Panel4: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 313
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object chkPropagate: TUniCheckBox
            Left = 6
            Top = 5
            Width = 159
            Height = 17
            Hint = 
              'Propagate off period to work centers associated with selected mf' +
              'gcell'
            ShowHint = True
            ParentShowHint = False
            Caption = 'Propagate to work centers'
            TabOrder = 0
          end
        end
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 27
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object sbtnPkCenter: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Find Work Centers'
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
      OnClick = sbtnPkCenterClick
    end
    object sbtnShifts: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Assign Time Off by shifts to a work center'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFDECABDBF9576C7A083B48A6CC8A183C7A082B78D
        6FC79E7DBA8A66B1866AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80
        8080808080808080808080808080808080808080808080858585FF00FFD3D3D3
        C9C9C9DDDDDDFCFCFCFF00FFE3D2C7E7D2BAF8EBD5CAB39CF7E9D2F5E6D0D3BE
        ABF8E8CDDAB792B08568FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80
        8080FF00FF808080FFFFFFFF00FF808080FF00FF808080848484FF00FF959595
        AAAAAA8F8F8FDFDFDFFF00FFE2D1C6CAB29ED1BFAFAD927FC3B0A2BEAAA0B8A0
        91C9B4A1C6A588AA7E62FF00FF8080808080808F8F8FFF00FFFF00FFFF00FF80
        80808080808080808080808080808080808080808080807D7D7DFF00FFA8A8A8
        FFFFFFFFFFFFA8A8A8F1F1F1E3D2C7E1CFBFEFE6DABCA695EEE8DFEEE7DFC8B4
        A8F1E8DDE1C9B3A87C60FF00FF808080FFFFFFFF00FFA8A8A8FF00FFFF00FF80
        8080FF00FF808080FFFFFFFF00FF808080FF00FF8080807B7B7BFF00FFC7C7C7
        FFFFFFFFFFFF9A9A9AB9B9B9DECEC5C9B5A9D2C5BDB7A295CFC2BAD1C1B9B89E
        91D4C3BAC9AE9BA4785DFF00FF808080808080FFFFFF808080B9B9B9FF00FF80
        8080808080808080808080808080808080808080808080777777FF00FFFF00FF
        EEEEEEB4B4B4FFFFFF9B9B9BB8AEADE1CFBFEFE6DAB7A295EFE6DAEFE6DAB7A2
        95EFE6DAE1C9B38D6B6BFF00FFFF00FFFF00FF808080FFFFFF808080AFAFAF80
        8080FF00FF808080FFFFFFFF00FF808080FF00FF8080806E6E6EFF00FFFF00FF
        FF00FFF9F9F9B4B4B4FFFFFF8885A34543B23A39BA3635B93230B52020AF1B1A
        AD1616AB1313A92B278FFF00FFFF00FFFF00FFFF00FF808080FFFFFF80808068
        68686767676565656262625A5A5A5858585656565454544D4D4DFF00FFFF00FF
        ECECECD3D3D3EBEBEBAAAAAAD8D7E75959A46363915B5B915D5D985C5C8F5150
        965B5A8C3F3E996766B4FF00FFFF00FFFF00FFFF00FFFF00FF808080DBDBDB6F
        6F6F6F6F6F6969696D6D6D6969696464646767675B5B5B7C7C7CFF00FFF9F9F9
        BCBCBC787878B1B1B1A1A0A043547D367DDD9595969E9E9F8D8D8E9F9FA28F8F
        909C9C9EA8A8ACF2F2F6FF00FFFF00FF8080807878788080808080805E5E5E96
        96969595958080808D8D8DFF00FFFF00FFFF00FFFF00FFFF00FFF8F8F8BFBFBF
        828282A8A8A88C8C8B88837D2049931195FB39CFFF1F88FF316DBE9A9DA1EEEE
        EEFF00FFFF00FFFF00FFFF00FF808080828282A8A8A88C8C8C8282825D5D5DAE
        AEAED5D5D58080808080809E9E9EFF00FFFF00FFFF00FFFF00FFD8D8D8ACACAC
        D0D0D0D5D5D5A7A7A78B8B87999697355AA01B99FE39CFFF1F88FF2B6BBF9B9D
        A1EBEBEBFF00FFFF00FF808080ACACACD0D0D0D5D5D5A7A7A78A8A8A97979780
        8080B1B1B1D5D5D58080808080809E9E9EFF00FFFF00FFFF00FFBEBEBED1D1D1
        AAAAAAA4A4A4D1D1D1DBDCDCBAB9B6CECECE6D89BB1A9BFF39CFFF1F88FF2E6B
        BF9B9FA3F2F2F2FF00FF808080D1D1D1808080808080D1D1D1808080808080FF
        00FF808080B2B2B2D5D5D5808080818181A0A0A0FF00FFFF00FFE2E2E2D1D1D1
        F4F4F49D9D9DE7E7E7FFFFFFAEAEAEFF00FFE4E4E46786B9199BFF39CFFF1884
        FF376FC0CFD0D1FF00FF808080808080FF00FF808080E7E7E7808080808080FF
        00FFFF00FF808080B2B2B2D5D5D5808080808080FF00FFFF00FFFF00FFF1F1F1
        B8B8B8A1A1A1F8F8F8EFEFEFC7C7C7FF00FFFF00FFE4E4E46786BA2BA7FF2596
        FF3580E0CECFD1FF00FFFF00FFFF00FF808080808080F8F8F8808080808080FF
        00FFFF00FFFF00FF808080BABABAB0B0B0808080FF00FFFF00FFFF00FFD9D9D9
        B0B0B0E7E7E7EEEEEEBFBFBFF8F8F8FF00FFFF00FFFF00FFE0E0E17595C15E98
        DB859BB6E2E2E2FF00FFFF00FFFF00FF808080E7E7E7808080808080FF00FFFF
        00FFFF00FFFF00FFFF00FF808080808080808080FF00FFFF00FFFF00FFF7F7F7
        CFCFCFBBBBBBBFBFBFECECECFF00FFFF00FFFF00FFFF00FFFF00FFE3E3E4D6D7
        DBDEDEDEF8F8F8FF00FFFF00FFFF00FFFF00FF808080808080FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnShiftsClick
    end
    object sbtnHolidays: TUniSpeedButton
      Left = 51
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Assign Time Off period ( Holiday ) to work center(s)'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000130B0000130B00000000000000000000FF00FFFF00FF
        E6CCC0B55D19B35A18B15716AF5414AD5112AA4D0FA7490DA4440AA140079F3C
        059D3904B56A42FF00FFFF00FFFF00FFFF00FF5E5E5E5C5C5C5A5A5A57575755
        55555151514E4E4E4A4A4A4747474444444141416B6B6BFFFFFFFF00FFFF00FF
        B8611CD48C35D08632CC802EC97A2AC47427C06D23BA641DB45B18AE5213A849
        0DA4430AA03E07CF9D82FF00FFFF00FF6262628787878282827D7D7D78787872
        72726C6C6C6464645D5D5D5656564E4E4E4949494545459C9C9CFF00FFE6CCC0
        EDCA9DE9C79CBCC09A88B1988AB1968AAF9489AD9286A89083A38CB0A98BD3A7
        88D3A386D1A184CE9C81FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA4A4A4A5A5A5A2A2A2A0A0A09B9B9BFF00FFB26232
        CC966BCC8F62CC8351CC8453CC9164CC966CCC8D5FCC814F7A8E7F55E7FD78EA
        FDFBFFFFFF00FFFF00FFFF00FF64646480808080808080808080808080808080
        8080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFE6CCC0
        E5C49CFFF7D4FFE2B8FFD09FFFDFB3FFF6D1FFF5D0FFDEB180907F7C8F7F788D
        809A9280CC9980CC9980FF00FF808080FFFFFFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF808080808080808080808080808080808080FF00FFE9FCFF
        4FB3C0E5C69FFFF5D1FFDEB2FFD09FFFE3B8FFF7D4FFF1CB85927FCC9468FFE8
        BFFFDDB0FFF1CBCB8C65FF00FFFF00FF808080FFFFFFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF808080FFFFFFFF00FFFF00FF8080808B8B8BFF00FFA7F0FF
        39DFFF9F8E70FFF7D3FFF2CDFFDBADFFD2A1FFE7BDFFF9D68A947FCC8351FFEE
        C7FFE1B5C1916DFF00FFFF00FFFF00FFFF00FF808080FFFFFFFF00FFFF00FFFF
        00FFFF00FFFF00FF808080FFFFFFFF00FFFF00FF808080FF00FFFF00FF87EBFF
        3CE0FF4FE6FEA49071FFF9D5FFEFC8FFD7A8FFD3A3FFEBC28C957FCC9063FFD6
        A7CC9063A1F1FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFFFF00FFFF
        00FFFF00FFFF00FF808080FFFFFFFF00FF808080F0F0F0FF00FFFF00FF85EAFF
        3ADFFF4EE6FE6DBEBFE5BF95FFFAD7FFEBC3FFD4A4FFD6A78A947FCC8F62FFEE
        C7768D7FA0F1FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFFFF00FFFF
        00FFFF00FFFF00FF808080FFFFFFFF00FF808080F0F0F0FF00FFFF00FFA6F0FF
        39DDFF49E4FE5AEAFE73BFBFE5C198FFF9D6FFE8BEFFD2A186937FCC8351CC88
        5851E6FFBDF5FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FFFFFFFF
        00FFFF00FFFF00FF808080FFFFFF808080E6E6E6F4F4F4FF00FFFF00FFE7FCFF
        31DBFF40E1FF51E7FE5FEBFE80907FFFF1CBFFF8D4FFE3B981917FCC9469778E
        7F4EE4FFF1FDFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FF
        FFFFFF00FFFF00FF808080808080808080E4E4E4FDFDFDFF00FFFF00FFFF00FF
        7FEAFF39DDFF45E3FF52E7FE5DEBFEA48F70FFF4D0FFF6D27B8F7F8860404CE5
        FF97EFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80
        8080FFFFFFFF00FF808080808080E5E5E5EEEEEEFF00FFFF00FFFF00FFFF00FF
        F7FEFF59E2FF39DEFF42E2FF4CE5FE52E7FECC8D5FFFF7D3738C7F48E3FF70E7
        FFFBFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF808080FFFFFF808080E3E3E3E7E7E7FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFF7FEFF80EAFF36DCFF3CDEFF3FE1FF57B5C0E5BB906C8A808FEEFFFAFF
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFB3B3B3808080808080EDEDEDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFE7FCFFA7F0FF88EBFF8BECFFB3C5C0C29880FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFC3C3C3808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnHolidaysClick
    end
    object NavMain: TUniDBNavigator
      Left = 297
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      DataSource = wwSrcWorkCenter
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
    object Panel6: TUniPanel
      Left = 264
      Top = 1
      Width = 33
      Height = 25
      Hint = ''
      ShowHint = True
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Shape1: TUniPanel
        Left = 12
        Top = 7
        Width = 10
        Height = 11
        Hint = 'Holidays'
        ShowHint = True
        TabOrder = 1
        Caption = ''
      end
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 412
    Width = 522
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object SrcCalendar: TDataSource
    DataSet = TblCalendar
    Left = 76
    Top = 101
  end
  object TblCalendar: TFDTable
    BeforeInsert = TblCalendarBeforeEdit
    BeforeEdit = TblCalendarBeforeEdit
    BeforePost = TblCalendarBeforePost
    AfterPost = TblCalendarAfterPost
    BeforeDelete = TblCalendarBeforeDelete
    OnNewRecord = TblCalendarNewRecord
    IndexFieldNames = 'WORK_CNTR_ID;START_TIME'
    MasterSource = wwSrcWorkCenter
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CALENDAR'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'CALENDAR'
    Left = 76
    Top = 128
    object TblCalendarSTART_TIME: TDateTimeField
      DisplayLabel = 'Start'
      DisplayWidth = 18
      FieldName = 'START_TIME'
      Required = True
      EditMask = '##/##/#### ##:##:##;1;_'
    end
    object TblCalendarEND_TIME: TDateTimeField
      DisplayLabel = 'End'
      DisplayWidth = 18
      FieldName = 'END_TIME'
      EditMask = '##/##/#### ##:##:##;1;_'
    end
    object TblCalendarID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblCalendarWORK_CNTR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORK_CNTR_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblCalendarDAY_OFF_TYPE: TBCDField
      DisplayLabel = 'Type'
      DisplayWidth = 10
      FieldName = 'DAY_OFF_TYPE'
      Visible = False
      Size = 0
    end
  end
  object SrcGeneralCenterType: TDataSource
    DataSet = QryGeneralCenterType
    Left = 32
    Top = 166
  end
  object QryGeneralCenterType: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct asy_mach as Center_Type,'
      '       c.mfgcell_id,'
      '       m.mfgcell as descrip'
      '  from default_calendar c,'
      '       mfgcell m'
      ' where c.mfgcell_id = m.id(+)'
      'UNION'
      '-- add 24/7 cells that are not in the default_calendar'
      'select decode( Mfg.Like_Generic_ExA( m.mfgtype ), 1, '#39'Y'#39', '#39'N'#39' ),'
      '       m.id,'
      '       m.mfgcell'
      '  from mfgcell m,'
      '       default_calendar c'
      ' where m.id = c.mfgcell_id(+)'
      '   and c.id is NULL'
      ' ')
    Left = 32
    Top = 197
    object QryGeneralCenterTypeCENTER_TYPE: TStringField
      FieldName = 'CENTER_TYPE'
      Size = 1
    end
    object QryGeneralCenterTypeMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Size = 0
    end
    object QryGeneralCenterTypeDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 15
    end
  end
  object SrcDefault_Calendar: TDataSource
    DataSet = TblDefault_Calendar
    Left = 76
    Top = 166
  end
  object TblDefault_Calendar: TFDTable
    BeforePost = TblCalendarBeforePost
    AfterPost = TblDefault_CalendarAfterPost
    BeforeDelete = TblDefault_CalendarBeforeDelete
    OnNewRecord = TblCalendarNewRecord
    IndexFieldNames = 'ASY_MACH;MFGCELL_ID;START_TIME'
    MasterSource = SrcGeneralCenterType
    MasterFields = 'CENTER_TYPE;MFGCELL_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'DEFAULT_CALENDAR'
    TableName = 'DEFAULT_CALENDAR'
    Left = 76
    Top = 197
    object TblDefault_CalendarSTART_TIME: TDateTimeField
      DisplayLabel = 'Start'
      DisplayWidth = 24
      FieldName = 'START_TIME'
      Required = True
      EditMask = '##/##/#### ##:##:##;1;_'
    end
    object TblDefault_CalendarEND_TIME: TDateTimeField
      DisplayLabel = 'End'
      DisplayWidth = 21
      FieldName = 'END_TIME'
      EditMask = '##/##/#### ##:##:##;1;_'
    end
    object TblDefault_CalendarASY_MACH: TStringField
      DisplayWidth = 1
      FieldName = 'ASY_MACH'
      Required = True
      Visible = False
      Size = 1
    end
    object TblDefault_CalendarDAY_OFF_TYPE: TBCDField
      DisplayWidth = 10
      FieldName = 'DAY_OFF_TYPE'
      Visible = False
      Size = 0
    end
    object TblDefault_CalendarID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblDefault_CalendarMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'TblCalendar'
      'TblDefault_Calendar')
    SecurityCode = 'FRMSHOPSCHEDHOLIDAYS'
    Left = 124
    Top = 2
  end
  object PkWorkCenter: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, '
      '       eqno, '
      '       cntr_type, '
      '       mfg_type, '
      '       mfgcell,'
      '       pk_hide '
      '  from work_center'
      ' order by eqno')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 113
    Top = 174
    object PkWorkCenterID: TBCDField
      FieldName = 'ID'
      Origin = 'WORK_CENTER.ID'
      Visible = False
      Size = 0
    end
    object PkWorkCenterEQNO: TStringField
      DisplayLabel = 'Work Center'
      FieldName = 'EQNO'
      Origin = 'WORK_CENTER.EQNO'
      Size = 60
    end
    object PkWorkCenterCNTR_TYPE: TStringField
      DisplayLabel = 'Center Type'
      FieldName = 'CNTR_TYPE'
      Origin = 'WORK_CENTER.CNTR_TYPE'
    end
    object PkWorkCenterMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      Origin = 'WORK_CENTER.MFG_TYPE'
      Size = 10
    end
    object PkWorkCenterMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      FieldName = 'MFGCELL'
      Origin = 'WORK_CENTER.MFGCELL'
      Size = 15
    end
    object PkWorkCenterPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.WORK_CENTER.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 36
    Top = 69
    object AssignTimeOffByShift1: TUniMenuItem
      Caption = 'Assign Time Off  by Shift'
      OnClick = sbtnShiftsClick
    end
    object AssignHolidayToWorkCenters1: TUniMenuItem
      Caption = 'Assign Holiday to work center(s)'
      OnClick = sbtnHolidaysClick
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 94
    Top = 2
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Calendar1: TUniMenuItem
      Caption = '&Calendar'
      object AssignTimeOffbyShift2: TUniMenuItem
        Caption = 'Assign Time Off  by Shift'
        OnClick = sbtnShiftsClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object AssignHolidaytoworkcenters2: TUniMenuItem
        Caption = 'Assign Holiday to work center(s)'
        OnClick = sbtnHolidaysClick
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'Shop Schedule Holidays'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192917 $'
    BuildVersion = '176554'
    Left = 203
    Top = 3
  end
  object wwSrcWorkCenter: TDataSource
    DataSet = wwQryWorkCenter
    Left = 35
    Top = 100
  end
  object wwQryWorkCenter: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, '
      '       eqno, '
      '       cntr_type, '
      '       mfg_type, '
      '       mfgcell, '
      '       cntr_desc'
      '  from work_center'
      ' where nvl(pk_hide,'#39'N'#39') <> '#39'Y'#39
      '')
    Left = 35
    Top = 127
    object wwQryWorkCenterCNTR_DESC: TStringField
      DisplayLabel = 'Work Center Description'
      DisplayWidth = 22
      FieldName = 'CNTR_DESC'
      Origin = 'IQ.WORK_CENTER.CNTR_DESC'
      FixedChar = True
      Size = 250
    end
    object wwQryWorkCenterEQNO: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 11
      FieldName = 'EQNO'
      Origin = 'WORK_CENTER.EQNO'
      Size = 60
    end
    object wwQryWorkCenterCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 10
      FieldName = 'CNTR_TYPE'
      Origin = 'WORK_CENTER.CNTR_TYPE'
    end
    object wwQryWorkCenterMFG_TYPE: TStringField
      DisplayLabel = 'MFG Type'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      Origin = 'WORK_CENTER.MFG_TYPE'
      Size = 10
    end
    object wwQryWorkCenterMFGCELL: TStringField
      DisplayLabel = 'MFG Cell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Origin = 'WORK_CENTER.MFGCELL'
      Size = 15
    end
    object wwQryWorkCenterID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'WORK_CENTER.ID'
      Visible = False
      Size = 0
    end
  end
  object popmWorkCenter: TUniPopupMenu
    Left = 77
    Top = 70
    object ByWorkCenter1: TUniMenuItem
      Caption = 'By Work Center #'
      OnClick = ByWorkCenter1Click
    end
    object ByWorkCenterDescription1: TUniMenuItem
      Caption = 'By Work Center Description'
      OnClick = ByWorkCenterDescription1Click
    end
  end
end
