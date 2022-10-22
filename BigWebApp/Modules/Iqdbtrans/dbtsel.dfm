object FrmIQDBTransSelectDB: TFrmIQDBTransSelectDB
  Left = 301
  Top = 179
  ClientHeight = 371
  ClientWidth = 438
  Caption = 'Select Database'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlBottom: TUniPanel
    Left = 0
    Top = 331
    Width = 438
    Height = 40
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 227
      Top = 1
      Width = 210
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 3
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 0
        Default = True
        OnClick = SaveAndClose
      end
      object btnCancel: TUniBitBtn
        Left = 106
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
  end
  object rgDataSource: TUniRadioGroup
    Left = 8
    Top = 8
    Width = 422
    Height = 73
    Hint = ''
    Items.Strings = (
      'System Data Source'
      'File Data Source'
      'Oracle SID')
    ItemIndex = 0
    Caption = ' Select a Datasource '
    TabOrder = 1
    OnClick = rgDataSourceClick
  end
  object PnlClient: TUniPanel
    Left = 8
    Top = 88
    Width = 421
    Height = 236
    Hint = ''
    TabOrder = 2
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 419
      Height = 234
      Hint = ''
      ActivePage = TabFile
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabDSN: TUniTabSheet
        Hint = ''
        Caption = 'TabDSN'
        object PnlDrivers: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 411
          Height = 206
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object PnlDriverType: TUniPanel
            Left = 1
            Top = 169
            Width = 409
            Height = 36
            Hint = ''
            Align = alBottom
            Anchors = [akLeft, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object lblDriverType: TUniLabel
              Left = 8
              Top = 12
              Width = 56
              Height = 13
              Hint = ''
              Caption = 'Driver Type'
              TabOrder = 1
            end
            object cmbDriverType: TUniComboBox
              Left = 80
              Top = 8
              Width = 273
              Height = 21
              Hint = ''
              Style = csDropDownList
              Text = ''
              TabOrder = 2
            end
          end
          object PnlDriverList: TUniPanel
            Left = 1
            Top = 1
            Width = 409
            Height = 168
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object lstDrivers: TUniListView
              Left = 1
              Top = 1
              Width = 407
              Height = 166
              Hint = ''
              RowCount = 1
              ColCount = 4
              Options = [goVertLine, goHorzLine]
              Columns = <
                item
                  Title.Caption = 'Data Source Name'
                  Caption = 'Data Source Name'
                  AutoSize = False
                  Width = 200
                end
                item
                  Title.Caption = 'Description'
                  Caption = 'Description'
                  AutoSize = False
                  Width = 200
                end
                item
                  Title.Caption = 'Driver Name'
                  Caption = 'Driver Name'
                  AutoSize = False
                  Width = 200
                end
                item
                  Title.Caption = 'Type'
                  Caption = 'Type'
                  AutoSize = False
                  Width = 200
                end>
              Items = <>
              OnDblClick = SaveAndClose
              OnChange = lstDriversChange
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
        end
      end
      object TabFile: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'TabFile'
        object PnlFile: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 411
          Height = 206
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          ParentColor = True
          DesignSize = (
            411
            206)
          object lblDatabaseFile: TUniLabel
            Left = 4
            Top = 6
            Width = 65
            Height = 13
            Hint = ''
            Caption = 'Database File'
            TabOrder = 4
          end
          object edtDatabaseFile: TUniEdit
            Left = 4
            Top = 22
            Width = 396
            Height = 21
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            Text = '<Select a database or file>'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Color = clBtnFace
            ReadOnly = True
            OnKeyDown = edtDatabaseFileKeyDown
          end
          object Panel1: TUniPanel
            Left = 380
            Top = 24
            Width = 18
            Height = 18
            Hint = ''
            Anchors = [akTop, akRight]
            TabOrder = 1
            Caption = ''
            object sbtnBrowseToDatabaseFile: TUniSpeedButton
              Left = 0
              Top = 0
              Width = 18
              Height = 18
              Hint = 'Browse for file'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                A6000000424DA60000000000000076000000280000000C000000060000000100
                0400000000003000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                0000DDDDDDDDDDDD0000D00DD00DD00D0000D00DD00DD00D0000DDDDDDDDDDDD
                0000DDDDDDDDDDDD0000}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = sbtnBrowseToDatabaseFileClick
            end
          end
          object lstRecent: TUniListView
            Left = 16
            Top = 48
            Width = 383
            Height = 152
            Hint = ''
            RowCount = 1
            ColCount = 4
            Options = [goVertLine, goHorzLine, goRowSelect]
            Columns = <
              item
                Title.Caption = 'File Name'
                Caption = 'File Name'
                AutoSize = False
                Width = 120
              end
              item
                Title.Caption = 'Directory'
                Caption = 'Directory'
                AutoSize = False
                Width = 220
              end
              item
                Title.Caption = 'Date Modified'
                Caption = 'Date Modified'
                AutoSize = False
                Width = 90
              end
              item
                Title.Caption = 'Size'
                Caption = 'Size'
                AutoSize = False
                Width = 80
              end>
            Items = <>
            isRowSelect = True
            PopupMenu = PRecent
            OnDblClick = lstRecentDblClick
            OnClick = lstRecentClick
            OnKeyDown = lstRecentKeyDown
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 2
          end
        end
      end
      object TabOracle: TUniTabSheet
        Hint = ''
        ImageIndex = 2
        Caption = 'TabOracle'
        object PnlOracle: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 411
          Height = 206
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object lstOracle: TUniListBox
            Left = 1
            Top = 1
            Width = 409
            Height = 204
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            OnDblClick = SaveAndClose
          end
        end
      end
    end
  end
  object PRecent: TUniPopupMenu
    Left = 264
    Top = 16
    object Clear1: TUniMenuItem
      Caption = 'Clear'
      OnClick = Clear1Click
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
    Left = 208
    Top = 184
  end
end
