inherited FrmIQDBTransExportTextFile: TFrmIQDBTransExportTextFile
  Left = 372
  Top = 148
  ClientHeight = 436
  ClientWidth = 525
  Caption = 'Export Text File Wizard'
  OnShow = FormShow
  OldCreateOrder = True
  ExplicitWidth = 541
  ExplicitHeight = 495
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel4: TUniPanel
    Width = 525
    TabOrder = 2
    ExplicitWidth = 525
  end
  object Panel8: TUniPanel [1]
    Left = 0
    Top = 401
    Width = 525
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 332
    object PnlWizardBtnsRight: TUniPanel
      Left = 101
      Top = 1
      Width = 423
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnNext: TUniBitBtn
        Left = 217
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
        TabOrder = 0
        OnClick = btnNextClick
      end
      object btnFinish: TUniBitBtn
        Left = 319
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Finish'
        TabOrder = 1
        OnClick = btnFinishClick
      end
      object btnBack: TUniBitBtn
        Left = 115
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
        TabOrder = 2
        OnClick = btnBackClick
      end
      object btnCancel: TUniBitBtn
        Left = 8
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Close'
        ModalResult = 2
        TabOrder = 3
        OnClick = btnCancelClick
      end
    end
  end
  inherited PnlMain: TUniPanel
    Width = 525
    Height = 398
    TabOrder = 1
    ExplicitWidth = 525
    ExplicitHeight = 329
    object Bevel1: TUniPanel
      Left = 1
      Top = 177
      Width = 523
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
      ExplicitTop = 151
    end
    object PnlPageControl1: TUniPanel
      Left = 1
      Top = 1
      Width = 523
      Height = 176
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object pcMain: TUniPageControl
        Left = 1
        Top = 1
        Width = 521
        Height = 174
        Hint = ''
        ActivePage = TabFormat
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitHeight = 148
        object TabFormat: TUniTabSheet
          Hint = ''
          ImageIndex = 3
          Caption = 'TabFormat'
          ExplicitHeight = 120
          object PnlFormat: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 513
            Height = 146
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitHeight = 120
            object CaptionPanel1: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 511
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Caption = 'What is the format of the data file?'
              ParentColor = True
              Text = 'Please choose which format best describes your data file.'
              PictureLayout = plImageRight
              LayoutStyle = lsBasic
              DesignSize = (
                511
                60)
            end
            object rgTextFormat: TUniRadioGroup
              Left = 16
              Top = 66
              Width = 385
              Height = 74
              Hint = ''
              Items.Strings = (
                
                  'Delimited - Fields are separated by characters such as a comma o' +
                  'r a tab'
                'Fixed Width - Fields are separated by a fixed number of spaces ')
              ItemIndex = 0
              Caption = ' Text Format '
              TabOrder = 1
              OnClick = rgTextFormatClick
            end
          end
        end
        object TabDelimOptions: TUniTabSheet
          Hint = ''
          Caption = 'TabDelimOptions'
          ExplicitHeight = 120
          object PnlDelimOptions: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 513
            Height = 146
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitHeight = 120
            object CaptionPanel2: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 511
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
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
            object PnlDelimOptionsCtrls: TUniPanel
              Left = 1
              Top = 61
              Width = 511
              Height = 84
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              ExplicitHeight = 58
              object Label2: TUniLabel
                Left = 16
                Top = 9
                Width = 65
                Height = 13
                Hint = 'What character identifies text?'
                Caption = 'Text Qualifier'
                TabOrder = 1
              end
              object Label1: TUniLabel
                Left = 16
                Top = 33
                Width = 73
                Height = 13
                Hint = 'What character separates each field?'
                Caption = 'Field Separator'
                TabOrder = 3
              end
              object cmbDelimiter: TUniComboBox
                Left = 100
                Top = 5
                Width = 119
                Height = 21
                Hint = ''
                Text = '"'
                Items.Strings = (
                  '"'
                  #39
                  '<None>')
                TabOrder = 4
                OnChange = cmbDelimiterChange
              end
              object cmbSeparator: TUniComboBox
                Left = 100
                Top = 29
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
                OnChange = cmbSeparatorChange
              end
              object chkHasFieldNames: TUniCheckBox
                Left = 16
                Top = 53
                Width = 452
                Height = 17
                Hint = ''
                Caption = 'Include field names on first row'
                TabOrder = 2
                OnClick = chkHasFieldNamesClick
              end
            end
          end
        end
        object TabFixedOptions: TUniTabSheet
          Hint = ''
          ImageIndex = 2
          Caption = 'TabFixedOptions'
          ExplicitHeight = 120
          object PnlFixedOptions: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 513
            Height = 146
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitHeight = 120
            object CaptionPanel3: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 511
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
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
            object PnlFixedOptionsGroup: TUniPanel
              Left = 1
              Top = 61
              Width = 511
              Height = 84
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              ExplicitHeight = 58
              object gbFixedOptions: TUniGroupBox
                Left = 24
                Top = 5
                Width = 480
                Height = 78
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
                  Visible = False
                  Caption = 'To create a break line, click the ruler at the desired position.'
                  TabOrder = 2
                end
                object Label9: TUniLabel
                  Left = 16
                  Top = 41
                  Width = 206
                  Height = 13
                  Hint = ''
                  Visible = False
                  Caption = 'To delete a break line, double click the line.'
                  TabOrder = 3
                end
                object Label11: TUniLabel
                  Left = 16
                  Top = 57
                  Width = 184
                  Height = 13
                  Hint = ''
                  Visible = False
                  Caption = 'To move a break line, click and drag it.'
                  TabOrder = 4
                end
              end
            end
          end
        end
      end
    end
    object PnlFixedText: TUniPanel
      Left = 1
      Top = 180
      Width = 523
      Height = 217
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitTop = 154
      ExplicitHeight = 174
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
  object PData: TUniPopupMenu
    Left = 172
    Top = 250
    object Refresh1: TUniMenuItem
      Caption = 'Refresh'
      ShortCut = 116
    end
  end
  object UniFileUpload1: TUniFileUpload
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Left = 272
    Top = 272
  end
end
