object FrmProdNewManualRepDialog: TFrmProdNewManualRepDialog
  Left = 293
  Top = 242
  HelpContext = 1010352
  ClientHeight = 160
  ClientWidth = 358
  Caption = 'New Production'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TUniPanel
    Left = 0
    Top = 111
    Width = 358
    Height = 49
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 356
      Height = 2
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object pnlBotomBtns: TUniPanel
      Left = 89
      Top = 2
      Width = 269
      Height = 47
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 2
        Top = 9
        Width = 120
        Height = 30
        Hint = ''
        HelpContext = 1012369
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 137
        Top = 9
        Width = 119
        Height = 30
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 358
    Height = 111
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 144
      Top = 0
      Width = 4
      Height = 111
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 144
      Height = 109
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 18
        Top = 15
        Width = 96
        Height = 16
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Production Date'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 18
        Top = 44
        Width = 25
        Height = 16
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Shift'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 18
        Top = 74
        Width = 23
        Height = 16
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cell'
        TabOrder = 3
      end
    end
    object Panel4: TUniPanel
      Left = 148
      Top = 1
      Width = 210
      Height = 109
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        210
        109)
      object timeProdDate: TUniDateTimePicker
        Left = 1
        Top = 10
        Width = 212
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DateTime = 42663.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edShift: TUniEdit
        Left = 1
        Top = 39
        Width = 32
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = '1'
        TabOrder = 1
      end
      object wwcombMfgCell: TUniDBLookupComboBox
        Left = 1
        Top = 69
        Width = 212
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ListFieldIndex = 0
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clWindow
      end
    end
  end
  object wwQuery1: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(mfgcell) as mfgcell,'
      '       RTrim(mfgtype) as mfgtype,'
      '       eplant_id'
      '  from mfgcell'
      ' where mfg.is_mfgtype_pm(mfgtype) = 0'
      'order by mfgcell'
      ' ')
    Left = 56
    Top = 64
    object wwQuery1MFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Size = 15
    end
    object wwQuery1MFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Size = 10
    end
    object wwQuery1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = wwQuery1
    Left = 64
    Top = 31
  end
end
