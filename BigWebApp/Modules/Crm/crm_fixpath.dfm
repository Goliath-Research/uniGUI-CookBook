object FrmIQFixPath: TFrmIQFixPath
  Left = 404
  Top = 225
  ClientHeight = 269
  ClientWidth = 425
  Caption = 'Change Attachment Paths'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 67
    Width = 425
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 237
    Width = 425
    Height = 32
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ParentColor = True
    ExplicitTop = 201
    object PnlButtonsInner: TUniPanel
      Left = 209
      Top = 1
      Width = 216
      Height = 30
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ParentColor = True
      object btnExecute: TUniBitBtn
        Left = 14
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Execute'
        TabOrder = 0
        OnClick = DoExecuteClick
      end
      object btnClose: TUniBitBtn
        Left = 118
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Close'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
        OnClick = btnCloseClick
      end
    end
    object chkAutoClose: TUniCheckBox
      Left = 3
      Top = 12
      Width = 150
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Close this form when done'
      TabOrder = 1
    end
  end
  object Panel7: TUniPanel
    Left = 0
    Top = 70
    Width = 425
    Height = 167
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ParentColor = True
    ExplicitHeight = 131
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 423
      Height = 165
      Hint = ''
      Caption = ' File Paths to Change '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitHeight = 129
      object PnlCheckboxes: TUniPanel
        Left = 2
        Top = 15
        Width = 419
        Height = 148
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ParentColor = True
        ExplicitHeight = 112
        object chkExtDocs: TUniCheckBox
          Left = 8
          Top = 1
          Width = 169
          Height = 17
          Hint = ''
          Caption = 'External Documents'
          TabOrder = 0
          OnClick = OptionCheckClick
        end
        object chkIQCRM_Activities: TUniCheckBox
          Tag = 1
          Left = 8
          Top = 16
          Width = 289
          Height = 17
          Hint = ''
          Caption = 'CRM Activity and Support Issue Attachments'
          TabOrder = 1
          OnClick = OptionCheckClick
        end
        object chkIQCRM_ActivityDescrip: TUniCheckBox
          Tag = 2
          Left = 24
          Top = 32
          Width = 257
          Height = 17
          Hint = ''
          Caption = 'Set file description to equal file name'
          TabOrder = 2
          OnClick = OptionCheckClick
        end
        object chkIQCRM_AnswerBk: TUniCheckBox
          Tag = 3
          Left = 8
          Top = 48
          Width = 217
          Height = 17
          Hint = ''
          Caption = 'CRM Answer Book Attachments'
          TabOrder = 3
          OnClick = OptionCheckClick
        end
        object chkIQCRM_AnswerBkDescrip: TUniCheckBox
          Tag = 4
          Left = 24
          Top = 64
          Width = 257
          Height = 17
          Hint = ''
          Caption = 'Set file description to equal file name'
          TabOrder = 4
          OnClick = OptionCheckClick
        end
        object chkInvImages: TUniCheckBox
          Tag = 5
          Left = 8
          Top = 80
          Width = 129
          Height = 17
          Hint = ''
          Caption = 'Inventory Image Files'
          TabOrder = 5
          OnClick = OptionCheckClick
        end
        object chkCRMShortcuts: TUniCheckBox
          Left = 8
          Top = 96
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'CRM Shortcuts'
          TabOrder = 6
        end
      end
    end
  end
  object Panel9: TUniPanel
    Left = 0
    Top = 0
    Width = 425
    Height = 67
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    ParentColor = True
    object GroupBox2: TUniGroupBox
      Left = 1
      Top = 1
      Width = 423
      Height = 65
      Hint = ''
      Caption = ' Directories '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object Panel1: TUniPanel
        Left = 2
        Top = 15
        Width = 419
        Height = 48
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ParentColor = True
        object Splitter1: TUniSplitter
          Left = 138
          Top = 0
          Width = 6
          Height = 48
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel3: TUniPanel
          Left = 1
          Top = 1
          Width = 138
          Height = 46
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          ParentColor = True
          object Label1: TUniLabel
            Left = 8
            Top = 4
            Width = 120
            Height = 13
            Hint = 'Old attachment path'
            ShowHint = True
            ParentShowHint = False
            Caption = 'Original Attachment Path'
            TabOrder = 1
          end
          object Label2: TUniLabel
            Left = 8
            Top = 28
            Width = 105
            Height = 13
            Hint = 'New attachment path'
            ShowHint = True
            ParentShowHint = False
            Caption = 'New Attachment Path'
            TabOrder = 2
          end
        end
        object Panel4: TUniPanel
          Left = 144
          Top = 1
          Width = 275
          Height = 46
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          ParentColor = True
          object Panel8: TUniPanel
            Left = 245
            Top = 1
            Width = 30
            Height = 44
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object sbtnBrowseOriginal: TUniSpeedButton
              Left = 1
              Top = 1
              Width = 23
              Height = 22
              Hint = ''
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF708890608090
                6078805070805060704058604048503038402030302020301018201010101010
                20FF00FFFF00FFFF00FF88888882828278787872727263636358585849494939
                39392F2F2F242424191919101010141414FF00FFFF00FFFF00FF70889090A0B0
                70B0D00090D00090D00090D00090C01088C01080B01080B02078A02070902048
                60AE9783FF00FFFF00FF888888A3A3A3B4B4B49D9D9D9D9D9D9D9D9D98989892
                92928888888888887E7E7E7474744C4C4C959595FF00FFFF00FF80889080C0D0
                90A8B080E0FF60D0FF50C8FF50C8FF40C0F030B0F030A8F020A0E01090D02068
                80615A57FF00FFFF00FF898989C0C0C0A8A8A8E2E2E2D6D6D6D1D1D1D1D1D1C6
                C6C6BBBBBBB6B6B6ACACAC9D9D9D6B6B6B5A5A5AFF00FFFF00FF8090A080D0F0
                90A8B090C0D070D8FF60D0FF60D0FF50C8FF50C0FF40B8F030B0F030A8F01088
                D0204860D8BBA5FF00FF939393D3D3D3A8A8A8C1C1C1DCDCDCD6D6D6D6D6D6D1
                D1D1CBCBCBC1C1C1BBBBBBB6B6B69797974C4C4CB9B9B9FF00FF8090A080D8F0
                80C8E090A8B080E0FF70D0FF60D8FF60D0FF60D0FF50C8FF40C0F040B8F030B0
                F0206880748588FF00FF939393D9D9D9CACACAA8A8A8E2E2E2D7D7D7DCDCDCD6
                D6D6D6D6D6D1D1D1C6C6C6C1C1C1BBBBBB6B6B6B858585FF00FF8098A090E0F0
                90E0FF90A8B090B8C070D8FF60D8FF60D8FF60D8FF60D0FF50D0FF50C8FF40B8
                F030A0E04A6774D9C3B4989898E0E0E0E3E3E3A8A8A8B7B7B7DCDCDCDCDCDCDC
                DCDCDCDCDCD6D6D6D6D6D6D1D1D1C1C1C1ACACAC686868C2C2C28098A090E0F0
                A0E8FF80C8E090A8B080E0FF80E0FF80E0FF80E0FF80E0FF80E0FF80E0FF70D8
                FF70D8FF50A8D0909091989898E0E0E0E9E9E9CACACAA8A8A8E2E2E2E2E2E2E2
                E2E2E2E2E2E2E2E2E2E2E2E2E2E2DCDCDCDCDCDCAEAEAE90909090A0A0A0E8F0
                A0E8FFA0E8FF90B0C090B0C090A8B090A8B080A0B080A0B08098A08098A08090
                A08090A08088907088909F9F9FE6E6E6E9E9E9E9E9E9B2B2B2B2B2B2A8A8A8A8
                A8A8A2A2A2A2A2A298989898989893939393939389898988888890A0B0A0E8F0
                A0F0FFA0E8FFA0E8FF80D8FF60D8FF60D8FF60D8FF60D8FF60D8FF60D8FF7088
                90FF00FFFF00FFFF00FFA3A3A3E6E6E6EFEFEFE9E9E9E9E9E9DDDDDDDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC888888FF00FFFF00FFFF00FF90A0B0A0F0F0
                B0F0F0A0F0FFA0E8FFA0E8FF70D8FF90A0A08098A08098A08090A08090907088
                90FF00FFFF00FFFF00FFA3A3A3ECECECEDEDEDEFEFEFE9E9E9E9E9E9DCDCDC9F
                9F9F9898989898989393938F8F8F888888FF00FFFF00FFFF00FF90A8B0A0D0E0
                B0F0F0B0F0F0A0F0FFA0E8FF90A0B0BDC5BFFF00FFFF00FFFF00FFFF00FFFF00
                FF906850906850906850A8A8A8D1D1D1EDEDEDEDEDEDEFEFEFE9E9E9A3A3A3C4
                C4C4FF00FFFF00FFFF00FFFF00FFFF00FF676767676767676767DAD1C690A8B0
                90A8B090A8B090A8B090A8B0BFC2BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFDFC2B2906850906850D0D0D0A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8C1C1C1FF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1676767676767FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF907860D3B6A1FF00FFF7DF
                CCA09080DFC8B3907860FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FF757575B4B4B4FF00FFDEDEDE8E8E8EC6C6C6757575FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE5D3BFA09080A08880B098
                80CEBBAAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFD1D1D18E8E8E888888959595B9B9B9FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = sbtnBrowseOriginalClick
            end
            object sbtnBrowseNew: TUniSpeedButton
              Left = 1
              Top = 24
              Width = 23
              Height = 22
              Hint = ''
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF708890608090
                6078805070805060704058604048503038402030302020301018201010101010
                20FF00FFFF00FFFF00FF88888882828278787872727263636358585849494939
                39392F2F2F242424191919101010141414FF00FFFF00FFFF00FF70889090A0B0
                70B0D00090D00090D00090D00090C01088C01080B01080B02078A02070902048
                60AE9783FF00FFFF00FF888888A3A3A3B4B4B49D9D9D9D9D9D9D9D9D98989892
                92928888888888887E7E7E7474744C4C4C959595FF00FFFF00FF80889080C0D0
                90A8B080E0FF60D0FF50C8FF50C8FF40C0F030B0F030A8F020A0E01090D02068
                80615A57FF00FFFF00FF898989C0C0C0A8A8A8E2E2E2D6D6D6D1D1D1D1D1D1C6
                C6C6BBBBBBB6B6B6ACACAC9D9D9D6B6B6B5A5A5AFF00FFFF00FF8090A080D0F0
                90A8B090C0D070D8FF60D0FF60D0FF50C8FF50C0FF40B8F030B0F030A8F01088
                D0204860D8BBA5FF00FF939393D3D3D3A8A8A8C1C1C1DCDCDCD6D6D6D6D6D6D1
                D1D1CBCBCBC1C1C1BBBBBBB6B6B69797974C4C4CB9B9B9FF00FF8090A080D8F0
                80C8E090A8B080E0FF70D0FF60D8FF60D0FF60D0FF50C8FF40C0F040B8F030B0
                F0206880748588FF00FF939393D9D9D9CACACAA8A8A8E2E2E2D7D7D7DCDCDCD6
                D6D6D6D6D6D1D1D1C6C6C6C1C1C1BBBBBB6B6B6B858585FF00FF8098A090E0F0
                90E0FF90A8B090B8C070D8FF60D8FF60D8FF60D8FF60D0FF50D0FF50C8FF40B8
                F030A0E04A6774D9C3B4989898E0E0E0E3E3E3A8A8A8B7B7B7DCDCDCDCDCDCDC
                DCDCDCDCDCD6D6D6D6D6D6D1D1D1C1C1C1ACACAC686868C2C2C28098A090E0F0
                A0E8FF80C8E090A8B080E0FF80E0FF80E0FF80E0FF80E0FF80E0FF80E0FF70D8
                FF70D8FF50A8D0909091989898E0E0E0E9E9E9CACACAA8A8A8E2E2E2E2E2E2E2
                E2E2E2E2E2E2E2E2E2E2E2E2E2E2DCDCDCDCDCDCAEAEAE90909090A0A0A0E8F0
                A0E8FFA0E8FF90B0C090B0C090A8B090A8B080A0B080A0B08098A08098A08090
                A08090A08088907088909F9F9FE6E6E6E9E9E9E9E9E9B2B2B2B2B2B2A8A8A8A8
                A8A8A2A2A2A2A2A298989898989893939393939389898988888890A0B0A0E8F0
                A0F0FFA0E8FFA0E8FF80D8FF60D8FF60D8FF60D8FF60D8FF60D8FF60D8FF7088
                90FF00FFFF00FFFF00FFA3A3A3E6E6E6EFEFEFE9E9E9E9E9E9DDDDDDDCDCDCDC
                DCDCDCDCDCDCDCDCDCDCDCDCDCDC888888FF00FFFF00FFFF00FF90A0B0A0F0F0
                B0F0F0A0F0FFA0E8FFA0E8FF70D8FF90A0A08098A08098A08090A08090907088
                90FF00FFFF00FFFF00FFA3A3A3ECECECEDEDEDEFEFEFE9E9E9E9E9E9DCDCDC9F
                9F9F9898989898989393938F8F8F888888FF00FFFF00FFFF00FF90A8B0A0D0E0
                B0F0F0B0F0F0A0F0FFA0E8FF90A0B0BDC5BFFF00FFFF00FFFF00FFFF00FFFF00
                FF906850906850906850A8A8A8D1D1D1EDEDEDEDEDEDEFEFEFE9E9E9A3A3A3C4
                C4C4FF00FFFF00FFFF00FFFF00FFFF00FF676767676767676767DAD1C690A8B0
                90A8B090A8B090A8B090A8B0BFC2BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFDFC2B2906850906850D0D0D0A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8C1C1C1FF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1676767676767FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF907860D3B6A1FF00FFF7DF
                CCA09080DFC8B3907860FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FF757575B4B4B4FF00FFDEDEDE8E8E8EC6C6C6757575FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE5D3BFA09080A08880B098
                80CEBBAAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFD1D1D18E8E8E888888959595B9B9B9FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = sbtnBrowseNewClick
            end
          end
          object PnlPathEdit: TUniPanel
            Left = 1
            Top = 1
            Width = 245
            Height = 44
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              245
              44)
            object edtOldPath: TUniEdit
              Left = 1
              Top = 1
              Width = 241
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Color = clWhite
            end
            object edtNewPath: TUniEdit
              Left = 1
              Top = 24
              Width = 241
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Color = clWhite
            end
          end
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 194
    Top = 101
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Close'
        OnClick = Exit1Click
      end
    end
    object Actions1: TUniMenuItem
      Caption = '&Actions'
      object Execute1: TUniMenuItem
        Caption = '&Execute'
        OnClick = DoExecuteClick
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'CRM Change Path'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194888 $'
    BuildVersion = '176554'
    Left = 246
    Top = 117
  end
  object IQWebSound1: TIQWebSound
    Loop = False
    Volume = 100
    BeepFileName = 'files/beep.wav'
    Left = 339
    Top = 134
  end
end
