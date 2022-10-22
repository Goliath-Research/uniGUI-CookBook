object FrmWeightWorkSheet: TFrmWeightWorkSheet
  Left = 426
  Top = 229
  HelpContext = -109
  ClientHeight = 113
  ClientWidth = 293
  Caption = 'Weight WorkSheet'
  OnShow = UniFormShow
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 72
    Width = 293
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 75
      Top = 1
      Width = 217
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 111
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 293
    Height = 72
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel11: TUniPanel
      Left = 1
      Top = 1
      Width = 291
      Height = 70
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter4: TUniSplitter
        Left = 60
        Top = 1
        Width = 6
        Height = 68
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel13: TUniPanel
        Left = 66
        Top = 1
        Width = 224
        Height = 68
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object sbtnVolume: TUniSpeedButton
          Left = 126
          Top = 30
          Width = 22
          Height = 22
          Hint = 'Volume Calculator'
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
          OnClick = sbtnVolumeClick
        end
        object lblVolumeUOM: TUniLabel
          Left = 157
          Top = 35
          Width = 35
          Height = 13
          Hint = ''
          Caption = '(Cu.In)'
          TabOrder = 4
        end
        object DBEdit1: TUniDBEdit
          Left = 3
          Top = 6
          Width = 121
          Height = 21
          Hint = ''
          DataField = 'SPG'
          DataSource = SrcQinvt
          TabOrder = 0
        end
        object edVolume: TUniEdit
          Left = 3
          Top = 30
          Width = 121
          Height = 21
          Hint = ''
          Text = '0'
          TabOrder = 1
        end
      end
      object Panel14: TUniPanel
        Left = 1
        Top = 1
        Width = 59
        Height = 68
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        Caption = ''
        object Label1: TUniLabel
          Left = 5
          Top = 10
          Width = 19
          Height = 13
          Hint = ''
          Caption = 'SPG'
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 5
          Top = 34
          Width = 34
          Height = 13
          Hint = ''
          Caption = 'Volume'
          TabOrder = 2
        end
      end
    end
  end
  object SrcQinvt: TDataSource
    DataSet = TblQinvt
    Left = 10
    Top = 83
  end
  object TblQinvt: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'QINVT'
    TableName = 'QINVT'
    Left = 25
    Top = 84
    object TblQinvtID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 0
    end
    object TblQinvtSPG: TFMTBCDField
      FieldName = 'SPG'
      Size = 6
    end
    object TblQinvtITEMNO: TStringField
      FieldName = 'ITEMNO'
      Required = True
      Size = 50
    end
    object TblQinvtREV: TStringField
      FieldName = 'REV'
      Size = 15
    end
  end
end
