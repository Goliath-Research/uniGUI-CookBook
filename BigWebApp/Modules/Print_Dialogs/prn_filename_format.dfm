object FrmPrnFileNameFormat: TFrmPrnFileNameFormat
  Left = 267
  Top = 203
  ClientHeight = 336
  ClientWidth = 382
  Caption = 'Format File Name'
  OnShow = UniFormShow
  OnResize = FormResize
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 299
    Width = 382
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 161
      Top = 1
      Width = 220
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 1
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 112
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object pnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 299
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Bevel2: TUniPanel
      Left = 1
      Top = 59
      Width = 380
      Height = 5
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 380
      Height = 58
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object GroupBox1: TUniGroupBox
        Left = 1
        Top = 1
        Width = 378
        Height = 56
        Hint = ''
        Caption = '  General  '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object Label1: TUniLabel
          Left = 25
          Top = 24
          Width = 48
          Height = 13
          Hint = ''
          Caption = 'Separator'
          TabOrder = 2
        end
        object Bevel6: TUniPanel
          Left = 2
          Top = 15
          Width = 19
          Height = 39
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 3
          Caption = ''
        end
        object DBEdit1: TUniDBEdit
          Left = 87
          Top = 20
          Width = 48
          Height = 21
          Hint = ''
          DataField = 'SEPARATOR'
          DataSource = SrcFileNameFormat
          TabOrder = 0
        end
      end
    end
    object Panel8: TUniPanel
      Left = 1
      Top = 64
      Width = 380
      Height = 234
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object GroupBox2: TUniGroupBox
        Left = 1
        Top = 1
        Width = 378
        Height = 232
        Hint = ''
        Caption = '  Format Settings  '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object Splitter1: TUniSplitter
          Left = 207
          Top = 20
          Width = 4
          Height = 205
          Hint = ''
          Align = alRight
          ParentColor = False
          Color = clBtnFace
        end
        object Bevel4: TUniPanel
          Left = 2
          Top = 15
          Width = 374
          Height = 5
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Caption = ''
        end
        object bvlLeft1: TUniPanel
          Left = 2
          Top = 20
          Width = 19
          Height = 205
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 5
          Caption = ''
        end
        object Bevel1: TUniPanel
          Left = 2
          Top = 225
          Width = 374
          Height = 5
          Hint = ''
          Align = alBottom
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 6
          Caption = ''
        end
        object Panel5: TUniPanel
          Left = 21
          Top = 20
          Width = 186
          Height = 205
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object pnlLeftRightBtns: TUniPanel
            Left = 158
            Top = 1
            Width = 27
            Height = 203
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              27
              203)
            object Panel2: TUniPanel
              Left = 0
              Top = 61
              Width = 27
              Height = 88
              Hint = ''
              Anchors = [akLeft]
              TabOrder = 0
              Caption = ''
              object SBRight: TUniSpeedButton
                Left = 2
                Top = 3
                Width = 25
                Height = 25
                Hint = 'Add to Selected'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001A0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  88888888F8888800000088888808888888888887FF8888000000888888008888
                  8888888778F8880000008888880608888888FFF7F78F88000000880000066088
                  888777778878F80000008806666666088887F88888878F000000880666666660
                  8887F8888888780000008806666666088887FFFFF88788000000880000066088
                  88877777F8788800000088888806088888888887F78888000000888888008888
                  8888888778888800000088888808888888888887888888000000888888888888
                  88888888888888000000}
                Caption = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Style = [fsBold]
                ParentColor = False
                Color = clWindow
                OnClick = Add1Click
              end
              object SBLeft: TUniSpeedButton
                Left = 2
                Top = 33
                Width = 25
                Height = 25
                Hint = 'Remove from Selected'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001A0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888888800000088888808888888888887F88888000000888880088888
                  88888877F8888800000088880608888888888787FFFFF8000000888066000008
                  888878877777F8000000880666666608888788888887F8000000806666666608
                  8878F8888887F800000088066666660888878F88FFF7F8000000888066000008
                  888878F777778800000088880608888888888787F88888000000888880088888
                  88888877F8888800000088888808888888888887888888000000888888888888
                  88888888888888000000}
                Caption = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Style = [fsBold]
                ParentColor = False
                Color = clWindow
                OnClick = Remove1Click
              end
              object SpeedButton1: TUniSpeedButton
                Left = 2
                Top = 65
                Width = 25
                Height = 25
                Hint = 'Clear Selected'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  56010000424D560100000000000076000000280000001C0000000E0000000100
                  040000000000E000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDD0000DDDDD0DD0DDD
                  DDDDDDD7FD7FDDDD0000DDDD00D00DDDDDDDDD77F77FDDDD0000DDD060060DDD
                  DDDDD787787FFFFF0000DD06606600000DDD78878877777F0000D06606666666
                  0DD788788888887F00000660666666660D78F78F8888887F0000D06606666666
                  0DD78F78F88FFF7F0000DD06606600000DDD78F78F77777D0000DDD060060DDD
                  DDDDD787787FDDDD0000DDDD00D00DDDDDDDDD77F77FDDDD0000DDDDD0DD0DDD
                  DDDDDDD7DD7DDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDD0000}
                Caption = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Style = [fsBold]
                ParentColor = False
                Color = clWindow
                OnClick = BtnClearClick
              end
            end
          end
          object Panel6: TUniPanel
            Left = 1
            Top = 1
            Width = 157
            Height = 203
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object lstbAvailElem: TUniListBox
              Left = 1
              Top = 21
              Width = 155
              Height = 181
              Hint = ''
              Items.Strings = (
                'Type'
                'Number'
                'Date'
                'Company Name')
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              OnMouseDown = lstbAvailElemMouseDown
            end
            object Panel10: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 155
              Height = 20
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Alignment = taLeftJustify
              Caption = ' Available'
              ParentColor = True
            end
          end
        end
        object pnlSelected: TUniPanel
          Left = 211
          Top = 20
          Width = 165
          Height = 205
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object lstbSelElem: TUniListBox
            Left = 1
            Top = 21
            Width = 163
            Height = 183
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            OnMouseDown = lstbSelElemMouseDown
          end
          object Panel7: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 163
            Height = 20
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Alignment = taLeftJustify
            Caption = ' Selected'
            ParentColor = True
          end
        end
      end
    end
  end
  object QryFileNameFormat: TFDQuery
    BeforeOpen = QryFileNameFormatBeforeOpen
    BeforePost = QryFileNameFormatBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnNewRecord = QryFileNameFormatNewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id, '
      '       source, '
      '       separator '
      '  from filename_format'
      ' where upper(source) = upper(:source)')
    Left = 88
    Top = 200
    ParamData = <
      item
        Name = 'source'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryFileNameFormatID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FILENAME_FORMAT.ID'
      Size = 0
    end
    object QryFileNameFormatSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'IQ.FILENAME_FORMAT.SOURCE'
      Size = 100
    end
    object QryFileNameFormatSEPARATOR: TStringField
      FieldName = 'SEPARATOR'
      Origin = 'IQ.FILENAME_FORMAT.SEPARATOR'
      Size = 5
    end
  end
  object SrcFileNameFormat: TDataSource
    DataSet = QryFileNameFormat
    Left = 88
    Top = 176
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into filename_format'
      '  (ID, SOURCE, SEPARATOR)'
      'values'
      '  (:ID, :SOURCE, :SEPARATOR)')
    ModifySQL.Strings = (
      'update filename_format'
      'set'
      '  ID = :ID,'
      '  SOURCE = :SOURCE,'
      '  SEPARATOR = :SEPARATOR'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from filename_format'
      'where'
      '  ID = :OLD_ID')
    Left = 88
    Top = 224
  end
end
