object FrmCommTimeCards: TFrmCommTimeCards
  Left = 319
  Top = 212
  ClientHeight = 371
  ClientWidth = 318
  Caption = 'Commissions Timecards'
  OnShow = UniFormShow
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 169
    Width = 318
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 318
    Height = 169
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = 'Panel1'
    object Bevel3: TUniPanel
      Left = 1
      Top = 52
      Width = 316
      Height = 4
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object gridPrePost: TUniDBGrid
      Left = 1
      Top = 56
      Width = 316
      Height = 113
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'TIMECARD_DATE'
          Title.Caption = 'Timecard Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AMOUNT'
          Title.Caption = 'Amount'
          Width = 79
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 316
      Height = 52
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Panel6: TUniPanel
        Left = 1
        Top = 1
        Width = 314
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
          Width = 120
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Preposted Timecards'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clDefault
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel15: TUniPanel
        Left = 1
        Top = 25
        Width = 314
        Height = 27
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object navPrepost: TUniDBNavigator
          Left = 214
          Top = 1
          Width = 100
          Height = 25
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ShowHint = True
          ParentShowHint = False
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 172
    Width = 318
    Height = 199
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'Panel2'
    object Bevel1: TUniPanel
      Left = 1
      Top = 52
      Width = 316
      Height = 4
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object gridPost: TUniDBGrid
      Left = 1
      Top = 56
      Width = 316
      Height = 143
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'TIMECARD_DATE'
          Title.Caption = 'Timecard Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AMOUNT'
          Title.Caption = 'Amount'
          Width = 78
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 316
      Height = 52
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Panel7: TUniPanel
        Left = 1
        Top = 1
        Width = 314
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label2: TUniLabel
          Left = 1
          Top = 1
          Width = 101
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Posted Timecards'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clDefault
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel8: TUniPanel
        Left = 1
        Top = 25
        Width = 314
        Height = 27
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object navPost: TUniDBNavigator
          Left = 191
          Top = 1
          Width = 123
          Height = 25
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ShowHint = True
          ParentShowHint = False
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
  end
end
