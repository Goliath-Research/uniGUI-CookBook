object Shop_SetUp: TShop_SetUp
  Left = 59
  Top = 161
  HelpContext = 1113357
  ClientHeight = 416
  ClientWidth = 690
  Caption = 'Shop Setup'
  OnShow = FormShow
  OldCreateOrder = True
  ShowHint = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 392
    Width = 690
    Height = 24
    Hint = ''
    ShowHint = True
    Panels = <
      item
        Width = 690
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 690
    Height = 392
    Hint = ''
    ShowHint = True
    ActivePage = tabDefault
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    OnChange = PageControl1Change
    object tabDefault: TUniTabSheet
      Hint = ''
      ShowHint = True
      Caption = 'Default'
      object pnlDefaultSettings: TUniPanel
        Left = 0
        Top = 0
        Width = 682
        Height = 364
        Hint = ''
        ShowHint = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter3: TUniSplitter
          Left = 270
          Top = 1
          Width = 4
          Height = 362
          Hint = ''
          ShowHint = True
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object pnlDefaultLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 269
          Height = 362
          Hint = ''
          ShowHint = True
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object wwDBGridOrigin: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 267
            Height = 360
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            ShowHint = True
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 50
            IQComponents.Grid.Height = 274
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.ShowHint = True
            IQComponents.Grid.DataSource = SrcOrigin
            IQComponents.Grid.LoadMask.Message = 'Loading data...'
            IQComponents.Grid.Align = alClient
            IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
            IQComponents.Grid.TabOrder = 0
            IQComponents.Grid.OnDrawColumnCell = wwDBGridOriginDBGridDrawColumnCell
            IQComponents.Navigator.Left = 410
            IQComponents.Navigator.Top = 0
            IQComponents.Navigator.Width = 241
            IQComponents.Navigator.Height = 25
            IQComponents.Navigator.Hint = ''
            IQComponents.Navigator.ShowHint = True
            IQComponents.Navigator.DataSource = SrcOrigin
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 50
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 274
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.ShowHint = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ShowHint = True
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcOrigin
            Columns = <
              item
                FieldName = 'ORIGIN'
                Title.Caption = 'Origin'
                Width = 49
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'SOURCE'
                Title.Caption = 'Source'
                Width = 210
                CheckBoxField.FieldValues = 'true;false'
              end>
            TabsVisible = True
            Marker = 0
          end
        end
        object pnlSettings: TUniPanel
          Left = 274
          Top = 1
          Width = 407
          Height = 362
          Hint = ''
          ShowHint = True
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object pgctrlDefaultSettings: TUniPageControl
            Left = 1
            Top = 1
            Width = 405
            Height = 360
            Hint = ''
            ShowHint = True
            ActivePage = TabSystem
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object TabSystem: TUniTabSheet
              Hint = ''
              ShowHint = True
              Caption = 'TabSystem'
              DesignSize = (
                397
                332)
              object dbchkDefaultDisableRTServerShiftReport: TUniDBCheckBox
                Left = 4
                Top = 312
                Width = 165
                Height = 17
                Hint = 'Do not create RealTime shift report'
                ShowHint = True
                DataField = 'RTSERVER_DISABLE_SHIFT_REPORT'
                DataSource = SrcParams
                ValueChecked = 'Y'
                ValueUnchecked = 'N'
                Caption = 'Disable RealTime Shift Report'
                TabOrder = 0
              end
              object GroupBox1: TUniGroupBox
                Left = 3
                Top = 169
                Width = 386
                Height = 137
                Hint = ''
                ShowHint = True
                Caption = ' Shifts '
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                DesignSize = (
                  386
                  137)
                object Label1: TUniLabel
                  Left = 7
                  Top = 32
                  Width = 40
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  Caption = '1st Shift'
                  TabOrder = 9
                end
                object Label2: TUniLabel
                  Left = 7
                  Top = 57
                  Width = 43
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  Caption = '2nd Shift'
                  TabOrder = 10
                end
                object Label3: TUniLabel
                  Left = 7
                  Top = 82
                  Width = 41
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  Caption = '3rd Shift'
                  TabOrder = 11
                end
                object Label10: TUniLabel
                  Left = 168
                  Top = 13
                  Width = 41
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  Caption = 'Duration'
                  TabOrder = 12
                end
                object Label11: TUniLabel
                  Left = 74
                  Top = 13
                  Width = 49
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  Caption = 'Start Time'
                  TabOrder = 13
                end
                object Label6: TUniLabel
                  Left = 7
                  Top = 108
                  Width = 41
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  Caption = '4th Shift'
                  TabOrder = 14
                end
                object DBText1: TUniDBEdit
                  Left = 168
                  Top = 29
                  Width = 209
                  Height = 19
                  Hint = ''
                  ShowHint = True
                  DataField = 'Duration1'
                  DataSource = SrcParams
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
                object DBText2: TUniDBEdit
                  Left = 168
                  Top = 54
                  Width = 209
                  Height = 19
                  Hint = ''
                  ShowHint = True
                  DataField = 'Duration2'
                  DataSource = SrcParams
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
                object DBText3: TUniDBEdit
                  Left = 168
                  Top = 79
                  Width = 209
                  Height = 19
                  Hint = ''
                  ShowHint = True
                  DataField = 'Duration3'
                  DataSource = SrcParams
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
                object dbeStart1Default: TUniDBEdit
                  Left = 74
                  Top = 28
                  Width = 84
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  DataField = 'SHIFT_START1'
                  DataSource = SrcParams
                  TabOrder = 3
                end
                object dbeStart2Default: TUniDBEdit
                  Left = 74
                  Top = 53
                  Width = 84
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  DataField = 'SHIFT_START2'
                  DataSource = SrcParams
                  TabOrder = 4
                end
                object dbeStart3Default: TUniDBEdit
                  Left = 74
                  Top = 78
                  Width = 84
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  DataField = 'SHIFT_START3'
                  DataSource = SrcParams
                  TabOrder = 5
                end
                object dbeText4Shift: TUniDBEdit
                  Left = 168
                  Top = 105
                  Width = 209
                  Height = 19
                  Hint = ''
                  ShowHint = True
                  DataField = 'Duration4'
                  DataSource = SrcParams
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 6
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
                object dbeStart4Default: TUniDBEdit
                  Left = 74
                  Top = 104
                  Width = 84
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  DataField = 'SHIFT_START4'
                  DataSource = SrcParams
                  TabOrder = 7
                end
              end
              object GroupBox2: TUniGroupBox
                Left = 3
                Top = 31
                Width = 386
                Height = 137
                Hint = ''
                ShowHint = True
                Caption = ' Calendar '
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                object Label7: TUniLabel
                  Left = 8
                  Top = 18
                  Width = 51
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  Caption = '# of Shifts'
                  TabOrder = 5
                end
                object Label9: TUniLabel
                  Left = 8
                  Top = 42
                  Width = 51
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  Caption = 'Hours/Day'
                  TabOrder = 6
                end
                object Label5: TUniLabel
                  Left = 20
                  Top = 87
                  Width = 18
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  Caption = 'Mfg'
                  TabOrder = 7
                end
                object Label8: TUniLabel
                  Left = 20
                  Top = 111
                  Width = 36
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  Caption = 'Generic'
                  TabOrder = 8
                end
                object sbtnMfgDefaultShopCalendar: TUniSpeedButton
                  Left = 161
                  Top = 83
                  Width = 23
                  Height = 22
                  Hint = 'Define shop working shifts'
                  ShowHint = True
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
                  OnClick = sbtnMfgDefaultShopCalendarClick
                end
                object sbtnGenDefaultShopCalendar: TUniSpeedButton
                  Left = 161
                  Top = 107
                  Width = 23
                  Height = 22
                  Hint = 'Define shop working shifts'
                  ShowHint = True
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
                  OnClick = sbtnGenDefaultShopCalendarClick
                end
                object Label4: TUniLabel
                  Left = 8
                  Top = 66
                  Width = 55
                  Height = 13
                  Hint = ''
                  ShowHint = True
                  Caption = 'Days/Week'
                  TabOrder = 11
                end
                object dbeShiftsDefault: TUniDBEdit
                  Left = 74
                  Top = 14
                  Width = 84
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  DataField = 'SHIFTS'
                  DataSource = SrcParams
                  TabOrder = 0
                  OnChange = dbeShiftsDefaultChange
                end
                object DBEdit1: TUniDBEdit
                  Left = 74
                  Top = 38
                  Width = 84
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  DataField = 'HRS_DAY'
                  DataSource = SrcParams
                  TabOrder = 1
                end
                object dbeMfgDaysWeek: TUniDBEdit
                  Left = 74
                  Top = 83
                  Width = 84
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  DataField = 'MFG_DAYS_WEEK'
                  DataSource = SrcParams
                  TabOrder = 2
                end
                object dbeAssyDaysWeek: TUniDBEdit
                  Left = 74
                  Top = 107
                  Width = 84
                  Height = 21
                  Hint = ''
                  ShowHint = True
                  DataField = 'ASSY_DAYS_WEEK'
                  DataSource = SrcParams
                  TabOrder = 3
                end
              end
              object Panel3: TUniPanel
                Left = 0
                Top = 0
                Width = 397
                Height = 27
                Hint = ''
                ShowHint = True
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                Caption = ''
                object NavMainDefault: TUniDBNavigator
                  Left = 321
                  Top = 1
                  Width = 75
                  Height = 25
                  Hint = ''
                  ShowHint = True
                  DataSource = SrcParams
                  VisibleButtons = [nbPost, nbCancel, nbRefresh]
                  ConfirmDelete = False
                  Align = alRight
                  Anchors = [akTop, akRight, akBottom]
                  TabOrder = 0
                end
                object Panel12: TUniPanel
                  Left = 300
                  Top = 1
                  Width = 21
                  Height = 25
                  Hint = ''
                  ShowHint = True
                  Align = alRight
                  Anchors = [akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  object Shape3: TUniPanel
                    Left = 1
                    Top = 7
                    Width = 10
                    Height = 11
                    Hint = 'EPlant assigned its own schedule'
                    ShowHint = True
                    TabOrder = 1
                    Caption = ''
                  end
                end
              end
            end
            object TabEPlant: TUniTabSheet
              Hint = ''
              ShowHint = True
              ImageIndex = 1
              Caption = 'TabEPlant'
              object Panel10: TUniPanel
                Left = 0
                Top = 0
                Width = 397
                Height = 332
                Hint = ''
                ShowHint = True
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
                DesignSize = (
                  397
                  332)
                object Panel11: TUniPanel
                  Left = 1
                  Top = 1
                  Width = 395
                  Height = 27
                  Hint = ''
                  ShowHint = True
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  Caption = ''
                  object sbtnCopyFromDefault2: TUniSpeedButton
                    Left = 1
                    Top = 1
                    Width = 25
                    Height = 25
                    Hint = 'Copy from Default Schedule'
                    ShowHint = True
                    ParentShowHint = False
                    Glyph.Data = {
                      36060000424D3606000000000000360400002800000020000000100000000100
                      0800000000000002000000000000000000000001000000000000000000000000
                      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                      A6000020400000206000002080000020A0000020C0000020E000004000000040
                      20000040400000406000004080000040A0000040C0000040E000006000000060
                      20000060400000606000006080000060A0000060C0000060E000008000000080
                      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                      20004000400040006000400080004000A0004000C0004000E000402000004020
                      20004020400040206000402080004020A0004020C0004020E000404000004040
                      20004040400040406000404080004040A0004040C0004040E000406000004060
                      20004060400040606000406080004060A0004060C0004060E000408000004080
                      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                      20008000400080006000800080008000A0008000C0008000E000802000008020
                      20008020400080206000802080008020A0008020C0008020E000804000008040
                      20008040400080406000804080008040A0008040C0008040E000806000008060
                      20008060400080606000806080008060A0008060C0008060E000808000008080
                      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD000000
                      FDFDFDFDFDFDFDFDFDFDFDFDFD000000FDFDFDFDFDFDFDFDFDFDFDFD002A00FD
                      FDFDFDFDFDFDFDFDFDFDFDFD00A400FDFDFDFDFDFDFDFDFDFDFDFD1AB200FDFD
                      FDFDFDFDFDFDFDFDFDFDFD5BF700FDFDFDFDFDFDFDFDFDFDFDFDFD1ABA00FDFD
                      FDFDFDFDFDFDFDFDFDFDFD5B0700FDFDFDFDFDFDFDFDFDFDFDFDFD1ABA00FDFD
                      FDFD00FDFDFDFDFDFDFDFD5B0700FDFDFDFD00FDFDFDFDFDFDFDFD1ABE00FDFD
                      FDFD0000FDFDFDFDFDFDFD5B0800FDFDFDFD0000FDFDFDFDFDFDFD1AF6B200FD
                      FDFD002A00FDFDFDFDFDFD5BFFF700FDFDFD00A400FDFDFDFDFDFDFD1ABEB200
                      000000B22A00FDFDFDFDFDFD5B08F700000000F7A400FDFDFDFDFDFD1AF6BEBA
                      2A2AB2B2B22A00FDFDFDFDFD5BFF0807A4A4F7F7F7A400FDFDFDFDFDFD1AF6F6
                      BEBABABABAB22A00FDFDFDFDFD5BFFFF0807070707F7A400FDFDFDFDFDFD1A1A
                      F6F6F6BEBABA00FDFDFDFDFDFDFD5B5BFFFFFF08070700FDFDFDFDFDFDFDFDFD
                      1A1A1AF6BE00FDFDFDFDFDFDFDFDFDFD5B5B5BFF0800FDFDFDFDFDFDFDFDFDFD
                      FDFD1AF600FDFDFDFDFDFDFDFDFDFDFDFDFD5BFF00FDFDFDFDFDFDFDFDFDFDFD
                      FDFD1A00FDFDFDFDFDFDFDFDFDFDFDFDFDFD5B00FDFDFDFDFDFDFDFDFDFDFDFD
                      FDFD1AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD5BFDFDFDFDFDFDFD}
                    Caption = ''
                    ParentColor = False
                    Color = clWindow
                    OnClick = sbtnCopyFromDefaultClick
                  end
                  object navEplantParam: TUniDBNavigator
                    Left = 294
                    Top = 1
                    Width = 100
                    Height = 25
                    Hint = ''
                    ShowHint = True
                    DataSource = SrcEPlantMfgcellParam
                    VisibleButtons = [nbDelete, nbPost, nbCancel, nbRefresh]
                    ConfirmDelete = False
                    Align = alRight
                    Anchors = [akTop, akRight, akBottom]
                    TabOrder = 0
                  end
                  object Panel6: TUniPanel
                    Left = 273
                    Top = 1
                    Width = 21
                    Height = 25
                    Hint = ''
                    ShowHint = True
                    Align = alRight
                    Anchors = [akTop, akRight, akBottom]
                    TabOrder = 1
                    Caption = ''
                    object Shape2: TUniPanel
                      Left = 1
                      Top = 7
                      Width = 10
                      Height = 11
                      Hint = 'EPlant assigned its own schedule'
                      ShowHint = True
                      TabOrder = 1
                      Caption = ''
                    end
                  end
                end
                object GroupBox6: TUniGroupBox
                  Left = 3
                  Top = 31
                  Width = 394
                  Height = 92
                  Hint = ''
                  ShowHint = True
                  Caption = ' Calendar '
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                  object Label24: TUniLabel
                    Left = 8
                    Top = 18
                    Width = 51
                    Height = 13
                    Hint = ''
                    ShowHint = True
                    Caption = '# of Shifts'
                    TabOrder = 4
                  end
                  object Label25: TUniLabel
                    Left = 8
                    Top = 42
                    Width = 51
                    Height = 13
                    Hint = ''
                    ShowHint = True
                    Caption = 'Hours/Day'
                    TabOrder = 5
                  end
                  object Label26: TUniLabel
                    Left = 8
                    Top = 66
                    Width = 55
                    Height = 13
                    Hint = ''
                    ShowHint = True
                    Caption = 'Days/Week'
                    TabOrder = 6
                  end
                  object SpeedButton2: TUniSpeedButton
                    Left = 164
                    Top = 61
                    Width = 23
                    Height = 22
                    Hint = 'Define cell working shifts'
                    ShowHint = True
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0A09060483060
                      4830604830604830604830604830604830604830604830604830FF00FFFF00FF
                      FF00FFFF00FFFF00FFB0A090E0C8C0D0B8B0D0B8B0C0B0A0C0B0A0C0A8A0C0A8
                      90B0A090B0A090604830B0A090604830604830604830604830B0A090FFFFFFFF
                      F8FFD0B8B0404040E0C8C0C0A8A0F0D8D0F0D0B0B0A090604830B0A090E0C8C0
                      D0B8B0D0B8B0C0B0A0B0A090FFFFFFFFFFFFD0C0B0606060605850C0B0A0FFE0
                      D0F0D8C0C0A890604830B0A090FFFFFFFFF8FFD0B8B0FFF0F0B0A090E0D0D0D0
                      C0C0D0C0B0B0A8A0000000B0A090C0B0A0C0A8A0C0A890604830B0A090FFFFFF
                      C0B8C0000000000000C0A890FFFFFFFFFFFFD0C8C0FFFFFF807880504840FFF0
                      E0FFE0D0C0A8A0604830B0A090E0D0D0403830605850D0C0B0C0A8A0FFFFFFFF
                      FFFFD0C8C0FFFFFFF0E8F0100810E0D8D0FFE8E0C0A8A0604830C0A890FFFFFF
                      A098A0302820707870C0B0A0E0D8D0E0D0C0A098907060607060602020206060
                      50C0B0A0C0B0A0604830C0A8A0FFFFFFE0E0E0000000606860D0B0A0FFFFFFFF
                      FFFFA09890808080808080706060C0C0C0FFF0F0C0B0A0604830C0B0A0E0D8D0
                      707060302820D0C8C0D0B8A0FFFFFFFFFFFFE0D0C0FFFFFFFFFFFFD0C8C0FFFF
                      FFFFF8F0D0B8B0604830D0B0A0FFFFFFFFFFFF403830000000F0A890F0A890F0
                      A880F0A080E09870E08850E08050E07840E07040E07040D06030D0B8A0FFFFFF
                      FFFFFFE0D0C0FFFFFFF0A890FFC0A0FFC0A0FFB890FFB890FFA880FFA880F0A0
                      70F09870F09860D06830F0A890F0A890F0A880F0A080E09870F0A890F0A890F0
                      A890F0A880F0A080E09870E09060E08860E07840E07840E07040F0A890FFC0A0
                      FFC0A0FFB890FFB890FFA880FFA880F0A070F09870F09860D06830FF00FFFF00
                      FFFF00FFFF00FFFF00FFF0A890F0A890F0A890F0A880F0A080E09870E09060E0
                      8860E07840E07840E07040FF00FFFF00FFFF00FFFF00FFFF00FF}
                    Caption = ''
                    ParentColor = False
                    Color = clWindow
                    OnClick = SpeedButton2Click
                  end
                  object dbeShiftsEPlant: TUniDBEdit
                    Left = 74
                    Top = 14
                    Width = 84
                    Height = 21
                    Hint = ''
                    ShowHint = True
                    DataField = 'SHIFTS'
                    DataSource = SrcEPlantMfgcellParam
                    TabOrder = 0
                    OnChange = dbeShiftsEPlantChange
                  end
                  object DBEdit8: TUniDBEdit
                    Left = 74
                    Top = 38
                    Width = 84
                    Height = 21
                    Hint = ''
                    ShowHint = True
                    DataField = 'HRS_DAY'
                    DataSource = SrcEPlantMfgcellParam
                    TabOrder = 1
                  end
                  object DBEdit9: TUniDBEdit
                    Left = 74
                    Top = 62
                    Width = 84
                    Height = 21
                    Hint = ''
                    ShowHint = True
                    DataField = 'MFG_DAYS_WEEK'
                    DataSource = SrcEPlantMfgcellParam
                    TabOrder = 2
                  end
                end
                object GroupBox7: TUniGroupBox
                  Left = 3
                  Top = 125
                  Width = 394
                  Height = 135
                  Hint = ''
                  ShowHint = True
                  Caption = ' Shifts '
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  DesignSize = (
                    394
                    135)
                  object Label27: TUniLabel
                    Left = 8
                    Top = 31
                    Width = 40
                    Height = 13
                    Hint = ''
                    ShowHint = True
                    Caption = '1st Shift'
                    TabOrder = 9
                  end
                  object Label28: TUniLabel
                    Left = 8
                    Top = 56
                    Width = 43
                    Height = 13
                    Hint = ''
                    ShowHint = True
                    Caption = '2nd Shift'
                    TabOrder = 10
                  end
                  object Label29: TUniLabel
                    Left = 8
                    Top = 81
                    Width = 41
                    Height = 13
                    Hint = ''
                    ShowHint = True
                    Caption = '3rd Shift'
                    TabOrder = 11
                  end
                  object Label30: TUniLabel
                    Left = 168
                    Top = 12
                    Width = 41
                    Height = 13
                    Hint = ''
                    ShowHint = True
                    Caption = 'Duration'
                    TabOrder = 12
                  end
                  object Label31: TUniLabel
                    Left = 74
                    Top = 12
                    Width = 49
                    Height = 13
                    Hint = ''
                    ShowHint = True
                    Caption = 'Start Time'
                    TabOrder = 13
                  end
                  object Label32: TUniLabel
                    Left = 8
                    Top = 106
                    Width = 41
                    Height = 13
                    Hint = ''
                    ShowHint = True
                    Caption = '4th Shift'
                    TabOrder = 14
                  end
                  object DBEdit10: TUniDBEdit
                    Left = 168
                    Top = 28
                    Width = 207
                    Height = 19
                    Hint = ''
                    ShowHint = True
                    DataField = 'Duration1'
                    DataSource = SrcEPlantMfgcellParam
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object DBEdit11: TUniDBEdit
                    Left = 168
                    Top = 53
                    Width = 207
                    Height = 19
                    Hint = ''
                    ShowHint = True
                    DataField = 'Duration2'
                    DataSource = SrcEPlantMfgcellParam
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object DBEdit12: TUniDBEdit
                    Left = 168
                    Top = 78
                    Width = 207
                    Height = 19
                    Hint = ''
                    ShowHint = True
                    DataField = 'Duration3'
                    DataSource = SrcEPlantMfgcellParam
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object dbeStart1MfgCellEPlant: TUniDBEdit
                    Left = 74
                    Top = 27
                    Width = 84
                    Height = 21
                    Hint = ''
                    ShowHint = True
                    DataField = 'SHIFT_START1'
                    DataSource = SrcEPlantMfgcellParam
                    TabOrder = 3
                  end
                  object dbeStart2MfgCellEPlant: TUniDBEdit
                    Left = 74
                    Top = 52
                    Width = 84
                    Height = 21
                    Hint = ''
                    ShowHint = True
                    DataField = 'SHIFT_START2'
                    DataSource = SrcEPlantMfgcellParam
                    TabOrder = 4
                  end
                  object dbeStart3MfgCellEPlant: TUniDBEdit
                    Left = 74
                    Top = 77
                    Width = 84
                    Height = 21
                    Hint = ''
                    ShowHint = True
                    DataField = 'SHIFT_START3'
                    DataSource = SrcEPlantMfgcellParam
                    TabOrder = 5
                  end
                  object DBEdit16: TUniDBEdit
                    Left = 168
                    Top = 103
                    Width = 207
                    Height = 19
                    Hint = ''
                    ShowHint = True
                    DataField = 'Duration4'
                    DataSource = SrcEPlantMfgcellParam
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 6
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object dbeStart4MfgCellEPlant: TUniDBEdit
                    Left = 74
                    Top = 102
                    Width = 84
                    Height = 21
                    Hint = ''
                    ShowHint = True
                    DataField = 'SHIFT_START4'
                    DataSource = SrcEPlantMfgcellParam
                    TabOrder = 7
                  end
                end
                object dbchkDisableRTServerShiftReportEPlant: TUniDBCheckBox
                  Left = 3
                  Top = 266
                  Width = 165
                  Height = 17
                  Hint = 'Do not create RealTime shift report'
                  ShowHint = True
                  DataField = 'RTSERVER_DISABLE_SHIFT_REPORT'
                  DataSource = SrcEPlantMfgcellParam
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'Disable RealTime Shift Report'
                  TabOrder = 3
                end
              end
            end
          end
        end
      end
    end
    object tabMfgCell: TUniTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 1
      Caption = 'Manufacturing Cell'
      object Splitter1: TUniSplitter
        Left = 381
        Top = 0
        Width = 6
        Height = 364
        Hint = ''
        ShowHint = True
        Align = alRight
        ParentColor = False
        Color = clBtnFace
      end
      object dbgridMfgCell: TUniDBGrid
        Left = 0
        Top = 0
        Width = 381
        Height = 364
        Hint = ''
        ShowHint = True
        DataSource = SrcMfgCell
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTabs, dgCancelOnExit]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        OnDrawColumnCell = dbgridMfgCellDrawColumnCell
        Columns = <
          item
            FieldName = 'MFGCELL'
            Title.Caption = 'Mfg Cell'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'DESCRIP'
            Width = 196
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MFGTYPE'
            Title.Caption = 'Mfg Type'
            Width = 89
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
      object Panel1: TUniPanel
        Left = 387
        Top = 0
        Width = 295
        Height = 364
        Hint = ''
        ShowHint = True
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          295
          364)
        object Panel2: TUniPanel
          Left = 1
          Top = 1
          Width = 293
          Height = 27
          Hint = ''
          ShowHint = True
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object sbtnCopyFromDefault: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Copy from Default Schedule'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              0800000000000002000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
              FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD000000
              FDFDFDFDFDFDFDFDFDFDFDFDFD000000FDFDFDFDFDFDFDFDFDFDFDFD002A00FD
              FDFDFDFDFDFDFDFDFDFDFDFD00A400FDFDFDFDFDFDFDFDFDFDFDFD1AB200FDFD
              FDFDFDFDFDFDFDFDFDFDFD5BF700FDFDFDFDFDFDFDFDFDFDFDFDFD1ABA00FDFD
              FDFDFDFDFDFDFDFDFDFDFD5B0700FDFDFDFDFDFDFDFDFDFDFDFDFD1ABA00FDFD
              FDFD00FDFDFDFDFDFDFDFD5B0700FDFDFDFD00FDFDFDFDFDFDFDFD1ABE00FDFD
              FDFD0000FDFDFDFDFDFDFD5B0800FDFDFDFD0000FDFDFDFDFDFDFD1AF6B200FD
              FDFD002A00FDFDFDFDFDFD5BFFF700FDFDFD00A400FDFDFDFDFDFDFD1ABEB200
              000000B22A00FDFDFDFDFDFD5B08F700000000F7A400FDFDFDFDFDFD1AF6BEBA
              2A2AB2B2B22A00FDFDFDFDFD5BFF0807A4A4F7F7F7A400FDFDFDFDFDFD1AF6F6
              BEBABABABAB22A00FDFDFDFDFD5BFFFF0807070707F7A400FDFDFDFDFDFD1A1A
              F6F6F6BEBABA00FDFDFDFDFDFDFD5B5BFFFFFF08070700FDFDFDFDFDFDFDFDFD
              1A1A1AF6BE00FDFDFDFDFDFDFDFDFDFD5B5B5BFF0800FDFDFDFDFDFDFDFDFDFD
              FDFD1AF600FDFDFDFDFDFDFDFDFDFDFDFDFD5BFF00FDFDFDFDFDFDFDFDFDFDFD
              FDFD1A00FDFDFDFDFDFDFDFDFDFDFDFDFDFD5B00FDFDFDFDFDFDFDFDFDFDFDFD
              FDFD1AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD5BFDFDFDFDFDFDFD}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnCopyFromDefaultClick
          end
          object NavMfgCellParam: TUniDBNavigator
            Left = 192
            Top = 1
            Width = 100
            Height = 25
            Hint = ''
            ShowHint = True
            DataSource = SrcMfgCell_Param
            VisibleButtons = [nbDelete, nbPost, nbCancel, nbRefresh]
            ConfirmDelete = False
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
          object Panel9: TUniPanel
            Left = 156
            Top = 1
            Width = 36
            Height = 25
            Hint = ''
            ShowHint = True
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object Shape4: TUniPanel
              Left = 1
              Top = 7
              Width = 10
              Height = 11
              Hint = 'MfgCell assigned its own schedule'
              ShowHint = True
              TabOrder = 1
              Caption = ''
            end
            object Shape5: TUniPanel
              Left = 15
              Top = 7
              Width = 10
              Height = 11
              Hint = 'MfgCell associated with an EPlant assigned its own schedule'
              ShowHint = True
              TabOrder = 2
              Caption = ''
            end
          end
        end
        object GroupBox3: TUniGroupBox
          Left = 3
          Top = 29
          Width = 290
          Height = 91
          Hint = ''
          ShowHint = True
          Caption = ' Calendar '
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          object Label15: TUniLabel
            Left = 9
            Top = 18
            Width = 51
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = '# of Shifts'
            TabOrder = 4
          end
          object Label16: TUniLabel
            Left = 9
            Top = 42
            Width = 51
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = 'Hours/Day'
            TabOrder = 5
          end
          object Label19: TUniLabel
            Left = 9
            Top = 66
            Width = 55
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = 'Days/Week'
            TabOrder = 6
          end
          object sbtnMfgCellShopCalendar: TUniSpeedButton
            Left = 163
            Top = 62
            Width = 23
            Height = 22
            Hint = 'Define cell working shifts'
            ShowHint = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0A09060483060
              4830604830604830604830604830604830604830604830604830FF00FFFF00FF
              FF00FFFF00FFFF00FFB0A090E0C8C0D0B8B0D0B8B0C0B0A0C0B0A0C0A8A0C0A8
              90B0A090B0A090604830B0A090604830604830604830604830B0A090FFFFFFFF
              F8FFD0B8B0404040E0C8C0C0A8A0F0D8D0F0D0B0B0A090604830B0A090E0C8C0
              D0B8B0D0B8B0C0B0A0B0A090FFFFFFFFFFFFD0C0B0606060605850C0B0A0FFE0
              D0F0D8C0C0A890604830B0A090FFFFFFFFF8FFD0B8B0FFF0F0B0A090E0D0D0D0
              C0C0D0C0B0B0A8A0000000B0A090C0B0A0C0A8A0C0A890604830B0A090FFFFFF
              C0B8C0000000000000C0A890FFFFFFFFFFFFD0C8C0FFFFFF807880504840FFF0
              E0FFE0D0C0A8A0604830B0A090E0D0D0403830605850D0C0B0C0A8A0FFFFFFFF
              FFFFD0C8C0FFFFFFF0E8F0100810E0D8D0FFE8E0C0A8A0604830C0A890FFFFFF
              A098A0302820707870C0B0A0E0D8D0E0D0C0A098907060607060602020206060
              50C0B0A0C0B0A0604830C0A8A0FFFFFFE0E0E0000000606860D0B0A0FFFFFFFF
              FFFFA09890808080808080706060C0C0C0FFF0F0C0B0A0604830C0B0A0E0D8D0
              707060302820D0C8C0D0B8A0FFFFFFFFFFFFE0D0C0FFFFFFFFFFFFD0C8C0FFFF
              FFFFF8F0D0B8B0604830D0B0A0FFFFFFFFFFFF403830000000F0A890F0A890F0
              A880F0A080E09870E08850E08050E07840E07040E07040D06030D0B8A0FFFFFF
              FFFFFFE0D0C0FFFFFFF0A890FFC0A0FFC0A0FFB890FFB890FFA880FFA880F0A0
              70F09870F09860D06830F0A890F0A890F0A880F0A080E09870F0A890F0A890F0
              A890F0A880F0A080E09870E09060E08860E07840E07840E07040F0A890FFC0A0
              FFC0A0FFB890FFB890FFA880FFA880F0A070F09870F09860D06830FF00FFFF00
              FFFF00FFFF00FFFF00FFF0A890F0A890F0A890F0A880F0A080E09870E09060E0
              8860E07840E07840E07040FF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnMfgCellShopCalendarClick
          end
          object dbeShiftsMfgCell: TUniDBEdit
            Left = 74
            Top = 14
            Width = 84
            Height = 21
            Hint = ''
            ShowHint = True
            DataField = 'SHIFTS'
            DataSource = SrcMfgCell_Param
            TabOrder = 0
            OnChange = dbeShiftsDefaultChange
          end
          object DBEdit6: TUniDBEdit
            Left = 74
            Top = 38
            Width = 84
            Height = 21
            Hint = ''
            ShowHint = True
            DataField = 'HRS_DAY'
            DataSource = SrcMfgCell_Param
            TabOrder = 1
          end
          object DBEdit7: TUniDBEdit
            Left = 74
            Top = 62
            Width = 84
            Height = 21
            Hint = ''
            ShowHint = True
            DataField = 'MFG_DAYS_WEEK'
            DataSource = SrcMfgCell_Param
            TabOrder = 2
          end
        end
        object GroupBox4: TUniGroupBox
          Left = 3
          Top = 122
          Width = 290
          Height = 135
          Hint = ''
          ShowHint = True
          Caption = ' Shifts '
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          DesignSize = (
            290
            135)
          object Label12: TUniLabel
            Left = 7
            Top = 31
            Width = 40
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = '1st Shift'
            TabOrder = 9
          end
          object Label13: TUniLabel
            Left = 7
            Top = 56
            Width = 43
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = '2nd Shift'
            TabOrder = 10
          end
          object Label14: TUniLabel
            Left = 7
            Top = 81
            Width = 41
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = '3rd Shift'
            TabOrder = 11
          end
          object Label17: TUniLabel
            Left = 166
            Top = 12
            Width = 41
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = 'Duration'
            TabOrder = 12
          end
          object Label18: TUniLabel
            Left = 74
            Top = 12
            Width = 49
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = 'Start Time'
            TabOrder = 13
          end
          object Label20: TUniLabel
            Left = 7
            Top = 106
            Width = 41
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = '4th Shift'
            TabOrder = 14
          end
          object DBText4: TUniDBEdit
            Left = 166
            Top = 28
            Width = 114
            Height = 19
            Hint = ''
            ShowHint = True
            DataField = 'Duration1'
            DataSource = SrcMfgCell_Param
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
          end
          object DBText5: TUniDBEdit
            Left = 166
            Top = 53
            Width = 114
            Height = 19
            Hint = ''
            ShowHint = True
            DataField = 'Duration2'
            DataSource = SrcMfgCell_Param
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
          end
          object DBText6: TUniDBEdit
            Left = 166
            Top = 78
            Width = 114
            Height = 19
            Hint = ''
            ShowHint = True
            DataField = 'Duration3'
            DataSource = SrcMfgCell_Param
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
          end
          object dbeStart1MfgCell: TUniDBEdit
            Left = 74
            Top = 27
            Width = 84
            Height = 21
            Hint = ''
            ShowHint = True
            DataField = 'SHIFT_START1'
            DataSource = SrcMfgCell_Param
            TabOrder = 3
          end
          object dbeStart2MfgCell: TUniDBEdit
            Left = 74
            Top = 52
            Width = 84
            Height = 21
            Hint = ''
            ShowHint = True
            DataField = 'SHIFT_START2'
            DataSource = SrcMfgCell_Param
            TabOrder = 4
          end
          object dbeStart3MfgCell: TUniDBEdit
            Left = 74
            Top = 77
            Width = 84
            Height = 21
            Hint = ''
            ShowHint = True
            DataField = 'SHIFT_START3'
            DataSource = SrcMfgCell_Param
            TabOrder = 5
          end
          object dbeShift4Mfgcell: TUniDBEdit
            Left = 166
            Top = 103
            Width = 114
            Height = 19
            Hint = ''
            ShowHint = True
            DataField = 'Duration4'
            DataSource = SrcMfgCell_Param
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
          end
          object dbeStart4MfgCell: TUniDBEdit
            Left = 74
            Top = 102
            Width = 84
            Height = 21
            Hint = ''
            ShowHint = True
            DataField = 'SHIFT_START4'
            DataSource = SrcMfgCell_Param
            TabOrder = 7
          end
        end
        object dbchkMfgCellDisableRTServerShiftReport: TUniDBCheckBox
          Left = 6
          Top = 262
          Width = 165
          Height = 17
          Hint = 'Do not create RealTime shift report'
          ShowHint = True
          DataField = 'RTSERVER_DISABLE_SHIFT_REPORT'
          DataSource = SrcMfgCell_Param
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Disable RealTime Shift Report'
          TabOrder = 3
        end
      end
    end
    object TabWorkCenter: TUniTabSheet
      Hint = ''
      ShowHint = True
      ImageIndex = 2
      Caption = 'Work Center'
      object Panel4: TUniPanel
        Left = 0
        Top = 0
        Width = 682
        Height = 28
        Hint = ''
        ShowHint = True
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object NavWorkCenter: TUniDBNavigator
          Left = 488
          Top = 1
          Width = 193
          Height = 26
          Hint = ''
          ShowHint = True
          DataSource = wwSrcWorkCenter
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
        object Panel8: TUniPanel
          Left = 454
          Top = 1
          Width = 34
          Height = 26
          Hint = ''
          ShowHint = True
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Shape1: TUniPanel
            Left = 1
            Top = 8
            Width = 10
            Height = 11
            Hint = 'Work center assigned its own schedule'
            ShowHint = True
            TabOrder = 1
            Caption = ''
          end
          object Shape6: TUniPanel
            Left = 15
            Top = 8
            Width = 10
            Height = 11
            Hint = 'Work Center associated with a MfgCell assigned its own schedule'
            ShowHint = True
            TabOrder = 2
            Caption = ''
          end
        end
        object FlowPanel1: TUniScrollBox
          Left = 1
          Top = 1
          Width = 453
          Height = 26
          Hint = ''
          ShowHint = True
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 2
          ScrollHeight = 25
          ScrollWidth = 50
          object sbtnPkCenter: TUniSpeedButton
            Left = 0
            Top = 0
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
          object sbtnCopyToWorkcenterFromDefault: TUniSpeedButton
            Left = 25
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Copy from Default Schedule'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              0800000000000002000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
              FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD000000
              FDFDFDFDFDFDFDFDFDFDFDFDFD000000FDFDFDFDFDFDFDFDFDFDFDFD002A00FD
              FDFDFDFDFDFDFDFDFDFDFDFD00A400FDFDFDFDFDFDFDFDFDFDFDFD1AB200FDFD
              FDFDFDFDFDFDFDFDFDFDFD5BF700FDFDFDFDFDFDFDFDFDFDFDFDFD1ABA00FDFD
              FDFDFDFDFDFDFDFDFDFDFD5B0700FDFDFDFDFDFDFDFDFDFDFDFDFD1ABA00FDFD
              FDFD00FDFDFDFDFDFDFDFD5B0700FDFDFDFD00FDFDFDFDFDFDFDFD1ABE00FDFD
              FDFD0000FDFDFDFDFDFDFD5B0800FDFDFDFD0000FDFDFDFDFDFDFD1AF6B200FD
              FDFD002A00FDFDFDFDFDFD5BFFF700FDFDFD00A400FDFDFDFDFDFDFD1ABEB200
              000000B22A00FDFDFDFDFDFD5B08F700000000F7A400FDFDFDFDFDFD1AF6BEBA
              2A2AB2B2B22A00FDFDFDFDFD5BFF0807A4A4F7F7F7A400FDFDFDFDFDFD1AF6F6
              BEBABABABAB22A00FDFDFDFDFD5BFFFF0807070707F7A400FDFDFDFDFDFD1A1A
              F6F6F6BEBABA00FDFDFDFDFDFDFD5B5BFFFFFF08070700FDFDFDFDFDFDFDFDFD
              1A1A1AF6BE00FDFDFDFDFDFDFDFDFDFD5B5B5BFF0800FDFDFDFDFDFDFDFDFDFD
              FDFD1AF600FDFDFDFDFDFDFDFDFDFDFDFDFD5BFF00FDFDFDFDFDFDFDFDFDFDFD
              FDFD1A00FDFDFDFDFDFDFDFDFDFDFDFDFDFD5B00FDFDFDFDFDFDFDFDFDFDFDFD
              FDFD1AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD5BFDFDFDFDFDFDFD}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnCopyToWorkcenterFromDefaultClick
          end
        end
      end
      object Panel5: TUniPanel
        Left = 0
        Top = 28
        Width = 682
        Height = 336
        Hint = ''
        ShowHint = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 326
          Top = 1
          Width = 5
          Height = 334
          Hint = ''
          ShowHint = True
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object pnlWorkcenterLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 325
          Height = 334
          Hint = ''
          ShowHint = True
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object wwGridWorkCenter: TIQUniGridControl
            AlignWithMargins = True
            Left = 1
            Top = 6
            Width = 323
            Height = 324
            Margins.Left = 0
            Margins.Top = 5
            Margins.Right = 0
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            ShowHint = True
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 106
            IQComponents.Grid.Height = 238
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.ShowHint = True
            IQComponents.Grid.DataSource = wwSrcWorkCenter
            IQComponents.Grid.LoadMask.Message = 'Loading data...'
            IQComponents.Grid.Align = alClient
            IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
            IQComponents.Grid.TabOrder = 0
            IQComponents.Grid.OnDrawColumnCell = wwGridWorkCenterDBGridDrawColumnCell
            IQComponents.Navigator.Left = 410
            IQComponents.Navigator.Top = 0
            IQComponents.Navigator.Width = 241
            IQComponents.Navigator.Height = 25
            IQComponents.Navigator.Hint = ''
            IQComponents.Navigator.ShowHint = True
            IQComponents.Navigator.DataSource = wwSrcWorkCenter
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 106
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 238
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.ShowHint = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ShowHint = True
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = wwSrcWorkCenter
            Columns = <
              item
                FieldName = 'EQNO'
                Title.Caption = 'Work Center'
                Width = 91
                ReadOnly = True
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CNTR_DESC'
                Title.Caption = 'Work Center Description'
                Width = 154
                ReadOnly = True
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CNTR_TYPE'
                Title.Caption = 'Center Type'
                Width = 77
                ReadOnly = True
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'MFG_TYPE'
                Title.Caption = 'Mfg Type'
                Width = 70
                ReadOnly = True
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'MFGCELL'
                Title.Caption = 'Mfg Cell'
                Width = 105
                ReadOnly = True
                CheckBoxField.FieldValues = 'true;false'
              end>
            TabsVisible = True
            Marker = 0
          end
        end
        object Panel7: TUniPanel
          Left = 331
          Top = 1
          Width = 350
          Height = 334
          Hint = ''
          ShowHint = True
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object GroupBox5: TUniGroupBox
            AlignWithMargins = True
            Left = 4
            Top = 1
            Width = 342
            Height = 91
            Hint = ''
            Margins.Top = 0
            Margins.Bottom = 0
            ShowHint = True
            Caption = ' Calendar '
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            object Label21: TUniLabel
              Left = 9
              Top = 18
              Width = 51
              Height = 13
              Hint = ''
              ShowHint = True
              Caption = '# of Shifts'
              TabOrder = 4
            end
            object Label22: TUniLabel
              Left = 9
              Top = 42
              Width = 51
              Height = 13
              Hint = ''
              ShowHint = True
              Caption = 'Hours/Day'
              TabOrder = 5
            end
            object Label23: TUniLabel
              Left = 9
              Top = 66
              Width = 55
              Height = 13
              Hint = ''
              ShowHint = True
              Caption = 'Days/Week'
              TabOrder = 6
            end
            object sbtnWorkCenterShopCalendar: TUniSpeedButton
              Left = 164
              Top = 62
              Width = 23
              Height = 22
              Hint = 'Define work center working shifts'
              ShowHint = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0A09060483060
                4830604830604830604830604830604830604830604830604830FF00FFFF00FF
                FF00FFFF00FFFF00FFB0A090E0C8C0D0B8B0D0B8B0C0B0A0C0B0A0C0A8A0C0A8
                90B0A090B0A090604830B0A090604830604830604830604830B0A090FFFFFFFF
                F8FFD0B8B0404040E0C8C0C0A8A0F0D8D0F0D0B0B0A090604830B0A090E0C8C0
                D0B8B0D0B8B0C0B0A0B0A090FFFFFFFFFFFFD0C0B0606060605850C0B0A0FFE0
                D0F0D8C0C0A890604830B0A090FFFFFFFFF8FFD0B8B0FFF0F0B0A090E0D0D0D0
                C0C0D0C0B0B0A8A0000000B0A090C0B0A0C0A8A0C0A890604830B0A090FFFFFF
                C0B8C0000000000000C0A890FFFFFFFFFFFFD0C8C0FFFFFF807880504840FFF0
                E0FFE0D0C0A8A0604830B0A090E0D0D0403830605850D0C0B0C0A8A0FFFFFFFF
                FFFFD0C8C0FFFFFFF0E8F0100810E0D8D0FFE8E0C0A8A0604830C0A890FFFFFF
                A098A0302820707870C0B0A0E0D8D0E0D0C0A098907060607060602020206060
                50C0B0A0C0B0A0604830C0A8A0FFFFFFE0E0E0000000606860D0B0A0FFFFFFFF
                FFFFA09890808080808080706060C0C0C0FFF0F0C0B0A0604830C0B0A0E0D8D0
                707060302820D0C8C0D0B8A0FFFFFFFFFFFFE0D0C0FFFFFFFFFFFFD0C8C0FFFF
                FFFFF8F0D0B8B0604830D0B0A0FFFFFFFFFFFF403830000000F0A890F0A890F0
                A880F0A080E09870E08850E08050E07840E07040E07040D06030D0B8A0FFFFFF
                FFFFFFE0D0C0FFFFFFF0A890FFC0A0FFC0A0FFB890FFB890FFA880FFA880F0A0
                70F09870F09860D06830F0A890F0A890F0A880F0A080E09870F0A890F0A890F0
                A890F0A880F0A080E09870E09060E08860E07840E07840E07040F0A890FFC0A0
                FFC0A0FFB890FFB890FFA880FFA880F0A070F09870F09860D06830FF00FFFF00
                FFFF00FFFF00FFFF00FFF0A890F0A890F0A890F0A880F0A080E09870E09060E0
                8860E07840E07840E07040FF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = sbtnWorkCenterShopCalendarClick
            end
            object DBEdit2: TUniDBEdit
              Left = 74
              Top = 14
              Width = 84
              Height = 21
              Hint = ''
              ShowHint = True
              DataField = 'SHIFTS'
              DataSource = wwSrcWorkCenter
              TabOrder = 0
              OnChange = dbeShiftsDefaultChange
            end
            object DBEdit3: TUniDBEdit
              Left = 74
              Top = 38
              Width = 84
              Height = 21
              Hint = ''
              ShowHint = True
              DataField = 'HRS_DAY'
              DataSource = wwSrcWorkCenter
              TabOrder = 1
            end
            object DBEdit4: TUniDBEdit
              Left = 74
              Top = 62
              Width = 84
              Height = 21
              Hint = ''
              ShowHint = True
              DataField = 'MFG_DAYS_WEEK'
              DataSource = wwSrcWorkCenter
              TabOrder = 2
            end
          end
        end
      end
    end
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 21
    Top = 223
  end
  object TblParams: TFDTable
    BeforePost = TblParamsBeforePost
    AfterPost = TblParamsAfterPost
    OnCalcFields = TblParamsCalcFields
    OnNewRecord = TblParamsNewRecord
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEUpdate, uvUpdateMode]
    UpdateOptions.UpdateTableName = 'PARAMS'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'PARAMS'
    Left = 20
    Top = 244
    object TblParamsSCHED_SCOPE: TBCDField
      FieldName = 'SCHED_SCOPE'
      Size = 0
    end
    object TblParamsMFG_SCOPE: TBCDField
      FieldName = 'MFG_SCOPE'
      Size = 0
    end
    object TblParamsSHIFTS: TBCDField
      DisplayLabel = 'Number of Shifts'
      FieldName = 'SHIFTS'
      DisplayFormat = '0'
      EditFormat = '0'
      MaxValue = 4.000000000000000000
      MinValue = 1.000000000000000000
      Size = 0
    end
    object TblParamsSHIFT_START1: TStringField
      DisplayLabel = 'Shift 1 Start-Time'
      FieldName = 'SHIFT_START1'
      OnValidate = TblParamsSHIFT_START1Validate
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object TblParamsSHIFT_START2: TStringField
      DisplayLabel = 'Shift 2 Start-Time'
      FieldName = 'SHIFT_START2'
      OnValidate = TblParamsSHIFT_START1Validate
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object TblParamsSHIFT_START3: TStringField
      DisplayLabel = 'Shift 3 Start-Time'
      FieldName = 'SHIFT_START3'
      OnValidate = TblParamsSHIFT_START1Validate
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object TblParamsSHIFT_START4: TStringField
      DisplayLabel = 'Shift 4 Start-Time'
      FieldName = 'SHIFT_START4'
      OnValidate = TblParamsSHIFT_START1Validate
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object TblParamsMFG_DAYS_WEEK: TBCDField
      DisplayLabel = 'MFG Centers Days/Week'
      FieldName = 'MFG_DAYS_WEEK'
      MaxValue = 7.000000000000000000
      MinValue = 1.000000000000000000
      Size = 0
    end
    object TblParamsASSY_DAYS_WEEK: TBCDField
      DisplayLabel = 'ASSY Centers Days/Week'
      FieldName = 'ASSY_DAYS_WEEK'
      MaxValue = 7.000000000000000000
      MinValue = 1.000000000000000000
      Size = 0
    end
    object TblParamsSCHED_POOL_OVERRIDE: TStringField
      FieldName = 'SCHED_POOL_OVERRIDE'
      Size = 1
    end
    object TblParamsMFG_SHIFT1: TStringField
      FieldName = 'MFG_SHIFT1'
      Size = 1
    end
    object TblParamsMFG_SHIFT2: TStringField
      FieldName = 'MFG_SHIFT2'
      Size = 1
    end
    object TblParamsMFG_SHIFT3: TStringField
      FieldName = 'MFG_SHIFT3'
      Size = 1
    end
    object TblParamsMFG_SHIFT4: TStringField
      FieldName = 'MFG_SHIFT4'
      Size = 1
    end
    object TblParamsASSY_SHIFT1: TStringField
      FieldName = 'ASSY_SHIFT1'
      Size = 1
    end
    object TblParamsASSY_SHIFT2: TStringField
      FieldName = 'ASSY_SHIFT2'
      Size = 1
    end
    object TblParamsASSY_SHIFT3: TStringField
      FieldName = 'ASSY_SHIFT3'
      Size = 1
    end
    object TblParamsASSY_SHIFT4: TStringField
      FieldName = 'ASSY_SHIFT4'
      Size = 1
    end
    object TblParamsHRS_DAY: TBCDField
      ConstraintErrorMessage = 'Hours / Day must be greater than 0 and less or equal to 24 hrs'
      DisplayLabel = 'Hours / Day'
      FieldName = 'HRS_DAY'
      MaxValue = 24.000000000000000000
      Size = 2
    end
    object TblParamsDuration1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration1'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object TblParamsDuration2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration2'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object TblParamsDuration3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration3'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object TblParamsDuration4: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration4'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object TblParamsRTSERVER_DISABLE_SHIFT_REPORT: TStringField
      FieldName = 'RTSERVER_DISABLE_SHIFT_REPORT'
      Size = 1
    end
    object TblParamsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'SetDefaultCalendar1'
      'AddHolidays1'
      'ScheduledHolidays1'
      'STDLabourCapacity1'
      'TblParams'
      'TblMfgCell_Param'
      'NavMainDefault'
      'NavMfgCellParam'
      'sbtnCopyFromDefault'
      'SetCalendarForSelectedMfgCell1'
      'SetCalendarforALLMfgCells1'
      'sbtnMfgDefaultShopCalendar'
      'sbtnGenDefaultShopCalendar'
      'sbtnMfgCellShopCalendar'
      'dbchkDefaultDisableRTServerShiftReport'
      'dbchkMfgCellDisableRTServerShiftReport')
    SecurityCode = 'SHOP_SETUP'
    Left = 9
    Top = 309
  end
  object MainMenu1: TUniMainMenu
    Left = 37
    Top = 309
    object File1: TUniMenuItem
      Caption = '&File'
      object STDLabourCapacity1: TUniMenuItem
        Caption = 'STD Labor Capacity'
        OnClick = STDLabourCapacity1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Calendar1: TUniMenuItem
      Caption = '&Calendar'
      object SetDefaultCalendar1: TUniMenuItem
        Caption = 'Set &Default Calendar'
        OnClick = SetDefaultCalendar1Click
      end
      object AddHolidays1: TUniMenuItem
        Caption = 'Add &Holidays'
        OnClick = btnHolidaysClick
      end
      object ScheduleDaysOff1: TUniMenuItem
        Caption = '&Schedule Days Off'
        OnClick = ScheduledHolidays1Click
      end
    end
    object Report1: TUniMenuItem
      Caption = '&Report'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
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
    ModuleName = 'Shop Setup'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197569 $'
    BuildVersion = '176554'
    Left = 65
    Top = 309
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'Shop_SetUp'
    WebUse = False
    TouchScreen = False
    Left = 93
    Top = 309
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 121
    Top = 309
  end
  object SrcMfgCell: TDataSource
    DataSet = QryMfgCell
    OnDataChange = SrcMfgCellDataChange
    Left = 51
    Top = 223
  end
  object SrcMfgCell_Param: TDataSource
    DataSet = TblMfgCell_Param
    Left = 80
    Top = 223
  end
  object TblMfgCell_Param: TFDTable
    BeforePost = TblMfgCell_ParamBeforePost
    AfterPost = TblMfgCell_ParamAfterPost
    BeforeDelete = TblMfgCell_ParamBeforeDelete
    AfterDelete = TblMfgCell_ParamAfterPost
    OnCalcFields = TblParamsCalcFields
    OnNewRecord = TblParamsNewRecord
    IndexFieldNames = 'ID'
    MasterSource = SrcMfgCell
    MasterFields = 'MFGCELL_PARAM_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'MFGCELL_PARAM'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'MFGCELL_PARAM'
    Left = 80
    Top = 244
    object TblMfgCell_ParamID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblMfgCell_ParamDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 35
    end
    object TblMfgCell_ParamSHIFTS: TBCDField
      DisplayLabel = '# of Shifts'
      FieldName = 'SHIFTS'
      Required = True
      MaxValue = 4.000000000000000000
      MinValue = 1.000000000000000000
      Size = 0
    end
    object TblMfgCell_ParamSHIFT_START1: TStringField
      DisplayLabel = '1st Shift'
      FieldName = 'SHIFT_START1'
      OnValidate = TblParamsSHIFT_START1Validate
      EditMask = '!90:00:00;1;_'
      FixedChar = True
      Size = 8
    end
    object TblMfgCell_ParamSHIFT_START2: TStringField
      DisplayLabel = '2nd Shift'
      FieldName = 'SHIFT_START2'
      OnValidate = TblParamsSHIFT_START1Validate
      EditMask = '!90:00:00;1;_'
      FixedChar = True
      Size = 8
    end
    object TblMfgCell_ParamSHIFT_START3: TStringField
      DisplayLabel = '3rd Shift'
      FieldName = 'SHIFT_START3'
      OnValidate = TblParamsSHIFT_START1Validate
      EditMask = '!90:00:00;1;_'
      FixedChar = True
      Size = 8
    end
    object TblMfgCell_ParamSHIFT_START4: TStringField
      DisplayLabel = '4th Shift'
      FieldName = 'SHIFT_START4'
      OnValidate = TblParamsSHIFT_START1Validate
      EditMask = '!90:00:00;1;_'
      FixedChar = True
      Size = 8
    end
    object TblMfgCell_ParamMFG_DAYS_WEEK: TBCDField
      DisplayLabel = 'Days/Week'
      FieldName = 'MFG_DAYS_WEEK'
      Required = True
      MaxValue = 7.000000000000000000
      MinValue = 1.000000000000000000
      Size = 0
    end
    object TblMfgCell_ParamMFG_SHIFT1: TStringField
      DisplayLabel = 'Working 1st'
      FieldName = 'MFG_SHIFT1'
      Size = 1
    end
    object TblMfgCell_ParamMFG_SHIFT2: TStringField
      DisplayLabel = 'Working 2nd'
      FieldName = 'MFG_SHIFT2'
      Size = 1
    end
    object TblMfgCell_ParamMFG_SHIFT3: TStringField
      DisplayLabel = 'Working 3rd'
      FieldName = 'MFG_SHIFT3'
      Size = 1
    end
    object TblMfgCell_ParamMFG_SHIFT4: TStringField
      DisplayLabel = 'Working 4th'
      FieldName = 'MFG_SHIFT4'
      Size = 1
    end
    object TblMfgCell_ParamHRS_DAY: TBCDField
      DisplayLabel = 'Hours/Day'
      FieldName = 'HRS_DAY'
      Required = True
      MaxValue = 24.000000000000000000
      MinValue = 1.000000000000000000
      Size = 2
    end
    object TblMfgCell_ParamSCHED_SCOPE: TBCDField
      DisplayLabel = 'Sched Scope'
      FieldName = 'SCHED_SCOPE'
      Size = 0
    end
    object TblMfgCell_ParamMFG_SCOPE: TBCDField
      DisplayLabel = 'Mfg Scope'
      FieldName = 'MFG_SCOPE'
      Size = 0
    end
    object TblMfgCell_ParamDuration31Default: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration1'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object TblMfgCell_ParamDuration21Default: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration2'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object TblMfgCell_ParamDuration1Default: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration3'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object TblMfgCell_ParamDuration4: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration4'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object TblMfgCell_ParamRTSERVER_DISABLE_SHIFT_REPORT: TStringField
      FieldName = 'RTSERVER_DISABLE_SHIFT_REPORT'
      Size = 1
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 7
    Top = 337
    object SetCalendarForSelectedMfgCell1: TUniMenuItem
      Caption = 'Set Calendar for Selected MfgCell'
      OnClick = SetCalendarForSelectedMfgCell1Click
    end
    object SetCalendarforALLMfgCells1: TUniMenuItem
      Caption = 'Set Calendar for ALL MfgCells'
      OnClick = SetCalendarforALLMfgCells1Click
    end
  end
  object wwSrcWorkCenter: TDataSource
    DataSet = wwQryWorkCenter
    Left = 115
    Top = 223
  end
  object wwQryWorkCenter: TFDQuery
    BeforeEdit = wwQryWorkCenterBeforeEdit
    BeforePost = wwQryWorkCenterBeforePost
    AfterPost = ApplyUpdates
    BeforeRefresh = wwQryWorkCenterBeforeRefresh
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'WORK_CENTER'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLWorkCenter
    SQL.Strings = (
      'select id, '
      '       eqno, '
      '       cntr_type, '
      '       mfg_type, '
      '       mfgcell, '
      '       cntr_desc,'
      '       shifts,'
      '       hrs_day,'
      '       mfg_days_week,'
      
        '       iqcalendar.get_mfgcell_param_id( mfgcell_id ) as mfgcell_' +
        'param_id '
      '  from work_center'
      ' where nvl(pk_hide,'#39'N'#39') <> '#39'Y'#39
      ' order by eqno')
    Left = 115
    Top = 249
    object wwQryWorkCenterEQNO: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 13
      FieldName = 'EQNO'
      Origin = 'WORK_CENTER.EQNO'
      ReadOnly = True
      Size = 60
    end
    object wwQryWorkCenterCNTR_DESC: TStringField
      DisplayLabel = 'Work Center Description'
      DisplayWidth = 22
      FieldName = 'CNTR_DESC'
      Origin = 'IQ.WORK_CENTER.CNTR_DESC'
      ReadOnly = True
      FixedChar = True
      Size = 250
    end
    object wwQryWorkCenterCNTR_TYPE: TStringField
      DisplayLabel = 'Center Type'
      DisplayWidth = 11
      FieldName = 'CNTR_TYPE'
      Origin = 'WORK_CENTER.CNTR_TYPE'
      ReadOnly = True
    end
    object wwQryWorkCenterMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      Origin = 'WORK_CENTER.MFG_TYPE'
      ReadOnly = True
      Size = 10
    end
    object wwQryWorkCenterMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Origin = 'WORK_CENTER.MFGCELL'
      ReadOnly = True
      Size = 15
    end
    object wwQryWorkCenterID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'WORK_CENTER.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object wwQryWorkCenterSHIFTS: TBCDField
      FieldName = 'SHIFTS'
      Size = 0
    end
    object wwQryWorkCenterHRS_DAY: TBCDField
      FieldName = 'HRS_DAY'
      Size = 2
    end
    object wwQryWorkCenterMFG_DAYS_WEEK: TBCDField
      FieldName = 'MFG_DAYS_WEEK'
      Size = 0
    end
    object wwQryWorkCenterMFGCELL_PARAM_ID: TFMTBCDField
      FieldName = 'MFGCELL_PARAM_ID'
      Visible = False
      Size = 38
    end
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
    Left = 157
    Top = 223
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
  object UpdateSQLWorkCenter: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into work_center'
      '  (SHIFTS, HRS_DAY, MFG_DAYS_WEEK)'
      'values'
      '  (:SHIFTS, :HRS_DAY, :MFG_DAYS_WEEK)')
    ModifySQL.Strings = (
      'update work_center'
      'set'
      '  SHIFTS = :SHIFTS,'
      '  HRS_DAY = :HRS_DAY,'
      '  MFG_DAYS_WEEK = :MFG_DAYS_WEEK'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from work_center'
      'where'
      '  ID = :OLD_ID')
    Left = 114
    Top = 276
  end
  object PopupMenu2: TUniPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 40
    Top = 336
    object SetCalendarforSelectedWorkCenter1: TUniMenuItem
      Caption = 'Set Calendar for Selected Work Center'
      OnClick = SetCalendarforSelectedWorkCenter1Click
    end
  end
  object SrcOrigin: TDataSource
    DataSet = QryOrigin
    OnDataChange = SrcOriginDataChange
    Left = 25
    Top = 128
  end
  object QryOrigin: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'EPLANT'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select '#39'System'#39'  as origin,'
      '       '#39'Default'#39' as source,'
      '       0         as id,'
      '       0         as mfgcell_param_id,'
      '       1         as sort'
      '  from dual'
      ''
      'union all'
      ''
      'select '#39'EPlant'#39' as origin,'
      '       name as source,'
      '       id,'
      '       mfgcell_param_id,'
      '       2 as sort'
      '  from eplant'
      '  '
      'order by 4, 2')
    Left = 24
    Top = 152
    object QryOriginORIGIN: TStringField
      DisplayLabel = 'Origin'
      DisplayWidth = 7
      FieldName = 'ORIGIN'
      FixedChar = True
      Size = 6
    end
    object QryOriginSOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 30
      FieldName = 'SOURCE'
      Size = 30
    end
    object QryOriginID: TFMTBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 38
    end
    object QryOriginSORT: TFMTBCDField
      FieldName = 'SORT'
      Visible = False
      Size = 38
    end
    object QryOriginMFGCELL_PARAM_ID: TFMTBCDField
      FieldName = 'MFGCELL_PARAM_ID'
      Visible = False
      Size = 38
    end
  end
  object SrcEPlantMfgcellParam: TDataSource
    DataSet = TblMfgCell_ParamEPlant
    Left = 64
    Top = 128
  end
  object TblMfgCell_ParamEPlant: TFDTable
    BeforePost = TblMfgCell_ParamEPlantBeforePost
    AfterPost = TblMfgCell_ParamEPlantAfterPost
    BeforeDelete = TblMfgCell_ParamEPlantBeforeDelete
    AfterDelete = TblMfgCell_ParamEPlantAfterPost
    OnCalcFields = TblParamsCalcFields
    OnNewRecord = TblParamsNewRecord
    IndexFieldNames = 'ID'
    MasterSource = SrcOrigin
    MasterFields = 'MFGCELL_PARAM_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'MFGCELL_PARAM'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'MFGCELL_PARAM'
    Left = 64
    Top = 151
    object TblMfgCell_ParamEPlantID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblMfgCell_ParamEPlantDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 35
    end
    object TblMfgCell_ParamEPlantSHIFTS: TBCDField
      DisplayLabel = '# of Shifts'
      FieldName = 'SHIFTS'
      Required = True
      MaxValue = 4.000000000000000000
      MinValue = 1.000000000000000000
      Size = 0
    end
    object TblMfgCell_ParamEPlantSHIFT_START1: TStringField
      DisplayLabel = '1st Shift'
      FieldName = 'SHIFT_START1'
      OnValidate = TblParamsSHIFT_START1Validate
      EditMask = '!90:00:00;1;_'
      FixedChar = True
      Size = 8
    end
    object TblMfgCell_ParamEPlantSHIFT_START2: TStringField
      DisplayLabel = '2nd Shift'
      FieldName = 'SHIFT_START2'
      OnValidate = TblParamsSHIFT_START1Validate
      EditMask = '!90:00:00;1;_'
      FixedChar = True
      Size = 8
    end
    object TblMfgCell_ParamEPlantSHIFT_START3: TStringField
      DisplayLabel = '3rd Shift'
      FieldName = 'SHIFT_START3'
      OnValidate = TblParamsSHIFT_START1Validate
      EditMask = '!90:00:00;1;_'
      FixedChar = True
      Size = 8
    end
    object TblMfgCell_ParamEPlantSHIFT_START4: TStringField
      DisplayLabel = '4th Shift'
      FieldName = 'SHIFT_START4'
      OnValidate = TblParamsSHIFT_START1Validate
      EditMask = '!90:00:00;1;_'
      FixedChar = True
      Size = 8
    end
    object TblMfgCell_ParamEPlantMFG_DAYS_WEEK: TBCDField
      DisplayLabel = 'Days/Week'
      FieldName = 'MFG_DAYS_WEEK'
      Required = True
      MaxValue = 7.000000000000000000
      MinValue = 1.000000000000000000
      Size = 0
    end
    object TblMfgCell_ParamEPlantMFG_SHIFT1: TStringField
      DisplayLabel = 'Working 1st'
      FieldName = 'MFG_SHIFT1'
      Size = 1
    end
    object TblMfgCell_ParamEPlantMFG_SHIFT2: TStringField
      DisplayLabel = 'Working 2nd'
      FieldName = 'MFG_SHIFT2'
      Size = 1
    end
    object TblMfgCell_ParamEPlantMFG_SHIFT3: TStringField
      DisplayLabel = 'Working 3rd'
      FieldName = 'MFG_SHIFT3'
      Size = 1
    end
    object TblMfgCell_ParamEPlantMFG_SHIFT4: TStringField
      DisplayLabel = 'Working 4th'
      FieldName = 'MFG_SHIFT4'
      Size = 1
    end
    object TblMfgCell_ParamEPlantHRS_DAY: TBCDField
      DisplayLabel = 'Hours/Day'
      FieldName = 'HRS_DAY'
      Required = True
      MaxValue = 24.000000000000000000
      MinValue = 1.000000000000000000
      Size = 2
    end
    object TblMfgCell_ParamEPlantSCHED_SCOPE: TBCDField
      DisplayLabel = 'Sched Scope'
      FieldName = 'SCHED_SCOPE'
      Size = 0
    end
    object TblMfgCell_ParamEPlantMFG_SCOPE: TBCDField
      DisplayLabel = 'Mfg Scope'
      FieldName = 'MFG_SCOPE'
      Size = 0
    end
    object TblMfgCell_ParamEPlantDuration31Default: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration1'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object TblMfgCell_ParamEPlantDuration21Default: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration2'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object TblMfgCell_ParamEPlantDuration1Default: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration3'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object TblMfgCell_ParamEPlantDuration4: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration4'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object TblMfgCell_ParamEPlantRTSERVER_DISABLE_SHIFT_REPORT: TStringField
      FieldName = 'RTSERVER_DISABLE_SHIFT_REPORT'
      Size = 1
    end
  end
  object UpdateSQLOrigin: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into eplant'
      '  (MFGCELL_PARAM_ID)'
      'values'
      '  (:MFGCELL_PARAM_ID)')
    ModifySQL.Strings = (
      'update eplant'
      'set'
      '  MFGCELL_PARAM_ID = :MFGCELL_PARAM_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from eplant'
      'where'
      '  ID = :OLD_ID')
    Left = 24
    Top = 180
  end
  object QryMfgCell: TFDQuery
    BeforeInsert = QryMfgCellBeforeInsert
    OnCalcFields = QryMfgCellCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'MFGCELL'
    SQL.Strings = (
      'Select * from MFGCell order by MFGCell')
    Left = 384
    Top = 24
    object QryMfgCellMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Origin = 'MFGCELL'
      Required = True
      FixedChar = True
      Size = 15
    end
    object QryMfgCellDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      FixedChar = True
      Size = 25
    end
    object QryMfgCellMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      Origin = 'MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object QryMfgCellEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object QryMfgCellID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryMfgCellMFGCELL_PARAM_ID: TBCDField
      FieldName = 'MFGCELL_PARAM_ID'
      Origin = 'MFGCELL_PARAM_ID'
      Precision = 15
      Size = 0
    end
    object QryMfgCellPROD_REP_METHOD: TStringField
      FieldName = 'PROD_REP_METHOD'
      Origin = 'PROD_REP_METHOD'
      Size = 1
    end
    object QryMfgCellEPlant_Mfgcell_Param_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EPlant_Mfgcell_Param_ID'
      Calculated = True
    end
  end
end
