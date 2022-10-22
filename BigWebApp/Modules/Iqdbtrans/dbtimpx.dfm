inherited FrmIQDBTransImportExcel: TFrmIQDBTransImportExcel
  Left = 264
  Top = 168
  ClientHeight = 349
  ClientWidth = 525
  Caption = 'Import Excel Spreadsheet Wizard'
  OnShow = FormShow
  OldCreateOrder = True
  ExplicitWidth = 541
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel4: TUniPanel
    Width = 525
    TabOrder = 2
    ExplicitWidth = 525
  end
  inherited PnlMain: TUniPanel
    Width = 525
    Height = 311
    ExplicitWidth = 525
    ExplicitHeight = 311
    object PnlTop: TUniPanel
      Left = 1
      Top = 1
      Width = 523
      Height = 309
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object pcMain: TUniPageControl
        Left = 1
        Top = 1
        Width = 521
        Height = 307
        Hint = ''
        ActivePage = TabRange
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabRange: TUniTabSheet
          Hint = ''
          ImageIndex = 2
          Caption = 'TabRange'
          object PnlRange: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 513
            Height = 279
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object cpnlRange: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 511
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Caption = 'Range'
              ParentColor = True
              Text = 'Select range or work sheet.'
              PictureLayout = plImageRight
              LayoutStyle = lsBasic
              DesignSize = (
                511
                60)
            end
            object lstTableList: TUniListBox
              Left = 32
              Top = 88
              Width = 281
              Height = 105
              Hint = ''
              TabOrder = 1
              OnClick = lstTableListClick
            end
          end
        end
        object TabFormat: TUniTabSheet
          Hint = ''
          Caption = 'TabFormat'
          object PnlFormat: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 513
            Height = 279
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object cpnlFormat: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 511
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              Caption = 'Heading Row'
              ParentColor = True
              Text = 'Does the first row in the speadsheet contain field names?'
              PictureLayout = plImageRight
              LayoutStyle = lsBasic
              DesignSize = (
                511
                60)
            end
            object Panel2: TUniPanel
              Left = 1
              Top = 61
              Width = 511
              Height = 50
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                511
                50)
              object chkHasFieldNames: TUniCheckBox
                Left = 16
                Top = 8
                Width = 497
                Height = 17
                Hint = ''
                Checked = True
                Caption = 'First row contains field names'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                OnClick = DoAfterClickCheckbox
              end
              object chkAutoFieldType: TUniCheckBox
                Left = 16
                Top = 24
                Width = 497
                Height = 17
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                Caption = 
                  'Estimate field data types (not recommended if fields contain mix' +
                  'ed data types)'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                OnClick = chkAutoFieldTypeClick
              end
            end
            object PnlGridFormat: TUniPanel
              Left = 1
              Top = 111
              Width = 511
              Height = 167
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 2
              Caption = ''
            end
          end
        end
        object TabFieldOptions: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'TabFieldOptions'
          object PnlFieldOptions: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 513
            Height = 279
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object cpnlFieldOptions: TIQWebCaptionPanel
              Left = 1
              Top = 1
              Width = 511
              Height = 60
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              Caption = 'Field Names'
              ParentColor = True
              Text = 
                'You can modify field names.  Select a grid column, and specify a' +
                ' unique field name.'
              PictureLayout = plImageRight
              LayoutStyle = lsBasic
              DesignSize = (
                511
                60)
            end
            object PnlGridFieldOptions: TUniPanel
              Left = 1
              Top = 129
              Width = 511
              Height = 149
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object Grid: TIQUniGridControl
                Left = 1
                Top = 1
                Width = 509
                Height = 147
                Layout = 'border'
                ParentAlignmentControl = False
                AlignmentControl = uniAlignmentClient
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                IQComponents.Grid.Left = 0
                IQComponents.Grid.Top = 29
                IQComponents.Grid.Width = 292
                IQComponents.Grid.Height = 61
                IQComponents.Grid.Hint = ''
                IQComponents.Grid.DataSource = SrcExcel
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
                IQComponents.Navigator.DataSource = SrcExcel
                IQComponents.Navigator.LayoutConfig.Region = 'east'
                IQComponents.Navigator.TabOrder = 3
                IQComponents.HiddenPanel.Left = 292
                IQComponents.HiddenPanel.Top = 29
                IQComponents.HiddenPanel.Width = 209
                IQComponents.HiddenPanel.Height = 61
                IQComponents.HiddenPanel.Hint = ''
                IQComponents.HiddenPanel.Visible = True
                IQComponents.HiddenPanel.Align = alRight
                IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                IQComponents.FormTab.Hint = ''
                IQComponents.FormTab.ImageIndex = 1
                IQComponents.FormTab.Caption = 'Form'
                IQComponents.FormTab.Layout = 'border'
                DataSource = SrcExcel
                Marker = 0
              end
            end
            object PnlFieldOptionsFieldName: TUniPanel
              Left = 1
              Top = 61
              Width = 511
              Height = 68
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Caption = ''
              object lblFieldType: TUniLabel
                Left = 136
                Top = 88
                Width = 44
                Height = 13
                Hint = ''
                Caption = 'Unknown'
                TabOrder = 2
              end
              object gbFieldOptions: TUniGroupBox
                Left = 16
                Top = 10
                Width = 313
                Height = 50
                Hint = ''
                Caption = ' Field Options '
                TabOrder = 0
                object Label3: TUniLabel
                  Left = 8
                  Top = 20
                  Width = 52
                  Height = 13
                  Hint = ''
                  Caption = 'Field Name'
                  TabOrder = 2
                end
                object sbtnApplyFieldName: TUniSpeedButton
                  Left = 283
                  Top = 16
                  Width = 22
                  Height = 22
                  Hint = 'Apply field name'
                  ShowHint = True
                  ParentShowHint = False
                  Glyph.Data = {
                    5A010000424D5A01000000000000760000002800000013000000130000000100
                    040000000000E400000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                    DDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDDD
                    DDDDDDDDDDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDD000DDDDDDDDDDDDD0
                    0000DDD0F0DDDD0000000DD00000DD0FE0DDDDD0EFEF0DD00000DD0E0DDDDDDD
                    0EFE0DD00000DD0F0DDDDDDD0FEF0DD00000DD0E0DDDDDD0FE0E0DD00000DD0F
                    E0DDD00FE0D00DD00000DDD0FE000EFE0DDD0DD00000DDDD0FEFEF00DDDDDDD0
                    0000DDDDD00000DDDDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDDDDDDDDDDD
                    DDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDDDDDDDDDDDDDDDDDD00000}
                  Caption = ''
                  ParentColor = False
                  Color = clWindow
                  OnClick = DoApplyFieldName
                end
                object edtFieldName: TUniEdit
                  Left = 136
                  Top = 16
                  Width = 145
                  Height = 21
                  Hint = ''
                  CharCase = ecUpperCase
                  Text = ''
                  TabOrder = 0
                  OnExit = DoApplyFieldName
                  OnKeyPress = edtFieldNameKeyPress
                end
              end
            end
          end
        end
      end
    end
  end
  object Panel8: TUniPanel [2]
    Left = 0
    Top = 314
    Width = 525
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlWizardBtnsRight: TUniPanel
      Left = 99
      Top = 1
      Width = 425
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniBitBtn
        Left = 8
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Close'
        ModalResult = 2
        TabOrder = 0
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
        TabOrder = 1
        OnClick = btnBackClick
      end
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
        TabOrder = 2
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
        TabOrder = 3
        OnClick = btnFinishClick
      end
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 384
    Top = 16
  end
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\My Documents\att' +
      'ribute.xls;Extended Properties="Excel 5.0; HDR=No";Persist Secur' +
      'ity Info=False'
    LoginPrompt = False
    Mode = cmRead
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 284
    Top = 16
  end
  object SrcExcel: TDataSource
    DataSet = ADOTable
    Left = 312
    Top = 16
  end
  object ADOTable: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = ADOTableAfterOpen
    TableDirect = True
    Left = 320
    Top = 24
  end
end
