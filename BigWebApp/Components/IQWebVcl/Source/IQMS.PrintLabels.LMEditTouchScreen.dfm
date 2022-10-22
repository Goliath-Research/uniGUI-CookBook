inherited FrmLabelsTouchScreen: TFrmLabelsTouchScreen
  Left = 244
  Top = 125
  ClientHeight = 707
  ClientWidth = 1014
  BorderStyle = bsSingle
  Font.Charset = ANSI_CHARSET
  Font.Height = -13
  Font.Style = [fsBold]
  OnCreate = FormCreate
  ExplicitWidth = 1020
  ExplicitHeight = 755
  PixelsPerInch = 96
  TextHeight = 16
  inherited Splitter1: TUniSplitter
    Top = 285
    Width = 1014
    ExplicitTop = 272
    ExplicitWidth = 710
  end
  inherited PnlToolbarUpper: TUniPanel
    Width = 1014
    Height = 41
    ExplicitWidth = 1014
    ExplicitHeight = 41
    inherited SBToggleHeader: TUniSpeedButton
      Left = 40
      Width = 39
      Height = 39
      ExplicitLeft = 40
      ExplicitWidth = 39
      ExplicitHeight = 39
    end
    inherited SBSearch: TUniSpeedButton
      Width = 39
      Height = 39
      ExplicitWidth = 39
      ExplicitHeight = 39
    end
  end
  inherited Panel2: TUniPanel
    Top = 41
    Width = 1014
    Height = 244
    ExplicitTop = 41
    ExplicitWidth = 1014
    ExplicitHeight = 244
    inherited PC: TUniPageControl
      Width = 1012
      Height = 242
      ExplicitWidth = 1014
      ExplicitHeight = 244
      inherited TabForm: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 1006
        ExplicitHeight = 234
        inherited Label1: TUniLabel
          Top = 52
          TabOrder = 20
          ExplicitTop = 52
        end
        inherited Label2: TUniLabel
          Top = 12
          TabOrder = 21
          ExplicitTop = 12
        end
        inherited Label3: TUniLabel
          Left = 8
          Top = 84
          ExplicitLeft = 8
          ExplicitTop = 84
        end
        inherited Label4: TUniLabel
          Left = 421
          Top = 12
          ExplicitLeft = 421
          ExplicitTop = 12
        end
        inherited Label5: TUniLabel
          Left = 421
          Top = 55
          ExplicitLeft = 421
          ExplicitTop = 55
        end
        inherited Label6: TUniLabel
          Top = 172
          ExplicitTop = 172
        end
        inherited Label7: TUniLabel
          Left = 421
          Top = 172
          ExplicitLeft = 421
          ExplicitTop = 172
        end
        inherited Label8: TUniLabel
          Left = 421
          Top = 104
          ExplicitLeft = 421
          ExplicitTop = 104
        end
        inherited sbtnEPlant: TUniSpeedButton
          Left = 681
          Top = 104
          Width = 48
          Height = 40
          ExplicitLeft = 681
          ExplicitTop = 104
          ExplicitWidth = 48
          ExplicitHeight = 40
        end
        object Bevel1: TUniPanel [9]
          Left = 0
          Top = 140
          Width = 1005
          Height = 9
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 22
          Caption = ''
          ExplicitWidth = 701
        end
        object sbtnServerDropDown: TUniSpeedButton [10]
          Left = 318
          Top = 160
          Width = 48
          Height = 40
          Hint = ''
          Glyph.Data = {
            12010000424D12010000000000007600000028000000130000000D0000000100
            0400000000009C00000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666000006666666666666666666000006666666660666666666000006666
            6666000666666660000066666660000066666660000066666600000006666660
            0000666660000000006666600000666600000000000666600000666000000000
            0000666000006600000000000000066000006000000000000000006000006666
            66666666666666600000666666666666666666600000}
          Caption = ''
          ParentColor = False
          Color = clWindow
          TabOrder = 23
          OnClick = sbtnServerDropDownClick
        end
        object SpeedButton3: TUniSpeedButton [11]
          Left = 681
          Top = 0
          Width = 48
          Height = 40
          Hint = ''
          Glyph.Data = {
            12010000424D12010000000000007600000028000000130000000D0000000100
            0400000000009C00000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666000006666666666666666666000006666666660666666666000006666
            6666000666666660000066666660000066666660000066666600000006666660
            0000666660000000006666600000666600000000000666600000666000000000
            0000666000006600000000000000066000006000000000000000006000006666
            66666666666666600000666666666666666666600000}
          Caption = ''
          ParentColor = False
          Color = clWindow
          TabOrder = 24
          OnClick = SpeedButton3Click
        end
        object SpeedButton1: TUniSpeedButton [12]
          Left = 681
          Top = 48
          Width = 48
          Height = 40
          Hint = ''
          Glyph.Data = {
            12010000424D12010000000000007600000028000000130000000D0000000100
            0400000000009C00000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666000006666666666666666666000006666666660666666666000006666
            6666000666666660000066666660000066666660000066666600000006666660
            0000666660000000006666600000666600000000000666600000666000000000
            0000666000006600000000000000066000006000000000000000006000006666
            66666666666666600000666666666666666666600000}
          Caption = ''
          ParentColor = False
          Color = clWindow
          TabOrder = 25
          OnClick = SpeedButton1Click
        end
        object SpeedButton5: TUniSpeedButton [13]
          Left = 681
          Top = 160
          Width = 48
          Height = 40
          Hint = ''
          Glyph.Data = {
            12010000424D12010000000000007600000028000000130000000D0000000100
            0400000000009C00000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666000006666666666666666666000006666666660666666666000006666
            6666000666666660000066666660000066666660000066666600000006666660
            0000666660000000006666600000666600000000000666600000666000000000
            0000666000006600000000000000066000006000000000000000006000006666
            66666666666666600000666666666666666666600000}
          Caption = ''
          ParentColor = False
          Color = clWindow
          TabOrder = 26
          OnClick = SpeedButton5Click
        end
        inherited Label9: TUniLabel
          Top = 116
          ExplicitTop = 116
        end
        inherited sbtnArcusto: TUniSpeedButton
          Left = 324
          Top = 0
          Width = 40
          Height = 40
          ExplicitLeft = 324
          ExplicitTop = 0
          ExplicitWidth = 40
          ExplicitHeight = 40
        end
        inherited cbKind: TUniDBComboBox [16]
          Left = 560
          Width = 119
          Height = 24
          Enabled = False
          Visible = False
          Style = csSimple
          TabOrder = 10
          ExplicitLeft = 560
          ExplicitWidth = 119
          ExplicitHeight = 24
        end
        inherited EditLabel: TUniDBEdit
          Left = 168
          Top = 48
          Width = 198
          Height = 24
          TabOrder = 1
          ExplicitLeft = 168
          ExplicitTop = 48
          ExplicitWidth = 198
          ExplicitHeight = 24
        end
        inherited wwCustomerForm: TUniDBLookupComboBox [18]
          Left = 170
          Top = 8
          Width = 148
          Height = 24
          TabOrder = 0
          ExplicitLeft = 170
          ExplicitTop = 8
          ExplicitWidth = 148
          ExplicitHeight = 24
        end
        object cmbLabelKind: TUniDBComboBox [19]
          Left = 560
          Top = 56
          Width = 123
          Height = 24
          Hint = ''
          DataField = 'LABEL_KIND'
          DataSource = SrcLabels
          Items.Strings = (
            'RF'
            'GENERAL')
          ItemIndex = 1
          TabOrder = 5
        end
        inherited CBType: TUniDBComboBox
          Left = 560
          Top = 8
          Width = 119
          Height = 24
          Enabled = False
          Style = csSimple
          TabOrder = 7
          ExplicitLeft = 560
          ExplicitTop = 8
          ExplicitWidth = 119
          ExplicitHeight = 24
        end
        inherited EditMenu: TUniDBEdit [21]
          Left = 168
          Top = 80
          Width = 198
          Height = 24
          TabOrder = 2
          ExplicitLeft = 168
          ExplicitTop = 80
          ExplicitWidth = 198
          ExplicitHeight = 24
        end
        inherited wwDBComboBox2: TUniDBComboBox
          Left = 560
          Top = 168
          Width = 123
          Height = 24
          TabOrder = 6
          ExplicitLeft = 560
          ExplicitTop = 168
          ExplicitWidth = 123
          ExplicitHeight = 24
        end
        inherited dbePlantName: TUniDBEdit
          Left = 560
          Top = 112
          Width = 123
          Height = 24
          TabOrder = 9
          ExplicitLeft = 560
          ExplicitTop = 112
          ExplicitWidth = 123
          ExplicitHeight = 24
        end
        inherited wwDBComboBox1: TUniDBComboBox
          Left = 168
          Top = 168
          Width = 148
          Height = 24
          TabOrder = 3
          ExplicitLeft = 168
          ExplicitTop = 168
          ExplicitWidth = 148
          ExplicitHeight = 24
        end
        inherited DBEdit1: TUniDBEdit
          Left = 168
          Top = 112
          Height = 24
          ExplicitLeft = 168
          ExplicitTop = 112
          ExplicitHeight = 24
        end
        object cmbLabelType: TUniDBComboBox
          Left = 560
          Top = 8
          Width = 123
          Height = 24
          Hint = ''
          DataField = 'LABEL_TYPE'
          DataSource = SrcLabels
          Items.Strings = (
            'MANUFACTURED'
            'PURCHASED'
            'LOAD')
          ItemIndex = 0
          TabOrder = 4
        end
      end
      inherited TabGrid: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 1004
        ExplicitHeight = 214
        inherited GridHeader: TIQUniGridControl
          Width = 1004
          Height = 214
          Font.Charset = ANSI_CHARSET
          Font.Height = -13
          Font.Style = [fsBold]
          ExplicitWidth = 1004
          ExplicitHeight = 214
          inherited PageControl: TUniPageControl
            Width = 1004
            Height = 185
            ExplicitWidth = 1004
            ExplicitHeight = 185
          end
          inherited TopToolBar: TUniToolBar
            Width = 1004
            TabOrder = 1
            ExplicitWidth = 584
          end
        end
      end
    end
  end
  inherited Panel3: TUniPanel
    Top = 288
    Width = 1014
    Height = 344
    TabOrder = 2
    ExplicitTop = 288
    ExplicitWidth = 1014
    ExplicitHeight = 344
    inherited bvSpacerDetail1: TUniPanel
      Width = 1012
      ExplicitTop = 41
      ExplicitWidth = 710
    end
    inherited PnlDetailGrid: TUniPanel
      Width = 1012
      Height = 339
      ExplicitWidth = 1012
      ExplicitHeight = 339
      inherited GridDetail: TIQUniGridControl
        Width = 1010
        Height = 337
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Style = [fsBold]
        ExplicitWidth = 1010
        ExplicitHeight = 337
        inherited PageControl: TUniPageControl
          Width = 1010
          Height = 308
          ExplicitWidth = 1010
          ExplicitHeight = 308
        end
        inherited TopToolBar: TUniToolBar
          Width = 1010
          ExplicitWidth = 590
        end
      end
    end
  end
  inherited Panel5: TUniPanel
    Top = 632
    Width = 1014
    Height = 57
    TabOrder = 3
    ExplicitTop = 632
    ExplicitWidth = 1014
    ExplicitHeight = 57
    inherited Panel6: TUniPanel
      Left = 400
      Width = 614
      Height = 57
      ExplicitLeft = 400
      ExplicitWidth = 614
      ExplicitHeight = 57
      object sbtnExit: TUniButton [0]
        Left = 408
        Top = 5
        Width = 197
        Height = 40
        Hint = ''
        Caption = 'Close'
        TabOrder = 2
        OnClick = Exit1Click
      end
      inherited BtnCreate: TUniButton
        Left = 205
        Top = 5
        Width = 197
        Height = 40
        ExplicitLeft = 205
        ExplicitTop = 5
        ExplicitWidth = 197
        ExplicitHeight = 40
      end
      inherited BtnReset: TUniButton
        Top = 5
        Width = 197
        Height = 40
        Caption = 'Reset To Defaults'
        TabOrder = 0
        ExplicitTop = 5
        ExplicitWidth = 197
        ExplicitHeight = 40
      end
    end
    inherited Panel7: TUniPanel
      Width = 400
      Height = 57
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      ExplicitWidth = 400
      ExplicitHeight = 57
      inherited Label37: TUniLabel
        Left = 4
        Top = 17
        Width = 29
        Caption = 'LM Dir'
        ExplicitLeft = 4
        ExplicitTop = 17
        ExplicitWidth = 29
      end
      inherited sbtnSelectDir: TUniSpeedButton
        Left = 355
        Top = 5
        Width = 40
        Height = 40
        Anchors = [akTop, akRight]
        ExplicitLeft = 285
        ExplicitTop = 5
        ExplicitWidth = 40
        ExplicitHeight = 40
      end
      inherited EditLMDir: TUniDBEdit
        Left = 64
        Top = 13
        Width = 287
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ExplicitLeft = 64
        ExplicitTop = 13
        ExplicitWidth = 287
        ExplicitHeight = 24
      end
    end
  end
  object StatusBar1: TUniStatusBar [5]
    Left = 0
    Top = 689
    Width = 1014
    Height = 18
    Hint = ''
    Panels = <
      item
        Bevel = pbNone
        Width = 0
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  inherited MainMenu1: TUniMainMenu
    inherited File1: TUniMenuItem
      Visible = False
    end
    inherited Help1: TUniMenuItem
      Visible = False
    end
  end
  inherited SrcLabelsDtl: TDataSource
    Top = 257
  end
  inherited TblLabelsDtl: TFDTable
    Top = 256
  end
  inherited SrcLabels: TDataSource
    Top = 257
  end
  inherited TblLabels: TFDTable
    Top = 256
  end
  inherited QryArcusto: TFDQuery
    Top = 260
  end
  inherited TblLMInv: TFDTable
    Top = 260
  end
  inherited TblLMMat: TFDTable
    Top = 260
  end
  inherited TblArcusto: TFDTable
    Top = 260
  end
  inherited SrcParams: TDataSource
    Top = 292
  end
  inherited TblParams: TFDTable
    Top = 288
  end
  inherited QryEPlant: TFDQuery
    Left = 412
    Top = 275
  end
end
