inherited FrmIQDBTransImportTextFile: TFrmIQDBTransImportTextFile
  Left = 296
  Top = 128
  ClientHeight = 407
  ClientWidth = 523
  Caption = 'Import Text File Wizard'
  OnShow = FormShow
  OldCreateOrder = True
  ExplicitWidth = 539
  ExplicitHeight = 466
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel4: TUniPanel
    Width = 523
    TabOrder = 2
    ExplicitWidth = 523
  end
  object Panel8: TUniPanel [1]
    Left = 0
    Top = 372
    Width = 523
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 315
    object PnlWizardBtnsRight: TUniPanel
      Left = 101
      Top = 1
      Width = 421
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniBitBtn
        Left = 6
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Close'
        ModalResult = 2
        TabOrder = 0
        OnClick = btnCancelClick
      end
      object btnBack: TUniBitBtn
        Left = 113
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Glyph.Data = {
          46010000424D460100000000000076000000280000001A0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDD000000DDDDDD0DDDDDDDDDDDD7FDDDDD000000DDDDD00DDDDD
          DDDDDD77FDDDDD000000DDDD060DDDDDDDDDD7D7FFFFFD000000DDD06600000D
          DDDD7DD77777FD000000DD066666660DDDD7DDDDDDD7FD000000D0666666660D
          DD78FDDDDDD7FD000000DD066666660DDDD78FDDFFF7FD000000DDD06600000D
          DDDD78F77777DD000000DDDD060DDDDDDDDDD787FDDDDD000000DDDDD00DDDDD
          DDDDDD77FDDDDD000000DDDDDD0DDDDDDDDDDDD7DDDDDD000000DDDDDDDDDDDD
          DDDDDDDDDDDDDD000000}
        Caption = '&Back'
        TabOrder = 1
        OnClick = btnBackClick
      end
      object btnNext: TUniBitBtn
        Left = 215
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Glyph.Data = {
          46010000424D460100000000000076000000280000001A0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDFDDDDD000000DDDDDD0DDDDDDDDDDDD7FFDDDD000000DDDDDD00DDDD
          DDDDDDD778FDDD000000DDDDDD060DDDDDDDFFF7F78FDD000000DD00000660DD
          DDD77777DD78FD000000DD066666660DDDD7FDDDDDD78F000000DD0666666660
          DDD7FDDDDDDD7D000000DD066666660DDDD7FFFFFDD7DD000000DD00000660DD
          DDD77777FD7DDD000000DDDDDD060DDDDDDDDDD7F7DDDD000000DDDDDD00DDDD
          DDDDDDD77DDDDD000000DDDDDD0DDDDDDDDDDDD7DDDDDD000000DDDDDDDDDDDD
          DDDDDDDDDDDDDD000000}
        Caption = '&Next'
        TabOrder = 2
        OnClick = btnNextClick
      end
      object btnFinish: TUniBitBtn
        Left = 317
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Finish'
        TabOrder = 3
        OnClick = btnFinishClick
      end
    end
  end
  inherited PnlMain: TUniPanel
    Width = 523
    Height = 369
    TabOrder = 1
    ExplicitWidth = 523
    ExplicitHeight = 312
    object Bevel1: TUniPanel
      Left = 1
      Top = 205
      Width = 521
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
      ExplicitTop = 183
    end
    object PnlPageControl1: TUniPanel
      Left = 1
      Top = 1
      Width = 521
      Height = 204
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object pcMain: TUniPageControl
        Left = 1
        Top = 1
        Width = 519
        Height = 202
        Hint = ''
        ActivePage = TabFormat
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitHeight = 180
        object TabFormat: TUniTabSheet
          Tag = 1999
          Hint = ''
          ImageIndex = 3
          Caption = 'TabFormat'
          ExplicitHeight = 152
          object Panel4: TUniPanel
            Tag = 1999
            Left = 0
            Top = 60
            Width = 511
            Height = 114
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitHeight = 92
            object rgTextFormat: TUniRadioGroup
              Left = 16
              Top = 5
              Width = 385
              Height = 70
              Hint = ''
              Items.Strings = (
                
                  'Delimited - Fields are separated by characters such as a comma o' +
                  'r a tab'
                'Fixed Width - Fields are separated by a fixed number of spaces ')
              ItemIndex = 0
              Caption = ' Text Format '
              TabOrder = 0
              OnClick = rgTextFormatClick
            end
          end
          object cpnlFormat: TIQWebCaptionPanel
            Left = 0
            Top = 0
            Width = 511
            Height = 60
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = 'What is the format of the data file?'
            ParentColor = True
            Text = 'Please choose which format best describes your data file.'
            PictureLayout = plImageRight
            LayoutStyle = lsBasic
            DesignSize = (
              511
              60)
          end
        end
        object TabDelimOptions: TUniTabSheet
          Tag = 1999
          Hint = ''
          Caption = 'TabDelimOptions'
          ExplicitHeight = 152
          object Panel2: TUniPanel
            Tag = 1999
            Left = 0
            Top = 60
            Width = 511
            Height = 114
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitHeight = 92
            object Label2: TUniLabel
              Left = 16
              Top = 12
              Width = 65
              Height = 13
              Hint = 'What character identifies text?'
              Caption = 'Text Qualifier'
              TabOrder = 1
            end
            object Label1: TUniLabel
              Left = 16
              Top = 36
              Width = 73
              Height = 13
              Hint = 'What character separates each field?'
              Caption = 'Field Separator'
              TabOrder = 3
            end
            object cmbDelimiter: TUniComboBox
              Left = 132
              Top = 8
              Width = 119
              Height = 21
              Hint = ''
              Text = '"'
              Items.Strings = (
                '"'
                #39
                '<None>')
              TabOrder = 4
              OnChange = DoFormatCtrlChange
            end
            object cmbSeparator: TUniComboBox
              Left = 132
              Top = 32
              Width = 119
              Height = 21
              Hint = ''
              Text = ','
              Items.Strings = (
                ','
                '|'
                ';'
                'Tab')
              TabOrder = 5
              OnChange = DoFormatCtrlChange
            end
            object chkHasFieldNames: TUniCheckBox
              Left = 16
              Top = 56
              Width = 452
              Height = 17
              Hint = ''
              Caption = 'First row contains field names'
              TabOrder = 2
              OnClick = chkHasFieldNamesClick
            end
          end
          object cpnlDelimOptions: TIQWebCaptionPanel
            Left = 0
            Top = 0
            Width = 511
            Height = 60
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Caption = 'How are the fields identified in the data file?'
            ParentColor = True
            Text = 
              'Choose which delimiter separates fields and specify a character ' +
              'that identifies text fields.'
            PictureLayout = plImageRight
            LayoutStyle = lsBasic
            DesignSize = (
              511
              60)
          end
        end
        object TabFixedOptions: TUniTabSheet
          Tag = 1999
          Hint = ''
          ImageIndex = 3
          Caption = 'TabFixedOptions'
          ExplicitHeight = 152
          object Panel1: TUniPanel
            Tag = 1999
            Left = 0
            Top = 60
            Width = 511
            Height = 114
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitHeight = 92
            object gbFixedOptions: TUniGroupBox
              Left = 24
              Top = 5
              Width = 480
              Height = 59
              Hint = ''
              Caption = ''
              TabOrder = 0
              object Label6: TUniLabel
                Left = 8
                Top = 9
                Width = 161
                Height = 13
                Hint = ''
                Caption = 'Vertical lines indicate field breaks:'
                TabOrder = 1
              end
              object Label8: TUniLabel
                Left = 16
                Top = 25
                Width = 288
                Height = 13
                Hint = ''
                Caption = 'To create a break line, click the ruler at the desired position.'
                TabOrder = 2
              end
              object Label9: TUniLabel
                Left = 16
                Top = 41
                Width = 206
                Height = 13
                Hint = ''
                Caption = 'To delete a break line, double click the line.'
                TabOrder = 3
              end
              object Label11: TUniLabel
                Left = 16
                Top = 57
                Width = 184
                Height = 13
                Hint = ''
                Caption = 'To move a break line, click and drag it.'
                TabOrder = 4
              end
            end
          end
          object cpnlFixedOptions: TIQWebCaptionPanel
            Left = 0
            Top = 0
            Width = 511
            Height = 60
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = 'How are the fields spaced in the data file?'
            ParentColor = True
            Text = 
              'The wizard has guessed how the fields are separated.  Please mak' +
              'e any needed adjustments.'
            PictureLayout = plImageRight
            LayoutStyle = lsBasic
            DesignSize = (
              511
              60)
          end
        end
        object TabFieldOptions: TUniTabSheet
          Tag = 1999
          Hint = ''
          ImageIndex = 1
          Caption = 'TabFieldOptions'
          ExplicitHeight = 152
          object Panel3: TUniPanel
            Tag = 1999
            Left = 0
            Top = 60
            Width = 511
            Height = 114
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitHeight = 92
            object gbFieldOptions: TUniGroupBox
              Left = 16
              Top = 12
              Width = 433
              Height = 76
              Hint = ''
              Caption = ' Field Options '
              TabOrder = 0
              object lblFieldName: TUniLabel
                Left = 16
                Top = 20
                Width = 52
                Height = 13
                Hint = ''
                Caption = 'Field Name'
                TabOrder = 3
              end
              object sbtnApplyFieldName: TUniSpeedButton
                Left = 368
                Top = 16
                Width = 22
                Height = 22
                Hint = 'Apply field name'
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
                OnClick = DoApplyFieldName
              end
              object Label3: TUniLabel
                Left = 16
                Top = 44
                Width = 50
                Height = 13
                Hint = ''
                Caption = 'Data Type'
                TabOrder = 5
              end
              object sbtnEditDataType: TUniSpeedButton
                Left = 368
                Top = 40
                Width = 22
                Height = 22
                Hint = 'Edit data type'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFDDDDD00000000
                  00DDDDDD7777777777FDDDDD0FFFFFFFF0DDDDDD7FDDDDDDD7FDDDDD0FFFFFFF
                  F0DDDDDD7FDDDDDDD7FDDDDD0FF80FFFF0DDDDDD7FD87FDDD7FDDDDD0F800FFF
                  F0DDDDDD7F877FDDD7FDDDDD080B0FFFF0DDDDDD787F7DDDD7FDDDDD00B0FFFF
                  F0DDDDDD77F7DDDDD7FDDDDD0B0FFFFFF0DDDDDD7F7DDDDDD7FDDDD0B0FFFFFF
                  F0DDDDD7F7DDDDDDD7FDDD0B0FFFFFFFF0DDDD7F7FDDDDDDD7FDD0B07FFFFFFF
                  F0DDD7F77FFFFFFFF7FDD90D0000000000DDD77D7777777777DDDDDDDDDDDDDD
                  DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnEditDataTypeClick
              end
              object edtFieldName: TUniEdit
                Left = 144
                Top = 16
                Width = 220
                Height = 21
                Hint = ''
                CharCase = ecUpperCase
                MaxLength = 23
                Text = ''
                TabOrder = 0
                OnExit = DoApplyFieldName
                OnKeyPress = edtFieldNameKeyPress
              end
              object edtFieldDataType: TUniEdit
                Left = 144
                Top = 40
                Width = 220
                Height = 21
                Hint = ''
                CharCase = ecUpperCase
                Text = ''
                TabOrder = 1
                Color = clBtnFace
                ReadOnly = True
              end
              object cmbDataType: TUniComboBox
                Left = 144
                Top = 40
                Width = 220
                Height = 21
                Hint = ''
                Style = csDropDownList
                Text = ''
                TabOrder = 7
                OnChange = cmbDataTypeChange
              end
            end
          end
          object cpnlFieldOptions: TIQWebCaptionPanel
            Left = 0
            Top = 0
            Width = 511
            Height = 60
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = 'Field information'
            ParentColor = True
            Text = 
              'You can specify information about the fields you want to import.' +
              '  Select fields from the grid.  You can modify the field informa' +
              'tion in the Field Options area.'
            PictureLayout = plImageRight
            LayoutStyle = lsBasic
            DesignSize = (
              511
              60)
          end
        end
      end
    end
    object PnlDisplayPageControl: TUniPanel
      Left = 1
      Top = 208
      Width = 521
      Height = 160
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ParentColor = True
      ExplicitTop = 186
      ExplicitHeight = 125
      object pcView: TUniPageControl
        Left = 1
        Top = 1
        Width = 519
        Height = 158
        Hint = ''
        ActivePage = TabDataView
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitHeight = 123
        object TabTextView: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'Text File Contents'
          ExplicitHeight = 95
          object PnlDataFileName: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 511
            Height = 15
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            object lblSampleData: TUniLabel
              Left = 1
              Top = 1
              Width = 168
              Height = 13
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              Caption = 'Sample data from file: <Unknown>'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 1
            end
          end
          object PnlFixedText: TUniPanel
            Left = 0
            Top = 15
            Width = 511
            Height = 115
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitHeight = 80
          end
        end
        object TabDataView: TUniTabSheet
          Hint = ''
          Caption = 'Data Preview'
          ExplicitHeight = 95
          object PnlGridData: TUniPanel
            Left = 0
            Top = 0
            Width = 511
            Height = 130
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = 'There is no data to display.'
            Color = clWhite
            ExplicitHeight = 95
            object Grid: TUniStringGrid
              Left = 1
              Top = 1
              Width = 509
              Height = 128
              Hint = ''
              FixedCols = 0
              RowCount = 2
              ColCount = 2
              DefaultRowHeight = 17
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goThumbTracking]
              Columns = <>
              OnDrawCell = GridDrawCell
              OnSelectCell = GridSelectCell
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              ExplicitHeight = 93
            end
          end
        end
      end
    end
  end
  object List_Images: TUniImageList [3]
    Left = 308
    Top = 210
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000FF000000FF000000FF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000FF000000FF000000FF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000FF000000FF000000FF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000FF000000FF000000FF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000FF000000FF000000FF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFEFF00000000FFFFFC7F00000000FFFFF83F00000000FFFFFC7F00000000
      FFFFFEFF00000000FFFFFC7F00000000FFFFFC7F00000000FFFFF83F00000000
      FFFFF83F00000000FFFFF83F00000000FFFFF83F00000000FFFFFC7F00000000
      FFFFFEFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  inherited MainMenu1: TUniMainMenu
    Left = 224
    Top = 210
  end
  object OpenSourceDlg: TOpenDialog
    DefaultExt = '.DBF'
    Filter = 
      'dBase Files (*.dbf)|*.dbf|Text Files (*.txt, *.csv)|*.txt; *.csv' +
      '|Microsoft Access Database (*.mdb;*.mde;*.accdb;*.accde)|*.mdb;*' +
      '.mde;*.accdb;*.accde|All Files (*.*)|*.*'
    Left = 280
    Top = 210
  end
  object PData: TUniPopupMenu
    Left = 252
    Top = 210
    object Refresh1: TUniMenuItem
      Caption = 'Refresh'
      ShortCut = 116
      OnClick = Refresh1Click
    end
  end
  object SrcSource: TDataSource
    DataSet = QrySource
    Left = 440
    Top = 176
  end
  object QrySource: TIQWebDbxQuery
    Aggregates = <>
    ParamCheck = True
    Left = 440
    Top = 232
  end
end
