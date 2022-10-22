object FrmAcctMask: TFrmAcctMask
  Left = 287
  Top = 164
  ClientHeight = 291
  ClientWidth = 553
  Caption = 'Account Structure'
  OnShow = FormShow
  Position = poDesktopCenter
  OldCreateOrder = True
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel6: TUniPanel
    Left = 0
    Top = 0
    Width = 553
    Height = 291
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlMain: TUniPanel
      Left = 1
      Top = 1
      Width = 441
      Height = 208
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Bevel1: TUniPanel
        Left = 1
        Top = 27
        Width = 439
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Caption = ''
      end
      object PnlToolbar: TUniPanel
        Left = 1
        Top = 1
        Width = 439
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object NavMain: TUniDBNavigator
          Left = 214
          Top = 1
          Width = 225
          Height = 25
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataSource = SrcGlAcct_Def
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object DBGridAcct_Def: TUniDBGrid
        Left = 1
        Top = 30
        Width = 439
        Height = 178
        Hint = ''
        DataSource = SrcGlAcct_Def
        LoadMask.Message = 'Loading data...'
        OnKeyDown = DBGridAcct_DefKeyDown
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        OnDrawColumnCell = DBGridAcct_DefDrawColumnCell
        Columns = <
          item
            FieldName = 'SEQ'
            Title.Caption = 'Sequence #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'GROUP_NAME'
            Title.Caption = 'Description'
            Width = 114
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'GROUP_START'
            Title.Caption = 'Start'
            Width = 38
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'GROUP_LENGTH'
            Title.Caption = 'Length'
            Width = 43
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FILL_CHAR'
            Title.Caption = 'Filler'
            Width = 26
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SEP_CHAR'
            Title.Caption = 'Separator'
            Width = 52
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
    object Panel1: TUniPanel
      Tag = 1999
      Left = 441
      Top = 1
      Width = 112
      Height = 208
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object BitBtnOk: TUniBitBtn
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Glyph.Data = {
          BE060000424DBE06000000000000360400002800000024000000120000000100
          0800000000008802000000000000000000000001000000010000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303030303030303030303030303030303030303030313030303030303030303
          030303030303030404030303030303030303030303030303030C0C1303030303
          030303030303030303030402020403030303030303030303030303030C03030C
          130303030303030303030303030402020202040303030303030303030303030C
          030303030C130303030303030303030304020202020202040303030303030303
          03030C0303030303030C130303030303030303040202020E0202020204030303
          03030303030C1303030C130303030C13030303030303030202020E030E020202
          0403030303030303030C13030C030C1303030C13030303030303030E020E0303
          030E02020204030303030303030C130C0303030C1303030C1303030303030303
          0E03030303030E02020204030303030303030C03030303030C1303030C130303
          03030303030303030303030E02020204030303030303030303030303030C1303
          030C13030303030303030303030303030E020202040303030303030303030303
          03030C1303030C13030303030303030303030303030E02020204030303030303
          030303030303030C1303030C13030303030303030303030303030E0202020403
          0303030303030303030303030C1303030C13030303030303030303030303030E
          02020403030303030303030303030303030C13030C1303030303030303030303
          030303030E02020303030303030303030303030303030C130C03030303030303
          0303030303030303030E03030303030303030303030303030303030C03030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303}
        Caption = 'OK'
        TabOrder = 0
        Default = True
        OnClick = BitBtnOkClick
      end
      object BitBtnCancle: TUniBitBtn
        Left = 8
        Top = 40
        Width = 97
        Height = 25
        Hint = ''
        Glyph.Data = {
          BE060000424DBE06000000000000360400002800000024000000120000000100
          0800000000008802000000000000000000000001000000010000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          03030C0C03030303030303030303030303030303031303030303030303030303
          03030303030D01010C03030303030D0C03030303030303030C0C130303030303
          0313030303030303030D0101010C0303030D01010C0303030303030C13030C13
          030303130C0C130303030303030D010101010C030D010101010C03030303030C
          1303030C1303130C03030C130303030303030D010101010C01010101010C0303
          0303030C130303030C130C030303030C130303030303030D0101010101010101
          0C030303030303030C130303030C03030303130C03030303030303030D010101
          0101010C0303030303030303030C13030303030303130C030303030303030303
          0301010101010C03030303030303030303030C1303030303030C030303030303
          03030303030D010101010C0303030303030303030303030C130303030C030303
          03030303030303030D01010101010C0303030303030303030303030C03030303
          0C130303030303030303030D0101010C0101010C030303030303030303030C03
          030303030C1303030303030303030D0101010C030D0101010C03030303030303
          030C0303030C1303030C13030303030303030D01010C0303030D0101010C0303
          030303030C1303030C030C1303030C13030303030303030D0103030303030D01
          01010303030303030C13130C0303030C1303030C130303030303030303030303
          0303030D010D030303030303030C0C03030303030C1313130C03030303030303
          030303030303030303030303030303030303030303030303030C0C0C03030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303}
        Caption = 'Cancel'
        Cancel = True
        TabOrder = 1
        OnClick = BitBtnCancleClick
      end
    end
    object PnlSample: TUniPanel
      Tag = 1999
      Left = 1
      Top = 208
      Width = 551
      Height = 83
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object Panel11: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 549
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label1: TUniLabel
          Left = 1
          Top = 1
          Width = 42
          Height = 13
          Hint = ''
          Caption = 'Sample'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel2: TUniPanel
        Tag = 1999
        Left = 1
        Top = 20
        Width = 549
        Height = 63
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Panel3: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 547
          Height = 61
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Font.Name = 'Courier'
          TabOrder = 0
          Caption = ''
          Color = clWhite
          object Label3: TUniLabel
            Left = 5
            Top = 3
            Width = 451
            Height = 13
            Hint = ''
            Caption = '         1         2         3         4         5'
            ParentFont = False
            Font.Color = clBtnShadow
            Font.Name = 'Courier'
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object Label2: TUniLabel
            Left = 5
            Top = 18
            Width = 451
            Height = 13
            Hint = ''
            Caption = '12345678901234567890123456789012345678901234567890'
            ParentFont = False
            Font.Color = clBtnShadow
            Font.Name = 'Courier'
            Font.Style = [fsBold, fsUnderline]
            TabOrder = 2
          end
          object LblSample: TUniLabel
            Left = 5
            Top = 37
            Width = 451
            Height = 13
            Hint = ''
            Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
            ParentFont = False
            Font.Color = clBlack
            Font.Name = 'Courier'
            Font.Style = [fsBold]
            TabOrder = 3
          end
        end
      end
    end
  end
  object SrcGlAcct_Def: TDataSource
    DataSet = TblGLAcct_Def
    Left = 16
    Top = 136
  end
  object TblGLAcct_Def: TFDTable
    BeforePost = TblGLAcct_DefBeforePost
    AfterPost = TblGLAcct_DefAfterPost
    BeforeDelete = TblGLAcct_DefBeforeDelete
    AfterDelete = TblGLAcct_DefAfterDelete
    OnNewRecord = TblGLAcct_DefNewRecord
    IndexFieldNames = 'SEQ'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLACCT_DEF'
    TableName = 'GLACCT_DEF'
    Left = 48
    Top = 136
    object TblGLAcct_DefGROUP_NAME: TStringField
      DisplayLabel = 'Description'
      FieldName = 'GROUP_NAME'
      Required = True
      OnValidate = TblGLAcct_DefGROUP_NAMEValidate
      Size = 10
    end
    object TblGLAcct_DefSEQ: TBCDField
      DisplayLabel = 'Sequence'
      FieldName = 'SEQ'
      Required = True
      Size = 0
    end
    object TblGLAcct_DefGROUP_START: TBCDField
      DisplayLabel = 'Start'
      FieldName = 'GROUP_START'
      Required = True
      Size = 0
    end
    object TblGLAcct_DefGROUP_LENGTH: TBCDField
      DisplayLabel = 'Length'
      FieldName = 'GROUP_LENGTH'
      Required = True
      Size = 0
    end
    object TblGLAcct_DefFILL_CHAR: TBCDField
      DisplayLabel = 'Filler'
      FieldName = 'FILL_CHAR'
      Size = 0
    end
    object TblGLAcct_DefSEP_CHAR: TStringField
      DisplayLabel = 'Separator'
      FieldName = 'SEP_CHAR'
      Size = 1
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 280
    Top = 64
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object HelpContents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = HelpContents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Account Structure'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193860 $'
    BuildVersion = '176554'
    Left = 232
    Top = 56
  end
end
