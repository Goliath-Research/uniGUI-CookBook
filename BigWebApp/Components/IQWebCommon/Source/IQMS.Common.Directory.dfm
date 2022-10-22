object IQDirBrowse: TIQWebDirectoryBrowser
  Left = 250
  Top = 103
  Width = 328
  Height = 222
  BorderIcons = [biSystemMenu]
  Caption = 'Directory Browser'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Style = []
  FormStyle = fsStayOnTop
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0008888880000000000000000000000000000000800000000000000000000000
    00AAAAA080000000000000000000000000AAAAA0800000088800008888800000
    00AAAAA080000099998009999990000000AAAAA0888889900998099800000000
    00AAA00000008000099800998000000000AAA0A0CCC080000998000998000000
    00AAA0A0CCC08000998800009980000000AAA0A0CCC080000099800009980088
    80AAA0A0CCC0800000998090099800000000A0A0CCC0809988990099899000BB
    B0B0A0A0CCC0800999900009998000BBB0B0A0A0CCC0800000000000000000BB
    B0B0A0A0CCC0800000000000000000BBB0B0A0A0CCC0800000000000008000BB
    B0B0A0A0CCC0800888800008899000BBB0000000CCC0809999800999998000BB
    BBB000CCCCC0809999809900998800BBBBB000CCCCC0800998099809899800BB
    BBB000CCCCC0800998099800099800BBBBB000CCCCC0800998099800099800BB
    BBB000CCCCC0000998099800099800BBBBB000000000000998099800099000BB
    BBB000000000009999809908990000BBBBB000000000009999000999900000BB
    BBB000000000000000000000000000BBBBB00000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFE07FFFFF807FFFFF807FFFFF807E3C1F807C181F800188FF800
    78C7F80078E3F80070F1F8007C78C0007C58800040C1800061E180007FFF8000
    7FFF80007FFD800061E180004181808041308080622080806238808062388080
    E2388080E23980FFC12380FFC38780FFFFFF80FFFFFF80FFFFFFFFFFFFFF}
  Position = poScreenCenter
  OnCreate = FormCreate
  object Splitter1: TUniSplitter
    Left = 199
    Top = 0
    Width = 3
    Height = 162
    Cursor = crHSplit
    Align = alRight
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 162
    Width = 320
    Height = 33
    Align = alBottom
    TabOrder = 0
    object Panel2: TUniPanel
      Left = 149
      Top = 0
      Width = 171
      Height = 33
      Align = alRight
      TabOrder = 0
      object btnOK: TUniButton
        Left = 4
        Top = 6
        Width = 75
        Height = 25
        Caption = 'OK'
        ModalResult = 1
      end
      object Button2: TUniButton
        Left = 95
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Cancel'
        ModalResult = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 202
    Top = 0
    Width = 118
    Height = 162
    Align = alRight
    Caption = 'Panel3'
    TabOrder = 1
    OnResize = Panel3Resize
    object FileListBox1: TFileListBox
      Left = 1
      Top = 26
      Width = 116
      Height = 135
      Align = alClient
      FileEdit = Edit1
      ItemHeight = 13
      TabOrder = 0
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 116
      Height = 25
      Align = alTop
      TabOrder = 1
      object Edit1: TUniEdit
        Left = 1
        Top = 2
        Width = 115
        Height = 21
        TabOrder = 0
        Text = '*.*'
        OnChange = Edit1Change
      end
    end
  end
  object Panel5: TUniPanel
    Left = 0
    Top = 0
    Width = 199
    Height = 162
    Align = alClient
    TabOrder = 2
    OnResize = Panel5Resize
    object DirectoryListBox1: TDirectoryListBox
      Left = 1
      Top = 26
      Width = 197
      Height = 135
      Align = alClient
      Columns = 2
      FileList = FileListBox1
      ItemHeight = 16
      TabOrder = 0
    end
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 197
      Height = 25
      Align = alTop
      TabOrder = 1
      object DriveComboBox1: TDriveComboBox
        Left = 3
        Top = 2
        Width = 194
        Height = 19
        DirList = DirectoryListBox1
        TabOrder = 0
      end
    end
  end
end
