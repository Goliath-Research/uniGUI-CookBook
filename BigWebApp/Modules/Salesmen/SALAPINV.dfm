object FrmAPComm: TFrmAPComm
  Left = 334
  Top = 180
  ClientHeight = 278
  ClientWidth = 479
  Caption = 'AP Commissions Invoices'
  OnShow = UniFormShow
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 180
    Width = 479
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
    Width = 479
    Height = 180
    Hint = ''
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Bevel3: TUniPanel
      Left = 1
      Top = 52
      Width = 477
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
      Width = 477
      Height = 124
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TitleFont.Height = -14
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Height = -14
      ParentFont = False
      TabOrder = 0
      Columns = <
        item
          FieldName = 'AMOUNT_DISTRIBUTED'
          Title.Caption = 'Amount Distributed'
          Width = 64
          Font.Height = -14
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INVOICE_NO'
          Title.Caption = 'Invoice #'
          Width = 491
          Font.Height = -14
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INVOICE_DATE'
          Title.Caption = 'Invoice Date'
          Width = 120
          Font.Height = -14
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DUE_DATE'
          Title.Caption = 'Due Date'
          Width = 120
          Font.Height = -14
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 477
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
        Width = 475
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
        Font.Height = -15
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label1: TUniLabel
          Left = 1
          Top = 1
          Width = 144
          Height = 18
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Preposted Invoices'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clDefault
          Font.Height = -15
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel15: TUniPanel
        Left = 1
        Top = 25
        Width = 475
        Height = 27
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Font.Height = -14
        TabOrder = 1
        Caption = ''
        object navPrepost: TUniDBNavigator
          Left = 375
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
    Top = 183
    Width = 479
    Height = 95
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object gridPost: TUniDBGrid
      Left = 1
      Top = 52
      Width = 477
      Height = 43
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TitleFont.Height = -14
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Height = -14
      ParentFont = False
      TabOrder = 0
      Columns = <
        item
          FieldName = 'AMOUNT_DISTRIBUTED'
          Title.Caption = 'Amount Distributed'
          Width = 64
          Font.Height = -14
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INVOICE_NO'
          Title.Caption = 'Invoice #'
          Width = 83
          Font.Height = -14
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INVOICE_DATE'
          Title.Caption = 'Invoice Date'
          Width = 120
          Font.Height = -14
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DUE_DATE'
          Title.Caption = 'Due Date'
          Width = 120
          Font.Height = -14
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 477
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
        Width = 475
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
        Font.Height = -15
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label2: TUniLabel
          Left = 1
          Top = 1
          Width = 119
          Height = 18
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Posted Invoices'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clDefault
          Font.Height = -15
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel8: TUniPanel
        Left = 1
        Top = 25
        Width = 475
        Height = 27
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Font.Height = -14
        TabOrder = 1
        Caption = ''
        object navPost: TUniDBNavigator
          Left = 375
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
end
