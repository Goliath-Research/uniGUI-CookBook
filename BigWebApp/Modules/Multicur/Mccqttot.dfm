inherited FrmMCCRMQuoteTotals: TFrmMCCRMQuoteTotals
  Left = 152
  Top = 182
  ClientHeight = 124
  ClientWidth = 273
  Caption = 'Sales Quotation Totals'
  ExplicitWidth = 279
  ExplicitHeight = 173
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 273
    ExplicitWidth = 273
    inherited cbCurrency: TUniDBLookupComboBox
      Left = 64
      Width = 204
      Anchors = [akLeft, akTop, akRight]
      ExplicitLeft = 64
      ExplicitWidth = 204
    end
  end
  object PnlClient01: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 27
    Width = 273
    Height = 97
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 81
      Top = 0
      Width = 6
      Height = 97
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 81
      Height = 95
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblTotalPrice: TUniLabel
        Left = 8
        Top = 12
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Total Price'
        TabOrder = 1
      end
      object lblTotalTax: TUniLabel
        Left = 8
        Top = 36
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Total Tax'
        TabOrder = 2
      end
      object lblGrandTotal: TUniLabel
        Left = 8
        Top = 60
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'Grand Total'
        TabOrder = 3
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 87
      Top = 1
      Width = 186
      Height = 95
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        186
        95)
      object edtTotalPrice: TUniEdit
        Left = 1
        Top = 8
        Width = 157
        Height = 19
        Hint = ''
        Text = 'edtTotalPrice'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object edtTotalTax: TUniEdit
        Left = 1
        Top = 32
        Width = 157
        Height = 19
        Hint = ''
        Text = 'edtTotalTax'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object edtGrandTotal: TUniEdit
        Left = 1
        Top = 56
        Width = 157
        Height = 19
        Hint = ''
        Text = 'eGrand'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 40
    Top = 104
  end
  inherited tblCurrency: TFDTable
    Left = 228
    Top = 82
  end
end
