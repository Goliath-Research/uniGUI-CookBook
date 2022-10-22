object FrmTlParam: TFrmTlParam
  Left = 0
  Top = 0
  HelpContext = 23510
  ClientHeight = 402
  ClientWidth = 739
  Caption = 'Project Manager Setup'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter3: TUniSplitter
    Left = 264
    Top = 0
    Width = 6
    Height = 402
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object PnlEPlant: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 264
    Height = 402
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object wwDBGridOrigin: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 262
      Height = 400
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 45
      IQComponents.Grid.Height = 314
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcOrigin
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
      IQComponents.Navigator.DataSource = SrcOrigin
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 45
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 314
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcOrigin
      Columns = <
        item
          FieldName = 'ORIGIN'
          Title.Caption = 'Origin'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SOURCE'
          Title.Caption = 'Source'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object PnlDataControls: TUniPanel
    Tag = 1999
    Left = 270
    Top = 0
    Width = 469
    Height = 402
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 467
      Height = 400
      Hint = ''
      ActivePage = TabParams
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabParams: TUniTabSheet
        Hint = ''
        Caption = 'Parameters'
        object PnlParams: TUniPanel
          Left = 0
          Top = 0
          Width = 459
          Height = 372
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object bvSpacer1: TUniPanel
            Left = 1
            Top = 133
            Width = 457
            Height = 8
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            Caption = ''
          end
          object gbCalendar: TUniGroupBox
            Left = 1
            Top = 28
            Width = 457
            Height = 105
            Hint = ''
            Caption = ' Calendar '
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            object PnlCalendarClient01: TUniPanel
              Left = 2
              Top = 15
              Width = 453
              Height = 88
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter1: TUniSplitter
                Left = 130
                Top = 1
                Width = 6
                Height = 86
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlCalendarLeft01: TUniPanel
                Left = 1
                Top = 1
                Width = 129
                Height = 86
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label1: TUniLabel
                  Left = 8
                  Top = 11
                  Width = 80
                  Height = 13
                  Hint = ''
                  Caption = 'Number of Shifts'
                  TabOrder = 1
                end
                object Label6: TUniLabel
                  Left = 8
                  Top = 35
                  Width = 69
                  Height = 13
                  Hint = ''
                  Caption = 'Hours Per Day'
                  TabOrder = 2
                end
                object Label7: TUniLabel
                  Left = 8
                  Top = 59
                  Width = 73
                  Height = 13
                  Hint = ''
                  Caption = 'Days Per Week'
                  TabOrder = 3
                end
              end
              object PnlCalendarClient02: TUniPanel
                Left = 136
                Top = 1
                Width = 316
                Height = 86
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object sbtnDaysPerWeek: TUniSpeedButton
                  Left = 36
                  Top = 56
                  Width = 23
                  Height = 22
                  Hint = 'Define week days'
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
                  OnClick = sbtnDaysPerWeekClick
                end
                object dbeNumberOfShifts: TUniDBEdit
                  Left = 1
                  Top = 8
                  Width = 30
                  Height = 21
                  Hint = ''
                  DataField = 'SHIFTS'
                  DataSource = SrcParam
                  TabOrder = 0
                  OnChange = dbeNumberOfShiftsChange
                end
                object dbeHrsPerDay: TUniDBEdit
                  Left = 1
                  Top = 32
                  Width = 69
                  Height = 21
                  Hint = ''
                  DataField = 'HRS_DAY'
                  DataSource = SrcParam
                  TabOrder = 1
                end
                object dbeDaysPerWeek: TUniDBEdit
                  Left = 1
                  Top = 56
                  Width = 30
                  Height = 21
                  Hint = ''
                  DataField = 'DAYS_WEEK'
                  DataSource = SrcParam
                  TabOrder = 2
                end
              end
            end
          end
          object gbShifts: TUniGroupBox
            Left = 1
            Top = 141
            Width = 457
            Height = 160
            Hint = ''
            Caption = ' Shifts '
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            object PnlShiftsClient01: TUniPanel
              Left = 2
              Top = 15
              Width = 453
              Height = 143
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter2: TUniSplitter
                Left = 130
                Top = 1
                Width = 6
                Height = 141
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlShiftsLeft01: TUniPanel
                Left = 1
                Top = 1
                Width = 129
                Height = 141
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object lblShift1Start: TUniLabel
                  Left = 8
                  Top = 27
                  Width = 58
                  Height = 13
                  Hint = ''
                  Caption = 'Shift 1 Start'
                  TabOrder = 1
                end
                object lblShift2Start: TUniLabel
                  Left = 8
                  Top = 51
                  Width = 58
                  Height = 13
                  Hint = ''
                  Caption = 'Shift 2 Start'
                  TabOrder = 2
                end
                object lblShift3Start: TUniLabel
                  Left = 8
                  Top = 75
                  Width = 58
                  Height = 13
                  Hint = ''
                  Caption = 'Shift 3 Start'
                  TabOrder = 3
                end
                object lblShift4Start: TUniLabel
                  Left = 8
                  Top = 99
                  Width = 58
                  Height = 13
                  Hint = ''
                  Caption = 'Shift 4 Start'
                  TabOrder = 4
                end
              end
              object PnlShiftsClient02: TUniPanel
                Left = 136
                Top = 1
                Width = 316
                Height = 141
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                DesignSize = (
                  316
                  141)
                object Label11: TUniLabel
                  Left = 1
                  Top = 1
                  Width = 49
                  Height = 13
                  Hint = ''
                  Caption = 'Start Time'
                  TabOrder = 9
                end
                object Label10: TUniLabel
                  Left = 120
                  Top = 1
                  Width = 41
                  Height = 13
                  Hint = ''
                  Caption = 'Duration'
                  TabOrder = 10
                end
                object dbeShift1Start: TUniDBEdit
                  Left = 1
                  Top = 24
                  Width = 108
                  Height = 21
                  Hint = ''
                  DataField = 'SHIFT_START1'
                  DataSource = SrcParam
                  TabOrder = 0
                end
                object dbeShift2Start: TUniDBEdit
                  Left = 1
                  Top = 48
                  Width = 108
                  Height = 21
                  Hint = ''
                  DataField = 'SHIFT_START2'
                  DataSource = SrcParam
                  TabOrder = 1
                end
                object dbeShift3Start: TUniDBEdit
                  Left = 1
                  Top = 72
                  Width = 108
                  Height = 21
                  Hint = ''
                  DataField = 'SHIFT_START3'
                  DataSource = SrcParam
                  TabOrder = 2
                end
                object dbeShift4Start: TUniDBEdit
                  Left = 1
                  Top = 96
                  Width = 108
                  Height = 21
                  Hint = ''
                  DataField = 'SHIFT_START4'
                  DataSource = SrcParam
                  TabOrder = 3
                end
                object dbeShift1Duration: TUniDBEdit
                  Left = 120
                  Top = 24
                  Width = 154
                  Height = 19
                  Hint = ''
                  DataField = 'Duration1'
                  DataSource = SrcParam
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 4
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
                object dbeShift2Duration: TUniDBEdit
                  Left = 120
                  Top = 48
                  Width = 154
                  Height = 19
                  Hint = ''
                  DataField = 'Duration2'
                  DataSource = SrcParam
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 5
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
                object dbeShift3Duration: TUniDBEdit
                  Left = 120
                  Top = 72
                  Width = 154
                  Height = 19
                  Hint = ''
                  DataField = 'Duration3'
                  DataSource = SrcParam
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 6
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
                object dbeShift4Duration: TUniDBEdit
                  Left = 120
                  Top = 96
                  Width = 154
                  Height = 19
                  Hint = ''
                  DataField = 'Duration4'
                  DataSource = SrcParam
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 7
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
              end
            end
          end
          object PnlToolbar: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 457
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
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
            object NavMainDefault: TUniDBNavigator
              Left = 381
              Top = 1
              Width = 75
              Height = 25
              Hint = ''
              DataSource = SrcParam
              VisibleButtons = [nbPost, nbCancel, nbRefresh]
              ConfirmDelete = False
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
            object Panel12: TUniPanel
              Left = 360
              Top = 1
              Width = 21
              Height = 25
              Hint = ''
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
                TabOrder = 1
                Caption = ''
              end
            end
          end
        end
      end
      object TabTimeOff: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Time Off'
        object Panel1: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 459
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object sbtnEditPeriod: TUniSpeedButton
            Left = 73
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Edit Start and End Time'
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
            OnClick = EditStartandEndTime1Click
          end
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
          object sbtnHolidays: TUniSpeedButton
            Left = 98
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Add Holiday'
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
            OnClick = AddHoliday1Click
          end
          object sbtnSelectAll: TUniSpeedButton
            Left = 26
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Select all'
            ShowHint = True
            ParentShowHint = False
            AllowAllUp = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              B3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
              7DB3977DB3977DB3977DFF00FFFF00FF94949494949494949494949494949494
              9494949494949494949494949494949494949494949494949494FF00FFFF00FF
              B3977D25B9FF28BEFF2CC4FF31CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
              FF8EF1FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D7
              D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F3949494FF00FFFF00FF
              B3977D24B9FF28BEFF2BC4FF31CBFF36D1FF3DD9FF45DEFF52E4FF63E9FF78ED
              FF8EF2FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D6
              D6D6DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F3949494FF00FFFF00FF
              B3977DA1A1A09393928787857E7D7C7978767978777F7E7C888685908F8D9796
              93979694979694B3977DFF00FFFF00FF949494A1A1A19393938787877D7D7D78
              78787878787E7E7E8686868F8F8F959595969696969696949494FF00FFFF00FF
              B3977D25B9FF28BEFF2CC4FF31CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
              FF8EF1FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D7
              D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F3949494FF00FFFF00FF
              B3977D24B9FF28BEFF2BC4FF31CBFF36D1FF3DD9FF45DEFF52E4FF63E9FF78ED
              FF8EF2FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D6
              D6D6DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F3949494FF00FFFF00FF
              508050407040305030203820B9B9B9ADADADA0A0A09292918686867D7D7D7A7A
              7A7B7A7A838281B3977DFF00FFFF00FF757575656565484848323232B9B9B9AD
              ADADA0A0A09292928686867D7D7D7A7A7A7A7A7A828282949494FF00FFFF00FF
              50905060A86050885030503031CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
              FF8EF1FFA3F5FFB3977DFF00FFFF00FF8282829898987B7B7B484848D2D2D2D7
              D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F394949470A88060A070
              60986070B0705098504070403050302038203DD9FF45DEFF52E4FF63E9FF78ED
              FF8EF2FFA3F5FFB3977D9D9D9D9494948B8B8BA2A2A288888865656548484832
              3232DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F394949480B090A0D8A0
              70C08070B87060A060509050408840305030A17A57A17A57A17A57A17A57A17A
              57A17A57A17A57A17A57A7A7A7CACACAB0B0B0A8A8A891919182828279797948
              484877777777777777777777777777777777777777777777777790B8A0B0D8B0
              A0D8A090D0A070B87060A860509850407040FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFB1B1B1CECECECACACAC3C3C3A8A8A898989888888865
              6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90C0A090B8A0
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
            OnClick = SelectAll1Click
          end
          object sbtnUnselectAll: TUniSpeedButton
            Left = 51
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Unselect All'
            ShowHint = True
            ParentShowHint = False
            AllowAllUp = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000232E0000232E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              B3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
              7DB3977DB3977DB3977DFF00FFFF00FF94949494949494949494949494949494
              9494949494949494949494949494949494949494949494949494FF00FFFF00FF
              B3977DF3EADCF2E8DBF1E8DAF1E6D8F1E5D7F0E5D6F0E4D5EFE4D3EFE3D2EFE2
              D1EFE2D0EEE1CFB3977DFF00FFFF00FF949494E8E8E8E7E7E7E6E6E6E4E4E4E3
              E3E3E3E3E3E2E2E2E2E2E2E1E1E1E0E0E0E0E0E0DFDFDF949494FF00FFFF00FF
              B3977DF7F1EAF7F1E9F6F0E7F5EFE6F6EEE4F5EEE2F4ECE1F3EBE0F3EADEF3EA
              DDF2E9DBF2E8DAB3977DFF00FFFF00FF949494F0F0F0F0F0F0EFEFEFEEEEEEED
              EDEDECECECEBEBEBEAEAEAE9E9E9E9E9E9E7E7E7E6E6E6949494FF00FFFF00FF
              B3977D9393928787857E7D7C7978767978777F7E7C888685908F8D9796939796
              949796949D9A98B3977DFF00FFFF00FF9494949393938787877D7D7D78787878
              78787E7E7E8686868F8F8F9595959696969696969A9A9A949494FF00FFFF00FF
              B3977DFFFEFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFEFEFEFEFEFDB3977DFF00FFFF00FF949494FEFEFEFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFE949494FF00FFFF00FF
              B3977DFFF9F4FFFAF6FFFBF7FFFBF8FFFCF9FFFDFAFFFDFBFFFEFCFFFFFDFFFF
              FEFFFFFEFFFFFFB3977DFF00FFFF00FF949494F9F9F9FAFAFAFBFBFBFBFBFBFC
              FCFCFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF949494FF00FFFF00FF
              B3977DC2C2C2C1C1C1B9B9B9ADADADA0A0A09292918686867D7D7D7A7A7A7B7A
              7A838281929190B3977DFF00FFFF00FF949494C2C2C2C1C1C1B9B9B9ADADADA0
              A0A09292928686867D7D7D7A7A7A7A7A7A828282919191949494FF00FFFF00FF
              B3977DFFFEFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFEFEFEFEFEFDB3977DFF00FFFF00FF949494FEFEFEFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFE9494946078D01038B0
              1038B01030B01028A01028A0002090002090FFFDFAFFFDFBFFFEFCFFFFFDFFFF
              FEFFFFFEFFFFFFB3977D8F8F8F6161616161615E5E5E5555555555554A4A4A4A
              4A4AFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF9494946080D09098FF
              5060FF5060FF3048F03048E02040D01028A0A17A57A17A57A17A57A17A57A17A
              57A17A57A17A57A17A57949494B4B4B49696969696968585857E7E7E73737355
              55557777777777777777777777777777777777777777777777777088E0A0A8FF
              9090FF7080FF5068FF3058F02048F01038B0FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF9F9F9FBFBFBFB0B0B0A6A6A69999998B8B8B85858561
              6161FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7088E07088E0
              6080D06078D05070C05060C04058B04058B0FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF9F9F9F9F9F9F9494948F8F8F8585857C7C7C71717171
              7171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = UnselectAll1Click
          end
          object Panel6: TUniPanel
            Left = 425
            Top = 1
            Width = 33
            Height = 25
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object shpHolidays: TUniPanel
              Left = 12
              Top = 7
              Width = 10
              Height = 11
              Hint = 'Holidays'
              TabOrder = 1
              Caption = ''
            end
          end
        end
        object PnlGrid: TUniPanel
          Tag = 1999
          Left = 0
          Top = 27
          Width = 459
          Height = 345
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object GridDates: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 457
            Height = 343
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 240
            IQComponents.Grid.Height = 257
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcDates
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
            IQComponents.Navigator.DataSource = SrcDates
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 240
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 257
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcDates
            Columns = <
              item
                FieldName = 'START_TIME'
                Title.Caption = 'Start Time'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'END_TIME'
                Title.Caption = 'End Time'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DAY_OFF_TYPE'
                Title.Caption = 'Day Off Type'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
          object cmbGridDayOffType: TUniDBComboBox
            Left = 72
            Top = 168
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'DAY_OFF_TYPE'
            DataSource = SrcDates
            Style = csSimple
            Items.Strings = (
              'Weekend'#9'1'
              'Shift Off'#9'2'
              'Holiday'#9'3'
              'Idle Time Off'#9'4')
            TabOrder = 1
            ReadOnly = True
          end
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 224
    Top = 16
    object File1: TUniMenuItem
      Caption = '&File'
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
        Visible = False
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
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmTlParam'
    WebUse = False
    TouchScreen = False
    Left = 112
    Top = 16
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityCode = 'FRMTLPARAM'
    Left = 140
    Top = 16
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmTlParam'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195495 $'
    BuildVersion = '176554'
    Left = 168
    Top = 16
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 196
    Top = 16
  end
  object SrcParam: TDataSource
    DataSet = QryParam
    OnDataChange = SrcParamDataChange
    Left = 272
    Top = 160
  end
  object QryParam: TFDQuery
    BeforePost = QryParamBeforePost
    AfterPost = QryParamAfterPost
    AfterDelete = QryParamAfterDelete
    OnCalcFields = QryParamCalcFields
    OnNewRecord = QryParamNewRecord
    IndexesActive = False
    IndexFieldNames = 'ID'
    MasterSource = SrcOrigin
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'TOOL_PARAMS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_Param
    SQL.Strings = (
      'SELECT id,'
      '       descrip,'
      '       shifts,'
      '       shift_start1,'
      '       shift_start2,'
      '       shift_start3,'
      '       shift_start4,'
      '       hrs_day,'
      '       days_week,'
      '       eplant_id'
      '  FROM tool_params'
      ' WHERE NVL(eplant_id, 0) = NVL(:ID, 0)')
    Left = 280
    Top = 168
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFMTBcd
        FDDataType = dtInt64
        ParamType = ptInput
      end>
    object QryParamID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryParamDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 35
    end
    object QryParamSHIFTS: TBCDField
      DisplayLabel = 'Number of Shifts'
      FieldName = 'SHIFTS'
      Origin = 'SHIFTS'
      OnChange = DoSetCheckAssignDefaultDays
      Size = 0
    end
    object QryParamSHIFT_START1: TStringField
      DisplayLabel = 'Shift 1 Start'
      FieldName = 'SHIFT_START1'
      Origin = 'SHIFT_START1'
      OnValidate = DoValidateShiftField
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object QryParamSHIFT_START2: TStringField
      DisplayLabel = 'Shift 2 Start'
      FieldName = 'SHIFT_START2'
      Origin = 'SHIFT_START2'
      OnValidate = DoValidateShiftField
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object QryParamSHIFT_START3: TStringField
      DisplayLabel = 'Shift 3 Start'
      FieldName = 'SHIFT_START3'
      Origin = 'SHIFT_START3'
      OnValidate = DoValidateShiftField
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object QryParamSHIFT_START4: TStringField
      DisplayLabel = 'Shift 4 Start'
      FieldName = 'SHIFT_START4'
      Origin = 'SHIFT_START4'
      OnValidate = DoValidateShiftField
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object QryParamHRS_DAY: TBCDField
      DisplayLabel = 'Hours Per Day'
      FieldName = 'HRS_DAY'
      Origin = 'HRS_DAY'
      OnChange = DoSetCheckAssignDefaultDays
      Precision = 4
      Size = 2
    end
    object QryParamDAYS_WEEK: TBCDField
      DisplayLabel = 'Days Per Week'
      FieldName = 'DAYS_WEEK'
      Origin = 'DAYS_WEEK'
      OnChange = DoSetCheckAssignDefaultDays
      Precision = 1
      Size = 0
    end
    object QryParamDuration1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration1'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object QryParamDuration2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration2'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object QryParamDuration3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration3'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object QryParamDuration4: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Duration4'
      DisplayFormat = '##0.0000'
      Calculated = True
    end
    object QryParamEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object FDUpdateSQL_Param: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO TOOL_PARAMS'
      '(ID, DESCRIP, SHIFTS, SHIFT_START1, SHIFT_START2, '
      '  SHIFT_START3, SHIFT_START4, HRS_DAY, DAYS_WEEK, '
      '  EPLANT_ID)'
      
        'VALUES (:NEW_ID, :NEW_DESCRIP, :NEW_SHIFTS, :NEW_SHIFT_START1, :' +
        'NEW_SHIFT_START2, '
      
        '  :NEW_SHIFT_START3, :NEW_SHIFT_START4, :NEW_HRS_DAY, :NEW_DAYS_' +
        'WEEK, '
      '  :NEW_EPLANT_ID)')
    ModifySQL.Strings = (
      'UPDATE TOOL_PARAMS'
      'SET DESCRIP = :NEW_DESCRIP, SHIFTS = :NEW_SHIFTS, '
      
        '  SHIFT_START1 = :NEW_SHIFT_START1, SHIFT_START2 = :NEW_SHIFT_ST' +
        'ART2, '
      
        '  SHIFT_START3 = :NEW_SHIFT_START3, SHIFT_START4 = :NEW_SHIFT_ST' +
        'ART4, '
      
        '  HRS_DAY = :NEW_HRS_DAY, DAYS_WEEK = :NEW_DAYS_WEEK, EPLANT_ID ' +
        '= :NEW_EPLANT_ID'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM TOOL_PARAMS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, DESCRIP, SHIFTS, SHIFT_START1, SHIFT_START2, SHIFT_ST' +
        'ART3, '
      '  SHIFT_START4, HRS_DAY, DAYS_WEEK, EPLANT_ID'
      'FROM TOOL_PARAMS'
      'WHERE ID = :ID')
    Left = 288
    Top = 176
  end
  object SrcOrigin: TDataSource
    DataSet = QryOrigin
    OnDataChange = SrcOriginDataChange
    Left = 184
    Top = 168
  end
  object QryOrigin: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT '#39'System'#39' AS origin,'
      '       '#39'Default'#39' AS source,'
      '       0 AS id,'
      '       1 AS sort,'
      '       0 AS params_id'
      '  FROM DUAL'
      'UNION ALL'
      'SELECT '#39'EPlant'#39' AS origin,'
      '       a.name AS source,'
      '       a.id,'
      '       2 AS sort,'
      '       (SELECT MIN(id)'
      '          FROM tool_params'
      '         WHERE eplant_id = a.id)'
      '          AS params_id'
      '  FROM eplant a'
      'ORDER BY 4, 3')
    Left = 192
    Top = 176
    object QryOriginORIGIN: TStringField
      DisplayLabel = 'Origin'
      DisplayWidth = 7
      FieldName = 'ORIGIN'
      Origin = 'ORIGIN'
      FixedChar = True
      Size = 6
    end
    object QryOriginSOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 30
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Size = 30
    end
    object QryOriginID: TFMTBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Precision = 38
      Size = 38
    end
    object QryOriginSORT: TFMTBCDField
      FieldName = 'SORT'
      Origin = '"SORT"'
      Visible = False
      Precision = 38
      Size = 38
    end
    object QryOriginPARAMS_ID: TFMTBCDField
      FieldName = 'PARAMS_ID'
      Origin = 'PARAMS_ID'
      Visible = False
      Precision = 38
      Size = 38
    end
  end
  object SrcDates: TDataSource
    DataSet = QryDates
    Left = 336
    Top = 160
  end
  object QryDates: TFDQuery
    BeforeEdit = QryDatesBeforeEdit
    BeforePost = QryDatesBeforePost
    OnNewRecord = QryDatesNewRecord
    IndexesActive = False
    IndexFieldNames = 'ID'
    MasterSource = SrcOrigin
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'TOOL_CALENDAR'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_Dates
    SQL.Strings = (
      '  SELECT id,'
      '         eplant_id,'
      '         start_time,'
      '         end_time,'
      '         day_off_type'
      '    FROM tool_calendar'
      '   WHERE  NVL(eplant_id, 0) = NVL(:ID, 0)'
      'ORDER BY start_time, end_time')
    Left = 344
    Top = 168
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFMTBcd
        FDDataType = dtInt64
        ParamType = ptInput
      end>
    object QryDatesSTART_TIME: TDateTimeField
      DisplayLabel = 'Start Time'
      DisplayWidth = 18
      FieldName = 'START_TIME'
      Origin = 'START_TIME'
    end
    object QryDatesEND_TIME: TDateTimeField
      DisplayLabel = 'End Time'
      DisplayWidth = 18
      FieldName = 'END_TIME'
      Origin = 'END_TIME'
    end
    object QryDatesDAY_OFF_TYPE: TBCDField
      DisplayLabel = 'Day Off Type'
      DisplayWidth = 2
      FieldName = 'DAY_OFF_TYPE'
      Origin = 'DAY_OFF_TYPE'
      Precision = 1
      Size = 0
    end
    object QryDatesID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryDatesEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object FDUpdateSQL_Dates: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO TOOL_CALENDAR'
      '(ID, EPLANT_ID, START_TIME, END_TIME, DAY_OFF_TYPE)'
      
        'VALUES (:NEW_ID, :NEW_EPLANT_ID, :NEW_START_TIME, :NEW_END_TIME,' +
        ' :NEW_DAY_OFF_TYPE)')
    ModifySQL.Strings = (
      'UPDATE TOOL_CALENDAR'
      
        'SET START_TIME = :NEW_START_TIME, END_TIME = :NEW_END_TIME, DAY_' +
        'OFF_TYPE = :NEW_DAY_OFF_TYPE'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM TOOL_CALENDAR'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, EPLANT_ID, START_TIME, END_TIME, DAY_OFF_TYPE'
      'FROM TOOL_CALENDAR'
      'WHERE ID = :ID')
    Left = 352
    Top = 176
  end
  object PGridDaysOff: TUniPopupMenu
    Left = 256
    Top = 16
    object EditStartandEndTime1: TUniMenuItem
      Caption = 'Edit Start and End Time'
      OnClick = EditStartandEndTime1Click
    end
    object AddHoliday1: TUniMenuItem
      Caption = 'Add Holiday'
      OnClick = AddHoliday1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object SelectAll1: TUniMenuItem
      Caption = 'Select All'
      OnClick = SelectAll1Click
    end
    object UnselectAll1: TUniMenuItem
      Caption = 'Unselect All'
      OnClick = UnselectAll1Click
    end
  end
end
