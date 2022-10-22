object FrmPlmParams: TFrmPlmParams
  Left = 346
  Top = 339
  ClientHeight = 113
  ClientWidth = 319
  Caption = 'PLM Parameters'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 73
    Width = 319
    Height = 40
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 109
      Top = 1
      Width = 209
      Height = 38
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
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
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
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 319
    Height = 73
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object gbGeneral: TUniGroupBox
      Left = 1
      Top = 1
      Width = 317
      Height = 71
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object Panel2: TUniPanel
        Left = 2
        Top = 15
        Width = 313
        Height = 54
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 126
          Top = 1
          Width = 6
          Height = 52
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
          Width = 125
          Height = 52
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label2: TUniLabel
            Left = 8
            Top = 3
            Width = 76
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Reset Project #'
            TabOrder = 1
          end
        end
        object PnlClient01: TUniPanel
          Left = 132
          Top = 1
          Width = 180
          Height = 52
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
            180
            52)
          object DBEdit1: TUniDBEdit
            Left = 0
            Top = 0
            Width = 178
            Height = 21
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'PLM_PROJECTNO'
            DataSource = SrcParams
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
        end
      end
    end
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 183
    Top = 6
  end
  object TblParams: TFDTable
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 183
    Top = 24
  end
end
